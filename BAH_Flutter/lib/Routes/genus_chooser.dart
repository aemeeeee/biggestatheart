import 'package:ichthyolog/Models/species.dart';
import 'package:selectable_list/selectable_list.dart';
import 'package:flutter/material.dart';

class GenusPicker extends StatefulWidget {
  final Function genusCallback;
  final String family;
  const GenusPicker(
      {Key? key, required this.genusCallback, required this.family})
      : super(key: key);

  @override
  GenusPickerState createState() => GenusPickerState();
}

class GenusPickerState extends State<GenusPicker> {
  String? selectedGenus;

  @override
  Widget build(BuildContext context) {
    return SelectableList<SpeciesClassification, String?>(
      items: mux(),
      itemBuilder: (context, genus, selected, onTap) => ListTile(
          title: Text(genus.classification),
          subtitle: Text(genus.description),
          selected: selected,
          onTap: onTap),
      valueSelector: (genus) => genus.classification,
      selectedValue: selectedGenus,
      onItemSelected: (genus) {
        setState(() {
          selectedGenus = genus.classification;
        });
        widget.genusCallback(selectedGenus);
      },
      onItemDeselected: (genus) {
        setState(() {
          selectedGenus = '';
        });
        widget.genusCallback(selectedGenus);
      },
    );
  }

