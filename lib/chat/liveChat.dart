import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:love_bird/chat/comment.dart';
import 'dart:math';

class LiveChatScreen extends StatefulWidget {
  const LiveChatScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LiveChatScreenState createState() => _LiveChatScreenState();
}

class _LiveChatScreenState extends State<LiveChatScreen> {
  bool isLiked = false; // Track whether the button is liked
  int likeCount = 0; // Track the number of likes

  void _toggleLike() {
    setState(() {
      if (isLiked) {
        // If already liked, decrement the count and set isLiked to false
        likeCount--;
      } else {
        // If not liked, increment the count and set isLiked to true
        likeCount++;
      }
      isLiked = !isLiked; // Toggle the isLiked state
    });
  }

  final List<Widget> _hearts = [];
  final List<Widget> _thumbs = [];

  void _showHearts() {
    setState(() {
      for (int i = 0; i < 20; i++) {
        _hearts.add(_buildHeart());
      }
    });

    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        _hearts.clear(); // Clear hearts after animation
      });
    });
  }

  Widget _buildHeart() {
    final random = Random();
    final duration =
        Duration(milliseconds: 4000 + random.nextInt(3000)); // Longer duration
    final startX = MediaQuery.of(context).size.width * 0.5 +
        random.nextDouble() *
            MediaQuery.of(context).size.width *
            0.5; // Center to right
    final size = 20.0 + random.nextDouble() * 20.0; // Heart size variation
    final rotation = random.nextDouble() * 0.5 - 0.25; // Random slight rotation

    return Positioned(
      bottom: 50,
      left: startX,
      child: AnimatedHeart(
        duration: duration,
        endY: MediaQuery.of(context).size.height * 0.8 +
            random.nextDouble() * 200,
        size: size,
        rotation: rotation,
      ),
    );
  }

  void _showThumbs() {
    setState(() {
      for (int i = 0; i < 20; i++) {
        _thumbs.add(_buildThumbs());
      }
    });

    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        _thumbs.clear(); // Clear hearts after animation
      });
    });
  }

  Widget _buildThumbs() {
    final random = Random();
    final duration =
        Duration(milliseconds: 4000 + random.nextInt(3000)); // Longer duration
    final startX = MediaQuery.of(context).size.width * 0.5 +
        random.nextDouble() *
            MediaQuery.of(context).size.width *
            0.5; // Center to right
    final size = 20.0 + random.nextDouble() * 20.0; // Heart size variation
    final rotation = random.nextDouble() * 0.5 - 0.25; // Random slight rotation

    return Positioned(
      bottom: 50,
      left: startX,
      child: AnimatedThumb(
        duration: duration,
        endY: MediaQuery.of(context).size.height * 0.8 +
            random.nextDouble() * 200,
        size: size,
        rotation: rotation,
      ),
    );
  }

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
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return SizedBox(
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

  void addComment(dynamic nameController) {
    if (commentController.text.isNotEmpty && nameController.text.isNotEmpty) {
      setState(() {
        comments.add({
          'name': nameController.text, // Capture user's name
          'time': 'Just now',
          'comment': commentController.text, // Capture comment with emojis
          'profileImage': 'assets/images/homeImage.png',
        });
        commentController.clear(); // Clear comment input
        nameController.clear(); // Clear name input
      });
    }
  }

  // void addComment() {
  //   if (commentController.text.isNotEmpty) {
  //     setState(() {
  //       comments.add({
  //         'name': 'Your Name',
  //         'time': 'Just now',
  //         'comment': commentController.text,
  //         'profileImage': 'assets/images/homeImage.png'
  //       });
  //       commentController.clear();
  //     });
  //   }
  // }

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        // Add message to both lists
        var message = {
          'name': 'Ada',
          'text': _messageController.text,
          'profileImage': 'assets/images/homeImage.png',
        };
        _messages.add(message);
        comments.add({
          'name': 'Ada',
          'comment': _messageController.text,
          'profileImage': 'assets/images/homeImage.png',
          'time': TimeOfDay.now().format(context),
        });
        _messageController.clear();
      });
    }
  }

  void _sendComment() {
    if (commentController2.text.isNotEmpty) {
      setState(() {
        comments.add({
          'message': commentController2.text,
          'time': TimeOfDay.now().format(context),
          'profileImage': 'assets/images/homeImage.png',
          //'isMe': true,
        });
        commentController2.clear();
      });
    }
  }

  void showCommentPopup(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (BuildContext context) {
          return Container(
            padding: const EdgeInsets.all(20),
            height: 400,
            child: Column(
              children: [
                const Text("Comments",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                const Divider(color: Colors.black, thickness: 1),
                Expanded(
                  child: ListView.builder(
                    itemCount: comments.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              AssetImage(comments[index]['profileImage']!),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(comments[index]['name']!,
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500)),
                                const SizedBox(width: 5),
                                Text(comments[index]['time']!,
                                    style: const TextStyle(fontSize: 10)),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: const Color.fromRGBO(217, 217, 217, 1),
                                  borderRadius: BorderRadius.circular(10)),
                              padding: const EdgeInsets.all(10),
                              child: Text(comments[index]['comment']!,
                                  style: const TextStyle(fontSize: 12)),
                            ),
                          ],
                        ),
                        trailing: const Icon(Icons.favorite_border),
                      );
                    },
                  ),
                ),
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/homeImage.png'),
                    ),
                    const SizedBox(width: 5),
                    SizedBox(
                      height: 50,
                      width: 200,
                      child: TextField(
                        controller: _messageController,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                          hintText: ' Add a Reply @',
                          hintStyle: const TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w400),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Color.fromRGBO(54, 40, 221, 1.0),
                                width: 2),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      child: const Text(
                        'Post',
                        style:
                            TextStyle(color: Color.fromRGBO(54, 40, 221, 1.0)),
                      ),
                      onTap: () {
                        _sendComment();
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        });
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
            ..._hearts,
            ..._thumbs,
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
                right: 20,
                bottom: 130,
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage:
                          AssetImage('assets/images/homeImage.png'),
                    ),
                    const SizedBox(height: 5),
                    Column(
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: _toggleLike,
                          icon: Icon(
                            Icons.favorite,
                            color: isLiked
                                ? Colors.red
                                : Colors.white, // Change color based on state
                            size: 30,
                          ),
                        ),
                        Text(
                          '$likeCount', // Display the like count
                          style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
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
                    child: Container(
                      color: const Color.fromRGBO(255, 255, 255, 0.12),
                      child: TextField(
                        textCapitalization: TextCapitalization.sentences,
                        controller: _messageController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Add a Comment here and send",
                          hintStyle:
                              const TextStyle(color: Colors.grey, fontSize: 13),
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
                  ),
                  IconButton(
                    onPressed: _sendMessage,
                    icon: const Icon(Icons.send, color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: _showHearts, // Call the heart function on tap
                    child:
                        const Icon(Icons.favorite, color: Colors.red, size: 30),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.thumb_up_sharp,
                      color: Color.fromARGB(255, 192, 173, 2),
                    ),
                    onPressed: _showThumbs,
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

class AnimatedHeart extends StatefulWidget {
  final Duration duration;
  final double endY;
  final double size;
  final double rotation;

  const AnimatedHeart({
    super.key,
    required this.duration,
    required this.endY,
    required this.size,
    required this.rotation,
  });

  @override
  _AnimatedHeartState createState() => _AnimatedHeartState();
}

class _AnimatedHeartState extends State<AnimatedHeart>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _positionAnimation;
  late final Animation<double> _opacityAnimation;
  late final double _startY;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _startY = 0;

    _positionAnimation =
        Tween<double>(begin: _startY, end: widget.endY).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));
    _opacityAnimation =
        Tween<double>(begin: 1.0, end: 0.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _opacityAnimation.value,
          child: Transform.translate(
            offset: Offset(0, -_positionAnimation.value),
            child: Transform.rotate(
              angle: widget.rotation,
              child: child,
            ),
          ),
        );
      },
      child: Icon(
        Icons.favorite,
        color: Colors.red,
        size: widget.size,
      ),
    );
  }
}

class AnimatedThumb extends StatefulWidget {
  final Duration duration;
  final double endY;
  final double size;
  final double rotation;

  const AnimatedThumb({
    super.key,
    required this.duration,
    required this.endY,
    required this.size,
    required this.rotation,
  });

  @override
  _AnimatedThumbState createState() => _AnimatedThumbState();
}

class _AnimatedThumbState extends State<AnimatedThumb>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _positionAnimation;
  late final Animation<double> _opacityAnimation;
  late final double _startY;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _startY = 0;

    _positionAnimation =
        Tween<double>(begin: _startY, end: widget.endY).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));
    _opacityAnimation =
        Tween<double>(begin: 1.0, end: 0.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _opacityAnimation.value,
          child: Transform.translate(
            offset: Offset(0, -_positionAnimation.value),
            child: Transform.rotate(
              angle: widget.rotation,
              child: child,
            ),
          ),
        );
      },
      child: Icon(
        Icons.thumb_up,
        color: Colors.yellow,
        size: widget.size,
      ),
    );
  }
}
