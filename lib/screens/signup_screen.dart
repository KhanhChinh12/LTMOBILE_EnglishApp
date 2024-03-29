import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learning_english/screens/my_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isObscure1 = true;
  bool _isObscure2 = true;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  TextEditingController _passwordagainTextController = TextEditingController();
  TextEditingController _phoneTextController = TextEditingController();


  String _email = "";
  String _password = "";
  String _username = "";
  String _passwordagain = "";
  String _phone = "";

  Future addUserDetails(String email, String name, String phone) async{
    await FirebaseFirestore.instance.collection('users').add({
      'email' : email,
      'name' : name,
      'sdt' : phone,
    });
  }

  void _handleSignUp() async{
    if (passwordConfirmed()) {
      try {
        //print("User Registered: ${userCredential.user!.email}");
        UserCredential userCredential =
        await _auth.createUserWithEmailAndPassword(
          email: _email,
          password: _password,
        );
        addUserDetails(
          _email,
          _username,
          _phone,
        );
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.blue,
            content: Center(
              child: Text(
                "Đăng ký thành công!",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ))
        );
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyScreen()));
        _emailTextController.clear();
        _passwordTextController.clear();
        _userNameTextController.clear();
        _phoneTextController.clear();
        _passwordagainTextController.clear();
      } on FirebaseAuthException catch (e) {
        //print("Lỗi đăng ký: $e");
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              content: Center(
                child: Text(
                  "Mật khẩu quá yếu!",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ))
          );
        } else if (e.code == "email-already-in-use") {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              content: Center(
                child: Text(
                  "Tài khoản đã tồn tại!",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ))
          );
        }
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Center(
            child: Text(
              "Mật khẩu chưa khớp",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ))
      );
    }
  }

  bool passwordConfirmed(){
    if(_passwordTextController.text.trim() == _passwordagainTextController.text.trim()){
      return true;
    } else{
      return false;
    }
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF674AEF),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        title: Padding(
          padding: const EdgeInsets.only(left: 85),
          child: Text(
            "Đăng ký",
            style: TextStyle(color: Colors.white,fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 30),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("images/splash.png", width: 150),
                SizedBox(height: 20),
                TextFormField(
                  controller: _userNameTextController,
                  keyboardType: TextInputType.name,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        style: BorderStyle.none,
                        color: Colors.white,
                        width: 1,
                      ),
                    ),
                    labelText: "Tên đăng nhập",
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    filled: true,
                    fillColor: Colors.black.withOpacity(0.1),
                    prefixIcon: Icon(Icons.person_2_outlined, color: Colors.black),
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Vui lòng nhập tên đăng nhập";
                    }
                    return null;
                  },
                  onChanged: (value){
                    setState(() {
                      _username = value;
                    });
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _emailTextController,
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        style: BorderStyle.none,
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    labelText: "Email",
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    filled: true,
                    fillColor: Colors.black.withOpacity(0.1),
                    prefixIcon: Icon(Icons.email_outlined, color: Colors.black),
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Vui lòng nhập email";
                    }
                    return null;
                  },
                  onChanged: (value){
                    setState(() {
                      _email = value;
                    });
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _passwordTextController,
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Colors.black,
                  obscureText: _isObscure1,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        style: BorderStyle.none,
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    labelText: "Mật khẩu",
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    filled: true,
                    fillColor: Colors.black.withOpacity(0.1),
                    prefixIcon: Icon(Icons.lock_outline, color: Colors.black),
                    suffixIcon: IconButton(
                      icon: Icon(_isObscure1 ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isObscure1 = !_isObscure1;
                        });
                      },
                    ),
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Vui lòng nhập mật khẩu";
                    }
                    return null;
                  },
                  onChanged: (value){
                    setState(() {
                      _password = value;
                    });
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _passwordagainTextController,
                  keyboardType: TextInputType.text,
                  obscureText: _isObscure2,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        style: BorderStyle.none,
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    labelText: "Nhắc lại mật khẩu",
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    filled: true,
                    fillColor: Colors.black.withOpacity(0.1),
                    prefixIcon: Icon(Icons.lock_outline, color: Colors.black),
                    suffixIcon: IconButton(
                      icon: Icon(_isObscure2 ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isObscure2 = !_isObscure2;
                        });
                      },
                    ),
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Vui lòng nhập lại mật khẩu";
                    }
                    return null;
                  },
                  onChanged: (value){
                    setState(() {
                      _passwordagain = value;
                    });
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _phoneTextController,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        style: BorderStyle.none,
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    labelText: "Số điện thoại",
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    filled: true,
                    fillColor: Colors.black.withOpacity(0.1),
                    prefixIcon: Icon(Icons.phone_android_outlined, color: Colors.black),

                  ),
                  onChanged: (value){
                    setState(() {
                      _phone = value;
                    });
                  },
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: (){
                    if(_formKey.currentState!.validate()){
                      _handleSignUp();
                    }
                  },
                  child: Text("Đăng ký"),
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    fixedSize: Size(200,50),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }

}
