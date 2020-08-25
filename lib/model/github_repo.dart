import 'dart:convert';

class GithubRepo {
  final String name;
  final int starCount;
  final String avatarURL;
  final String htmlUrl;

  GithubRepo({this.name, this.starCount, this.avatarURL, this.htmlUrl});

  factory GithubRepo.fromJson(Map<String, dynamic> json) {
    Map<String, Object> owner = json['owner'];
    return GithubRepo(
        name: json['full_name'],
       starCount: json['stargazers_count'],
       avatarURL: owner['avatar_url'],
       htmlUrl: json['html_url'],
      );
  }
}
