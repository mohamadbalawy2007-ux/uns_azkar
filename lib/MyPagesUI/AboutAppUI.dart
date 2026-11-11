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
                      width: 385,
                      height: 120,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(120, 14, 114, 61),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 15),
                                  child: Text(
                                    "تطبيق يساعدك على الوصول الى",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 1),
                                  child: Text(
                                    "أذكار الصباح والمساء والنوم والاستيقاظ",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 1),
                                  child: Text(
                                    "وأذكار الصلاة والمسبحة الالكترونية",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 30, bottom: 10),
                            child: Icon(
                              Icons.menu_book_sharp,
                              size: 60,
                              color: Colors.greenAccent,
                            ),
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
                      width: 385,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(120, 14, 114, 61),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 15),
                            child: Text(
                              "أذكار متنوعة",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 15),
                            child: Icon(
                              Icons.notifications,
                              color: Colors.greenAccent,
                              size: 35,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      width: 385,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(120, 14, 114, 61),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 15),
                            child: Text(
                              "واجهة بسيطة وسهلة الاستخدام",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 15),
                            child: Icon(
                              Icons.touch_app,
                              color: Colors.greenAccent,
                              size: 35,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),

                    Container(
                      width: 385,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(120, 14, 114, 61),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 15),
                            child: Text(
                              "امكانية اضافة الاذكار الى المفضلة ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 15),
                            child: Icon(
                              Icons.favorite,
                              color: Colors.greenAccent,
                              size: 35,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      width: 385,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(120, 14, 114, 61),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 15),
                            child: Text(
                              "مناسبة لجميع المسلمين",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 15),
                            child: Icon(
                              Icons.groups,
                              color: Colors.greenAccent,
                              size: 35,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 25),

                    Container(
                      width: 240,
                      height: 160,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(120, 14, 114, 61),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
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
