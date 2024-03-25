import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget{
  final IconData icon;
  final String text;
  const MyListTile({
    super.key,
    required this.icon,
    required this.text
  });

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.white,
          size: 30,
        ),
        title: Text(text, style: TextStyle(fontSize: 25,color: Colors.white),),
      ),
    );
  }
}