import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFF674AEF),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Thông báo",
        ),
        actions: [
          IconButton(
            onPressed: () {

            },
            icon: Icon(Icons.done_all, color: Colors.white),
          ),
          IconButton(
            onPressed: () {

            },
            icon: Icon(Icons.delete, color: Colors.white),
          ),
        ],
      ),

      body: Container(
        color: Colors.grey.withOpacity(0.5),
        child: Column(
          children: [
            SizedBox(height: 10),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
                child: Row(
                  children: [
                    Icon(
                      Icons.book,
                      color: Colors.black,
                      size: 40,
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        "Khóa học Vocabulary đã có thêm 1 video mới",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 10),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
                child: Row(
                  children: [
                    Icon(
                      Icons.book,
                      color: Colors.black,
                      size: 40,
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        "Khóa học Reading đã có thêm 1 video mới",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 10),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
                child: Row(
                  children: [
                    Icon(
                      Icons.book,
                      color: Colors.black,
                      size: 40,
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        "Khóa học Writing đã có thêm 1 video mới",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 10),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
                child: Row(
                  children: [
                    Icon(
                      Icons.book,
                      color: Colors.black,
                      size: 40,
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        "Khóa học Listening đã có thêm 1 video mới",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 10),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
                child: Row(
                  children: [
                    Icon(
                      Icons.book,
                      color: Colors.black,
                      size: 40,
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        "Đã đến giờ học khóa học Writing",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}