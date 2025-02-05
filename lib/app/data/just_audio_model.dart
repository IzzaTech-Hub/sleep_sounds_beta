import 'package:just_audio/just_audio.dart';
import 'package:get/get.dart';

class JustAudioModel {
  JustAudioModel({
    required this.name,
    required this.icon,
    required this.sound,
    required this.isPlaying,
    required this.audioPlayer,
  });

  String name;
  RxString icon;
  RxString sound;
  RxBool isPlaying;
  AudioPlayer? audioPlayer;
}
