import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/models/random_user_model.dart';
import 'package:project/services/read_random_user.dart';

abstract class UserState{}
abstract class UserEvent{}

class UserLoadingState extends UserState{}
class UserCheckErrorState extends UserState{
  final String error;
  UserCheckErrorState(this.error);
}
class UserFetchingDoneState extends UserState{
  final RandomInfoModel randomInfoModel;
  UserFetchingDoneState(this.randomInfoModel);
}

class UserLoadingEvent extends UserEvent{}

class UserBloc extends Bloc<UserEvent, UserState>{
  final Services services;
  UserBloc(this.services):super(UserLoadingState()){
    on<UserLoadingEvent>((event, emit)async{
      emit(UserLoadingState());
      try{
        var data = await services.readRandomUser();
        emit(UserFetchingDoneState(data));
      }catch(e){
        emit(UserCheckErrorState(e.toString()));
      }
    });
  }
}