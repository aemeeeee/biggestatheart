import 'package:ichthyolog/Helpers/http.dart';
import 'package:test/test.dart';

void main() {
  final httpHelpers = HttpHelpers();

  test(
      'Test whether class catalogue returns correct list of species with count',
      () async {
    await httpHelpers.searchClassCatalogue().then(
      (response) {
        expect(response, [
          ['Actinopterygii', '6']
        ]);
      },
    );
  });

  test(
      'Test whether order catalogue returns correct list of species with count',
      () async {
    await httpHelpers.searchOrderCatalogue().then(
      (response) {
        expect(response, [
          ['Carangiformes', '3'],
          ['Cichliformes', '1'],
          ['Kurtiformes', '1'],
          ['Perciformes', '1']
        ]);
      },
    );
  });

  test(
      'Test whether family catalogue returns correct list of species with count',
      () async {
    await httpHelpers.searchFamilyCatalogue().then(
      (response) {
        expect(response, [
          ['Apogonidae', '1'],
          ['Carangidae', '3'],
          ['Cichlidae', '1'],
          ['Lethrinidae', '1']
        ]);
      },
    );
  });

  test(
      'Test whether genus catalogue returns correct list of species with count',
      () async {
    await httpHelpers.searchGenusCatalogue().then(
      (response) {
        expect(response, [
          ['Atule', '1'],
          ['Carangoides', '1'],
          ['Cichla', '1'],
          ['Fowleria', '1'],
          ['Lethrinus', '1'],
          ['Scomberoides', '1']
        ]);
      },
    );
  });

  test(
      'Test whether past day species count returns correct list of species count',
      () async {
    await httpHelpers.speciesCountByDay('Variegated Cardinalfish').then(
      (response) {
        expect(response.length, 25);
      },
    );
  });

  test(
      'Test whether past week species count returns correct list of species count',
      () async {
    await httpHelpers.speciesCountByWeek('Variegated Cardinalfish').then(
      (response) {
        expect(response.length, 7);
      },
    );
  });

  test(
      'Test whether past month species count returns correct list of species count',
      () async {
    await httpHelpers.speciesCountByMonth('Variegated Cardinalfish').then(
      (response) {
        expect(response.length, 30);
      },
    );
  });

  test(
      'Test whether species count stat returns correct lists of species counts',
      () async {
    await httpHelpers.speciesCountStats('Variegated Cardinalfish').then(
      (response) {
        expect([response[0].length, response[1].length, response[2].length],
            [25, 7, 30]);
      },
    );
  });
}
