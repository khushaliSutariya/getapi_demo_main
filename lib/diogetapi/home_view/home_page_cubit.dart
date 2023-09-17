import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:getapi_demo_main/main.dart';

import '../model/users.dart';
import '../resources/urlresources.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit(super.initialState){fetchTodos();}


  Future<void> fetchTodos() async {
    final response = await dio.get(URLResources.baseurl);
    try {
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data["results"];
        List<Users> todosData = data.map((item) => Users.fromJson(item)).toList();
        emit(state.copyWith(userList:  todosData));
      }
    } catch (e) {
      debugPrint("error massage =============== $e");
    }
  }


}
