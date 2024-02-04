import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import '../Helpers/firebase_service.dart';
import 'stats_result_page.dart';

class SearchResultPage extends StatefulWidget {
  final List<String> dataList;
  final String startTime;
  final String endTime;
  final String sightinglocation;
  final httpHelpers = HttpHelpers();

  SearchResultPage({
    Key? key,
    required this.dataList,
    required this.startTime,
    required this.endTime,
    required this.sightinglocation,
  }) : super(key: key);

  @override
  SearchResultPageState createState() => SearchResultPageState();
}

class SearchResultPageState extends State<SearchResultPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late CurvedAnimation _animation;

  @override
  void initState() {
    super.initState();
    // Initialize animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void showSpeciesResult(BuildContext context, String species) {
    try {
      widget.httpHelpers
          .searchSpecies(species, widget.startTime, widget.endTime,
              widget.sightinglocation)
          .then((value) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StatsResultPage(
              dataList: value,
              species: species,
            ),
          ),
        );
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.0; // Reset time dilation

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Results'),
        backgroundColor: const Color.fromARGB(255, 51, 64, 113),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      // Display search results in a list form with animation
      body: ListView.builder(
        itemCount: widget.dataList.length,
        itemBuilder: (context, index) {
          final data = widget.dataList[index];
          if (index == 0) {
            return Column(
              children: [
                Text(
                  '${widget.dataList.length} results found',
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 18,
                ),
                AnimatedOpacity(
                  opacity: 1.0,
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeInOut,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(1.0, 0.0),
                      end: const Offset(0.0, 0.0),
                    ).animate(_animation),
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                      ),
                      child: AnimatedOpacity(
                        opacity: 1.0,
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeInOut,
                        child: ListTile(
                          title: Text(
                            data,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {
                            showSpeciesResult(
                                context, data); // Pass the context here
                          },
                          trailing: const Icon(Icons.arrow_forward),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return AnimatedOpacity(
              opacity: 1.0,
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeInOut,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: const Offset(0.0, 0.0),
                ).animate(_animation),
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                  child: AnimatedOpacity(
                    opacity: 1.0,
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeInOut,
                    child: ListTile(
                      title: Text(
                        data,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        showSpeciesResult(
                            context, data); // Pass the context here
                      },
                      trailing: const Icon(Icons.arrow_forward),
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
