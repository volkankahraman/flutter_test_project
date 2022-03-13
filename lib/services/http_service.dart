import 'dart:convert';
import 'package:flutter_test_project/models/post.dart';
import 'package:http/http.dart' as http;

class HttpService {
  final int _limit = 5;
  final String _apiUrl = "http://10.0.2.2:3000";

  Future<List<Post>> getPosts({required int page}) async {
    final response = await http
        .get(Uri.parse(
            "$_apiUrl/posts?_limit=$_limit&_page=$page&_order=desc&_sort=id"))
        .timeout(
          const Duration(seconds: 5),
        );
    final posts = postFromJson(response.body);
    return posts;
  }

  Future<Post> createPost(Post _post) async {
    try {
      final response = await http.post(
        Uri.parse("$_apiUrl/posts"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(_post.toJson()),
      );
      final post = Post.fromJson(jsonDecode(response.body));
      return post;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future deletePost(id) async {
    try {
      await http.delete(Uri.parse("$_apiUrl/posts/$id"));
    } catch (e) {
      return Future.error(e);
    }
  }
}
