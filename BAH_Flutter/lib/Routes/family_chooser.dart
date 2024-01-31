import '../Models/species.dart';
import 'package:selectable_list/selectable_list.dart';
import 'package:flutter/material.dart';

class FamilyPicker extends StatefulWidget {
  final Function familyCallback;
  final String order;
  const FamilyPicker(
      {Key? key, required this.familyCallback, required this.order})
      : super(key: key);

  @override
  FamilyPickerState createState() => FamilyPickerState();
}

class FamilyPickerState extends State<FamilyPicker> {
  String? selectedFamily;

  @override
  Widget build(BuildContext context) {
    return SelectableList<SpeciesClassification, String?>(
      items: mux(),
      itemBuilder: (context, family, selected, onTap) => ListTile(
          title: Text(family.classification),
          subtitle: Text(family.description),
          selected: selected,
          onTap: onTap),
      valueSelector: (family) => family.classification,
      selectedValue: selectedFamily,
      onItemSelected: (family) {
        setState(() {
          selectedFamily = family.classification;
        });
        widget.familyCallback(selectedFamily);
      },
      onItemDeselected: (family) {
        setState(() {
          selectedFamily = '';
        });
        widget.familyCallback(selectedFamily);
      },
    );
  }

  List<SpeciesClassification> mux() {
    switch (widget.order) {
      case 'Albuliformes':
        return familyAlbuliformes;
      case 'Anabantiformes':
        return familyAnabantiformes;
      case 'Anguilliformes':
        return familyAnguilliformes;
      case 'Atheriniformes':
        return familyAtheriniformes;
      case 'Aulopiformes':
        return familyAulopiformes;
      case 'Batrachoidiformes':
        return familyBatrachoidiformes;
      case 'Beloniformes':
        return familyBeloniformes;
      case 'Blenniformes':
        return familyBlenniformes;
      case 'Carangiformes':
        return familyCarangiformes;
      case 'Carcharhiniformes':
        return familyCarcharhiniformes;
      case 'Characiformes':
        return familyCharaciformes;
      case 'Cichliformes':
        return familyCichliformes;
      case 'Clupeiformes':
        return familyClupeiformes;
      case 'Cypriniformes':
        return familyCypriniformes;
      case 'Cyprinodontiformes':
        return familyCyprinodontiformes;
      case 'Elopiformes':
        return familyElopiformes;
      case 'Gobiiformes':
        return familyGobiiformes;
      case 'Gonorynchiformes':
        return familyGonorynchiformes;
      case 'Holocentriformes':
        return familyHolocentriformes;
      case 'Istiophoriformes':
        return familyIstiophoriformes;
      case 'Kurtiformes':
        return familyKurtiformes;
      case 'Lepisosteiformes':
        return familyLepisosteiformes;
      case 'Lophiiformes':
        return familyLophiiformes;
      case 'Mugiliformes':
        return familyMugiliformes;
      case 'Ophidiiformes':
        return familyOphidiiformes;
      case 'Orectolobiformes':
        return familyOrectolobiformes;
      case 'Osteoglossiformes':
        return familyOsteoglossiformes;
      case 'Perciformes':
        return familyPerciformes;
      case 'Pleuronectiformes':
        return familyPleuronectiformes;
      case 'Rajiformes':
        return familyRajiformes;
      case 'Rhinopristiformes':
        return familyRhinopristiformes;
      case 'Scombriformes':
        return familyScombriformes;
      case 'Scorpaeniformes':
        return familyScorpaeniformes;
      case 'Siluriformes':
        return familySiluriformes;
      case 'Synbranchiformes':
        return familySynbranchiformes;
      case 'Syngnathiformes':
        return familySyngnathiformes;
      case 'Tetraodontiformes':
        return familyTetraodontiformes;
      case 'Torpediniformes':
        return familyTorpediniformes;
      default:
        return familyAlbuliformes +
            familyAnabantiformes +
            familyAnguilliformes +
            familyAtheriniformes +
            familyAulopiformes +
            familyBatrachoidiformes +
            familyBeloniformes +
            familyBlenniformes +
            familyCarangiformes +
            familyCarcharhiniformes +
            familyCharaciformes +
            familyCichliformes +
            familyClupeiformes +
            familyCypriniformes +
            familyCyprinodontiformes +
            familyElopiformes +
            familyElopiformes +
            familyGobiiformes +
            familyGonorynchiformes +
            familyHolocentriformes +
            familyIstiophoriformes +
            familyKurtiformes +
            familyLepisosteiformes +
            familyLophiiformes +
            familyMugiliformes +
            familyOphidiiformes +
            familyOrectolobiformes +
            familyOsteoglossiformes +
            familyPerciformes +
            familyPleuronectiformes +
            familyRajiformes +
            familyRhinopristiformes +
            familyScombriformes +
            familyScorpaeniformes +
            familySiluriformes +
            familySynbranchiformes +
            familySyngnathiformes +
            familyTetraodontiformes +
            familyTorpediniformes;
    }
  }
}
