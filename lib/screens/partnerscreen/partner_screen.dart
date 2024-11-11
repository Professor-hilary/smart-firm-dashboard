import 'package:flutter/material.dart';
import 'package:smartlab/screens/partnerscreen/components/partner_list_widget.dart';

class PartnersScreen extends StatefulWidget {
  const PartnersScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PartnersScreenState();
  }
}

class _PartnersScreenState extends State<PartnersScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      "Content Creators Dashboard",
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
                    "Manage all content creator user information and permissions here.",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: Row(
                  children: <Widget>[
                    const Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          Text(
                            'Users',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 40),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "6",
                              style: TextStyle(
                                color: Colors.teal,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Text(
                            " of ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "6",
                              style: TextStyle(
                                color: Colors.teal,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Text(
                            "total",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter user name',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: 200,
                      height: 49,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow[700],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onPressed: () {
                          // Add your onPressed code here!
                        },
                        child: Text(
                          'Add User',
                          style: TextStyle(
                            color: Colors.green.shade900,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 600,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: const PromoteUgandaScreen(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
