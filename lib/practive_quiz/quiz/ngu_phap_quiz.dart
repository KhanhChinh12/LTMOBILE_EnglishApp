import 'package:flutter/material.dart';
import 'package:learning_english/utils/color_utils.dart';
import '../model/ngu_phap_question_list.dart';
import '../model/result_screen.dart';

class NguPhapQuiz extends StatefulWidget {
  @override
  State<NguPhapQuiz> createState() => _NguPhapQuiz();
}

class _NguPhapQuiz  extends State<NguPhapQuiz> {
  int question_pos = 0;
  int score = 0;
  bool btnPressed = false;
  PageController? _controller;
  String btnText = "Next Question";
  bool answered = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.pripmaryColor,
      body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: PageView.builder(
            controller: _controller!,
            onPageChanged: (page) {
              if (page == NPquestions.length - 1) {
                setState(() {
                  btnText = "See Results";
                });
              }
              setState(() {
                answered = false;
              });
            },
            physics: new NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Question ${index + 1}/10",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text("Bạn không thể quay lại khi nhấn Next Question",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 23
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 150.0,
                    child: Text(
                      "${NPquestions[index].question}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                      ),
                    ),
                  ),
                  for (int i = 0; i < NPquestions[index].answers!.length; i++)
                    Container(
                      width: double.infinity,
                      height: 50.0,
                      margin: EdgeInsets.only(
                          bottom: 20.0, left: 12.0, right: 12.0),
                      child: RawMaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        fillColor: btnPressed
                            ? NPquestions[index].answers!.values.toList()[i]
                            ? Colors.green
                            : Colors.red
                            : AppColor.secondaryColor,
                        onPressed: !answered
                            ? () {
                          if (NPquestions[index]
                              .answers!
                              .values
                              .toList()[i]) {
                            score++;
                            print("yes");
                          } else {
                            print("no");
                          }
                          setState(() {
                            btnPressed = true;
                            answered = true;
                          });
                        }
                            : null,
                        child: Text(NPquestions[index].answers!.keys.toList()[i],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            )),
                      ),
                    ),
                  SizedBox(
                    height: 40.0,
                  ),
                  RawMaterialButton(
                    onPressed: () {
                      if (_controller!.page?.toInt() == NPquestions.length - 1) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResultScreen(score)));
                      } else {
                        _controller!.nextPage(
                            duration: Duration(milliseconds: 250),
                            curve: Curves.easeInExpo);

                        setState(() {
                          btnPressed = false;
                        });
                      }
                    },
                    shape: StadiumBorder(),
                    fillColor: Colors.blue,
                    padding: EdgeInsets.all(18.0),
                    elevation: 0.0,
                    child: Text(
                      btnText,
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              );
            },
            itemCount: NPquestions.length,
          )),
    );
  }
}
