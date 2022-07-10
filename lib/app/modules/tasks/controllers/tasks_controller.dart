import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:http/http.dart' as http;

import '../../../exports.dart';

/// The controller for the Tasks screen
class TasksController extends GetxController {
  final GetStorage userData = GetStorage();
  Task? task;
  bool isLoading = false;
  String? taskTitle, taskContent;
  TextEditingController? titleController, contentController;

  @override
  void onInit() {
    super.onInit();
    titleController = TextEditingController();
    contentController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    titleController?.dispose();
    contentController?.dispose();
  }

  Future<void> showCurrentTask() async {
    titleController!.text = task!.title!;
    contentController!.text = task!.content!;
  }

  // function to validate creds
  bool validateInput() {
    bool validated = false;
    if (titleController!.text.isNotEmpty) {
      taskTitle = titleController!.text;
      taskContent = contentController!.text;
      validated = true;
    } else {
      validated = false;
    }
    return validated;
  }

  /// Save changes for a task be it a new one or simply updating an old one
  Future<bool?> saveTask() async {
    bool? success;

    if (validateInput()) {
      isLoading = true;
      update();

      bool isConnected = await hasReliableInternetConnectivity();

      if (isConnected) {
        final EventObject? eventObject = await httpPost(
          client: http.Client(),
          //appending the primary key is where the difference of updating vs new task comes in
          url: task != null
              ? ApiConstants.task
              : ApiConstants.task + "/${task!.objectId}",
          data: jsonEncode(<String, String>{
            'title': taskTitle!,
            'content': taskContent!,
          }),
        );

        isLoading = false;
        update();
        try {
          // Give the user the appropriate feedback
          switch (eventObject!.id) {
            case EventConstants.requestSuccessful:
              success = true;
              showToast(
                text: task != null
                    ? "Task updated successfully"
                    : "New task saved successfully",
                state: ToastStates.success,
              );
              Get.offAll(() => HomeView());
              break;

            case EventConstants.requestInvalid:
              success = false;
              showToast(
                text: "Invalid request",
                state: ToastStates.error,
              );
              break;

            case EventConstants.requestUnsuccessful:
              success = false;
              break;

            default:
              showToast(
                text: task != null
                    ? "Updating new task was not successful"
                    : "Saving new task was not successful",
                state: ToastStates.error,
              );
              success = null;
              break;
          }
        } catch (exception) {
          success = null;
        }
      } else {
        showToast(
          text: "You don't seem to have reliable internet connection",
          state: ToastStates.error,
        );
      }
    }
    return success;
  }

  /// Remove a task from the records
  Future<bool?> deleteTask() async {
    bool? success;

    if (validateInput()) {
      isLoading = true;
      update();

      bool isConnected = await hasReliableInternetConnectivity();

      if (isConnected) {
        final EventObject? eventObject = await httpDelete(
          client: http.Client(),
          url: ApiConstants.task + "/${task!.objectId}",
        );

        isLoading = false;
        update();
        try {
          switch (eventObject!.id) {
            // Give the user the appropriate feedback
            case EventConstants.requestSuccessful:
              success = true;
              showToast(
                text: "Task deleted successfully",
                state: ToastStates.success,
              );
              Get.offAll(() => HomeView());
              break;

            case EventConstants.requestInvalid:
              success = false;
              showToast(
                text: "Invalid request",
                state: ToastStates.error,
              );
              break;

            case EventConstants.requestUnsuccessful:
              success = false;
              break;

            default:
              showToast(
                text: "Deleting task was not successful",
                state: ToastStates.error,
              );
              success = null;
              break;
          }
        } catch (exception) {
          success = null;
        }
      } else {
        showToast(
          text: "You don't seem to have reliable internet connection",
          state: ToastStates.error,
        );
      }
    }
    return success;
  }

  Future<void> confirmCancel(BuildContext context) async {
    if (validateInput()) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(
            'Just a Minute',
            style: appBarTextStyle.copyWith(fontSize: 18),
          ),
          content: Text(
            'Are you sure you want to close without saving your changes of the task: ${titleController!.text}?',
            style: appBarTextStyle.copyWith(fontSize: 14),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                saveTask();
              },
              child: const Text("SAVE"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Get.back();
              },
              child: const Text("DON'T SAVE"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("CANCEL"),
            ),
          ],
        ),
      );
    } else {
      Get.back();
    }
  }

  Future<void> confirmDelete(BuildContext context) async {
    if (validateInput()) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(
            'Just a Minute',
            style: appBarTextStyle.copyWith(fontSize: 18),
          ),
          content: Text(
            'Are you sure you want to delete the task: ${titleController!.text}?',
            style: appBarTextStyle.copyWith(fontSize: 14),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                deleteTask();
              },
              child: const Text("DELETE"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("CANCEL"),
            ),
          ],
        ),
      );
    } else {
      Get.back();
    }
  }
}
