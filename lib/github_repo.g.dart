// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_repo.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

GithubRepo _$GithubRepoFromJson(Map<String, dynamic> json) => new GithubRepo(
    json['id'] as int, json['name'] as String, json['full_name'] as String);

abstract class _$GithubRepoSerializerMixin {
  int get id;
  String get name;
  String get fullName;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'id': id, 'name': name, 'full_name': fullName};
}

GithubRepos _$GithubReposFromJson(Map<String, dynamic> json) =>
    new GithubRepos((json['repos'] as List)
        ?.map((e) => e == null
            ? null
            : new GithubRepo.fromJson(e as Map<String, dynamic>))
        ?.toList());

abstract class _$GithubReposSerializerMixin {
  List<GithubRepo> get repos;
  Map<String, dynamic> toJson() => <String, dynamic>{'repos': repos};
}
