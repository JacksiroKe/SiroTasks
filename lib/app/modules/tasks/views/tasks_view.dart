import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../exports.dart';

/// Tasks screen after Tasks
// ignore: must_be_immutable
class TasksView extends StatelessWidget {
  final TasksController controller = Get.put(TasksController());
  final GetStorage userData = GetStorage();
  final Task? currentTask;
  Size? size;

  TasksView({Key? key, this.currentTask}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = Get.size;
    if (currentTask != null) {
      controller.task = currentTask;
      controller.showCurrentTask();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppConstants.taskTitle,
          style: appBarTextStyle.copyWith(fontSize: 25),
        ),
        actions: [
          currentTask != null
              ? InkWell(
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.delete),
                  ),
                  onTap: () => controller.confirmDelete(context),
                )
              : InkWell(
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.clear),
                  ),
                  onTap: () => controller.confirmCancel(context),
                ),
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          child: GetBuilder<TasksController>(
            builder: (controller) =>
                controller.isLoading ? const CircularProgress() : inputForm(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.saveTask();
        },
        backgroundColor: AppColors.primaryColor,
        child: const Icon(Icons.save, color: AppColors.white),
      ),
    );
  }

  Widget inputForm() {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Column(
        children: <Widget>[
          FormInput(
            iLabel: 'Title',
            iController: controller.titleController!,
            prefix: const Icon(Icons.text_fields),
            iOptions: const <String>[],
          ),
          FormInput(
            iLabel: 'Description',
            iController: controller.contentController!,
            isMultiline: true,
            iType: TextInputType.multiline,
            iOptions: const <String>[],
          ),
        ],
      ),
    );
  }
}
