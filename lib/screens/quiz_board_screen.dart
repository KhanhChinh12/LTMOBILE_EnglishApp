import 'package:flutter/material.dart';
import 'package:learning_english/game_quiz/dictionary_screen.dart';
import 'package:learning_english/game_quiz/hangMan_screen.dart';
import 'package:learning_english/game_quiz/test_knowledge_screen.dart';
import 'package:learning_english/game_quiz/wordle_screen.dart';
import 'package:learning_english/utils/color_utils.dart';

class QuizBoard extends StatelessWidget {

  List imgData = [
    "images/wordle.png",
    "images/game.png",
    "images/knowledge.png",
    "images/dictionary.png",
  ];

  List titles = [
    "WORDLE GAME",
    "HANG MAN",
    "SOCIAL KNOWLEDGE",
    "DICTIONARY",
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(   
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: 
        BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringToColor("CB2B93"),
              hexStringToColor("9546C4"),
              hexStringToColor("5E61F4")
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        padding: EdgeInsets.symmetric(vertical: 30),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.1,
            mainAxisSpacing: 25,
          ), 
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: imgData.length,
          itemBuilder: (context, index) {  
            return InkWell(
              onTap: () {
                if(index == 0) {
                  Navigator.push(context, 
                    MaterialPageRoute(builder: (context) => WordleScreen()));
                }else if(index == 1) {
                  Navigator.push(context, 
                    MaterialPageRoute(builder: (context) => HangManScreen()));
                }else if(index == 2) {
                  Navigator.push(context, 
                    MaterialPageRoute(builder: (context) => TestBoard()));
                }else if(index == 3) {
                  Navigator.push(context, 
                    MaterialPageRoute(builder: (context) => DictionaryScreen()));
                }
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      spreadRadius: 1,
                      blurRadius: 6,
                    ),
                  ],
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      imgData[index],
                      width: 100,
                    ),
                    Text(
                      titles[index],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}