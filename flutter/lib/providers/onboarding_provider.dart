import 'package:barbershop/features/common/onboarding/onboarding_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final onboardingCompletedProvider = FutureProvider<bool>((ref) async {
  return await OnboardingController.isOnboardingCompleted();
});
