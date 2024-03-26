import 'package:flutter/material.dart';
import 'package:learning_english/components/my_list.dart';
import 'package:learning_english/screens/information_screen.dart';
import 'package:learning_english/screens/leaderboard_screen.dart';
import 'package:learning_english/screens/news_page.dart';
import 'package:learning_english/screens/practice_screen.dart';
import 'package:learning_english/screens/setting_screen.dart';
import 'package:learning_english/screens/signin_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFF674AEF),
      child: Column(
        children: [
          const DrawerHeader(
            child: Column(
              children: [
                SizedBox(height: 10),
                Icon(
                  Icons.account_circle_rounded,
                  color: Colors.white,
                  size: 80,
                ),
                SizedBox(height: 10),
                Text(
                  "Nguyễn Mai Linh",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),

          InkWell(
            onTap: () {
              Navigator.push(context, 
                MaterialPageRoute(builder: (context) => PracticeScreen()));
            },
            child: MyListTile(
              icon: Icons.assignment,
              text: "Bài tập",
            ),
          ),

          InkWell(
            onTap: () {
              Navigator.push(context, 
                MaterialPageRoute(builder: (context) => NewsPage()));
            },
            child: MyListTile(
              icon: Icons.newspaper,
              text: "Tin tức",
            ),
          ),

          InkWell(
            onTap: () {
              Navigator.push(context, 
                MaterialPageRoute(builder: (context) => LeaderBoard()));
            },
            child: MyListTile(
              icon: Icons.emoji_events,
              text: "Bảng xếp hạng",
            ),
          ),

          InkWell(
            onTap: () {
              Navigator.push(context, 
                MaterialPageRoute(builder: (context) => Information()));
            },
            child: MyListTile(
              icon: Icons.info,
              text: "Thông tin",
            ),
          ),

          InkWell(
            onTap: () {
              Navigator.push(context, 
                MaterialPageRoute(builder: (context) => SettingScreen()));
            },
            child: MyListTile(
              icon: Icons.settings,
              text: "Cài đặt",
            ),
          ),

          InkWell(
            onTap: () {
              Navigator.push(context, 
                MaterialPageRoute(builder: (context) => SignInScreen()));
            },
            child: MyListTile(
              icon: Icons.logout,
              text: "Đăng xuất",
            ),
          ),

        ],
      ),
    );
  }
}