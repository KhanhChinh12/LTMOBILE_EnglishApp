import 'package:flutter/material.dart';

class DescriptionSection extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Text(
            "Chào mừng bạn đến với khóa học Vocabulary Complete Course. Trong khóa học này, chúng tôi sẽ đưa bạn vào hành trình khám phá vốn từ vựng theo các chủ đề đa dạng và thú vị. Từ những từ vựng cơ bản đến những từ ngữ phức tạp, chúng tôi sẽ giúp bạn hiểu rõ hơn về cách sử dụng chúng trong ngữ cảnh khác nhau. Với phương pháp học tập linh hoạt và thú vị, bạn sẽ có cơ hội thực hành và ứng dụng từ vựng mới một cách tự tin và hiệu quả. Hãy cùng chúng tôi trải nghiệm và mở rộng thế giới của ngôn ngữ!",
            style: TextStyle(
              fontSize: 18,
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