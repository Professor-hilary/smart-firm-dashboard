import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class UserGrowthChart extends StatelessWidget {
  const UserGrowthChart({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle axisLabelStyle = const TextStyle(color: Colors.black).copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );

    return LineChart(
      LineChartData(
        minX: 0,
        maxX: 11,
        minY: 0,
        maxY: 200,
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              interval: 1,
              getTitlesWidget: (value, meta) {
                switch (value.toInt()) {
                  case 0:
                    return Text('Jan', style: axisLabelStyle);
                  case 1:
                    return Text('Feb', style: axisLabelStyle);
                  case 2:
                    return Text('Mar', style: axisLabelStyle);
                  case 3:
                    return Text('Apr', style: axisLabelStyle);
                  case 4:
                    return Text('May', style: axisLabelStyle);
                  case 5:
                    return Text('Jun', style: axisLabelStyle);
                  case 6:
                    return Text('Jul', style: axisLabelStyle);
                  case 7:
                    return Text('Aug', style: axisLabelStyle);
                  case 8:
                    return Text('Sep', style: axisLabelStyle);
                  case 9:
                    return Text('Oct', style: axisLabelStyle);
                  case 10:
                    return Text('Nov', style: axisLabelStyle);
                  case 11:
                    return Text('Dec', style: axisLabelStyle);
                }
                return Text('', style: axisLabelStyle);
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 100,
              reservedSize: 50,
              getTitlesWidget: (value, meta) {
                return Text('${value.toInt()}', style: axisLabelStyle);
              },
            ),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
        gridData: FlGridData(
          show: true,
          drawVerticalLine: true,
          getDrawingHorizontalLine: (value) {
            return const FlLine(
              color: Colors.grey,
              strokeWidth: 1,
            );
          },
          getDrawingVerticalLine: (value) {
            return const FlLine(
              color: Colors.grey,
              strokeWidth: 1,
            );
          },
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: Colors.grey, width: 1),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: [
              const FlSpot(0, 10),
              const FlSpot(1, 30),
              const FlSpot(2, 40),
              const FlSpot(3, 50),
              const FlSpot(4, 70),
              const FlSpot(5, 80),
              const FlSpot(6, 100),
              const FlSpot(7, 130),
              const FlSpot(8, 150),
              const FlSpot(9, 170),
              const FlSpot(10, 190),
              const FlSpot(11, 200),
            ],
            isCurved: true,
            color: Colors.blue,
            barWidth: 4,
            belowBarData: BarAreaData(
              show: true,
              color: Colors.blue.withOpacity(0.3),
            ),
          ),
        ],
      ),
    );
  }
}
