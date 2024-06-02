import 'package:bitirme_projesi/video_icerik/player.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

final videUrls = [
  'https://youtu.be/Uwq-YtI-T60?si=x-MhTXfna3hgqjdI',

];

class feed extends StatelessWidget {
  const feed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F111D),
        title: const Text("Kurs İcerikleri", style: TextStyle(color: Colors.white70),),

      ),
      body: ListView.builder(
        itemCount: videUrls.length,
        itemBuilder: (context,index){
          final videID = YoutubePlayer.convertUrlToId(videUrls[index]);
          return InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PlayerScren(videoId:videID!)));
            },
              child: Image.network(YoutubePlayer.getThumbnail(videoId: videID!)));
        },
      ),
    );
  }
}

Widget thubmNail(){
  return Container(
    height: 200,
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.white,
          width: 10,
      )
    ),
    margin: EdgeInsets.all(10),
    color: Colors.black,
    child: Center(
      child: Text("Video"),
    ),
  );
}