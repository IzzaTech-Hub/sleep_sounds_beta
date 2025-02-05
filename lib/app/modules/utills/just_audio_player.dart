import 'package:just_audio/just_audio.dart';
import 'package:sleep_sounds_beta/app/data/just_audio_model.dart';
import 'package:sleep_sounds_beta/app/data/more_sounds_model.dart';

class JustAudioPlayer {
  static List<JustAudioModel> justAudioList = [];
  void playSounds(JustAudioModel justAudio, MoreSoundsModel moreSounds) {
    justAudio.audioPlayer = AudioPlayer();
  }
}
