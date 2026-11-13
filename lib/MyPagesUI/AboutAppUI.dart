import 'package:flutter/material.dart';

class AboutAppUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "عن التطبيق",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 20, 78, 49),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/Images/aboutPageImg.jpg",
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      margin: EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                          image: AssetImage("assets/Images/icon app.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),

                    Text(
                      "أُنس",
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),

                    Text(
                      "رفيقك في الذكر والطمأنينة",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 20),

                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(120, 14, 114, 61),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "تطبيق يساعدك على الوصول الى",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  "أذكار الصباح والمساء والنوم والاستيقاظ",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  "وأذكار الصلاة والمسبحة الالكترونية",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.menu_book_sharp,
                            size: 55,
                            color: Colors.greenAccent,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),

                    Text(
                      "مميزات التطبيق",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 10),

                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(120, 14, 114, 61),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "أذكار متنوعة",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(width: 12),
                          Icon(
                            Icons.notifications,
                            color: Colors.greenAccent,
                            size: 32,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(120, 14, 114, 61),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "واجهة بسيطة وسهلة الاستخدام",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(width: 12),
                          Icon(
                            Icons.touch_app,
                            color: Colors.greenAccent,
                            size: 32,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),

                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(120, 14, 114, 61),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "امكانية اضافة الاذكار الى المفضلة",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(width: 12),
                          Icon(
                            Icons.favorite,
                            color: Colors.greenAccent,
                            size: 32,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(120, 14, 114, 61),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "مناسبة لجميع المسلمين",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(width: 12),
                          Icon(
                            Icons.groups,
                            color: Colors.greenAccent,
                            size: 32,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 25),

                    Container(
                      width: 240,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(120, 14, 114, 61),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.favorite,
                            size: 35,
                            color: Colors.greenAccent,
                          ),
                          Text(
                            "جزاك الله خيرا",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.greenAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.symmetric(vertical: 6),
                            color: Colors.greenAccent,
                            width: 150,
                            height: 0.5,
                          ),

                          Text(
                            "ألاصدار 1.0.0",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.greenAccent,
                            ),
                          ),
                          Text(
                            "تصميم وتطوير",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.greenAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "محمد علي بلعاوي",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}