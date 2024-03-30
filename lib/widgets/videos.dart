import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Video extends StatefulWidget{
  const Video({super.key});

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  String videoURL = "https://youtu.be/9KC_mwHXbgU?si=CvyRq0vV6rXrMfCs";
  YoutubePlayerController ? _controller;
  int _likeCount = 0;
  int _viewCount = 0;
  bool _liked = false;
  List<String> _comments = [
    "Bài học rất hữu ích, cảm ơn!",
    "Tôi đã học được nhiều từ vựng mới từ khóa học này.",
    "Video rất chất lượng, nhưng có thể thêm phụ đề để dễ dàng hơn cho người học.",
  ];

  @override
  void initState(){
    final videoID = YoutubePlayer.convertUrlToId(videoURL);
    _controller = YoutubePlayerController(
        initialVideoId: videoID!,
        flags:const YoutubePlayerFlags(autoPlay: true)
    );
    _controller!.addListener(_onYoutubePlayerControllerChange);
    super.initState();
  }

  void _toggleLike() {
    setState(() {
      if (_liked) {
        _likeCount--;
        _liked = false;
      } else {
        _likeCount++;
        _liked = true;
      }
    });
  }

  void _onYoutubePlayerControllerChange() {
    setState(() {
    });
  }

  void _addComment(String comment) {
    setState(() {
      _comments.add(comment);
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
          title: Center(
            child: Text(
              "Bài 1: Chủ đề đồ làm bếp",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Color(0xFF674AEF),
          actions: [
            IconButton(
              onPressed: () {

              },
              icon: Icon(Icons.notification_add, color: Colors.white),
            ),
          ]
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: YoutubePlayer(
            controller: _controller!,
            progressColors: ProgressBarColors(
              backgroundColor: Colors.red,
              handleColor: Colors.amber,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${_viewCount} lượt xem',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: _toggleLike,
                    icon: Icon(
                      _liked ? Icons.favorite : Icons.favorite_border,
                      color: _liked ? Colors.red : Colors.grey,
                    ),
                  ),
                  Text(
                    '$_likeCount',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        /* Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            "Bài 1: Chủ đề đồ làm bếp",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            "Chào mừng bạn đến với bài học từ vựng chủ đề Đồ làm bếp! Trong khóa học này, chúng ta sẽ khám phá và làm quen với các từ vựng liên quan đến các công cụ, thiết bị và vật dụng được sử dụng trong bếp. Từ những chiếc chảo, nồi, dao đến các loại đồ dùng như tô, thìa và nhiều hơn nữa, bạn sẽ được trang bị với vốn từ vựng cần thiết để mô tả và hiểu rõ hơn về các công cụ và vật dụng mà bạn thường thấy trong môi trường bếp nấu ăn. Hãy cùng nhau khám phá và nâng cao khả năng giao tiếp trong lĩnh vực này!",
            style: TextStyle(
              fontSize: 18,
              letterSpacing: 1,
            ),
          ),
        ), */
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            "Comment",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            onSubmitted: (String value) {
              _addComment(value);
            },
            decoration: InputDecoration(
              hintText: 'Nhập bình luận của bạn...',
              border: InputBorder.none,
            ),
          ),
        ),

        ListView.builder(
          shrinkWrap: true,
          itemCount: _comments.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Row(
                children: [
                  Icon(
                    Icons.person,
                    size: 20,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      _comments[index],
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],),
    );
  }
}
