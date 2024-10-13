import 'package:flutter/material.dart';
import './cotd.dart'; // Import the COTD page

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top half with the image
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              child: Image.asset(
                '../../assets/images/logos/cat_app_logo_of_cat.png',  // Make sure the image path is correct
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Bottom half with the buttons
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Button 1 to navigate to COTD page
                  ElevatedButton(
                    onPressed: () {
                      // This is where Navigator.push goes
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CotdPage()),
                      );
                    },
                    child: const Text('Button 1'),
                  ),
                  // Button 2
                  ElevatedButton(
                    onPressed: () {
                      // Action for Button 2
                    },
                    child: const Text('Button 2'),
                  ),
                  // Button 3
                  ElevatedButton(
                    onPressed: () {
                      // Action for Button 3
                    },
                    child: const Text('Button 3'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
