import 'package:flutter/material.dart';
import 'questions.dart';


class AppFunctionality {
  int _questionNumber = 0;
  List<Widget> mark = [];

  List<Questions> _questionsList = [
    Questions(
        questionText: " الأرض تدور حول الشمس",
        questionImage: "assets/images/image-1.jpg",
        result: true),
    Questions(
        questionText: "أكثر منطقة منخفضة في العالم هو البحر الميت",
        questionImage: "assets/images/image-2.jpg",
        result: true),
    Questions(
        questionText: "زوجة فرعون هي السيدة آسيا",
        questionImage: "assets/images/image-3.jpg",
        result: true),
    Questions(
        questionText: "درجة غليان الماء هي 80 درجة",
        questionImage: "assets/images/image-4.jpg",
        result: false),
    Questions(
        questionText: " إسم أنثى الحمار أتان",
        questionImage: "assets/images/image-5.jpg",
        result: true),
    Questions(
        questionText: " الدجاجة تطير",
        questionImage: "assets/images/image-6.jpg",
        result: false),
    Questions(
        questionText: "تقع كوريا الجنوبية في قارة أمريكا الجنوبية",
        questionImage: "assets/images/image-7.jpg",
        result: false),
    Questions(
        questionText: "أطول سورة في القرآن هي سورة النساء",
        questionImage: "assets/images/image-8.jpg",
        result: false),
    Questions(
        questionText: "ثاني خليفة في الاسلام هو سيدنا عثمان",
        questionImage: "assets/images/image-9.jpg",
        result: false),
    Questions(
        questionText: "آخر دولة خلافة إسلامية هي الدولة العثمانية",
        questionImage: "assets/images/image-10.jpg",
        result: true)
  ];

  

  String getQuestionText() {
    return _questionsList[_questionNumber].questionText;
  }

  String getQuestionImage() {
    return _questionsList[_questionNumber].questionImage;
  }

  bool getQuestionResult() {
    return _questionsList[_questionNumber].result;
  }

  void change_Question() {
    if (_questionNumber < _questionsList.length - 1) {
      _questionNumber++;
    }
  }

  int getQuestionsNumber() {
    return _questionsList.length;
  }

  int currentQuestionNum() {
    return (_questionsList.length - 1 - _questionNumber);
  }

  bool isFinished() {
    if (currentQuestionNum() <= 0) {
      return true;
    } else {
      return false;
    }
  }

  void resetGame() {
    _questionNumber = 0;
  }

}
