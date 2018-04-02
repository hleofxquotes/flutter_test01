import 'dart:convert';

import "package:test/test.dart";

import "package:hello_world/user.dart";

void main() {
  test("JsonSerializable", () {
    final user = new User('Hung Le', 'hle999@gmail.com');
    final userJson = _encode(user);
    final user2 =
        new User.fromJson(json.decode(userJson) as Map<String, dynamic>);

    expect(user.name, user2.name);
    expect(user.email, user2.email);

    expect(_encode(user2), equals(userJson));
  });
}

String _encode(Object object) =>
    const JsonEncoder.withIndent(' ').convert(object);
