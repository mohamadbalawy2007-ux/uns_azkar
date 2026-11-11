// ignore_for_file: file_names, prefer_final_fields, unused_field

import 'package:azkar_muslim/My_Data/FavoritesData.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MorningAthkarUI extends StatefulWidget {
  const MorningAthkarUI({super.key});

  @override
  State<MorningAthkarUI> createState() => _MorningAthkarUIState();
}

class _MorningAthkarUIState extends State<MorningAthkarUI> {
  int i = 0;

  static const Color _bg = Color.fromARGB(255, 19, 51, 31);
  static const Color _green = Color.fromARGB(255, 13, 109, 61);
  static const Color _gold = Color.fromARGB(255, 221, 171, 19);

  List<int> _counts = [
    1, 3, 3, 3, 1, 1, 1, 4, 1, 3, 7, 1,
    1, 3, 3, 1, 1, 1, 100, 10, 3, 1, 100, 10,
  ];

  late final List<int> _totals = List.of(_counts);

  List<String> _athkar = [
    "assets/Images/athkar_alsabah/ayat_al_kursi_box.png",
    "assets/Images/athkar_alsabah/surat_al_ikhlas.png",
    "assets/Images/athkar_alsabah/surat_al_falaq.png",
    "assets/Images/athkar_alsabah/surat_an_nas.png",
    "assets/Images/athkar_alsabah/athkar_1.png",
    "assets/Images/athkar_alsabah/dua_bika_asbahna.png",
    "assets/Images/athkar_alsabah/dua_sayyid_istighfar.png",
    "assets/Images/athkar_alsabah/dua_ashhaduka.png",
    "assets/Images/athkar_alsabah/dua_ma_asbaha_bi.png",
    "assets/Images/athkar_alsabah/dua_afini_fi_badani.png",
    "assets/Images/athkar_alsabah/dua_hasbiya_allah.png",
    "assets/Images/athkar_alsabah/dua_afw_wal_afiya.png",
    "assets/Images/athkar_alsabah/dua_alim_alghayb.png",
    "assets/Images/athkar_alsabah/dua_bismillah_ladhi_la_yadurr.png",
    "assets/Images/athkar_alsabah/dua_radytu_billah.png",
    "assets/Images/athkar_alsabah/dua_ya_hayyu_ya_qayyum.png",
    "assets/Images/athkar_alsabah/dua_khayr_hadha_alyawm.png",
    "assets/Images/athkar_alsabah/dua_fitrat_alislam.png",
    "assets/Images/athkar_alsabah/dua_subhanallah_wa_bihamdih.png",
    "assets/Images/athkar_alsabah/dua_la_ilaha_illallah_wahdahu.png",
    "assets/Images/athkar_alsabah/dua_subhanallah_adada_khalqih.png",
    "assets/Images/athkar_alsabah/dua_ilman_nafia.png",
    "assets/Images/athkar_alsabah/dua_astaghfirullah.png",
    "assets/Images/athkar_alsabah/dua_salawat.png",
  ];

  List<String> _names = [
    "آية الكرسي",
    "سورة الإخلاص",
    "سورة الفلق",
    "سورة الناس",
    "أصبحنا وأصبح الملك لله",
    "اللهم بك أصبحنا",
    "سيد الاستغفار",
    "اللهم إني أصبحت أشهدك",
    "اللهم ما أصبح بي من نعمة",
    "اللهم عافني في بدني",
    "حسبي الله لا إله إلا هو",
    "اللهم إني أسألك العفو والعافية",
    "اللهم عالم الغيب والشهادة",
    "بسم الله الذي لا يضر مع اسمه شيء",
    "رضيت بالله ربًا",
    "يا حي يا قيوم",
    "اللهم إني أسألك خير هذا اليوم",
    "أصبحنا على فطرة الإسلام",
    "سبحان الله وبحمده (100)",
    "لا إله إلا الله وحده لا شريك له",
    "سبحان الله وبحمده عدد خلقه",
    "اللهم إني أسألك علمًا نافعًا",
    "أستغفر الله وأتوب إليه",
    "الصلاة على النبي ﷺ",
  ];

  void _toggleFav() {
    FavoritesData.Toggle(_athkar[i], _names[i]);
    setState(() {});
    if (FavoritesData.IsFavorite(_athkar[i])) {
      debugPrint("⭐ Favorite: ${_names[i]}");
    } else {
      debugPrint("☆ Removed from favorite: ${_names[i]}");
    }
    HapticFeedback.lightImpact();
  }

  void _count() {
    setState(() {
      if (_counts[i] > 0) {
        _counts[i] -= 1;
        if (_counts[i] == 0 && i < _athkar.length - 1) {
          i++;
        }
      }
    });
    HapticFeedback.selectionClick();
  }

