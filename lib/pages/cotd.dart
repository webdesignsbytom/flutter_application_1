import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '/components/floating_button_bar.dart'; // Import the reusable floating button bar

class CotdPage extends StatefulWidget {
  const CotdPage({super.key});

  @override
  _CotdPageState createState() => _CotdPageState();
}

class _CotdPageState extends State<CotdPage> {
  late VideoPlayerController _controller;
  bool _isVideoInitialized = false;
  bool _isMuted = false;

  @override
  void initState() {
    super.initState();
    // Initialize the video controller with your video file
    _controller = VideoPlayerController.asset('assets/video/cat_video1.mp4')
      ..initialize().then((_) {
        setState(() {
          _isVideoInitialized = true;
        });
        _controller.play(); // Autoplay the video
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Function to toggle mute
  void _toggleMute() {
    setState(() {
      _isMuted = !_isMuted;
      _controller.setVolume(_isMuted ? 0.0 : 1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isVideoInitialized
          ? Stack(
              children: [
                // Video fills the screen
                Positioned.fill(
                  child: FittedBox(
                    fit: BoxFit.cover, // Make the video cover the entire screen
                    child: SizedBox(
                      width: _controller.value.size.width,
                      height: _controller.value.size.height,
                      child: VideoPlayer(_controller),
                    ),
                  ),
                ),
                // Use the reusable FloatingButtonBar
                FloatingButtonBar(
                  onPrevious: () {
                    // Implement the action for Previous button
                  },
                  onMute: _toggleMute,
                  isMuted: _isMuted,
                  onLike: () {
                    // Implement the action for Like button
                  },
                  onHome: () {
                    // Implement navigation to Home page
                    Navigator.pop(context);
                  },
                  onNext: () {
                    // Implement the action for Next button
                  },
                ),
              ],
            )
          : const Center(
              child: CircularProgressIndicator(), // Show a loading indicator until the video initializes
            ),
    );
  }
}
