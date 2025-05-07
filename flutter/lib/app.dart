import 'package:barbershop/core/constants/theme.dart';
import 'package:barbershop/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'Barbershop',
      theme: AppTheme.lightTheme,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      // Optional error handling
      // errorBuilder: (context, state) => ErrorPage(state.error), // Xatoliklar uchun maxsus sahifa
    );
  }
}
