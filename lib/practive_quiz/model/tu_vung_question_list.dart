import 'package:flutter/material.dart';
import 'package:learning_english/practive_quiz/model/question_model.dart';

List<QuestionModel> questions = [
  QuestionModel("Hãy chọn câu tương ứng với câu sau:\n"
    "Tôi muốn cà phê và sữa",
    {
      "I like coffee and milk": false,
      "I want milk and coffee": false,
      "I want coffee and milk": true,
      "You want coffee and milk": false,
    },
  ),
  QuestionModel("Hãy chọn câu tương ứng với câu sau:\n""Tôi yêu mẹ của tôi", {
    "I love my father": false,
    "I love my sister": false,
    "I love my brother": false,
    "I love my mother": true,
  }),
  QuestionModel("Hãy chọn câu tương ứng với câu sau:\n"
      "Đây là cặp sách của tôi", {
    "This is my pen": false,
    "This is my book bag": true,
    "This is my ruler": false,
    "This is my book": false,
  }),
  QuestionModel("Hãy chọn câu tương ứng với câu sau:\n"
      "Hôm qua tôi đi bơi", {
    "Yesterday I went out": false,
    "Today I go swimming": false,
    "Yesterday I went swimming": true,
    "Yesterday I went skiing": false,
  }),
  QuestionModel("Hãy chọn câu tương ứng với câu sau:\n""Hôm nay là thứ hai", {
    "Today is Monday": true,
    "Today is Tuesday": false,
    "Today is Wednesday": false,
    "Today is Thursday": false,
  }),
  QuestionModel("Hãy chọn câu tương ứng với câu sau:\n"
      "Tôi muốn bánh mì và bơ", {
    "I like bread and butter": false,
    "I want butter and bread": false,
    "I want bread and butter": true,
    "You like bread and butter": false,
  }),
  QuestionModel("Hãy chọn câu tương ứng với câu sau:\n"
      "Đây là sao Hỏa", {
    "This is Venus": false,
    "This is Earth": false,
    "This is Mercury": false,
    "This is Mars": true,
  }),
  QuestionModel("Hãy chọn câu tương ứng với câu sau:\n"
      "Ở đây là bệnh viện", {
    "Here is the school": false,
    "Here is the supermarket": false,
    "Here is the hospital": true,
    "Here is the police station": false,
  }),
  QuestionModel("Hãy chọn câu tương ứng với câu sau:\n"
      "Tôi có 1 quả táo",
      {
        "I have two apples": false,
        "I have an watermelon": false,
        "I have an apples": true,
        "I have a banana": false,
      }),
  QuestionModel("Hãy chọn câu tương ứng với câu sau:\n"
      "Nhà tôi nuôi một con mèo", {
    "My family has a dog": false,
    "My family has a cat": true,
    "I has a cat": false,
    "I has a dog": false,
  }),
];
