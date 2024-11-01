// import 'dart:io';
// import 'package:open_file/open_file.dart';


// class ChatDetailScreen extends StatefulWidget {
//   final String name;
//   final String profileImage;
//   final bool isOnline;
//   final String lastMessage;

//   const ChatDetailScreen({
//     Key? key,
//     required this.name,
//     required this.profileImage,
//     this.isOnline = false,
//     required this.lastMessage,
//   }) : super(key: key);

//   @override
//   _ChatDetailScreenState createState() => _ChatDetailScreenState();
// }

// class _ChatDetailScreenState extends State<ChatDetailScreen> {
//   final TextEditingController _messageController = TextEditingController();
//   final List<Map<String, dynamic>> _messages = []; // List to store messages
//   String selectedOption = '';
//   void _sendMessage() {
//     if (_messageController.text.isNotEmpty) {
//       setState(() {
//         _messages.add({
//           'message': _messageController.text,
//           'time': TimeOfDay.now().format(context),
//           'isMe': true,
//         });
//         _messageController.clear();
//       });
//     }
//   }



//   void _selectImage() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.image, // Restrict to image files only
//     );

//     if (result != null) {
//       String filePath = result.files.single.path!;
//       setState(() {
//         _messages.add({
//           'image': filePath,
//           'time': TimeOfDay.now().format(context),
//           'isMe': true,
//         });
//       });
//     }
//   }

//   void _selectCameraImage() async {
//     PermissionStatus permission = await Permission.camera.request();
//     if (permission.isGranted) {
//       final pickedImage =
//           await ImagePicker().pickImage(source: ImageSource.camera);
//       if (pickedImage != null) {
//         setState(() {
//           _messages.add({
//             'image': pickedImage.path,
//             'time': TimeOfDay.now().format(context),
//             'isMe': true,
//           });
//         });
//       }
//     }
//   }

//   Widget _buildImageBubble({
//     required String imagePath,
//     required String time,
//     required bool isMe,
//   }) {
//     return Align(
//       alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//         child: Column(
//           crossAxisAlignment:
//               isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 image: DecorationImage(
//                   image:
//                       FileImage(File(imagePath)), // Load image from file path
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               width: 150,
//               height: 150,
//             ),
//             const SizedBox(height: 4),
//             Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   time,
//                   style: const TextStyle(color: Colors.grey, fontSize: 12),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   //

//   void showAttachmentPopup(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;

//     showGeneralDialog(
//       context: context,
//       barrierLabel: 'AttachmentPopup',
//       barrierDismissible: true,
//       barrierColor: Colors.transparent,
//       transitionDuration: const Duration(milliseconds: 300),
//       pageBuilder: (context, animation1, animation2) {
//         return Padding(
//           padding: const EdgeInsets.only(bottom: 70),
//           child: Align(
//             alignment: Alignment.bottomCenter,
//             child: Material(
//               color: Colors.transparent,
//               child: Container(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
//                 width: screenSize.width * 0.8,
//                 height: 100,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Row(
//                   // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     AttachmentOption(
//                         icon: Icons.insert_drive_file,
//                         color: Colors.pink,
//                         label: 'Document',
//                         onPressed: () {
//                           _selectFile();
//                         }

//                         /** () async {  FilePickerResult? result = await FilePicker.platform
//                           .pickFiles(
//                               type: FileType.custom,
//                               allowedExtensions: ['pdf', 'doc', 'docx']);
//                       if (result != null) {
//                         print('Document selected: ${result.files.single.name}');} },
//                   **/

//                         ),
//                     AttachmentOption(
//                       icon: Icons.camera_alt,
//                       color: Colors.red,
//                       label: 'Camera',
//                       onPressed: () async {
//                         _selectCameraImage();
//                       },
//                     ),
//                     AttachmentOption(
//                       icon: Icons.photo,
//                       color: Colors.blue,
//                       label: 'Gallery',
//                       onPressed: () async {
//                         _selectImage();
//                       },
//                     ),
//                     AttachmentOption(
//                       icon: Icons.audiotrack,
//                       color: Colors.orange,
//                       label: 'Audio',
//                       onPressed: () async {
//                         // Access Audio Files
//                         FilePickerResult? result = await FilePicker.platform
//                             .pickFiles(type: FileType.audio);
//                         if (result != null) {
//                           print('Audio selected: ${result.files.single.name}');
//                         }
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//       transitionBuilder: (context, animation1, animation2, child) {
//         return SlideTransition(
//           position:
//               Tween<Offset>(begin: const Offset(0, 1), end: const Offset(0, 0))
//                   .animate(animation1),
//           child: child,
//         );
//       },
//     );
//   }

