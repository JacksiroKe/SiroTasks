import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sirotodo/app/exports.dart';

import 'todos_controller_test.mocks.dart';

@GenerateMocks([TodosController])
void main() {
  test('check if saveTask works as expected', () async {
    final controller = MockTodosController();

    when(controller.saveTask()).thenAnswer((_) async => true);
    controller.saveTask();
    verify(controller.saveTask());
  });
}
