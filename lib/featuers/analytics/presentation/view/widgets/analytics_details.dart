import 'package:flutter/material.dart';
import 'package:on_fire/core/utils/colors/color_model.dart';

Widget details({
  required String title,
  required String number,
  required IconData icon,
  String unit = "",
  required Color color,
}) {
  return Container(
    height: 100,
    decoration: BoxDecoration(
      color: AppColors.primary,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: .start,
        mainAxisAlignment: .spaceBetween,
        children: [
          Column(
            mainAxisAlignment: .spaceEvenly,
            crossAxisAlignment: .start,
            children: [
              Text(title, style: TextStyle(fontSize: 15, color: Colors.white)),
              Text.rich(
                TextSpan(
                  text: number,
                  style: TextStyle(
                    fontSize: 20,
                    color: color,
                    fontWeight: .bold,
                  ),
                  children: [
                    TextSpan(
                      text: unit,
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Icon(icon, color: color),
        ],
      ),
    ),
  );
}
