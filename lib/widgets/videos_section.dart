import 'package:flutter/material.dart';
import 'package:learning_english/widgets/videos.dart';

class VideoSection extends StatelessWidget{
  List videoList = [
    "Bai 1",
    "Bai 2",
    "Bai 3",
    "Bai 4",
  ];
  
  @override
  Widget build(BuildContext context){
    return ListView.builder(
      itemCount: videoList.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index){
        return ListTile(
          leading: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: index == 0 ? Color(0xFF674AEF) : Color(0xFF674AEF).withOpacity(0.6),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(Icons.play_circle_fill, color: Colors.white, size: 30,),
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => Video(),
                  ),
                );
              },

            )
          ),
          title: Text(
            videoList[index],
          ),
          subtitle: Text(
            "20 phút",
          ),
        );
      },
    );
  }
}