// import 'package:flutter/material.dart';
// import 'class_chooser.dart';
// import 'order_chooser.dart';
// import 'family_chooser.dart';
// import 'genus_chooser.dart';

// class SpeciesStepper extends StatefulWidget {
//   final Function classCallback;
//   final Function orderCallback;
//   final Function familyCallback;
//   final Function genusCallback;

//   const SpeciesStepper(
//       {Key? key,
//       required this.classCallback,
//       required this.orderCallback,
//       required this.familyCallback,
//       required this.genusCallback})
//       : super(key: key);

//   @override
//   SpeciesStepperState createState() => SpeciesStepperState();
// }

// class SpeciesStepperState extends State<SpeciesStepper> {
//   String order = '';
//   String class_ = '';
//   String family = '';
//   String genus = '';
//   int currentStep = 0;

//   @override
//   Widget build(BuildContext context) {
//     bool isLastStep = (currentStep == showSpeciesSteps().length - 1);
//     return StatefulBuilder(builder: (context, setState) {
//       return SizedBox(
//           height: 500,
//           width: 800,
//           child: Theme(
//               data: ThemeData(
//                   colorScheme: Theme.of(context).colorScheme.copyWith(
//                         primary: const Color.fromARGB(255, 75, 92, 154),
//                         secondary: const Color.fromARGB(255, 162, 182, 255),
//                       ),
//                   iconTheme: Theme.of(context).iconTheme.copyWith()),
//               child: Stepper(
//                 type: StepperType.vertical,
//                 physics: const ScrollPhysics(),
//                 currentStep: currentStep,
//                 onStepCancel: () => currentStep == 0
//                     ? null
//                     : setState(() {
//                         currentStep--;
//                       }),
//                 onStepTapped: (stepIndex) => setState(() {
//                   currentStep = stepIndex;
//                 }),
//                 onStepContinue: () {
//                   if (isLastStep) {
//                     Navigator.pop(context);
//                   } else {
//                     setState(() {
//                       currentStep += 1;
//                     });
//                   }
//                 },
//                 steps: showSpeciesSteps(),
//                 controlsBuilder: (context, controls) {
//                   return Container(
//                       margin: const EdgeInsets.only(top: 25, left: 15),
//                       child: Wrap(
//                         spacing: 16,
//                         children: <Widget>[
//                           ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                                 backgroundColor:
//                                     const Color.fromARGB(255, 91, 119, 189),
//                                 padding: const EdgeInsets.all(10)),
//                             onPressed: controls.onStepContinue,
//                             child: isLastStep
//                                 ? const Text('Finish')
//                                 : const Text('Continue'),
//                           ),
//                           ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                                 backgroundColor:
//                                     const Color.fromARGB(255, 199, 105, 105),
//                                 padding: const EdgeInsets.all(10)),
//                             onPressed: controls.onStepCancel,
//                             child: const Text('Go back'),
//                           ),
//                           TextButton(
//                               child: const Text("Cancel"),
//                               onPressed: () {
//                                 Navigator.pop(context);
//                               })
//                         ],
//                       ));
//                 },
//               )));
//     });
//   }

//   List<Step> showSpeciesSteps() {
//     return <Step>[
//       Step(
//           state: currentStep > 0 ? StepState.complete : StepState.indexed,
//           isActive: currentStep >= 0,
//           title: const Text("Class"),
//           content: ClassPicker(classCallback: stepperClassChooser)),
//       Step(
//           state: currentStep > 1 ? StepState.complete : StepState.indexed,
//           isActive: currentStep >= 0,
//           title: const Text("Order"),
//           content: OrderPicker(
//             key: ObjectKey(class_),
//             orderCallback: stepperOrderChooser,
//             class_: class_,
//           )),
//       Step(
//           state: currentStep > 2 ? StepState.complete : StepState.indexed,
//           isActive: currentStep >= 0,
//           title: const Text("Family"),
//           content: FamilyPicker(
//             key: ObjectKey(order),
//             familyCallback: stepperFamilyChooser,
//             order: order,
//           )),
//       Step(
//           state: currentStep > 3 ? StepState.complete : StepState.indexed,
//           isActive: currentStep >= 0,
//           title: const Text("Genus"),
//           content: GenusPicker(
//             key: ObjectKey(family),
//             genusCallback: stepperGenusChooser,
//             family: family,
//           )),
//     ];
//   }

//   stepperClassChooser(newvalue) {
//     setState(() {
//       class_ = newvalue;
//     });
//     widget.classCallback(class_);
//   }

//   stepperOrderChooser(newvalue) {
//     setState(() {
//       order = newvalue;
//     });
//     widget.orderCallback(order);
//   }

//   stepperFamilyChooser(newvalue) {
//     setState(() {
//       family = newvalue;
//     });
//     widget.familyCallback(family);
//   }

//   stepperGenusChooser(newvalue) {
//     setState(() {
//       genus = newvalue;
//     });
//     widget.genusCallback(genus);
//   }
// }
