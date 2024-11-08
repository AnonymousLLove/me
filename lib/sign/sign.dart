import 'package:flutter/material.dart';
import 'package:love_bird/config/routes.dart';
import 'package:video_player/video_player.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset('assets/images/loginVideo.mp4')
      ..setLooping(true)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          _buildVideoBackground(),
          _buildOverlay(),
          _buildContent(screenSize),
        ],
      ),
    );
  }

  Widget _buildVideoBackground() {
    return Positioned.fill(
      child: _controller.value.isInitialized
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
          : Container(color: Colors.black),
    );
  }

  Widget _buildOverlay() {
    return Positioned.fill(
      child: Container(
        color: Colors.black.withOpacity(0.5),
      ),
    );
  }

  Widget _buildContent(Size screenSize) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 60.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildHeader(screenSize),
            _buildSignInOptions(screenSize),
            const SizedBox(width: 20),
            _buildSignUpOption(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(Size screenSize) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/loveBird.png',
          height: screenSize.height * 0.15,
          width: screenSize.width * 0.3,
        ),
        const SizedBox(height: 20),
        const Text(
          'Love Bird',
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'Kaushan Script',
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "Let's get you started",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }

  Widget _buildSignInOptions(Size screenSize) {
    return Column(
      children: [
        SignInButton(
          imagePath: 'assets/images/icons/icons8-google-48.png',
          label: 'Continue with Google',
          onPressed: () {},
        ),
        const SizedBox(height: 30),
        SignInButton(
          imagePath: 'assets/images/icons/icons8-apple-50.png',
          label: 'Continue with Apple',
          onPressed: () {},
        ),
        const SizedBox(height: 30),
        SignInButton(
          imagePath: 'assets/images/icons/x.png',
          label: 'Continue with X',
          onPressed: () {},
        ),
        const SizedBox(height: 30),
        SignInButton(
          imagePath: 'assets/images/icons/facebook.png',
          label: 'Continue with Facebook',
          onPressed: () {},
        ),
        const SizedBox(height: 100),
        _buildLoginButton(screenSize),
      ],
    );
  }

  Widget _buildLoginButton(Size screenSize) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, loginPage);
      },
      child: Container(
        width: screenSize.width * 0.8,
        height: screenSize.height * 0.05,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(54, 40, 221, 1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Center(
          child: Text(
            'Login',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpOption() {
    return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, createAccountRoute);
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account?",
                style: TextStyle(
                    color: Color.fromRGBO(54, 40, 221, 1),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 5),
              Text(
                "Sign Up",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ));
  }
}

class SignInButton extends StatelessWidget {
  final String imagePath;
  final String label;
  final VoidCallback onPressed;

  const SignInButton({
    super.key,
    required this.imagePath,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: screenSize.width * 0.8,
        height: screenSize.height * 0.05,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(54, 40, 221, 1),
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Image.asset(
                imagePath,
                height: 30,
              ),
            ),
            const SizedBox(width: 50),
            Text(
              label,
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
