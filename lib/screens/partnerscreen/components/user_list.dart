import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class CompanyData {
  CompanyData(
    this.bitmap,
    this.managerName,
    this.company,
    this.contentTypes,
    this.following,
    this.status,
    this.dateOfSignUp,
  );

  final String bitmap;
  final String managerName;
  final String company;
  final List<String> contentTypes;
  final String following;
  final String status;
  final String dateOfSignUp;
}

class PromoteUgandaDataSource extends DataGridSource {
  PromoteUgandaDataSource(this.companyData) {
    buildDataGridRow();
  }

  late List<DataGridRow> dataGridRows;
  late List<CompanyData> companyData;

  final Map<String, Color> contentTypeColors = {
    'Videos': Colors.blue.shade900,
    'Crafts': Colors.green.shade900,
    'Documents': Colors.red.shade900,
    'Hotel Services': Colors.orange.shade900,
    // Add more mappings as needed
  };

  @override
  List<DataGridRow> get rows => dataGridRows;

  void buildDataGridRow() {
    dataGridRows = companyData.map<DataGridRow>((data) {
      return DataGridRow(
        cells: [
          DataGridCell<String>(
            columnName: 'bitmap',
            value: data.bitmap,
          ),
          DataGridCell<String>(
            columnName: 'managerName',
            value: data.managerName,
          ),
          DataGridCell<String>(
            columnName: 'company',
            value: data.company,
          ),
          DataGridCell<List<String>>(
            columnName: 'contentTypes',
            value: data.contentTypes,
          ),
          DataGridCell<String>(
            columnName: 'following',
            value: data.following,
          ),
          DataGridCell<String>(
            columnName: 'status',
            value: data.status,
          ),
          DataGridCell<String>(
            columnName: 'dateOfSignUp',
            value: data.dateOfSignUp,
          ),
          DataGridCell<Widget>(
            columnName: 'actions',
            value: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.settings, color: Colors.grey),
                      onPressed: () {},
                    ),
                    const Text(
                      "Modify Roles",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                Row(
                  children: [
                    IconButton(
                      color: Colors.grey,
                      icon: const Icon(FontAwesome.times),
                      onPressed: () {},
                    ),
                    const Text(
                      "Remove User",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    }).toList();
  }

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    var textStyle = const TextStyle(color: Colors.black);
    List<String> contentTypes = row.getCells()[3].value;

    return DataGridRowAdapter(
      color: Colors.transparent,
      cells: [
        Container(
          alignment: Alignment.center,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.transparent),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(row.getCells()[0].value.toString()),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      maxLines: 1,
                      row.getCells()[2].value.toString(),
                      style: textStyle.copyWith(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      row.getCells()[1].value.toString(),
                      style: textStyle.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: Text(
            textAlign: TextAlign.right,
            row.getCells()[4].value.toString(),
            style: textStyle.copyWith(
              color: row.getCells()[4].value.toString() == 'Inactive'
                  ? Colors.red
                  : Colors.orange,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerLeft,
          child: Wrap(
            spacing: 5.0,
            runSpacing: 5.0,
            children: contentTypes.map((contentType) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  color: contentTypeColors[contentType] ?? Colors.grey,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
                child: Text(
                  contentType,
                  style: textStyle.copyWith(color: Colors.white),
                ),
              );
            }).toList(),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerLeft,
          child: Text(
            textAlign: TextAlign.right,
            row.getCells()[5].value.toString(),
            style: textStyle.copyWith(
              color: Colors.black54,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerLeft,
          child: row.getCells()[7].value,
        ),
      ],
    );
  }
}

List<CompanyData> getPromoteUgandaData() {
  return [
    CompanyData(
      'assets/images/wakaliwood.jpg',
      'John Doe',
      'Wakaliwood',
      ['Hotel Services'],
      '2311',
      'Active',
      '2023-07-01',
    ),
    CompanyData(
      'assets/images/hilton_hotel.jpg',
      'Jane Smith',
      'Hilton Hotel',
      ['Crafts'],
      '3234',
      'Inactive',
      '2022-05-20',
    ),
    CompanyData(
      'assets/images/mtn.jpg',
      'Robert Brown',
      'MTN Uganda',
      ['Videos', 'Crafts'],
      '240',
      'Active',
      '2021-11-15',
    ),
    CompanyData(
      'assets/images/parliament.jpg',
      'Emily Davis',
      'Parliament',
      ['Videos'],
      '3456',
      'Inactive',
      '2020-09-10',
    ),
    CompanyData(
      'assets/images/UWA.png',
      'Michael Johnson',
      'Uganda Wildlife Authority',
      ['Videos', 'Documents'],
      '456',
      'Active',
      '2019-07-23',
    ),
    CompanyData(
      'assets/images/IctHub.jpg',
      'Steven Steve',
      'ICT Hub',
      ['Videos', 'Documents'],
      '305',
      'Active',
      '2019-07-23',
    ),
  ];
}
