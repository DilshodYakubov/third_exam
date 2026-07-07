import 'package:just_audio/just_audio.dart';

class PlayerController {
  final AudioPlayer player = AudioPlayer();

  Future<void> init() async {
    await player.setAsset("assets/audio/book.mp3");
  }

  Future<void> dispose() async {
    await player.dispose();
  }
}