//   void showFlowers(BuildContext context) async {
//     final selectedImage = await Navigator.of(context).push(
//       PageRouteBuilder(
//         opaque: false,
//         pageBuilder: (BuildContext context, _, __) {
//           return _ImageGridPopup();
//         },
//         transitionsBuilder: (context, animation, secondaryAnimation, child) {
//           const begin = Offset(0.0, 1.0);
//           const end = Offset(0.0, 0.0);
//           const curve = Curves.easeInOut;

//           var tween = Tween(begin: begin, end: end).chain(
//             CurveTween(curve: curve),
//           );

//           return SlideTransition(
//             position: animation.drive(tween),
//             child: child,
//           );
//         },
//       ),
//     );

//     if (selectedImage is String) {
//       // Check if selectedImage is a String
//       setState(() {
//         _messages.add({
//           'image': selectedImage,
//           'time': TimeOfDay.now().format(context),
//           'isMe': true,
//         });
//       });
//     } else {
//       // Handle the case where selectedImage is null or not a String
//     }
//   }

  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromRGBO(97, 86, 234, 0.09),
//         leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: const Icon(Icons.arrow_back_outlined)),
//         title: Row(
//           children: [
//             CircleAvatar(
//               radius: 20,
//               backgroundImage: AssetImage(widget.profileImage),
//             ),
//             const SizedBox(width: 10),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   widget.name,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 15,
//                   ),
//                 ),
//                 Text(
//                   widget.isOnline ? 'Online 2 hrs ago' : 'Offline',
//                   style: const TextStyle(fontSize: 10, color: Colors.grey),
//                 ),
//               ],
//             ),
//           ],
//         ),
//         centerTitle: true,
//         elevation: 0,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.call, size: 30),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const CallScreen(
//                     name: 'Lil Mama',
//                     profileImage: 'assets/images/profile_lil_mama.png',
//                     callDuration: '10:00',
//                   ),
//                 ),
//               );
//             },
//           ),
//           IconButton(
//             icon: const Icon(Icons.videocam, size: 30),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const VideoCallScreen(
//                     name: 'Lil Mama',
//                     profileImage: 'assets/images/homeImage.png',
//                     callDuration: '10:00',
//                   ),
//                 ),
//               );
//             },
//           ),
//           IconButton(
//             icon: const Icon(Icons.more_vert, size: 30),
//             onPressed: () {
//               _showChatPopup(context);
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//                 itemCount: _messages.length,
//                 itemBuilder: (context, index) {
//                   final messageData = _messages[index];
//                   if (messageData['message'] != null) {
//                     return _buildMessageBubble(
//                       message: messageData['message'],
//                       time: messageData['time'],
//                       isMe: messageData['isMe'],
//                     );
//                   } else if (messageData['image'] != null) {
//                     return _buildImageBubble(
//                       imagePath: messageData['image'],
//                       time: messageData['time'],
//                       isMe: messageData['isMe'],
//                     );
//                   } else if (messageData['file'] != null) {
//                     return _buildFileBubble(
//                       filePath: messageData['file'],
//                       time: messageData['time'],
//                       isMe: messageData['isMe'],
//                     );
//                   }
//                   //  else if (messageData['image2'] != null) {
//                   //   return _buildImageBubble2(
//                   //     imagePath: messageData['image2'],
//                   //     time: messageData['time'],
//                   //     isMe: messageData['isMe'],
//                   //   );
//                   // }

//                   return Container(); // Return an empty container if no message or image
//                 }),
//           ),
//           _buildMessageInputField(),
//         ],
//       ),
     
//       ),
//     );
//   }


 
//   Widget _buildMessageInputField() {
//     const Color blue = Color.fromRGBO(54, 40, 221, 1.0);

