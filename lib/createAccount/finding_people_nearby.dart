import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:love_bird/homeScreen/homeScreen.dart';

class FindingPeopleNearBy extends StatefulWidget {
  final List<File?> images;
  const FindingPeopleNearBy({super.key, required this.images});

  @override
  _FindingPeopleNearByState createState() => _FindingPeopleNearByState();
}

class _FindingPeopleNearByState extends State<FindingPeopleNearBy>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Timer _dotTimer;
  int _dotCount = 0;
  List<ui.Image?> _loadedImages = [];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _dotTimer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        _dotCount = (_dotCount + 1) % 4;
      });
    });

    _loadImages();

    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _dotTimer.cancel();
    super.dispose();
  }

  Future<void> _loadImages() async {
    List<Future<ui.Image?>> imageFutures = widget.images.map((file) async {
      if (file != null) {
        final data = await file.readAsBytes();
        return await decodeImageFromList(data);
      }
      return null;
    }).toList();

    // Load images concurrently
    final List<ui.Image?> loadedImages = await Future.wait(imageFutures);

    // Update state once all images are loaded
    setState(() {
      _loadedImages = loadedImages
          .where((image) => image != null)
          .cast<ui.Image?>()
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    String dots = '.' * _dotCount;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return CustomPaint(
                    painter: CirclePainter(
                        animationValue: _animationController.value,
                        images: _loadedImages),
                  );
                },
              ),
            ),
            const SizedBox(height: 50),
            Text(
              'Finding People Nearby$dots',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3628DD),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  final double animationValue;
  final List<ui.Image?> images;

  CirclePainter({required this.animationValue, required this.images});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    double baseInnerCircleRadius = size.width * .32;
    double baseMiddleCircleRadius = size.width * .42;
    double baseOuterCircleRadius = size.width * .52;

    double animatedInnerCircleRadius =
        baseInnerCircleRadius + (10 * animationValue);
    double animatedMiddleCircleRadius =
        baseMiddleCircleRadius + (15 * animationValue);
    double animatedOuterCircleRadius =
        baseOuterCircleRadius + (20 * animationValue);

    const double ringThickness = 20;

    final List<Color> ringColors = [
      const Color(0xFF3628DD).withOpacity(0.19),
      const Color(0xFF3628DD).withOpacity(0.57),
      const Color(0xFF4E41E8),
    ];

    _drawConcentricCircles(canvas, center, [
      CircleInfo(animatedInnerCircleRadius, ringThickness, ringColors[0]),
      CircleInfo(animatedMiddleCircleRadius, ringThickness, ringColors[1]),
      CircleInfo(animatedOuterCircleRadius, ringThickness, ringColors[2]),
    ]);

    for (var image in images) {
      if (image != null) {
        double imageRadius = animatedInnerCircleRadius;
        Rect imageRect = Rect.fromCircle(center: center, radius: imageRadius);

        canvas.save();
        canvas.clipPath(Path()..addOval(imageRect));
        canvas.drawImageRect(
          image,
          Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()),
          imageRect,
          Paint(),
        );
        canvas.restore();
      }
    }
  }

  void _drawConcentricCircles(
      Canvas canvas, Offset center, List<CircleInfo> circles) {
    final Paint paint = Paint()..style = PaintingStyle.stroke;

    for (CircleInfo circle in circles) {
      paint
        ..color = circle.color
        ..strokeWidth = circle.thickness;
      canvas.drawCircle(center, circle.radius, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate is CirclePainter &&
        (oldDelegate.animationValue != animationValue ||
            oldDelegate.images != images);
  }
}

class CircleInfo {
  final double radius;
  final double thickness;
  final Color color;

  CircleInfo(this.radius, this.thickness, this.color);
}
