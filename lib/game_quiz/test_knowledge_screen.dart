import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning_english/test_social_knowledge/colors_test.dart';
import 'package:learning_english/test_social_knowledge/images_test.dart';
import 'package:learning_english/test_social_knowledge/questions_board_screen.dart';
import 'package:learning_english/test_social_knowledge/text_style.dart';

class TestBoard extends StatefulWidget {
  const TestBoard({Key? key}) : super(key: key);

  @override
  State<TestBoard> createState() => _TestBoardState();
}

class _TestBoardState extends State<TestBoard> {
  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [blue, darkBlue],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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

              Image.asset(knowledge2),
              const SizedBox(height: 20),
              headingText(color: Colors.white, size: 36, text: "Test your social knowledge with Piyo Junior"),

              const SizedBox(height: 20),
              normalText(color: lightgrey, size: 18, text: "Hãy cùng thử tài khám phá kiến thức xã hội với Piyo Junior nào!"),
              const Spacer(),
              
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, 
                      MaterialPageRoute(builder: (context) => QuestionBoard()));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    alignment: Alignment.center,
                    width: size.width - 100,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.circular(12),
                    ),
                    child: headingText(color: blue, size: 18, text: "Get Started"),
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