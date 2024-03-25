import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learning_english/screens/forgot_password_screen.dart';
import 'package:learning_english/screens/my_screen.dart';
import 'package:learning_english/screens/signup_screen.dart';

import '../utils/color_utils.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _isObscure = true;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();

  String _email = "";
  String _password = "";
  String _userName = "";
  void _handleSignIn() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: _email, password: _password);
      //print("User Logged In: ${userCredential.user!.email}");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.blue,
          content: Center(
            child: Text(
              "Đăng nhập thành công!",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ))
      );
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyScreen()));
      _emailTextController.clear();
      _passwordTextController.clear();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Center(
              child: Text(
                "Tài khoản không tồn tại!",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ))
        );
      }else if(e.code == 'wrong-password'){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Center(
              child: Text(
                "Sai mật khẩu",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ))
        );
      }
      //print("Lỗi đăng nhập: $e");
    }
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                hexStringToColor("CB2B93"),
                hexStringToColor("9546C4"),
                hexStringToColor("5E61F4")
              ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.bottomCenter
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 70, left: 30, right: 30),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("images/splash.png", width: 170),
                    SizedBox(height: 30),
                    TextFormField(
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      controller: _emailTextController,
                      cursorColor: Colors.white,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            style: BorderStyle.none,
                            color: Colors.white,
                            width: 0,
                          ),
                        ),
                        labelText: "Email",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.1),
                        prefixIcon: Icon(Icons.email_outlined, color: Colors.white),
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
                    SizedBox(height: 20),
                    TextFormField(
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      cursorColor: Colors.white,
                      controller: _passwordTextController,
                      keyboardType: TextInputType.text,
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 1,
                          ),
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        fillColor: Colors.white.withOpacity(0.1),
                        labelText: "Mật khẩu",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        filled: true,
                        prefixIcon: Icon(Icons.lock_outline, color: Colors.white),
                        suffixIcon: IconButton(
                          icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => ForgotPasswordScreen()));
                          },
                          child: const Text(
                            "Quên mật khẩu",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: (){
                        if(_formKey.currentState!.validate()){
                          _handleSignIn();
                        }
                      },
                      child:
                      Text("Đăng nhập"),
                      style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        fixedSize: Size(200,50),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Chưa có tài khoản?",
                          style: TextStyle(color: Colors.white70),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => SignUpScreen()));
                          },
                          child: const Text(
                            " Đăng ký ",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }

}
