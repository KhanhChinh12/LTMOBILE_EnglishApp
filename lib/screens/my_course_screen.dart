import 'package:flutter/material.dart';
import 'package:learning_english/components/drawer.dart';

class MyCourseScreen extends StatefulWidget {
  @override
  State<MyCourseScreen> createState() => _MyCourseScreenState();
}

class _MyCourseScreenState extends State<MyCourseScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked : (didPop){
        if (didPop) {
          return;
        }
      },
      child: Scaffold(
          appBar: AppBar(
            foregroundColor: Colors.white,
            backgroundColor: Color(0xFF674AEF),
            elevation: 0,
            centerTitle: true,
            title: Text(
              "Khóa học của tôi",
            ),
            actions: [
              IconButton(
                onPressed: () {

                },
                icon: Icon(Icons.delete, color: Colors.white),
              ),
            ],
          ),
          drawer: MyDrawer(),
          body: Container(

          )
      ),
    );
  }


}