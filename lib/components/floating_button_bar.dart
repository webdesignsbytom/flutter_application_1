import 'package:flutter/material.dart';

class FloatingButtonBar extends StatelessWidget {
  final VoidCallback onPrevious;
  final VoidCallback onMute;
  final bool isMuted;
  final VoidCallback onLike;
  final VoidCallback onHome;
  final VoidCallback onNext;

  const FloatingButtonBar({
    Key? key,
    required this.onPrevious,
    required this.onMute,
    required this.isMuted,
    required this.onLike,
    required this.onHome,
    required this.onNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30, // Position the buttons above the bottom edge
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Previous Button
          FloatingActionButton(
            onPressed: onPrevious,
            child: const Icon(Icons.arrow_back),
            backgroundColor: Colors.black.withOpacity(0.7),
          ),
          // Mute/Unmute Button
          FloatingActionButton(
            onPressed: onMute,
            child: Icon(
              isMuted ? Icons.volume_off : Icons.volume_up,
            ),
            backgroundColor: Colors.black.withOpacity(0.7),
          ),
          // Like Button
          FloatingActionButton(
            onPressed: onLike,
            child: const Icon(Icons.thumb_up),
            backgroundColor: Colors.black.withOpacity(0.7),
          ),
          // Home Button
          FloatingActionButton(
            onPressed: onHome,
            child: const Icon(Icons.home),
            backgroundColor: Colors.black.withOpacity(0.7),
          ),
          // Next Button
          FloatingActionButton(
            onPressed: onNext,
            child: const Icon(Icons.arrow_forward),
            backgroundColor: Colors.black.withOpacity(0.7),
          ),
        ],
      ),
    );
  }
}
