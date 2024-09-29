import 'package:flutter/material.dart';

import '../../../../../core/constants/color_constants.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Chip(
        backgroundColor: AppColors.primarySwatch.withOpacity(0.15),
        side: const BorderSide(
          color: Colors.transparent,
        ),
        label: Text(
          text,
          style: TextStyle(color: AppColors.primarySwatch),
        ));
  }
}
