
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CRUDCardRow extends StatelessWidget {
  const CRUDCardRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Row for CRUD operation cards
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Card 1: Create
              CRUDCard(
                title: 'Create',
                value: 'Add User',
                unit: '',
                color: Colors.greenAccent.shade100,
              ),
              // Card 2: Read
              CRUDCard(
                title: 'Read',
                value: 'View Users',
                unit: '',
                color: Colors.yellow.shade100,
              ),
              // Card 3: Update
              CRUDCard(
                title: 'Update',
                value: 'Edit User',
                unit: '',
                color: Colors.indigo.shade100,
              ),
              // Card 4: Delete
              CRUDCard(
                title: 'Delete',
                value: 'Remove User',
                unit: '',
                color: Colors.redAccent.shade100,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Widget for each dashboard metric card
class CRUDCard extends StatefulWidget {
  final String title;
  final String value;
  final String unit;
  final Color color;

  const CRUDCard({
    super.key,
    required this.title,
    required this.value,
    required this.unit,
    required this.color,
  });

  @override
  State<CRUDCard> createState() => _CRUDCardState();
}

class _CRUDCardState extends State<CRUDCard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 200,
        child: GestureDetector(
          onTap: () {
            if (kDebugMode) {
              print(widget.title);
            }
          },
          child: Card(
            color: widget.color,
            elevation: 2,
            child: InkWell(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.value,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
