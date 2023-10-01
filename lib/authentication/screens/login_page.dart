import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_horse/authentication/cubits/login/login_cubit.dart';
import 'package:my_horse/authentication/repository/auth_repository.dart';
import 'package:my_horse/authentication/screens/singup_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Page page() => const MaterialPage(child: LoginPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocProvider(
          create: (_) => LoginCubit(
            context.read<AuthRepository>(),
          ),
          child: const LoginForm(),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status == LoginStatus.error) {
          //TODO ERROR
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(height: 50),
          _tittle(),
          const SizedBox(height: 50),
          const Padding(padding: EdgeInsets.all(12)),
          _UsernameInput(),
          const Padding(padding: EdgeInsets.all(12)),
          _PasswordInput(),
          const Padding(padding: EdgeInsets.all(12)),
          const _LoginButton(),
          const Text("Dont' have an account?"),
          const SizedBox(height: 10),
          // _SingInButton(),
          _SingupButton(),
        ],
      ),
    );
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          onChanged: (email) => context.read<LoginCubit>().emailChanged(email),
          decoration: const InputDecoration(
            labelText: 'username',
            //errorText: state.username.displayError != null ? 'invalid username' : null,
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          onChanged: (password) =>
              context.read<LoginCubit>().passwordChanged(password),
          decoration: const InputDecoration(
            labelText: 'passwords',
            // errorText: state.password != null ? 'invalid username' : null,
          ),
        );
      },
    );
  }
}

class _SingupButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => Navigator.of(context).push(SingupScreen.route()),
        child: const Text('Singup'));
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: ((previous, current) => previous.status != current.status),
      builder: (context, state) {
        return state.status == LoginStatus.submitting
            ? const CircularProgressIndicator()
            : SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: () =>
                      context.read<LoginCubit>().logInwithCredentials(),
                  child: const Text('Login'),
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
      'Log in',
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
    ),
  );
}
