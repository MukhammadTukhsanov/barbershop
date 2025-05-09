import 'package:flutter/material.dart';

class DiscountCarousel extends StatelessWidget {
  const DiscountCarousel();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: PageView(
        controller: PageController(viewportFraction: 0.8),
        children: List.generate(
          3,
          (index) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.blueAccent,
              image: const DecorationImage(
                image: AssetImage('assets/images/discount_card.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Text(
                'Скидка ${20 + index * 10}%',
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
