import 'package:biggestatheart/Helpers/Firebase_Services/individual_report_list.dart';
import 'package:flutter/material.dart';
import '../../Models/user.dart';
import 'individual_report_page.dart';

class IndividualReportListPage extends StatefulWidget {
  const IndividualReportListPage({super.key});

  @override
  IndividualReportListPageState createState() =>
      IndividualReportListPageState();
}

class IndividualReportListPageState extends State<IndividualReportListPage> {
  late Future<List<User>> _usersFuture;
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _usersFuture = FirebaseServiceIndividualReport().getAllUsers();
    _searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Search by name',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {}); // Trigger a rebuild when the text changes
              },
            ),
          ),
          Expanded(
            child: FutureBuilder<List<User>>(
              future: _usersFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No users found'));
                } else {
                  final List<User> filteredUsers = _filterUsers(snapshot.data!);
                  return ListView.builder(
                    itemCount: filteredUsers.length,
                    itemBuilder: (context, index) {
                      final user = filteredUsers[index];
                      return Column(
                        children: [
                          ListTile(
                            title: Text(user.name),
                            subtitle: Text(user.email),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => IndividualReportPage(
                                    currVolunteer: user,
                                  ),
                                ),
                              );
                            },
                          ),
                          const Divider(),
                        ],
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  List<User> _filterUsers(List<User> users) {
    final String searchTerm = _searchController.text.trim().toLowerCase();
    if (searchTerm.isEmpty) {
      return users;
    } else {
      return users
          .where((user) => user.name.toLowerCase().contains(searchTerm))
          .toList();
    }
  }
}
