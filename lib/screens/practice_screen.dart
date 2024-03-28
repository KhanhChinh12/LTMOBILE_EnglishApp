import 'package:flutter/material.dart';
import 'package:learning_english/practive_quiz/quiz/ngu_phap_quiz.dart';
import 'package:learning_english/practive_quiz/quiz/tu_vung_quiz.dart';
import 'package:learning_english/practive_quiz/quiz/read_quiz.dart';
import 'package:learning_english/practive_quiz/quiz/wirte_quiz.dart';
import 'package:learning_english/practive_quiz/quiz/listen_quiz.dart';
import 'package:learning_english/screens/my_screen.dart';
class PracticeScreen extends StatefulWidget {
  const PracticeScreen({Key? key}) : super(key: key);

  @override
  State<PracticeScreen> createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  final List<String> categories = ["Ngữ pháp", "Từ vựng", "Nghe", "Đọc", "Viết"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFF674AEF),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Bài kiểm tra",
        ),
        leading: IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyScreen()));
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),

      body: SafeArea(
        child: GridView.builder(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 30,
            mainAxisSpacing: 30,
            childAspectRatio: 4/1,
          ),
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index){
            return InkWell(
              onTap: () {
                if (categories[index] == "Ngữ pháp") {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NguPhapQuiz()));
                } else if (categories[index] == "Từ vựng") {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TuVungQuiz()));
                }else if (categories[index] == "Nghe") {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ListenQuiz()));
                }else if (categories[index] == "Đọc") {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ReadQuiz()));
                }else if (categories[index] == "Viết") {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WirteQuiz()));
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue,
                ),
                child: Align(
                  child: Text(
                    " ${categories[index]}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
