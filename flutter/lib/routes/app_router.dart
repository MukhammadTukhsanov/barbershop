// lib/routes/app_router.dart

import 'package:barbershop/features/admin/dashboard/admin_dashboard.dart';
import 'package:barbershop/features/auth/login_page.dart';
import 'package:barbershop/features/client/client_home_page.dart';
import 'package:barbershop/features/common/welcome_page.dart';
import 'package:barbershop/routes/app_routs.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRoutes.welcome, // Initial sahifa
    routes: [
      GoRoute(
        path: AppRoutes.welcome, // Welcome sahifasi
        builder: (context, state) => WelcomePage(),
      ),
      GoRoute(
        path: AppRoutes.login, // Login sahifasi
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: AppRoutes.clientHome, // Client Home sahifasi
        builder: (context, state) => const ClientHomePage(),
      ),
      GoRoute(
        path: AppRoutes.adminDashboard, // Admin Dashboard sahifasi
        builder: (context, state) => const AdminDashboardPage(),
      ),
    ],
  );
});