  Widget _navButton({required IconData icon, required VoidCallback onTap}) {
    return Material(
      color: _green,
      shape: const CircleBorder(),
      elevation: 4,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          width: 60,
          height: 60,
          child: Icon(icon, color: Colors.white, size: 28),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool finished = _counts.every((c) => c == 0);
    bool isFav = FavoritesData.IsFavorite(_athkar[i]);
    double itemProgress = _totals[i] == 0
        ? 1
        : (_totals[i] - _counts[i]) / _totals[i];

    final mq = MediaQuery.of(context);
    final safeScaler = mq.textScaler.clamp(
      minScaleFactor: 1.0,
      maxScaleFactor: 1.3,
    );

    return MediaQuery(
      data: mq.copyWith(textScaler: safeScaler),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "أذكار الصباح",
            style: TextStyle(
              fontSize: 27,
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 20, 78, 49),
          iconTheme: const IconThemeData(color: Colors.white, size: 30),
        ),
        backgroundColor: _bg,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "${i + 1} / ${_athkar.length}",
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: TweenAnimationBuilder<double>(
                          tween: Tween(end: (i + 1) / _athkar.length),
                          duration: const Duration(milliseconds: 300),
                          builder: (context, v, _) => LinearProgressIndicator(
                            value: v,
                            minHeight: 8,
                            backgroundColor: Colors.white12,
                            valueColor: const AlwaysStoppedAnimation(_gold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: _bg,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: const Color.fromARGB(255, 46, 107, 71),
                        width: 1.5,
                      ),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 250),
                            child: LayoutBuilder(
                              key: ValueKey(i),
                              builder: (context, constraints) {
                                return SingleChildScrollView(
                                  primary: false,
                                  physics: const BouncingScrollPhysics(),
                                  padding: const EdgeInsets.all(8),
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                      minHeight: constraints.maxHeight - 16,
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                        _athkar[i],
                                        width: double.infinity,
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: Material(
                            color: Colors.black26,
                            shape: const CircleBorder(),
                            child: InkWell(
                              customBorder: const CircleBorder(),
                              onTap: _toggleFav,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 200),
                                  transitionBuilder: (child, anim) =>
                                      ScaleTransition(scale: anim, child: child),
                                  child: Icon(
                                    isFav
                                        ? Icons.star_rounded
                                        : Icons.star_border_rounded,
                                    key: ValueKey(isFav),
                                    color: _gold,
                                    size: 34,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 150,
                  child: finished
                      ? Center(
                          child: SizedBox(
                            width: 340,
                            height: 70,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                backgroundColor: _green,
                              ),
                              onPressed: () => Navigator.pop(context),
                              child: const FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.check_circle,
                                      color: Colors.white,
                                      size: 26,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      "تمت القراءة، تقبّل الله منك",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Visibility(
                              visible: i > 0,
                              maintainSize: true,
                              maintainAnimation: true,
                              maintainState: true,
                              child: _navButton(
                                icon: Icons.arrow_back_ios_new_rounded,
                                onTap: () => setState(() {
                                  if (i > 0) i--;
                                }),
                              ),
                            ),
                            SizedBox(
                              width: 140,
                              height: 140,
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: TweenAnimationBuilder<double>(
                                      tween: Tween(end: itemProgress),
                                      duration:
                                          const Duration(milliseconds: 200),
                                      builder: (context, v, _) =>
                                          CircularProgressIndicator(
                                        value: v,
                                        strokeWidth: 6,
                                        backgroundColor: Colors.white12,
                                        valueColor:
                                            const AlwaysStoppedAnimation(_gold),
                                      ),
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: const CircleBorder(),
                                          padding: EdgeInsets.zero,
                                          minimumSize: Size.zero,
                                          backgroundColor: _gold,
                                          elevation: 6,
                                        ),
                                        onPressed: _count,
                                        child: Padding(
                                          padding: const EdgeInsets.all(14),
                                          child: FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  _counts[i].toString(),
                                                  textScaler:
                                                      TextScaler.noScaling,
                                                  style: const TextStyle(
                                                    fontSize: 36,
                                                    height: 1.1,
                                                    fontWeight: FontWeight.bold,
                                                    color: _bg,
                                                  ),
                                                ),
                                                const Text(
                                                  "انقر للعد",
                                                  textScaler:
                                                      TextScaler.noScaling,
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    height: 1.1,
                                                    color: Colors.black87,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Visibility(
                              visible: i < _athkar.length - 1,
                              maintainSize: true,
                              maintainAnimation: true,
                              maintainState: true,
                              child: _navButton(
                                icon: Icons.arrow_forward_ios_rounded,
                                onTap: () => setState(() {
                                  if (i < _athkar.length - 1) i++;
                                }),
                              ),
                            ),
                          ],
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}