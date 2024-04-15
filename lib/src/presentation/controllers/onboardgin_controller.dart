import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onboarding_trial/src/routes/my_routes.dart';

class OnboardginController extends ChangeNotifier {
  final PageController pageController = PageController();
  int currentPage = 0;
  int articules = 0;
  int youtuveVideos = 0;
  bool isLoading = false;

  void onPageChanged(int page) {
    currentPage = page;
    notifyListeners();
  }

  void nextPage(BuildContext context) async {
    if (currentPage < 2) {
      currentPage++;

      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      loading();
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

  void setArticules(int value) {
    articules = value;
    notifyListeners();
  }

  void setYoutubeVideos(int value) {
    youtuveVideos = value;
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
}

final onboardingController =
    ChangeNotifierProvider((ref) => OnboardginController());
