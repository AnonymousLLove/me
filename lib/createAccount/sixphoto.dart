import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:love_bird/createAccount/image.dart';
import 'package:love_bird/createAccount/imageScanner.dart';
import 'package:love_bird/createAccount/location.dart';
//import 'package:love_bird/createAccount/photoVer.dart';

class UploadPicturesScreen extends StatefulWidget {
  const UploadPicturesScreen({super.key});

  @override
  _UploadPicturesScreenState createState() => _UploadPicturesScreenState();
}

class _UploadPicturesScreenState extends State<UploadPicturesScreen> {
  List<File?> images = List.filled(9, null); // Stores up to 9 images
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(int index, ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        images[index] = File(pickedFile.path);
      });
    }
  }

  void _removeImage(int index) {
    setState(() {
      images[index] = null;
    });
  }

  Widget _buildImageGrid() {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 20,
      ),
      itemCount: 9, // Total images or slots
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => _showImageSourceActionSheet(index),
          child: Stack(
            clipBehavior:
                Clip.none, // Allows elements to overflow outside the grid item
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: images[index] == null
                    ? const Center(
                        child: Icon(Icons.add, size: 24, color: Colors.grey))
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          images[index]!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
              ),
              if (images[index] != null)
                Positioned(
                  top: -8,
                  right: -8,
                  child: GestureDetector(
                    onTap: () => _removeImage(index),
                    child: Container(
                      color: Colors.red,
                      padding: const EdgeInsets.all(2),
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  void _showImageSourceActionSheet(int index) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Pick from gallery'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(index, ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Take a photo'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(index, ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Count how many images have been uploaded
    int uploadedImageCount = images.where((image) => image != null).length;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: const LinearProgressIndicator(
                  value: 0.7, // Simulating progress
                  backgroundColor: Color.fromARGB(255, 247, 243, 243),
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color.fromRGBO(54, 40, 221, 1),
                  ),
                  minHeight: 8,
                ),
              ),
            ),
            const SizedBox(height: 25),
            Row(children: [
              const Text('Show Your Best Self',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(width: 5),
              Image.asset('assets/images/six.png', width: 40)
            ]),
            const Text(
              'Upload at least 6 of your best pictures to make a great first impression.',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            _buildImageGrid(),
            const Spacer(),
            Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: uploadedImageCount >= 1
                      ? const Color.fromRGBO(54, 40, 221, 1)
                      : Colors
                          .grey, // Button is disabled (gray) until 6 images are uploaded
                  foregroundColor: const Color.fromRGBO(54, 40, 221, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  minimumSize:
                      const Size(double.infinity, 50), // full-width button
                ),
                onPressed: uploadedImageCount >= 1
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              //Photoscreen1(images: images),
                              builder: (context) =>
                                  Photoscreen1(images: images)),
                        );
                      }
                    : null, // Button disabled until at least 6 images are uploaded
                child: Text(
                  "Continue ($uploadedImageCount/9)", // Show current progress
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Photoscreen1 extends StatefulWidget {
  final List<File?> images;

  const Photoscreen1({Key? key, required this.images}) : super(key: key);

  @override
  _Photoscreen1State createState() => _Photoscreen1State();
}

class _Photoscreen1State extends State<Photoscreen1> {
  bool isTapped = true;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        // Update the images list with the new image
        widget.images[0] = File(pickedFile.path); // Replace the first image
      });
    }
  }

  void _showImageSourceMenu(BuildContext context) {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(2, 300, 0, 100),
      items: [
        PopupMenuItem<ImageSource>(
          value: ImageSource.gallery,
          child: Container(
            width: 120, // Adjust the width as needed
            height: 20, // Adjust the height as needed
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Icon(Icons.photo_library, size: 16), // Smaller icon size
                SizedBox(width: 8),
                Text('Pick from gallery', style: TextStyle(fontSize: 10)),
              ],
            ),
          ),
        ),
        PopupMenuItem<ImageSource>(
          value: ImageSource.camera,
          child: Container(
            width: 100, // Adjust the width as needed
            height: 20, // Adjust the height as needed
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Icon(Icons.camera_alt, size: 16), // Smaller icon size
                SizedBox(width: 3),
                Text('Take a photo', style: TextStyle(fontSize: 10)),
              ],
            ),
          ),
        ),
      ],
    ).then((value) {
      if (value != null) {
        _pickImage(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: LinearProgressIndicator(
                  value: 0.8, // Simulating progress
                  backgroundColor: Colors.grey[300],
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    Color.fromRGBO(54, 40, 221, 1),
                  ),
                  minHeight: 8,
                ),
              ),
            ),
            const SizedBox(height: 25),
            Row(
              children: [
                Text(
                  'Photo Verification',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 5),
                Image.asset('assets/images/verify.png', height: 40),
              ],
            ),
            const SizedBox(height: 15),
            Stack(
              children: [
                ImageDisplay(images: widget.images),
                Positioned(
                  bottom: 20,
                  left: 210,
                  // right: 20,
                  child: GestureDetector(
                    onTap: () => _showImageSourceMenu(context),
                    child: Container(
                      height: 40,
                      width: 40, // Adjust height for a better tap area
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(197, 202, 227, 1),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Center(
                          child: Icon(Icons.camera_alt, color: Colors.black)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            const Center(
              child: Text(
                'Prove you’re the real you, with selfies. If the pics match your profile, we’ll give you a blue tick to show off your new verified status. And we’ll keep the selfies just between us.',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 200),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              GestureVerificationScreen(images: widget.images),
                        ),
                      );
                    },
                    child: Container(
                      width: screenSize.width * 0.8,
                      height: screenSize.height * 0.05,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(54, 40, 221, 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text('Continue',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15), // Add spacing between buttons
                  InkWell(
                    onTap: () {
                      setState(() {
                        isTapped = !isTapped;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                EnableLocationScreen(images: widget.images),
                          ),
                        );
                        //E // Toggle tapped state
                      });
                    },
                    child: Container(
                      width: screenSize.width * 0.8,
                      height: screenSize.height * 0.05,
                      decoration: BoxDecoration(
                        color: isTapped
                            ? Colors.grey[300]
                            : const Color.fromRGBO(54, 40, 221, 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text('Maybe Later',
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GestureVerificationScreen extends StatefulWidget {
  final List<File?> images;
  const GestureVerificationScreen({super.key, required this.images});

  @override
  State<GestureVerificationScreen> createState() =>
      _GestureVerificationScreenState();
}

class _GestureVerificationScreenState extends State<GestureVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(right: 20.0, left: 20, top: 50.0, bottom: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Progress bar at the top
              SizedBox(
                height: 25,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: LinearProgressIndicator(
                    value: 0.7, // Simulating progress
                    backgroundColor: Colors.grey[300],
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Color.fromRGBO(54, 40, 221, 1),
                    ),
                    minHeight: 8,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                "Copy these gestures to verify your photo.",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 25),
              // Gesture verification images
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(
                      232, 232, 255, 1), // Background color for the image area
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Column(
                  children: [
                    // Front-facing image
                    Center(
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(
                                'assets/images/front.png' // Replace with your image URL
                                ),
                          ),
                          SizedBox(height: 8),
                          Text("Front",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    // Side-facing images (Left & Right)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(
                                'assets/images/left2.png', // Replace with your image URL
                              ),
                            ),
                            SizedBox(height: 8),
                            Text("Left",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(
                                'assets/images/right.png', // Replace with your image URL
                              ),
                            ),
                            SizedBox(height: 8),
                            Text("Right",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 150),
              // Verify button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(54, 40, 221, 1),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PhotoScreen3(images: widget.images)),
                    // PhotoVerification2(images: widget.images)),
                  );
                },
                child: const Text(
                  "Verify",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PhotoScreen3 extends StatefulWidget {
  final List<File?> images;

  const PhotoScreen3({Key? key, required this.images}) : super(key: key);

  @override
  State<PhotoScreen3> createState() => _PhotoScreen3State();
}

class _PhotoScreen3State extends State<PhotoScreen3>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true); // Repeat the animation in reverse

    _animation = Tween<double>(begin: 0.9, end: 1.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the controller to free up resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: LinearProgressIndicator(
                  value: 0.8, // Simulating progress
                  backgroundColor: Colors.grey[300],
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    Color.fromRGBO(54, 40, 221, 1),
                  ),
                  minHeight: 8,
                ),
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'Please wait',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Your photo verification process will begin in a few seconds. Click next to proceed.',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Display the first image from the images list
                  if (widget.images.isNotEmpty && widget.images[0] != null)
                    Image.file(
                      widget.images[0]!,
                      width: screenSize.width * 0.8,
                      height: screenSize.width * 1.2,
                      fit: BoxFit.cover,
                    )
                  else
                    const Text(
                      'No image available',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),

                  // Animated overlay image
                  AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _animation.value,
                        child: child,
                      );
                    },
                    child: Image.asset(
                      'assets/images/photo1.png',
                      width: screenSize.width * 0.5,
                      height: screenSize.width * 0.5,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PhotoVerification2(images: widget.images),
                    ),
                  );
                },
                child: Container(
                  width: screenSize.width * 0.8,
                  height: screenSize.height * 0.05,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(54, 40, 221, 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text('Continue',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
