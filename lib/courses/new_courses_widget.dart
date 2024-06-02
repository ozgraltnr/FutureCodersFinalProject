
import 'package:bitirme_projesi/courses/kurs_model.dart';
import 'package:flutter/material.dart';
// Course modelini içeri aktarın

class NewCoursesWidget extends StatefulWidget {
  const NewCoursesWidget({Key? key}) : super(key: key);

  @override
  State<NewCoursesWidget> createState() => _NewCoursesWidgetState();
}

class _NewCoursesWidgetState extends State<NewCoursesWidget> {
  List<Course>? courses;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Devam Edilen Kurs",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "Hepsini görüntüle",
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 12
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: courses?.map((course) {
              return Padding(
                padding: const EdgeInsets.only(),
                child: InkWell(
                  onTap: () {
                    // Kursa tıklandığında yapılacak işlemler
                  },
                  child: Container(
                    width: 140,
                    height: 270,
                    margin: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFF292B37),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF292B37).withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          child: Image.network(
                            course?.coursethumbnail ?? '',
                            height: 190,
                            width: 190,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                course?.coursename ?? '', // Kurs adı
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Icon(Icons.star, color: Colors.amber),
                                  Text(
                                    course?.isRequire?.toString() ?? '', // Derecelendirme
                                    style: const TextStyle(
                                      color: Colors.white54,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList() ??
                [const SizedBox(height: 200,)], // Eğer _courses null ise boş bir SizedBox döndürür
          ),
        ),
      ],
    );
  }
}