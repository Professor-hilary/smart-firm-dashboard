import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class RevenueScreen extends StatefulWidget {
  const RevenueScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _BroadcastScreenState();
  }
}

class _BroadcastScreenState extends State<RevenueScreen> {
  @override
  Widget build(BuildContext context) {
    return const Dashboard();
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Revenue and Sales Dashboard',
                style: Theme.of(
                  context,
                ).textTheme.headlineLarge?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              const SizedBox(height: 8),
              const Text(
                'A summary of financial performance and asset distribution.',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              const SizedBox(height: 32),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Material(
                      elevation: 5,
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  "Overall Revenue Growth",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            LineChartSample(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    flex: 1,
                    child: AssetDistribution(),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: AnalysisCard(title: 'Most Performing Asset')),
                  SizedBox(width: 8),
                  Expanded(child: AnalysisCard(title: 'Most Demanded Asset')),
                  SizedBox(width: 8),
                  Expanded(child: AnalysisCard(title: 'Cash Cow')),
                  SizedBox(width: 8),
                  Expanded(child: AnalysisCard(title: 'Percentage Revenue')),
                  SizedBox(width: 8),
                  Expanded(child: AnalysisCard(title: 'Other Guess')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LineChartSample extends StatelessWidget {
  const LineChartSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: 800,
        height: 500,
        child: LineChart(
          LineChartData(
            lineBarsData: [
              LineChartBarData(
                spots: [
                  const FlSpot(0, 1),
                  const FlSpot(1, 3),
                  const FlSpot(2, 5),
                  const FlSpot(3, 4),
                  const FlSpot(4, 7),
                  const FlSpot(5, 8),
                  const FlSpot(6, 6),
                  const FlSpot(7, 9),
                  const FlSpot(8, 10),
                  const FlSpot(9, 12),
                  const FlSpot(10, 11),
                  const FlSpot(11, 15),
                ],
              ),
            ],
            titlesData: FlTitlesData(
              show: true, // Enable left side titles
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 60,
                  getTitlesWidget: (value, meta) {
                    return Text(
                      '$value',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ),

              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 40,
                  getTitlesWidget: (value, meta) {
                    return Text(
                      '$value',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ),
              rightTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
            ),
            gridData: FlGridData(
              show: true,
              drawVerticalLine: true,
              drawHorizontalLine: true,
              getDrawingHorizontalLine: (value) {
                return const FlLine(
                  color: Colors.black26,
                  strokeWidth: 1,
                );
              },
              getDrawingVerticalLine: (value) {
                return const FlLine(
                  color: Colors.black26,
                  strokeWidth: 1,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class AssetDistribution extends StatelessWidget {
  const AssetDistribution({super.key});

  final TextStyle textStyle = const TextStyle(
    color: Colors.black,
    fontSize: 24,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Revenue Growth By Product",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Videos', style: textStyle),
                  Text("50%", style: textStyle),
                ],
              ),
              const AssetBar(percentage: 0.5),
              const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Documents', style: textStyle),
                  Text("20%", style: textStyle),
                ],
              ),
              const AssetBar(percentage: 0.2),
              const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Crafts', style: textStyle),
                  Text("80%", style: textStyle),
                ],
              ),
              const AssetBar(percentage: 0.8),
              const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Hotel', style: textStyle),
                  Text("23%", style: textStyle),
                ],
              ),
              const AssetBar(percentage: 0.23),
              const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Service', style: textStyle),
                  Text("45%", style: textStyle),
                ],
              ),
              const AssetBar(percentage: 0.45),
            ],
          ),
        ),
      ),
    );
  }
}

class AssetBar extends StatelessWidget {
  // final String asset;
  final double percentage;

  const AssetBar({
    super.key,
    // required this.asset,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: LinearProgressIndicator(
              minHeight: 20,
              color: Colors.green,
              value: percentage,
            ),
          ),
        ],
      ),
    );
  }
}

class AnalysisCard extends StatelessWidget {
  final String title;

  const AnalysisCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text('Detail about $title'),
            ],
          ),
        ),
      ),
    );
  }
}
