import 'dart:io';
import 'package:bitirme_projesi/algoritmik_sinav/algoritmik_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../service.dart';

class AlgoritmikSinav extends StatefulWidget {
  const AlgoritmikSinav({super.key, this.questionId});
  final int? questionId;

  @override
  State<AlgoritmikSinav> createState() => _AlgoritmikSinavState();
}

class _AlgoritmikSinavState extends State<AlgoritmikSinav> {
  List<Question> question = [];
  List<QuestionAnswer>? questionAnswer = [];
  List<QuestionOption> questionOption = [];
  List<QuestionType>? questionType = [];
  String? name;
  bool _isLoading = false;
  late final Dio _dio;
  final _baseUrl = 'https://jsonplaceholder.typicode.com/';

  // TEST EDILEBILIR KOD BASLADI
  late final IPostService _postService;


  @override
  void initState() {
    super.initState();
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
    _postService = PostService();
    name = 'Algoritmik Sinav';
    fetchQuestions();
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> fetchQuestions() async {
    _changeLoading();
    final response = await Dio().get(
        'https://jsonplaceholder.typicode.com/posts');
    if (response.statusCode == HttpStatus.ok) {
      final _datas = response.data;

      if (_datas is List) {
        setState(() {
          question = _datas.map((e) => Question.fromJson(e)).toList();
        });
      }
    }
    _changeLoading();
  }

  Future<void> fetchQuestionAnswer() async {
    _changeLoading();
    final response = await Dio().get(
        'https://jsonplaceholder.typicode.com/posts');
    if (response.statusCode == HttpStatus.ok) {
      final _datas = response.data;

      if (_datas is List) {
        setState(() {
          questionAnswer =
              _datas.map((e) => QuestionAnswer.fromJson(e)).toList();
        });
      }
    }
    _changeLoading();
  }

  Future<void> fetchQuestionOption() async {
    _changeLoading();
    final response = await Dio().get(
        'https://jsonplaceholder.typicode.com/posts');
    if (response.statusCode == HttpStatus.ok) {
      final _datas = response.data;

      if (_datas is List) {
        setState(() {
          questionOption =
              _datas.map((e) => QuestionOption.fromJson(e)).toList();
        });
      }
    }
    _changeLoading();
  }

  Future<void> fetchQuestionType() async {
    _changeLoading();
    final response = await Dio().get(
        'https://jsonplaceholder.typicode.com/posts');
    if (response.statusCode == HttpStatus.ok) {
      final _datas = response.data;

      if (_datas is List) {
        setState(() {
          questionType = _datas.map((e) => QuestionType.fromJson(e)).toList();
        });
      }
    }
    _changeLoading();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F111D),
        title: const Text('Algoritmik Sinav', style: TextStyle(color: Colors.white),),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : question.isNotEmpty
          ? ListView.builder(
        itemCount: question.length,
        itemBuilder: (context, index) {
          return _buildQuestionCard(question: null, questionOption: null);
        },
      )
          : const SizedBox(child: Text('Veri Bulunamadı!')),

    );
  }
}

  class _buildQuestionCard extends StatelessWidget {

   _buildQuestionCard({
    required question, required questionOption,
  }) : _question = question, _questionOption = questionOption;

  final Question? _question;
  QuestionAnswer? _questionAnswer;
  final QuestionOption? _questionOption;
  QuestionType? _questionType;

    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Card(
          color: Colors.black26,
          child: Column(
            children: [
              ListTile(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AlgoritmikSinav(questionId: _question?.Id),
                  ));
                },
                contentPadding: EdgeInsets.all(20),
                title: Text(_question?.QuestionText ?? 'Soruların Gözükeceği Alan', style: const TextStyle(color: Colors.white70),),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_question?.QuestionOptions ?? 'Şıkların Gözükeceği Alan', style: const TextStyle(color: Colors.white54),),
                    // QuestionId'ler için ayrı Text widget'ları
                    const SizedBox(height: 5),
                    Text('1. Seçenek: ${_questionOption?.QuestionId}', style: const TextStyle(color: Colors.white54),),
                    Text('2. Seçenek: ${_questionOption?.QuestionId}', style: const TextStyle(color: Colors.white54),),
                    Text('3. Seçenek: ${_questionOption?.QuestionId}', style: const TextStyle(color: Colors.white54),),
                    Text('4. Seçenek: ${_questionOption?.QuestionId}', style: const TextStyle(color: Colors.white54),),
                  ],
                ),
              ),

            ],
          ),
        ),
      );
    }
}
