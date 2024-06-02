import 'package:flutter/material.dart';

import 'oylama.dart';
class okuma extends StatefulWidget {
  const okuma({super.key});

  @override
  State<okuma> createState() => _okumaState();
}

class _okumaState extends State<okuma> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Python Nedir ?"),
        ),
      body: Center(
        child: Column(
          children: [
            const Card(
              child: Text("Python Nedir? Python, genel amaçlı, yüksek seviyeli bir programlama dilidir. Guido van Rossum tarafından geliştirilen ve 1991 yılında piyasaya sürülen Python, basit ve anlaşılır sözdizimiyle öne çıkar ve birçok alanda kullanılır.Python'un Özellikleri:Kolay Okunabilirlik: Python, basit ve anlaşılır bir sözdizimine sahiptir, bu da kodun kolayca okunabilir ve anlaşılabilir olmasını sağlar.Çok Yönlülük: Python, birçok alanda kullanılabilir. Web geliştirme, veri analizi, yapay zeka, bilimsel hesaplama, oyun geliştirme gibi birçok alanda yaygın olarak kullanılır.Geniş Kütüphane Desteği: Python, geniş bir standart kütüphaneye sahiptir ve birçok üçüncü taraf kütüphane ve çerçeve mevcuttur. Bu kütüphaneler, Python'u farklı alanlarda kullanmayı kolaylaştırır.Yüksek Seviyeli Dil: Python, düşük seviyeli ayrıntılarla uğraşmaktan kaçınarak geliştiricilere yüksek seviyeli bir programlama deneyimi sunar. Bu da daha hızlı ve verimli kod yazmayı sağlar.Açık Kaynak: Python, açık kaynaklı bir programlama dilidir ve geniş bir topluluk tarafından desteklenir. Bu, sürekli olarak geliştirilmesini ve iyileştirilmesini sağlar."),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: ElevatedButton(
                child: const Text("Bizi Oylar mısın ? "),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>oylama()));
                },
              ),
            ),
          ],

        ),
      ),
    );
  }
}
