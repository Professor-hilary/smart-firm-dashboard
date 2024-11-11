import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';

class AnalyticsCard extends StatelessWidget {
  final String title;
  final int number;
  final double growthRate; // Percentage change

  const AnalyticsCard({
    super.key,
    required this.title,
    required this.number,
    required this.growthRate,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: SizedBox(
        height: 150,
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                    ),
                    Text(
                      // number.toString(),
                      NumberFormat("#,###.00").format(number),
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w100,
                              ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(20),
                          right: Radius.circular(20),
                        ),
                        color: growthRate > 0
                            ? Colors.green.shade100
                            : Colors.red.shade100,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 2.0),
                            child: Text(
                              growthRate > 0
                                  ? "+${growthRate.toStringAsFixed(1)}%"
                                  : "${growthRate.toStringAsFixed(1)}%",
                              style: TextStyle(
                                letterSpacing: 1.1,
                                fontSize: 12.0,
                                color: getGrowthColor(growthRate),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 4.0),
                          getGrowthWidget(growthRate),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getGrowthWidget(double growthRate) {
    if (growthRate > 0) {
      return const Icon(FontAwesome.arrow_circle_up, color: Colors.green);
    } else if (growthRate < 0) {
      return const Icon(FontAwesome.arrow_circle_down, color: Colors.red);
    } else {
      return const SizedBox();
    }
  }

  Color getGrowthColor(double growthRate) {
    if (growthRate > 0) {
      return Colors.green;
    } else if (growthRate < 0) {
      return Colors.red;
    } else {
      return Colors.black;
    }
  }
}

class TotalActionsCard extends AnalyticsCard {
  final int totalActions;
  final double growthRating; // Optional

  const TotalActionsCard({
    super.key,
    required this.totalActions,
    this.growthRating = 0.0,
  }) : super(
          title: "Total Actions",
          number: totalActions,
          growthRate: growthRating,
        );
}

class UserEngagementCard extends AnalyticsCard {
  final double averageEngagementTime;
  final double growthRating; //
  UserEngagementCard({
    super.key,
    required this.averageEngagementTime,
    required this.growthRating,
  }) : super(
          title: "Avg. Engagement Time",
          number: averageEngagementTime
              .round(), // Assuming time in minutes, round to integer
          growthRate:
              growthRating, // Replace with actual growth rate calculation
        );
}

class TopItemsConvertedCard extends AnalyticsCard {
  final int totalConvertedItems;
  final double growthRating; // Optional

  const TopItemsConvertedCard({
    super.key,
    required this.totalConvertedItems,
    this.growthRating = 0.0,
  }) : super(
          title: "Top Items Converted",
          number: totalConvertedItems,
          growthRate: growthRating,
        );
}

class NewUsersCard extends AnalyticsCard {
  final int newUsers;
  final double growthRating; // Optional

  const NewUsersCard({
    super.key,
    required this.newUsers,
    this.growthRating = 0.0,
  }) : super(
          title: "New Users",
          number: newUsers,
          growthRate: growthRating,
        );
}

class RevenueGeneratedCard extends AnalyticsCard {
  final double totalRevenue;
  final double growthRating; // Optional

  RevenueGeneratedCard({
    super.key,
    required this.totalRevenue,
    this.growthRating = 0.0,
  }) : super(
          title: "Revenue Generated",
          number: totalRevenue.round(), // Assuming currency, round to integer
          growthRate: growthRating,
        );
}
