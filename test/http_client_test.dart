import "package:test/test.dart";
import 'package:http/http.dart' as http;

void main() {
  var client;
  setUp(() async {
    client = new http.Client();
  });

  tearDown(() async {
    await client.close();
    client = null;
  });

  test("http.get() send GET request to google", () async {
    var url = 'http://www.google.com/';
    var response = await http.get(url);
    expect(response.statusCode, equals(200));
  });

}
