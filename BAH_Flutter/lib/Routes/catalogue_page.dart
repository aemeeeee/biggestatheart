import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'search_result_page.dart';
import '../Helpers/http.dart';
import 'package:auto_size_text/auto_size_text.dart';

class CataloguePage extends StatefulWidget {
  final List<List<dynamic>> itemList;
  final String mux;

  const CataloguePage({Key? key, required this.itemList, required this.mux})
      : super(key: key);

  @override
  CataloguePageState createState() => CataloguePageState();
}

class CataloguePageState extends State<CataloguePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late Animation<double> _opacityAnimation;
  final httpHelpers = HttpHelpers();

  // choose search function based on mux
  Function chooseSearch(String mux) {
    switch (mux) {
      case 'Family':
        return httpHelpers.searchFamily;
      case 'Genus':
        return httpHelpers.searchGenus;
      case 'Order':
        return httpHelpers.searchOrder;
      case 'Class':
        return httpHelpers.searchClass;
      default:
        return httpHelpers.searchClass;
    }
  }

  @override
  // initialize animation controllers
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.mux} Catalogue',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 51, 64, 113),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3,
        ),
        itemCount: widget.itemList.length,
        itemBuilder: (context, index) {
          final item = widget.itemList[index];
          final string1 = item[0].toString();
          final string2 = item[1].toString();

          return SlideTransition(
            position: _offsetAnimation,
            child: FadeTransition(
              opacity: _opacityAnimation,
              child: Card(
                shadowColor: Colors.black,
                child: Center(
                  child: ListTile(
                    titleAlignment: ListTileTitleAlignment.center,
                    title: AutoSizeText(
                      '$string1 ($string2)',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 1,
                      minFontSize: 5,
                      maxFontSize: double.infinity,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: () {
                      chooseSearch(widget.mux)
                          .call(
                            string1,
                            "2000-01-01 00:00:00",
                            DateFormat("yyyy-MM-dd hh:mm:ss")
                                .format(DateTime.now()),
                            '',
                          )
                          .then((value) => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SearchResultPage(
                                    dataList: value,
                                    startTime: "2000-01-01 00:00:00",
                                    endTime: DateFormat("yyyy-MM-dd hh:mm:ss")
                                        .format(DateTime.now()),
                                    sightinglocation: '',
                                  ),
                                ),
                              ));
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
