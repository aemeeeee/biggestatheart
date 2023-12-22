class SpeciesClassification {
  final String classification;
  final String description;

  SpeciesClassification(
      {required this.classification, required this.description});
}

class SpeciesRecord {
  final String class_;
  final String order;
  final String family;
  final String genus;
  final String species;
  final String commonNames;

  SpeciesRecord(
      {required this.class_,
      required this.order,
      required this.family,
      required this.genus,
      required this.species,
      required this.commonNames});
}

List<SpeciesRecord> singaporeRecords = [
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Elopiformes',
      family: 'Elopidae',
      genus: 'Elops',
      species: 'Elops hawaiensis',
      commonNames: 'Hawaiian Ladyfish, Giant Herring, Tenpounder'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Elopiformes',
      family: 'Megalopidae',
      genus: 'Megalops',
      species: 'Megalops cyprinoides',
      commonNames: 'Indo-Pacific Tarpon, Bulan'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Albuliformes',
      family: 'Albulidae',
      genus: 'Albula',
      species: 'Albula argentea',
      commonNames: 'Longjaw Bonefish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Anguilliformes',
      family: 'Muraenisocidae',
      genus: 'Congresox',
      species: 'Congresox talabon',
      commonNames: 'Yellow Pike Conger, Malong'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Anguilliformes',
      family: 'Muraenisocidae',
      genus: 'Congresox',
      species: 'Congresox talabonoides',
      commonNames: 'Indian Pike Conger'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Anguilliformes',
      family: 'Muraenisocidae',
      genus: 'Muraenesox',
      species: 'Muraenesox bagio',
      commonNames: 'Common Pike Conger'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Anguilliformes',
      family: 'Muraenisocidae',
      genus: 'Muraenesox',
      species: 'Muraenesox cinereus',
      commonNames: 'Daggertooth Pike Conger'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Anguilliformes',
      family: 'Muraenidae',
      genus: 'Diaphenchelys',
      species: 'Diaphenchelys dalmatian',
      commonNames: 'Dalmatian Moray'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Anguilliformes',
      family: 'Muraenidae',
      genus: 'Gymnothorax',
      species: 'Gymnothorax favagineus',
      commonNames: 'Honeycomb Moray'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Anguilliformes',
      family: 'Muraenidae',
      genus: 'Gymnothorax',
      species: 'Gymnothorax isingteena',
      commonNames: 'Spotted Moray'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Anguilliformes',
      family: 'Muraenidae',
      genus: 'Gymnothorax',
      species: 'Gymnothorax tile',
      commonNames: 'Indian Mud Moray, Estuarine Moray'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Anguilliformes',
      family: 'Muraenidae',
      genus: 'Gymnothorax',
      species: 'Gymnothorax reevesii',
      commonNames: 'Brownspotted Moray, Reeves’ Moray'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Anguilliformes',
      family: 'Muraenidae',
      genus: 'Gymnothorax',
      species: 'Gymnothorax herrei',
      commonNames: 'Herre’s Moray, Palechin Moray'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Anguilliformes',
      family: 'Muraenidae',
      genus: 'Gymnothorax',
      species: 'Gymnothorax javanicus',
      commonNames: 'Giant Moray'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Anguilliformes',
      family: 'Muraenidae',
      genus: 'Gymnothorax',
      species: 'Gymnothorax pseudothyrsoideus',
      commonNames: 'Highfin Moray'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Anguilliformes',
      family: 'Muraenidae',
      genus: 'Gymnothorax',
      species: 'Gymnothorax longinquus',
      commonNames: 'Yellowgill Moray'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Anguilliformes',
      family: 'Muraenidae',
      genus: 'Gymnothorax',
      species: 'Gymnothorax annulatus',
      commonNames: 'Ringed Moray'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Anguilliformes',
      family: 'Muraenidae',
      genus: 'Gymnothorax',
      species: 'Gymnothorax albimarginatus',
      commonNames: 'Whitemargin Moray'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Anguilliformes',
      family: 'Muraenidae',
      genus: 'Gymnothorax',
      species: 'Gymnothorax phasmatodes',
      commonNames: 'Ghost Moray'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Anguilliformes',
      family: 'Muraenidae',
      genus: 'Gymnothorax',
      species: 'Gymnothorax richardsoni',
      commonNames: 'Richardson’s Moray'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Anguilliformes',
      family: 'Muraenidae',
      genus: 'Strophidon',
      species: 'Strophidon sathete',
      commonNames: 'Gangetic Moray, Slender Giant Moray'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Anguilliformes',
      family: 'Muraenidae',
      genus: 'Strophidon',
      species: 'Strophidon tetraporus',
      commonNames: 'Four-pored Slender Giant Moray'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Anguilliformes',
      family: 'Muraenidae',
      genus: 'Strophidon',
      species: 'Strophidon dorsalis',
      commonNames: 'Longback Moray'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Anguilliformes',
      family: 'Ophichthidae',
      genus: 'Ophichthus',
      species: 'Ophichthus lithinus',
      commonNames: 'Evermann’s Snake Eel'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Anguilliformes',
      family: 'Ophichthidae',
      genus: 'Pisodonophis',
      species: 'Pisodonophis boro',
      commonNames: 'Burrowing Snake Eel, Mangrove Snake Eel'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Anguilliformes',
      family: 'Ophichthidae',
      genus: 'Pisodonophis',
      species: 'Pisodonophis cancrivorus',
      commonNames: 'Longfin Snake Eel'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Anguilliformes',
      family: 'Ophichthidae',
      genus: 'Scolecenchelys',
      species: 'Scolecenchelys macroptera',
      commonNames: 'Worm Eel'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Synbranchiformes',
      family: 'Synbranchidae',
      genus: 'Macrotrema',
      species: 'Macrotrema caligans',
      commonNames: 'Pink Mud Eel'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Synbranchiformes',
      family: 'Synbranchidae',
      genus: 'Ophisternon',
      species: 'Ophisternon bengalense',
      commonNames: 'Bengal Eel, Mangrove Swamp Eel'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Synbranchiformes',
      family: 'Synbranchidae',
      genus: 'Monopterus',
      species: 'Monopterus javanensis',
      commonNames: 'Sunda Swamp Eel'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Synbranchiformes',
      family: 'Mastacembelidae',
      genus: 'Macrognathus',
      species: 'Macrognathus maculatus',
      commonNames: 'Buff-backed Spiny Eel'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Synbranchiformes',
      family: 'Mastacembelidae',
      genus: 'Macrognathus',
      species: 'Macrognathus zebrinus',
      commonNames: 'Zebra Spiny Eel'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Osteoglossiformes',
      family: 'Arapaimidae',
      genus: 'Arapaima',
      species: 'Arapaima gigas',
      commonNames: 'Arapaima'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Osteoglossiformes',
      family: 'Osteoglossidae',
      genus: 'Scleropages',
      species: 'Scleropages formosus',
      commonNames: 'Asian Arowana'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Osteoglossiformes',
      family: 'Osteoglossidae',
      genus: 'Scleropages',
      species: 'Scleropages jardinii',
      commonNames: 'Jardini Arowana, Saratoga'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Osteoglossiformes',
      family: 'Osteoglossidae',
      genus: 'Osteoglossum',
      species: 'Osteoglossum bicirrhosum',
      commonNames: 'Silver Arowana'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Osteoglossiformes',
      family: 'Notopteridae',
      genus: 'Chitala',
      species: 'Chitala ornata',
      commonNames: 'Clown Knifefish, Clown Featherback'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Osteoglossiformes',
      family: 'Notopteridae',
      genus: 'Chitala',
      species: 'Chitala blanci',
      commonNames: 'Royal Knifefish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Osteoglossiformes',
      family: 'Notopteridae',
      genus: 'Notopterus',
      species: 'Notopterus notopterus',
      commonNames: 'Bronze Knifefish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Osteoglossiformes',
      family: 'Gymnarchidae',
      genus: 'Gymnarchus',
      species: 'Gymnarchus niloticus',
      commonNames: 'Aba, African Knifefish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Lepisosteiformes',
      family: 'Lepisosteidae',
      genus: 'Lepisosteus',
      species: 'Lepisosteus oculatus',
      commonNames: 'Spotted Gar'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Lepisosteiformes',
      family: 'Lepisosteidae',
      genus: 'Atractosteus',
      species: 'Atractosteus spatula',
      commonNames: 'Alligator Gar'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Clupeiformes',
      family: 'Chirocentridae',
      genus: 'Chirocentrus',
      species: 'Chirocentrus dorab',
      commonNames: 'Dorab Wolf Herring, Saitoh'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Clupeiformes',
      family: 'Chirocentridae',
      genus: 'Chirocentrus',
      species: 'Chirocentrus nudus',
      commonNames: 'Whitefin Wolf Herring'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Clupeiformes',
      family: 'Clupeidae',
      genus: 'Amblygaster',
      species: 'Amblygaster sirm',
      commonNames: 'Spotted Sardine'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Clupeiformes',
      family: 'Clupeidae',
      genus: 'Anodontosoma',
      species: 'Anodontosoma chacunda',
      commonNames: 'Chacunda Gizzard Shad'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Clupeiformes',
      family: 'Clupeidae',
      genus: 'Nematalosa',
      species: 'Nematalosa galatheae',
      commonNames: 'Galathea Gizzard Shad'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Clupeiformes',
      family: 'Clupeidae',
      genus: 'Nematalosa',
      species: 'Nematalosa nasus',
      commonNames: 'Bloch’s Gizzard Shad'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Clupeiformes',
      family: 'Clupeidae',
      genus: 'Sardinella',
      species: 'Sardinella albella',
      commonNames: 'White Tamban'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Clupeiformes',
      family: 'Clupeidae',
      genus: 'Sardinella',
      species: 'Sardinella gibbosa',
      commonNames: 'Goldstriped Sardinella'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Clupeiformes',
      family: 'Clupeidae',
      genus: 'Sardinella',
      species: 'Sardinella fimbriata',
      commonNames: 'Fringescaled Sardinella'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Clupeiformes',
      family: 'Clupeidae',
      genus: 'Sardinella',
      species: 'Sardinella melanura',
      commonNames: 'Blacktip Sardinella'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Clupeiformes',
      family: 'Clupeidae',
      genus: 'Herklotsichthys',
      species: 'Herklotsichthys dispilonotus',
      commonNames: 'Twospot Tamban, Blacksaddle Herring'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Clupeiformes',
      family: 'Clupeidae',
      genus: 'Hilsa',
      species: 'Hilsa kelee',
      commonNames: 'Fivespot Herring, Assam, Kelee Shad'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Clupeiformes',
      family: 'Dussumieriidae ',
      genus: 'Dussumieria',
      species: 'Dussumieria elopsoides',
      commonNames: 'Slender Rainbow Sardine'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Clupeiformes',
      family: 'Engraulidae',
      genus: 'Coilia',
      species: 'Coilia dussumieri',
      commonNames: 'Goldspotted Grenadier Anchovy'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Clupeiformes',
      family: 'Engraulidae',
      genus: 'Encrasicholina',
      species: 'Encrasicholina heteroloba',
      commonNames: 'Shorthead Anchovy'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Clupeiformes',
      family: 'Engraulidae',
      genus: 'Encrasicholina',
      species: 'Encrasicholina punctifer',
      commonNames: 'Buccaneer Anchovy'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Clupeiformes',
      family: 'Engraulidae',
      genus: 'Stolephorus',
      species: 'Stolephorus indicus',
      commonNames: 'Indian Anchovy'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Clupeiformes',
      family: 'Engraulidae',
      genus: 'Stolephorus',
      species: 'Stolephorus commersonnii',
      commonNames: 'Commerson’s Anchovy'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Clupeiformes',
      family: 'Engraulidae',
      genus: 'Stolephorus',
      species: 'Stolephorus chinensis',
      commonNames: 'China Anchovy'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Clupeiformes',
      family: 'Engraulidae',
      genus: 'Stolephorus',
      species: 'Stolephorus tri',
      commonNames: 'Spined Anchovy'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Clupeiformes',
      family: 'Engraulidae',
      genus: 'Stolephorus',
      species: 'Stolephorus insularis',
      commonNames: 'Hardenberg’s Anchovy'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Clupeiformes',
      family: 'Engraulidae',
      genus: 'Thryssa',
      species: 'Thryssa dussumieri',
      commonNames: 'Dussumier’s Thryssa'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Clupeiformes',
      family: 'Engraulidae',
      genus: 'Thryssa',
      species: 'Thryssa mystax',
      commonNames: 'Mustached Thryssa'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Clupeiformes',
      family: 'Engraulidae',
      genus: 'Thryssa',
      species: 'Thryssa hamiltonii',
      commonNames: 'Hamilton’s Thryssa'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Clupeiformes',
      family: 'Engraulidae',
      genus: 'Thryssa',
      species: 'Thryssa setirostris',
      commonNames: 'Longjaw Thryssa'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Clupeiformes',
      family: 'Engraulidae',
      genus: 'Setipinna',
      species: 'Setipinna taty',
      commonNames: 'Scaly Hairfin Anchovy'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Clupeiformes',
      family: 'Pristigasteridae',
      genus: 'Pellona',
      species: 'Pellona ditchela',
      commonNames: 'Indian Pellona'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Clupeiformes',
      family: 'Pristigasteridae',
      genus: 'Ilisha',
      species: 'Ilisha melastoma',
      commonNames: 'Night Tamban, Indian Ilisha'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Clupeiformes',
      family: 'Pristigasteridae',
      genus: 'Ilisha',
      species: 'Ilisha megaloptera',
      commonNames: 'Bigeye Ilisha'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Clupeiformes',
      family: 'Pristigasteridae',
      genus: 'Ilisha',
      species: 'Ilisha elongata',
      commonNames: 'Elongate Ilisha'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Clupeiformes',
      family: 'Pristigasteridae',
      genus: 'Ilisha',
      species: 'Ilisha kampeni',
      commonNames: 'Kampen’s Ilisha'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Clupeiformes',
      family: 'Pristigasteridae',
      genus: 'Opisthopterus ',
      species: 'Ophisthopterus tardoore',
      commonNames: 'Tardoore, Bigeyed Longfin Herring'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gonorynchiformes',
      family: 'Chanidae',
      genus: 'Chanos',
      species: 'Chanos chanos',
      commonNames: 'Milkfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cypriniformes',
      family: 'Cyprinidae',
      genus: 'Barbodes',
      species: 'Barbodes sellifer',
      commonNames: 'Saddle Barb'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cypriniformes',
      family: 'Cyprinidae',
      genus: 'Barbodes',
      species: 'Barbodes rhombeus',
      commonNames: 'Indochinese Spotted Barb'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cypriniformes',
      family: 'Cyprinidae',
      genus: 'Striuntius',
      species: 'Striuntius lateristriga',
      commonNames: 'Spanner Barb, T-barb'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cypriniformes',
      family: 'Cyprinidae',
      genus: 'Puntigrus',
      species: 'Puntigrus tetrazona',
      commonNames: 'Fourbanded Tiger Barb'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cypriniformes',
      family: 'Cyprinidae',
      genus: 'Puntigrus',
      species: 'Puntigrus partipentazona',
      commonNames: 'Fivebanded Tiger Barb'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cypriniformes',
      family: 'Cyprinidae',
      genus: 'Puntius',
      species: 'Puntius sophore',
      commonNames: 'Spotfin Swamp Barb'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cypriniformes',
      family: 'Cyprinidae',
      genus: 'Desmopuntius',
      species: 'Desmopuntius hexazona',
      commonNames: 'Sixbanded Tiger Barb'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cypriniformes',
      family: 'Cyprinidae',
      genus: 'Barbonymus ',
      species: 'Barbonymus altus',
      commonNames: 'Redtailed Tinfoil Barb'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cypriniformes',
      family: 'Cyprinidae',
      genus: 'Barbonymus ',
      species: 'Barbonymus schwanefeldii',
      commonNames: 'Tinfoil Barb, Lampan'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cypriniformes',
      family: 'Cyprinidae',
      genus: 'Barbonymus ',
      species: 'Barbonymus gonionotus',
      commonNames: 'Silver Tinfoil Barb'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cypriniformes',
      family: 'Cyprinidae',
      genus: 'Brachydanio',
      species: 'Brachydanio albolineata',
      commonNames: 'Pearl Danio'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cypriniformes',
      family: 'Cyprinidae',
      genus: 'Carassius ',
      species: 'Carassius auratus',
      commonNames: 'Goldfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cypriniformes',
      family: 'Cyprinidae',
      genus: 'Hampala',
      species: 'Hampala macrolepidota',
      commonNames: 'Sebarau'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cypriniformes',
      family: 'Cyprinidae',
      genus: 'Cyprinus',
      species: 'Cyprinus rubrofuscus',
      commonNames: 'Amur Carp, Koi'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cypriniformes',
      family: 'Cyprinidae',
      genus: 'Cyprinus',
      species: 'Cyprinus carpio',
      commonNames: 'Common Carp'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cypriniformes',
      family: 'Cyprinidae',
      genus: 'Ctenopharyngodon',
      species: 'Ctenopharyngodon idella',
      commonNames: 'Grass Carp'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cypriniformes',
      family: 'Cyprinidae',
      genus: 'Labeo',
      species: 'Labeo rohita',
      commonNames: 'Rohu'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cypriniformes',
      family: 'Cyprinidae',
      genus: 'Leptobarbus',
      species: 'Leptobarbus rubripinna',
      commonNames: 'Sultan Fish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cypriniformes',
      family: 'Cyprinidae',
      genus: 'Hypophthalmichthys',
      species: 'Hypophthalmichthys nobilis',
      commonNames: 'Bighead Carp'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cypriniformes',
      family: 'Cyprinidae',
      genus: 'Hypophthalmichthys',
      species: 'Hypophthalmichthys molitrix',
      commonNames: 'Silver Carp'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cypriniformes',
      family: 'Cyprinidae',
      genus: 'Cyclocheilichthys',
      species: 'Cyclocheilichthys apogon',
      commonNames: 'Beardless Barb, Chemperas'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cypriniformes',
      family: 'Cyprinidae',
      genus: 'Osteochilus',
      species: 'Osteochilus vittatus',
      commonNames: 'Bonylip Barb'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cypriniformes',
      family: 'Cyprinidae',
      genus: 'Tor',
      species: 'Tor tambra',
      commonNames: 'Tor tambra'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cypriniformes',
      family: 'Cyprinidae',
      genus: 'Tor',
      species: 'Tor tambroides',
      commonNames: 'Malayan Mahseer, Kelah, Empurau'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cypriniformes',
      family: 'Cyprinidae',
      genus: 'Rasbora',
      species: 'Rasbora elegans',
      commonNames: 'Twospot Rasbora'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cypriniformes',
      family: 'Cyprinidae',
      genus: 'Rasbora',
      species: 'Rasbora einthovenii',
      commonNames: 'Brilliant Rasbora, Einthoven’s Rasbora'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cypriniformes',
      family: 'Cyprinidae',
      genus: 'Rasbora',
      species: 'Rasbora trilineata',
      commonNames: 'Scissortail Rasbora'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cypriniformes',
      family: 'Cyprinidae',
      genus: 'Rasbora',
      species: 'Rasbora borapetensis',
      commonNames: 'Redtailed Rasbora'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cypriniformes',
      family: 'Cyprinidae',
      genus: 'Trigonostigma',
      species: 'Trigonostigma heteromorpha',
      commonNames: 'Harlequin Rasbora'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cypriniformes',
      family: 'Cyprinidae',
      genus: 'Trigonostigma',
      species: 'Trigonostigma heteromorpha',
      commonNames: 'Harlequin Rasbora'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cypriniformes',
      family: 'Cyprinidae',
      genus: 'Toxabramis',
      species: 'Toxabramis houdemeri',
      commonNames: 'Sharpbelly'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cypriniformes',
      family: 'Gyrinocheilidae',
      genus: 'Gyrinocheilus',
      species: 'Gyrinocheilus aymonieri',
      commonNames: 'Chinese Algae Eater'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cyprinodontiformes',
      family: 'Poeciliidae',
      genus: 'Gambusia',
      species: 'Gambusia affinis',
      commonNames: 'Mosquitofish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cyprinodontiformes',
      family: 'Poeciliidae',
      genus: 'Poecilia',
      species: 'Poecilia reticulata',
      commonNames: 'Guppy'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cyprinodontiformes',
      family: 'Poeciliidae',
      genus: 'Poecilia',
      species: 'Poecilia sphenops',
      commonNames: 'Common molly'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cyprinodontiformes',
      family: 'Poeciliidae',
      genus: 'Poecilia',
      species: 'Poecilia latipinna',
      commonNames: 'Sailfin Molly'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cyprinodontiformes',
      family: 'Poeciliidae',
      genus: 'Xiphophorus',
      species: '',
      commonNames: ''),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cyprinodontiformes',
      family: 'Poeciliidae',
      genus: 'Xiphophorus',
      species: 'Xiphophorus hellerii',
      commonNames: 'Swordtail'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cyprinodontiformes',
      family: 'Poeciliidae',
      genus: 'Xiphophorus',
      species: 'Xiphophorus maculatus',
      commonNames: 'Southern Platyfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cyprinodontiformes',
      family: 'Poeciliidae',
      genus: 'Xiphophorus',
      species: 'Xiphophorus variatus',
      commonNames: 'Variable Platyfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cyprinodontiformes',
      family: 'Aplocheilidae',
      genus: 'Aplocheilus',
      species: 'Aplocheilus armatus',
      commonNames: 'Blue Panchax, Whitespot'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cyprinodontiformes',
      family: 'Aplocheilidae',
      genus: 'Aplocheilus',
      species: 'Aplocheilus lineatus',
      commonNames: 'Striped Panchax, Golden Wonder Killifish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Characiformes',
      family: 'Characidae',
      genus: 'Hemigrammus',
      species: 'Hemigrammus rodwayi',
      commonNames: 'Golden Tetra'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Characiformes',
      family: 'Serrasalmidae',
      genus: 'Piaractus',
      species: 'Piaractus brachypomus',
      commonNames: 'Pacu'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Characiformes',
      family: 'Anostomidae',
      genus: 'Leporinus',
      species: 'Leporinus fasciatus',
      commonNames: 'Blackbanded Leporinus'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Siluriformes',
      family: 'Ariidae',
      genus: 'Arius',
      species: 'Arius cf. gagora',
      commonNames: 'Gagora Catfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Siluriformes',
      family: 'Ariidae',
      genus: 'Arius',
      species: 'Arius oetik',
      commonNames: 'Lowly Sea Catfish, Ah Seng'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Siluriformes',
      family: 'Ariidae',
      genus: 'Arius',
      species: 'Arius leptonotacanthus',
      commonNames: 'Arius leptonotacanthus'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Siluriformes',
      family: 'Ariidae',
      genus: 'Arius',
      species: 'Arius venosus',
      commonNames: 'Veined Sea Catfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Siluriformes',
      family: 'Ariidae',
      genus: 'Hemiarius',
      species: 'Hemiarius sona',
      commonNames: 'Sona Sea Catfish, Kim Chu Seng, Golden Jahan, Golden Duri'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Siluriformes',
      family: 'Ariidae',
      genus: 'Hexanematichthys ',
      species: 'Hexanematichthys sagor',
      commonNames: 'Sagor Catfish, Belukang, Duri'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Siluriformes',
      family: 'Ariidae',
      genus: 'Plicofollis',
      species: 'Plicofollis nella',
      commonNames: 'Shieldhead Catfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Siluriformes',
      family: 'Ariidae',
      genus: 'Plicofollis',
      species: 'Plicofollis argyropleuron',
      commonNames: 'Longsnouted Catfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Siluriformes',
      family: 'Ariidae',
      genus: 'Netuma',
      species: 'Netuma bilineata',
      commonNames: 'Bronze Catfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Siluriformes',
      family: 'Ariidae',
      genus: 'Netuma',
      species: 'Netuma thalassina',
      commonNames: 'Giant Salmon Catfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Siluriformes',
      family: 'Ariidae',
      genus: 'Osteogeneiosus ',
      species: 'Osteogeneiosus militaris',
      commonNames: 'Soldier Catfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Siluriformes',
      family: 'Plotosidae',
      genus: 'Paraplotosus',
      species: 'Paraplotosus albilabris',
      commonNames: 'Whitelipped Eeltail Catfish, Torsat'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Siluriformes',
      family: 'Plotosidae',
      genus: 'Plotosus',
      species: 'Plotosus canius',
      commonNames: 'Black Eeltail Catfish, Torsat'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Siluriformes',
      family: 'Plotosidae',
      genus: 'Plotosus',
      species: 'Plotosus lineatus',
      commonNames: 'Striped Eeltail Catfish, Torsat'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Siluriformes',
      family: 'Clariidae',
      genus: 'Clarias',
      species: 'Clarias gariepinus',
      commonNames: 'African Walking Catfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Siluriformes',
      family: 'Clariidae',
      genus: 'Clarias',
      species: 'Clarias aff. batrachus',
      commonNames: 'Common Walking Catfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Siluriformes',
      family: 'Clariidae',
      genus: 'Clarias',
      species: 'Clarias leiacanthus',
      commonNames: 'Forest Walking Catfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Siluriformes',
      family: 'Clariidae',
      genus: 'Clarias',
      species: 'Clarias nieuhofii',
      commonNames: 'Slender Walking Catfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Siluriformes',
      family: 'Clariidae',
      genus: 'Clarias',
      species: 'Clarias macrocephalus',
      commonNames: 'Broadhead Walking Catfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Siluriformes',
      family: 'Bagridae',
      genus: 'Hemibagrus',
      species: 'Hemibagrus capitulum',
      commonNames: 'Malayan River Catfish, Pak Su Kong, Baung'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Siluriformes',
      family: 'Bagridae',
      genus: 'Hemibagrus',
      species: 'Hemibagrus wyckioides',
      commonNames: 'Asian Redtailed Catfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Siluriformes',
      family: 'Bagridae',
      genus: 'Mystus',
      species: 'Mystus wolffii',
      commonNames: 'Baung'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Siluriformes',
      family: 'Bagridae',
      genus: 'Mystus',
      species: 'Mystus gulio',
      commonNames: 'Estuarine Catfish, Baung'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Siluriformes',
      family: 'Bagridae',
      genus: 'Mystus',
      species: 'Mystus castaneus',
      commonNames: 'Mystus castaneus'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Siluriformes',
      family: 'Claroteidae',
      genus: 'Chrysichthys',
      species: 'Chrysichthys auratus',
      commonNames: 'Nile Golden Catfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Siluriformes',
      family: 'Loricariidae ',
      genus: 'Pterygoplichthys',
      species: 'Pterygoplichthys disjunctivus',
      commonNames: 'Pterygoplichthys disjunctivus'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Siluriformes',
      family: 'Loricariidae ',
      genus: 'Pterygoplichthys',
      species: 'Pterygoplichthys multiradiatus',
      commonNames: 'Orinoco Sailfin Catfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Siluriformes',
      family: 'Loricariidae ',
      genus: 'Pterygoplichthys',
      species: 'Pterygoplichthys pardalis',
      commonNames: 'Amazon Sailfin Catfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Siluriformes',
      family: 'Loricariidae ',
      genus: 'Pterygoplichthys',
      species: 'Pterygoplichthys joselimaianus',
      commonNames: 'Goldspotted Pleco'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Siluriformes',
      family: 'Mochokidae',
      genus: 'Synodontis',
      species: 'Synodontis eupterus',
      commonNames: 'Featherfin Squeaker'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Siluriformes',
      family: 'Pangasiidae',
      genus: 'Pangasianodon',
      species: 'Pangasianodon hypophthalmus',
      commonNames: 'Patin'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Siluriformes',
      family: 'Pangasiidae',
      genus: 'Pangasius',
      species: 'Pangasius sanitwongsei',
      commonNames: 'Chao Phraya Catfish (CPC), Giant Pangasius, Paroon Shark'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Siluriformes',
      family: 'Pimelodidae',
      genus: 'Phractocephalus',
      species: 'Phractocephalus hemioliopterus',
      commonNames: 'Redtailed Catfish (RTC)'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Anabantiformes',
      family: 'Anabantidae',
      genus: 'Anabas',
      species: 'Anabas testudineus',
      commonNames: 'Asian Climbing Perch'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Anabantiformes',
      family: 'Osphronemidae',
      genus: 'Betta',
      species: 'Betta pugnax',
      commonNames: 'Forest Betta'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Anabantiformes',
      family: 'Osphronemidae',
      genus: 'Betta',
      species: 'Betta splendens',
      commonNames: 'Siamese Betta'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Anabantiformes',
      family: 'Osphronemidae',
      genus: 'Osphronemus',
      species: 'Osphronemus goramy',
      commonNames: 'Giant Gourami, Kaloi'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Anabantiformes',
      family: 'Osphronemidae',
      genus: 'Trichopodus',
      species: 'Trichopodus trichopterus',
      commonNames: 'Threespot Gourami'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Anabantiformes',
      family: 'Osphronemidae',
      genus: 'Trichopsis',
      species: 'Trichopsis vittata',
      commonNames: 'Croaking Gourami'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Anabantiformes',
      family: 'Osphronemidae',
      genus: 'Trichopsis',
      species: 'Trichopsis schalleri',
      commonNames: 'Sparkling Gourami'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Anabantiformes',
      family: 'Channidae',
      genus: 'Channa',
      species: 'Channa lucius',
      commonNames: 'Forest Snakehead'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Anabantiformes',
      family: 'Channidae',
      genus: 'Channa',
      species: 'Channa striata',
      commonNames: 'Common Snakehead, Haruan'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Anabantiformes',
      family: 'Channidae',
      genus: 'Channa',
      species: 'Channa micropeltes',
      commonNames: 'Giant Snakehead, Toman'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Anabantiformes',
      family: 'Channidae',
      genus: 'Channa',
      species: 'Channa limbata',
      commonNames: 'Dwarf Snakehead'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Anabantiformes',
      family: 'Channidae',
      genus: 'Channa',
      species: 'Channa marulius',
      commonNames: 'Bullseye Snakehead'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Anabantiformes',
      family: 'Channidae',
      genus: 'Channa',
      species: 'Channa pleurophthalma',
      commonNames: 'Ocellated Snakehead'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Anabantiformes',
      family: 'Channidae',
      genus: 'Channa',
      species: 'Channa melasoma',
      commonNames: 'Black Snakehead'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cichliformes',
      family: 'Cichlidae',
      genus: 'Cichla',
      species: 'Cichla monoculus',
      commonNames: 'Monoculus Peacock Bass (Mono)'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cichliformes',
      family: 'Cichlidae',
      genus: 'Cichla',
      species: 'Cichla ocellaris',
      commonNames: 'Butterfly Peacock Bass (Mono)'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cichliformes',
      family: 'Cichlidae',
      genus: 'Cichla',
      species: 'Cichla kelberi',
      commonNames: 'Kelberi Peacock Bass, Spider Peacock Bass'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cichliformes',
      family: 'Cichlidae',
      genus: 'Cichla',
      species: 'Cichla temensis',
      commonNames: 'Temensis Peacock Bass'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cichliformes',
      family: 'Cichlidae',
      genus: 'Cichla',
      species: 'Cichla piquiti',
      commonNames: 'Azul Peacock Bass'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cichliformes',
      family: 'Cichlidae',
      genus: 'Cichla',
      species: 'Cichla orinocensis',
      commonNames: 'Orino Peacock Bass'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cichliformes',
      family: 'Cichlidae',
      genus: 'Cichla',
      species: 'Cichla intermedia',
      commonNames: 'Cichla intermedia'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cichliformes',
      family: 'Cichlidae',
      genus: 'Amphilophus',
      species: 'Amphilophus trimaculatus',
      commonNames: 'Trimac Cichlid'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cichliformes',
      family: 'Cichlidae',
      genus: 'Amphilophus',
      species: 'Amphilophus citrinellus',
      commonNames: 'Midas Cichlid'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cichliformes',
      family: 'Cichlidae',
      genus: 'Amphilophus',
      species: 'Amphilophus labiatus',
      commonNames: 'Red Devil Cichlid'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cichliformes',
      family: 'Cichlidae',
      genus: 'Mayaheros',
      species: 'Mayaheros urophthalmus',
      commonNames: 'Mayan Cichlid'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cichliformes',
      family: 'Cichlidae',
      genus: 'Vieja',
      species: 'Vieja melanura',
      commonNames: 'Redhead Cichlid'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cichliformes',
      family: 'Cichlidae',
      genus: 'Oreochromis',
      species: 'Oreochromis mossambicus',
      commonNames: 'Mozambique Tilapia'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cichliformes',
      family: 'Cichlidae',
      genus: 'Oreochromis',
      species: 'Oreochromis niloticus',
      commonNames: 'Nile Tilapia'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cichliformes',
      family: 'Cichlidae',
      genus: 'Oreochromis',
      species: 'Oreochromis aureus',
      commonNames: 'Blue Tilapia'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cichliformes',
      family: 'Cichlidae',
      genus: 'Heterotilapia',
      species: 'Heterotilapia buttikoferi',
      commonNames: 'Zebra Tilapia'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cichliformes',
      family: 'Cichlidae',
      genus: 'Herichthys',
      species: 'Herichthys carpintis',
      commonNames: 'Herichthys carpintis'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cichliformes',
      family: 'Cichlidae',
      genus: 'Parachromis',
      species: 'Parachromis managuensis',
      commonNames: 'Jaguar Cichlid'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cichliformes',
      family: 'Cichlidae',
      genus: 'Acarichthys',
      species: 'Acarichthys heckelli',
      commonNames: 'Threadfin Acara'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cichliformes',
      family: 'Cichlidae',
      genus: 'Geophagus',
      species: 'Geophagus altifrons',
      commonNames: 'Red-lined Eartheater'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cichliformes',
      family: 'Cichlidae',
      genus: 'Satanoperca',
      species: 'Satanoperca jurupari',
      commonNames: 'Demon Eartheater'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cichliformes',
      family: 'Cichlidae',
      genus: 'Etroplus',
      species: 'Etroplus suratensis',
      commonNames: 'Green Chromide'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Cichliformes',
      family: 'Cichlidae',
      genus: 'Uaru',
      species: 'Uaru amphiacanthoides',
      commonNames: 'Uaru Cichlid'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Aulopiformes',
      family: 'Synodontidae',
      genus: 'Saurida',
      species: 'Saurida tumbil',
      commonNames: 'Greater Lizardfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Aulopiformes',
      family: 'Synodontidae',
      genus: 'Saurida',
      species: 'Saurida micropectoralis',
      commonNames: 'Shortfin Lizardfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Aulopiformes',
      family: 'Synodontidae',
      genus: 'Saurida',
      species: 'Saurida undosquamis',
      commonNames: 'Saurida undosquamis'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Holocentriformes',
      family: 'Holocentridae',
      genus: 'Sargocentron',
      species: 'Sargocentron rubrum',
      commonNames: 'Redcoat Squirrelfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Holocentriformes',
      family: 'Holocentridae',
      genus: 'Myripristis',
      species: 'Myripristis hexagona',
      commonNames: 'Doubletooth Soldierfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Ophidiiformes',
      family: 'Blythitidae',
      genus: 'Dinematichthys',
      species: 'Dinematichthys iluocoeteoides',
      commonNames: 'Yellow Cuskeel'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Ophidiiformes',
      family: 'Blythitidae',
      genus: 'Alionematichthys',
      species: 'Alionematichthys riukiuensis',
      commonNames: 'Bigeye Cuskeel'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Ophidiiformes',
      family: 'Blythitidae',
      genus: 'Ungusurculus',
      species: 'Ungusurculus riauensis',
      commonNames: 'Riau Viviparous Brotula'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Batrachoidiformes',
      family: 'Batrachoididae',
      genus: 'Batrachomoeus',
      species: 'Batrachomoeus trispinosus',
      commonNames: 'Threespined Toadfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Batrachoidiformes',
      family: 'Batrachoididae',
      genus: 'Allenbatrachus',
      species: 'Allenbatrachus reticulatus',
      commonNames: ''),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Kurtiformes',
      family: 'Apogonidae',
      genus: 'Apogon',
      species: 'Apogon crassiceps',
      commonNames: 'Ruby Cardinalfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Kurtiformes',
      family: 'Apogonidae',
      genus: 'Apogon',
      species: 'Apogon talboti',
      commonNames: 'Flame Cardinalfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Kurtiformes',
      family: 'Apogonidae',
      genus: 'Apogonichthyoides',
      species: 'Apogonichthyoides melas',
      commonNames: 'Black cardinalfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Kurtiformes',
      family: 'Apogonidae',
      genus: 'Apogonichthyoides',
      species: 'Apogonichthyoides timorensis',
      commonNames: 'Timor cardinalfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Kurtiformes',
      family: 'Apogonidae',
      genus: 'Apogonichthyoides',
      species: 'Apogonichthyoides niger',
      commonNames: 'Blackfin cardinalfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Kurtiformes',
      family: 'Apogonidae',
      genus: 'Archamia',
      species: 'Archamia bleekeri',
      commonNames: 'Gon’s Cardinalfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Kurtiformes',
      family: 'Apogonidae',
      genus: 'Cheilodipterus',
      species: 'Cheilodipterus artus',
      commonNames: 'Wolf Cardinalfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Kurtiformes',
      family: 'Apogonidae',
      genus: 'Cheilodipterus',
      species: 'Cheilodipterus macrodon',
      commonNames: 'Tiger Cardinalfish, Largetooth Cardinalfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Kurtiformes',
      family: 'Apogonidae',
      genus: 'Cheilodipterus',
      species: 'Cheilodipterus quinquelineatus',
      commonNames: 'Fivelined Cardinalfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Kurtiformes',
      family: 'Apogonidae',
      genus: 'Cheilodipterus',
      species: 'Cheilodipterus singapurensis',
      commonNames: 'Truncate Cardinalfish, Singapore Cardinalfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Kurtiformes',
      family: 'Apogonidae',
      genus: 'Fowleria',
      species: 'Fowleria aurita',
      commonNames: 'Crosseyed Cardinalfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Kurtiformes',
      family: 'Apogonidae',
      genus: 'Fowleria',
      species: 'Fowleria variegata',
      commonNames: 'Variegated Cardinalfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Kurtiformes',
      family: 'Apogonidae',
      genus: 'Fibramia',
      species: 'Fibramia amboinensis',
      commonNames: 'Ambon Cardinalfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Kurtiformes',
      family: 'Apogonidae',
      genus: 'Fibramia',
      species: 'Fibramia lateralis',
      commonNames: 'Humpbacked Cardinalfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Kurtiformes',
      family: 'Apogonidae',
      genus: 'Fibramia',
      species: 'Fibramia thermalis',
      commonNames: 'Masked Cardinalfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Kurtiformes',
      family: 'Apogonidae',
      genus: 'Jaydia',
      species: 'Jaydia truncata',
      commonNames: 'Flat-tail Cardinalfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Kurtiformes',
      family: 'Apogonidae',
      genus: 'Jaydia',
      species: 'Jaydia lineata',
      commonNames: 'Tenlined Cardinalfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Kurtiformes',
      family: 'Apogonidae',
      genus: 'Lepidamia',
      species: 'Lepidamia kalosoma',
      commonNames: 'Pinstriped Cardinalfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Kurtiformes',
      family: 'Apogonidae',
      genus: 'Nectamia',
      species: 'Nectamia savayensis',
      commonNames: 'Samoan Cardinalfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Kurtiformes',
      family: 'Apogonidae',
      genus: 'Nectamia',
      species: 'Nectamia similis',
      commonNames: 'Similar Cardinalfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Kurtiformes',
      family: 'Apogonidae',
      genus: 'Ostorhinchus',
      species: 'Ostorhinchus endekataenia',
      commonNames: 'Candystriped Cardinalfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Kurtiformes',
      family: 'Apogonidae',
      genus: 'Ostorhinchus',
      species: 'Ostorhinchus cookii',
      commonNames: 'Cook’s Cardinalfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Kurtiformes',
      family: 'Apogonidae',
      genus: 'Ostorhinchus',
      species: 'Ostorhinchus taeniophorus',
      commonNames: 'Reef-flat Cardinalfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Kurtiformes',
      family: 'Apogonidae',
      genus: 'Ostorhinchus',
      species: 'Ostorhinchus cavitensis',
      commonNames: 'Cavite Cardinalfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Kurtiformes',
      family: 'Apogonidae',
      genus: 'Ostorhinchus',
      species: 'Ostorhinchus wassinki',
      commonNames: 'Wassink’s Cardinalfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Kurtiformes',
      family: 'Apogonidae',
      genus: 'Ostorhinchus',
      species: 'Ostorhinchus cyanosoma',
      commonNames: 'Yellowstriped Cardinalfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Kurtiformes',
      family: 'Apogonidae',
      genus: 'Ostorhinchus',
      species: 'Ostorhinchus fleurieu',
      commonNames: 'Flower Cardinalfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Kurtiformes',
      family: 'Apogonidae',
      genus: 'Ostorhinchus',
      species: 'Ostorhinchus compressus',
      commonNames: 'Ochre-striped Cardinalfish, Blue-eyed Cardinalfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Kurtiformes',
      family: 'Apogonidae',
      genus: 'Ostorhinchus',
      species: 'Ostorhinchus pleuron',
      commonNames: 'Rib-barred Cardinalfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Kurtiformes',
      family: 'Apogonidae',
      genus: 'Ostorhinchus',
      species: 'Ostorhinchus fasciatus',
      commonNames: 'Australian Banded Cardinalfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Kurtiformes',
      family: 'Apogonidae',
      genus: 'Ostorhinchus',
      species: 'Ostorhinchus moluccensis',
      commonNames: 'Moluccan Cardinalfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Kurtiformes',
      family: 'Apogonidae',
      genus: 'Ostorhinchus',
      species: 'Ostorhinchus margaritophorus',
      commonNames: 'Checkered Cardinalfish, Margarita Cardinalfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Kurtiformes',
      family: 'Apogonidae',
      genus: 'Ostorhinchus',
      species: 'Ostorhinchus nanus',
      commonNames: 'Tiny Cardinalfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Kurtiformes',
      family: 'Apogonidae',
      genus: 'Pristicon',
      species: 'Pristicon rhodopterus',
      commonNames: 'Redfin Cardinalfish, False Threespot Cardinalfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Kurtiformes',
      family: 'Apogonidae',
      genus: 'Pristicon',
      species: 'Pristicon trimaculatus',
      commonNames: 'Threespot Cardinalfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Kurtiformes',
      family: 'Apogonidae',
      genus: 'Pristiapogon',
      species: 'Pristiapogon fraenatus',
      commonNames: 'Bridled Cardinalfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Kurtiformes',
      family: 'Apogonidae',
      genus: 'Pseudamia',
      species: 'Pseudamia amblyuroptera',
      commonNames: 'Whitejawed Cardinalfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Kurtiformes',
      family: 'Apogonidae',
      genus: 'Rhabdamia',
      species: 'Rhabdamia gracilis',
      commonNames: 'Slender Cardinalfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Kurtiformes',
      family: 'Apogonidae',
      genus: 'Sphaeramia',
      species: 'Sphaeramia orbicularis',
      commonNames: 'Orbicular Cardinalfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Kurtiformes',
      family: 'Apogonidae',
      genus: 'Sphaeramia',
      species: 'Sphaeramia nematoptera',
      commonNames: 'Pyjama Cardinalfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Kurtiformes',
      family: 'Apogonidae',
      genus: 'Siphamia ',
      species: 'Siphamia tubifer',
      commonNames: 'Urchin Cardinalfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Kurtiformes',
      family: 'Apogonidae',
      genus: 'Taeniamia',
      species: 'Taeniamia fucata',
      commonNames: 'Painted Cardinalfish, Orangelined Cardinalfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Kurtiformes',
      family: 'Apogonidae',
      genus: 'Taeniamia',
      species: 'Taeniamia macroptera',
      commonNames: 'Duskytail Cardinalfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Kurtiformes',
      family: 'Apogonidae',
      genus: 'Yarica',
      species: 'Yarica hyalosoma',
      commonNames: 'Mangrove Cardinalfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Eleotridae',
      genus: 'Oxyeleotris',
      species: 'Oxyeleotris marmorata',
      commonNames: 'Marbled Gudgeon, Soon Hock, Marbled Goby'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Eleotridae',
      genus: 'Oxyeleotris',
      species: 'Oxyeleotris urophthalmus',
      commonNames: 'Oxyeleotris urophthalmus'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Eleotridae',
      genus: 'Ophiocara',
      species: 'Ophiocara cantoris',
      commonNames: 'Spangled Gudgeon'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Eleotridae',
      genus: 'Butis',
      species: 'Butis koilomatodon',
      commonNames: 'Mudsleeper'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Eleotridae',
      genus: 'Butis',
      species: 'Butis humeralis',
      commonNames: 'Olive Flathead Gudgeon'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Eleotridae',
      genus: 'Butis',
      species: 'Butis butis',
      commonNames: 'Crazy Fish, Duckbill Sleeper, Crimsontip Gudgeon'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Rhinogobius',
      species: 'Rhinogobius similis',
      commonNames: 'Barcheek River Goby'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Pseudogobiopsis',
      species: 'Pseudogobiopsis oligactis',
      commonNames: 'Bigmouth Stream Goby'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Trypauchen',
      species: 'Trypauchen vagina',
      commonNames: 'Pink Mud Goby'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Pandaka',
      species: 'Pandaka rouxi',
      commonNames: 'Pandaka rouxi'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Pseudapocryptes',
      species: 'Pseudapocryptes elongatus',
      commonNames: 'Elongate Mudskipper'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Periophthalmus',
      species: 'Periophthalmus variabilis',
      commonNames: 'Duskygilled Mudskipper'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Periophthalmus',
      species: 'Periophthalmus walailakae',
      commonNames: 'Yellowspotted Mudskipper'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Periophthalmus',
      species: 'Periophthalmus chrysospilos',
      commonNames: 'Goldspotted Mudskipper'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Periophthalmus',
      species: 'Periophthalmus argentilineatus',
      commonNames: 'Silverlined Mudskipper'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Periophthalmus',
      species: 'Periophthalmus gracilis',
      commonNames: 'Slender Mudskipper'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Periophthalmodon',
      species: 'Periophthalmodon schlosseri',
      commonNames: 'Giant Mudskipper'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Boleophthalmus',
      species: 'Boleophthalmus boddarti',
      commonNames: 'Bluespotted Mudskipper'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Scartelaos',
      species: 'Scartelaos histophorus',
      commonNames: 'Bearded Mudskipper'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Brachygobius',
      species: 'Brachygobius kabiliensis',
      commonNames: 'Kabili Bumblebee Goby, Mangrove Bumblebee Goby'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Brachygobius',
      species: 'Brachygobius sabanus',
      commonNames: 'Lesser Bumblebee Goby, Sabanus Bumblebee Goby'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Eugnathogobius',
      species: 'Eugnathogobius illotus',
      commonNames: 'Eugnathogobius illotus'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Eugnathogobius',
      species: 'Eugnathogobius siamensis',
      commonNames: 'Eugnathogobius siamensis'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Eugnathogobius',
      species: 'Eugnathogobius variegatus',
      commonNames: 'Eugnathogobius variegatus'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Eugnathogobius',
      species: 'Eugnathogobius polylepis',
      commonNames: 'Lipstick Goby'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Hemigobius',
      species: 'Hemigobius hoevenii',
      commonNames: 'Banded Mulletgoby'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Hemigobius',
      species: 'Hemigobius mingi',
      commonNames: 'Hemigobius mingi'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Mugilogobius',
      species: 'Mugilogobius mertoni',
      commonNames: 'Mugilogobius mertoni'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Mugilogobius',
      species: 'Mugilogobius fasciatus',
      commonNames: 'Mugilogobius fasciatus'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Mugilogobius',
      species: 'Mugilogobius tigrinus',
      commonNames: 'Mugilogobius tigrinus'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Mugilogobius',
      species: 'Mugilogobius rambaiae',
      commonNames: 'Queen of Siam Goby'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Mugilogobius',
      species: 'Mugilogobius chulae',
      commonNames: 'Mugilogobius chulae'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Pseudogobius',
      species: 'Pseudogobius avicennia',
      commonNames: 'Pseudogobius avicennia'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Pseudogobius',
      species: 'Pseudogobius melanostictus',
      commonNames: 'Pseudogobius melanostictus'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Pseudogobius',
      species: 'Pseudogobius poicilosoma',
      commonNames: 'Pseudogobius poicilosoma'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Redigobius',
      species: 'Redigobius bikolanus',
      commonNames: 'Redigobius bikolanus'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Drombus',
      species: 'Drombus triangularis',
      commonNames: 'Brown Shore Goby'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Drombus',
      species: 'Drombus globiceps',
      commonNames: 'Drombus globiceps'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Drombus',
      species: 'Drombus ocyurus',
      commonNames: 'Drombus ocyurus'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Acentrogobius',
      species: 'Acentrogobius viridipunctatus',
      commonNames: 'Greenspotted Mangrove Goby'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Acentrogobius',
      species: 'Acentrogobius janthinopterus',
      commonNames: 'Robust Mangrove Goby'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Acentrogobius',
      species: 'Acentrogobius caninus',
      commonNames: 'Green-shouldered Mangrove Goby'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Acentrogobius',
      species: 'Acentrogobius madraspatensis',
      commonNames: 'Acentrogobius madraspatensis'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Acentrogobius',
      species: 'Acentrogobius cyanomos',
      commonNames: 'Acentrogobius cyanomos'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Acentrogobius',
      species: 'Acentrogobius virgatulus',
      commonNames: 'Acentrogobius virgatulus'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Yongeichthys',
      species: 'Yongeichthys nebulosus',
      commonNames: 'Shadow Goby'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Stigmatogobius',
      species: 'Stigmatogobius sadanundio',
      commonNames: 'Grey Knight Goby'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Stigmatogobius',
      species: 'Stigmatogobius pleurostigma',
      commonNames: 'Stigmatogobius pleurostigma'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Istigobius',
      species: 'Istigobius goldmanni',
      commonNames: 'Goldmann’s Lagoon Goby'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Istigobius',
      species: 'Istigobius ornatus',
      commonNames: 'Ornate Lagoon Goby'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Istigobius',
      species: 'Istigobius diadema',
      commonNames: 'Spectacled Lagoon Goby'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Istigobius',
      species: 'Istigobius decoratus',
      commonNames: 'Decorated Lagoon Goby'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Bathygobius',
      species: 'Bathygobius fuscus',
      commonNames: 'Dusky Frillgoby'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Bathygobius',
      species: 'Bathygobius meggitti',
      commonNames: 'Meggit’s Frillgoby'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Glossogobius',
      species: 'Glossogobius aureus',
      commonNames: 'Golden Flathead Goby'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Glossogobius',
      species: 'Glossogobius giuris',
      commonNames: 'Tank Goby'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Glossogobius',
      species: 'Glossogobius circumspectus',
      commonNames: 'Glossogobius circumspectus'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Glossogobius',
      species: 'Glossogobius sparsipapillus',
      commonNames: 'Glossogobius sparsipapillus'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Favonigobius',
      species: 'Favonigobius opalescens',
      commonNames: 'Opalescent Sand Goby'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Favonigobius',
      species: 'Favonigobius melanobranchus',
      commonNames: 'Blackthroat Sand Goby'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Favonigobius',
      species: 'Favonigobius reichei',
      commonNames: 'Indo-Pacific Tropical Sand Goby'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Silhouettea',
      species: 'Silhouettea nuchipunctata',
      commonNames: 'Silhouettea nuchipunctata'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Amoya',
      species: 'Amoya gracilis',
      commonNames: 'Amoya gracilis'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Amoya',
      species: 'Amoya moloanus',
      commonNames: 'Amoya moloanus'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Arcygobius',
      species: 'Arcygobius baliurus',
      commonNames: 'Arcygobius baliurus'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Myersina',
      species: 'Myersina crocata',
      commonNames: 'Yellowspotted Shrimpgoby'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Myersina',
      species: 'Myersina nigrivirgata',
      commonNames: 'Blacklined Shrimpgoby'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Myersina',
      species: 'Myersina adonis',
      commonNames: 'Myersina adonis'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Myersina',
      species: 'Myersina filifer',
      commonNames: 'Myersina filifer'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Mahidolia',
      species: 'Mahidolia mystacina',
      commonNames: 'Smiling Shrimpgoby, Flagfin Shrimpgoby'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Amblyeleotris',
      species: 'Amblyeleotris gymnocephala',
      commonNames: 'Masked Shrimpgoby'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Amblyeleotris',
      species: 'Amblyeleotris fontanesii',
      commonNames: 'Giant Shrimpgoby'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Amblyeleotris',
      species: 'Amblyeleotris periophthalma',
      commonNames: 'Amblyeleotris periophthalma'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Cryptocentroides',
      species: 'Cryptocentroides insignis',
      commonNames: 'Insignia Shrimpgoby'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Cryptocentrus',
      species: 'Cryptocentrus inexplicatus',
      commonNames: 'Inexplicable Shrimpgoby'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Cryptocentrus',
      species: 'Cryptocentrus cyanotaenia',
      commonNames: 'Lagoon Shrimpgoby'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Cryptocentrus',
      species: 'Cryptocentrus pavoninoides',
      commonNames: 'Bluespotted Watchman Goby, Peacock Shrimpgoby'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Cryptocentrus',
      species: 'Cryptocentrus melanopus',
      commonNames: 'Pinkspotted Shrimpgoby, Singapore Shrimpgoby'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Cryptocentrus',
      species: 'Cryptocentrus leptocephalus',
      commonNames: 'Pinkspotted Shrimpgoby'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Cryptocentrus',
      species: 'Cryptocentrus caeruleomaculatus',
      commonNames: 'Bluespeckled Shrimpgoby'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Cryptocentrus',
      species: 'Cryptocentrus cyanospilotus',
      commonNames: 'Cryptocentrus cyanospilotus'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Cryptocentrus',
      species: 'Cryptocentrus strigilliceps',
      commonNames: 'Target Shrimpgoby'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Cryptocentrus',
      species: 'Cryptocentrus sericus',
      commonNames: 'Ventral-barred Shrimpgoby'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Cryptocentrus',
      species: 'Cryptocentrus maudae',
      commonNames: 'Saddled Shrimpgoby, Maude’s Shrimpgoby'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Cryptocentrus',
      species: 'Cryptocentrus cinctus',
      commonNames: 'Yellow Watchman Goby'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Amblygobius',
      species: 'Amblygobius stethophthalmus',
      commonNames: 'Head-stripe Goby'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Amblygobius',
      species: 'Amblygobius phalaena',
      commonNames: 'Amblygobius phalaena'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Amblygobius',
      species: 'Amblygobius buanensis',
      commonNames: 'Buan Goby'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Valenciennea',
      species: 'Valenciennea puellaris',
      commonNames: 'Diamond Watchman Goby'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Valenciennea',
      species: 'Valenciennea muralis',
      commonNames: 'Mural Goby'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Gobiodon',
      species: 'Gobiodon histrio',
      commonNames: 'Broadbarred Acropora Goby'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Macrodontogobius',
      species: 'Macrodontogobius wilburi',
      commonNames: 'Macrodontogobius wilburi'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Oplopomus',
      species: 'Oplopomus oplopomus',
      commonNames: 'Oplopomus oplopomus'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Oplopomus',
      species: 'Oplopomus caninoides',
      commonNames: 'Oplopomus caninoides'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Gobiiformes',
      family: 'Gobiidae',
      genus: 'Psammogobius',
      species: 'Psammogobius biocellatus',
      commonNames: 'Sleepy Goby'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Syngnathiformes',
      family: 'Aulostomidae',
      genus: 'Aulostomus',
      species: 'Aulostomus chinensis',
      commonNames: 'Chinese Trumpetfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Syngnathiformes',
      family: 'Fistulariidae',
      genus: 'Fistularia',
      species: 'Fistularia commersonnii',
      commonNames: 'Bluespotted Cornetfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Syngnathiformes',
      family: 'Syngnathidae',
      genus: 'Ichthyocampus',
      species: 'Ichthyocampus carce',
      commonNames: 'Mangrove Pipefish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Syngnathiformes',
      family: 'Syngnathidae',
      genus: 'Hippocampus',
      species: 'Hippocampus kuda',
      commonNames: 'Estuarine Seahorse'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Syngnathiformes',
      family: 'Syngnathidae',
      genus: 'Hippocampus',
      species: 'Hippocampus comes',
      commonNames: 'Tigertail Seahorse'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Scombriformes',
      family: 'Scombridae',
      genus: 'Scomberomorus',
      species: 'Scomberomorus lineolatus',
      commonNames: 'Streaked Spanish Mackerel'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Scombriformes',
      family: 'Scombridae',
      genus: 'Scomberomorus',
      species: 'Scomberomorus commerson',
      commonNames: 'Narrowbarred Spanish Mackerel, Tenggiri Batang'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Scombriformes',
      family: 'Scombridae',
      genus: 'Scomberomorus',
      species: 'Scomberomorus guttatus',
      commonNames:
          'Spotted Spanish Mackerel, Indo-Pacific King Mackerel, Tenggiri Papan'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Scombriformes',
      family: 'Scombridae',
      genus: 'Scomberomorus',
      species: 'Scomberomorus koreanus',
      commonNames: 'Korean Seerfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Scombriformes',
      family: 'Scombridae',
      genus: 'Rastrelliger',
      species: 'Rastrelliger kanagurta',
      commonNames: 'Indian Mackerel, Kembong'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Scombriformes',
      family: 'Scombridae',
      genus: 'Rastrelliger',
      species: 'Rastrelliger brachysoma',
      commonNames: 'Short Mackerel'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Scombriformes',
      family: 'Scombridae',
      genus: 'Euthynnus',
      species: 'Euthynnus affinis',
      commonNames: 'Mackerel Tuna, Tongkol'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Istiophoriformes',
      family: 'Sphyraenidae',
      genus: 'Sphyraena',
      species: 'Sphyraena barracuda',
      commonNames: 'Great Barracuda'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Istiophoriformes',
      family: 'Sphyraenidae',
      genus: 'Sphyraena',
      species: 'Sphyraena jello',
      commonNames: 'Pickhandle Barracuda'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Istiophoriformes',
      family: 'Sphyraenidae',
      genus: 'Sphyraena',
      species: 'Sphyraena putnamae',
      commonNames: 'Sawtooth Barracuda'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Istiophoriformes',
      family: 'Sphyraenidae',
      genus: 'Sphyraena',
      species: 'Sphyraena flavicauda',
      commonNames: 'Yellowtail Barracuda, Kacang'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Istiophoriformes',
      family: 'Istiophoridae',
      genus: 'Istiophorus',
      species: 'Istiophorus platypterus',
      commonNames: 'Sailfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Istiophoriformes',
      family: 'Istiophoridae',
      genus: 'Istiompax',
      species: 'Istiompax indica',
      commonNames: 'Black Marlin'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Carangiformes',
      family: 'Menidae',
      genus: 'Mene',
      species: 'Mene maculata',
      commonNames: 'Moonfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Carangiformes',
      family: 'Rachycentridae',
      genus: 'Rachycentron',
      species: 'Rachycentron canadum',
      commonNames: 'Cobia'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Carangiformes',
      family: 'Coryphaenidae',
      genus: 'Coryphaena',
      species: 'Coryphaena hippurus',
      commonNames: 'Mahi Mahi, Dorado, Dolphinfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Carangiformes',
      family: 'Echeneidae',
      genus: 'Echeneis',
      species: 'Echeneis naucrates',
      commonNames: 'Slender Sharksucker, Remora, Live Sharksucker'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Carangiformes',
      family: 'Carangidae',
      genus: 'Trachinotus',
      species: 'Trachinotus blochii',
      commonNames: 'Snubnose Pompano, Golden Pomfret'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Carangiformes',
      family: 'Carangidae',
      genus: 'Trachinotus',
      species: 'Trachinotus baillonii',
      commonNames: 'Smallspotted Dart'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Carangiformes',
      family: 'Carangidae',
      genus: 'Scomberoides',
      species: 'Scomberoides commersonnianus',
      commonNames: 'Talang Queenfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Carangiformes',
      family: 'Carangidae',
      genus: 'Scomberoides',
      species: 'Scomberoides lysan',
      commonNames: 'Doublespotted Queenfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Carangiformes',
      family: 'Carangidae',
      genus: 'Scomberoides',
      species: 'Scomberoides pelagicus',
      commonNames: 'Deepbodied Queenfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Carangiformes',
      family: 'Carangidae',
      genus: 'Scomberoides',
      species: 'Scomberoides tol',
      commonNames: 'Needlescale Queenfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Carangiformes',
      family: 'Carangidae',
      genus: 'Scomberoides',
      species: 'Scomberoides Tala',
      commonNames: 'Barred Queenfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Carangiformes',
      family: 'Carangidae',
      genus: 'Alepes',
      species: 'Alepes melanoptera',
      commonNames: 'Blackfin Scad'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Carangiformes',
      family: 'Carangidae',
      genus: 'Alepes',
      species: 'Alepes vari',
      commonNames: 'Herring Scad, Papan'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Carangiformes',
      family: 'Carangidae',
      genus: 'Alepes',
      species: 'Alepes djedaba',
      commonNames: 'Shrimp Scad'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Carangiformes',
      family: 'Carangidae',
      genus: 'Alepes',
      species: 'Alepes kleinii',
      commonNames: 'Razorbelly Scad'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Carangiformes',
      family: 'Carangidae',
      genus: 'Platycaranx',
      species: 'Platycaranx chrysophrys',
      commonNames: 'Longnose Trevally'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Carangiformes',
      family: 'Carangidae',
      genus: 'Platycaranx',
      species: 'Platycaranx talamparoides',
      commonNames: 'Imposter Trevally'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Carangiformes',
      family: 'Carangidae',
      genus: 'Platycaranx',
      species: 'Platycaranx malabaricus',
      commonNames: 'Malabar Trevally'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Carangiformes',
      family: 'Carangidae',
      genus: 'Turrum',
      species: 'Turrum fulvoguttatum',
      commonNames: 'Goldspotted Trevally, Turrum'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Carangiformes',
      family: 'Carangidae',
      genus: 'Turrum',
      species: 'Turrum coeruleopinnatus',
      commonNames: 'Onion Trevally, Coastal Trevally'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Carangiformes',
      family: 'Carangidae',
      genus: 'Carangoides',
      species: 'Carangoides praeustus',
      commonNames: 'Brownback Trevally'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Carangiformes',
      family: 'Carangidae',
      genus: 'Atropus',
      species: 'Atropus atropos',
      commonNames: 'Cleftbelly Trevally'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Carangiformes',
      family: 'Carangidae',
      genus: 'Atropus',
      species: 'Atropus armatus',
      commonNames: 'Longfin Trevally, Sagai'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Carangiformes',
      family: 'Carangidae',
      genus: 'Atropus',
      species: 'Atropus atropos',
      commonNames: 'Cleftbelly Trevally'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Carangiformes',
      family: 'Carangidae',
      genus: 'Atropus',
      species: 'Atropus atropos',
      commonNames: 'Cleftbelly Trevally'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Carangiformes',
      family: 'Carangidae',
      genus: 'Alectis',
      species: 'Alectis ciliaris',
      commonNames: 'African Pompano'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Carangiformes',
      family: 'Carangidae',
      genus: 'Scyris',
      species: 'Scyris indica',
      commonNames: 'Diamond Trevally, Chermin'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Carangiformes',
      family: 'Carangidae',
      genus: 'Atule',
      species: 'Atule mate',
      commonNames: 'Yellowtail Scad, Selar'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Carangiformes',
      family: 'Carangidae',
      genus: 'Selaroides',
      species: 'Selaroides leptolepis',
      commonNames: 'Yellowstripe Scad, Kuning'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Carangiformes',
      family: 'Carangidae',
      genus: 'Selaroides',
      species: 'Selaroides leptolepis',
      commonNames: 'Yellowstripe Scad, Kuning'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Carangiformes',
      family: 'Carangidae',
      genus: 'Caranx',
      species: 'Caranx sexfasciatus',
      commonNames: 'Bigeye Trevally, Orh Kah'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Carangiformes',
      family: 'Carangidae',
      genus: 'Selar',
      species: 'Selar boops',
      commonNames: 'Oxeye Scad, Lolong, Lolong Kuning'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Carangiformes',
      family: 'Carangidae',
      genus: 'Selar',
      species: 'Selar crumenophthalmus',
      commonNames: 'Bigeye Scad, Lolong, Lolong Mata Besar'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Carangiformes',
      family: 'Carangidae',
      genus: 'Decapterus',
      species: 'Decapterus russelli',
      commonNames: 'Indian Scad'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Carangiformes',
      family: 'Carangidae',
      genus: 'Decapterus',
      species: 'Decapterus macarellus',
      commonNames: 'Mackerel Scad'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Pleuronectiformes',
      family: 'Bothidae',
      genus: 'Engyprosopon',
      species: 'Engyprosopon grandisquama',
      commonNames: 'Largescale Flounder'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Pleuronectiformes',
      family: 'Psettodidae',
      genus: 'Psettodes',
      species: 'Psettodes erumei',
      commonNames: 'Indian Halibut'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Pleuronectiformes',
      family: 'Paralichthyidae',
      genus: 'Pseudorhombus',
      species: 'Pseudorhombus javanicus',
      commonNames: 'Javan Flounder'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Pleuronectiformes',
      family: 'Paralichthyidae',
      genus: 'Pseudorhombus',
      species: 'Pseudorhombus elevatus',
      commonNames: 'Deep Flounder'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Pleuronectiformes',
      family: 'Paralichthyidae',
      genus: 'Pseudorhombus',
      species: 'Pseudorhombus arsius',
      commonNames: 'Largetooth Flounder'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Pleuronectiformes',
      family: 'Paralichthyidae',
      genus: 'Pseudorhombus',
      species: 'Pseudorhombus neglectus',
      commonNames: 'Neglected Flounder'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Pleuronectiformes',
      family: 'Paralichthyidae',
      genus: 'Pseudorhombus',
      species: 'Pseudorhombus malayanus',
      commonNames: 'Malayan Flounder'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Pleuronectiformes',
      family: 'Paralichthyidae',
      genus: 'Pseudorhombus',
      species: 'Pseudorhombus triocellatus',
      commonNames: 'Threespot Flounder'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Pleuronectiformes',
      family: 'Paralichthyidae',
      genus: 'Pseudorhombus',
      species: 'Pseudorhombus argus',
      commonNames: 'Peacock Flounder'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Pleuronectiformes',
      family: 'Soleidae',
      genus: 'Zebrias',
      species: 'Zebrias quagga',
      commonNames: 'Zebrias quagga'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Pleuronectiformes',
      family: 'Soleidae',
      genus: 'Zebrias',
      species: 'Zebrias zebra',
      commonNames: 'Zebra Sole'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Pleuronectiformes',
      family: 'Soleidae',
      genus: 'Dagetichthys',
      species: 'Dagetichthys commersonnii',
      commonNames: 'Commerson’s Sole'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Pleuronectiformes',
      family: 'Soleidae',
      genus: 'Brachirus',
      species: 'Brachirus orientalis',
      commonNames: 'Oriental Sole'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Pleuronectiformes',
      family: 'Soleidae',
      genus: 'Brachirus',
      species: 'Brachirus aspilos',
      commonNames: 'Dusky Sole'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Pleuronectiformes',
      family: 'Soleidae',
      genus: 'Pardachirus',
      species: 'Pardachirus pavoninus',
      commonNames: 'Peacock Sole'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Pleuronectiformes',
      family: 'Cynoglossidae ',
      genus: 'Paraplagusia',
      species: 'Paraplagusia bilineata',
      commonNames: 'Doublelined Tongue Sole'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Pleuronectiformes',
      family: 'Cynoglossidae ',
      genus: 'Paraplagusia',
      species: 'Paraplagusia borneensis',
      commonNames: 'Bornean Tongue Sole'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Terapontidae',
      genus: 'Scortum',
      species: 'Scortum barcoo',
      commonNames: 'Jade Perch'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Terapontidae',
      genus: 'Pelates',
      species: 'Pelates quadrilineatus',
      commonNames: 'Fourlined Trumpeter'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Terapontidae',
      genus: 'Pelates',
      species: 'Pelates sexlineatus',
      commonNames: 'Sixlined Trumpeter'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Terapontidae',
      genus: 'Terapon',
      species: 'Terapon jarbua',
      commonNames: 'Crescent Perch'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Terapontidae',
      genus: 'Terapon',
      species: 'Terapon theraps',
      commonNames: 'Banded Perch, Largescaled Terapon'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Terapontidae',
      genus: 'Terapon',
      species: 'Terapon puta',
      commonNames: 'Smallscaled Terapon'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Haemulidae',
      genus: 'Pomadasys',
      species: 'Pomadasys kaakan',
      commonNames: 'Javelin Grunter'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Haemulidae',
      genus: 'Pomadasys',
      species: 'Pomadasys argenteus',
      commonNames: 'Silver Grunter'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Haemulidae',
      genus: 'Pomadasys',
      species: 'Pomadasys maculatus',
      commonNames: 'Saddle Grunter'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Haemulidae',
      genus: 'Pomadasys',
      species: 'Pomadasys unimaculatus',
      commonNames: 'Red-patched Grunter'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Haemulidae',
      genus: 'Pomadasys',
      species: 'Pomadasys auritus',
      commonNames: 'Longhead Grunter'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Haemulidae',
      genus: 'Pomadasys',
      species: 'Pomadasys argyreus',
      commonNames: 'Bluecheek Grunter'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Haemulidae',
      genus: 'Plectorhinchus',
      species: 'Plectorhinchus gibbosus',
      commonNames: 'Brown Sweetlips, Harry Hotlips, Black Kaci'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Haemulidae',
      genus: 'Plectorhinchus',
      species: 'Plectorhinchus chaetodonoides',
      commonNames: 'Harlequin Sweetlips'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Haemulidae',
      genus: 'Plectorhinchus',
      species: 'Plectorhinchus chrysotaenia',
      commonNames: 'Goldlined Sweetlips, Celebes Sweetlips'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Haemulidae',
      genus: 'Diagramma',
      species: 'Diagramma pictum',
      commonNames: 'Painted Sweetlips, Kaci'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Sciaenidae',
      genus: 'Pennahia',
      species: 'Pennahia anea',
      commonNames: 'Donkey Croaker, Bigeye Croaker'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Sciaenidae',
      genus: 'Johnius',
      species: 'Johnius belangerii',
      commonNames: 'Belanger’s Croaker, Gelama'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Sciaenidae',
      genus: 'Johnius',
      species: 'Johnius trewavasae',
      commonNames: 'Trewavas Croaker, Gelama'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Sciaenidae',
      genus: 'Johnius',
      species: 'Johnius carouna',
      commonNames: 'Caroun Croaker'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Sciaenidae',
      genus: 'Johnius',
      species: 'Johnius heterolepis',
      commonNames: 'Largescale Croaker'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Sciaenidae',
      genus: 'Johnius',
      species: 'Johnius laevis',
      commonNames: 'Smooth Croaker'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Sciaenidae',
      genus: 'Dendrophysa',
      species: 'Dendrophysa russelii',
      commonNames: 'Goatee Croaker'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Sciaenidae',
      genus: 'Otolithes',
      species: 'Otolithes ruber',
      commonNames: 'Tigertooth Croaker, Longtooth kob'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Sciaenidae',
      genus: 'Otolithoides',
      species: 'Otolithoides biauritus',
      commonNames: 'Bronze Croaker'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Sciaenidae',
      genus: 'Nibea',
      species: 'Nibea albiflora',
      commonNames: 'Nibea albiflora'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Sciaenidae',
      genus: 'Pseudolarimichthys',
      species: 'Pseudolarimichthys terengganui',
      commonNames: 'Terengganu Yellow Croaker'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Labridae',
      genus: 'Halichoeres',
      species: 'Halichoeres erdmanni',
      commonNames: 'Erdmann’s Wrasse'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Labridae',
      genus: 'Halichoeres',
      species: 'Halichoeres nigrescens',
      commonNames: 'Diamond Wrasse, Bubblefin Wrasse'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Labridae',
      genus: 'Halichoeres',
      species: 'Halichoeres bicolor',
      commonNames: 'Pearly-banded Wrasse, Brownstripe Wrasse'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Labridae',
      genus: 'Halichoeres',
      species: 'Halichoeres chrysotaenia',
      commonNames: 'Vrolik’s Wrasse, Indian Ocean Pinstriped Wrasse'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Labridae',
      genus: 'Halichoeres',
      species: 'Halichoeres argus',
      commonNames: 'Argus Wrasse'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Labridae',
      genus: 'Halichoeres',
      species: 'Halichoeres leucurus',
      commonNames: 'Silty Wrasse, Greyhead Wrasse'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Labridae',
      genus: 'Halichoeres',
      species: 'Halichoeres marginatus',
      commonNames: 'Dusky Wrasse'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Labridae',
      genus: 'Halichoeres',
      species: 'Halichoeres chloropterus',
      commonNames: 'Pastel Green Wrasse'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Labridae',
      genus: 'Hemigymnus',
      species: 'Hemigymnus melapterus',
      commonNames: 'Half-and-Half Wrasse'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Labridae',
      genus: 'Cheilio',
      species: 'Cheilio inermis',
      commonNames: 'Cigar Wrasse'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Labridae',
      genus: 'Cheilinus',
      species: 'Cheilinus fasciatus',
      commonNames: 'Redbreast Maori Wrasse'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Labridae',
      genus: 'Cheilinus',
      species: 'Cheilinus chlorourus',
      commonNames: 'Floral Wrasse'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Labridae',
      genus: 'Cheilinus',
      species: 'Cheilinus trilobatus',
      commonNames: 'Tripletail Maori Wrasse'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Labridae',
      genus: 'Oxycheilinus',
      species: 'Oxycheilinus digramma',
      commonNames: 'Cheeklined Wrasse'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Labridae',
      genus: 'Thalassoma',
      species: 'Thalassoma lunare',
      commonNames: 'Moon Wrasse'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Labridae',
      genus: 'Pteragogus',
      species: 'Pteragogus flagellifer',
      commonNames: 'Cocktail Wrasse, Weedy Wrasse'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Labridae',
      genus: 'Pteragogus',
      species: 'Pteragogus sp.',
      commonNames: 'Pteragogus sp.'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Labridae',
      genus: 'Anampses',
      species: 'Anampses meleagrides',
      commonNames: 'Spotted Wrasse'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Labridae',
      genus: 'Choerodon',
      species: 'Choerodon anchorago',
      commonNames: 'Anchor Tuskfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Labridae',
      genus: 'Choerodon',
      species: 'Choerodon schoenleinii',
      commonNames: 'Blackspot Tuskfish, “Parrot”'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Labridae',
      genus: 'Choerodon',
      species: 'Choerodon oligacanthus',
      commonNames: 'Seagrass Tuskfish, White-patched Tuskfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Scaridae',
      genus: 'Scarus',
      species: 'Scarus rivulatus',
      commonNames: 'Rivulated Parrotfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Scaridae',
      genus: 'Scarus',
      species: 'Scarus ghobban',
      commonNames: 'Bluebarred Parrotfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Scaridae',
      genus: 'Scarus',
      species: 'Scarus prasiognathos',
      commonNames: 'Singapore Parrotfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Gerreidae',
      genus: 'Gerres',
      species: 'Gerres oyena',
      commonNames: 'Common Mojarra'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Gerreidae',
      genus: 'Gerres',
      species: 'Gerres shima',
      commonNames: 'Striped Mojarra'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Gerreidae',
      genus: 'Gerres',
      species: 'Gerres erythrourus',
      commonNames: 'Deepbodied Mojarra'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Gerreidae',
      genus: 'Gerres',
      species: 'Gerres limbatus',
      commonNames: 'Gerres limbatus'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Gerreidae',
      genus: 'Gerres',
      species: 'Gerres filamentosus',
      commonNames: 'Whipfin Mojarra'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Gerreidae',
      genus: 'Gerres',
      species: 'Gerres oblongus',
      commonNames: 'Gerres oblongus'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Leiognathidae',
      genus: 'Leiognathus',
      species: 'Leiognathus equulus',
      commonNames: 'Common Ponyfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Leiognathidae',
      genus: 'Aurigequula',
      species: 'Aurigequula fasciata',
      commonNames: 'Striped Ponyfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Leiognathidae',
      genus: 'Aurigequula',
      species: 'Aurigequula longispinis',
      commonNames: 'Longspine Ponyfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Leiognathidae',
      genus: 'Eubleekeria',
      species: 'Eubleekeria jonesi',
      commonNames: 'Jones’ Ponyfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Leiognathidae',
      genus: 'Eubleekeria',
      species: 'Eubleekeria splendens',
      commonNames: 'Splendid Ponyfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Leiognathidae',
      genus: 'Eubleekeria',
      species: 'Eubleekeria sp.',
      commonNames: 'Eubleekeria sp.'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Leiognathidae',
      genus: 'Gazza',
      species: 'Gazza minuta',
      commonNames: 'Toothpony'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Leiognathidae',
      genus: 'Photolateralis',
      species: 'Photolateralis stercorarius',
      commonNames: 'Photolateralis stercorarius'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Leiognathidae',
      genus: 'Photopectoralis',
      species: 'Photopectoralis bindus',
      commonNames: 'Photopectoralis bindus'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Leiognathidae',
      genus: 'Equulites',
      species: 'Equulites leuciscus',
      commonNames: 'Whipfin Ponyfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Leiognathidae',
      genus: 'Nuchequula',
      species: 'Nuchequula blochii',
      commonNames: 'Nuchequula blochii'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Leiognathidae',
      genus: 'Nuchequula',
      species: 'Nuchequula gerreoides',
      commonNames: 'Decorated Ponyfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Leiognathidae',
      genus: 'Nuchequula',
      species: 'Nuchequula longicornis',
      commonNames: 'Nuchequula longicornis'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Leiognathidae',
      genus: 'Nuchequula',
      species: 'Nuchequula mannusella',
      commonNames: 'Nuchequula mannusella'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Leiognathidae',
      genus: 'Karalla',
      species: 'Karalla daura',
      commonNames: 'Goldstriped Ponyfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Leiognathidae',
      genus: 'Deveximentum',
      species: 'Deveximentum hanedai',
      commonNames: 'Haneda’s Pugnose Ponyfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Leiognathidae',
      genus: 'Deveximentum',
      species: 'Deveximentum ruconius',
      commonNames: 'Deveximentum ruconius'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Leiognathidae',
      genus: 'Deveximentum',
      species: 'Deveximentum insidiator',
      commonNames: 'Deveximentum insidiator'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Serranidae',
      genus: 'Cephalopholis',
      species: 'Cephalopholis boenak',
      commonNames: 'Chocolate Hind, Arumugam'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Serranidae',
      genus: 'Cephalopholis',
      species: 'Cephalopholis formosa',
      commonNames: 'Bluelined Hind'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Serranidae',
      genus: 'Cephalopholis',
      species: 'Cephalopholis cyanostigma',
      commonNames: 'Bluespotted Hind'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Serranidae',
      genus: 'Epinephelus',
      species: 'Epinephelus fasciatus',
      commonNames: 'Blacktip Coral Grouper'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Serranidae',
      genus: 'Epinephelus',
      species: 'Epinephelus coioides',
      commonNames: 'Orangespotted Grouper'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Serranidae',
      genus: 'Epinephelus',
      species: 'Epinephelus malabaricus',
      commonNames: 'Malabar Grouper'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Serranidae',
      genus: 'Epinephelus',
      species: 'Epinephelus fuscoguttatus',
      commonNames: 'Brown Marbled Grouper, Tiger Grouper'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Serranidae',
      genus: 'Epinephelus',
      species: 'Epinephelus polyphekadion',
      commonNames: 'Camouflage Grouper'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Serranidae',
      genus: 'Epinephelus',
      species: 'Epinephelus lanceolatus',
      commonNames: 'Queensland Grouper, Giant Grouper'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Serranidae',
      genus: 'Epinephelus',
      species: 'Epinephelus quoyanus',
      commonNames: 'Longfin Grouper, Honeycomb Grouper'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Serranidae',
      genus: 'Epinephelus',
      species: 'Epinephelus cyanopodus',
      commonNames: 'Speckled Blue Grouper'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Serranidae',
      genus: 'Epinephelus',
      species: 'Epinephelus erythrurus',
      commonNames: 'Cloudy Grouper'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Serranidae',
      genus: 'Epinephelus',
      species: 'Epinephelus bleekeri',
      commonNames: 'Duskytail Grouper'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Serranidae',
      genus: 'Epinephelus',
      species: 'Epinephelus hexagonatus',
      commonNames: 'Starspotted Grouper'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Serranidae',
      genus: 'Epinephelus',
      species: 'Epinephelus fuscoguttatus x Epinephelus lanceolatus',
      commonNames: 'Hybrid Grouper, Dragon Tiger Grouper'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Serranidae',
      genus: 'Plectropomus',
      species: 'Plectropomus maculatus',
      commonNames: 'Barcheek Coral Trout'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Serranidae',
      genus: 'Plectropomus',
      species: 'Plectropomus leopardus',
      commonNames: 'Leopard Coral Trout'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Serranidae',
      genus: 'Diploprion',
      species: 'Diploprion bifasciatum',
      commonNames: 'Yellow Soapfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Lethrinidae',
      genus: 'Lethrinus',
      species: 'Lethrinus lentjan',
      commonNames: 'Pink-eared Emperor'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Lethrinidae',
      genus: 'Lethrinus',
      species: 'Lethrinus nebulosus',
      commonNames: 'Spangled Emperor'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Lethrinidae',
      genus: 'Lethrinus',
      species: 'Lethrinus ornatus',
      commonNames: 'Ornate Emperor'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Lethrinidae',
      genus: 'Lethrinus',
      species: 'Lethrinus genivittatus',
      commonNames: 'Longspine Emperor'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Lethrinidae',
      genus: 'Lethrinus',
      species: 'Lethrinus olivaceus',
      commonNames: 'Longnosed Emperor'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Lutjanidae',
      genus: 'Lutjanus',
      species: 'Lutjanus lutjanus',
      commonNames: 'Bigeye Snapper'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Lutjanidae',
      genus: 'Lutjanus',
      species: 'Lutjanus xanthopinnis',
      commonNames: 'Yellowfin Snapper, “Indian Snapper”'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Lutjanidae',
      genus: 'Lutjanus',
      species: 'Lutjanus vitta',
      commonNames: 'Brownstriped Red Snapper'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Lutjanidae',
      genus: 'Lutjanus',
      species: 'Lutjanus malabaricus',
      commonNames: 'Malabar Blood Snapper, Ang Kuey'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Lutjanidae',
      genus: 'Lutjanus',
      species: 'Lutjanus erythropterus',
      commonNames: 'Crimson Snapper, Ang Kuey'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Lutjanidae',
      genus: 'Lutjanus',
      species: 'Lutjanus carponotatus',
      commonNames: 'Spanish Flag Snapper, Timun'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Lutjanidae',
      genus: 'Lutjanus',
      species: 'Lutjanus argentimaculatus',
      commonNames: 'Mangrove Jack (MJ)'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Lutjanidae',
      genus: 'Lutjanus',
      species: 'Lutjanus bohar',
      commonNames: 'Twospot Red Snapper'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Lutjanidae',
      genus: 'Lutjanus',
      species: 'Lutjanus johnii',
      commonNames:
          'Golden Snapper, John’s Snapper, Fingermark Snapper, Ang Cho'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Lutjanidae',
      genus: 'Lutjanus',
      species: 'Lutjanus russellii',
      commonNames: 'Russell’s Snapper, Ang Cho Kee'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Lutjanidae',
      genus: 'Lutjanus',
      species: 'Lutjanus fulviflamma',
      commonNames: 'Dory Snapper, Blackspot Snapper'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Lutjanidae',
      genus: 'Lutjanus',
      species: 'Lutjanus eherenbergii',
      commonNames: 'Blackspot Snapper'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Lutjanidae',
      genus: 'Lutjanus',
      species: 'Lutjanus fulvus',
      commonNames: 'Blacktail Snapper'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Lutjanidae',
      genus: 'Lutjanus',
      species: 'Lutjanus lemniscatus',
      commonNames: 'Yellowstreaked Snapper'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Lutjanidae',
      genus: 'Lutjanus',
      species: 'Lutjanus decussatus ',
      commonNames: 'Checkered Snapper'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Lutjanidae',
      genus: 'Lutjanus',
      species: 'Lutjanus gibbus',
      commonNames: 'Humpbacked Snapper'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Lutjanidae',
      genus: 'Lutjanus',
      species: 'Lutjanus rivulatus',
      commonNames: 'Maori Snapper'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Lutjanidae',
      genus: 'Lutjanus',
      species: 'Lutjanus stellatus',
      commonNames: 'Star Snapper'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Centrogenyidae',
      genus: 'Centrogenys',
      species: 'Centrogenys vaigiensis',
      commonNames: 'False Scorpionfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Nemipteridae',
      genus: 'Pentapodus',
      species: 'Pentapodus setosus',
      commonNames: 'Butterfly Whiptail, Selinching, Banana Fish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Nemipteridae',
      genus: 'Pentapodus',
      species: 'Pentapodus bifasciatus',
      commonNames: 'White-shouldered Whiptail, Selinching'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Nemipteridae',
      genus: 'Pentapodus',
      species: 'Pentapodus trivittatus',
      commonNames: 'Threestriped Whiptail'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Nemipteridae',
      genus: 'Nemipterus',
      species: 'Nemipterus hexodon',
      commonNames: 'Ornate Threadfin Bream, Ang Go Li'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Nemipteridae',
      genus: 'Nemipterus',
      species: 'Nemipterus peronii',
      commonNames: 'Notchedfin Threadfin Bream'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Nemipteridae',
      genus: 'Nemipterus',
      species: 'Nemipterus furcosus',
      commonNames: 'Forktail Threadfin Bream'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Nemipteridae',
      genus: 'Nemipterus',
      species: 'Nemipterus japonicus',
      commonNames: 'Japanese Threadfin Bream'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Nemipteridae',
      genus: 'Nemipterus',
      species: 'Nemipterus mesoprion',
      commonNames: 'Mauvelip Threadfin Bream'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Nemipteridae',
      genus: 'Scolopsis',
      species: 'Scolopsis taenioptera',
      commonNames: 'Lattice Monocle Bream'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Nemipteridae',
      genus: 'Scolopsis',
      species: 'Scolopsis monogramma',
      commonNames: 'Monogrammed Monocle Bream'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Nemipteridae',
      genus: 'Scolopsis',
      species: 'Scolopsis japonica',
      commonNames: 'Javanese Monocle Bream'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Nemipteridae',
      genus: 'Scolopsis',
      species: 'Scolopsis vosmeri',
      commonNames: 'Whitecheeked Monocle Bream'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Nemipteridae',
      genus: 'Scolopsis',
      species: 'Scolopsis margaritifera',
      commonNames: 'Pearly Monocle Bream'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Nemipteridae',
      genus: 'Scolopsis',
      species: 'Scolopsis affinis',
      commonNames: 'Peter’s Monocle Bream'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Trichonotidae',
      genus: 'Trichonotus',
      species: 'Trichonotus setiger',
      commonNames: 'Spotted Sand-diver'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Pinguipedidae',
      genus: 'Parapercis',
      species: 'Parapercis xanthozona',
      commonNames: 'Barred Sandperch'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Pinguipedidae',
      genus: 'Parapercis',
      species: 'Parapercis filamentosa',
      commonNames: 'Threadfin Sandperch'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Ephippidae',
      genus: 'Ephippus',
      species: 'Ephippus orbis',
      commonNames: 'Orbfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Ephippidae',
      genus: 'Platax',
      species: 'Platax orbicularis',
      commonNames: 'Orbiculate Batfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Ephippidae',
      genus: 'Platax',
      species: 'Platax teira',
      commonNames: 'Longfin Batfish, Teira Batfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Ephippidae',
      genus: 'Platax',
      species: 'Platax batavianus',
      commonNames: 'Batavian Batfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Ephippidae',
      genus: 'Platax',
      species: 'Platax pinnatus',
      commonNames: 'Pinnate Batfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Drepaneidae',
      genus: 'Drepane',
      species: 'Drepane punctata',
      commonNames: 'Spotted Sicklefish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Pomacentridae',
      genus: 'Pomacentrus',
      species: 'Pomacentrus littoralis',
      commonNames: 'Smoky Damsel'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Pomacentridae',
      genus: 'Pomacentrus',
      species: 'Pomacentrus cheraphilus',
      commonNames: 'Silty Damsel'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Pomacentridae',
      genus: 'Pomacentrus',
      species: 'Pomacentrus adelus',
      commonNames: 'Obscure Damsel'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Pomacentridae',
      genus: 'Pomacentrus',
      species: 'Pomacentrus tripunctatus',
      commonNames: 'Threespot Damsel'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Pomacentridae',
      genus: 'Pomacentrus',
      species: 'Pomacentrus chrysurus',
      commonNames: 'Whitetail Damsel'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Pomacentridae',
      genus: 'Dischistodus',
      species: 'Dischistodus perspicillatus',
      commonNames: 'White Damsel'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Pomacentridae',
      genus: 'Dischistodus',
      species: 'Dischistodus fasciatus',
      commonNames: 'Banded Damsel, Bumblebee Damsel'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Pomacentridae',
      genus: 'Dischistodus',
      species: 'Dischistodus prosoprotaenia',
      commonNames: 'Honeyhead Damsel'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Pomacentridae',
      genus: 'Dischistodus',
      species: 'Dischistodus chrysopoecilus',
      commonNames: 'Whitespot Damsel'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Pomacentridae',
      genus: 'Neopomacentrus',
      species: 'Neopomacentrus bankieri',
      commonNames: 'Chinese Demoiselle'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Pomacentridae',
      genus: 'Neopomacentrus',
      species: 'Neopomacentrus filamentosus',
      commonNames: 'Threadfin Demoiselle'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Pomacentridae',
      genus: 'Neopomacentrus',
      species: 'Neopomacentrus anabatoides',
      commonNames: 'Silver Demoiselle'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Pomacentridae',
      genus: 'Neopomacentrus',
      species: 'Neopomacentrus cyanomos',
      commonNames: 'Regal Demoiselle'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Pomacentridae',
      genus: 'Neopomacentrus',
      species: 'Neopomacentrus azysron',
      commonNames: 'Yellowtail Demoiselle'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Pomacentridae',
      genus: 'Amblyglyphidodon',
      species: 'Amblyglyphidodon curacao',
      commonNames: 'Staghorn Damsel'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Pomacentridae',
      genus: 'Stegastes',
      species: 'Stegastes obreptus',
      commonNames: 'Western Gregory'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Pomacentridae',
      genus: 'Hemiglyphidodon',
      species: 'Hemiglyphidodon plagiometopon',
      commonNames: 'Lagoon Damsel, Sweetlip Damsel'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Pomacentridae',
      genus: 'Dascyllus',
      species: 'Dascyllus trimaculatus',
      commonNames: 'Domino, Threespot Dascyllus'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Pomacentridae',
      genus: 'Amphiprion',
      species: 'Amphiprion frenatus',
      commonNames: 'Tomato Anemonefish, Tomato Clownfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Pomacentridae',
      genus: 'Amphiprion',
      species: 'Amphiprion ocellaris',
      commonNames: 'Ocellaris Anemonefish, False Clownfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Pomacentridae',
      genus: 'Abudefduf',
      species: 'Abudefduf sordidus',
      commonNames: 'Blackspot Sergeant'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Pomacentridae',
      genus: 'Abudefduf',
      species: 'Abudefduf vaigiensis',
      commonNames: 'Indo-Pacific Sergeant Major'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Pomacentridae',
      genus: 'Abudefduf',
      species: 'Abudefduf bengalensis',
      commonNames: 'Bengal Sergeant'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Pomacentridae',
      genus: 'Abudefduf',
      species: 'Abudefduf sexfasciatus',
      commonNames: 'Scissortail Sergeant'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Sillaginidae',
      genus: 'Sillago',
      species: 'Sillago aeolus',
      commonNames: 'Oriental Trumpeter Whiting'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Sillaginidae',
      genus: 'Sillago',
      species: 'Sillago sihama',
      commonNames: 'Silver Sand Whiting'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Siganidae',
      genus: 'Siganus',
      species: 'Siganus canaliculatus',
      commonNames: 'Whitespotted Rabbitfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Siganidae',
      genus: 'Siganus',
      species: 'Siganus virgatus',
      commonNames: 'Virgate Rabbitfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Siganidae',
      genus: 'Siganus',
      species: 'Siganus javus',
      commonNames: 'Streaked Rabbitfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Siganidae',
      genus: 'Siganus',
      species: 'Siganus guttatus',
      commonNames: 'Golden Rabbitfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Siganidae',
      genus: 'Siganus',
      species: 'Siganus vermiculatus',
      commonNames: 'Vermiculated Rabbitfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Siganidae',
      genus: 'Siganus',
      species: 'Siganus vulpinus',
      commonNames: 'Foxface Rabbitfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Chaetodonidae',
      genus: 'Parachaetodon',
      species: 'Parachaetodon ocellaris',
      commonNames: 'Kite Butterflyfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Chaetodonidae',
      genus: 'Chaetodon',
      species: 'Chaetodon octofasciatus',
      commonNames: 'Eightbanded Butterflyfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Chaetodonidae',
      genus: 'Chelmon',
      species: 'Chelmon rostratus',
      commonNames: 'Copperbanded Butterflyfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Pomacanthidae',
      genus: 'Pomacanthus',
      species: 'Pomacanthus annularis',
      commonNames: 'Blueringed Angelfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Pomacanthidae',
      genus: 'Pomacanthus',
      species: 'Pomacanthus sexstriatus',
      commonNames: 'Sixbar Angelfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Perciformes',
      family: 'Pomacanthidae',
      genus: 'Chaetodontoplus',
      species: 'Chaetodontoplus mesoleucus',
      commonNames: 'Singapore Angelfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Atheriniformes',
      family: 'Atherinidae',
      genus: 'Atherinomorus',
      species: 'Atherinomorus lacunosus',
      commonNames: 'Widebanded Hardyhead Silverside'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Atheriniformes',
      family: 'Atherinidae',
      genus: 'Doboatherina',
      species: 'Doboatherina duodecimalis',
      commonNames: 'Tropical Silverside'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Atheriniformes',
      family: 'Atherinidae',
      genus: 'Hypoatherina',
      species: 'Hypoatherina valenciennei',
      commonNames: 'Sumatran Silverside'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Mugiliformes',
      family: 'Mugilidae',
      genus: 'Planiliza',
      species: 'Planiliza subviridis',
      commonNames: 'Greenback Mullet'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Mugiliformes',
      family: 'Mugilidae',
      genus: 'Ellochelon',
      species: 'Ellochelon vaigiensis',
      commonNames: 'Diamondscale Mullet, Squaretail Mullet, Tamok'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Mugiliformes',
      family: 'Mugilidae',
      genus: 'Valamugil',
      species: 'Valamugil seheli',
      commonNames: 'Bluespot Mullet'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Mugiliformes',
      family: 'Mugilidae',
      genus: 'Osteomugil',
      species: 'Osteomugil perusii',
      commonNames: 'Longfin Mullet'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Mugiliformes',
      family: 'Mugilidae',
      genus: 'Mugil',
      species: 'Mugil cephalus',
      commonNames: 'Flathead Grey Mullet'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Beloniformes',
      family: 'Hemiramphidae',
      genus: 'Hemiramphus',
      species: 'Hemiramphus far',
      commonNames: 'Blackbarred Halfbeak'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Beloniformes',
      family: 'Hemiramphidae',
      genus: 'Hyporhamphus',
      species: 'Hyporhamphus quoyi',
      commonNames: 'Quoy’s Halfbeak'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Beloniformes',
      family: 'Hemiramphidae',
      genus: 'Hyporhamphus',
      species: 'Hyporhamphus limbatus',
      commonNames: 'Congaturi Halfbeak'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Beloniformes',
      family: 'Belonidae',
      genus: 'Tylosurus',
      species: 'Tylosurus crocodilus',
      commonNames: 'Hound Needlefish, Todak'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Beloniformes',
      family: 'Belonidae',
      genus: 'Ablennes',
      species: 'Ablennes hians',
      commonNames: 'Flat Needlefish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Beloniformes',
      family: 'Belonidae',
      genus: 'Strongylura',
      species: 'Strongylura strongylura',
      commonNames: 'Spottail Needlefish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Beloniformes',
      family: 'Belonidae',
      genus: 'Strongylura',
      species: 'Strongylura leiura',
      commonNames: 'Banded Needlefish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Beloniformes',
      family: 'Belonidae',
      genus: 'Strongylura',
      species: 'Strongylura incisa',
      commonNames: 'Reef Needlefish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Beloniformes',
      family: 'Zenarchopteridae',
      genus: 'Zenarchopterus',
      species: 'Zenarchopterus buffonis',
      commonNames:
          'Stripe-nosed Halfbeak, Buffon’s River Garfish, Mangrove Halfbeak'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Beloniformes',
      family: 'Zenarchopteridae',
      genus: 'Zenarchopterus',
      species: 'Zenarchopterus gilli',
      commonNames: 'Viviparous Halfbeak'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Beloniformes',
      family: 'Zenarchopteridae',
      genus: 'Zenarchopterus',
      species: 'Zenarchopterus dispar',
      commonNames: 'Feathered River Garfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Beloniformes',
      family: 'Zenarchopteridae',
      genus: 'Hemirhamphodon',
      species: 'Hemirhamphodon pogonognathus',
      commonNames: 'Malayan Forest Halfbeak'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Beloniformes',
      family: 'Zenarchopteridae',
      genus: 'Dermogenys',
      species: 'Dermogenys collettei',
      commonNames: 'Pygmy Halfbeak'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Blenniformes',
      family: 'Blennidae',
      genus: 'Omobranchus',
      species: 'Omobranchus ferox',
      commonNames: 'Crested Oyster Blenny'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Blenniformes',
      family: 'Blennidae',
      genus: 'Istiblennius',
      species: 'Istiblennius dussumieri',
      commonNames: 'Streaky Rockskipper'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Blenniformes',
      family: 'Blennidae',
      genus: 'Entomacrodus',
      species: 'Entomacrodus lighti',
      commonNames: 'Stellar Rockskipper'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Blenniformes',
      family: 'Blennidae',
      genus: 'Entomacrodus',
      species: 'Entomacrodus striatus',
      commonNames: 'Blackspotted Rockskipper'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Blenniformes',
      family: 'Blennidae',
      genus: 'Petroscirtes',
      species: 'Petroscirtes variabilis',
      commonNames: 'Variable Sabretooth Blenny'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Tetraodontiformes',
      family: 'Monacanthidae',
      genus: 'Aluterus',
      species: 'Aluterus scriptus',
      commonNames: 'Scrawled Filefish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Tetraodontiformes',
      family: 'Monacanthidae',
      genus: 'Monacanthus',
      species: 'Monacanthus chinensis',
      commonNames: 'Fan-bellied Filefish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Tetraodontiformes',
      family: 'Monacanthidae',
      genus: 'Pseudomonacanthus',
      species: 'Pseudomonacanthus macrurus',
      commonNames: 'Strapweed Filefish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Tetraodontiformes',
      family: 'Monacanthidae',
      genus: 'Paramonacanthus',
      species: 'Paramonacanthus choirocephalus',
      commonNames: 'Pig-faced Leatherjacket'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Tetraodontiformes',
      family: 'Monacanthidae',
      genus: 'Acreichthys',
      species: 'Acreichthys tomentosus',
      commonNames: 'Bristletail Filefish, Seagrass Filefish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Tetraodontiformes',
      family: 'Monacanthidae',
      genus: 'Chaetodermis',
      species: 'Chaetodermis penicilligerus',
      commonNames: 'Feathery Filefish, Leafy Filefish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Tetraodontiformes',
      family: 'Monacanthidae',
      genus: 'Anacanthus',
      species: 'Anacanthus barbatus',
      commonNames: 'Bearded Filefish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Tetraodontiformes',
      family: 'Tetraodontidae',
      genus: 'Arothron',
      species: 'Arothron immaculatus',
      commonNames: 'Yelloweye Puffer'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Tetraodontiformes',
      family: 'Tetraodontidae',
      genus: 'Arothron',
      species: 'Arothron reticularis',
      commonNames: 'Reticulate Puffer'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Tetraodontiformes',
      family: 'Tetraodontidae',
      genus: 'Arothron',
      species: 'Arothron hispidus',
      commonNames: 'Stars and Stripes Puffer'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Tetraodontiformes',
      family: 'Tetraodontidae',
      genus: 'Arothron',
      species: 'Arothron stellatus',
      commonNames: 'Starry Puffer'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Tetraodontiformes',
      family: 'Tetraodontidae',
      genus: 'Arothron',
      species: 'Arothron mappa',
      commonNames: 'Map Puffer'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Tetraodontiformes',
      family: 'Tetraodontidae',
      genus: 'Arothron',
      species: 'Arothron caeruleopunctatus',
      commonNames: 'Bluespotted Puffer'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Tetraodontiformes',
      family: 'Tetraodontidae',
      genus: 'Lagocephalus',
      species: 'Lagocephalus lunaris',
      commonNames: 'Lunartail Puffer, Rough Golden Puffer'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Tetraodontiformes',
      family: 'Tetraodontidae',
      genus: 'Lagocephalus',
      species: 'Lagocephalus spadiceus',
      commonNames: 'Half-smooth Golden Puffer'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Tetraodontiformes',
      family: 'Tetraodontidae',
      genus: 'Lagocephalus',
      species: 'Lagocephalus suezensis',
      commonNames: 'Suez Puffer'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Tetraodontiformes',
      family: 'Tetraodontidae',
      genus: 'Lagocephalus',
      species: 'Lagocephalus guentheri',
      commonNames: 'Guenther’s Puffer'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Tetraodontiformes',
      family: 'Tetraodontidae',
      genus: 'Lagocephalus',
      species: 'Lagocephalus sceleratus',
      commonNames: 'Silvercheeked Puffer'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Tetraodontiformes',
      family: 'Tetraodontidae',
      genus: 'Takifugu',
      species: 'Takifugu oblongus',
      commonNames: 'Oblong Blaasop'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Tetraodontiformes',
      family: 'Tetraodontidae',
      genus: 'Chelonodontops',
      species: 'Chelonodontops patoca',
      commonNames: 'Milkspotted Puffer'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Tetraodontiformes',
      family: 'Tetraodontidae',
      genus: 'Dichotomyctere',
      species: 'Dichotomyctere nigroviridis',
      commonNames: 'Spotted Green Puffer'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Tetraodontiformes',
      family: 'Diodontidae',
      genus: 'Diodon',
      species: 'Diodon hystrix',
      commonNames: 'Spotted Porcupinefish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Tetraodontiformes',
      family: 'Diodontidae',
      genus: 'Diodon',
      species: 'Diodon liturosus',
      commonNames: 'Blackblotch Porcupinefish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Tetraodontiformes',
      family: 'Diodontidae',
      genus: 'Diodon',
      species: 'Diodon holocanthus',
      commonNames: 'Longspine Porcupinefish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Tetraodontiformes',
      family: 'Diodontidae',
      genus: 'Cyclichthys',
      species: 'Cyclichthys orbicularis',
      commonNames: 'Birdbeak Burrfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Tetraodontiformes',
      family: 'Balistidae',
      genus: 'Abalistes',
      species: 'Abalistes stellatus',
      commonNames: 'Starry Triggerfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Tetraodontiformes',
      family: 'Balistidae',
      genus: 'Balistapus',
      species: 'Balistapus undulatus',
      commonNames: 'Orangelined Triggerfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Tetraodontiformes',
      family: 'Balistidae',
      genus: 'Balistoides',
      species: 'Balistoides viridescens',
      commonNames: 'Titan Triggerfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Tetraodontiformes',
      family: 'Triacanthidae',
      genus: 'Triacanthus',
      species: 'Triacanthus biaculeatus',
      commonNames: 'Shortnose Tripodfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Tetraodontiformes',
      family: 'Triacanthidae',
      genus: 'Triacanthus',
      species: 'Triacanthus nieuhofii',
      commonNames: 'Silver Tripodfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Tetraodontiformes',
      family: 'Triacanthidae',
      genus: 'Tripodichthys',
      species: 'Tripodichthys blochii',
      commonNames: 'Longtail Tripodfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Lophiiformes',
      family: 'Antennariidae',
      genus: 'Lophiocharon',
      species: 'Lophiocharon trisignatus',
      commonNames: 'Spotted-tail Frogfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Scorpaeniformes',
      family: 'Platycephalidae',
      genus: 'Platycephalus',
      species: 'Platycephalus indicus',
      commonNames: 'Bartailed Flathead'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Scorpaeniformes',
      family: 'Platycephalidae',
      genus: 'Platycephalus',
      species: 'Platycephalus fuscus',
      commonNames: 'Dusky Flathead'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Scorpaeniformes',
      family: 'Platycephalidae',
      genus: 'Cymbacephalus',
      species: 'Cymbacephalus nematophthalmus',
      commonNames: 'Fringe-eyed Flathead'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Scorpaeniformes',
      family: 'Platycephalidae',
      genus: 'Cymbacephalus',
      species: 'Cymbacephalus beauforti',
      commonNames: 'Crocodile Flathead'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Scorpaeniformes',
      family: 'Platycephalidae',
      genus: 'Sunagocia',
      species: 'Sunagocia carbunculus',
      commonNames: 'Papillose Flathead'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Scorpaeniformes',
      family: 'Platycephalidae',
      genus: 'Thysanophrys',
      species: 'Thysanophrys celebica',
      commonNames: 'Celebes Flathead'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Scorpaeniformes',
      family: 'Platycephalidae',
      genus: 'Inegocia',
      species: 'Inegocia japonica',
      commonNames: 'Japanese Flathead'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Scorpaeniformes',
      family: 'Platycephalidae',
      genus: 'Rogadius',
      species: 'Rogadius asper',
      commonNames: 'Rogadius asper'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Scorpaeniformes',
      family: 'Platycephalidae',
      genus: 'Grammoplites',
      species: 'Grammoplites scaber',
      commonNames: 'Grammoplites scaber'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Scorpaeniformes',
      family: 'Scorpaenidae',
      genus: 'Pterois',
      species: 'Pterois russelii',
      commonNames: 'Russell’s Lionfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Scorpaeniformes',
      family: 'Scorpaenidae',
      genus: 'Pterois',
      species: 'Pterois volitans',
      commonNames: 'Volitans Lionfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Scorpaeniformes',
      family: 'Scorpaenidae',
      genus: 'Scorpaenopsis',
      species: 'Scorpaenopsis diabolus',
      commonNames: 'False Stonefish, Devil Scorpionfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Scorpaeniformes',
      family: 'Scorpaenidae',
      genus: 'Scorpaenopsis',
      species: 'Scorpaenopsis possi',
      commonNames: 'Poss’ Scorpionfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Scorpaeniformes',
      family: 'Scorpaenidae',
      genus: 'Scorpaenopsis',
      species: 'Scorpaenopsis ramaraoi',
      commonNames: 'Rama Rao’s Scorpionfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Scorpaeniformes',
      family: 'Scorpaenidae',
      genus: 'Scorpaenopsis',
      species: 'Scorpaenopsis neglecta',
      commonNames: 'Yellowfin Scorpionfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Scorpaeniformes',
      family: 'Scorpaenidae',
      genus: 'Parascorpaena',
      species: 'Parascorpaena picta',
      commonNames: 'Painted Scorpionfish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Scorpaeniformes',
      family: 'Scorpaenidae',
      genus: 'Parascorpaena',
      species: 'Parascorpaena bandanensis',
      commonNames: 'Parascorpaena bandanensis'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Scorpaeniformes',
      family: 'Synanceiidae',
      genus: 'Inimicus',
      species: 'Inimicus didactylus',
      commonNames: 'Demon Stinger'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Scorpaeniformes',
      family: 'Synanceiidae',
      genus: 'Inimicus',
      species: 'Inimicus brachyrhynchus',
      commonNames: 'Singapore Stinger'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Scorpaeniformes',
      family: 'Synanceiidae',
      genus: 'Inimicus',
      species: 'Inimicus cuvieri',
      commonNames: 'Longsnout Stinger'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Scorpaeniformes',
      family: 'Synanceiidae',
      genus: 'Synanceia',
      species: 'Synanceia horrida',
      commonNames: 'Hollow-cheeked Stonefish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Scorpaeniformes',
      family: 'Synanceiidae',
      genus: 'Synanceia',
      species: 'Synanceia verrucosa',
      commonNames: 'Reef Stonefish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Scorpaeniformes',
      family: 'Synanceiidae',
      genus: 'Leptosynanceia',
      species: 'Leptosynanceia asteroblepa',
      commonNames: 'Mangrove Stonefish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Scorpaeniformes',
      family: 'Synanceiidae',
      genus: 'Trachicephalus',
      species: 'Trachicephalus uranoscopus',
      commonNames: 'Stargazing Stonefish'),
  SpeciesRecord(
      class_: 'Actinopterygii',
      order: 'Scorpaeniformes',
      family: 'Tetrarogidae',
      genus: 'Paracentropogon',
      species: 'Paracentropogon longispinis',
      commonNames: 'Longspine Waspfish'),
  SpeciesRecord(
      class_: 'Chondrichthyes',
      order: 'Rajiformes',
      family: 'Potamotrygonidae',
      genus: 'Potamotrygon',
      species: 'Potamotrygon motoro',
      commonNames: 'Motoro Ray'),
  SpeciesRecord(
      class_: 'Chondrichthyes',
      order: 'Rajiformes',
      family: 'Dasyatidae',
      genus: 'Taeniura',
      species: 'Taeniura lymma',
      commonNames: 'Bluespotted Ribbontail Ray'),
  SpeciesRecord(
      class_: 'Chondrichthyes',
      order: 'Rajiformes',
      family: 'Dasyatidae',
      genus: 'Neotrygon',
      species: 'Neotrygon kuhlii',
      commonNames: 'Kuhl’s Maskray'),
  SpeciesRecord(
      class_: 'Chondrichthyes',
      order: 'Rajiformes',
      family: 'Dasyatidae',
      genus: 'Brevitrygon',
      species: 'Brevitrygon walga',
      commonNames: 'Dwarf Whipray, Dwarf Mangrove Whipray'),
  SpeciesRecord(
      class_: 'Chondrichthyes',
      order: 'Rajiformes',
      family: 'Dasyatidae',
      genus: 'Himantura',
      species: 'Himantura uarnak',
      commonNames: 'Reticulate Whipray'),
  SpeciesRecord(
      class_: 'Chondrichthyes',
      order: 'Rajiformes',
      family: 'Dasyatidae',
      genus: 'Himantura',
      species: 'Himantura undulata',
      commonNames: 'Leopard Whipray'),
  SpeciesRecord(
      class_: 'Chondrichthyes',
      order: 'Rajiformes',
      family: 'Dasyatidae',
      genus: 'Himantura',
      species: 'Himantura gerrardi',
      commonNames: 'Whitespotted Whipray'),
  SpeciesRecord(
      class_: 'Chondrichthyes',
      order: 'Rajiformes',
      family: 'Dasyatidae',
      genus: 'Himantura',
      species: 'Himantura granulata',
      commonNames: 'Mangrove Whipray'),
  SpeciesRecord(
      class_: 'Chondrichthyes',
      order: 'Rajiformes',
      family: 'Aetobatidae',
      genus: 'Aetobatus',
      species: 'Aetobatus ocellatus',
      commonNames: 'Spotted Eagle Ray'),
  SpeciesRecord(
      class_: 'Chondrichthyes',
      order: 'Torpediniformes',
      family: 'Narkidae',
      genus: 'Temera',
      species: 'Temera hardwickii',
      commonNames: 'Hardwicke’s Electric Ray'),
  SpeciesRecord(
      class_: 'Chondrichthyes',
      order: 'Carcharhiniformes',
      family: 'Carcharhinidae',
      genus: 'Carcharhinus',
      species: 'Carcharhinus melanopterus',
      commonNames: 'Blacktip Reef Shark'),
  SpeciesRecord(
      class_: 'Chondrichthyes',
      order: 'Carcharhiniformes',
      family: 'Carcharhinidae',
      genus: 'Carcharhinus',
      species: 'Carcharhinus leucas',
      commonNames: 'Bull Shark'),
  SpeciesRecord(
      class_: 'Chondrichthyes',
      order: 'Carcharhiniformes',
      family: 'Carcharhinidae',
      genus: 'Carcharhinus',
      species: 'Carcharhinus sealei',
      commonNames: 'Blackspot Shark, Grey Reef Shark'),
  SpeciesRecord(
      class_: 'Chondrichthyes',
      order: 'Carcharhiniformes',
      family: 'Atelomycteridae',
      genus: 'Atelomycterus',
      species: 'Atelomycterus marmoratus',
      commonNames: 'Coral Catshark'),
  SpeciesRecord(
      class_: 'Chondrichthyes',
      order: 'Orectolobiformes',
      family: 'Hemiscyllidae',
      genus: 'Chiloscyllium',
      species: 'Chiloscyllium punctatum',
      commonNames: 'Brownbanded Bamboo Shark'),
  SpeciesRecord(
      class_: 'Chondrichthyes',
      order: 'Orectolobiformes',
      family: 'Hemiscyllidae',
      genus: 'Chiloscyllium',
      species: 'Chiloscyllium griseus',
      commonNames: 'Grey Bamboo Shark'),
  SpeciesRecord(
      class_: 'Chondrichthyes',
      order: 'Orectolobiformes',
      family: 'Hemiscyllidae',
      genus: 'Chiloscyllium',
      species: 'Chiloscyllium hasselti',
      commonNames: 'Indonesian Bamboo Shark'),
  SpeciesRecord(
      class_: 'Chondrichthyes',
      order: 'Rhinopristiformes',
      family: 'Rhinidae',
      genus: 'Rhynchobatus',
      species: 'Rhynchobatus australiae',
      commonNames: 'Whitespotted Guitarfish'),
  SpeciesRecord(
      class_: 'Chondrichthyes',
      order: 'Rhinopristiformes',
      family: 'Rhinobatidae',
      genus: 'Pseudobatos',
      species: 'Pseudobatos planiceps',
      commonNames: 'Pacific Shovelnose Ray'),
];

