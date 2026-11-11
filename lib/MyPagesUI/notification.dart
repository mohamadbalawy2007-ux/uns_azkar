
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_timezone/flutter_timezone.dart';

import 'package:azkar_muslim/MyPagesUI/MorningAthkarUI.dart';
import 'package:azkar_muslim/MyPagesUI/EveningAthkar.dart';
import 'package:azkar_muslim/MyPagesUI/wakeup_athkar.dart';
import 'package:azkar_muslim/MyPagesUI/SleepingAthkar.dart';


final GlobalKey<NavigatorState> notificationNavigatorKey =
    GlobalKey<NavigatorState>();


final FlutterLocalNotificationsPlugin notificationsPlugin =
    FlutterLocalNotificationsPlugin();

String? pendingNotificationPayload;


const int morningHour = 6;
const int morningMinute = 0;

const int eveningHour = 17;
const int eveningMinute = 0;

const int wakeupHour = 7;
const int wakeupMinute = 0;

const int sleepingHour = 22;
const int sleepingMinute = 0;


void openAthkarPage(String? payload) {
  if (payload == null) return;

  Widget? page;

  switch (payload) {
    case 'morning':
      page = MorningAthkarUI();
      break;

    case 'evening':
      page = EveningAthkar();
      break;

    case 'wakeup':
      page = WakeupAthkar();
      break;

    case 'sleeping':
      page = SleepingAthkar();
      break;
  }

  if (page == null) return;

  notificationNavigatorKey.currentState?.push(
    MaterialPageRoute(
      builder: (context) => page!,
    ),
  );
}


void notificationTap(NotificationResponse response) {
  openAthkarPage(response.payload);
}


void openPendingNotificationPage() {
  if (pendingNotificationPayload == null) return;

  final payload = pendingNotificationPayload;
  pendingNotificationPayload = null;

  openAthkarPage(payload);
}


Future<void> initializeAthkarNotifications() async {


  tz.initializeTimeZones();

  final timezoneInfo =
      await FlutterTimezone.getLocalTimezone();

  tz.setLocalLocation(
    tz.getLocation(timezoneInfo.identifier),
  );


  const AndroidInitializationSettings androidSettings =
      AndroidInitializationSettings('@mipmap/ic_launcher');


  const DarwinInitializationSettings iosSettings =
      DarwinInitializationSettings();

  const InitializationSettings initializationSettings =
      InitializationSettings(
    android: androidSettings,
    iOS: iosSettings,
  );


  await notificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: notificationTap,
  );


  await notificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.requestNotificationsPermission();


  await notificationsPlugin
      .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin>()
      ?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );


  final launchDetails =
      await notificationsPlugin.getNotificationAppLaunchDetails();

  if (launchDetails?.didNotificationLaunchApp ?? false) {
    pendingNotificationPayload =
        launchDetails?.notificationResponse?.payload;
  }


  await scheduleAllAthkarNotifications();
}


Future<void> scheduleDailyNotification({
  required int id,
  required String title,
  required String body,
  required int hour,
  required int minute,
  required String payload,
}) async {

  final now = tz.TZDateTime.now(tz.local);

  var scheduledDate = tz.TZDateTime(
    tz.local,
    now.year,
    now.month,
    now.day,
    hour,
    minute,
  );


  if (scheduledDate.isBefore(now) ||
      scheduledDate.isAtSameMomentAs(now)) {
    scheduledDate = scheduledDate.add(
      const Duration(days: 1),
    );
  }

  const NotificationDetails notificationDetails =
      NotificationDetails(
    android: AndroidNotificationDetails(
      'athkar_channel',
      'تذكيرات الأذكار',
      channelDescription: 'تذكيرات يومية بأوقات الأذكار',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
    ),
    iOS: DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    ),
  );


  await notificationsPlugin.cancel(id);

  await notificationsPlugin.zonedSchedule(
    id,
    title,
    body,
    scheduledDate,
    notificationDetails,
    androidScheduleMode:
        AndroidScheduleMode.inexactAllowWhileIdle,
    payload: payload,
    matchDateTimeComponents: DateTimeComponents.time,
  );
}


Future<void> scheduleAllAthkarNotifications() async {


  await scheduleDailyNotification(
    id: 1001,
    title: 'أذكار الصباح 🌅',
    body: 'ابدأ يومك بذكر الله، لا تنسَ أذكار الصباح.',
    hour: morningHour,
    minute: morningMinute,
    payload: 'morning',
  );


  await scheduleDailyNotification(
    id: 1002,
    title: 'أذكار المساء 🌙',
    body: 'اختم يومك بذكر الله، حان وقت أذكار المساء.',
    hour: eveningHour,
    minute: eveningMinute,
    payload: 'evening',
  );


  await scheduleDailyNotification(
    id: 1003,
    title: 'أذكار الاستيقاظ ☀️',
    body: 'الحمد لله الذي أحيانا بعدما أماتنا وإليه النشور.',
    hour: wakeupHour,
    minute: wakeupMinute,
    payload: 'wakeup',
  );


  await scheduleDailyNotification(
    id: 1004,
    title: 'أذكار النوم 🌙',
    body: 'قبل أن تنام، لا تنسَ أذكار النوم.',
    hour: sleepingHour,
    minute: sleepingMinute,
    payload: 'sleeping',
  );
}


Future<void> cancelAllAthkarNotifications() async {
  await notificationsPlugin.cancelAll();
}
