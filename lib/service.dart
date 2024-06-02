import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'courses/kurs_model.dart';

abstract class IPostService {
  Future<bool> addItemToService(Course course);
  Future<bool> putItemToService(Course course, int id);
  Future<bool> deleteItemToService(Course course, int id);
  Future<List<Course>?> fetchPostItemsAdvance();
}


class PostService implements IPostService{
  final Dio _dio;
  PostService() : _dio = Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'));

  @override
  Future<bool> addItemToService(Course course) async {
    try{
      final response = await _dio.post(_PostServicePaths.posts.name, data: course);
      return response.statusCode == HttpStatus.created;
    } on DioException catch(error){
      _ShowDebug.showDioError(error, this);
    }
    return false;
  }


  @override
  Future<bool> putItemToService(Course course, int id) async {
    try{
      final response = await _dio.put('${_PostServicePaths.posts.name}/$id', data: course);
      return response.statusCode == HttpStatus.ok;
    } on DioException catch(error){
      _ShowDebug.showDioError(error, this);
    }
    return false;
  }

  @override
  Future<bool> deleteItemToService(Course postModel, int id) async {
    try{
      final response = await _dio.put('${_PostServicePaths.posts.name}/$id');
      return response.statusCode == HttpStatus.ok;
    } on DioException catch(error){
      _ShowDebug.showDioError(error, this);
    }
    return false;
  }

  @override
  Future<List<Course>?> fetchPostItemsAdvance() async {
    try {
      final response = await _dio.get(_PostServicePaths.posts.name);
      if(response.statusCode == HttpStatus.ok){
        final _datas = response.data;

        if(_datas is List){
          return _datas.map((e) => Course.fromJson(e)).toList();
        }
      }
    } on DioException catch (exception){
      _ShowDebug.showDioError(exception, this);
    }
    return null;
  }

  @override
  Future<Iterable<dynamic>?> fetchRelatedCommentsWithPostId(int postId) async {
    try {
      final response = await _dio.get(_PostServicePaths.posts.name, queryParameters: {_PostQueryPaths.postId.name: postId});
      if(response.statusCode == HttpStatus.ok){
        final _datas = response.data;

        if(_datas is List){
          //return _datas.map((e) => PostModel();
        }
      }
    } on DioException catch (exception){
      _ShowDebug.showDioError(exception, this);
    }
    return null;
  }
}

enum _PostServicePaths { posts }
enum _PostQueryPaths { postId }


class _ShowDebug {
  static void showDioError<T>(DioException error, T type) {
    if (kDebugMode) {
      print(error.message);
      print(type);
      print('-----');
    }
  }
}