//SG fish classes
final classes = [
  SpeciesClassification(
      classification: 'Chondrichthyes',
      description: 'Non-bony sharks and rays'),
  SpeciesClassification(
      classification: 'Actinopterygii', description: 'Ray-finned fish'),
];

//SG fish orders sorted by class
final ordersActinopterygii = [
  SpeciesClassification(
      classification: 'Albuliformes', description: 'Bonefish'),
  SpeciesClassification(
      classification: 'Anabantiformes', description: 'Labyrinth Fishes'),
  SpeciesClassification(
      classification: 'Anguilliformes', description: 'True eels'),
  SpeciesClassification(
      classification: 'Atheriniformes', description: 'Silversides'),
  SpeciesClassification(
      classification: 'Aulopiformes', description: 'Lizardfishes'),
  SpeciesClassification(
      classification: 'Batrachoidiformes', description: 'Toadfishes'),
  SpeciesClassification(
      classification: 'Beloniformes',
      description: 'Needlefishes and Halfbeaks'),
  SpeciesClassification(
      classification: 'Blenniformes', description: 'Blennies'),
  SpeciesClassification(
      classification: 'Carangiformes',
      description:
          'Trevallies, Queenfishes, Scads, Pompanos, Remora, Cobia, Dolphinfish and Moonfish'),
  SpeciesClassification(classification: 'Characiformes', description: 'Tetras'),
  SpeciesClassification(
      classification: 'Cichliformes', description: 'Cichlids'),
  SpeciesClassification(
      classification: 'Clupeiformes ', description: 'Herrings and Anchovies'),
  SpeciesClassification(
      classification: 'Cypriniformes',
      description: 'Barbs, Carps and Algae Eater'),
  SpeciesClassification(
      classification: 'Cyprinodontiformes', description: 'Toothcarps'),
  SpeciesClassification(
      classification: 'Elopiformes', description: 'Tarpon and Ladyfish'),
  SpeciesClassification(
      classification: 'Gobiiformes', description: 'Gobies and Gudgeons'),
  SpeciesClassification(
      classification: 'Gonorynchiformes ', description: 'Milkfish'),
  SpeciesClassification(
      classification: 'Holocentriformes',
      description: 'Squirrelfishes and Soldierfishes'),
  SpeciesClassification(
      classification: 'Istiophoriformes',
      description: 'Barracudas, Marlins and Sailfishes'),
  SpeciesClassification(
      classification: 'Kurtiformes', description: 'Cardinalfishes'),
  SpeciesClassification(
      classification: 'Lepisosteiformes', description: 'Gars'),
  SpeciesClassification(
      classification: 'Lophiiformes', description: 'Frogfishes'),
  SpeciesClassification(classification: 'Mugiliformes', description: 'Mullets'),
  SpeciesClassification(
      classification: 'Ophidiiformes', description: 'Cuskeels and Brotulas'),
  SpeciesClassification(
      classification: 'Osteoglossiformes ',
      description: 'Arapaima, Arowana and Knifefish'),
  SpeciesClassification(
      classification: 'Pleuronectiformes', description: 'Flatfishes'),
  SpeciesClassification(
      classification: 'Perciformes',
      description:
          'Perches, Terapons, Grunters, Sweetlips, Croakers, Wrasses, Tuskfishes, Parrotfishes, Mojarras, Ponyfishes, Groupers, Emperors, Snappers, Breams, Sand-divers, Sandperches, Spadefishes, Sicklefish, Damselfishes, Whitings, Rabbitfishes, Tangs, Butterflyfishes, Angelfishes'),
  SpeciesClassification(
      classification: 'Scorpaeniformes',
      description:
          'Flatheads, Lionfishes, Scorpionfishes, Stonefishes, Waspfishes'),
  SpeciesClassification(
      classification: 'Siluriformes', description: 'Catfishes'),
  SpeciesClassification(
      classification: 'Scombriformes', description: 'Mackerels ands Tunas'),
  SpeciesClassification(
      classification: 'Synbranchiformes ',
      description: 'Swamp eels, Spiny eels and Mud eels'),
  SpeciesClassification(
      classification: 'Syngnathiformes',
      description:
          'Seahorses, Pipefishes, Seamoths, Razorfishes, Trumpetfishes and Cornetfishes'),
  SpeciesClassification(
      classification: 'Tetraodontiformes',
      description: 'Pufferfishes, Filefishes, Triggerfishes and Tripodfishes'),
];

