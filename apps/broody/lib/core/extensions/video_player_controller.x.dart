import 'package:video_player/video_player.dart';

extension VideoPlayerControllerX on VideoPlayerController {
  Future<void> togglePlayback() {
    if (value.isPlaying) {
      return pause();
    } else {
      return play();
    }
  }
}
