import 'package:flutter/material.dart';
import 'package:smartlab/screens/usersscreen/components/user_list.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _UsersScreenState();
  }
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(color: Colors.grey.shade200),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    "Users Management Dashboard",
                    style: textTheme.headlineLarge?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 40,
                    ),
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                Text(
                  "Manage all user information and settings for different products and stakeholders here.",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Search Users",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
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
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: SizedBox(height: 650, child: UserListView()),
            ),
          ],
        ),
      ),
    );
  }
}

class UserManagementApp extends StatelessWidget {
  const UserManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserManagementScreen(),
    );
  }
}

class UserManagementScreen extends StatelessWidget {
  final List<User> users = [
    User(
        id: 1,
        name: 'Alice Smith',
        email: 'alice@example.com',
        role: 'Admin',
        status: 'Active',
        dateCreated: DateTime(2023, 1, 10),
        lastLogin: DateTime(2024, 7, 10)),
    User(
        id: 2,
        name: 'Bob Johnson',
        email: 'bob@example.com',
        role: 'Editor',
        status: 'Inactive',
        dateCreated: DateTime(2023, 3, 5),
        lastLogin: DateTime(2024, 6, 20)),
    // Add more users as needed
  ];

  UserManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Management'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return UserCard(user: users[index]);
        },
      ),
    );
  }
}

class User {
  final int id;
  final String name;
  final String email;
  final String role;
  final String status;
  final DateTime dateCreated;
  final DateTime lastLogin;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.status,
    required this.dateCreated,
    required this.lastLogin,
  });
}

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(user.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Email: ${user.email}'),
            Text('Role: ${user.role}'),
            Text('Status: ${user.status}'),
            Text('Date Created: ${user.dateCreated.toLocal()}'),
            Text('Last Login: ${user.lastLogin.toLocal()}'),
          ],
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (value) {
            // Handle actions like Edit, Delete, Activate/Deactivate
          },
          itemBuilder: (context) {
            return [
              'Edit',
              'Delete',
              user.status == 'Active' ? 'Deactivate' : 'Activate'
            ].map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice),
              );
            }).toList();
          },
        ),
      ),
    );
  }
}

class FourCards extends StatelessWidget {
  const FourCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: 500,
        height: 500,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Grid view for metrics cards
            GridView.count(
              crossAxisCount: 2, // 2 cards per row
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                // Card 1: User Engagement Metrics
                DashboardCard(
                  title: 'User Engagement',
                  value: '10,000',
                  unit: 'Active Users',
                  color: Colors.greenAccent,
                ),
                // Card 2: Content Uploads and Management
                DashboardCard(
                  title: 'Content Uploads',
                  value: '500',
                  unit: 'Uploads',
                  color: Colors.purpleAccent,
                ),
                // Card 3: Account Verification and Regulation
                DashboardCard(
                  title: 'Account Verification',
                  value: '85%',
                  unit: 'Verified',
                  color: Colors.yellowAccent,
                ),
                // Card 4: Demographic and Geographic Insights
                DashboardCard(
                  title: 'Demographics',
                  value: '18-35',
                  unit: 'Age Group',
                  color: Colors.blueAccent,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Widget for each dashboard metric card
class DashboardCard extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  final Color color;

  const DashboardCard({
    super.key,
    required this.title,
    required this.value,
    required this.unit,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        color: Colors.white,
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                unit,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
