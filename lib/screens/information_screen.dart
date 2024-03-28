import 'package:flutter/material.dart';

class Information extends StatefulWidget {
  const Information({Key? key}) : super(key: key);

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  int likeCount = 10;
  bool liked = false;

  void incrementLike() {
    if (!liked) {
      setState(() {
        likeCount += 1;
        liked = true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFF674AEF),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Trung tâm trợ giúp",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 150,
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              decoration: BoxDecoration(
                color: Color(0xFF7ADAF1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Thông tin về Mr.Piyo English',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          incrementLike();
                        },
                        child: Icon(Icons.thumb_up),
                      ),
                      SizedBox(width: 15),
                      Text(
                        '$likeCount',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Content
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Mr.Piyo English',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Địa chỉ trụ sở chính: Trường đại học Phenikaa, Yên Nghĩa, Hà Đông, Hà Nội, Việt Nam.',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    'Liên hệ: 03xxxxxxxx để được tư vấn.\n\nThành viên:\n- Ngô Khánh Chinh\n- Nguyễn Mai Linh\n- Lê Thị Nhi',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Các chính sách:',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 15,),
                  Text(
                    '- Quy chế hoạt động\n- Điều khoản Sử dụng\n- Chính sách Bảo mật',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}