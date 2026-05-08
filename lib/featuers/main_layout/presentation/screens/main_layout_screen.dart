import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:on_fire/core/utils/colors/color_model.dart';
import 'package:on_fire/core/utils/icons/icon_model.dart';
import 'package:on_fire/featuers/alerts/presentation/view/screen/alerts_screen.dart';
import 'package:on_fire/featuers/analytics/presentation/view/screens/analytic_screen.dart';
import 'package:on_fire/featuers/dash_board/peresantaion/view/screens/dash_bord_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class MainLayoutScreen extends StatefulWidget {
  const MainLayoutScreen({super.key});
  static final String routeName="MainLayoutScreen";

  @override
  State<MainLayoutScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Widget> _buildScreens() {
    return const [
      DashBordScreen(),
      AlertsScreen(),
      AnalyticScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          AppAssets.dashBoard,
          width: 30,
          height: 30,
          colorFilter: const ColorFilter.mode(
            AppColors.primary,
            BlendMode.srcIn,
          ),
        ),
        inactiveIcon: SvgPicture.asset(
          AppAssets.dashBoard,
          width: 30,
          height: 30,
          colorFilter: const ColorFilter.mode(
            Colors.grey,
            BlendMode.srcIn,
          ),
        ),
        title: "Dashboard",
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: Colors.grey,
      ),

      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          AppAssets.alert,
          width: 30,
          height: 30,
          colorFilter: const ColorFilter.mode(
            AppColors.primary,
            BlendMode.srcIn,
          ),
        ),
        inactiveIcon: SvgPicture.asset(
          AppAssets.alert,
          width: 30,
          height: 30,
          colorFilter: const ColorFilter.mode(
            Colors.grey,
            BlendMode.srcIn,
          ),
        ),
        title: "Alerts",
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: Colors.grey,
      ),

      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          AppAssets.analytic,
          width: 30,
          height: 30,
          colorFilter: const ColorFilter.mode(
            AppColors.primary,
            BlendMode.srcIn,
          ),
        ),
        inactiveIcon: SvgPicture.asset(
          AppAssets.analytic,
          width: 30,
          height: 30,
          colorFilter: const ColorFilter.mode(
            Colors.grey,
            BlendMode.srcIn,
          ),
        ),
        title: "Analytics",
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineToSafeArea: true,
      backgroundColor: AppColors.primary,
      stateManagement: true,
      decoration: NavBarDecoration(
        border: Border(
          top: BorderSide(
            color: AppColors.primary,
            width: 1.5,
          ),
        ),
      ),
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          animateTabTransition: true,
          duration: Duration(milliseconds: 200),
          screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
        ),
      ),
      navBarStyle: NavBarStyle.style7,
    );
  }
}