import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_fire/core/utils/colors/color_model.dart';
import 'package:on_fire/core/utils/widgets/custom_app_bar_widget.dart';
import 'package:on_fire/featuers/alerts/presentation/view/widgets/formate_time.dart';
import 'package:on_fire/featuers/dash_board/peresantaion/view/widget/card_status.dart';
import 'package:on_fire/featuers/dash_board/peresantaion/view/widget/status_widget.dart';
import 'package:on_fire/featuers/dash_board/peresantaion/view/widget/trend_widget.dart';
import 'package:on_fire/featuers/dash_board/peresantaion/view_model/home_cubit.dart';
import 'package:on_fire/featuers/dash_board/peresantaion/view_model/home_state.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DashBordScreen extends StatefulWidget {
  const DashBordScreen({super.key});
  static const String routeName = "HomeScreen";

  @override
  State<DashBordScreen> createState() => _DashBordScreenState();
}

class _DashBordScreenState extends State<DashBordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      backgroundColor: AppColors.background,

      body: BlocBuilder<OnFireCubit, FireState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
                return Skeletonizer(
                  enabled: true,
                  child: smokeLevel(
                    title: "loading",
                    amount: "0",
                    unit: "0",
                    icon: Icon(Icons.local_activity),
                  ),
                );
              },
            );
          }

          if (state is SucessState) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  spacing: 10,
                  children: [
                    statusCard(
                      title: state.data.fireSystem.currentStatus.status,
                      describtion: "air quality is stable",
                    ),

                    smokeLevel(
                      title: "Smoke Level",
                      amount: "${state.data.fireSystem.currentStatus.gasLevel}",
                      unit: "ppm",
                      icon: Icon(Icons.air, color: Color(0xffaff4c6)),
                    ),

                    smokeLevel(
                      title: "Last Update",
                      amount: formatTimeFull(
                        state.data.fireSystem.currentStatus.lastUpdate,
                      ),
                      unit: "sec ago",
                      icon: Icon(
                        Icons.timer,
                        color: Color.fromARGB(255, 155, 182, 204),
                      ),
                    ),

                    liveTrend(data: state.data.fireSystem.history),
                  ],
                ),
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
