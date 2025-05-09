import 'package:barbershop/features/client/home/widgets/discount_carousel.dart';
import 'package:barbershop/features/client/home/widgets/search_input.dart';
import 'package:flutter/material.dart';

class ClientHomePage extends StatelessWidget {
  const ClientHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Главная'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Добро пожаловать!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const SearchInput(),
            const SizedBox(height: 24),
            const Text(
              'Скидки',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            const DiscountCarousel(),
            const SizedBox(height: 24),
            const Divider(),
            // Место для других секций (например, "Популярное", "Рекомендуем" и т.д.)
          ],
        ),
      ),
    );
  }
}
