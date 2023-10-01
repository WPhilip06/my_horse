enum HorseDiscipline { salto, doma, completo, ride, trek, polo, horseball }

class Horse {
  String name;
  DateTime? birthday;
  String? layer;
  String? discipline;
  String? breed;
  String? imgSrc;

  Horse({
    required this.name,
    this.birthday,
    this.layer,
    this.discipline,
    this.breed,
    this.imgSrc,
  });
}

List<Horse> listHorse = [
  Horse(
    name: 'McGregor-test',
    birthday: DateTime(2003, 9, 2),
    layer: 'Alazán',
    discipline: HorseDiscipline.completo.name,
    breed: null,
    imgSrc:
        "/Users/wilw/Documents/flutter_projects/my_horse/assets/images/mcgregor.jpeg",
  ),
  Horse(
    name: 'Bucéfalo',
    birthday: DateTime(2003, 9, 2),
    layer: 'Negro azabache',
    discipline: HorseDiscipline.completo.name,
    breed: 'Oriental',
    imgSrc:
        "/Users/wilw/Documents/flutter_projects/my_horse/assets/images/bucefalo2.jpg",
  ),
  Horse(
    name: 'Marengo',
    birthday: DateTime(2018, 9, 2),
    layer: 'Gris',
    discipline: HorseDiscipline.completo.name,
    breed: 'Árabe',
    imgSrc:
        "/Users/wilw/Documents/flutter_projects/my_horse/assets/images/marengo.jpg",
  ),
  Horse(
    name: 'Tornado',
    birthday: DateTime(2018, 9, 2),
    layer: 'Negro',
    discipline: HorseDiscipline.completo.name,
    breed: 'Frisón',
    imgSrc:
        "/Users/wilw/Documents/flutter_projects/my_horse/assets/images/tornado.jpg",
  ),
  Horse(
    name: 'Sombra gris',
    birthday: DateTime(2015, 9, 2),
    layer: 'Blanco',
    breed: 'Pura raza española',
    imgSrc:
        "/Users/wilw/Documents/flutter_projects/my_horse/assets/images/sombragris.jpg",
  ),
  Horse(
    name: 'Spirit',
    birthday: DateTime(1998, 9, 2),
    layer: 'Bayo',
    discipline: HorseDiscipline.completo.name,
    breed: 'Kiger mustang',
    imgSrc:
        "/Users/wilw/Documents/flutter_projects/my_horse/assets/images/spirit.jpg",
  ),
  Horse(
    name: 'Totilas',
    birthday: DateTime(2000, 23, 5),
    layer: 'Negro',
    discipline: HorseDiscipline.completo.name,
    breed: 'Raza KWPN',
    imgSrc:
        "/Users/wilw/Documents/flutter_projects/my_horse/assets/images/totilas.jpg",
  ),
];
