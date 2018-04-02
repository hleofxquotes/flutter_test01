import 'package:json_annotation/json_annotation.dart';

// flutter packages pub run build_runner build

/// This allows our `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'github_repo.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()

/// Every json_serializable class must have the serializer mixin.
/// It makes the generated toJson() method to be usable for the class.
/// The mixin's name follows the source class, in this case, User.
class GithubRepo extends Object with _$GithubRepoSerializerMixin {
  GithubRepo(this.id, this.name, this.fullName);

  final int id;
  final String name;
  @JsonKey(name: 'full_name')
  final String fullName;

  /// A necessary factory constructor for creating a new User instance
  /// from a map. We pass the map to the generated _$UserFromJson constructor.
  /// The constructor is named after the source class, in this case User.
  factory GithubRepo.fromJson(Map<String, dynamic> json) =>
      _$GithubRepoFromJson(json);
}

@JsonSerializable()
class GithubRepos extends Object with _$GithubReposSerializerMixin {
  GithubRepos(this.repos);

  final List<GithubRepo> repos;

  factory GithubRepos.fromJson(Map<String, dynamic> json) =>
      _$GithubReposFromJson(json);
}
