import 'package:flutter/material.dart';
import 'package:learning_english/screens/quiz_board_screen.dart';
import 'package:learning_english/screens/user_screen.dart';

import 'home_screen.dart';
import 'my_course_screen.dart';

class MyScreen extends StatefulWidget {
  @override
  _MyScreenState createState() => _MyScreenState();
}
class _MyScreenState extends State<MyScreen> {
  int _currentIndex = 0;
  final screens = [HomePage(), MyCourseScreen(), QuizBoard(), UserScreen()];

  void onTapSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<BottomNavigationBarItem> _bottomNavBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Trang chủ',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.assignment),
      label: 'Khóa học',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      label: 'Quiz Board',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Tài khoản',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 16,
        unselectedFontSize: 16,
        iconSize: 32,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Color(0xFF674AEF),
        items: _bottomNavBarItems,
        currentIndex: _currentIndex,
        onTap: onTapSelected,
      ),
    );
  }
}