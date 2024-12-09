import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:vibration/vibration.dart';

class AudioVibrationController extends GetxController {
  // AudioPlayer nesnesi
  final AudioPlayer _audioPlayer = AudioPlayer();

  // Ayarlar
  var isSoundEnabled = true.obs;
  var isVibrationEnabled = true.obs;

  // Ses çalma metodu
  Future<void> playSound() async {
    if (isSoundEnabled.value) {
      try {
        await _audioPlayer.play(AssetSource('voices/magic.mp3'));
      } catch (e) {
        print("Ses çalarken hata oluştu: $e");
      }
    } else {
      print("Ses kapalı.");
    }
  }

  // Ses durdurma metodu
  Future<void> stopSound() async {
    await _audioPlayer.stop();
  }

  // Titreşim uygulama metodu
  Future<void> vibrate() async {
    if (isVibrationEnabled.value) {
      if (await Vibration.hasVibrator() ?? false) {
        Vibration.vibrate(duration: 500); // 500 ms süreyle titreşim
      } else {
        print("Cihazda titreşim motoru yok.");
      }
    } else {
      print("Titreşim kapalı.");
    }
  }

  // Ses ve titreşim uygulama metodu
  Future<void> playSoundAndVibrate() async {
    await playSound();
    await vibrate();
  }

  // Ayarları güncelleme metodları
  void toggleSound() {
    isSoundEnabled.value = !isSoundEnabled.value;
  }

  void toggleVibration() {
    isVibrationEnabled.value = !isVibrationEnabled.value;
  }
}