final ordersChondrichthyes = [
  SpeciesClassification(
      classification: 'Carcharhiniformes',
      description: 'Reef sharks, Bull shark and Catshark'),
  SpeciesClassification(
      classification: 'Orectolobiformes', description: 'Bamboo Sharks'),
  SpeciesClassification(classification: 'Rajiformes', description: 'Stingrays'),
  SpeciesClassification(
      classification: 'Rhinopristiformes', description: 'Shovelnose Rays'),
  SpeciesClassification(
      classification: 'Torpediniformes', description: 'Electric Rays'),
];

//SG fish families sorted by order
final familyAlbuliformes = [
  SpeciesClassification(classification: 'Albulidae', description: 'Bonefish')
];
final familyAnabantiformes = [
  SpeciesClassification(
      classification: 'Anabantidae', description: 'Climbing Perch'),
  SpeciesClassification(classification: 'Channidae', description: 'Snakeheads'),
  SpeciesClassification(
      classification: 'Osphronemidae', description: 'Gouramis')
];
final familyAnguilliformes = [
  SpeciesClassification(classification: 'Muraenidae', description: 'Morays'),
  SpeciesClassification(
      classification: 'Muraenisocidae', description: 'Pike Congers'),
  SpeciesClassification(
      classification: 'Ophichthidae', description: 'Snake Eels')
];
final familyAtheriniformes = [
  SpeciesClassification(
      classification: 'Atherinidae', description: 'Silversides')
];
final familyAulopiformes = [
  SpeciesClassification(
      classification: 'Synodontidae', description: 'Lizardfishes')
];
final familyBatrachoidiformes = [
  SpeciesClassification(
      classification: 'Batrachoididae', description: 'Toadfishes')
];
final familyBeloniformes = [
  SpeciesClassification(
      classification: 'Belonidae', description: 'Needlefishes'),
  SpeciesClassification(
      classification: 'Hemiramphidae', description: 'Halfbeaks'),
  SpeciesClassification(
      classification: 'Zenarchopteridae', description: 'Viviparous Halfbeaks')
];
final familyBlenniformes = [
  SpeciesClassification(classification: 'Blennidae', description: 'Blennies')
];
final familyCarangiformes = [
  SpeciesClassification(
      classification: 'Carangidae', description: 'Trevallies, Scads, Pompano'),
  SpeciesClassification(
      classification: 'Coryphaenidae', description: 'Dolphinfish'),
  SpeciesClassification(classification: 'Echeneidae', description: 'Remora'),
  SpeciesClassification(classification: 'Menidae ', description: 'Moonfish'),
  SpeciesClassification(classification: 'Rachycentridae', description: 'Cobia'),
];
final familyCharaciformes = [
  SpeciesClassification(
      classification: 'Anostomidae', description: 'Leporinus'),
  SpeciesClassification(classification: 'Characidae', description: 'Tetra'),
  SpeciesClassification(classification: 'Serrasalmidae', description: 'Pacu'),
];
final familyCichliformes = [
  SpeciesClassification(classification: 'Cichlidae', description: 'Cichlids')
];
final familyClupeiformes = [
  SpeciesClassification(
      classification: 'Chirocentridae', description: 'Wolf Herrings'),
  SpeciesClassification(
      classification: 'Clupeidae', description: 'Sardines and Gizzard Shads'),
  SpeciesClassification(
      classification: 'Dussumieriidae', description: 'Rainbow Sardine'),
  SpeciesClassification(
      classification: 'Engraulidae', description: 'Anchovies and Thryssa'),
  SpeciesClassification(
      classification: 'Pristigasteridae', description: 'Ilishas')
];
final familyCypriniformes = [
  SpeciesClassification(
      classification: 'Cyprinidae', description: 'Carps and Barbs'),
  SpeciesClassification(
      classification: 'Gyrinocheilidae', description: 'Algae Eater')
];
final familyCyprinodontiformes = [
  SpeciesClassification(
      classification: 'Aplocheilidae', description: 'Panchax and Killifishes'),
  SpeciesClassification(
      classification: 'Poeciliidae',
      description: 'Mosquitofishes, Guppy, Swordtail, Mollies, Platyfishes'),
];
final familyElopiformes = [
  SpeciesClassification(
      classification: 'Elopidae', description: 'Giant Herrings'),
  SpeciesClassification(classification: 'Megalopidae', description: 'Tarpons')
];
final familyGobiiformes = [
  SpeciesClassification(classification: 'Eleotridae', description: 'Gudgeons'),
  SpeciesClassification(classification: 'Gobiidae', description: 'Gobies'),
  SpeciesClassification(
      classification: 'Ptereleotridae', description: 'Dartfish')
];
final familyGonorynchiformes = [
  SpeciesClassification(classification: 'Chanidae', description: 'Milkfish')
];
final familyHolocentriformes = [
  SpeciesClassification(
      classification: 'Holocentridae',
      description: 'Squirrelfish and Soldierfish')
];
final familyIstiophoriformes = [
  SpeciesClassification(
      classification: 'Istiophoridae', description: 'Marlins and Sailfish'),
  SpeciesClassification(
      classification: 'Sphyraenidae', description: 'Barracudas'),
];
final familyKurtiformes = [
  SpeciesClassification(
      classification: 'Apogonidae', description: 'Cardinalfishes')
];
final familyLepisosteiformes = [
  SpeciesClassification(classification: 'Lepisosteidae', description: 'Gars')
];
final familyLophiiformes = [
  SpeciesClassification(
      classification: 'Antennariidae', description: 'Frogfishes')
];
final familyMugiliformes = [
  SpeciesClassification(classification: 'Mugilidae', description: 'Mullets')
];
final familyOphidiiformes = [
  SpeciesClassification(
      classification: 'Blythitidae', description: 'Viviparous Brotulas')
];
final familyOsteoglossiformes = [
  SpeciesClassification(classification: 'Arapaimidae', description: 'Arapaima'),
  SpeciesClassification(
      classification: 'Gymnarchidae', description: 'Electric Knifefish'),
  SpeciesClassification(
      classification: 'Notopteridae', description: 'Knifefishes'),
  SpeciesClassification(
      classification: 'Osteoglossidae', description: 'Arowanas'),
];
final familyPleuronectiformes = [
  SpeciesClassification(
      classification: 'Bothidae', description: 'Largescale Flounder'),
  SpeciesClassification(
      classification: 'Cynoglossidae', description: 'Tongue Soles'),
  SpeciesClassification(
      classification: 'Paralichthyidae', description: 'Flounders'),
  SpeciesClassification(classification: 'Psettodidae', description: 'Halibuts'),
  SpeciesClassification(classification: 'Soleidae', description: 'True Soles'),
];
final familyPerciformes = [
  SpeciesClassification(
      classification: 'Acanthuridae', description: 'Surgeonfish and Tangs'),
  SpeciesClassification(
      classification: 'Centrogenyidae', description: 'False Scorpionfish'),
  SpeciesClassification(
      classification: 'Chaetodonidae', description: 'Butterflyfishes'),
  SpeciesClassification(
      classification: 'Drepaneidae', description: 'Sicklefish'),
  SpeciesClassification(
      classification: 'Ephippidae', description: 'Spadefishes'),
  SpeciesClassification(classification: 'Gerreidae', description: 'Mojarras'),
  SpeciesClassification(classification: 'Haemulidae', description: 'Grunters'),
  SpeciesClassification(classification: 'Labridae', description: 'Wrasses'),
  SpeciesClassification(
      classification: 'Leiognathidae', description: 'Ponyfishes'),
  SpeciesClassification(classification: 'Lethrinidae', description: 'Emperors'),
  SpeciesClassification(classification: 'Lutjanidae', description: 'Snappers'),
  SpeciesClassification(classification: 'Nemipteridae', description: 'Breams'),
  SpeciesClassification(
      classification: 'Pinguipedidae', description: 'Sandperches'),
  SpeciesClassification(
      classification: 'Pomacanthidae', description: 'Saltwater Angelfishes'),
  SpeciesClassification(
      classification: 'Pomacentridae', description: 'Damselfishes'),
  SpeciesClassification(
      classification: 'Scaridae', description: 'Parrotfishes'),
  SpeciesClassification(classification: 'Sciaenidae ', description: 'Croakers'),
  SpeciesClassification(classification: 'Serranidae', description: 'Groupers'),
  SpeciesClassification(
      classification: 'Siganidae', description: 'Rabbitfishes'),
  SpeciesClassification(
      classification: 'Sillaginidae', description: 'Sand Whitings'),
  SpeciesClassification(
      classification: 'Terapontidae', description: 'Terapons and Perches'),
  SpeciesClassification(
      classification: 'Trichonotidae', description: 'Sand-divers'),
];
final familyScorpaeniformes = [
  SpeciesClassification(
      classification: 'Platycephalidae', description: 'Flatheads'),
  SpeciesClassification(
      classification: 'Scorpaenidae',
      description: 'Scorpionfishes and Lionfishes'),
  SpeciesClassification(
      classification: 'Synanceiidae', description: 'Stingers and Stonefishes'),
  SpeciesClassification(classification: 'Tetrarogidae', description: 'Waspfish')
];
final familySiluriformes = [
  SpeciesClassification(
      classification: 'Ariidae', description: 'Sea Catfishes'),
  SpeciesClassification(
      classification: 'Bagridae', description: 'Bagrid Catfishes'),
  SpeciesClassification(
      classification: 'Clariidae', description: 'Walking Catfishes'),
  SpeciesClassification(
      classification: 'Claroteidae', description: 'Nile Golden Catfish'),
  SpeciesClassification(classification: 'Loricariidae', description: 'Plecos'),
  SpeciesClassification(
      classification: 'Mochokidae', description: 'Featherfin Squeaker'),
  SpeciesClassification(
      classification: 'Pangasiidae', description: 'Patin, Chao Phraya Catfish'),
  SpeciesClassification(
      classification: 'Pimelodidae', description: 'Redtailed Catfish'),
  SpeciesClassification(
      classification: 'Plotosidae', description: 'Eeltail Catfishes'),
];
final familyScombriformes = [
  SpeciesClassification(
      classification: 'Scombridae', description: 'Mackerels and Tunas')
];
final familySynbranchiformes = [
  SpeciesClassification(
      classification: 'Mastacembelidae', description: 'Spiny Eels'),
  SpeciesClassification(
      classification: 'Synbranchidae', description: 'Swamp Eels'),
];
final familySyngnathiformes = [
  SpeciesClassification(
      classification: 'Aulostomidae', description: 'Trumpetfish'),
  SpeciesClassification(
      classification: 'Centriscidae', description: 'Razorfish'),
  SpeciesClassification(
      classification: 'Fistulariidae', description: 'Cornetfish'),
  SpeciesClassification(classification: 'Pegasidae', description: 'Seamoth'),
  SpeciesClassification(
      classification: 'Syngnathidae', description: 'Pipefishes and Seahorses')
];
final familyTetraodontiformes = [
  SpeciesClassification(
      classification: 'Balistidae', description: 'Triggerfishes'),
  SpeciesClassification(
      classification: 'Diodontidae', description: 'Porcupine Puffers'),
  SpeciesClassification(
      classification: 'Monacanthidae', description: 'Filefishes'),
  SpeciesClassification(
      classification: 'Tetraodontidae', description: 'Puffers'),
  SpeciesClassification(
      classification: 'Triacanthidae', description: 'Tripodfishes')
];
final familyCarcharhiniformes = [
  SpeciesClassification(
      classification: 'Atelomycteridae', description: 'Catshark'),
  SpeciesClassification(
      classification: 'Carcharhinidae',
      description: 'Reef Sharks and Bull Shark'),
];
final familyOrectolobiformes = [
  SpeciesClassification(
      classification: 'Hemiscyllidae', description: 'Bamboo sharks')
];
final familyRajiformes = [
  SpeciesClassification(
      classification: 'Aetobatidae', description: 'Eagle Ray'),
  SpeciesClassification(
      classification: 'Dasyatidae', description: 'Saltwater Stingrays'),
  SpeciesClassification(
      classification: 'Potamotrygonidae', description: 'Motoro Ray'),
];
final familyRhinopristiformes = [
  SpeciesClassification(
      classification: 'Rhinobatidae', description: 'Shovelnose Ray'),
  SpeciesClassification(classification: 'Rhinidae', description: 'Guitarfish'),
];
final familyTorpediniformes = [
  SpeciesClassification(classification: 'Narkidae', description: 'Electric Ray')
];

