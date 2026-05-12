import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_fire/core/utils/colors/color_model.dart';
import 'package:on_fire/core/utils/widgets/custom_app_bar_widget.dart';
import 'package:on_fire/featuers/alerts/presentation/view/widgets/formate_time.dart';
import 'package:on_fire/featuers/analytics/presentation/view/widgets/analytics_details.dart';
import 'package:on_fire/featuers/analytics/presentation/view/widgets/daily_activity.dart';
import 'package:on_fire/featuers/dash_board/peresantaion/view_model/home_cubit.dart';
import 'package:on_fire/featuers/dash_board/peresantaion/view_model/home_state.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AnalyticScreen extends StatefulWidget {
  const AnalyticScreen({super.key});
  static final String routeName = "AnalyticScreen";

  @override
  State<AnalyticScreen> createState() => _AnalyticScreenState();
}

class _AnalyticScreenState extends State<AnalyticScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: BlocBuilder<OnFireCubit, FireState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Skeletonizer(
                    enabled: true,
                    child: details(
                      title: "Highest Smoke Level",
                      color: Colors.red,
                      icon: Icons.warning,
                      number: "92",
                      unit: "AQI",
                    ),
                  );
                },
              );
            } else if (state is SucessState) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: .start,
                  spacing: 10,
                  children: [
                    Text(
                      "Analytics Overview",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: .bold,
                      ),
                    ),
                    Text(
                      "Last 24 hours performance data .",
                      style: TextStyle(color: Colors.white),
                    ),
                    dailySmokeActivaty(state.data.fireSystem.history),
                    details(
                      title: "Highest Smoke Level",
                      color: Colors.red,
                      icon: Icons.warning,
                      number:
                          "${state.data.fireSystem.analytics.highestSmokeLevel}",
                      unit: "AQI",
                    ),
                    details(
                      title: "Average Smoke Level",
                      color: Colors.white,
                      icon: Icons.bar_chart_rounded,
                      number:
                          "${state.data.fireSystem.analytics.averageSmokeLevel}",
                      unit: "AQI",
                    ),
                    details(
                      title: "Total Alerts",
                      color: const Color.fromARGB(255, 116, 131, 190),
                      icon: Icons.notification_important,
                      number: "${state.data.fireSystem.analytics.totalAlerts}",
                    ),
                    details(
                      title: "last Peak Time",
                      color: const Color.fromARGB(255, 116, 131, 190),
                      icon: Icons.timer,
                      number: formatTimeFull(
                        state.data.fireSystem.analytics.lastPeakTime,
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is ErrorState) {
              return Center(
                child: Text(
                  "Error loading alerts",
                  style: TextStyle(color: Colors.white),
                ),
              );
            } else {
              return SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
