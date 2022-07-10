import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../exports.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  final GetStorage userData = GetStorage();
  Size? size;

  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = Get.size;
    controller.fetchTasks();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppConstants.homeTitle,
          style: appBarTextStyle.copyWith(fontSize: 25),
        ),
        actions: [
          InkWell(
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Icon(Icons.search),
            ),
            onTap: () {
              showSearch(
                context: context,
                delegate: SearchDelegater(),
              );
            },
          ),
        ],
      ),
      body: SizedBox(
        child: taskList(context),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(
            () => TasksView(),
            transition: Transition.rightToLeft,
          );
        },
        backgroundColor: AppColors.primaryColor,
        child: const Icon(Icons.add, color: AppColors.white),
      ),
    );
  }

  Widget taskList(BuildContext context) {
    return FutureBuilder<List<Task>?>(
      future: controller.fetchTasks(),
      builder: (BuildContext context, AsyncSnapshot<List<Task>?> snapshot) {
        Widget? widget;

        if (snapshot.hasData) {
          if (snapshot.data!.isNotEmpty) {
            return ListView.builder(
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index) => buildItem(
                context,
                snapshot.data![index],
              ),
              itemCount: snapshot.data!.length,
              controller: controller.listScrollController,
            );
          } else {
            return const Center(
              child: Text("Its emply here, no tasks yet"),
            );
          }
        } else if (snapshot.hasError) {
          widget = Container();
        } else {
          widget = const CircularProgress();
        }
        return widget;
      },
    );
  }

  Widget buildItem(BuildContext context, Task setTask) {
    return SizedBox(
      height: 50,
      child: ListTile(
        leading: const Icon(Icons.task),
        title: Text(
          setTask.title!,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          setTask.content!,
          style: const TextStyle(fontSize: 14),
        ),
        onTap: () {
          Get.to(
            () => TasksView(currentTask: setTask),
            transition: Transition.rightToLeft,
          );
        },
      ),
    );
  }
}
