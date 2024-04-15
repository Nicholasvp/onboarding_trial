import 'package:flutter/material.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    super.key,
    this.image,
    this.title,
    this.description,
    this.offsetImage,
    this.offsetTitle,
    this.offsetTop,
    this.subtitle,
    this.offsetSubtitle,
  });

  final Widget? image;
  final Widget? title;
  final Widget? subtitle;
  final Widget? description;
  final double? offsetTop;
  final double? offsetImage;
  final double? offsetTitle;
  final double? offsetSubtitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: offsetTop),
              image ?? Container(),
              SizedBox(height: offsetImage),
              title ?? Container(),
              SizedBox(height: offsetTitle),
              subtitle ?? Container(),
              SizedBox(height: offsetSubtitle),
              description ?? Container(),
            ],
          )),
    );
  }
}
