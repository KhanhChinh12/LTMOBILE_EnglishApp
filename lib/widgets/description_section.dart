import 'package:flutter/material.dart';

class DescriptionSection extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black.withOpacity(0.7),
            ),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Text(
                "Thời lượng:  ",
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w500
                ),
              ),

              Icon(
                Icons.timer,
                color: Color(0xFF674AEF),
              ),
              SizedBox(height: 5),
              Text(
                "26 tiếng",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Đánh giá: ",
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w500
                ),
              ),
              Icon(
                Icons.star,
                color: Colors.amber,
              ),
              SizedBox(height: 5),
              Text(
                "4.5",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}