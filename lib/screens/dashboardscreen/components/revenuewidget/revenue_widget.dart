import 'package:flutter/material.dart';
import 'package:smartlab/charts/chat_samples/line_chart_sample.dart';
import 'package:smartlab/core/constants/color_constants.dart';
import 'package:smartlab/core/utils/colorful_tag.dart';
import 'package:smartlab/models/recent_user_model.dart';

class RevenueChart extends StatefulWidget {
  const RevenueChart({super.key});

  @override
  State<RevenueChart> createState() => _RevenueChartState();
}

class _RevenueChartState extends State<RevenueChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: Colors.white, // secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 12.0,
            ),
            child: Text(
              "Revenue Chart",
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          const SizedBox(
            width: double.infinity,
            child: LineChartSample2(),
          ),
        ],
      ),
    );
  }
}

DataRow recentUserDataRow(RecentUser userInfo) {
  return DataRow(
    cells: [
      DataCell(
        placeholder: false,
        showEditIcon: true,
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: getRoleColor(userInfo.role).withOpacity(.2),
            border: Border.all(color: getRoleColor(userInfo.role)),
            borderRadius: const BorderRadius.all(
              Radius.circular(5.0), //
            ),
          ),
          child: Text(userInfo.role!),
        ),
      ),
      DataCell(Text(userInfo.date!)),
      // DataCell(Text(userInfo.posts!)),
    ],
  );
}