  List<SpeciesClassification> mux() {
    switch (widget.family) {
      case 'Aetobatidae':
        return genusAetobatidae;
      case 'Albulidae':
        return genusAlbulidae;
      case 'Anabantidae':
        return genusAnabantidae;
      case 'Anostomidae':
        return genusAnostomidae;
      case 'Antennariidae':
        return genusAntennariidae;
      case 'Aplocheilidae':
        return genusAplocheilidae;
      case 'Apogonidae':
        return genusApogonidae;
      case 'Arapaimidae':
        return genusArapaimidae;
      case 'Ariidae':
        return genusAriidae;
      case 'Atelomycteridae':
        return genusAtelomycteridae;
      case 'Atherinidae':
        return genusAtherinidae;
      case 'Aulostomidae':
        return genusAulostomidae;
      case 'Bagridae':
        return genusBagridae;
      case 'Balistidae':
        return genusBalistidae;
      case 'Batrachoididae':
        return genusBatrachoididae;
      case 'Belonidae':
        return genusBelonidae;
      case 'Blennidae':
        return genusBlennidae;
      case 'Blythitidae':
        return genusBlythitidae;
      case 'Bothidae':
        return genusBothidae;
      case 'Carangidae':
        return genusCarangidae;
      case 'Carcharhinidae':
        return genusCarcharhinidae;
      case 'Centrogenyidae':
        return genusCentrogenyidae;
      case 'Chaetodonidae':
        return genusChaetodonidae;
      case 'Chanidae':
        return genusChanidae;
      case 'Channidae':
        return genusChannidae;
      case 'Characidae':
        return genusCharacidae;
      case 'Chirocentridae':
        return genusChirocentridae;
      case 'Cichlidae':
        return genusCichlidae;
      case 'Clariidae':
        return genusClariidae;
      case 'Claroteidae':
        return genusClaroteidae;
      case 'Clupeidae':
        return genusClupeidae;
      case 'Coryphaenidae':
        return genusCoryphaenidae;
      case 'Cynoglossidae':
        return genusCynoglossidae;
      case 'Cyprinidae':
        return genusCyprinidae;
      case 'Dasyatidae':
        return genusDasyatidae;
      case 'Diodontidae':
        return genusDiodontidae;
      case 'Drepaneidae':
        return genusDrepaneidae;
      case 'Dussumieriidae':
        return genusDussumieriidae;
      case 'Echeneidae':
        return genusEcheneidae;
      case 'Eleotridae':
        return genusEleotridae;
      case 'Elopidae':
        return genusElopidae;
      case 'Engraulidae':
        return genusEngraulidae;
      case 'Ephippidae':
        return genusEphippidae;
      case 'Fistulariidae':
        return genusFistulariidae;
      case 'Gerreidae':
        return genusGerreidae;
      case 'Gobiidae':
        return genusGobiidae;
      case 'Gymnarchidae':
        return genusGymnarchidae;
      case 'Gyrinocheilidae':
        return genusGyrinocheilidae;
      case 'Haemulidae':
        return genusHaemulidae;
      case 'Hemiramphidae':
        return genusHemiramphidae;
      case 'Hemiscyllidae':
        return genusHemiscyllidae;
      case 'Holocentridae':
        return genusHolocentridae;
      case 'Istiophoridae':
        return genusIstiophoridae;
      case 'Labridae':
        return genusLabridae;
      case 'Leiognathidae':
        return genusLeiognathidae;
      case 'Lepisosteidae':
        return genusLepisosteidae;
      case 'Lethrinidae':
        return genusLethrinidae;
      case 'Loricariidae':
        return genusLoricariidae;
      case 'Lutjanidae':
        return genusLutjanidae;
      case 'Mastacembelidae':
        return genusMastacembelidae;
      case 'Megalopidae':
        return genusMegalopidae;
      case 'Menidae':
        return genusMenidae;
      case 'Mochokidae':
        return genusMochokidae;
      case 'Monacanthidae':
        return genusMonacanthidae;
      case 'Mugilidae':
        return genusMugilidae;
      case 'Muraenidae':
        return genusMuraenidae;
      case 'Muraenisocidae':
        return genusMuraenisocidae;
      case 'Narkidae':
        return genusNarkidae;
      case 'Nemipteridae':
        return genusNemipteridae;
      case 'Notopteridae':
        return genusNotopteridae;
      case 'Ophichthidae':
        return genusOphichthidae;
      case 'Osphronemidae':
        return genusOsphronemidae;
      case 'Osteoglossidae':
        return genusOsteoglossidae;
      case 'Pangasiidae':
        return genusPangasiidae;
      case 'Paralichthyidae':
        return genusParalichthyidae;
      case 'Pegasidae':
        return genusPegasidae;
      case 'Pimelodidae':
        return genusPimelodidae;
      case 'Pinguipedidae':
        return genusPinguipedidae;
      case 'Platycephalidae':
        return genusPlatycephalidae;
      case 'Plotosidae':
        return genusPlotosidae;
      case 'Poeciliidae':
        return genusPoeciliidae;
      case 'Pomacanthidae':
        return genusPomacanthidae;
      case 'Pomacentridae':
        return genusPomacentridae;
      case 'Potamotrygonidae':
        return genusPotamotrygonidae;
      case 'Pristigasteridae':
        return genusPristigasteridae;
      case 'Psettodidae':
        return genusPsettodidae;
      case 'Rachycentridae':
        return genusRachycentridae;
      case 'Rhinidae':
        return genusRhinidae;
      case 'Rhinobatidae':
        return genusRhinobatidae;
      case 'Scaridae':
        return genusScaridae;
      case 'Sciaenidae':
        return genusSciaenidae;
      case 'Scombridae':
        return genusScombridae;
      case 'Scorpaenidae':
        return genusScorpaenidae;
      case 'Serranidae':
        return genusSerranidae;
      case 'Serrasalmidae':
        return genusSerrasalmidae;
      case 'Siganidae':
        return genusSiganidae;
      case 'Sillaginidae':
        return genusSillaginidae;
      case 'Soleidae':
        return genusSoleidae;
      case 'Sphyraenidae':
        return genusSphyraenidae;
      case 'Synanceiidae':
        return genusSynanceiidae;
      case 'Synbranchidae':
        return genusSynbranchidae;
      case 'Syngnathidae':
        return genusSyngnathidae;
      case 'Synodontidae':
        return genusSynodontidae;
      case 'Terapontidae':
        return genusTerapontidae;
      case 'Tetraodontidae':
        return genusTetraodontidae;
      case 'Tetrarogidae':
        return genusTetrarogidae;
      case 'Triacanthidae':
        return genusTriacanthidae;
      case 'Trichonotidae':
        return genusTrichonotidae;
      case 'Zenarchopteridae':
        return genusZenarchopteridae;
      default:
        return genusAetobatidae +
            genusAlbulidae +
            genusAnabantidae +
            genusAnostomidae +
            genusAntennariidae +
            genusAplocheilidae +
            genusApogonidae +
            genusArapaimidae +
            genusAriidae +
            genusAtelomycteridae +
            genusAtherinidae +
            genusAulostomidae +
            genusBagridae +
            genusBalistidae +
            genusBatrachoididae +
            genusBelonidae +
            genusBlennidae +
            genusBlythitidae +
            genusBothidae +
            genusCarangidae +
            genusCarcharhinidae +
            genusCentrogenyidae +
            genusChaetodonidae +
            genusChanidae +
            genusChannidae +
            genusCharacidae +
            genusChirocentridae +
            genusCichlidae +
            genusClariidae +
            genusClaroteidae +
            genusClupeidae +
            genusCoryphaenidae +
            genusCynoglossidae +
            genusCyprinidae +
            genusDasyatidae +
            genusDiodontidae +
            genusDrepaneidae +
            genusDrepaneidae +
            genusDussumieriidae +
            genusEcheneidae +
            genusEleotridae +
            genusElopidae +
            genusEngraulidae +
            genusEphippidae +
            genusFistulariidae +
            genusGerreidae +
            genusGobiidae +
            genusGymnarchidae +
            genusGyrinocheilidae +
            genusHaemulidae +
            genusHemiramphidae +
            genusHemiscyllidae +
            genusHolocentridae +
            genusIstiophoridae +
            genusLabridae +
            genusLeiognathidae +
            genusLepisosteidae +
            genusLethrinidae +
            genusLoricariidae +
            genusLutjanidae +
            genusMastacembelidae +
            genusMegalopidae +
            genusMenidae +
            genusMochokidae +
            genusMochokidae +
            genusMonacanthidae +
            genusMugilidae +
            genusMuraenidae +
            genusMuraenisocidae +
            genusNarkidae +
            genusNemipteridae +
            genusNotopteridae +
            genusOphichthidae +
            genusOsphronemidae +
            genusOsteoglossidae +
            genusPangasiidae +
            genusParalichthyidae +
            genusParalichthyidae +
            genusPegasidae +
            genusPimelodidae +
            genusPinguipedidae +
            genusPlatycephalidae +
            genusPlotosidae +
            genusPoeciliidae +
            genusPomacanthidae +
            genusPomacentridae +
            genusPotamotrygonidae +
            genusPristigasteridae +
            genusPsettodidae +
            genusRachycentridae +
            genusRhinidae +
            genusRhinobatidae +
            genusScaridae +
            genusSciaenidae +
            genusScombridae +
            genusScorpaenidae +
            genusSerranidae +
            genusSerrasalmidae +
            genusSiganidae +
            genusSillaginidae +
            genusSoleidae +
            genusSphyraenidae +
            genusSynanceiidae +
            genusSynbranchidae +
            genusSyngnathidae +
            genusSynodontidae +
            genusTerapontidae +
            genusTetraodontidae +
            genusTetrarogidae +
            genusTrichonotidae +
            genusZenarchopteridae;
    }
  }
}
