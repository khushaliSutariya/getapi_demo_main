import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getapi_demo_main/diogetapi/home_view/home_page_cubit.dart';
import 'package:getapi_demo_main/groupby/home/json_parse_home_view.dart';
import 'package:getapi_demo_main/jsonparse/home_json_view/home_page_json_view.dart';

import 'diogetapi/home_view/home_page_view.dart';

final dio = Dio();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: routes,
      initialRoute: HomePageView.routeName,
      home:  MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomePageCubit(const HomePageState()),
          )
        ],
        child: const HomePageView(),
      ),
    );
  }
  Map<String, WidgetBuilder> get routes => <String, WidgetBuilder>{
    HomePageView.routeName: HomePageView.builder,
    HomePageJsonView.routeName:HomePageJsonView.builder,
    JsonParseHomeView.routeName:JsonParseHomeView.builder,
  };
}


