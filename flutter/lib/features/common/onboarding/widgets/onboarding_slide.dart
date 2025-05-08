import 'package:flutter/material.dart';

class OnboardingSlide extends StatelessWidget {
  final String title;
  final String photoURL;

  const OnboardingSlide({
    super.key,
    required this.title,
    required this.photoURL,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: screenHeight * 0.6,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(photoURL),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                  height: 1.1,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
