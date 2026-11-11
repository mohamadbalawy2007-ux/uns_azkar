import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

const int kLimit = 33;
const List<String> kDefaults = [
  'سبحان الله',
  'الحمد لله',
  'الله أكبر',
  'لا إله إلا الله',
  'أستغفر الله',
  'لا حول ولا قوة إلا بالله',
  'اللهم صل على محمد',
];

const Color kBg = Color(0xFF12261F);
const Color kPanel = Color(0xFF1B3A2F);
const Color kRingBg = Color(0xFF2A4A3E);
const Color kGold = Color(0xFFE0A915);
const Color kText = Color(0xFFF6EFD9);
const Color kMuted = Color(0xFFA9BFB3);
const Color _bg = Color.fromARGB(255, 19, 51, 31);




class MasbahaPage extends StatefulWidget {
  const MasbahaPage({super.key});

  @override
  State<MasbahaPage> createState() => _MasbahaPageState();
}

class _MasbahaPageState extends State<MasbahaPage> {
  List<String> custom = [];
  String active = kDefaults[0];
  int cycle = 0;
  Map<String, int> data = {};
  int total = 0;

  final TextEditingController _input = TextEditingController();

  List<String> get allDhikrs => [...kDefaults, ...custom];

  int get count => data[active] ?? 0;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _input.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString('masbaha');
      if (raw == null) return;
      final s = jsonDecode(raw) as Map<String, dynamic>;
      setState(() {
        custom = List<String>.from(s['custom'] ?? []);
        active = s['active'] ?? kDefaults[0];
        total = s['total'] ?? 0;
        cycle = s['cycle'] ?? 0;
        data = (s['data'] as Map<String, dynamic>? ?? {})
            .map((k, v) => MapEntry(k, (v as num).toInt()));
        if (!allDhikrs.contains(active)) active = kDefaults[0];
      });
    } catch (_) {}
  }

  Future<void> _save() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(
        'masbaha',
        jsonEncode({
          'custom': custom,
          'active': active,
          'data': data,
          'cycle': cycle,
          'total': total,
        }),
      );
    } catch (_) {}
  }

  void _tap() {
    setState(() {
      data[active] = count + 1; // عدد مرات هذا الذكر
      cycle++; // الدائرة
      total++;
      if (cycle >= kLimit) cycle = 0; // يصفّر الدائرة بس
    });
    HapticFeedback.lightImpact();
    _save();
  }

  void _select(String t) {
    setState(() => active = t);
    _save();
  }

  void _addCustom() {
    final t = _input.text.trim();
    if (t.isEmpty) return;
    setState(() {
      if (!allDhikrs.contains(t)) custom.add(t);
      active = t;
      _input.clear();
    });
    FocusScope.of(context).unfocus();
    _save();
  }

  void _removeCustom(String t) {
    setState(() {
      custom.remove(t);
      data.remove(t);
      if (active == t) active = kDefaults[0];
    });
    _save();
  }

  Future<void> _resetAll() async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: kPanel,
        content: const Text('تصفير كل العدادات؟',
            style: TextStyle(color: kText, fontSize: 18)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('إلغاء', style: TextStyle(color: kMuted)),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('تصفير', style: TextStyle(color: kGold)),
          ),
        ],
      ),
    );
    if (ok == true) {
      setState(() {
        data = {};
        cycle = 0;
        total = 0;
      });
      _save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "المسبحة الالكترونية",
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
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                children: [
                  _chips(),
                  const SizedBox(height: 10),
                  _addRow(),
                  const SizedBox(height: 22),
                  Text(
                    active,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        color: kText),
                  ),
                  const SizedBox(height: 14),
                  _ring(cycle),
                  const SizedBox(height: 22),
                  Row(
                    children: [
                      Expanded(child: _stat('$count', 'عدد مرات هذا الذكر')),
                      const SizedBox(width: 10),
                      Expanded(child: _stat('$total', 'المجموع الكلي')),
                    ],
                  ),
                  const SizedBox(height: 18),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: _resetAll,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: kText,
                        side: const BorderSide(color: kMuted),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text('تصفير الكل',
                          style: TextStyle(fontSize: 16)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _chips() {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 8,
      runSpacing: 8,
      children: allDhikrs.map((t) {
        final isActive = t == active;
        final isCustom = custom.contains(t);
        return InkWell(
          borderRadius: BorderRadius.circular(999),
          onTap: () => _select(t),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: kPanel,
              borderRadius: BorderRadius.circular(999),
              border: Border.all(
                  color: isActive ? kGold : Colors.transparent, width: 1),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  t,
                  style: TextStyle(
                    fontSize: 15,
                    color: isActive ? kGold : kText,
                    fontWeight: isActive ? FontWeight.w700 : FontWeight.w400,
                  ),
                ),
                if (isCustom) ...[
                  const SizedBox(width: 6),
                  GestureDetector(
                    onTap: () => _removeCustom(t),
                    child: const Icon(Icons.close, size: 16, color: kMuted),
                  ),
                ],
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _addRow() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _input,
            maxLength: 60,
            onSubmitted: (_) => _addCustom(),
            style: const TextStyle(color: kText, fontSize: 15),
            decoration: InputDecoration(
              counterText: '',
              hintText: 'اكتب ذكرك الخاص…',
              hintStyle: const TextStyle(color: kMuted),
              filled: true,
              fillColor: kPanel,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: kRingBg),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: kGold),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        ElevatedButton(
          onPressed: _addCustom,
          style: ElevatedButton.styleFrom(
            backgroundColor: kGold,
            foregroundColor: const Color(0xFF2B2100),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
          ),
          child: const Text('إضافة',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
        ),
      ],
    );
  }

  Widget _ring(int cycle) {
    return GestureDetector(
      onTap: _tap,
      child: SizedBox(
        width: 250,
        height: 250,
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(end: cycle / kLimit),
          duration: const Duration(milliseconds: 180),
          builder: (context, value, _) {
            return CustomPaint(
              painter: _RingPainter(value),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '$cycle',
                      style: const TextStyle(
                          fontSize: 76,
                          fontWeight: FontWeight.w700,
                          height: 1,
                          color: kText),
                    ),
                    const SizedBox(height: 6),
                    const Text('من 33',
                        style: TextStyle(fontSize: 16, color: kMuted)),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _stat(String value, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
      decoration: BoxDecoration(
        color: kPanel,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Text(value,
              style: const TextStyle(
                  fontSize: 34, fontWeight: FontWeight.w700, color: kGold)),
          const SizedBox(height: 2),
          Text(label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, color: kMuted)),
        ],
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  final double progress;
  _RingPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    const radius = 110.0;

    final track = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14
      ..color = kRingBg;
    canvas.drawCircle(center, radius, track);

    final bar = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14
      ..strokeCap = StrokeCap.round
      ..color = kGold;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      2 * math.pi * progress,
      false,
      bar,
    );
  }

  @override
  bool shouldRepaint(_RingPainter old) => old.progress != progress;
}