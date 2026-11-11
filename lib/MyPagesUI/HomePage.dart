import 'package:azkar_muslim/MyPagesUI/EveningAthkar.dart';
import 'package:azkar_muslim/MyPagesUI/MainPageUI.dart';
import 'package:azkar_muslim/MyPagesUI/MorningAthkarUI.dart';
import 'package:azkar_muslim/MyPagesUI/MyButtons/My_btn1.dart';
import 'package:azkar_muslim/MyPagesUI/SleepingAthkar.dart';
import 'package:azkar_muslim/MyPagesUI/afterPrayAthkar.dart';
import 'package:azkar_muslim/MyPagesUI/masbha.dart';
import 'package:azkar_muslim/MyPagesUI/wakeup_athkar.dart';
import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';

class StartUI extends StatefulWidget {
  @override
  State<StartUI> createState() => _StartUIState();
}

class _StartUIState extends State<StartUI> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 1800),
          pageBuilder: (context, animation, secondaryAnimation) => mainPageUI(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Positioned.fill(
          child: Image.asset(
            "assets/Images/uns_background.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class HomeUI extends StatefulWidget {
  final VoidCallback? onSettingsTap;

  HomeUI({this.onSettingsTap});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  @override
  Widget build(BuildContext context) {
    HijriCalendar.setLocal('ar');
    var today = HijriCalendar.now();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 19, 51, 31),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 20, 78, 49),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: const Color.fromARGB(255, 13, 109, 61),
                            width: 1.5,
                          ),
                        ),
                        margin: const EdgeInsets.only(
                          top: 50,
                          left: 15,
                          right: 15,
                        ),
                        width: 380,
                        height: 140,
                        child: Center(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                      top: 10,
                                      left: 120,
                                    ),
                                    child: Text(
                                      '${today.dayWeName} ${today.hDay} ${today.longMonthName}',
                                      style: const TextStyle(
                                        fontSize: 17,
                                        color: Color.fromARGB(
                                          255,
                                          221,
                                          171,
                                          19,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              Container(
                                child: Text(
                                  "أذكار المسلم",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),

                              Container(
                                child: Text(
                                  "أَلَا بِذِكْرِ اللَّهِ تَطْمَئِنُّ الْقُلُوبُ |",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: const Color.fromARGB(
                                      255,
                                      144,
                                      186,
                                      207,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 100,
                      height: 45,
                      child: Container(
                        margin: EdgeInsets.only(left: 30, top: 20),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 20, 78, 49),
                          border: Border.all(
                            width: 1.5,
                            color: const Color.fromARGB(255, 13, 109, 61),
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),

                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            "أقسام 6",
                            style: TextStyle(
                              color: Color.fromARGB(255, 221, 171, 19),
                            ),
                          ),
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 110, top: 20),
                      child: Text(
                        "أقسام الأذكار اليومية",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, top: 15),
                      child: Icon(
                        Icons.auto_stories,
                        color: Color.fromARGB(255, 221, 171, 19),
                        size: 25,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    My_btn1(
                      icon: Icons.nightlight_round_outlined,
                      color: Colors.blue,
                      bgcolor: const Color.fromARGB(120, 11, 79, 121),
                      onClick: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => EveningAthkar(),
                          ),
                        );
                      },
                      txt: "أذكار المساء",
                      txt2: "اختم يومك بحفظ الله",
                      border_bgcolor: const Color.fromARGB(255, 27, 79, 121),
                    ),

                    My_btn1(
                      icon: Icons.sunny,
                      color: Colors.yellow,
                      bgcolor: const Color.fromARGB(120, 204, 190, 39),
                      border_bgcolor: const Color.fromARGB(255, 192, 175, 25),
                      onClick: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => MorningAthkarUI(),
                          ),
                        );
                      },
                      txt: "أذكار الصباح",
                      txt2: "ابدأ يومك بذكر الله",
                    ),
                  ],
                ),

                Row(
                  children: [
                    My_btn1(
                      color: Colors.yellow,
                      icon: Icons.access_time_filled,
                      bgcolor: const Color.fromARGB(120, 204, 190, 39),
                      border_bgcolor: const Color.fromARGB(255, 192, 175, 25),

                      onClick: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => WakeupAthkar(),
                          ),
                        );
                      },
                      txt: "الاستيقاظ",
                      txt2: "شكر الله على الحياة",
                    ),

                    My_btn1(
                      color: const Color.fromARGB(255, 129, 140, 248),
                      icon: Icons.bed,
                      bgcolor: const Color.fromARGB(255, 38, 48, 72),
                      border_bgcolor: const Color.fromARGB(255, 56, 68, 98),

                      onClick: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SleepingAthkar(),
                          ),
                        );
                      },
                      txt: "أذكار النوم",
                      txt2: "راحة وسكينة",
                    ),
                  ],
                ),
                Row(
                  children: [
                    My_btn1(
                      color: Colors.yellow,
                      icon: Icons.fingerprint,
                      bgcolor: const Color.fromARGB(120, 204, 190, 39),
                      border_bgcolor: const Color.fromARGB(255, 192, 175, 25),

                      onClick: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => MasbahaPage()),
                        );
                      },
                      txt: "المسبحة",
                      txt2: "عداد التسبيح الرقمي",
                    ),

                    My_btn1(
                      color: const Color.fromARGB(255, 45, 212, 170),
                      icon: Icons.mosque,
                      bgcolor: const Color.fromARGB(255, 24, 84, 72),
                      border_bgcolor: const Color.fromARGB(255, 36, 112, 94),

                      onClick: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AfterPrayAthkar(),
                          ),
                        );
                      },
                      txt: "بعد الصلاة",
                      txt2: "عقب كل صلاة مكتوبة",
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  width: 385,
                  height: 90,
                  margin: EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 20, 78, 49),
                    border: Border.all(
                      width: 1,
                      color: const Color.fromARGB(255, 13, 109, 61),
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),

                  child: Row(
                    children: [
                      Column(
                        children: [
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 110, top: 15),
                                child: Text(
                                  "فضل الاستغفار اليومي",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 221, 171, 19),
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),

                              Container(
                                margin: EdgeInsets.only(left: 12, top: 5),
                                child: Text(
                                  "\"قال ﷺ: \"طوبى لمن وجد في صحيفته استغفارًا كثيرا",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(120, 204, 190, 39),
                          border: Border.all(
                            width: 1.5,
                            color: const Color.fromARGB(255, 192, 175, 25),
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        margin: EdgeInsets.only(left: 15),
                        child: Icon(
                          Icons.volunteer_activism,
                          size: 30,
                          color: Colors.yellow,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