//SG fish genuses sorted by family
final genusAetobatidae = [
  SpeciesClassification(
      classification: 'Aetobatus', description: 'Spotted Eagle Ray'),
];
final genusAlbulidae = [
  SpeciesClassification(classification: 'Albula', description: 'Bonefish')
];
final genusAnabantidae = [
  SpeciesClassification(classification: 'Anabas', description: 'Climbing Perch')
];
final genusAnostomidae = [
  SpeciesClassification(classification: 'Leporinus', description: 'Leporinus')
];
final genusAntennariidae = [
  SpeciesClassification(classification: 'Antennarius', description: ''),
  SpeciesClassification(
      classification: 'Lophiocharon', description: 'Spotted-tail Frogfish'),
];
final genusAplocheilidae = [
  SpeciesClassification(classification: 'Aplocheilus', description: 'Panchax')
];
final genusApogonidae = [
  SpeciesClassification(
      classification: 'Apogon',
      description: 'Ruby Cardinalfish, Flame Cardinalfish'),
  SpeciesClassification(
      classification: 'Apogonichthyoides',
      description:
          'Black Cardinalfish, Timor Cardinalfish, Blackfin Cardinalfish'),
  SpeciesClassification(
      classification: 'Archamia', description: 'Gon’s Cardinalfish'),
  SpeciesClassification(
      classification: 'Cheilodipterus', description: 'Toothy Cardinalfishes'),
  SpeciesClassification(
      classification: 'Fibramia',
      description:
          'Ambon Cardinalfish, Humpbacked Cardinalfish, Masked Cardinalfish'),
  SpeciesClassification(
      classification: 'Fowleria',
      description: 'Crosseyed Cardinalfish, Variegated Cardinalfish'),
  SpeciesClassification(
      classification: 'Jaydia',
      description: 'Flat-tail Cardinalfish, Tenlined Cardinalfish'),
  SpeciesClassification(
      classification: 'Lepidamia', description: 'Pinstriped Cardinalfish'),
  SpeciesClassification(
      classification: 'Nectamia',
      description: 'Samoan Cardinalfish, Similar Cardinalfish'),
  SpeciesClassification(
      classification: 'Ostorhinchus', description: 'Other Cardinalfishes'),
  SpeciesClassification(
      classification: 'Pristiapogon', description: 'Bridled Cardinalfish'),
  SpeciesClassification(
      classification: 'Pristicon',
      description: 'Redfin Cardinalfish, Threespot Cardinalfish'),
  SpeciesClassification(
      classification: 'Pseudamia', description: 'Whitejawed Cardinalfish'),
  SpeciesClassification(
      classification: 'Rhabdamia', description: 'Slender Cardinalfish'),
  SpeciesClassification(
      classification: 'Siphamia', description: 'Urchin Cardinalfish'),
  SpeciesClassification(
      classification: 'Sphaeramia',
      description: 'Orbicular Cardinalfish, Pyjama Cardinalfish'),
  SpeciesClassification(
      classification: 'Taeniamia',
      description: 'Orangelined Cardinalfish, Duskytail Cardinalfish'),
  SpeciesClassification(
      classification: 'Yarica', description: 'Mangrove Cardinalfish')
];
final genusArapaimidae = [
  SpeciesClassification(classification: 'Arapaima', description: 'Arapaima')
];
final genusAriidae = [
  SpeciesClassification(
      classification: 'Arius',
      description: 'Gagora Catfish, Lowly Sea Catfish'),
  SpeciesClassification(
      classification: 'Hemiarius', description: 'Sona Sea Catfish'),
  SpeciesClassification(
      classification: 'Hexanematichthys', description: 'Sagor Catfish'),
  SpeciesClassification(
      classification: 'Netuma',
      description: 'Bronze Catfish, Giant Salmon Catfish'),
  SpeciesClassification(
      classification: 'Plicofollis',
      description: 'Shieldhead Catfish, Longsnouted Catfish'),
  SpeciesClassification(
      classification: 'Osteogeneiosus', description: 'Soldier Catfish'),
];
final genusAtelomycteridae = [
  SpeciesClassification(
      classification: 'Atelomycterus ', description: 'Coral Catshark'),
];
final genusAtherinidae = [
  SpeciesClassification(
      classification: 'Atherinomorus',
      description: 'Widebanded Hardyhead Silverside'),
  SpeciesClassification(
      classification: 'Doboatherina', description: 'Tropical Silverside'),
  SpeciesClassification(
      classification: 'Hypoatherina', description: 'Sumatran Silverside'),
];
final genusAulostomidae = [
  SpeciesClassification(
      classification: 'Aulostomus', description: 'Trumpetfish'),
];
final genusBagridae = [
  SpeciesClassification(
      classification: 'Hemibagrus',
      description: 'Malayan River Catfish, Asian Redtailed Catfish'),
  SpeciesClassification(
      classification: 'Mystus', description: 'Estuarine Catfish, Baung')
];
final genusBalistidae = [
  SpeciesClassification(
      classification: 'Abalistes', description: 'Starry Triggerfish'),
  SpeciesClassification(
      classification: 'Balistapus', description: 'Orangelined Triggerfish'),
  SpeciesClassification(
      classification: 'Balistoides', description: 'Titan Triggerfish'),
];
final genusBatrachoididae = [
  SpeciesClassification(
      classification: 'Batrachomoeus', description: 'Toadfish')
];
final genusBelonidae = [
  SpeciesClassification(
      classification: 'Ablennes', description: 'Flat Needlefish'),
  SpeciesClassification(
      classification: 'Strongylura', description: 'Other Needlefishes'),
  SpeciesClassification(
      classification: 'Tylosurus', description: 'Hound Needlefish'),
];
final genusBlennidae = [
  SpeciesClassification(
      classification: 'Entomacrodus',
      description: 'Stellar Rockskipper, Blackspotted Rockskipper'),
  SpeciesClassification(
      classification: 'Istiblennius', description: 'Streaky Rockskipper'),
  SpeciesClassification(
      classification: 'Omobranchus', description: 'Crested Oyster Blenny'),
  SpeciesClassification(
      classification: 'Petroscirtes',
      description: 'Variable Sabretooth Blenny'),
];
final genusBlythitidae = [
  SpeciesClassification(
      classification: 'Alionematichthys ', description: 'Bigeye Cuskeel'),
  SpeciesClassification(
      classification: 'Dinematichthys', description: 'Yellow Cuskeel'),
  SpeciesClassification(
      classification: 'Ungusurculus', description: 'Riau Viviparous Brotula'),
];
final genusBothidae = [
  SpeciesClassification(
      classification: 'Engyprosopon', description: 'Largescale Flounder'),
];
final genusCarangidae = [
  SpeciesClassification(
      classification: 'Alectis', description: 'African Pompano'),
  SpeciesClassification(classification: 'Alepes', description: 'Other Scads'),
  SpeciesClassification(
      classification: 'Atropus',
      description:
          'Cleftbelly Trevally, Longfin Trevally, Bumpnose Trevally, Longrakered Trevally'),
  SpeciesClassification(
      classification: 'Atule', description: 'Yellowtail Scad'),
  SpeciesClassification(
      classification: 'Carangoides', description: 'Brownback Trevally'),
  SpeciesClassification(
      classification: 'Caranx',
      description: 'Bigeye Trevally, Giant Trevally, Bluefin Trevally'),
  SpeciesClassification(
      classification: 'Decapterus', description: 'Indian Scad, Mackerel Scad'),
  SpeciesClassification(
      classification: 'Platycaranx',
      description: 'Longnose Trevally, Imposter Trevally, Malabar trevally'),
  SpeciesClassification(
      classification: 'Scomberoides', description: 'Queenfishes'),
  SpeciesClassification(
      classification: 'Scyris', description: 'Diamond Trevally'),
  SpeciesClassification(
      classification: 'Selar', description: 'Oxeye Scad, Bigeye Scad'),
  SpeciesClassification(
      classification: 'Selaroides', description: 'Yellowstripe Scad'),
  SpeciesClassification(classification: 'Trachinotus', description: 'Pompanos'),
  SpeciesClassification(
      classification: 'Turrum',
      description: 'Goldspotted Trevally, Onion Trevally'),
];
final genusCentrogenyidae = [
  SpeciesClassification(
      classification: 'Centrogenys', description: 'False Scorpionfish'),
];
final genusChaetodonidae = [
  SpeciesClassification(
      classification: 'Parachaetodon', description: 'Kite Butterflyfish'),
  SpeciesClassification(
      classification: 'Chaetodon', description: 'Eightbanded Butterflyfish'),
  SpeciesClassification(
      classification: 'Chelmon', description: 'Copperbanded Butterflyfish'),
];
final genusChanidae = [
  SpeciesClassification(classification: 'Chanos', description: 'Milkfish')
];
final genusChannidae = [
  SpeciesClassification(classification: 'Channa', description: 'Snakeheads')
];
final genusCharacidae = [
  SpeciesClassification(
      classification: 'Hemigrammus', description: 'Golden Tetra')
];
final genusCarcharhinidae = [
  SpeciesClassification(
      classification: 'Carcharhinus', description: 'Reef Sharks, Bull Shark'),
];
final genusChirocentridae = [
  SpeciesClassification(
      classification: 'Chirocentrus', description: 'Wolf Herrings')
];
final genusCichlidae = [
  SpeciesClassification(
      classification: 'Acarichthys', description: 'Threadfin Acara'),
  SpeciesClassification(
      classification: 'Amphilophus',
      description: 'Trimac Cichlid, Midas Cichlid, Red Devil Cichlid'),
  SpeciesClassification(
      classification: 'Cichla', description: 'Peacock Basses'),
  SpeciesClassification(
      classification: 'Etroplus', description: 'Green Chromide'),
  SpeciesClassification(
      classification: 'Geophagus', description: 'Red-lined Eartheater'),
  SpeciesClassification(
      classification: 'Heterotilapia', description: 'Zebra Tilapia'),
  SpeciesClassification(
      classification: 'Mayaheros', description: 'Mayan Cichlid'),
  SpeciesClassification(
      classification: 'Oreochromis', description: 'Other Tilapias'),
  SpeciesClassification(
      classification: 'Parachromis ', description: 'Jaguar Cichlid'),
  SpeciesClassification(
      classification: 'Satanoperca', description: 'Demon Eartheater'),
  SpeciesClassification(classification: 'Uaru', description: 'Uaru Cichlid'),
  SpeciesClassification(
      classification: 'Vieja', description: 'Redhead Cichlid'),
];
final genusClariidae = [
  SpeciesClassification(
      classification: 'Clarias', description: 'Walking Catfishes')
];
final genusClaroteidae = [
  SpeciesClassification(
      classification: 'Chrysichthys', description: 'Nile Golden Catfish')
];
final genusClupeidae = [
  SpeciesClassification(
      classification: 'Amblygaster', description: 'Spotted Sardine'),
  SpeciesClassification(
      classification: 'Anodontosoma', description: 'Chacunda Gizzard Shad'),
  SpeciesClassification(
      classification: 'Herklotsichthys', description: 'Blacksaddle Herring'),
  SpeciesClassification(classification: 'Hilsa', description: 'Kelee Shad'),
  SpeciesClassification(
      classification: 'Nematalosa',
      description: 'Galathea Gizzard Shad, Bloch’s Gizzard Shad'),
  SpeciesClassification(
      classification: 'Sardinella', description: 'Sardinellas'),
];
final genusCoryphaenidae = [
  SpeciesClassification(classification: 'Coryphaena', description: 'Dolphin'),
];
final genusCynoglossidae = [
  SpeciesClassification(classification: 'Cynoglossus', description: ''),
  SpeciesClassification(
      classification: 'Paraplagusia', description: 'Tongue Soles'),
  SpeciesClassification(classification: 'Plagusia', description: ''),
];
final genusCyprinidae = [
  SpeciesClassification(
      classification: 'Barbodes',
      description: 'Saddle Barb, Indochinese Spotted Barb'),
  SpeciesClassification(
      classification: 'Barbonymus', description: 'Tinfoil Barbs'),
  SpeciesClassification(
      classification: 'Brachydanio', description: 'Pearl Danio'),
  SpeciesClassification(classification: 'Carassius', description: 'Goldfish'),
  SpeciesClassification(
      classification: 'Ctenopharyngodon', description: 'Grass Carp'),
  SpeciesClassification(
      classification: 'Cyclocheilichthys', description: 'Beardless Barb'),
  SpeciesClassification(
      classification: 'Cyprinus', description: 'Common Carp, Amur Carp'),
  SpeciesClassification(
      classification: 'Desmopuntius', description: 'Sixbanded Tiger Barb'),
  SpeciesClassification(classification: 'Hampala', description: 'Hampala Barb'),
  SpeciesClassification(
      classification: 'Hypophthalmichthys',
      description: 'Bighead Carp, Silver Carp'),
  SpeciesClassification(classification: 'Labeo', description: 'Rohu'),
  SpeciesClassification(
      classification: 'Leptobarbus', description: 'Sultan Fish'),
  SpeciesClassification(
      classification: 'Osteochilus', description: 'Bonylip Barb'),
  SpeciesClassification(
      classification: 'Puntigrus',
      description: 'Fourbanded Tiger Barb, Fivebanded Tiger Barb'),
  SpeciesClassification(
      classification: 'Puntius', description: 'Spotfin Swamp Barb'),
  SpeciesClassification(
      classification: 'Rasbora', description: 'Other Rasboras'),
  SpeciesClassification(
      classification: 'Striuntius', description: 'Spanner Barb'),
  SpeciesClassification(classification: 'Tor', description: 'Mahseers'),
  SpeciesClassification(
      classification: 'Toxabramis', description: 'Sharpbelly'),
  SpeciesClassification(
      classification: 'Trigonostigma', description: 'Harlequin Rasbora'),
];
final genusDasyatidae = [
  SpeciesClassification(
      classification: 'Brevitrygon',
      description: 'Dwarf Whipray, Dwarf Mangrove Whipray'),
  SpeciesClassification(
      classification: 'Himantura', description: 'Other Whiprays'),
  SpeciesClassification(
      classification: 'Neotrygon', description: 'Kuhl’s Maskray'),
  SpeciesClassification(
      classification: 'Pastinachus', description: 'Cowtail Ray'),
  SpeciesClassification(
      classification: 'Taeniura', description: 'Bluespotted Ribbontail Ray'),
];
final genusDiodontidae = [
  SpeciesClassification(
      classification: 'Cyclichthys', description: 'Burrfishes'),
  SpeciesClassification(
      classification: 'Diodon', description: 'Porcupinefishes'),
];
final genusDrepaneidae = [
  SpeciesClassification(classification: 'Drepane', description: 'Sicklefish'),
];
final genusDussumieriidae = [
  SpeciesClassification(
      classification: 'Dussumieria', description: 'Slender Rainbow Sardine')
];
final genusEcheneidae = [
  SpeciesClassification(classification: 'Echeneis', description: 'Remora'),
];
final genusEleotridae = [
  SpeciesClassification(
      classification: 'Butis',
      description: 'Mudsleeper, Olive Flathead Gudgeon, Duckbill Sleeper'),
  SpeciesClassification(
      classification: 'Ophiocara', description: 'Spangled Gudgeon'),
  SpeciesClassification(
      classification: 'Oxyeleotris', description: 'Marbled Goby'),
];
final genusElopidae = [
  SpeciesClassification(classification: 'Elops', description: 'Ladyfish')
];
final genusEngraulidae = [
  SpeciesClassification(
      classification: 'Coilia', description: 'Grenadier Anchovies'),
  SpeciesClassification(
      classification: 'Encrasicholina',
      description: 'Shorthead Anchovy, Buccaneer Anchovy'),
  SpeciesClassification(
      classification: 'Setipinna', description: 'Scaly Hairfin Anchovy'),
  SpeciesClassification(
      classification: 'Stolephorus', description: 'Other Anchovies'),
  SpeciesClassification(classification: 'Thryssa', description: 'Thryssas'),
];
final genusEphippidae = [
  SpeciesClassification(classification: 'Ephippus', description: 'Orbfish'),
  SpeciesClassification(classification: 'Platax', description: 'Batfishes'),
];
final genusFistulariidae = [
  SpeciesClassification(
      classification: 'Fistularia', description: 'Cornetfish'),
];
final genusGerreidae = [
  SpeciesClassification(classification: 'Gerres', description: 'Mojarras'),
];
final genusGobiidae = [
  SpeciesClassification(
      classification: 'Acentrogobius', description: 'Mangrove Gobies'),
  SpeciesClassification(
      classification: 'Amblyeleotris',
      description: 'Masked Shrimpgoby, Giant Shrimpgoby'),
  SpeciesClassification(
      classification: 'Amblygobius ',
      description: 'Head-stripe Goby. Buan goby'),
  SpeciesClassification(classification: 'Amoya', description: ''),
  SpeciesClassification(classification: 'Arcygobius', description: ''),
  SpeciesClassification(
      classification: 'Bathygobius', description: 'Frillfin Gobies'),
  SpeciesClassification(
      classification: 'Boleophthalmus', description: 'Bluespotted Mudskipper'),
  SpeciesClassification(
      classification: 'Brachygobius', description: 'Bumbleebee Gobies'),
  SpeciesClassification(
      classification: 'Cryptocentroides', description: 'Insignia Shrimpgoby'),
  SpeciesClassification(
      classification: 'Cryptocentrus', description: 'Other Shrimpgobies'),
  SpeciesClassification(classification: 'Drombus', description: ''),
  SpeciesClassification(classification: 'Eugnathogobius', description: ''),
  SpeciesClassification(classification: 'Eviota', description: ''),
  SpeciesClassification(
      classification: 'Favonigobius', description: 'Sand Gobies'),
  SpeciesClassification(
      classification: 'Glossogobius',
      description: 'Golden Flathead Goby, Tank Goby'),
  SpeciesClassification(
      classification: 'Gobiodon', description: 'Broadbarred Acropora Goby'),
  SpeciesClassification(
      classification: 'Gobiopterus', description: 'Glass Gobies'),
  SpeciesClassification(classification: 'Hemigobius', description: ''),
  SpeciesClassification(
      classification: 'Istigobius', description: 'Lagoon Gobies'),
  SpeciesClassification(classification: 'Macrodontogobius', description: ''),
  SpeciesClassification(
      classification: 'Mahidolia', description: 'Flagfin Shrimpgoby'),
  SpeciesClassification(classification: 'Mugilogobius', description: ''),
  SpeciesClassification(
      classification: 'Myersina',
      description: 'Yellowspotted Shrimpgoby, Blacklined Shrimpgoby'),
  SpeciesClassification(classification: 'Oplopomus', description: ''),
  SpeciesClassification(classification: 'Pandaka ', description: ''),
  SpeciesClassification(
      classification: 'Periophthalmodon', description: 'Giant Mudskipper'),
  SpeciesClassification(
      classification: 'Periophthalmus', description: 'Other Mudskippers'),
  SpeciesClassification(classification: 'Priolepis', description: ''),
  SpeciesClassification(
      classification: 'Psammogobius', description: 'Sleepy Goby'),
  SpeciesClassification(
      classification: 'Pseudapocryptes', description: 'Elongated Mudskipper'),
  SpeciesClassification(
      classification: 'Pseudogobiopsis', description: 'Bigmouth Stream Goby'),
  SpeciesClassification(
      classification: 'Pseudogobius ', description: 'Fat Nose Gobies'),
  SpeciesClassification(classification: 'Redigobius', description: ''),
  SpeciesClassification(
      classification: 'Rhinogobius', description: 'Barcheek River Goby'),
  SpeciesClassification(
      classification: 'Scartelaos', description: 'Bearded Mudskipper'),
  SpeciesClassification(classification: 'Silhouettea', description: ''),
  SpeciesClassification(
      classification: 'Stigmatogobius', description: 'Knight Gobies'),
  SpeciesClassification(classification: 'Tomiyamichthys', description: ''),
  SpeciesClassification(
      classification: 'Trypauchen', description: 'Pink Mud Goby'),
  SpeciesClassification(
      classification: 'Valenciennea ',
      description: 'Diamond Watchman Goby, Mural Goby'),
  SpeciesClassification(
      classification: 'Yongeichthys', description: 'Shadow Goby'),
];
final genusGymnarchidae = [
  SpeciesClassification(
      classification: 'Gymnarchus', description: 'African Knifefish')
];
final genusGyrinocheilidae = [
  SpeciesClassification(
      classification: 'Gyrinocheilus', description: 'Chinese Algae Eater')
];
final genusHaemulidae = [
  SpeciesClassification(classification: 'Pomadasys', description: 'Grunters'),
  SpeciesClassification(
      classification: 'Plectorhinchus', description: 'Other Sweetlips'),
  SpeciesClassification(
      classification: 'Diagramma', description: 'Painted Sweetlips')
];
final genusHemiramphidae = [
  SpeciesClassification(
      classification: 'Hemiramphus', description: 'Blackbarred Halfbeak'),
  SpeciesClassification(
      classification: 'Hyporhamphus',
      description: 'Quoy’s Halfbeak, Congaturi Halfbeak'),
  SpeciesClassification(classification: 'Euleptorhamphus', description: '')
];
final genusHemiscyllidae = [
  SpeciesClassification(
      classification: 'Chiloscyllium', description: 'Bamboo Sharks'),
];
final genusHolocentridae = [
  SpeciesClassification(
      classification: 'Myripristis', description: 'Soldierfishes'),
  SpeciesClassification(
      classification: 'Sargocentron', description: 'Squirrelfishes'),
];
final genusIstiophoridae = [
  SpeciesClassification(
      classification: 'Istiompax ', description: 'Black Marlin'),
  SpeciesClassification(classification: 'Istiophorus', description: 'Sailfish'),
];
final genusLabridae = [
  SpeciesClassification(
      classification: 'Anampses', description: 'Spotted Wrasse'),
  SpeciesClassification(
      classification: 'Cheilinus', description: 'Maori Wrasses, Floral Wrasse'),
  SpeciesClassification(classification: 'Cheilio', description: 'Cigar Wrasse'),
  SpeciesClassification(classification: 'Choerodon', description: 'Tuskfish'),
  SpeciesClassification(
      classification: 'Halichoeres', description: 'Other Wrasses'),
  SpeciesClassification(
      classification: 'Hemigymnus', description: 'Half-and-Half Wrasse'),
  SpeciesClassification(
      classification: 'Oxycheilinus', description: 'Cheeklined Wrasse'),
  SpeciesClassification(
      classification: 'Thalassoma', description: 'Moon Wrasse'),
  SpeciesClassification(
      classification: 'Pteragogus', description: 'Weedy Wrasse'),
];
final genusLeiognathidae = [
  SpeciesClassification(
      classification: 'Aurigequula',
      description: 'Striped Ponyfish, Longspine Ponyfish'),
  SpeciesClassification(
      classification: 'Deveximentum', description: 'Pugnose Ponyfish'),
  SpeciesClassification(
      classification: 'Equulites', description: 'Whipfin Ponyfish'),
  SpeciesClassification(
      classification: 'Eubleekeria',
      description: 'Jones’ Ponyfish, Splendid Ponyfish'),
  SpeciesClassification(classification: 'Gazza', description: 'Toothpony'),
  SpeciesClassification(
      classification: 'Karalla', description: 'Goldstriped Ponyfish'),
  SpeciesClassification(
      classification: 'Leiognathus', description: 'Common Ponyfish'),
  SpeciesClassification(
      classification: 'Nuchequula', description: 'Decorated Ponyfish'),
  SpeciesClassification(classification: 'Photolateralis', description: ''),
  SpeciesClassification(classification: 'Photopectoralis', description: ''),
];
final genusLepisosteidae = [
  SpeciesClassification(
      classification: 'Atractosteus', description: 'Alligator Gar'),
  SpeciesClassification(
      classification: 'Lepisosteus', description: 'Spotted Gar'),
];
final genusLethrinidae = [
  SpeciesClassification(classification: 'Lethrinus', description: 'Emperors'),
];
final genusLoricariidae = [
  SpeciesClassification(
      classification: 'Pterygoplichthys', description: 'Plecos')
];
final genusLutjanidae = [
  SpeciesClassification(classification: 'Lutjanus', description: 'Snappers'),
];
final genusMastacembelidae = [
  SpeciesClassification(
      classification: 'Macrognathus', description: 'Spiny Eels')
];
final genusMegalopidae = [
  SpeciesClassification(classification: 'Megalops', description: 'Tarpon')
];
final genusMenidae = [
  SpeciesClassification(classification: 'Mene', description: 'Moonfish'),
];
final genusMochokidae = [
  SpeciesClassification(
      classification: 'Synodontis', description: 'Featherfin Squeaker')
];
final genusMonacanthidae = [
  SpeciesClassification(
      classification: 'Acreichthys', description: 'Seagrass Filefish'),
  SpeciesClassification(
      classification: 'Aluterus', description: 'Scrawled Filefish'),
  SpeciesClassification(
      classification: 'Anacanthus', description: 'Bearded Filefish'),
  SpeciesClassification(
      classification: 'Chaetodermis', description: 'Feathery Filefish'),
  SpeciesClassification(
      classification: 'Monacanthus', description: 'Fan-bellied Filefish'),
  SpeciesClassification(
      classification: 'Paramonacanthus',
      description: 'Pig-faced Leatherjacket'),
  SpeciesClassification(
      classification: 'Pseudomonacanthus', description: 'Strapweed Filefish'),
];
final genusMugilidae = [
  SpeciesClassification(
      classification: 'Ellochelon', description: 'Diamondscale Mullet'),
  SpeciesClassification(
      classification: 'Mugil', description: 'Flathead Grey Mullet'),
  SpeciesClassification(
      classification: 'Osteomugil', description: 'Longfin Mullet'),
  SpeciesClassification(
      classification: 'Planiliza', description: 'Greenback Mullet'),
  SpeciesClassification(
      classification: 'Valamugil', description: 'Bluespot Mullet'),
];
final genusMuraenidae = [
  SpeciesClassification(
      classification: 'Diaphenchelys', description: 'Dalmatian Moray'),
  SpeciesClassification(
      classification: 'Gymnothorax', description: 'Other Morays'),
  SpeciesClassification(
      classification: 'Strophidon',
      description:
          'Gangetic Moray, Slender Giant Moray, Four-pored Slender Giant Moray, Longback Moray'),
];
final genusMuraenisocidae = [
  SpeciesClassification(
      classification: 'Congresox',
      description: 'Yellow Pike Conger, Indian Pike Conger'),
  SpeciesClassification(
      classification: 'Muraenesox',
      description: 'Common Pike Conger, Daggertooth Pike Conger')
];
final genusNarkidae = [
  SpeciesClassification(
      classification: 'Temera', description: 'Hardwicke’s Electric Ray'),
];
final genusNemipteridae = [
  SpeciesClassification(
      classification: 'Nemipterus', description: 'Threadfin Breams'),
  SpeciesClassification(classification: 'Pentapodus', description: 'Whiptails'),
  SpeciesClassification(
      classification: 'Scolopsis', description: 'Monocle Breams'),
];
final genusNotopteridae = [
  SpeciesClassification(
      classification: 'Chitala',
      description: 'Clown Knifefish, Royal Knifefish'),
  SpeciesClassification(
      classification: 'Notopterus', description: 'Bronze Knifefish'),
];
final genusOphichthidae = [
  SpeciesClassification(
      classification: 'Ophichthus', description: 'Evermann’s Snake Eel'),
  SpeciesClassification(
      classification: 'Pisodonophis',
      description: 'Mangrove Snake Eel, Longfin Snake Eel'),
  SpeciesClassification(
      classification: 'Scolecenchelys', description: 'Worm Eels'),
];
final genusOsphronemidae = [
  SpeciesClassification(classification: 'Betta', description: 'Bettas'),
  SpeciesClassification(
      classification: 'Osphronemus ', description: 'Giant Gourami'),
  SpeciesClassification(
      classification: 'Trichopodus', description: 'Threespot Gourami'),
  SpeciesClassification(
      classification: 'Trichopsis',
      description: 'Croaking Gourami, Sparkling Gourami')
];
final genusOsteoglossidae = [
  SpeciesClassification(
      classification: 'Osteoglossum', description: 'Silver Arowana'),
  SpeciesClassification(
      classification: 'Scleropages', description: 'Asian Arowana, Saratoga'),
];
final genusPangasiidae = [
  SpeciesClassification(classification: 'Pangasianodon', description: 'Patin'),
  SpeciesClassification(
      classification: 'Pangasius', description: 'Chao Phraya Catfish'),
];
final genusParalichthyidae = [
  SpeciesClassification(
      classification: 'Pseudorhombus ', description: 'Flounders'),
];
final genusPegasidae = [
  SpeciesClassification(classification: 'Pegasus', description: 'Seamoth'),
];
final genusPimelodidae = [
  SpeciesClassification(
      classification: 'Phractocephalus', description: 'Redtailed Catfish')
];
final genusPinguipedidae = [
  SpeciesClassification(
      classification: 'Parapercis', description: 'Sandperches'),
];
final genusPlatycephalidae = [
  SpeciesClassification(classification: 'Grammoplites', description: ''),
  SpeciesClassification(
      classification: 'Inegocia', description: 'Japanese Flathead'),
  SpeciesClassification(
      classification: 'Platycephalus',
      description: 'Bartailed Flathead, Dusky Flathead'),
  SpeciesClassification(classification: 'Rogadius', description: ''),
  SpeciesClassification(
      classification: 'Sphyraena',
      description: 'Fringe-eyed Flathead, Crocodile Flathead'),
  SpeciesClassification(
      classification: 'Sunagocia', description: 'Papillose Flathead'),
  SpeciesClassification(
      classification: 'Thysanophrys', description: 'Celebes Flathead'),
];
final genusPlotosidae = [
  SpeciesClassification(
      classification: 'Paraplotosus',
      description: 'Whitelipped Eeltail Catfish'),
  SpeciesClassification(
      classification: 'Plotosus',
      description: 'Black Eeltail Catfish, Striped Eeltail Catfish')
];
final genusPoeciliidae = [
  SpeciesClassification(
      classification: 'Gambusia', description: 'Mosquitofish'),
  SpeciesClassification(
      classification: 'Poecilia', description: 'Guppy, Mollies'),
  SpeciesClassification(
      classification: 'Xiphophorus', description: 'Swordtail, Platyfishes'),
];
final genusPomacanthidae = [
  SpeciesClassification(
      classification: 'Pomacanthus',
      description: 'Blueringed Angelfish, Sixbar Angelfish'),
  SpeciesClassification(
      classification: 'Pomacanthus', description: 'Singapore Angelfish'),
];
final genusPomacentridae = [
  SpeciesClassification(classification: 'Abudefduf', description: 'Sergeants'),
  SpeciesClassification(
      classification: 'Amblyglyphidodon', description: 'Staghorn Damsel'),
  SpeciesClassification(classification: 'Amphiprion', description: 'Clownfish'),
  SpeciesClassification(
      classification: 'Dascyllus', description: 'Threespot Dascyllus'),
  SpeciesClassification(
      classification: 'Dischistodus',
      description:
          'White Damsel, Bumblebee Damsel, Honeyhead Damsel, Whitespot Damsel'),
  SpeciesClassification(
      classification: 'Hemiglyphidodon', description: 'Sweetlip Damsel'),
  SpeciesClassification(
      classification: 'Neopomacentrus', description: 'Demoiselles'),
  SpeciesClassification(
      classification: 'Pomacentrus',
      description:
          'Smoky Damsel, Silty Damsel, Obscure Damsel, Threespot Damsel, Whitetail Damsel'),
  SpeciesClassification(
      classification: 'Stegastes', description: 'Western Gregory'),
];
final genusPotamotrygonidae = [
  SpeciesClassification(
      classification: 'Potamotrygon', description: 'Motoro Ray'),
];
final genusPristigasteridae = [
  SpeciesClassification(classification: 'Ilisha', description: 'Ilishas'),
  SpeciesClassification(
      classification: 'Opisthopterus', description: 'Bigeyed Longfin Herring'),
  SpeciesClassification(
      classification: 'Pellona', description: 'Indian Pellona'),
];
final genusPsettodidae = [
  SpeciesClassification(classification: 'Psettodes', description: 'Halibuts'),
];
final genusRachycentridae = [
  SpeciesClassification(classification: 'Rachycentron', description: 'Cobia'),
];
final genusRhinidae = [
  SpeciesClassification(
      classification: 'Rhynchobatus', description: 'Whitespotted Guitarfish'),
];
final genusRhinobatidae = [
  SpeciesClassification(
      classification: 'Pseudobatos', description: 'Pacific Shovelnose Ray'),
];
final genusScaridae = [
  SpeciesClassification(classification: 'Scarus', description: 'Parrotfishes'),
];
final genusSciaenidae = [
  SpeciesClassification(
      classification: 'Dendrophysa', description: 'Goatee Croaker'),
  SpeciesClassification(
      classification: 'Johnius', description: 'Other Croakers'),
  SpeciesClassification(classification: 'Nibea ', description: 'Barracudas'),
  SpeciesClassification(
      classification: 'Otolithes', description: 'Tigertooth Croaker'),
  SpeciesClassification(
      classification: 'Otolithoides', description: 'Bronze Croaker'),
  SpeciesClassification(
      classification: 'Pennahia', description: 'Bigeye Croaker'),
  SpeciesClassification(classification: 'Protonibea', description: ''),
  SpeciesClassification(
      classification: 'Pseudolarimichthys ',
      description: 'Terengganu Yellow Croaker'),
];
final genusScombridae = [
  SpeciesClassification(
      classification: 'Euthynnus', description: 'Mackerel Tuna'),
  SpeciesClassification(
      classification: 'Rastrelliger',
      description: 'Short Mackerel, Indian Mackerel'),
  SpeciesClassification(
      classification: 'Scomberomorus', description: 'Spanish Mackerels'),
];
final genusScorpaenidae = [
  SpeciesClassification(
      classification: 'Parascorpaena', description: 'Painted Scorpionfish'),
  SpeciesClassification(classification: 'Pterois', description: 'Lionfishes'),
  SpeciesClassification(classification: 'Scorpaenodes', description: ''),
  SpeciesClassification(
      classification: 'Scorpaenopsis', description: 'Other Scorpionfishes'),
];
final genusSerranidae = [
  SpeciesClassification(classification: 'Cephalopholis', description: 'Hinds'),
  SpeciesClassification(
      classification: 'Diploprion', description: 'Yellow Soapfish'),
  SpeciesClassification(classification: 'Epinephelus', description: 'Groupers'),
  SpeciesClassification(
      classification: 'Plectropomus', description: 'Coral Trouts'),
];
final genusSerrasalmidae = [
  SpeciesClassification(classification: 'Piaractus', description: 'Pacu')
];
final genusSiganidae = [
  SpeciesClassification(classification: 'Siganus', description: 'Rabbitfishes'),
];
final genusSillaginidae = [
  SpeciesClassification(
      classification: 'Sillago', description: 'Sand Whitings'),
];
final genusSoleidae = [
  SpeciesClassification(
      classification: 'Brachirus', description: 'Oriental Sole, Dusky Sole'),
  SpeciesClassification(
      classification: 'Dagetichthys', description: 'Commerson’s Sole'),
  SpeciesClassification(
      classification: 'Pardachirus', description: 'Peacock Sole'),
  SpeciesClassification(classification: 'Synaptura', description: ''),
  SpeciesClassification(classification: 'Zebrias', description: 'Zebra Sole'),
];
final genusSphyraenidae = [
  SpeciesClassification(classification: 'Sphyraena', description: 'Barracudas'),
];
final genusSynanceiidae = [
  SpeciesClassification(classification: 'Inimicus', description: 'Stingers'),
  SpeciesClassification(
      classification: 'Leptosynanceia', description: 'Mangrove Stonefish'),
  SpeciesClassification(
      classification: 'Synanceia',
      description: 'Hollow-cheeked Stonefish, Reef Stonefish'),
  SpeciesClassification(
      classification: 'Trachicephalus', description: 'Stargazing Stonefish'),
];
final genusSynbranchidae = [
  SpeciesClassification(
      classification: 'Macrotrema', description: 'Pink Mud Eel'),
  SpeciesClassification(
      classification: 'Monopterus', description: 'Sunda Swamp Eel'),
  SpeciesClassification(
      classification: 'Ophisternon', description: 'Mangrove Swamp Eel'),
];
final genusSyngnathidae = [
  SpeciesClassification(
      classification: 'Ichthyocampus', description: 'Mangrove Pipefish'),
  SpeciesClassification(classification: 'Corythoichthys', description: ''),
  SpeciesClassification(classification: 'Syngnathoides', description: ''),
  SpeciesClassification(
      classification: 'Hippocampus', description: 'Seahorses'),
];
final genusSynodontidae = [
  SpeciesClassification(classification: 'Saurida', description: 'Lizardfishes')
];
final genusTerapontidae = [
  SpeciesClassification(classification: 'Pelates', description: 'Trumpeters'),
  SpeciesClassification(classification: 'Scortum', description: 'Jade Perch'),
  SpeciesClassification(
      classification: 'Terapon',
      description: 'Crescent Perch, Banded Perch, Smallscaled Terapon'),
];
final genusTetraodontidae = [
  SpeciesClassification(
      classification: 'Arothron',
      description:
          'Yelloweye Puffer, Reticulate Puffer, Stars and Stripes Puffer, Starry Puffer, Map Puffer, Bluespotted Puffer'),
  SpeciesClassification(
      classification: 'Chelonodontops', description: 'Milkspotted Puffer'),
  SpeciesClassification(
      classification: 'Dichotomyctere', description: 'Spotted Green Puffer'),
  SpeciesClassification(
      classification: 'Lagocephalus',
      description:
          'Rough Golden Puffer, Half-smooth Golden Puffer, Suez Puffer, Guenther’s Puffer, Silvercheeked Puffer'),
  SpeciesClassification(
      classification: 'Takifugu', description: 'Oblong Blaasop'),
];
final genusTetrarogidae = [
  SpeciesClassification(
      classification: 'Paracentropogon', description: 'Longspine Waspfish'),
];
final genusTriacanthidae = [
  SpeciesClassification(
      classification: 'Triacanthus',
      description: 'Shortnose Tripodfish, Silver Tripodfish'),
  SpeciesClassification(
      classification: 'Tripodichthys', description: 'Longtail Tripodfish')
];
final genusTrichonotidae = [
  SpeciesClassification(
      classification: 'Trichonotus', description: 'Sand-diver'),
];
final genusZenarchopteridae = [
  SpeciesClassification(
      classification: 'Dermogenys', description: 'Pygmy Halfbeak'),
  SpeciesClassification(
      classification: 'Hemirhamphodon', description: 'Malayan Forest Halfbeak'),
  SpeciesClassification(
      classification: 'Zenarchopterus', description: 'Other Halfbeaks'),
];

