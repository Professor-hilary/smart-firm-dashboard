import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smartlab/charts/chat_samples/bar_chart_sample4.dart';
import 'package:smartlab/charts/chat_samples/pie_chart_sample2.dart';
import 'package:smartlab/screens/metricsscreen/components/activity_sumary.dart';
import 'package:smartlab/screens/metricsscreen/components/datepicker.dart';
import 'package:smartlab/screens/metricsscreen/components/summary_cards/analystics_card.dart';
import 'package:smartlab/screens/usersscreen/components/user_growth_chart.dart';

class MetricsScreen extends StatefulWidget {
  const MetricsScreen({super.key});

  @override
  State<MetricsScreen> createState() => _MetricsAndAnalysisState();
}

class _MetricsAndAnalysisState extends State<MetricsScreen> {
  String _selectedValue = "Past Month";
  DateTime? _startDate;

  final DateTime _endDate = DateTime.now(); // Today's date by default

  void _updateDateRange(String value) {
    setState(() {
      _selectedValue = value;
      _calculateDateRange(value); // Update start date based on selection
    });
  }

  void _calculateDateRange(String value) {
    _startDate = null; // Reset on every selection
    switch (value) {
      case "Past Month":
        _startDate = _endDate.subtract(const Duration(days: 30));
        break;
      case "Past 4 Months":
        _startDate = _endDate.subtract(const Duration(days: 30 * 4));
        break;
      case "Past Half Year":
        _startDate = _endDate.subtract(const Duration(days: 365 ~/ 2));
        break;
      case "Past Year":
        _startDate = _endDate.subtract(const Duration(days: 365));
        break;
    }
  }

  String _formatDate(DateTime date) {
    final formatter = DateFormat('d MMM yyyy'); // Define format string
    return formatter.format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(color: Colors.grey.shade200),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Window title
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    "Metrics Dashboard",
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ),
              ],
            ),
            // Date range picker
            Row(
              children: [
                DateRangeDropdown(
                  selectedValue: _selectedValue,
                  onChanged: _updateDateRange,
                ),
                const SizedBox(width: 8.0),
                Text(
                  (_startDate != null)
                      ? "${_formatDate(_startDate!)}  -  ${_formatDate(_endDate)}"
                      : "", // Display date range only if start date is set
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            // Summary cards display title
            const ActivitySummary(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TotalActionsCard(
                  totalActions: 12,
                  growthRating: 20,
                ),
                UserEngagementCard(
                  averageEngagementTime: 2,
                  growthRating: -12,
                ),
                const TopItemsConvertedCard(
                  totalConvertedItems: 3000,
                  growthRating: -30,
                ),
                const NewUsersCard(
                  newUsers: 243,
                  growthRating: 25,
                ),
                RevenueGeneratedCard(
                  totalRevenue: 2300000,
                  growthRating: 10,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 450,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height - 50,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "All Revenue Content and Craft Sales",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 300,
                            width: MediaQuery.of(context).size.width / 3.5,
                            child: BarChartSample4(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height - 50,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Most Active Users By country",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 300,
                            child: TopCountriesTable(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height - 50,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'All Reviews from stakeholders',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 300,
                            width: 500,
                            child: PieChartSample2(),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 400,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40.0,
                              vertical: 24,
                            ),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: const Text(
                                'Current trends',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          TrendsTable(),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40.0,
                              vertical: 24,
                            ),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: const Text(
                                "Growth Trend",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 300,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: const UserGrowthChart(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopCountriesTable extends StatelessWidget {
  final List<Map<String, dynamic>> topCountries = [
    {"country": "United States", "activeUsers": 5000},
    {"country": "India", "activeUsers": 4500},
    {"country": "Brazil", "activeUsers": 4000},
    {"country": "Brazil", "activeUsers": 5000},
    {"country": "Brazil", "activeUsers": 7000},
  ];

  TopCountriesTable({super.key});

  @override
  Widget build(BuildContext context) {
    var textColor = const TextStyle(color: Colors.black); // Colors.black;
    return Center(
      child: SingleChildScrollView(
        child: DataTable(
          columns: const [
            DataColumn(
              label: Text(
                'Country',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            DataColumn(
              label: Text(
                'Active Users',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
          rows: topCountries.map((country) {
            return DataRow(
              cells: [
                DataCell(
                  Text(
                    country["country"],
                    style: textColor,
                  ),
                ),
                DataCell(
                  Text(
                    country["activeUsers"].toString(),
                    style: textColor,
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}

class TrendsTable extends StatelessWidget {
  final List<Map<String, dynamic>> trendsData = [
    {
      "stakeholder": "Stakeholder 1",
      "month1": 100,
      "month2": 120,
      "change": 20,
    },
    {
      "stakeholder": "Stakeholder 2",
      "month1": 150,
      "month2": 130,
      "change": -13.33,
    },
    {
      "stakeholder": "Stakeholder 3",
      "month1": 200,
      "month2": 220,
      "change": 10,
    },
    {
      "stakeholder": "Stakeholder 4",
      "month1": 170,
      "month2": 160,
      "change": -5.88,
    },
    {
      "stakeholder": "Stakeholder 5",
      "month1": 300,
      "month2": 330,
      "change": 10,
    },
  ];

  TrendsTable({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle trendsTitleDataStyle = const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
    );
    TextStyle trendsDataStyle = const TextStyle(color: Colors.black);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: const BoxDecoration(color: Colors.black12),
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: [
              DataColumn(
                label: Text('Stakeholder', style: trendsTitleDataStyle),
              ),
              DataColumn(label: Text('Month 1', style: trendsTitleDataStyle)),
              DataColumn(label: Text('Month 2', style: trendsTitleDataStyle)),
              DataColumn(
                label: Text('Change (%)', style: trendsTitleDataStyle),
              ),
              DataColumn(label: Text('Graph', style: trendsTitleDataStyle)),
            ],
            rows: trendsData.map((trend) {
              return DataRow(
                cells: [
                  DataCell(
                    Text(trend["stakeholder"], style: trendsDataStyle),
                  ),
                  DataCell(
                    Text(trend["month1"].toString(), style: trendsDataStyle),
                  ),
                  DataCell(
                    Text(trend["month2"].toString(), style: trendsDataStyle),
                  ),
                  DataCell(
                    Text(
                      trend["change"].toStringAsFixed(2),
                      style: trendsDataStyle,
                    ),
                  ),
                  DataCell(
                    TrendGraph(
                      month1: trend["month1"],
                      month2: trend["month2"],
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class TrendGraph extends StatelessWidget {
  final int month1;
  final int month2;

  const TrendGraph({super.key, required this.month1, required this.month2});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 50,
      child: CustomPaint(
        painter: TrendGraphPainter(month1: month1, month2: month2),
      ),
    );
  }
}

class TrendGraphPainter extends CustomPainter {
  final int month1;
  final int month2;

  TrendGraphPainter({required this.month1, required this.month2});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(0, size.height - (month1 / 400 * size.height));
    path.lineTo(size.width, size.height - (month2 / 400 * size.height));

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
