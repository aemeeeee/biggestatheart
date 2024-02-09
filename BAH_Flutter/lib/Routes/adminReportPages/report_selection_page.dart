// ignore_for_file: must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Helpers/Widgets/standard_widgets.dart';
import '../blog_feed_page.dart';
import '../gallery_page.dart';
import '../home_page.dart';
import 'individual_report_list.dart';
import 'month_type_selection_page.dart';

class ReportSelectionPage extends StatelessWidget {
  ReportSelectionPage({Key? key}) : super(key: key);
  FirebaseAuth auth = FirebaseAuth.instance;
  String currUserID = '';

  @override
  Widget build(BuildContext context) {
    if (auth.currentUser == null) {
      return const NoticeDialog(
          content: 'Not authorised. Please sign in again');
    } else {
      currUserID = auth.currentUser!.uid;
      return Scaffold(
        appBar: AppBar(
          leading: backButton(context),
          title: const Text('Report Selection',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              )),
          backgroundColor: const Color.fromARGB(255, 168, 49, 85),
        ),
        body: ListView(
          children: <Widget>[
            _buildListTile(
              context,
              'By Individual Volunteer',
              Icons.person,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const IndividualReportListPage(),
                  ),
                );
              },
            ),
            const Divider(),
            _buildListTile(
              context,
              'By Demographics',
              Icons.people,
              () {
                // Navigate to Demographics Page
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => DemographicsPage(),
                //   ),
                // );
              },
            ),
            const Divider(),
            _buildListTile(
              context,
              'By Month/Type',
              Icons.calendar_today,
              () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MonthTypeSelectionPage()));
              },
            ),
            const Divider(),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              homePageButton(context),
              galleryPageButton(context),
              blogFeedPageButton(context),
              reportPageButton(),
            ],
          ),
        ),
      );
    }
  }

  Widget _buildListTile(
      BuildContext context, String title, IconData icon, Function onTap) {
    return ListTile(
      title: Text(title,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Roboto')),
      leading: Icon(icon, color: const Color.fromARGB(255, 168, 49, 85)),
      onTap: (() => onTap()),
    );
  }

  Widget backButton(BuildContext context) {
    return Container(
        alignment: Alignment.topLeft,
        child: IconButton(
            color: Colors.white,
            iconSize: 35,
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)));
  }

  Widget homePageButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.home, color: Color.fromARGB(255, 168, 49, 85)),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      },
    );
  }

  Widget galleryPageButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.photo_album,
          color: Color.fromARGB(255, 168, 49, 85)),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GalleryPage()),
        );
      },
    );
  }

  Widget blogFeedPageButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.article, color: Color.fromARGB(255, 168, 49, 85)),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BlogFeedPage()),
        );
      },
    );
  }

  Widget reportPageButton() {
    return IconButton(
      icon: const Icon(Icons.data_exploration_outlined,
          color: Color.fromARGB(255, 168, 49, 85)),
      onPressed: () {},
    );
  }
}
