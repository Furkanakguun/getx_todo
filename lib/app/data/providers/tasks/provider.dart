import 'dart:convert';
import 'package:get/get.dart';
import 'package:todo_getx/app/core/utils/keys.dart';
import 'package:todo_getx/app/data/models/task.dart';
import 'package:todo_getx/app/data/services/storage/services.dart';

class TaskProvider {
  StorageService storage = Get.find<StorageService>();

  List<Task> readTasks() {
    var tasks = <Task>[];
    jsonDecode(storage.read(taskKey).toString())
        .forEach((e) => tasks.add(Task.fromJson(e)));
    return tasks;
  }

  void writeTasks(List<Task> tasks) {
    storage.write(taskKey, jsonEncode(tasks));
  }
}
