import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:on_fire/core/utils/colors/color_model.dart';
import 'package:on_fire/core/utils/icons/icon_model.dart';

PreferredSizeWidget customAppBar() => AppBar(
  leading: Padding(
    padding: const EdgeInsets.all(12),
    child: SvgPicture.asset(AppAssets.fire, width: 24, height: 24),
  ),
  backgroundColor: AppColors.primary,
  title: Text("ONFIRE", style: TextStyle(color: Colors.white)),
);
