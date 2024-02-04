import 'package:flutter/material.dart';
import '../Helpers/firebase_service.dart';
import 'catalogue_page.dart';

class CatalogueMuxPage extends StatelessWidget {
  const CatalogueMuxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 190, 222, 248),
      appBar: AppBar(
        title: const Text('Select a Catalogue'),
        backgroundColor: const Color.fromARGB(255, 70, 88, 152),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              text: 'Class Catalogue',
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            CustomButton(
              text: 'Order Catalogue',
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            CustomButton(
              text: 'Family Catalogue',
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            CustomButton(
              text: 'Genus Catalogue',
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final httpHelpers = HttpHelpers();
  CustomButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.08,
      child: ElevatedButton(
        onPressed: () {
          if (text == 'Class Catalogue') {
            httpHelpers.searchClassCatalogue().then((value) => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CataloguePage(
                            itemList: value,
                            mux: 'Class',
                          )),
                ));
          } else if (text == 'Order Catalogue') {
            httpHelpers.searchOrderCatalogue().then((value) => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CataloguePage(
                            itemList: value,
                            mux: 'Order',
                          )),
                ));
          } else if (text == 'Family Catalogue') {
            httpHelpers.searchFamilyCatalogue().then((value) => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CataloguePage(
                            itemList: value,
                            mux: 'Family',
                          )),
                ));
          } else if (text == 'Genus Catalogue') {
            httpHelpers.searchGenusCatalogue().then((value) => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CataloguePage(
                            itemList: value,
                            mux: 'Genus',
                          )),
                ));
          }
        },
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
