import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';
import 'package:image_picker/image_picker.dart';



// ------------------- Front NID Screen -------------------
class FrontNIDScreen extends StatefulWidget {
  const FrontNIDScreen({super.key});

  @override
  State<FrontNIDScreen> createState() => _FrontNIDScreenState();
}

class _FrontNIDScreenState extends State<FrontNIDScreen> {
  File? frontImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage(ImageSource source) async {
    final XFile? pickedFile =
    await _picker.pickImage(source: source, imageQuality: 80);
    if (pickedFile != null) {
      setState(() {
        frontImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Front NID Capture")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: frontImage != null
                    ? Image.file(frontImage!, fit: BoxFit.cover)
                    : Container(
                  color: Colors.grey.shade300,
                  alignment: Alignment.center,
                  child: const Text("No Front Image Selected"),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () => pickImage(ImageSource.camera),
                    icon: const Icon(Icons.camera_alt),
                    label: const Text("Camera"),
                  ),
                  ElevatedButton.icon(
                    onPressed: () => pickImage(ImageSource.gallery),
                    icon: const Icon(Icons.photo_library),
                    label: const Text("Gallery"),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: frontImage != null
                    ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BackNIDScreen(frontImage: frontImage!),
                    ),
                  );
                }
                    : null,
                child: const Text("Next: Back NID"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ------------------- Back NID Screen -------------------
class BackNIDScreen extends StatefulWidget {
  final File frontImage;
  const BackNIDScreen({super.key, required this.frontImage});

  @override
  State<BackNIDScreen> createState() => _BackNIDScreenState();
}

class _BackNIDScreenState extends State<BackNIDScreen> {
  File? backImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage(ImageSource source) async {
    final XFile? pickedFile =
    await _picker.pickImage(source: source, imageQuality: 80);
    if (pickedFile != null) {
      setState(() {
        backImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Back NID Capture")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: backImage != null
                  ? Image.file(backImage!, fit: BoxFit.cover)
                  : Container(
                color: Colors.grey.shade300,
                alignment: Alignment.center,
                child: const Text("No Back Image Selected"),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () => pickImage(ImageSource.camera),
                  icon: const Icon(Icons.camera_alt),
                  label: const Text("Camera"),
                ),
                ElevatedButton.icon(
                  onPressed: () => pickImage(ImageSource.gallery),
                  icon: const Icon(Icons.photo_library),
                  label: const Text("Gallery"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: backImage != null
                  ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => FlipCardScreen(
                      frontImage: widget.frontImage,
                      backImage: backImage!,
                    ),
                  ),
                );
              }
                  : null,
              child: const Text("Show Card"),
            )
          ],
        ),
      ),
    );
  }
}

// ------------------- Flip Card Screen -------------------
class FlipCardScreen extends StatefulWidget {
  final File frontImage;
  final File backImage;
  const FlipCardScreen({super.key, required this.frontImage, required this.backImage});

  @override
  State<FlipCardScreen> createState() => _FlipCardScreenState();
}

class _FlipCardScreenState extends State<FlipCardScreen> {
  final GestureFlipCardController controller = GestureFlipCardController();

  // Cached images to prevent reload
  late final Image frontCached;
  late final Image backCached;

  @override
  void initState() {
    super.initState();
    frontCached = Image.file(widget.frontImage, fit: BoxFit.cover);
    backCached = Image.file(widget.backImage, fit: BoxFit.cover);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      precacheImage(frontCached.image, context);
      precacheImage(backCached.image, context);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("NID Card")),
      body: Center(
        child: GestureFlipCard(
          controller: controller,
          axis: FlipAxis.vertical,
          enableController: true,
          animationDuration: const Duration(milliseconds: 500),
          frontWidget: _buildCard(frontCached),
          backWidget: _buildCard(backCached),
        ),
      ),
    );
  }

  Widget _buildCard(Image image) {
    return Container(
      width: 300,
      height: 450,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 3))
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: image,
      ),
    );
  }
}
