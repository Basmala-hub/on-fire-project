import 'package:flutter/material.dart';
import 'package:on_fire/core/utils/colors/color_model.dart';

Widget notfaction({
  required String status,
  required String massage,
  required String time,
  required String title,
}) {
  return Container(
    height: 150,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: AppColors.primary,
      border: Border(
        left: BorderSide(
          width: 3,
          color: status == "fire"
              ? Colors.red
              : const Color.fromARGB(255, 131, 89, 86),
        ),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        spacing: 10,
        crossAxisAlignment: .start,
        children: [
          Icon(
            status == "fire" ? Icons.thermostat : Icons.warning,
            color: Colors.redAccent,
          ),
          Column(
            crossAxisAlignment: .start,
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: const Color.fromARGB(255, 202, 195, 195),
                  fontSize: 18,
                ),
              ),
              Text(
                massage,
                style: TextStyle(
                  color: const Color.fromARGB(255, 199, 192, 192),
                  fontSize: 15,
                  fontWeight: .w500,
                ),
              ),
              Text(
                time,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: .w500,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: status == "fire" ? Colors.red : Colors.redAccent,
                  borderRadius: BorderRadius.circular(5),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    title,
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
// message
// :"Smoke level is HIGH!"
// status
// :"fire"
// time
// :196088
// title
// :"FIRE ALERT"