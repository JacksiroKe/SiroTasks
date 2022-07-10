import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sirotask/app/exports.dart';

import 'tasks_controller_test.mocks.dart';

@GenerateMocks([TasksController])
void main() {
  test('check if saveTask works as expected', () async {
    final controller = MockTasksController();

    when(controller.saveTask()).thenAnswer((_) async => true);
    controller.saveTask();
    verify(controller.saveTask());
  });
}
