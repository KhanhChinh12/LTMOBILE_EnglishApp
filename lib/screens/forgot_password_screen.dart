import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learning_english/screens/signin_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  String _email = "";
  TextEditingController _emailTextController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  resetPassword()async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _email);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.grey,
          content: Center(
            child: Text(
              "Hãy kiểm tra email của bạn để lấy lại mật khẩu!",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ))
      );
      Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen()));
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Center(
            child: Text(
              "Tài khoản không tồn tại!",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF674AEF),
        iconTheme: IconThemeData(color: Colors.white),
        title: Padding(
          padding: const EdgeInsets.only(left: 45),
          child: Text(
            "Quên mật khẩu",
            style: TextStyle(color: Colors.white,fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40),
              Center(
                child: Image.asset(
                  "images/lock.png",
                  width: 200,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Nhập Email để lấy lại mật khẩu",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: _emailTextController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          style: BorderStyle.none,
                          color: Colors.white,
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
                      prefixIcon: Icon(Icons.person_2_outlined, color: Colors.black),
                    ),
                    onChanged: (value){
                      setState(() {
                        _email = value;
                      });
                    },
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Vui lòng nhập Email";
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: (){
                  resetPassword();
                },
                child: Text("Gửi"),
                style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  fixedSize: Size(200,50),
                ),
              ),
            ]
          ),
        ),
      ),

    );
  }
}