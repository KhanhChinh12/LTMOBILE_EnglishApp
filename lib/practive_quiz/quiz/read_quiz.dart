import 'package:flutter/material.dart';

class ReadQuiz extends StatefulWidget {
  @override
  State<ReadQuiz> createState() => _ReadQuiz();
}

class _ReadQuiz extends State<ReadQuiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kiểm tra Đọc'),
      ),
    );
  }
}
