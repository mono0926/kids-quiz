import 'package:audioplayers/audioplayers.dart' as ap;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'audio_player.g.dart';

@riverpod
AudioPlayer audioPlayer(AudioPlayerRef ref) => const AudioPlayer();
final _audioPlayer = ap.AudioPlayer();

class AudioPlayer {
  const AudioPlayer();

  void play(String filename) {
    _audioPlayer.play(ap.AssetSource('sound/$filename'));
  }
}
