import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning_english/game_quiz/test_knowledge_screen.dart';
import 'package:learning_english/test_social_knowledge/api_test_services.dart';
import 'package:learning_english/test_social_knowledge/colors_test.dart';
import 'package:learning_english/test_social_knowledge/images_test.dart';
import 'package:learning_english/test_social_knowledge/text_style.dart';
import 'package:audioplayers/audioplayers.dart';

class QuestionBoard extends StatefulWidget {
  const QuestionBoard({Key? key}) : super(key: key);

  @override
  State<QuestionBoard> createState() => _QuestionBoardState();
}

class _QuestionBoardState extends State<QuestionBoard> {

  @override
  void initState() {
    super.initState();
    quiz = getQuestionBoard();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    timer!.cancel();
  }

  AudioCache audioCache = AudioCache(prefix: "sounds/");
  bool soundOn = true;
  int seconds = 60;
  Timer? timer;
  var currentQuestionIndex = 0;
  late Future quiz;
  int points = 0;
  int totalPoints = 0;
  var isLoaded = false;
  var optionsList = [];

  var optionsColor = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];

  startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if(seconds > 0) {
          seconds--;
        }else{
          timer.cancel();
        }
      });
     });
  }

  resetColors() {
    optionsColor = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    ];
  }

  playsound(String sound) async {
    if(soundOn) {
      await audioCache.play(sound);
    }
  }

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [blue, darkBlue],
          ),
        ),

        child: FutureBuilder(
          future: quiz,
          
          builder: (BuildContext context, AsyncSnapshot snapshot){

            if(snapshot.hasData){

              var data = snapshot.data["results"];
              if(isLoaded == false){
                optionsList = data[currentQuestionIndex]["incorrect_answers"];
                optionsList.add(data[currentQuestionIndex]["correct_answer"]);
                optionsList.shuffle();
                isLoaded = true;
              }

              return SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: lightgrey, width: 2),
                          ),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            }, 
                            icon: const Icon(
                              CupertinoIcons.xmark,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
          
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            normalText(color: Colors.white, size: 24, text: "$seconds"),
                            SizedBox(
                              width: 80,
                              height: 80,
                              child: CircularProgressIndicator(
                                value: seconds / 60,
                                valueColor: const AlwaysStoppedAnimation(Colors.white),
                              ),
                            ),
                          ],
                        ),
          
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: lightgrey, width: 2),
                          ),
                          child: TextButton.icon(
                            onPressed: null, 
                            icon: const Icon(CupertinoIcons.sun_dust_fill, color: Colors.white, size: 18),
                            label: normalText(color: Colors.white, size: 14, text: "Piyo Jr"),
                          ),
                        ),
                      ],
                    ),
          
                    const SizedBox(height: 20),
                    Image.asset(ideas, width: 200),
          
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: normalText(color: lightgrey, size: 18, text: "Question ${currentQuestionIndex + 1} of ${data.length}"),
                    ),
          
                    const SizedBox(height: 20),
                    normalText(color: Colors.white, size: 20, text: data[currentQuestionIndex]["question"]),
          
                    const SizedBox(height: 20),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: optionsList.length,
                      itemBuilder: (BuildContext context, int index){

                        var answer = data[currentQuestionIndex]["correct_answer"];

                        return GestureDetector(
                          onTap: (){

                            setState(() {
                              if(answer.toString() == optionsList[index].toString()){
                                optionsColor[index] = Colors.green;
                                points = 10;
                                totalPoints += points;
                                playsound("correct.mp3");
                              }else{
                                optionsColor[index] = Colors.red;
                                playsound("incorrect.mp3");
                              }

                              if(currentQuestionIndex < data.length - 1){
                                Future.delayed(Duration(seconds: 1), (){
                                  isLoaded = false;
                                  currentQuestionIndex++;
                                  resetColors();
                                  timer!.cancel();
                                  seconds = 60;
                                  startTimer();
                                });
                              }
                              else if(currentQuestionIndex >= data.length - 1){
                                WidgetsBinding.instance!.addPostFrameCallback((_) {
                                  showDialog(
                                    context: context, 
                                    builder: (BuildContext context){
                                      return AlertDialog(
                                        backgroundColor: Colors.amber,
                                        title: Text("Completed!",
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue,
                                          ),
                                        ),
                                        content: Text("Total Points: $totalPoints",
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),

                                        actions: [
                                          TextButton(
                                            child: Text("OK",
                                              style: TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                            onPressed: (){
                                              Navigator.pop(context);
                                              Navigator.pushReplacement(
                                                context, 
                                                MaterialPageRoute(
                                                  builder: (context) => TestBoard()));
                                            },
                                          ),
                                        ],
                                      );
                                    });
                                    playsound("win.mp3");
                                 });
                              }
                              else{
                                timer!.cancel();
                              }

                            });

                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            alignment: Alignment.center,
                            width: size.width - 100,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: optionsColor[index], 
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: headingText(
                              color: blue, 
                              size: 18, 
                              text: optionsList[index].toString(),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            }
            else{
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ),
              );
            }

          },
        ),
      )),
    );
  }
}