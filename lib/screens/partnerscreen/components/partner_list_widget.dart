import 'package:flutter/material.dart';
import 'package:smartlab/screens/partnerscreen/components/user_list.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class PromoteUgandaScreen extends StatefulWidget {
  const PromoteUgandaScreen({super.key});

  @override
  _PromoteUgandaScreenState createState() => _PromoteUgandaScreenState();
}

class _PromoteUgandaScreenState extends State<PromoteUgandaScreen> {
  late PromoteUgandaDataSource _promoteUgandaDataSource;

  @override
  void initState() {
    super.initState();
    _promoteUgandaDataSource = PromoteUgandaDataSource(getPromoteUgandaData());
  }

  @override
  Widget build(BuildContext context) {
    var style = const TextStyle(
      color: Colors.teal,
      fontWeight: FontWeight.bold,
      fontSize: 17,
    );
    return SfDataGridTheme(
      data: SfDataGridThemeData(
        gridLineColor: Colors.grey.shade300,
        headerColor: Colors.transparent,
        sortIconColor: Colors.transparent,
      ),
      child: SfDataGrid(
        rowHeight: 60,
        allowSorting: true,
        source: _promoteUgandaDataSource,
        columnWidthMode: ColumnWidthMode.fill,
        columns: <GridColumn>[
          GridColumn(
            columnName: 'managerName',
            label: Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.centerLeft,
              child: Text('Content Manager', style: style),
            ),
          ),
          GridColumn(
            width: 100,
            columnName: 'actyiveStatus',
            label: Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.centerLeft,
              child: Text('', style: style),
            ),
          ),
          GridColumn(
            columnName: 'contentType',
            label: Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.centerLeft,
              child: Text('Content Type', style: style),
            ),
          ),
          GridColumn(
            columnName: 'following',
            label: Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.centerLeft,
              child: Text('Following', style: style),
            ),
          ),
          GridColumn(
            columnName: 'actions',
            label: Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.centerLeft,
              child: Text('Actions', style: style),
            ),
          ),
        ],
      ),
    );
  }
}
