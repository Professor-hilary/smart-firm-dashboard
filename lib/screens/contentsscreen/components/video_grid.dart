import 'package:faker/faker.dart' as faker;
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const VideoView(),
    const OtherContentView(),
  ];

  void _onDrawerItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.of(context).pop(); // Close the drawer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Content Viewer',
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
              child: Text(
                'Navigation',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Videos'),
              onTap: () => _onDrawerItemTapped(0),
            ),
            ListTile(
              title: const Text('Other Content'),
              onTap: () => _onDrawerItemTapped(1),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}

class VideoView extends StatefulWidget {
  const VideoView({super.key});

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  final VideoDataSource videoDataSource = VideoDataSource(
    videos: List.generate(
      100,
      (index) {
        return Video(
          randomAlphaNumeric(10),
          'assets/images/logo-crane.png',
          faker.faker.lorem.word(),
          faker.faker.lorem.word(),
          faker.faker.lorem.sentence(),
          faker.faker.randomGenerator.integer(5000, min: 1000),
          faker.faker.randomGenerator.integer(1000, min: 100),
        );
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    var headerStyle = const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );

    return Column(
      children: [
        Expanded(
          child: SfDataGridTheme(
            data: SfDataGridThemeData(
              headerColor: Colors.teal.shade400,
              sortIconColor: Colors.transparent,
              gridLineColor: Colors.grey.shade300,
            ),
            child: SfDataGrid(
              selectionMode: SelectionMode.single,
              allowSorting: true,
              source: videoDataSource,
              columnWidthMode: ColumnWidthMode.fill,
              allowColumnsDragging: true,
              allowColumnsResizing: true,
              allowSwiping: true,
              isScrollbarAlwaysShown: true,
              gridLinesVisibility: GridLinesVisibility.both,
              headerGridLinesVisibility: GridLinesVisibility.horizontal,
              columns: <GridColumn>[
                GridColumn(
                  columnName: 'id',
                  maximumWidth: 140,
                  label: Container(
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.centerLeft,
                    child: Text('ID', style: headerStyle),
                  ),
                ),
                GridColumn(
                  columnName: 'bitmap',
                  maximumWidth: 100,
                  label: Container(
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.centerLeft,
                    child: Text('Bitmap', style: headerStyle),
                  ),
                ),
                GridColumn(
                  columnName: 'firstname',
                  maximumWidth: 140,
                  label: Container(
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.centerLeft,
                    child: Text('First Name', style: headerStyle),
                  ),
                ),
                GridColumn(
                  columnName: 'lastname',
                  maximumWidth: 140,
                  label: Container(
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Last Name',
                      style: headerStyle,
                    ),
                  ),
                ),
                GridColumn(
                  columnName: 'description',
                  label: Container(
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.centerLeft,
                    child: Text('Description', style: headerStyle),
                  ),
                ),
                GridColumn(
                  columnName: 'ratings',
                  label: Container(
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.centerLeft,
                    child: Text('Ratings', style: headerStyle),
                  ),
                ),
                GridColumn(
                  columnName: 'reviews',
                  label: Container(
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.centerLeft,
                    child: Text('Reviews', style: headerStyle),
                  ),
                ),
              ],
            ),
          ),
        ),
        SfDataPagerTheme(
          data: SfDataPagerThemeData(
            backgroundColor: Colors.teal.shade100,
            itemColor: Colors.white24,
            selectedItemColor: Colors.white70,
            selectedItemTextStyle: const TextStyle(color: Colors.teal),
            itemTextStyle: const TextStyle(color: Colors.teal),
          ),
          child: SfDataPager(
            pageCount: (videoDataSource._videos.length / 10).ceil().toDouble(),
            delegate: videoDataSource,
            visibleItemsCount: 10,
          ),
        ),
      ],
    );
  }
}

class OtherContentView extends StatelessWidget {
  const OtherContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Other content goes here"),
    );
  }
}

class VideoDataSource extends DataGridSource {
  VideoDataSource({required List<Video> videos}) {
    _videos = videos.map<DataGridRow>(
      (video) {
        return DataGridRow(
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
              columnName: 'firstname',
              value: video.firstname,
            ),
            DataGridCell<String>(
              columnName: 'lastname',
              value: video.lastname,
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
        );
      },
    ).toList();
  }

  List<DataGridRow> _videos = [];

  @override
  List<DataGridRow> get rows => _videos;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((dataGridCell) {
        if (dataGridCell.columnName == 'bitmap') {
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(dataGridCell.value, width: 50, height: 50),
          );
        } else {
          return Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(8.0),
            child: Text(
              maxLines: 1,
              dataGridCell.value.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          );
        }
      }).toList(),
    );
  }
}

class Video {
  Video(
    this.id,
    this.bitmap,
    this.firstname,
    this.lastname,
    this.description,
    this.ratings,
    this.reviews,
  );

  final String id;
  final String bitmap;
  final String firstname;
  final String lastname;
  final String description;
  final int ratings;
  final int reviews;
}