//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Row(
//         children: [
//           Expanded(
//             child: TextField(
//               controller: _messageController,
//               textCapitalization: TextCapitalization.sentences,
//               decoration: InputDecoration(
//                 hintText: 'Message',
//                 filled: true,
//                 fillColor: Colors.white,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(30),
//                   borderSide: const BorderSide(
//                     color: blue,
//                     width: 2,
//                   ),
//                 ),
//                 prefixIcon: IconButton(
//                   icon: const Icon(Icons.insert_emoticon, color: blue),
//                   onPressed: () {},
//                 ),
//                 suffixIcon: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     IconButton(
//                       icon: const Icon(Icons.local_florist_outlined,
//                           color: Colors.pink),
//                       onPressed: () {
//                         showFlowers(context); // Call showFlowers function
//                       },
//                     ),
//                     IconButton(
//                       icon: const Icon(Icons.attach_file, color: blue),
//                       onPressed: () {
//                         showAttachmentPopup(context);
//                       },
//                     ),
//                     IconButton(
//                       icon: const Icon(Icons.camera_alt_outlined, color: blue),
//                       onPressed: () async {
//                         // Access Camera
//                         PermissionStatus permission =
//                             await Permission.camera.request();
//                         if (permission.isGranted) {
//                           final pickedImage = await ImagePicker()
//                               .pickImage(source: ImageSource.camera);
//                           if (pickedImage != null) {
//                             setState(() {
//                               _messages.add({
//                                 'image': pickedImage.path,
//                                 'time': TimeOfDay.now().format(context),
//                                 'isMe': true,
//                               });
//                             });

//                             // print('Camera Image selected: ${pickedImage.path}');
//                           }
//                         } else {
//                           print('Camera permission denied');
//                         }
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(width: 8),
//           // Send button
//           IconButton(
//             icon: const Icon(Icons.send, color: blue),
//             onPressed: _sendMessage, // Call the send message function
//           ),
//           // Voice note button container
//           GestureDetector(
//             onTap: () {
//               showVoiceNote(context);
//             },
//             child: Container(
//               width: 30,
//               height: 30,
//               decoration: BoxDecoration(
//                 color: blue,
//                 borderRadius: BorderRadius.circular(40),
//               ),
//               child: const Center(
//                 child: Icon(
//                   Icons
//                       .mic, // Using just Icon instead of IconButton to center it properly
//                   color: Colors.white,
//                   size: 20,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


// // Widget for attachment options
// class AttachmentOption extends StatelessWidget {
//   final IconData icon;
//   final Color color;
//   final String label;
//   final VoidCallback onPressed;

//   AttachmentOption({
//     required this.icon,
//     required this.color,
//     required this.label,
//     required this.onPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 8.0),
//       child: Column(
//         children: [
//           InkWell(
//             onTap: onPressed,
//             child: CircleAvatar(
//               backgroundColor: color,
//               radius: 20,
//               child: Icon(icon, color: Colors.white, size: 20),
//             ),
//           ),
//           const SizedBox(height: 5),
//           Text(label),
//         ],
//       ),
//     );
//   }
// }

// class _ImageGridPopup extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final List<String> imageUrls = [
//       'assets/images/flower1.png',
//       'assets/images/flower2.png',
//       'assets/images/flower3.png',
//       'assets/images/flower4.png',
//       'assets/images/flower5.png',
//       'assets/images/flower6.png',
//       'assets/images/flower7.png',
//       'assets/images/flower8.png',
//       'assets/images/flower9.png',
//     ];

//     return GestureDetector(
//       onTap: () {
//         Navigator.pop(context);
//       },
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         body: GestureDetector(
//           onTap:
//               () {}, // Prevents the tap inside the container from closing the popup
//           child: Center(
//             child: Container(
//               width: MediaQuery.of(context).size.width * 0.8,
//               height: MediaQuery.of(context).size.height * 0.5,
//               padding: const EdgeInsets.all(16.0),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(20.0),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     'Stickers',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 10),
//                   Expanded(
//                     child: GridView.builder(
//                         itemCount: imageUrls.length,
//                         gridDelegate:
//                             const SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 3, // 3 columns
//                           crossAxisSpacing: 14.0,
//                           mainAxisSpacing: 14.0,
//                         ),
//                         itemBuilder: (context, index) {
//                           return GestureDetector(
//                             onTap: () {
//                               Navigator.pop(
//                                   context,
//                                   imageUrls[
//                                       index]); // Ensure this returns a String
//                             },
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(0.0),
//                               child: Image.asset(
//                                 imageUrls[index],
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           );
//                         }),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
