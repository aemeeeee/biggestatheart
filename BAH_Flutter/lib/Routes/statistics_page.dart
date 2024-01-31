import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Helpers/helper.dart';
import '../Helpers/http.dart';
import '../Helpers/standard_widgets.dart';
import 'date_time_picker.dart';
import 'Stepper.dart';
import 'search_result_page.dart';
import 'catalogue_mux_page.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import '../Models/species.dart';

// default error page for erroneous search results
class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Error'),
      ),
      body: const Center(
        child: Text('No data found. Please try again.',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center),
      ),
    );
  }
}

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key});

  @override
  StatisticsPageState createState() => StatisticsPageState();
}

class StatisticsPageState extends State<StatisticsPage>
    with SingleTickerProviderStateMixin {
  String mux = '';
  String jwt = '';
  String date1 = '2000-01-01';
  String time1 = '00:00:00';
  String date2 = DateFormat("yyyy-MM-dd").format(DateTime.now());
  String time2 = DateFormat("hh:mm:ss").format(DateTime.now());
  String species = '';
  String sightingLocation = '';
  String class_ = '';
  String order = '';
  String family = '';
  String genus = '';
  final helpers = Helpers();
  final httpHelpers = HttpHelpers();
  final speciesController = TextEditingController();
  final locationController = TextEditingController();
  late AnimationController _animationController;
  // ignore: unused_field
  late Animation<double> _fadeAnimation;
  // ignore: unused_field
  late Animation<Offset> _slideAnimation;
  List<String> allSpecies = <String>[];

  @override

  // intialized animation controller and animation
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _fadeAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _slideAnimation =
        Tween<Offset>(begin: const Offset(-1.0, 0.0), end: Offset.zero).animate(
            CurvedAnimation(
                parent: _animationController, curve: Curves.easeInOut));
    _animationController.forward();
    for (var record in singaporeRecords) {
      allSpecies.add('${record.commonNames} (${record.species})');
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _clearSearchInputs() {
    setState(() {
      date1 = '2000-01-01';
      time1 = '00:00:00';
      date2 = DateFormat("yyyy-MM-dd").format(DateTime.now());
      time2 = DateFormat("hh:mm:ss").format(DateTime.now());
      species = '';
      sightingLocation = '';
      class_ = '';
      order = '';
      family = '';
      genus = '';
      speciesController.clear();
      locationController.clear();
    });
  }

  // Search function to be called when search button is pressed
  // Sends HTTP request to backend and returns a result page according to mux value
  void _search(
      String date1,
      String time1,
      String date2,
      String time2,
      String location,
      String species,
      String class_,
      String order,
      String family,
      String genus,
      String jwt) {
    if (mux == 'species') {
      httpHelpers
          .searchSpeciesName(
        species,
        '$date1 $time1',
        '$date2 $time2',
        location,
      )
          .then((value) {
        if (value.isNotEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchResultPage(
                dataList: value,
                startTime: '$date1 $time1',
                endTime: '$date2 $time2',
                sightinglocation: location,
              ),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ErrorPage(),
            ),
          );
        }
      }).catchError((error) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ErrorPage(),
          ),
        );
      });
    } else {
      httpHelpers
          .searchClassification(
        class_,
        order,
        family,
        genus,
        '$date1 $time1',
        '$date2 $time2',
        location,
      )
          .then((value) {
        if (value.isNotEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchResultPage(
                dataList: value,
                startTime: '$date1 $time1',
                endTime: '$date2 $time2',
                sightinglocation: location,
              ),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ErrorPage(),
            ),
          );
        }
      }).catchError((error) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ErrorPage(),
          ),
        );
      });
    }
  }

  Widget blueBox(String text, Widget widget) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 82, 108, 175),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10, top: 10),
            alignment: Alignment.centerLeft,
            child: Text(
              text,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 51, 64, 113)),
              textAlign: TextAlign.left,
            ),
          ),
          widget,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // when mux is empty on page initializarion, display the selection page for search type
    if (mux == '') {
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 190, 222, 248),
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Search Statistics'),
          backgroundColor: const Color.fromARGB(255, 65, 90, 181),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Search by species name button, which sets mux to 'species' and rebuilds the page accordingly
                  AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      final slideAnimation = Tween<Offset>(
                        begin: const Offset(1, 0),
                        end: const Offset(0, 0),
                      ).animate(_animationController);

                      final fadeAnimation = Tween<double>(
                        begin: 0,
                        end: 1,
                      ).animate(_animationController);

                      return SlideTransition(
                        position: slideAnimation,
                        child: Opacity(
                          opacity: fadeAnimation.value,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 100,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  mux = 'species';
                                });
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                )),
                              ),
                              child: Row(children: [
                                const SizedBox(width: 10),
                                Image.asset(
                                  'assets/images/species_logo.png',
                                  height: 60,
                                  width: 60,
                                ),
                                const SizedBox(width: 21),
                                const Text(
                                  'Species',
                                  style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.right,
                                ),
                              ]),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),

                  // Search by classification button, which sets mux to 'classification' and rebuilds the page accordingly
                  AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      final slideAnimation = Tween<Offset>(
                        begin: const Offset(1, 0),
                        end: const Offset(0, 0),
                      ).animate(_animationController);

                      final fadeAnimation = Tween<double>(
                        begin: 0,
                        end: 1,
                      ).animate(_animationController);

                      return SlideTransition(
                        position: slideAnimation,
                        child: Opacity(
                          opacity: fadeAnimation.value,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 100,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  mux = 'classification';
                                });
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                )),
                              ),
                              child: Row(children: [
                                const SizedBox(width: 10),
                                Image.asset(
                                  'assets/images/classification_logo.png',
                                  height: 60,
                                  width: 60,
                                ),
                                const SizedBox(width: 20),
                                const Text(
                                  'Classification',
                                  style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.right,
                                ),
                              ]),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),

                  // Search by catalogue button, which navigates to the catalogue selection page
                  AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      final slideAnimation = Tween<Offset>(
                        begin: const Offset(1, 0),
                        end: const Offset(0, 0),
                      ).animate(_animationController);

                      final fadeAnimation = Tween<double>(
                        begin: 0,
                        end: 1,
                      ).animate(_animationController);

                      return SlideTransition(
                        position: slideAnimation,
                        child: Opacity(
                          opacity: fadeAnimation.value,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 100,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const CatalogueMuxPage(),
                                  ),
                                );
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                )),
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    const EdgeInsets.all(10)),
                              ),
                              child: Row(
                                children: [
                                  const SizedBox(width: 18),
                                  Image.asset(
                                    'assets/images/catalogue_logo.png',
                                    height: 60,
                                    width: 60,
                                  ),
                                  const SizedBox(width: 18),
                                  const Text(
                                    'Catalogue',
                                    style: TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        )),
      );
    } else {
      return Scaffold(
          backgroundColor: const Color.fromARGB(255, 190, 222, 248),
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Search Statistics'),
            backgroundColor: const Color.fromARGB(255, 65, 90, 181),
          ),
          body: SingleChildScrollView(
            child: Column(children: [
              // when mux is 'species', display the species name search box with autocomplete
              (mux == 'species')
                  ? blueBox(
                      "1. Choose species",
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: selectableTextForm(
                            speciesController,
                            'Enter species name',
                            const Icon(Icons.search),
                            allSpecies,
                            titleCallback,
                            titleClearCallback),
                      ))

                  // when mux is 'classification', display the classification search box with stepper
                  : blueBox(
                      "1. Choose classification",
                      Column(
                        children: [
                          Container(
                              width: double.infinity,
                              margin: const EdgeInsets.only(
                                  top: 10, left: 12, right: 12),
                              child: ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          content: SizedBox(
                                            height: 500,
                                            width: 500,
                                            child: SpeciesStepper(
                                              classCallback: classCallback,
                                              orderCallback: orderCallback,
                                              familyCallback: familyCallback,
                                              genusCallback: genusCallback,
                                            ),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                                child: const Text("Cancel"),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                })
                                          ],
                                        );
                                      });
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(
                                        255, 102, 154, 217)),
                                child: const Text('Choose classification',
                                    style: TextStyle(fontSize: 16)),
                              )),
                          Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            padding: const EdgeInsets.only(left: 12, right: 12),
                            alignment: Alignment.center,
                            width: double.infinity,
                            color: const Color.fromARGB(255, 190, 222, 248),
                            child: Text(
                                'Class: $class_\nOrder: $order\nFamily: $family\nGenus: $genus',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 51, 64, 113))),
                          )
                        ],
                      )),

              // location search box with autocomplete
              blueBox(
                  "2. Choose sighting location",
                  Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: selectableTextForm(
                          locationController,
                          'Enter location',
                          const Icon(Icons.location_on),
                          locations,
                          locationCallback,
                          locationClearCallback))),

              // date and time picker
              blueBox(
                  "3. Choose range of sighting time",
                  Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 25,
                        color: const Color.fromARGB(255, 190, 222, 248),
                        child: Text(
                          "From: $date1 $time1",
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 51, 64, 113)),
                        ),
                      ),
                      PickerDateTimeRoute(
                        dateCallback: dateCallback1,
                        timeCallback: timeCallback1,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 25,
                        color: const Color.fromARGB(255, 190, 222, 248),
                        child: (date2 == '' && time2 == '')
                            ? Text(
                                'To: ${DateFormat("yyyy-MM-dd hh:mm:ss").format(DateTime.now())}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 51, 64, 113)),
                              )
                            : Text(
                                "To: $date2 $time2",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 51, 64, 113)),
                              ),
                      ),
                      PickerDateTimeRoute(
                        dateCallback: dateCallback2,
                        timeCallback: timeCallback2,
                      ),
                    ],
                  )),

              // search and clear buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _search(date1, time1, date2, time2, sightingLocation,
                          species, class_, order, family, genus, jwt);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 80, 170, 121)),
                    child: const Text('Search', style: TextStyle(fontSize: 30)),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      _clearSearchInputs();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 170, 80, 80)),
                    child: const Text('Clear', style: TextStyle(fontSize: 30)),
                  )
                ],
              ),
            ]),
          ));
    }
  }

  timeCallback1(newValue) {
    setState(() {
      time1 = newValue;
    });
  }

  dateCallback1(newValue) {
    setState(() {
      date1 = newValue;
    });
  }

  timeCallback2(newValue) {
    setState(() {
      time2 = newValue;
    });
  }

  dateCallback2(newValue) {
    setState(() {
      date2 = newValue;
    });
  }

  classCallback(newValue) {
    setState(() {
      class_ = newValue;
    });
  }

  orderCallback(newValue) {
    setState(() {
      order = newValue;
    });
  }

  familyCallback(newValue) {
    setState(() {
      family = newValue;
    });
  }

  genusCallback(newValue) {
    setState(() {
      genus = newValue;
    });
  }

  titleCallback(newValue) {
    setState(() {
      species = newValue.split('(')[0].split(', ')[0];
    });
    final speciesRecord = singaporeRecords.singleWhere(
        (record) => '${record.commonNames} (${record.species})' == newValue,
        orElse: () {
      return SpeciesRecord(
          class_: '',
          order: '',
          family: '',
          genus: '',
          species: '',
          commonNames: '');
    });
    if (speciesRecord.class_ != '' &&
        speciesRecord.order != '' &&
        speciesRecord.family != '' &&
        speciesRecord.genus != '') {
      setState(() {
        class_ = speciesRecord.class_;
        order = speciesRecord.order;
        family = speciesRecord.family;
        genus = speciesRecord.genus;
        species = speciesRecord.commonNames.split(',')[0];
      });
    }
  }

  locationCallback(newValue) {
    setState(() {
      sightingLocation = newValue;
    });
  }

  titleClearCallback() {
    setState(() {
      species = '';
      speciesController.clear();
    });
  }

  locationClearCallback() {
    setState(() {
      sightingLocation = '';
      locationController.clear();
    });
  }

  Widget selectableTextForm(
      TextEditingController controller,
      String labelText,
      Icon leadingIcon,
      List<String> options,
      Function updateCallback,
      Function clearCallback) {
    return Container(
        margin: const EdgeInsets.only(top: 5, bottom: 10),
        padding: const EdgeInsets.only(
          left: 5,
          right: 5,
        ),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 225, 235, 248),
            borderRadius: BorderRadius.circular(16)),
        child: TypeAheadFormField(
          hideOnLoading: true,
          hideOnEmpty: true,
          textFieldConfiguration: TextFieldConfiguration(
              onChanged: (value) => updateCallback(value),
              controller: controller,
              decoration: InputDecoration(
                focusColor: const Color.fromARGB(255, 51, 64, 113),
                icon: leadingIcon,
                border: InputBorder.none,
                labelText: labelText,
                suffixIcon: IconButton(
                  onPressed: () {
                    clearCallback();
                  },
                  icon: const Icon(Icons.clear),
                ),
              ),
              autofocus: true,
              style: const TextStyle(color: Color.fromARGB(255, 51, 64, 113))),
          itemBuilder: (context, suggestion) {
            return ListTile(
              title: Text(suggestion),
            );
          },
          errorBuilder: (context, error) {
            return NoticeDialog(content: '$error');
          },
          suggestionsCallback: (pattern) {
            List<String> matches = [];
            if (pattern == '') {
              return matches;
            } else {
              matches.addAll(options);
              matches.retainWhere((matches) {
                return matches.toLowerCase().contains(pattern.toLowerCase());
              });
              return matches;
            }
          },
          onSuggestionSelected: (suggestion) {
            updateCallback(suggestion);
            controller.text = suggestion;
          },
        ));
  }
}
