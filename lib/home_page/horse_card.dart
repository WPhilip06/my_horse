import 'package:flutter/material.dart';

class HorseHomeCard extends StatelessWidget {
  final Horse horse;
  HorseHomeCard({
    super.key,
    required this.horse,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: const Color.fromARGB(88, 174, 174, 174),
              radius: 45,
              child: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(horse.imgSrc!),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              // color: Colors.red,
              width: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        horse.name!,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        ('Years: ') +
                            (DateTime.now().year - horse.birthday!.year!)
                                .toString(),
                        style: const TextStyle(fontSize: 15),
                      ),
                      Text(
                        ('Color: ') + horse.color!,
                        style: const TextStyle(fontSize: 15),
                      ),
                      Text(
                        ('Raza: ${horse.breed != null ? horse.breed! : ' - '}'),
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  const Text('+ Info')
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<Horse> listHorse = [
  Horse(
    name: 'McGregor',
    birthday: DateTime(2003, 9, 2),
    color: 'Alazán',
    breed: null,
    imgSrc:
        "/Users/wilw/Documents/flutter_projects/my_horse/assets/images/mcgregor.jpeg",
  ),
  Horse(
    name: 'Bucéfalo',
    birthday: DateTime(2003, 9, 2),
    color: 'Negro azabache',
    breed: 'Oriental',
    imgSrc:
        "/Users/wilw/Documents/flutter_projects/my_horse/assets/images/bucefalo2.jpg",
  ),
  Horse(
    name: 'Marengo',
    birthday: DateTime(2018, 9, 2),
    color: 'Gris',
    breed: 'Árabe',
    imgSrc:
        "/Users/wilw/Documents/flutter_projects/my_horse/assets/images/marengo.jpg",
  ),
  Horse(
    name: 'Tornado',
    birthday: DateTime(2018, 9, 2),
    color: 'Negro',
    breed: 'Frisón',
    imgSrc:
        "/Users/wilw/Documents/flutter_projects/my_horse/assets/images/tornado.jpg",
  ),
  Horse(
    name: 'Sombra gris',
    birthday: DateTime(2015, 9, 2),
    color: 'Blanco',
    breed: 'Pura raza española',
    imgSrc:
        "/Users/wilw/Documents/flutter_projects/my_horse/assets/images/sombragris.jpg",
  ),
  Horse(
    name: 'Spirit',
    birthday: DateTime(1998, 9, 2),
    color: 'Bayo',
    breed: 'Kiger mustang',
    imgSrc:
        "/Users/wilw/Documents/flutter_projects/my_horse/assets/images/spirit.jpg",
  ),
  Horse(
    name: 'Totilas',
    birthday: DateTime(2000, 23, 5),
    color: 'Negro',
    breed: 'Raza KWPN',
    imgSrc:
        "/Users/wilw/Documents/flutter_projects/my_horse/assets/images/totilas.jpg",
  ),
];

class Horse {
  String name;
  DateTime? birthday;
  String? color;
  String? breed;
  String? imgSrc;

  Horse({
    required this.name,
    this.birthday,
    this.color,
    this.breed,
    this.imgSrc,
  });
}
