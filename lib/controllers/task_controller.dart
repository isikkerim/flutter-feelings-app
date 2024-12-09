import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/services.dart' show rootBundle;


class TaskController extends GetxController {
  var levels = <Level>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadLevels();
  }

  Future<void> loadLevels() async {
    try {
      String jsonString = await rootBundle.loadString('assets/jsons/aile_iliskileri.json');
      List<dynamic> jsonResponse = json.decode(jsonString) as List<dynamic>? ?? [];
      List<Level> loadedLevels = jsonResponse.map((data) => Level.fromJson(data as Map<String, dynamic>)).toList();
      levels.value = loadedLevels;
    } catch (e) {
      print('Error loading JSON data: $e');
    }
  }

  void completeTaskForTask(Task task) {
    task.completed = true;
    update();
  }
}


class Task {
  final String task;
  final String description;
  final String duration;
  final int points;
  bool completed;

  Task({
    required this.task,
    required this.description,
    required this.duration,
    required this.points,
    this.completed = false,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      task: json['task'] ?? '',
      description: json['description'] ?? '',
      duration: json['duration'] ?? '',
      points: json['points'] ?? 0,
      completed: json['completed'] ?? false,
    );
  }
}

class Level {
  final String title;
  final List<Task> tasks;

  Level({
    required this.title,
    required this.tasks,
  });

  factory Level.fromJson(Map<String, dynamic> json) {
    var taskList = json['tasks'] as List? ?? [];
    return Level(
      title: json['title'] ?? '',
      tasks: taskList.map((task) => Task.fromJson(task)).toList(),
    );
  }
}

