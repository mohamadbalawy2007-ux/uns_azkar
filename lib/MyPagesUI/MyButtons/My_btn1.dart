import 'package:flutter/material.dart';

class My_btn1 extends StatelessWidget {
  final IconData icon;
  final String txt;
  final String txt2;
  final VoidCallback onClick;
  final Color color;
  final Color bgcolor;
  final Color border_bgcolor;
  const My_btn1({
    Key? key,
    required this.icon,
    required this.onClick,
    required this.txt,
    required this.color,
    required this.bgcolor,
    required this.border_bgcolor,
    required this.txt2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20, left: 15),
          width: 185,
          height: 175,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              width: 1.5,
              color: const Color.fromARGB(255, 13, 109, 61),
            ),
          ),
          child: Material(
            color: const Color.fromARGB(255, 20, 78, 49),
            borderRadius: BorderRadius.circular(16),
            child: InkWell(
              onTap: onClick,
              borderRadius: BorderRadius.circular(16),
              splashColor: Colors.white24,
              highlightColor: Colors.white10,
              child: Column(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: bgcolor,
                      border: Border.all(
                        width: 1.5,
                        color: border_bgcolor,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    margin: EdgeInsets.only(right: 100, top: 15),
                    child: Icon(icon, size: 30, color: color),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 35, top: 2),
                    child: Text(
                      txt,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 40, top: 10),
                    child: Text(
                      txt2,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}