import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_fire/core/utils/colors/color_model.dart';
import 'package:on_fire/core/utils/widgets/custom_app_bar_widget.dart';
import 'package:on_fire/featuers/alerts/presentation/view/widgets/formate_time.dart';
import 'package:on_fire/featuers/alerts/presentation/view/widgets/notfaction_widget.dart';
import 'package:on_fire/featuers/dash_board/peresantaion/view_model/home_cubit.dart';
import 'package:on_fire/featuers/dash_board/peresantaion/view_model/home_state.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AlertsScreen extends StatefulWidget {
  const AlertsScreen({super.key});
  static final String routName = "AlertsScreen";
  @override
  State<AlertsScreen> createState() => _AlertsScreenState();
}

class _AlertsScreenState extends State<AlertsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: .start,
            spacing: 15,
            children: [
              Text(
                "Alerts History",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: .bold,
                ),
              ),
              Text(
                "Recent notifications and system events.",
                style: TextStyle(
                  color: const Color.fromARGB(255, 199, 186, 186),
                  fontSize: 16,
                ),
              ),
              BlocBuilder<OnFireCubit, FireState>(
                builder: (context, state) {
                  if (state is LoadingState) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Skeletonizer(
                          enabled: true,
                          child: notfaction(
                            status: "fire",
                            massage: "Smoke level is HIGH!",
                            time: "196088",
                            title: "FIRE ALERT",
                          ),
                        );
                      },
                    );
                  } else if (state is SucessState) {
                    // ✅ تأكدي من الاسم
                    final list = state.data.fireSystem.notifications;

                    if (list.isEmpty) {
                      return Center(
                        child: Text(
                          "No alerts yet",
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }

                    return ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        final alert = list[index];

                        return notfaction(
                          status: alert.status,
                          massage: alert.message,
                          time: formatTimeFull(alert.time),
                          title: alert.title,
                        );
                      },
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
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
            ],
          ),
        ),
      ),
    );
  }
}
