import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 135, 95, 192),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(8, 48, 8, 0),
          alignment: Alignment.center,
          margin: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  "assets/images/image-1.jpg",
                ),
              ),
              SizedBox(
                height: 48,
              ),
              Text(
                " الأرض تدور حول الشمس؟",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.1),
              ),
              ButtonTheme(
                height: 80,
                minWidth: 120,
                child: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RaisedButton(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "صحيح",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                                fontWeight: FontWeight.bold),
                          ),
                          color: Color.fromARGB(255, 76, 176, 81),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          onPressed: () {}),
                      RaisedButton(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "خطأ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                                fontWeight: FontWeight.bold),
                          ),
                          color: Color.fromARGB(255, 244, 66, 53),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          onPressed: () {})
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
