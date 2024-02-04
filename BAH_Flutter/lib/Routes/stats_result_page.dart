import 'dart:math';

import 'package:flutter/material.dart';
import '../Helpers/firebase_service.dart';
import 'package:fl_chart/fl_chart.dart';

class StatsResultPage extends StatefulWidget {
  final List<String> dataList;
  final String species;

  const StatsResultPage({
    Key? key,
    required this.dataList,
    required this.species,
  }) : super(key: key);

  @override
  StatsResultPageState createState() => StatsResultPageState();
}

class StatsResultPageState extends State<StatsResultPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  final httpHelpers = HttpHelpers();

  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widget.dataList[1] =
        widget.dataList[1].substring(0, widget.dataList[1].length - 8);
    List<String> dateTime = widget.dataList[1].split('T');
    String date = dateTime[0];
    String time = dateTime[1];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 190, 222, 248),
      appBar: AppBar(
        title: Text('${widget.species} Stats'),
        backgroundColor: const Color.fromARGB(255, 51, 64, 113),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Opacity(
                  opacity: _animation.value,
                  child: Transform.translate(
                    offset: Offset(0.0, (1 - _animation.value) * 20),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 134, 195, 246),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Flexible(
                        child: Text(
                          widget.species,
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),

            // Species total sightings
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Opacity(
                  opacity: _animation.value,
                  child: Transform.translate(
                    offset: Offset(0.0, (1 - _animation.value) * 20),
                    child: StatsContainer(
                      icon: Icons.visibility,
                      text: 'Total sightings: ${widget.dataList[0]}',
                    ),
                  ),
                );
              },
            ),

            // Species last seen date and time
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Opacity(
                  opacity: _animation.value,
                  child: Transform.translate(
                    offset: Offset(0.0, (1 - _animation.value) * 20),
                    child: StatsContainer(
                      icon: Icons.calendar_month_outlined,
                      text: 'Last seen on $date at $time',
                    ),
                  ),
                );
              },
            ),

            // Species last seen location
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Opacity(
                  opacity: _animation.value,
                  child: Transform.translate(
                    offset: Offset(0.0, (1 - _animation.value) * 20),
                    child: StatsContainer(
                      icon: Icons.location_on_outlined,
                      text: 'Last seen location: ${widget.dataList[2]}',
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),

            // Species count stats in last 24 hours, 7 days and 30 days in graph form
            SizedBox(
              height: 450,
              child: FutureBuilder<List<List<List<String>>>>(
                future: httpHelpers.speciesCountStats(widget.species),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else {
                    final speciesCount = snapshot.data;
                    return AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return Opacity(
                          opacity: _animation.value,
                          child: Transform.translate(
                            offset: Offset(0.0, (1 - _animation.value) * 20),
                            child: PageView(
                              controller: _pageController,
                              children: [
                                _buildStatsBox('Sightings last 24 hours',
                                    speciesCount![0]),
                                _buildStatsBox(
                                    'Sightings last 7 days', speciesCount[1]),
                                _buildStatsBox(
                                    'Sightings last month', speciesCount[2]),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsBox(String title, List<List<String>> data) {
    return Container(
      width: 200,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 134, 195, 246),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 300,
              child: Linechart(data: data),
            ),
          ],
        ),
      ),
    );
  }
}

class StatsContainer extends StatelessWidget {
  final IconData icon;
  final String text;

  const StatsContainer({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 134, 195, 246),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      margin: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 5),
          Flexible(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Linechart extends StatelessWidget {
  final List<List<String>> data;
  const Linechart({Key? key, required this.data}) : super(key: key);

  int getMaxY() {
    int max = 0;
    for (int i = 0; i < data.length; i++) {
      if (int.parse(data[i][1]) > max) {
        max = int.parse(data[i][1]);
      }
    }
    return pow(10, max.toString().length).toInt();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 30),
      child: LineChart(LineChartData(
        maxY: getMaxY().toDouble(),
        minY: 0,
        gridData: FlGridData(show: false),
        borderData: FlBorderData(
          border: const Border(
            bottom: BorderSide(width: 2),
            left: BorderSide(width: 2),
          ),
        ),
        titlesData: FlTitlesData(
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: data
                .map(
                  (pt) => FlSpot(
                    data.indexOf(pt).toDouble(),
                    int.parse(pt[1]).toDouble(),
                  ),
                )
                .toList(),
            isCurved: false,
            barWidth: 1,
            dotData: FlDotData(show: true),
          ),
        ],
      )),
    );
  }
}
