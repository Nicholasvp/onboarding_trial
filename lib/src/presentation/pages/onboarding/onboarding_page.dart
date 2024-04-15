import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onboarding_trial/src/presentation/controllers/onboardgin_controller.dart';
import 'package:onboarding_trial/src/presentation/core/my_images.dart';
import 'package:onboarding_trial/src/presentation/core/my_typography.dart';
import 'package:onboarding_trial/src/presentation/widgets/custom_circular_slider.dart';
import 'package:onboarding_trial/src/presentation/widgets/dropdown_type.dart';
import 'package:onboarding_trial/src/presentation/widgets/onboarding_content.dart';

class OnboardingPage extends ConsumerWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(onboardingController);

    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [
          OnboardingContent(
            image: Image.asset(
              MyImages.firstSteps,
              height: 400,
            ),
            title: Text(
              'WELCOME',
              style: MyTypography.titleBig,
            ),
            offsetTitle: 24,
            description: Text(
              'Let\'s take our first steps',
              style: MyTypography.bodyOnboarding,
            ),
          ),
          OnboardingContent(
            offsetTop: 40,
            image: Text(
              'What is your goal?',
              style: MyTypography.title,
              textAlign: TextAlign.center,
            ),
            offsetImage: 24,
            title: Text(
              'Turn the circle',
              style: MyTypography.body1,
            ),
            offsetTitle: 24,
            subtitle: CustomCircularSlider(
                action: controller.setYoutubeVideos,
                value: controller.youtuveVideos),
            offsetSubtitle: 24,
            description: const DropdownType(
              list: ['per week', 'per day'],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 48),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            2,
            (index) => Container(
              margin: const EdgeInsets.all(4),
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: controller.currentPage == index
                    ? Colors.redAccent
                    : Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.nextPage(context),
        backgroundColor: Colors.redAccent,
        child: controller.isLoading
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : const Icon(Icons.arrow_forward),
      ),
    );
  }
}
