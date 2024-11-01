import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:love_bird/edit%20profile%20screens/upload_profile_2_screen.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final List<File?> _selectedImages = [];
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      setState(() {
        _selectedImages.add(File(image.path));
      });
    }
  }

  void _showAddPhotoMenu(BuildContext context) {
    showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(100, 100, 100, 100),
      items: [
        const PopupMenuItem(
          value: 1,
          child: ListTile(
            leading: Icon(Icons.camera_alt),
            title: Text("Take Photo"),
          ),
        ),
        const PopupMenuItem(
          value: 2,
          child: ListTile(
            leading: Icon(Icons.photo_library),
            title: Text("Add Photo"),
          ),
        ),
        const PopupMenuItem(
          value: 3,
          child: ListTile(
            leading: Icon(Icons.video_library),
            title: Text("Add Video"),
          ),
        ),
        const PopupMenuItem(
          value: 4,
          child: ListTile(
            leading: Icon(Icons.person),
            title: Text("Add Avatar"),
          ),
        ),
      ],
    ).then((value) {
      if (value == 1) {
        // _pickImage(ImageSource.camera);
      } else if (value == 2) {
        _pickImage(ImageSource.gallery);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: _selectedImages.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: _selectedImages[index] != null
                            ? DecorationImage(
                                image: FileImage(_selectedImages[index]!),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: PopupMenuButton(
                        icon: const Icon(Icons.more_vert, color: Colors.white),
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            value: 1,
                            child: Text('Set as Profile Picture'),
                          ),
                          const PopupMenuItem(
                            value: 2,
                            child: Text('Delete'),
                          ),
                        ],
                        onSelected: (value) {
                          if (value == 1) {
                            // Logic to set as profile picture
                          } else if (value == 2) {
                            setState(() {
                              _selectedImages.removeAt(index);
                            });
                          }
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton.icon(
                onPressed: () => _showAddPhotoMenu(context),
                icon: const Icon(Icons.camera_alt),
                label: const Text("Add Photo"),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFF3628DD),
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildTextField("Email", Icons.email),
            _buildTextField("Password", Icons.lock, isPassword: true),
            _buildTextField("Username", null),
            _buildTextField("Height", null),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UploadScreenTwo(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3628DD),
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, IconData? icon,
      {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: icon != null ? Icon(icon) : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: const Color(0xFF3628DD).withOpacity(0.19),
        ),
      ),
    );
  }
}
