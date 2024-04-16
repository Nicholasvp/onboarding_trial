import 'package:flutter/material.dart';
import 'package:onboarding_trial/src/presentation/core/my_typography.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class CustomCircularSlider extends StatelessWidget {
  const CustomCircularSlider({
    super.key,
    required this.setHours,
    required this.setMinutes,
    required this.hours,
    required this.minutes,
    required this.maxHours,
  });

  final Function(double) setHours;
  final Function(double) setMinutes;
  final int hours;
  final int minutes;
  final int maxHours;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SleekCircularSlider(
          max: maxHours.toDouble(),
          initialValue: 20,
          appearance: CircularSliderAppearance(
              customColors: CustomSliderColors(
                progressBarColors: [Colors.redAccent, Colors.purple],
                trackColor: Colors.black12,
                shadowColor: Colors.black,
              ),
              angleRange: 360,
              startAngle: 180,
              size: 300,
              customWidths: CustomSliderWidths(progressBarWidth: 15),
              infoProperties: InfoProperties(
                  modifier: (double value) {
                    return '${hours}h ${minutes}min';
                  },
                  mainLabelStyle: MyTypography.title)),
          onChange: (value) {
            setHours(value);
          },
        ),
        SleekCircularSlider(
          max: 59,
          min: 0,
          initialValue: 10,
          appearance: CircularSliderAppearance(
              customColors: CustomSliderColors(
                progressBarColors: [Colors.purple, Colors.redAccent],
                trackColor: Colors.black12,
                shadowColor: Colors.black,
              ),
              angleRange: 360,
              startAngle: 180,
              size: 220,
              customWidths: CustomSliderWidths(progressBarWidth: 15),
              infoProperties: InfoProperties(
                modifier: (double value) {
                  return '';
                },
              )),
          onChange: (value) {
            setMinutes(value);
          },
        ),
      ],
    );
  }
}
