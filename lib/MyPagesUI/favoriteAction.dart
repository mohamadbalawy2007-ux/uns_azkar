import 'package:flutter/material.dart';

class favoriteAction extends StatefulWidget {
  const new({super.key});

  @override
  State<favoriteAction> createState() => _favoriteActionState();
}

class _favoriteActionState extends State<favoriteAction> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Center(
        child: Column(
          children: [
            Icon(Icons.star_border_outlined, color: Colors.blueGrey, size: 60),
            Text(
              "لا توجد أذكار مضافة للمفضلة حالياً ",
              style: TextStyle(color: Colors.blueGrey, fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
