import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/dbhelper/cache_user_info.dart';
import 'package:project/logics/count_logic.dart';
import 'package:project/logics/login_logice.dart';
import 'package:project/logics/read_data_logic.dart';
import 'package:project/services/read_random_user.dart';
import 'package:project/views/demo_user_view.dart';
import 'package:project/views/login_view.dart';

void main() async {
  debugPrint("Start new...");
  WidgetsFlutterBinding.ensureInitialized();
  UserInfo user = UserInfo();
  String token = await user.readUserInfoLocal();
  debugPrint("Token in void main: $token");
  if (token.isNotEmpty) {
    runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CounterBlocLogic()),
          BlocProvider(create: (context) => UserBloc(Services())),
          BlocProvider(create: (context) => HomeBloc(Services())),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: DemoUserView(),
        ),
      ),
    );
  } else{
    runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CounterBlocLogic()),
          BlocProvider(create: (context) => UserBloc(Services())),
          BlocProvider(create: (context) => HomeBloc(Services())),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: LoginView(),
        ),
      ),
    );
  }
}