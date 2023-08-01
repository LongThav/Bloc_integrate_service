import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/dbhelper/cache_user_info.dart';
import 'package:project/logics/login_logice.dart';
import 'package:project/logics/read_data_logic.dart';
import 'package:project/models/random_user_model.dart';


class DemoUserView extends StatefulWidget {
  const DemoUserView({super.key});

  @override
  State<DemoUserView> createState() => _DemoUserViewState();
}

class _DemoUserViewState extends State<DemoUserView> {
  final UserInfo _userInfo = UserInfo();
  @override
  void initState() {
    context.read<UserBloc>().add(UserLoadingEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //     icon: const Icon(Icons.arrow_back_ios)),
        leading: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state){
            return state is Loading == true? IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: const Icon(Icons.arrow_back_ios)) : Container();
          },
        ),
        title: const Text("Demo user"),
        actions: [
          IconButton(
              onPressed: () {
                debugPrint("Logout...");
                _userInfo.deleteAll(context);
              },
              icon: const Icon(Icons.logout)),
        ],
      ),
      body: _buildBody,
    );
  }

  Widget get _buildBody {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is UserCheckErrorState) {
          return const Center(
            child: Text("Error"),
          );
        }
        if (state is UserFetchingDoneState) {
          RandomInfoModel randomUser = state.randomInfoModel;
          return RefreshIndicator(
            onRefresh: () async {
              context.read<UserBloc>().add(UserLoadingEvent());
            },
            child: ListView.builder(
                itemCount: randomUser.results.length,
                itemBuilder: (context, index) {
                  var data = randomUser.results[index];
                  return Card(
                    child: ListTile(
                      leading: Text('${data.registered.age}'),
                      title: Text('${data.name.first} ${data.name.last}'),
                      subtitle: Text(data.phone),
                    ),
                  );
                }),
          );
        }
        return Container();
      },
    );
  }
}
