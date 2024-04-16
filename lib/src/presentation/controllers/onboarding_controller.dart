import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onboarding_trial/src/routes/my_routes.dart';

class OnboaardingController extends ChangeNotifier {
  final PageController pageController = PageController();
  int currentPage = 0;
  int hours = 10;
  int minutes = 10;
  bool isLoading = false;
  int maxHours = 160;

  void onPageChanged(int page) {
    currentPage = page;
    notifyListeners();
  }

  void nextPage(BuildContext context) async {
    if (currentPage < 1) {
      currentPage++;

      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      loading();
      currentPage = 0;
      await Future.delayed(const Duration(seconds: 2)).then(
          (value) => Navigator.pushReplacementNamed(context, MyRoutes.home));

      completed();
    }

    notifyListeners();
  }

  void backPage() {
    if (currentPage > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void setHours(double value) {
    hours = value.ceil();
    notifyListeners();
  }

  void setMinutes(double value) {
    minutes = value.ceil();
    notifyListeners();
  }

  void loading() {
    isLoading = true;
    notifyListeners();
  }

  void completed() {
    isLoading = false;
    notifyListeners();
  }

  void changeMaxHours(String value) {
    if (value == 'per week') {
      maxHours = 160;
    } else {
      hours > 23 ? hours = 21 : null;
      maxHours = 23;
    }
    notifyListeners();
  }
}

final onboardingController =
    ChangeNotifierProvider((ref) => OnboaardingController());
