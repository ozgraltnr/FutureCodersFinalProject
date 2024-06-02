import 'dart:io';
import 'package:bitirme_projesi/courses/devam_edilen_kurslar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'kurs_model.dart';
import 'navbar.dart';
import 'new_courses_widget.dart'; // Course modelini içeri aktarın

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  List<Course>? _courses;
  bool _isLoading = false;
  late final Dio dio;
  final _baseUrl = '';

  @override
  void initState() {
    super.initState();
    fetchCourses();
    }

  void _changeLoading(){
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  // Verileri çeken asenkron fonksiyon
  Future<void> fetchCourses() async {
    _changeLoading();
    final response = await Dio().get('https://jsonplaceholder.typicode.com/posts');
    if(response.statusCode == HttpStatus.ok){
      final _datas = response.data;

      if(_datas is List){
        setState(() {
          _courses = _datas.map((e) => Course.fromJson(e)).toList();
        });
      }
    }
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Merhaba',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w500
                          ),),
                        Text(
                          'Ne Öğrenmek İstersin?',
                          style: TextStyle(
                            color: Colors.white54,
                          ),
                        ),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        'images/profil.png',
                        height: 60,
                        width: 60,
                      ),
                    )
                  ],
                ),
              ),

              Container(
                height: 60,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: const Color(0xFF292B37),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Row(children: [
                  const Icon(Icons.search, color: Colors.white54, size: 30,),
                  Container(
                    width: 300,
                    margin: const EdgeInsets.only(left: 5),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search",
                          hintStyle: TextStyle(color: Colors.white54)
                      ),
                    ),
                  )
                ],),
              ),
              const SizedBox(height: 30,),
              // Kullanıcının izlediği kurslar bölümü
              if (_courses != null)
                const DevamEdilenKurs(),
              const SizedBox(height: 30,),
              // Diğer kurslar bölümü
              if (_courses != null)
                const NewCoursesWidget(),

              // Yükleme durumu göstergesi
              if (_isLoading) const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomNavBar(),

    );
  }
}