List<String> locations = [
  'Classified',
  'Singapore',
  'Strait of Singapore',
  'Singapore straits off raffles lighthouse',
  'Singapore straits off Pulau Bukom',
  'Singapore straits off Pulau Hantu',
  'Singapore straits off St. John’s island ',
  'Singapore straits off Pulau Sudong',
  'Singapore straits off Pulau Satumu',
  'Singapore straits off Terumbu berkas',
  'Singapore straits off Terumbu Pempang Tengah',
  'Singapore straits off Jurong Island',
  'Singapore straits off Sentosa',
  'Straits of Johor',
  'Johor Straits off Tuas',
  'Johor Straits off Sembawang',
  'Johor Straits off Changi',
  'Johor Straits off Pulau Ubin',
  'Johor Straits off Pulau Tekong',
  'St. John’s island',
  'Kusu Island',
  'Sisters’ Island',
  'Tuas',
  'Raffles Marina',
  'Kranji Reservoir ',
  'Kranji Dam',
  'Sembawang jetty',
  'Sembawang Park',
  'Lim Chu Kang Area',
  'Woodlands Waterfront',
  'Yishun Dam',
  'Lower Seletar Reservoir (Rowers’ Bay)',
  'Lower Seletar Reservoir',
  'Punggol Waterfront',
  'Punggol Point',
  'Punggol Jetty',
  'Lorong Halus',
  'Punggol-Serangoon Reservoir',
  'Punggol Reservoir',
  'Coney East Dam',
  'Lower Peirce Reservoir',
  'Upper Seletar Reservoir',
  'Macritchie Reservoir',
  'Pasir Ris Park',
  'Changi Boardwalk',
  'Changi Beach Park',
  'Pulau Ubin',
  'Tanah Merah',
  'NSRCC Canal',
  'East Coast Park',
  'East Coast Park (Bedok Jetty)',
  'East Coast Park (Twin Jetty)',
  'East Coast Park (White Jetty)',
  'Labrador Park (Labrador Jetty)',
  'Labrador Park (Coast)',
  'Bedok Reservoir',
  'Kallang River',
  'Kallang River (Marina Reservoir)',
  'Kallang River (Kolam Ayer)',
  'Kallang River (Rochor)',
  'Kallang River (Macpherson)',
  'Marina Barrage',
  'Marina South Pier',
  'Marina South',
  'West Coast Park',
  'Penjuru River',
  'Pandan River',
  'Pandan Reservoir ',
  'Kent Ridge Park',
];
