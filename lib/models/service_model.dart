import 'package:flutter/material.dart';

class ServiceModel {
  final String title;
  final String subTitle;
  final String imagePath;
  final Color titleColor;
  final Color subTitleColor;
  final Color circleColor;
  final Color containerColor;
  final Widget screen;

  const ServiceModel(
      {required this.title,
      required this.subTitle,
      required this.imagePath,
      required this.titleColor,
      required this.subTitleColor,
      required this.containerColor,
      required this.circleColor,
      required this.screen});
}
