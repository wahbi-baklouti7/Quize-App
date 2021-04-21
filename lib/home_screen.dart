import 'package:flutter/material.dart';
import 'package:quize_app/app_functionality.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int totalCorrectAnswers = 0;
  AppFunctionality appFunctionality = AppFunctionality();
  List<Widget> mark = [];

  void checkQuestion(bool choice) {
    bool correct_choice = appFunctionality.getQuestionResult();
    setState(() {
      if (choice == correct_choice) {
        mark.add(Icon(
          Icons.thumb_up,
          color: Colors.green,
          size: 28,
        ));
        totalCorrectAnswers++; //increment to total of correct answers
      } else {
        mark.add(Icon(
          Icons.thumb_down,
          color: Colors.red,
          size: 28,
        ));
      }

      if (appFunctionality.isFinished() == true) {
        Alert(
          context: context,
          type: AlertType.info,
          title: "إنتهت الأسئلة",
          desc:
              "لقد أجبت على$totalCorrectAnswers من ${appFunctionality.getQuestionsNumber()}",
          buttons: [
            DialogButton(
                child: Text(
                  "إعادة اللعب",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () {
                  setState(() {
                    appFunctionality.resetGame();
                    totalCorrectAnswers = 0;
                    mark = [];
                  });
                })
          ],
        ).show();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 135, 95, 192),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
          alignment: Alignment.center,
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${appFunctionality.getQuestionsNumber()} :عدد الأسئلة",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "${appFunctionality.currentQuestionNum()} :الأسئلة المتبقية",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(
                height: 48,
              ),
              Row(children: mark),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  appFunctionality.getQuestionImage(),
                ),
              ),
              SizedBox(
                height: 48,
              ),
              Text(
                appFunctionality.getQuestionText(),
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.center,
              ),
              ButtonTheme(
                height: 80,
                minWidth: 120,
                splashColor: Colors.amber,
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
                          onPressed: () {
                            checkQuestion(true);
                            setState(() {
                              appFunctionality.change_Question();
                            });
                          }),
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
                          onPressed: () {
                            checkQuestion(false);
                            setState(() {
                              appFunctionality.change_Question();
                            });
                          })
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
