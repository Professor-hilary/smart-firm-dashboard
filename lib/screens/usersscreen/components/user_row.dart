import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserRow extends StatefulWidget {
  const UserRow({super.key});

  @override
  _UserRowState createState() => _UserRowState();
}

class _UserRowState extends State<UserRow> {
  String? selectedFilter;
  TextStyle textStyle = const TextStyle(color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: Row(
        children: [
          const Text(
            'All Users',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 20),
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: const Text(
              "1 to 100 of ",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black38,
              ),
            ),
          ),
          const RandomNumberDisplay(),
          const Spacer(),
          SizedBox(
            width: 250,
            height: 35,
            child: TextField(
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintStyle: const TextStyle(color: Colors.black45),
                fillColor: Colors.white,
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.black54,
                ),
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                filled: true,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 16,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 35,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black38),
              borderRadius: BorderRadius.circular(6),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                style: const TextStyle(backgroundColor: Colors.transparent),
                dropdownColor: Colors.white,
                value: selectedFilter,
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black87,
                ),
                items: [
                  DropdownMenuItem<String>(
                    value: 'Country',
                    child: Row(
                      children: [
                        const Icon(Icons.filter_list, color: Colors.black54),
                        const SizedBox(width: 8),
                        Text(
                          'Country',
                          style: textStyle,
                        ),
                      ],
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Subscription Tier',
                    child: Row(
                      children: [
                        const Icon(Icons.filter_list, color: Colors.black54),
                        const SizedBox(width: 8),
                        Text(
                          'Subscription Tier',
                          style: textStyle,
                        ),
                      ],
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Date of Signup',
                    child: Row(
                      children: [
                        const Icon(Icons.filter_list, color: Colors.black54),
                        const SizedBox(width: 8),
                        Text(
                          'Date of Signup',
                          style: textStyle,
                        ),
                      ],
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Username',
                    child: Row(
                      children: [
                        const Icon(Icons.filter_list, color: Colors.black54),
                        const SizedBox(width: 8),
                        Text(
                          'Username',
                          style: textStyle,
                        ),
                      ],
                    ),
                  ),
                ],
                onChanged: (String? value) {
                  setState(() {
                    selectedFilter = value;
                  });
                },
                hint: Row(
                  children: [
                    const Icon(Icons.filter_list, color: Colors.black54),
                    const SizedBox(width: 8),
                    Text(
                      'Filter',
                      style: textStyle,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton.icon(
            onPressed: () {
              // Add your onPressed code here!
            },
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ), // Remove rounded corners
              ),
            ),
            label: const Text(
              'Add User',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RandomNumberDisplay extends StatefulWidget {
  const RandomNumberDisplay({super.key});

  @override
  State<RandomNumberDisplay> createState() => _RandomNumberDisplayState();
}

class _RandomNumberDisplayState extends State<RandomNumberDisplay> {
  int _number = 5238714;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        _number += Random().nextInt(100) + 1; // + 1 to ensure 1-100 range
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat('#,###'); // Formatter for comma separation
    final formattedNumber = formatter.format(_number);
    return Text(
      formattedNumber,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black38,
      ),
    );
  }
}
