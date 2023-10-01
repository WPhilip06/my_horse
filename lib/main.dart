import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_horse/authentication/bloc/app_bloc.dart';
import 'package:my_horse/authentication/repository/auth_repository.dart';
import 'package:my_horse/authentication/routes/routes.dart';

import 'package:my_horse/bloc_observer.dart';
import 'package:my_horse/firebase_options.dart';
import 'package:my_horse/theme/them_dark.dart';

// Future<void> main() async {

//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );

//   final authRepository = AuthRepository();
//   Bloc.observer = AppBlocObserver();
//   runApp(App(authRepository: authRepository));
// }
Future<void> main() async {
  return BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      final authRepository = AuthRepository();
      runApp(App(authRepository: authRepository));
    },
    blocObserver: AppBlocObserver(),
  );
}

class App extends StatelessWidget {
  final AuthRepository _authRepository;

  const App({
    Key? key,
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authRepository,
      child: BlocProvider(
        create: (_) => AppBloc(
          authRepository: _authRepository,
        ),
        child: const AppView(),
      ),
    );

    // home: const FireStoreTest());
  }
}

class FireStoreTest extends StatefulWidget {
  const FireStoreTest({super.key});

  @override
  State<FireStoreTest> createState() => _FireStoreTestState();
}

class _FireStoreTestState extends State<FireStoreTest> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  final caballo = <String, dynamic>{"id": 2, "nombre": 'macgregor2'};
  @override
  void initState() {
    super.initState();
    addData(caballo);
  }

  addData(caballo) {
    db.collection("caballos").add(caballo).then((DocumentReference doc) =>
        print('DocumentSnapshot added with ID: ${doc.id}'));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: ((context, index) {
            return const Text('sdsfsdd');
          })),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  FirebaseFirestore db = FirebaseFirestore.instance;

  NavigatorState get _navigator => _navigatorKey.currentState!;
  final caballo = <String, dynamic>{"id": 2, "nombre": 'macgregor2'};
  @override
  void initState() {
    super.initState();
    //addData(caballo);
  }

  addData(caballo) {
    db.collection("caballos").add(caballo).then((DocumentReference doc) =>
        print('DocumentSnapshot added with ID: ${doc.id}'));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MyThemData().themeDark(),
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      home: FlowBuilder(
        state: context.select((AppBloc bloc) => bloc.state.status),
        onGeneratePages: onGenerateAppViewPage,
      ),
    );
  }
}
