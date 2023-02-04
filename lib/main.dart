import 'package:cubit_api_request_test/cubit/post_fetch_cubit.dart';
import 'package:cubit_api_request_test/repository/api_repostiory.dart';
import 'package:cubit_api_request_test/screens/HomePage.dart';
import 'package:cubit_api_request_test/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp(
    apiService: ApiService(),
  ));
}

class MyApp extends StatelessWidget {
  final ApiService apiService;

  const MyApp({Key? key, required this.apiService}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostFetchCubit>(
            create: (context) => PostFetchCubit(
                apiRepository: ApiRepository(apiService: apiService))..fetchPostApi()
        ),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomePage()),
    );
  }
}
