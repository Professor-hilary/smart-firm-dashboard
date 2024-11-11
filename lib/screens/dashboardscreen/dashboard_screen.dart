import 'package:flutter/material.dart';
import 'package:smartlab/core/constants/color_constants.dart';
import 'package:smartlab/responsive.dart';
import 'package:smartlab/screens/dashboardscreen/components/header/header.dart';
import 'package:smartlab/screens/dashboardscreen/components/minicards/mini_information_card.dart';
import 'package:smartlab/screens/dashboardscreen/components/recentwidget/recent_users%20copy.dart';
import 'package:smartlab/screens/dashboardscreen/components/revenuewidget/revenue_widget.dart';
import 'package:smartlab/screens/dashboardscreen/components/userdetails/user_details_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        //padding: EdgeInsets.all(defaultPadding),
        child: Container(
          color: Colors.grey[200],
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              const Header(),
              const SizedBox(height: defaultPadding),
              const MiniInformation(),
              const SizedBox(height: defaultPadding),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        const RecentUsers(),
                        const SizedBox(height: defaultPadding),
                        const RevenueChart(),
                        if (Responsive.isMobile(context))
                          const SizedBox(height: defaultPadding),
                        if (Responsive.isMobile(context))
                          const UserDetailsWidget(),
                      ],
                    ),
                  ),
                  if (!Responsive.isMobile(context))
                    const SizedBox(width: defaultPadding),
                  // On Mobile means if the screen is less than 850 we dont want to show it
                  if (!Responsive.isMobile(context))
                    const Expanded(flex: 2, child: UserDetailsWidget()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
