import 'package:flutter/material.dart';

class DateRangeDropdown extends StatefulWidget {
  final String selectedValue;
  final Function(String) onChanged;

  const DateRangeDropdown({
    super.key,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  State<DateRangeDropdown> createState() => _DateRangeDropdownState();
}

class _DateRangeDropdownState extends State<DateRangeDropdown> {
  String _selectedValue = ""; // Store the current selection

  List<String> options = [
    "Past Month",
    "Past 4 Months",
    "Past Half Year",
    "Past Year",
  ];

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.selectedValue; // Initialize with passed value
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      color: Colors.white,
      width: 210,
      height: 50,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.calendar_today_outlined, color: Colors.black),
          const SizedBox(width: 8.0),
          DropdownButton<String>(
            value: _selectedValue, // Use the state variable
            isExpanded: false,
            underline: Container(), // Remove underline
            dropdownColor: Colors.grey[400],
            items: options.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                // Update state when selection changes
                _selectedValue = value!;
                widget.onChanged(value); // Call passed callback
              });
            },
          ),
          const SizedBox(width: 4.0),
          Icon(
            _selectedValue.isEmpty
                ? Icons.arrow_drop_down
                : Icons.arrow_drop_up,
            color: Colors.black38,
          ),
        ],
      ),
    );
  }
}
