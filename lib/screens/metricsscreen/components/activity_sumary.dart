import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ActivitySummary extends StatefulWidget {
  const ActivitySummary({super.key});

  @override
  _ActivitySummaryState createState() => _ActivitySummaryState();
}

class _ActivitySummaryState extends State<ActivitySummary> {
  String selectedCategory = "All Stakeholders";

  List<String> categories = <String>[
    "Hotels",
    "Restaurants",
    "Craft shops",
    "Content creators",
    "All Stakeholders",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: [
          Text(
            "Activities Summary",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(width: 18.0),
          const Icon(
            Icons.people_alt_outlined,
            color: Colors.black,
          ),
          const SizedBox(width: 18.0),
          DropdownButton<String>(
            underline: Container(),
            icon: const Icon(
              Icons.arrow_drop_down,
              color: Colors.black38,
            ),
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            dropdownColor: Colors.white,
            value: selectedCategory,
            items: categories.map(
              (String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              },
            ).toList(),
            onChanged: (String? value) {
              setState(() => selectedCategory = value!);
              if (kDebugMode) {
                print("Selected: $value");
              }
            },
          ),
        ],
      ),
    );
  }
}
