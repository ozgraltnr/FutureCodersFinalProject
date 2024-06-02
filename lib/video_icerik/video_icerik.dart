import 'package:bitirme_projesi/video_icerik/feed.dart';
import 'package:bitirme_projesi/video_icerik/player.dart';
import 'package:bitirme_projesi/video_icerik/video_section_widget.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../courses/navbar.dart';
import 'description_section_widget.dart';



class VideoIcerik extends StatefulWidget {
  @override
  _VideoIcerikState createState() => _VideoIcerikState();
}
class _VideoIcerikState extends State<VideoIcerik> {
  bool isVideosSection = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F111D),
        elevation: 0,
        centerTitle: true,
        //title: Text(widget.img,
        // style: TextStyle(
        // fontWeight: FontWeight.bold,
        // letterSpacing: 1,
        // )),

        title: const Text("Python Kursu",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
          color: Colors.white
        ),
        ),
        actions: const [
          Padding(padding: EdgeInsets.only(right: 10),
          child: Icon(
            Icons.notifications,
            size: 28,
            color: Color(0xFF674AEF),
          ),
          )
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ListView(
          children: [
            InkWell(

              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const feed()),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFF0F111D),
                  image: const DecorationImage(
                    image: AssetImage('images/up3.png'),
                  )
                ),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.play_arrow_rounded,
                      color: Color(0xFF674AEF),
                      size: 45,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15,),
            const Text("Python Complete Course",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.white70
              ),),
            const SizedBox(height: 5,),
            const Text(
              "Emrecan Bozkurt tarafından hazırlandı",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white54,
              ),
            ),
            const SizedBox(height: 5,),
            const Text(
              "55 Video",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.white54,
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              decoration: BoxDecoration(
                color: Color(0xFF303665).withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Material(
                    color: isVideosSection ? Color(0xFF674AEF) : Color(0xFF674AEF).withOpacity(0.6),
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isVideosSection = true;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 35),
                        child: const Text(
                          "Videolar",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Material(
                    color: isVideosSection ? Color(0xFF674AEF).withOpacity(0.6) : Color(0xFF674AEF),
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isVideosSection = false;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 35),
                        child: const Text(
                          "Tanım",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            isVideosSection ? VideoSection() : DescriptionSection(),
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavBar(),


    );
  }
}