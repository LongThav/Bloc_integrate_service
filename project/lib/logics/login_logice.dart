import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/dbhelper/cache_user_info.dart';
import 'package:project/models/login_model.dart';
import 'package:project/services/read_random_user.dart';
import 'package:project/utils/constant.dart';
import 'package:project/views/demo_user_view.dart';

abstract class HomeState {}

abstract class HomeEvent {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeDone extends HomeState {
  final LoginModel loginModel;
  HomeDone(this.loginModel);
}



class SendData extends HomeEvent {
  final String email;
  final String password;
  final BuildContext con;
  SendData(this.email, this.password, this.con);
}

class Loading extends HomeState {
  bool isLoadig = false;
  Loading(this.isLoadig);
}


class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final Services _services;
  HomeBloc(this._services) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is SendData) {
        emit(HomeLoading());
        var data =
            await _services.loginAuth(event.email, event.password, event.con);
        emit(HomeDone(data));
        Future.delayed(const Duration(milliseconds: 600), () {
          pusReplaceScreen(event.con, const DemoUserView());
        });
        UserInfo userInfo = UserInfo();
        userInfo.write(data.data.accessToken);
        debugPrint("token: ${data.data.accessToken}");
        debugPrint("Login successfully in Logic");
        emit(Loading(true));
      } else {
        emit(Loading(false));
        debugPrint("Cant' Login Screen");
      }
    });
  }
}

//https://medium.com/vijay-r/flutter-bloc-bloc-pattern-http-post-request-json-b4da1dcfed44