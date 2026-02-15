import 'package:flutter/material.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';



class FlipCardScreen extends StatefulWidget {
  const FlipCardScreen({super.key});

  @override
  State<FlipCardScreen> createState() => _FlipCardScreenState();
}

class _FlipCardScreenState extends State<FlipCardScreen> {
  final GestureFlipCardController controller = GestureFlipCardController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flashcard")),
      body: Center(
        child: GestureFlipCard(
          controller: controller,
          axis: FlipAxis.vertical, // vertical flip
          enableController: true,
          animationDuration: const Duration(milliseconds: 500),
          frontWidget: _buildCard(
            imagePath: 'assets/cardOnefullview.png', // Front image
          ),
          backWidget: _buildCard(
            imagePath: 'assets/CardTow.png', // Back image
          ),
        ),
      ),
    );
  }

  // Helper method to build a card with image
  Widget _buildCard({required String imagePath, String? text}) {
    return Container(
      width: 300,
      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.center,
      child: text != null
          ? Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      )
          : null,
    );
  }
}
