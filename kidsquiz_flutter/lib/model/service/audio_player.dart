import 'package:audioplayers/audioplayers.dart' as ap;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final audioPlayerProvider = Provider((ref) => const AudioPlayer());
final _audioPlayer = ap.AudioPlayer();

class AudioPlayer {
  const AudioPlayer();

  void play(String filename) {
    _audioPlayer.play(ap.AssetSource('assets/sound/$filename'));
  }
}
