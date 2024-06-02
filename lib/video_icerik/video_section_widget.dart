import 'package:bitirme_projesi/profil/profile_page.dart';
import 'package:flutter/material.dart';

class VideoSection extends StatelessWidget {

  List videoList = [
    'Step 1: Python nedir?',
    'Step 2: Pythonda veri tipleri',
    'Step 3: Pythonda karar yapıları',
    'Step 4: Pythonda döngüler'
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: videoList.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index){
          return ListTile(
            leading: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: index == 0 ? Color(0xFF674AEF) : Color(0xFF674AEF).withOpacity(0.6),
              shape: BoxShape.circle,
              ),
              child: Icon(Icons.play_arrow_rounded, color: Colors.white, size: 30,),
            ),
            title: Text(videoList[index], style: TextStyle(color: Colors.white70),),
            subtitle: const Text("20 min 50 sec", style: TextStyle(color: Colors.white54),),
          );
        }
    );
  }
}
