import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smartlab/screens/contentsscreen/components/video_grid.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'dart:async';
import 'dart:math';

class ContentManagement extends StatefulWidget {
  const ContentManagement({super.key});

  @override
  State<ContentManagement> createState() => _ContentManagementState();
}

class _ContentManagementState extends State<ContentManagement> {
  @override
  Widget build(BuildContext context) {
    var textTheme2 = Theme.of(context).textTheme;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(color: Colors.grey.shade200),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    "Content Management Pane",
                    style: textTheme2.headlineLarge?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 40,
                    ),
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 40, left: 5),
                  child: Text(
                    "View and manage content created by content creators.",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              const UserRow(),
              // const ServicesOverview(),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: SizedBox(height: 650, child: MyHomePage()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ServicesOverview extends StatelessWidget {
  const ServicesOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ServiceCard(
          title: 'Videos',
          count: 123, // Replace with actual count
          icon: Icons.video_library,
          color: Colors.blue,
        ),
        ServiceCard(
          title: 'Documents',
          count: 456, // Replace with actual count
          icon: Icons.description,
          color: Colors.green,
        ),
        ServiceCard(
          title: 'Crafts',
          count: 78, // Replace with actual count
          icon: Icons.palette,
          color: Colors.orange,
        ),
        ServiceCard(
          title: 'Hotel Services',
          count: 234, // Replace with actual count
          icon: Icons.hotel,
          color: Colors.purple,
        ),
      ],
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  final int count;
  final IconData icon;
  final Color color;

  const ServiceCard({
    super.key,
    required this.title,
    required this.count,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: Colors.white,
        elevation: 3,
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 36,
                color: color,
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                '$count', // Display the count dynamically
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VideoDataSource extends DataGridSource {
  TextStyle style = const TextStyle(color: Colors.black);
  VideoDataSource({required List<Video> videos}) {
    _videos = videos
        .map<DataGridRow>(
          (video) => DataGridRow(
            cells: [
              DataGridCell<String>(
                columnName: 'id',
                value: video.id,
              ),
              DataGridCell<String>(
                columnName: 'bitmap',
                value: video.bitmap,
              ),
              DataGridCell<String>(
                columnName: 'name',
                value: video.name,
              ),
              DataGridCell<String>(
                columnName: 'description',
                value: video.description,
              ),
              DataGridCell<int>(
                columnName: 'ratings',
                value: video.ratings,
              ),
              DataGridCell<int>(
                columnName: 'reviews',
                value: video.reviews,
              ),
            ],
          ),
        )
        .toList();
  }

  List<DataGridRow> _videos = <DataGridRow>[];

  @override
  List<DataGridRow> get rows => _videos;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      if (dataGridCell.columnName == 'bitmap') {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: Image.network(dataGridCell.value, width: 50, height: 50),
        );
      } else {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: Text(dataGridCell.value.toString(), style: style),
        );
      }
    }).toList());
  }
}

class Video {
  Video(
    this.id,
    this.bitmap,
    this.name,
    this.description,
    this.ratings,
    this.reviews,
  );

  final String id;
  final String bitmap;
  final String name;
  final String description;
  final int ratings;
  final int reviews;
}

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
          // const Text(
          //   'Content',
          //   style: TextStyle(
          //     fontSize: 20,
          //     fontWeight: FontWeight.bold,
          //     color: Colors.black,
          //   ),
          // ),
          // const SizedBox(width: 20),
          // Container(
          //   padding: const EdgeInsets.only(left: 10),
          //   child: const Text(
          //     "1 to 100 of ",
          //     style: TextStyle(
          //       fontSize: 20,
          //       fontWeight: FontWeight.bold,
          //       color: Colors.black38,
          //     ),
          //   ),
          // ),
          //const RandomNumberDisplay(),
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
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add, color: Colors.white),
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
            ),
            label: const Text(
              'Add Content',
              style: TextStyle(color: Colors.white),
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
        _number += Random().nextInt(100) + 1;
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
