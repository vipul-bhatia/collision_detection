import 'package:flutter/material.dart';

class crashoverview extends StatefulWidget {

  @override
  State<crashoverview> createState() => _crashoverviewState();
}

class _crashoverviewState extends State<crashoverview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crash Details'),
      ),
      body: Stack(
        children: [
          // Image as the base layer
          Positioned.fill(
            child: Image.asset(
              'assets/map.jpeg',
              fit: BoxFit.cover, // This ensures the image covers the full area
            ),
          ),
          // Button placed at the bottom over the image
          Positioned(
            bottom: 16.0,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  // Your navigation logic
                },
                child: Text('Navigate Me'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
