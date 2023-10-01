part of 'singup_cubit.dart';

enum SingupStatus { initial, submitting, success, error }

class SingupState extends Equatable {
  final String name;
  final String email;
  final String password;
  final SingupStatus status;

  const SingupState({
    required this.name,
    required this.email,
    required this.password,
    required this.status,
  });
  factory SingupState.initial() {
    return const SingupState(
      name: '',
      email: '',
      password: '',
      status: SingupStatus.initial,
    );
  }

  SingupState copyWith({
    String? name,
    String? email,
    String? password,
    SingupStatus? status,
  }) {
    return SingupState(
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        status: status ?? this.status);
  }

  @override
  List<Object> get props => [email, password, status];
}
