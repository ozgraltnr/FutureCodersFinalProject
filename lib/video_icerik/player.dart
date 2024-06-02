import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class PlayerScren extends StatefulWidget {
  const PlayerScren({super.key, required this.videoId});

  final String videoId;
  @override
  State<PlayerScren> createState() => _PlayerScrenState();
}

class _PlayerScrenState extends State<PlayerScren> {
  late final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: widget.videoId,
    flags: const YoutubePlayerFlags(
      autoPlay: true,
      mute: true,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Player"),
      ),
      body:Center(
        child: Column(
          children: [
            YoutubePlayer(controller: _controller,),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: ElevatedButton(onPressed:(){

                  }
                      , child: Icon(Icons.thumb_up)),

                ),
                SizedBox(width: 50,),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: ElevatedButton(onPressed:(){

                  }
                      , child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Icon(Icons.thumb_down))),

                )
              ],
            ),
            SizedBox(height: 20,),
            ListTile(

              leading: Padding(
                padding: EdgeInsets.all(10),
                  child: Icon(Icons.code)),
              title: Text("Python Hakkında"),
              trailing: Icon(Icons.keyboard_arrow_right),
              
            )

          ],
        ),
      ),

    );
  }
}

