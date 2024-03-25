import 'package:flutter/material.dart';
import 'package:learning_english/components/drawer.dart';
import 'package:learning_english/screens/edit_profile_screen.dart';

class UserScreen extends StatefulWidget {
  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  bool isObscurePassword = true;
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
              "Thông tin cá nhân",
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfileScreen()),
                  );
                },
                icon: Icon(Icons.edit, color: Colors.white),
              ),
            ],
          ),
          drawer: MyDrawer(),
          body: Container(
            child: GestureDetector(
              onTap: (){},
              child: ListView(
                children: [
                  SizedBox(height: 30),
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                            border: Border.all(width: 4, color: Colors.white),
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                              ),
                            ],
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage('https://cdn.pixabay.com/photo/2023/07/24/09/14/coccinellidae-8146623_1280.jpg'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  buildTextField("Họ và tên", "Nguyễn Mai Linh", false),
                  buildTextField("Email", "linh03072003@gmail.com", false),
                  buildTextField("Mật khẩu", "********", true),
                  buildTextField("Số điện thoại", "0949374460", false),
                  buildTextField("Địa chỉ", "", false),
                ],
              ),
            ),
          ),
      ),
    );
  }
  Widget buildTextField(String labelText, String placebolder, bool isPasswordTextField){
    return Padding(
      padding: EdgeInsets.only(left: 20, bottom: 30, right: 20),
      child: TextField(
        obscureText: isPasswordTextField ? isObscurePassword : false,
        decoration: InputDecoration(
          suffixIcon: isPasswordTextField ?
            IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: Colors.grey,
              ),
              onPressed: (){},
            ): null,
          contentPadding: EdgeInsets.only(bottom: 5),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placebolder,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }


}