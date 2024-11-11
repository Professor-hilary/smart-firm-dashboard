import 'package:flutter/material.dart';
import 'package:smartlab/core/home/components/side_menu.dart';
import 'package:smartlab/responsive.dart';
import 'package:smartlab/screens/contentsscreen/content_screen.dart';
import 'package:smartlab/screens/dashboardscreen/dashboard_screen.dart';
import 'package:smartlab/screens/metricsscreen/metrics_and_analysis.dart';
import 'package:smartlab/screens/partnerscreen/partner_screen.dart';
import 'package:smartlab/screens/revenuescreen/revenue_screen.dart';
import 'package:smartlab/screens/usersscreen/users_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onMenuItemSelected(int index) => setState(() => _selectedIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: context.read<MenuController>().scaffoldKey,
      drawer: SideMenu(onMenuItemSelected: _onMenuItemSelected),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(onMenuItemSelected: _onMenuItemSelected),
                // child: DashboardScreenSidePane( onMenuItemSelected: _onMenuItemSelected),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: _buildScreen(_selectedIndex),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScreen(int index) {
    switch (index) {
      case 0:
        return const DashboardScreen();
      case 1:
        return const ContentManagement();
      case 2:
        return const MetricsScreen();
      case 3:
        return const UsersScreen();
      case 4:
        return const RevenueScreen();
      default:
        return const PartnersScreen();
    }
  }
}
