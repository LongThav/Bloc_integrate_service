import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/logics/login_logice.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();
  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Login"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              controller: _emailCtrl,
              decoration: const InputDecoration(hintText: 'Email'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: TextField(
              controller: _passwordCtrl,
              decoration: const InputDecoration(hintText: 'Password'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: ElevatedButton(
              onPressed: () {
                // BlocProvider.of<HomeBloc>(context).add(SendData(_emailCtrl.text, _passwordCtrl.text));
                debugPrint("Start Login");
                context.read<HomeBloc>().add(
                    SendData(_emailCtrl.text, _passwordCtrl.text, context));
              },
              child:
                  BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
                return state is Loading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Text("Login");
              }),
            ),
          )
        ],
      ),
    );
  }
}
