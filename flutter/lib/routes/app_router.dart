import 'package:barbershop/features/admin/dashboard/admin_dashboard.dart';
import 'package:barbershop/features/auth/view/sign_in_page.dart';
import 'package:barbershop/features/auth/view/sign_up_page.dart';
import 'package:barbershop/features/client/home/view/home_page.dart';
import 'package:barbershop/features/common/onboarding/onboarding_page.dart';
import 'package:barbershop/features/common/welcome_page.dart';
import 'package:barbershop/providers/onboarding_provider.dart';
import 'package:barbershop/routes/app_routs.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final onboardingAsync = ref.watch(onboardingCompletedProvider);

  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return onboardingAsync.when(
            data:
                (completed) =>
                    completed ? SignInPage() : const OnboardingPage(),
            loading:
                () => const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                ),
            error:
                (_, __) => const Scaffold(
                  body: Center(child: Text('Ошибка загрузки')),
                ),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: AppRoutes.welcome,
        builder: (context, state) => WelcomePage(),
      ),
      GoRoute(
        path: AppRoutes.signin,
        builder: (context, state) => const SignInPage(),
      ),
      GoRoute(
        path: AppRoutes.signup,
        builder: (context, state) => const SignUpPage(),
      ),
      GoRoute(
        path: AppRoutes.clientHome,
        builder: (context, state) => const ClientHomePage(),
      ),
      GoRoute(
        path: AppRoutes.adminDashboard,
        builder: (context, state) => const AdminDashboardPage(),
      ),
    ],
  );
});
