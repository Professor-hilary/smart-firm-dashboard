import 'package:flutter/material.dart';

class DashboardScreenSidePane extends StatefulWidget {
  const DashboardScreenSidePane(
      {super.key, required void Function(int index) onMenuItemSelected});

  @override
  _DashboardScreenSidePaneState createState() =>
      _DashboardScreenSidePaneState();
}

class _DashboardScreenSidePaneState extends State<DashboardScreenSidePane> {
  int _selectedCategoryIndex = 0;
  int _selectedSubcategoryIndex = 0;
  bool _isMiddlePaneCollapsed = false;

  final List<IconData> _menuIcons = [
    Icons.dashboard,
    Icons.content_copy,
    Icons.analytics,
    Icons.person,
    Icons.report,
    Icons.message,
    Icons.security,
  ];

  final List<String> categories = [
    'Dashboard',
    'Content Management',
    'Metrics And Analytics',
    'User Management',
    'Reporting',
    'Messaging and Support',
    'Security',
  ];

  final List<List<String>> subcategories = [
    ['Dashboard Sub 1', 'Dashboard Sub 2', 'Dashboard Sub 3'],
    ['Sales Sub 1', 'Sales Sub 2', 'Sales Sub 3'],
    ['Academic Sub 1', 'Academic Sub 2', 'Academic Sub 3'],
    ['Chat Sub 1', 'Chat Sub 2', 'Chat Sub 3'],
    ['Settings Sub 1', 'Settings Sub 2', 'Settings Sub 3'],
    ['Chat Sub 1', 'Chat Sub 2', 'Chat Sub 3'],
    ['Settings Sub 1', 'Settings Sub 2', 'Settings Sub 3'],
  ];

  final List<List<List<String>>> mainContent = [
    [
      ['Dashboard Content 1-1', 'Dashboard Content 1-2'],
      ['Dashboard Content 2-1', 'Dashboard Content 2-2'],
      ['Dashboard Content 3-1', 'Dashboard Content 3-2'],
    ],
    [
      ['Sales Content 1-1', 'Sales Content 1-2'],
      ['Sales Content 2-1', 'Sales Content 2-2'],
      ['Sales Content 3-1', 'Sales Content 3-2'],
    ],
    [
      ['Academic Content 1-1', 'Academic Content 1-2'],
      ['Academic Content 2-1', 'Academic Content 2-2'],
      ['Academic Content 3-1', 'Academic Content 3-2'],
    ],
    [
      ['Chat Content 1-1', 'Chat Content 1-2'],
      ['Chat Content 2-1', 'Chat Content 2-2'],
      ['Chat Content 3-1', 'Chat Content 3-2'],
    ],
    [
      ['Settings Content 1-1', 'Settings Content 1-2'],
      ['Settings Content 2-1', 'Settings Content 2-2'],
      ['Settings Content 3-1', 'Settings Content 3-2'],
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Left panel with icon column for menu categories
          Container(
            width: 80,
            color: Colors.blueGrey[900],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(_menuIcons.length, (index) {
                return IconButton(
                  icon: Icon(
                    _menuIcons[index],
                    color: _selectedCategoryIndex == index
                        ? Colors.white
                        : Colors.blueGrey[400],
                  ),
                  onPressed: () {
                    setState(() {
                      _selectedCategoryIndex = index;
                      _selectedSubcategoryIndex = 0;
                    });
                  },
                );
              }),
            ),
          ),
          // Middle panel to display subcategories of selected category
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: _isMiddlePaneCollapsed ? 60 : 200,
            color: Colors.blueGrey[800],
            child: Column(
              children: [
                IconButton(
                  icon: Icon(
                    _isMiddlePaneCollapsed
                        ? Icons.chevron_right
                        : Icons.chevron_left,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      _isMiddlePaneCollapsed = !_isMiddlePaneCollapsed;
                    });
                  },
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: subcategories[_selectedCategoryIndex].length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          subcategories[_selectedCategoryIndex][index],
                          style: TextStyle(
                            color: _selectedSubcategoryIndex == index
                                ? Colors.white
                                : Colors.blueGrey[400],
                          ),
                        ),
                        onTap: () {
                          setState(() => _selectedSubcategoryIndex = index);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          // Right panel to display main content of selected subcategory
          /* Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.grey[200],
              child: ListView.builder(
                itemCount: _mainContent[_selectedCategoryIndex][_selectedSubcategoryIndex].length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(_mainContent[_selectedCategoryIndex][_selectedSubcategoryIndex][index]),
                    ),
                  );
                },
              ),
            ),
          ), */
        ],
      ),
    );
  }
}
