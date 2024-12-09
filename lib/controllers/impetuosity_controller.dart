import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class ImpetuosityController extends GetxController {
  final FlutterTts flutterTts = FlutterTts();
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  var currentStep = 0.obs;
  var isMuted = false.obs;
  var completedTasks = <String>[].obs;

  final List<Map<String, String>> tasks = [
    {
      'title': 'Derin Nefes Egzersizi',
      'description':
      'Bir dakika boyunca burnundan derin nefes al, nefesini tut ve yavaşça ver. Bu egzersizi günde 5 kez tekrarla.',
    },
    {
      'title': 'Etrafını Gözlemle',
      'description':
      'Bir odada 5 dakika boyunca otur ve etrafındaki tüm nesneleri detaylı bir şekilde incele. Daha önce fark etmediğin detayları not al.',
    },
    // Diğer görevler burada devam eder.
  ];

  @override
  void onInit() {
    super.onInit();
    _configureTTS();
  }

  void _configureTTS() async {
    await flutterTts.setLanguage("tr-TR");
    await flutterTts.setSpeechRate(0.3);
    await flutterTts.setPitch(1.0);
  }

  void speak(String text) async {
    if (!isMuted.value) {
      await flutterTts.speak(text);
    }
  }

  void completeTask() async {
    if (currentStep.value < tasks.length - 1) {
      final taskTitle = tasks[currentStep.value]['title']!;
      completedTasks.add(taskTitle);
      currentStep.value++;
      speak(tasks[currentStep.value]['description']!);

      // Log event for task completion
      await analytics.logEvent(
        name: 'task_completed',
        parameters: {
          'task_title': taskTitle,
          'current_step': currentStep.value,
        },
      );
    } else {
      Get.snackbar(
        'Tebrikler!',
        'Tüm görevleri tamamladınız!',
        snackPosition: SnackPosition.BOTTOM,
      );

      // Log event for all tasks completion
      await analytics.logEvent(
        name: 'all_tasks_completed',
        parameters: {
          'total_tasks': tasks.length,
        },
      );
    }
  }

  void resetTasks() async {
    currentStep.value = 0;
    completedTasks.clear();

    // Log event for task reset
    await analytics.logEvent(
      name: 'tasks_reset',
      parameters: {
        'reset_time': DateTime.now().toIso8601String(),
      },
    );
  }
}
