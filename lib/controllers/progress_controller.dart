// Controller to manage user's progress using GetX
import 'package:get/get.dart';

class ProgressController extends GetxController {
  var progress = 0.0.obs; // Track progress as a percentage
  var completedTasks = 0.obs;

  // Simulating progress update
  void updateProgress(double value) {
    progress.value = value;
  }

  void completeTask() {
    completedTasks.value++;
    progress.value = (completedTasks.value / 5) * 100; // Example for 5 tasks
  }
}
