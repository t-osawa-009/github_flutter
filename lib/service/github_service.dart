import 'dart:async';
import 'dart:convert';
import 'package:github_flutter/model/github_repo.dart';
import 'package:http/http.dart' as http;

class GithubService {

  static Future<List<GithubRepo>> fetchGithubRepos(String query) async {
    var url = 'https://api.github.com/search/repositories?sort=stars&q=';
    final response = await http.get(Uri.parse(url + query));
    if (response.statusCode == 200) {
      Map<String, dynamic> decoded = json.decode(response.body);
      List<GithubRepo> list = [];
      final List<dynamic> items = decoded['items'];
      items.forEach((item) => 
        list.add(GithubRepo.fromJson(item))
      );
      return list;
    } else {
      throw Exception('Failed to load GithubRepo');
    }
  }
}
