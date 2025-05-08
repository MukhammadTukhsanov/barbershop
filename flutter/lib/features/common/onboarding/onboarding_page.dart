import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'onboarding_controller.dart';
import 'widgets/onboarding_slide.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  final slides = const [
    OnboardingSlide(
      title: "Sartaroshlar va salonlarni osongina toping!",
      photoURL: "assets/images/onboarding-1.jpg",
    ),
    OnboardingSlide(
      title: "Sevimli sartarosh va saloningizni bron qiling!",
      photoURL: "assets/images/onboarding-2.jpg",
    ),
    OnboardingSlide(
      title: "Biz bilan chiroyli va kelishgan bo'ling!",
      photoURL: "assets/images/onboarding-3.jpg",
    ),
  ];

  void _finish() async {
    await OnboardingController.completeOnboarding();
    if (context.mounted) {
      context.go('/welcome');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        itemCount: slides.length,
        onPageChanged: (index) => setState(() => _currentIndex = index),
        itemBuilder: (context, index) => slides[index],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 36),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SmoothPageIndicator(
              controller: _controller,
              count: slides.length,
              effect: CustomizableEffect(
                dotDecoration: DotDecoration(
                  height: 8,
                  width: 8,
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
                spacing: 8,

                activeDotDecoration: DotDecoration(
                  height: 8,
                  width: 30,
                  color: Color(0xfffc9401),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 16),
            _currentIndex == slides.length - 1
                ? ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    backgroundColor: Color(0xfffc9401),
                  ),
                  onPressed: _finish,
                  child: const Text(
                    "Boshlash",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
                : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    backgroundColor: Color(0xfffc9401),
                  ),
                  onPressed:
                      () => _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      ),
                  child: const Text(
                    "Keyingi",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
