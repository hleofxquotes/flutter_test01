import 'dart:convert';
import 'package:http/http.dart' as http;

main() async {
  var url = 'https://api.github.com/users/dart-lang/repos';
  var response =
      await http.get(url, headers: {'User-Agent': 'Dart/1.0 (My Dart client)'});

  List<String> repos = JSON.decode(response.body);
  var heading = 'Repository | Star count  | Fork count';
  print(heading);
  print(new List.filled(heading.length, '=').join());
  for (var repo in repos) {
    print("${repo['name']} | "
        "${repo['stargazers_count']} | "
        "${repo['forks_count']}");
  }
}
