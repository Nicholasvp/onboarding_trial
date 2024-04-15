import 'package:circular/circular.dart';
import 'package:flutter/material.dart';
import 'package:onboarding_trial/src/presentation/core/my_typography.dart';

class CustomCircularSlider extends StatelessWidget {
  const CustomCircularSlider({
    super.key,
    required this.action,
    required this.value,
  });

  final Function(int) action;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircularSlider(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(200),
          ),
          maxValue: 350,
          radius: 150,
          color: Colors.transparent,
          sliderColor: Colors.redAccent,
          unSelectedColor: Colors.black12,
          onDrag: (value) {
            action(value);
          },
          child: Text(
            '',
            style: MyTypography.titleBig,
          ),
        ),
        CircularSlider(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(200),
          ),
          maxValue: 350,
          radius: 80,
          color: Colors.transparent,
          sliderColor: Colors.redAccent,
          unSelectedColor: Colors.transparent,
          onDrag: (value) {
            action(value);
          },
          child: Text(
            '$value hours',
            style: MyTypography.titleBig,
          ),
        ),
      ],
    );
  }
}
