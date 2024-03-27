import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:learning_english/utils/hangman_utils.dart';
import 'dart:math';

class HangManScreen extends StatefulWidget {
  const HangManScreen({Key? key}) : super(key: key);

  @override
  State<HangManScreen> createState() => _HangManScreenState();
}

class _HangManScreenState extends State<HangManScreen> {
  AudioCache audioCache = AudioCache(prefix: "sounds/");
  List<String> selectedWord = [];
  String word = "";
  String hint = "";
  List<String> guessedalphabets = [];
  int points = 0;
  int status = 0;
  bool soundOn = true;
  List images = [
    "images/hang.png",
    "images/head.png",
    "images/body.png",
    "images/r_arm.png",
    "images/l_arm.png",
    "images/r_leg.png",
    "images/l_leg.png",
  ];

  playsound(String sound) async {
    if(soundOn) {
      await audioCache.play(sound);
    }
  }

  opendialog(String title){
    return showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (context){
        return Dialog(
          child: Container(
            width: MediaQuery.of(context).size.width / 2,
            height: 180,
            decoration: BoxDecoration(
              color: Colors.purpleAccent
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title, 
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 5),
                Text("Your points: $points",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),

                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width / 2,
                  child: TextButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                      setState(() {
                        status = 0;
                        guessedalphabets.clear();
                        points = 0;
                        selectedWord = wordHints[Random().nextInt(wordHints.length)];
                        word = selectedWord[0];
                        hint = selectedWord[1];
                      });
                      playsound("restart.mp3");
                    }, 
                    child: Center(
                      child: Text("Play again",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
 
  String handletext() {
    String displayword = "";
    for(int i = 0; i < word.length; i++){
      String char = word[i];
      if(guessedalphabets.contains(char)){
        displayword += char + " ";
      }else{
        displayword += "? ";
      }
    }
    return displayword;
  }

  checkletter(String alphabet){
    if(word.contains(alphabet) && !guessedalphabets.contains(alphabet)){
      setState(() {
        guessedalphabets.add(alphabet);
        points += 5;
      });
      playsound("correct.mp3");
    }else if(status != 6 && !guessedalphabets.contains(alphabet)) {
      setState(() {
        status += 1;
      });
      playsound("wrong.mp3");
    }else if(status == 6 && !guessedalphabets.contains(alphabet)){
      opendialog("You lost!");
      playsound("lose.mp3");
    }

    bool isWon = true;
    for(int i = 0; i < word.length; i++){
      String char = word[i];
      if(!guessedalphabets.contains(char)){
        setState(() {
          isWon = false;
        });
        break;
      }
    }

    if(isWon){
      opendialog("WoW, you won");
      playsound("win.mp3");
    }
  }

  @override
  void initState() {
    super.initState();
    selectedWord = wordHints[Random().nextInt(wordHints.length)];
    word = selectedWord[0];
    hint = selectedWord[1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        title: Text("Hang Man", 
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 30, 
            color: Colors.white,
          ),
        ),

        actions: [
          IconButton(
            iconSize: 40,
            icon: Icon(
              soundOn ? Icons.volume_up_sharp : Icons.volume_off_sharp,
            ),
            color: Colors.limeAccent,
            onPressed: () {
              setState(() {
                soundOn = !soundOn;
              });
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width / 3.5,
                decoration: BoxDecoration(
                  color: Colors.pinkAccent,
                ),
                height: 30,
                child: Center(
                  child: Text("$points points", 
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15, 
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),
              Image(
                width: 155,
                height: 280,
                image: AssetImage(images[status]),
                fit: BoxFit.cover,
              ),

              SizedBox(height: 15),
              Text("${7 - status} lives left", 
                style: TextStyle(
                  fontSize: 18, 
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 20),
              Text(hint, 
                style: TextStyle(
                  fontSize: 20, 
                  color: Colors.yellow,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 30),
              Text(handletext(),
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(
                height: 20,
              ),

              GridView.count(
                crossAxisCount: 7,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(left: 10),
                childAspectRatio: 1.3,
                children: letters_hangman.map((alphabet){
                  return InkWell(
                    onTap: () => checkletter(alphabet),
                    child: Center(
                      child: Text(
                        alphabet,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
