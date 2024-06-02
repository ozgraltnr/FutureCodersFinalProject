import 'package:flutter/material.dart';

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(top: 20),
    child: Column(
        children: [
          Text('Her konunun kalıcılığını sağlamak için bir çok python uygulaması yapacağız. '
              'Bölüm sonlarında konuların hepsini kapsayan python ödevlerimizi yapacağız. '
              'Kurs boyunca en gerekli python derslerini en gerektiği kadar detaylı bir şekilde uygulayarak öğreneceğiz.',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white.withOpacity(0.7)
          ),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 20,),
           const Row(children: [
            Text('Eğitim Süresi: ',
              style: TextStyle(
                color: Colors.white70,
                  fontSize: 19,
                  fontWeight: FontWeight.w600
              ),),
            SizedBox(width: 5,),
            Icon(Icons.timer, color: Color(0xFF674AEF),),
            SizedBox(width: 5,),
            Text('26 saat',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 16,
              fontWeight: FontWeight.w500
            ),)
          ],),
          const SizedBox(height: 10,),
          const Row(children: [
            Text('Eğitim Puanı: ',
              style: TextStyle(
                color: Colors.white70,
                  fontSize: 19,
                  fontWeight: FontWeight.w600
              ),),
            SizedBox(width: 5,),
            Icon(Icons.star, color: Colors.amber,),
            SizedBox(width: 5,),
            Text('4.5',
              style: TextStyle(
                color: Colors.white54,
                  fontSize: 16,
                  fontWeight: FontWeight.w500
              ),)
          ],),
      ],
    ),
    );
  }
}
