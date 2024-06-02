import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../courses/navbar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final double coverHeight = 280;
  final double profileHeight = 144;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          buildTop(),
          buildContent(),
          SizedBox(height: 30,),
          itemProfile('E-Mail', 'abcdefg@gmail.com', CupertinoIcons.mail_solid),
          SizedBox(height: 30,),
          itemProfile('Şifre', 'Şifreyi değiştir', Icons.password_rounded),
          SizedBox(height: 30,),
          itemProfile('Destek', 'FutureCoders Hakkında ve Destek', Icons.support_agent_rounded),

        ],
      ),
      bottomNavigationBar: const CustomNavBar(),

    );
  }

  Widget buildTop(){
    final top = coverHeight - profileHeight / 2;
    final bottom = profileHeight / 2;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: bottom),
          child: builCoverImage(),
        ),
        Positioned(
          top: top,
          child: buildProfileImage(),)
      ],
    );
  }

  builCoverImage() => Container(
    color: Colors.grey,
    child:Image.asset(
    'images/software.jpg',
    height: coverHeight,
    width: double.infinity,
      fit: BoxFit.cover,
  ),
  );

  buildProfileImage() => CircleAvatar(
    radius: profileHeight / 2,
    backgroundColor: Colors.grey.shade800,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.asset(
          'images/profil.png',
        ),
      )
  );

  buildContent() => const Column(
    children: [
      SizedBox(height: 8,),
      Text('Emrecan Bozkurt', style: TextStyle(fontSize: 28, color: Colors.white ,fontWeight:FontWeight.bold ,)),
      SizedBox(height: 8,),
      Text('Lise Öğrencisi', style: TextStyle(fontSize: 20, color: Colors.white54 ,)),

      SizedBox(height: 16,),
      Divider(),
      SizedBox(height: 5),

    ],
  );
}


itemProfile (String title, String subtitle, IconData iconData){
  return Container(
    decoration: BoxDecoration(
        color: Color(0xFF0F111D),
        borderRadius: BorderRadius.circular(10),
        boxShadow : [
          BoxShadow(
            offset: Offset(0,5),
            color: Colors.deepOrange.withOpacity(.2),
            spreadRadius: 5,
            blurRadius: 10,
          )
        ]
    ),
    child: ListTile(
      title: Text(title, style: TextStyle(color: Colors.white70),),
      subtitle: Text(subtitle, style: TextStyle(color: Colors.white54),),
      leading: Icon(iconData, color: Colors.grey,),
      trailing: const Icon(Icons.arrow_forward, color: Colors.grey,),
      tileColor: Colors.white,
    ),
  );
}