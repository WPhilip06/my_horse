import 'package:equatable/equatable.dart';

// class User extends Equatable {
//   final String id;
//   final String? email;
//   final String? name;
//   final String? photo;

//   const User({required this.id, this.email, this.name, this.photo});

//   static const empty = User(id: '');

//   bool get isEmpty => this == User.empty;
//   bool get isNotEmpty => this != User.empty;

//   @override
//   List<Object?> get props => [id, email, name, photo];
// }

// }

class User extends Equatable {
  final String id;
  final String? name;
  final String? email;
  final DateTime? dateCreated;
  final String? platform;

  const User(
      {required this.id,
      this.name,
      this.email,
      this.dateCreated,
      this.platform});

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['user_name'],
        email = json['email'],

        //dateCreated = DateTime.now(),
        // TO D
        dateCreated = json['date_created'].toDate(),
        platform = json['platform'];

  static const empty = User(id: '');

  set setUid(String) {}

  bool get isEmpty => this == User.empty;
  bool get isNotEmpty => this != User.empty;

  @override
  List<Object?> get props => [id, name, email];
}
