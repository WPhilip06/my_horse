import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_horse/authentication/bloc/app_bloc.dart';
import 'package:my_horse/authentication/models/user.dart';
import 'package:my_horse/authentication/repository/auth_repository.dart';
import 'package:my_horse/authentication/services/firebase.dart';
import 'package:my_horse/home_page/horse_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static Page page() => const MaterialPage<void>(child: HomePage());

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirestoreServie fs = FirestoreServie();
  final AuthRepository _authRepository = AuthRepository();

  late User _user = const User(id: '');

  @override
  void initState() {
    funcThatMakesAsyncCall();
    super.initState();
  }

  Future funcThatMakesAsyncCall() async {
    var result =
        await fs.getUserByID(_authRepository.currentUseer().toString());
    setState(() => _user = result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          toolbarHeight: 100,
          elevation: 1,
          actions: [
            IconButton(
              onPressed: () {},
              icon: IconButton(
                onPressed: () =>
                    context.read<AppBloc>().add(AppLogoutRequested()),
                icon: const Icon(
                  Icons.exit_to_app,
                ),
              ),
            )
          ],
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    ('Welcome') +
                        (_user.id == ""
                            ? 'No name'
                            : " ${_user.name![0].toUpperCase()}${_user.name!.substring(
                                1,
                                _user.name!.length,
                              )}"),
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  _user.email == null ? 'sd' : _user.email!,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "A rejoint App en ${_user.dateCreated == null ? 'sd' : DateFormat.yMMM().format(_user.dateCreated!)}",
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        body: Center(
          // child: HorseHomeCard(),
          child: ListView.builder(
              itemCount: listHorse.length,
              itemBuilder: (BuildContext context, int index) {
                var horse = listHorse[index];

                return HorseHomeCard(horse: horse);
              }),
        ));
  }
}
