import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:love_bird/chat/comment.dart';

class LiveChatScreen extends StatefulWidget {
  const LiveChatScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LiveChatScreenState createState() => _LiveChatScreenState();
}

class _LiveChatScreenState extends State<LiveChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, String>> _messages = [];
  final List<String> emojis = ['❤️', '😂', '🔥', '👍', '👏'];
  List<Map<String, String>> comments = [];
  TextEditingController commentController = TextEditingController();
  TextEditingController commentController2 = TextEditingController();
  Color blue = const Color.fromRGBO(54, 40, 221, 1.0);
  bool isLive = false; // Variable to track the live status
  void showCommentsModal(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
            height: screenSize.height * 0.5, child: CommentSection());
      },
    );
  }

  // Variables for camera
  late CameraController _cameraController;
  Future<void>?
      _initializeControllerFuture; // Use Future<void>? for optional initialization

  @override
  void initState() {
    super.initState();
    // Initialize the camera
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    try {
      final cameras = await availableCameras();
      _cameraController = CameraController(
        cameras[0], // Select the first camera
        ResolutionPreset.high,
      );

      // Initialize the camera controller and store the future
      _initializeControllerFuture = _cameraController.initialize();

      // Ensure the widget is still mounted before calling setState
      if (mounted) {
        setState(() {}); // Update the state to show the camera preview
      }
    } catch (e) {
      // Handle errors during camera initialization
      print('Error initializing camera: $e');
      // Optionally, you could show an error message to the user
    }
  }

  // void _sendMessage() {
  //   if (_messageController.text.isNotEmpty) {
  //     setState(() {
  //       _messages.add({
  //         'text': _messageController.text,
  //         'profileImage': 'assets/images/homeImage.png',
  //         'name': 'Lil mama'
  //       });
  //       _messageController.clear();
  //     });
  //   }
  // }

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        _messages.add({
          'text': _messageController.text,
          'profileImage': 'assets/images/homeImage.png',
        });
        _messageController.clear();
      });
    }
  }

  void startLiveStream() async {
    // Start the camera
    await _initializeControllerFuture;
    await _cameraController.startVideoRecording();
    print("Live stream started");
  }

  void stopLiveStream() async {
    await _cameraController.stopVideoRecording();
    print("Live stream stopped");
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                // Check for errors
                if (snapshot.connectionState == ConnectionState.done) {
                  // Camera is initialized, show the preview
                  return Positioned.fill(
                      child: CameraPreview(
                          _cameraController)); // Ensure the preview fills the screen
                } else if (snapshot.hasError) {
                  // Handle errors during camera initialization
                  return Center(
                      child:
                          Text('Error initializing camera: ${snapshot.error}'));
                } else {
                  // Show a loading spinner while waiting for the camera to initialize
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),

            // Positioning profile picture, LIVE label, username, and view count at the top
            Positioned(
              top: 10,
              left: 10,
              right: 10,
              child: Row(
                children: [
                  // Back Button
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context); // Go back to the previous screen
                    },
                  ),

                  // Profile Picture with "LIVE" label
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage(
                            'assets/images/homeImage.png'), // Profile picture path
                        radius: 20,
                      ),
                      Positioned(
                        bottom: -2,
                        right: 5,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            'LIVE',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Lil Mama', // Replace 'Username' with the actual username variable
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const Spacer(),
                  // View Count
                  const Row(
                    children: [
                      Icon(Icons.visibility, color: Colors.white, size: 18),
                      SizedBox(width: 5),
                      Text(
                        '1000', // Replace '1000' with the actual view count variable
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Positioned(
              left: 10,
              bottom: 90,
              child: SizedBox(
                height: 200,
                width: 300,
                child: ListView.builder(
                  itemCount: _messages.length,
                  reverse: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage:
                                AssetImage(_messages[index]['profileImage']!),
                          ),
                          const SizedBox(width: 10),
                          Flexible(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _messages[index]['name']!,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      _messages[index]['text']!,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ]),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Positioned(
                right: 40,
                bottom: 130,
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage:
                          AssetImage('assets/images/homeImage.png'),
                    ),
                    const SizedBox(height: 5),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite,
                            color: Colors.white, size: 30)),
                    const SizedBox(height: 5),
                    IconButton(
                        onPressed: () {
                          showCommentsModal(context);
                        },
                        icon: const Icon(Icons.insert_comment,
                            color: Colors.white, size: 30))
                  ],
                )),
            // Comment Input Box

            Positioned(
              bottom: 30,
              left: 10,
              right: 30,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      textCapitalization: TextCapitalization.sentences,
                      controller: _messageController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Add a Comment here and send",
                        hintStyle: const TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.grey[800],
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: GestureDetector(
                          onTap: () async {
                            await showModalBottomSheet(
                              context: context,
                              builder: (_) => EmojiPicker(
                                onEmojiSelected: (category, emoji) {
                                  setState(() {
                                    _messageController.text += emoji.emoji;
                                  });
                                },
                                config:
                                    const Config(), // Basic config without additional parameters
                              ),
                            );
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "😊",
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    onPressed: _sendMessage,
                    icon: const Icon(Icons.send, color: Colors.white),
                  ),
                  IconButton(
                    icon: const Icon(Icons.favorite, color: Colors.red),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.thumb_up_sharp,
                      color: Color.fromARGB(255, 192, 173, 2),
                    ),
                    onPressed: _sendMessage,
                  ),
                ],
              ),
            ),

            // Live Stream Control
            Positioned(
              bottom: 80,
              right: 20,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isLive
                      ? Colors.red
                      : blue, // Blue for "not live", red for "live"
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    isLive = !isLive; // Toggle live status
                  });
                  if (isLive) {
                    startLiveStream();
                  } else {
                    stopLiveStream();
                  }
                },
                child: Text(
                  isLive ? 'End Live' : 'Start Live',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
