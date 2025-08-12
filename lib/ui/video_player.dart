
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(MaterialApp(
    home: VideoPlayerDemo(),
  ));
}

class VideoPlayerDemo extends StatefulWidget {
  const VideoPlayerDemo({super.key});

  @override
  State<StatefulWidget> createState() => _VideoPlayerDemoState();
}

class _VideoPlayerDemoState extends State<VideoPlayerDemo> {
  late VideoPlayerController _controller;
  
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
        Uri.parse('https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'))
    ..initialize().then((_) {
        setState(() {});  // 초기화 완료 후 UI 갱신
        _controller.play(); // 자동 재생
    });
  }

  @override
  void dispose() {
    _controller.dispose();//컨트롤러 메모리 해제
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Video Player Demo'),),
      body: Center(
        child: _controller.value.isInitialized
          ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),)
          : CircularProgressIndicator(), // 로딩 표시
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              //재생/일시정지 토글
              _controller.value.isPlaying ? _controller.pause() : _controller.play();
            });
          },
          child: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),),
    );
  }
}