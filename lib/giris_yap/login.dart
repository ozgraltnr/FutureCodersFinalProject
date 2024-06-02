import 'package:bitirme_projesi/giris_yap/register.dart';
import 'package:bitirme_projesi/giris_yap/reserpassword.dart';
import 'package:flutter/material.dart';

import '../courses/kurs_sayfasi.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});


/*

  Future<void> fetchCourses() async {
    final response = await Dio().get('https://jsonplaceholder.typicode.com/posts');
    if(response.statusCode == HttpStatus.ok){
      final _datas = response.data;

      if(_datas is List){
        setState(() {
          _giris = _datas.map((e) => LoginPage.fromJson(e)).toList();
        });
      }
    }
  }
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          margin: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _header(context),
              _inputField(context),
              _forgotPassword(context),
              _signup(context),
            ],
          ),
      ),
    );
  }

  _header(context) {
    return Column(
      children: [
        ClipRRect(
          child: Image.asset(
            "images/FutureCodersLogo.png",  // Buraya resim URL'sini ekleyin
            width: 180,
            height: 240,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }


  _inputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          decoration: InputDecoration(
              hintText: "Username",
              hintStyle: const TextStyle(color: Colors.white60),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(
                    color: Colors.grey
                  ),
              ),
              fillColor: Colors.purple.withOpacity(0.1),
              filled: true,
              prefixIcon: const Icon(Icons.person, color: Colors.white70,)),
          style: TextStyle(color: Colors.white),

        ),
        const SizedBox(height: 15),


        TextField(
          decoration: InputDecoration(
            hintText: "Password",
            hintStyle: const TextStyle(color: Colors.white60),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: const BorderSide(
                  color: Colors.grey,
                )),
            fillColor: Colors.purple.withOpacity(0.1),
            filled: true,
            prefixIcon: const Icon(Icons.password, color: Colors.white70,),
          ),
          obscureText: true,
          style: TextStyle(color: Colors.white),
        ),
        const SizedBox(height: 30),
        Container(

          decoration: BoxDecoration(

            shape: BoxShape.rectangle,

            boxShadow : [
          BoxShadow(
          offset: Offset(0,5),
          color: Colors.deepOrange.withOpacity(.2),
          spreadRadius: 3,
          blurRadius: 30,
          ),
        ],
        ),
          child: ElevatedButton(

            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CoursePage()),
              );
            },
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: Colors.deepPurple.shade300,
            ),
            child: const Text(
              "Login",
              style: TextStyle(fontSize: 20,color: Colors.deepPurple),
            ),
          ),
        )
      ],
    );
  }

  _forgotPassword(context) {
    return TextButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ResetPasswordPage()));
      },
      child: Text("Forgot password?",
        style: TextStyle(color: Colors.deepPurple.shade300),
      ),
    );
  }

  _signup(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Hesabınız Yok mu ? ", style: TextStyle(color: Colors.deepPurple.shade200) ,),
        TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupPage()));
            },
            child: Text("Kaydol", style: TextStyle(color: Colors.deepPurple.shade300),)
        )
      ],
    );
  }
}