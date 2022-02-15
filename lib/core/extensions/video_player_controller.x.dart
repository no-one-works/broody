import 'package:flutter_vlc_player/flutter_vlc_player.dart';
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

extension VlcPlayerControllerX on VlcPlayerController {
  Future<void> togglePlayback() {
    if (value.isPlaying) {
      return pause();
    } else {
      return play();
    }
  }

  Future<void> setVolumeRelative(double value) async {
    final intValue = (value * 100).round().clamp(0, 100);
//    return setVolume(intValue);
  }
}
