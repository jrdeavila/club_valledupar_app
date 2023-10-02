import 'package:club_valledupar_app/lib.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CacheValidatorService', () {
    late ValidatorService service;

    setUp(() {
      service = CacheValidatorService();
    });

    test('deleteErrors should emit an empty map', () {
      service.onListen(expectAsync1((Map<String, List> result) {
        expect(result, isEmpty);
      }));

      service.deleteErrors();
    });

    test('saveErrors should emit a map of errors', () {
      final errors = {
        'email': ['The email field is required.']
      };

      service.onListen(expectAsync1((Map<String, List> result) {
        expect(result, equals(errors));
      }));

      service.saveErrors(errors);
    });
  });
}
