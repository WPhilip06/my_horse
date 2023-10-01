import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_horse/authentication/models/user.dart';

class FirestoreServie {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser(User user) async {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
          'id': user.id,
          'user_name': user.name, // John Doe
          'email': user.email, // Stokes and Sons
          'date_created': user.dateCreated,
          'platform': user.platform // 42
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<User> getUserByID(String id) async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await users.get();

    // Get data from docs and convert map to List
    List<dynamic> allData =
        querySnapshot.docs.map((doc) => doc.data()).toList();

    List<User> listUser = [];

    for (var element in allData) {
      listUser.add(User.fromJson(element));
      // print(element);
    }
    User userr = listUser
        .where(
          (element) => element.id == id,
        )
        .first;
    print(userr.toString());

    return userr;
  }
}
