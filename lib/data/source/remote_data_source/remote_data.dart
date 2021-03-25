

import 'dart:convert';
import 'package:posts_app/data/model/post_model.dart';
import 'package:dio/dio.dart';

class RemoteDataSource {
  final String _endpoint = "https://jsonplaceholder.typicode.com/posts";
  final Dio _dio ;


  RemoteDataSource(this._dio);

  Future<List<PostModel>> getPosts()async{
    List<PostModel> posts=[];

    try {
      Response<String> response = await _dio.get(_endpoint);
      var data = json.decode(response.data);
      data.map((post)=>posts.add(PostModel.fromJson(post))).toList();

      return posts;


    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return posts;
    }

  }




}