import 'package:flutter/material.dart';
// import 'package:learning_english/screens/home_screen.dart';
// import 'package:learning_english/screens/my_screen.dart';
import 'package:learning_english/screens/signin_screen.dart';

class WelcomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Stack(children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.8,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.8,
                decoration: BoxDecoration(
                  color: Color(0xFF674AEF),
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(90)),
                ),
                child: Center(child: Image.asset(
                    "images/welcome.png",
                    scale: 0.8,
                ),),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.222,
                  decoration: BoxDecoration(
                    color: Color(0xFF674AEF)
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.222,
                  padding: EdgeInsets.only(top: 50, bottom: 30),
                  decoration: BoxDecoration(
                      color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(90))
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Learning is Everything",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                          wordSpacing: 2,
                        ),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          "Learning with Pleasure with Dear Programmer, Wherever you are",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black.withOpacity(0.6),
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      Material(
                        color: Color(0xFF674AEF),
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => SignInScreen(),
                            ));
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                            child: Text(
                              "Get Start",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],),
          ],
        ),

      ),
    );
  }
}