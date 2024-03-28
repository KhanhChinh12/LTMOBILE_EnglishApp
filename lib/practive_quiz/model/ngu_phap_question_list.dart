import 'package:flutter/material.dart';
import 'package:learning_english/practive_quiz/model/question_model.dart';

List<QuestionModel> NPquestions = [
  QuestionModel("Câu dưới đây là thì nào:\n"
      "I meet Arthur three weeks ago.",
    {
      "Thì hiện tại tiếp diễn": false,
      "Thì hiện tại đơn": false,
      "Thì quá khứ đơn": true,
      "Thì tương lai đơn": false,
    },
  ),
  QuestionModel("Hãy điền từ vào trỗ trống:\n"
      "My friend _____ me for what I had done for him.", {
    "has thanked": false,
    "is thanking": false,
    "thanks": false,
    "thanked": true,
  }),
  QuestionModel("Hãy điền từ vào trỗ trống:\n"
      "People ____ English in most ò Canada.", {
    "spoke": false,
    "speak": true,
    "have spoken": false,
    "have been speking": false,
  }),
  QuestionModel("Hãy điền từ vào trỗ trống:\n"
      "She ____(play) the piano when our guests ____(arrive) last night.", {
    "had played/ arrived": false,
    "was playing/ were arriving": false,
    "was playing/ arrived": true,
    "played/ arrived": false,
  }),
  QuestionModel("Hãy điền từ vào trỗ trống:\n"
      "(you/ see) ____ Nam recently? - No, I (see) ____ him a year ago.", {
    "Have you seen/ saw": true,
    "Have you seen/ have seen": false,
    "Did you see/ saw": false,
    "Do you see/ saw": false,
  }),
  QuestionModel("Hãy điền từ vào trỗ trống:\n"
      "My father ____ for 5 years.", {
    "doesn't smoke": false,
    "smoked": false,
    "hasn't smoked": true,
    "didn't smoke": false,
  }),
  QuestionModel("Hãy điền từ vào trỗ trống:\n"
      "By next month, I ____ my first novel.", {
    "will be finishing": false,
    "will finish": false,
    "is going to finish": false,
    "will have finished": true,
  }),
  QuestionModel("Hãy điền từ vào trỗ trống:\n"
      "Be quiet! The teacher ____(be) angry.", {
    "has been ": false,
    "is being": false,
    "is": true,
    "was": false,
  }),
  QuestionModel("Hãy điền từ vào trỗ trống:\n"
      "Up to now, the teacher ____ our class five test.",
      {
        "is giving": false,
        "will given": false,
        "has given": true,
        "gave": false,
      }),
  QuestionModel("Hãy điền từ vào trỗ trống:\n"
      "I'm preparing to support anything he ____(say) tomorrow.", {
    "says": false,
    "will say": true,
    "will be saying": false,
    "will have been saying": false,
  }),
];
