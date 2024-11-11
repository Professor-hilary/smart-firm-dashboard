import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:http/http.dart' as http;

Future<List<User>> fetchUsers(int cursor, int count) async {
  String url =
      'https://f6f0-154-72-205-234.ngrok-free.app/users?count=$count&cursor=$cursor';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    // If the server returns a 200 OK response, parse the JSON data
    final Map<String, dynamic> jsonData = jsonDecode(response.body);

    // Extract the list of users from the data key
    final List<dynamic> data = jsonData['data'];

    // Map the list of user data to List<User>
    final List<User> users = data.map<User>((userData) {
      return User(
        userData['_id'] ?? '', // Ensure you handle potential null values
        userData['profilePhoto'] ?? '',
        userData['firstName'] ?? '',
        userData['lastName'] ?? '',
        userData['email'] ?? '',
        userData['phone'] ?? '',
        userData['subscriptionTier'] ?? '',
      );
    }).toList();

    // if (kDebugMode) {
    //   print(users);
    // }
    return users;
  } else {
    throw Exception('Failed to load users');
  }
}

class UserData {
  final String id;
  final String profilePhoto;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String subscriptionTier;

  UserData({
    required this.id,
    required this.profilePhoto,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.subscriptionTier,
  });

  // Factory constructor to create UserData from JSON
  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      profilePhoto: json['profilePhoto'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      phone: json['phone'],
      subscriptionTier: json['subscriptionTier'],
    );
  }
}

class UserListView extends StatefulWidget {
  const UserListView({super.key});

  @override
  State<UserListView> createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  int userListSize = 100;
  int cursor = 20;
  late UserDataSource userDataSource;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchAndSetUsers();
  }

  Future<void> fetchAndSetUsers() async {
    try {
      final users = await fetchUsers(cursor, userListSize);

      setState(() {
        userDataSource = UserDataSource(users: users);
        isLoading = false;
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching users: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var headerStyle = const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );

    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      children: [
        Expanded(
          child: SfDataGridTheme(
            data: SfDataGridThemeData(
              gridLineColor: Colors.black12,
              headerColor: Colors.teal.shade500,
              sortIconColor: Colors.teal.shade900,
              selectionColor: Colors.teal.shade100.withOpacity(1),
            ),
            child: SfDataGrid(
              selectionMode: SelectionMode.single,
              allowSorting: true,
              source: userDataSource,
              rowsPerPage: 10,
              columnWidthMode: ColumnWidthMode.fill,
              allowColumnsDragging: true,
              allowColumnsResizing: true,
              allowSwiping: true,
              isScrollbarAlwaysShown: true,
              gridLinesVisibility: GridLinesVisibility.both,
              headerGridLinesVisibility: GridLinesVisibility.none,
              allowPullToRefresh: true,
              columns: <GridColumn>[
                GridColumn(
                  columnName: 'id',
                  width: 160,
                  label: Container(
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.centerLeft,
                    child: Text('UID', style: headerStyle),
                  ),
                ),
                GridColumn(
                  columnWidthMode: ColumnWidthMode.auto,
                  columnName: 'bitmap',
                  width: 100,
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
                    child: Text('Last Name', style: headerStyle),
                  ),
                ),
                GridColumn(
                  columnName: 'email',
                  label: Container(
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.centerLeft,
                    child: Text('Email', style: headerStyle),
                  ),
                ),
                GridColumn(
                  columnName: 'country',
                  label: Container(
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.centerLeft,
                    child: Text('Country', style: headerStyle),
                  ),
                ),
                GridColumn(
                  columnName: 'subscriptionTier',
                  label: Container(
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.centerLeft,
                    child: Text('Subscription Tier', style: headerStyle),
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
            delegate: userDataSource,
            visibleItemsCount: 10,
            pageCount: 10,
          ),
        ),
      ],
    );
  }
}

class UserDataSource extends DataGridSource {
  UserDataSource({required List<User> users}) {
    _users = users.map<DataGridRow>(
      (user) {
        return DataGridRow(
          cells: [
            DataGridCell<String>(
              columnName: 'id',
              value: user.id,
            ),
            DataGridCell<String>(
              columnName: 'bitmap',
              value: user.bitmap,
            ),
            DataGridCell<String>(
              columnName: 'firstname',
              value: user.firstname,
            ),
            DataGridCell<String>(
              columnName: 'lastname',
              value: user.lastname,
            ),
            DataGridCell<String>(
              columnName: 'email',
              value: user.email,
            ),
            DataGridCell<String>(
              columnName: 'country',
              value: user.country,
            ),
            DataGridCell<String>(
              columnName: 'subscriptionTier',
              value: user.subscriptionTier,
            ),
          ],
        );
      },
    ).toList();
  }

  List<DataGridRow> _users = [];

  @override
  List<DataGridRow> get rows => _users;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      color: Colors.grey.shade100,
      cells: row.getCells().map<Widget>((dataGridCell) {
        if (dataGridCell.columnName == 'bitmap') {
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            child: Image.network(dataGridCell.value, width: 50, height: 50),
          );
        } else {
          return Container(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              dataGridCell.value.toString(),
              style: const TextStyle(color: Colors.black87, fontSize: 14),
            ),
          );
        }
      }).toList(),
    );
  }
}

class User {
  User(
    this.id,
    this.bitmap,
    this.firstname,
    this.lastname,
    this.email,
    this.country,
    this.subscriptionTier,
  );

  final String id;
  final String bitmap;
  final String firstname;
  final String lastname;
  final String email;
  final String country;
  final String subscriptionTier;
}
