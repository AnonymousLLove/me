import 'package:flutter/material.dart';
import 'package:love_bird/createAccount/photoVerification/photoVerificationOne.dart';
import 'package:love_bird/providers/image_provider.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

class UploadPicturesScreen extends StatelessWidget {
  const UploadPicturesScreen({super.key});

  _showImageSourceActionSheet(BuildContext context, int index) {
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
                  Provider.of<SixImageProvider>(context, listen: false)
                      .pickImage(index, ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Take a photo'),
                onTap: () {
                  Navigator.pop(context);
                  Provider.of<SixImageProvider>(context, listen: false)
                      .pickImage(index, ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildImageGrid(BuildContext context) {
    final imageProvider = Provider.of<SixImageProvider>(context);

    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 20,
      ),
      itemCount: 9,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => _showImageSourceActionSheet(context, index),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: imageProvider.images[index] == null
                    ? const Center(
                        child: Icon(Icons.add, size: 24, color: Colors.grey))
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          imageProvider.images[index]!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
              ),
              if (imageProvider.images[index] != null)
                Positioned(
                  top: -8,
                  right: -8,
                  child: GestureDetector(
                    onTap: () => imageProvider.removeImage(index),
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

  @override
  Widget build(BuildContext context) {
    final imageProvider = Provider.of<SixImageProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
            vertical: MediaQuery.of(context).size.height * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 15,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        color: const Color(0xFF3628DD).withOpacity(0.19),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        color: const Color(0xFF3628DD),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Row(children: [
                const Text('Show Your Best Self',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(width: 5),
                Image.asset('assets/images/six.png', width: 40)
              ]),
              const Text(
                'Upload at least 6 of your best pictures to make a great first impression.',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              _buildImageGrid(context),
              const Spacer(),
              Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: imageProvider.uploadedImageCount >= 1
                        ? const Color.fromRGBO(54, 40, 221, 1)
                        : Colors.grey,
                    foregroundColor: const Color.fromRGBO(54, 40, 221, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: imageProvider.uploadedImageCount >= 1
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PhotoVerificationOne(
                                  images: imageProvider.images),
                            ),
                          );
                        }
                      : null,
                  child: Text(
                    "Continue (${imageProvider.uploadedImageCount}/9)",
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
