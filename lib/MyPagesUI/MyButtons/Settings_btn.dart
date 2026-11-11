import 'package:flutter/material.dart';

class Settings_btn extends StatefulWidget {
  final IconData icon;
  final VoidCallback onClick;
  const Settings_btn({Key? key, required this.icon, required this.onClick})
    : super(key: key);

  @override
  State<Settings_btn> createState() => _Settings_btnState();
}

class _Settings_btnState extends State<Settings_btn> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onClick,
      onTapDown: (_) => setState(() => pressed = true),
      onTapUp: (_) => setState(() => pressed = false),
      onTapCancel: () => setState(() => pressed = false),
      child: SizedBox(
        width: 30,
        height: 30,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Positioned(
              left: -7,
              top: -7,
              width: 44,
              height: 44,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 150),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: pressed
                      ? Color.fromARGB(70, 221, 171, 19)
                      : Colors.transparent,
                ),
              ),
            ),
            Icon(
              widget.icon,
              size: 30,
              color: Color.fromARGB(255, 221, 171, 19),
            ),
          ],
        ),
      ),
    );
  }
}