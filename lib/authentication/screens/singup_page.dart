import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_horse/authentication/cubits/signup/singup_cubit.dart';
import 'package:my_horse/authentication/models/user.dart';
import 'package:my_horse/authentication/repository/auth_repository.dart';

class SingupScreen extends StatelessWidget {
  const SingupScreen({
    super.key,
  });

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const SingupScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocProvider<SingupCubit>(
          create: (_) => SingupCubit(
            context.read<AuthRepository>(),
          ),
          child: const SingupForm(),
        ),
      ),
    );
  }
}

class SingupForm extends StatefulWidget {
  const SingupForm({
    super.key,
  });

  @override
  State<SingupForm> createState() => _SingupFormState();
}

class _SingupFormState extends State<SingupForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SingupCubit, SingupState>(
      listener: (context, state) {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          _tittle(),
          _NameInput(nameController: _nameController),

          const SizedBox(height: 8),
          _EmailInput(emailController: _emailController),
          const SizedBox(height: 8),

          _PasswordInput(passwordController: _passwordController),

          _SingupButton(
            nameController: _nameController,
            emailController: _emailController,
          ),
          const SizedBox(height: 8),

          //Spacer(),
          //SingupButton(value: _controller.value.text),
        ],
      ),
    );
  }
}

class _NameInput extends StatelessWidget {
  const _NameInput({
    super.key,
    required TextEditingController nameController,
  }) : _nameController = nameController;

  final TextEditingController _nameController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SingupCubit, SingupState>(
      buildWhen: (previous, current) => previous.name != current.name,
      builder: (context, state) {
        return TextField(
          controller: _nameController,
          // onChanged: (email) {
          //   context.read<SingupCubit>().emailChanged(email);
          // },
          decoration: const InputDecoration(labelText: 'username'
              //errorText: state.username.displayError != null ? 'invalid username' : null,
              ),
        );
      },
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput({
    super.key,
    required TextEditingController emailController,
  }) : _emailController = emailController;

  final TextEditingController _emailController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SingupCubit, SingupState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          controller: _emailController,
          onChanged: (email) => context.read<SingupCubit>().emailChanged(email),
          decoration: const InputDecoration(
            labelText: 'email',
            //errorText: state.username.displayError != null ? 'invalid username' : null,
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput({
    super.key,
    required TextEditingController passwordController,
  }) : _passwordController = passwordController;

  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SingupCubit, SingupState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          controller: _passwordController,
          onChanged: (password) =>
              context.read<SingupCubit>().passwordChanged(password),
          obscureText: true,
          decoration: const InputDecoration(
            labelText: 'password',
          ),
        );
      },
    );
  }
}

class _SingupButton extends StatelessWidget {
  const _SingupButton({
    super.key,
    required TextEditingController nameController,
    required TextEditingController emailController,
  })  : _nameController = nameController,
        _emailController = emailController;

  final TextEditingController _nameController;
  final TextEditingController _emailController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SingupCubit, SingupState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status == SingupStatus.submitting
            ? const CircularProgressIndicator()
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () async {
                      final user = User(
                          id: '',
                          name: _nameController.value.text,
                          email: _emailController.value.text,
                          dateCreated: DateTime.now(),
                          platform: "iOS");

                      context.read<SingupCubit>().singupFormSubmitted(user);
                    },
                    child: const Text('SingUp'),
                  ),
                ),
              );
      },
    );
  }
}

Widget _tittle() {
  return const Align(
    alignment: Alignment.centerLeft,
    child: Text(
      'Create account',
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
    ),
  );
}
