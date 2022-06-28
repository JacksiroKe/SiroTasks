import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sirotodo/app/exports.dart';

import 'http_post_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('httpPost', () {
    test('returns a response if the http call completes successfully',
        () async {
      final mockClient = MockClient();
      when(
        mockClient.post(
          Uri.parse(ApiConstants.parseUrl + ApiConstants.todo),
          headers: <String, String>{
            'X-Parse-Application-Id': ApiConstants.parseAppID,
            'X-Parse-REST-API-Key': ApiConstants.parseApiKey,
            'Content-Type': 'application/json',
          },
        ),
      ).thenAnswer(
        (_) async => http.Response(
          '{"results":[{"objectId":"E1D3KXRT4V","title":"Test of the Todo","content":"Just the brrief description of everything here","createdAt":"2022-06-26T20:35:18.990Z","updatedAt":"2022-06-26T20:35:18.990Z"}]}',
          200,
        ),
      );

      expect(await httpPost(client: mockClient, url: ApiConstants.todo), isA<EventObject>());
    });

    test('throws an exception if the http call completes with an error', () {
      final mockClient = MockClient();
      when(
        mockClient.post(
          Uri.parse(ApiConstants.parseUrl + ApiConstants.todo),
          headers: <String, String>{
            'X-Parse-Application-Id': ApiConstants.parseAppID,
            'X-Parse-REST-API-Key': ApiConstants.parseApiKey,
            'Content-Type': 'application/json',
          },
        ),
      ).thenAnswer((_) async => http.Response('Not Found', 404));

      expect(httpGet(client: mockClient, url: ApiConstants.todo), throwsException);
    });
  });
}
