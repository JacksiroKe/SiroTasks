import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sirotask/app/exports.dart';

import 'home_controller_test.mocks.dart';

@GenerateMocks([HomeController])
void main() {
  group('home provider', () {
    test('check if fetchTasks works as expected', () async {
      final controller = MockHomeController();

      when(
        controller.fetchTasks(),
      ).thenAnswer(
        (_) async => controller.tasks = [
          Task(title: 'this task'),
        ],
      );
      controller.fetchTasks();

      verify(controller.fetchTasks());
    });
  });
}
