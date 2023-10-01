import 'package:flutter/material.dart';
import 'package:my_horse/home_page/model/horse.dart';

class HorseHomeCard extends StatelessWidget {
  final Horse horse;
  const HorseHomeCard({
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
            child: SizedBox(
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
                      // Text(
                      //   ('Layer: ') + horse.layer!,
                      //   style: const TextStyle(fontSize: 15),
                      // ),
                      Text(
                        ('Discipline: ${horse.discipline != null ? horse.discipline! : ' - '}'),
                        style: const TextStyle(fontSize: 15),
                      ),
                      Text(
                        ('Breed: ${horse.breed != null ? horse.breed! : ' - '}'),
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
