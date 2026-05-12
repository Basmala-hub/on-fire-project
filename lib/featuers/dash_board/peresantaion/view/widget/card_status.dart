import 'package:flutter/material.dart';
import 'package:on_fire/core/utils/colors/color_model.dart';

Widget smokeLevel({
  required String title,
  required String amount,
  required String unit,
  required Icon icon,
}) {
  return SizedBox(
    width: double.infinity,
    child: Card(
      color: AppColors.primary,
      child: ListTile(
        title: Text(title, style: TextStyle(color: Colors.white, fontSize: 18)),
        subtitle: Text.rich(
          TextSpan(
            text: amount,
            style: TextStyle(
              fontSize: 20,
              color: const Color.fromARGB(255, 87, 142, 187),
              fontWeight: .bold,
            ),
            children: [
              TextSpan(
                text: unit,
                style: TextStyle(fontSize: 10, color: Colors.white24),
              ),
            ],
          ),
        ),
        trailing: icon,
      ),
    ),
  );
}
