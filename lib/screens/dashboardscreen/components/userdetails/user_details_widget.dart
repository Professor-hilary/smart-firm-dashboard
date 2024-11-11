import 'package:flutter/material.dart';
import 'package:smartlab/core/constants/color_constants.dart';
import 'package:smartlab/screens/dashboardscreen/components/calenderwidget/calendar_widget.dart';
import 'package:smartlab/screens/dashboardscreen/components/minicards/user_details_mini_card.dart';
import 'package:smartlab/screens/dashboardscreen/components/userdetails/charts.dart';

class UserDetailsWidget extends StatelessWidget {
  const UserDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: Colors.white, // secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CalendarWidget(),
          SizedBox(height: defaultPadding),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
              "Content Metrics",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Chart(),
          UserDetailsMiniCard(
            color: Color(0xff0293ee),
            title: "Subject A",
            amountOfFiles: "%28.3",
            numberOfIncrease: 1328,
          ),
          UserDetailsMiniCard(
            color: Color(0xfff8b250),
            title: "Subject B",
            amountOfFiles: "%16.7",
            numberOfIncrease: 1328,
          ),
          UserDetailsMiniCard(
            color: Color(0xff845bef),
            title: "Subject C",
            amountOfFiles: "%22.4",
            numberOfIncrease: 1328,
          ),
          UserDetailsMiniCard(
            color: Color(0xff13d38e),
            title: "Subject D",
            amountOfFiles: "%2.3",
            numberOfIncrease: 140,
          ),
        ],
      ),
    );
  }
}
