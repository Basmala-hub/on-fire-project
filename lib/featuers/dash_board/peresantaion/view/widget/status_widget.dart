import 'package:flutter/material.dart';
import 'package:on_fire/core/utils/colors/color_model.dart';

Widget statusCard({ required String title,required String describtion}) {
  return Container(
    height: 130,
    width: double.infinity,
    decoration: BoxDecoration(
      color: AppColors.primary,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      mainAxisAlignment: .center,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: .bold,
          ),
        ),
        Text(describtion, style: TextStyle(color: Colors.white)),
      ],
    ),
  );
}
