import 'package:flutter/material.dart';
import 'kurslar.dart';
import 'okuma.dart';
class DetaySayfa extends StatefulWidget {
late kurslar dil;


  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {

  Future <List<kurslar>> kurslarigetir() async{
    var filmlerListesi = <kurslar>[];
    var f1=kurslar(1, "Python","python (1).png");
    var f2=kurslar(1, "SQL","sql.jpg");
    var f3=kurslar(1, "Java","java.webp");
    var f4=kurslar(1, "React","react.jpg");
    var f5=kurslar(1, "C++","cpp.jpg");
    var f6=kurslar(1, "Html,Css,Javascript","html.png");

    filmlerListesi.add(f1);
    filmlerListesi.add(f2);
    filmlerListesi.add(f3);
    filmlerListesi.add(f4);
    filmlerListesi.add(f5);
    filmlerListesi.add(f6);

    return filmlerListesi;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.dil.dil_adi),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("images/${widget.dil.dil_resim_adi}"),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>okuma()));
                },
                child: Text("Oku",style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
