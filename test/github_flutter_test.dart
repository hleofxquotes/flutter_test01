import 'dart:convert';

import "package:test/test.dart";
import 'package:http/http.dart' as http;

import "package:hello_world/github_repo.dart";

void main() {
  var client;
  setUp(() async {
    client = new http.Client();
  });

  tearDown(() async {
    await client.close();
    client = null;
  });

  test("get single repo", () async {
    var url = 'https://api.github.com/repos/flutter/flutter';
    var response = await http.get(url);
    expect(response.statusCode, equals(200));

    final githubRepo = new GithubRepo.fromJson(json.decode(response.body));

    expect(githubRepo.name, 'flutter');
    expect(githubRepo.fullName, 'flutter/flutter');
  });

  test("get list of repos", () async {
    var url = 'https://api.github.com/orgs/flutter/repos';
    var response = await http.get(url);
    expect(response.statusCode, equals(200));

//    const JsonCodec json = const JsonCodec();
    var repoMaps = json.decode(response.body);
    List<GithubRepo> repos = repoMaps.map((repoMap) {
      return new GithubRepo.fromJson(repoMap);
    }).toList();
    expect(repos.length, greaterThan(1));

    for (var repo in repos) {
      expect(repo.id, greaterThan(0));
      expect(repo.name, isNotEmpty);
    }
  });
}

//String _encode(Object object) =>
//    const JsonEncoder.withIndent(' ').convert(object);
