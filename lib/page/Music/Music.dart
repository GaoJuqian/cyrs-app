import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Music extends StatefulWidget {
  const Music({super.key});

  @override
  State<Music> createState() => _MusicState();
}

class _MusicState extends State<Music> {
  AudioPlayer audioPlayer = AudioPlayer();

  _play() async {
    AudioPlayer.global.setGlobalAudioContext(
      const AudioContext(
          android: AudioContextAndroid(),
          iOS: AudioContextIOS(category: AVAudioSessionCategory.ambient)),
    );

    await audioPlayer.play(DeviceFileSource(
        "https://ls-sycdn.kuwo.cn/9e7f7fa1312e668f30cf7c4f0921b8db/63ea4741/resource/n3/21/34/2437156837.mp3"));
  }

  _stop() async {
    await audioPlayer.stop();
  }

  @override
  void initState() {
    super.initState();
    _play();
    print("initState");
  }

  @override
  void dispose() {
    super.dispose();
    _stop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Music'),
    );
  }
}
