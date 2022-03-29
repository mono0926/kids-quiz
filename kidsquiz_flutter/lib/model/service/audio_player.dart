import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final audioPlayerProvider = Provider((ref) => const AudioPlayer());
final _audioPlayer = AudioCache(prefix: 'assets/sound/');

class AudioPlayer {
  const AudioPlayer();

  void play(String filename) {
    _audioPlayer.play(filename);
  }
}
