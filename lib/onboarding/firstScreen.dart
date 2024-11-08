import 'package:flutter/material.dart';
import 'package:love_bird/config/routes.dart';

import 'package:video_player/video_player.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  void _initializeVideoPlayer() {
    _controller = VideoPlayerController.asset('assets/images/video.mp4')
      ..setLooping(true)
      ..initialize().then((_) {
        setState(() {});
        //   _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildVideoPlayer(),
      floatingActionButton: _buildFloatingActionButton(context),
    );
  }

  Widget _buildVideoPlayer() {
    return _controller.value.isInitialized
        ? SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _controller.value.size.width,
                height: _controller.value.size.height,
                child: VideoPlayer(_controller),
              ),
            ),
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }

  Widget _buildFloatingActionButton(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: GestureDetector(
          onTap: () {
            // _controller.pause();
            _navigateToSignUpScreen(context);
          },
          child: _buildButton(),
        ),
      ),
    );
  }

  Widget _buildButton() {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      width: 80,
      height: 80,
      child: ClipOval(
        child: Image.asset(
          'assets/images/Vectorarr.png',
          height: 30,
          width: 20,
        ),
      ),
    );
  }

  void _navigateToSignUpScreen(BuildContext context) {
    Navigator.pushNamed(context, slideableOnboardingScreen);
  }
}
