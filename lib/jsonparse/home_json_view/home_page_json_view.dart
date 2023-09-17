import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:collection/collection.dart';

import '../../groupby/home/json_parse_home_view.dart';

part 'home_page_json_cubit.dart';

part 'home_page_json_state.dart';

class HomePageJsonView extends StatefulWidget {
  const HomePageJsonView({Key? key}) : super(key: key);

  static const String routeName = "/home_page_json_view";

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageJsonCubit( HomePageJsonState()),
      child: const HomePageJsonView(),
    );
  }

  @override
  State<HomePageJsonView> createState() => _HomePageJsonViewState();
}

class _HomePageJsonViewState extends State<HomePageJsonView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(title: const Text("Json parse with groupby in emoji",style: TextStyle(fontSize: 17.0),),
        actions: [
          IconButton(onPressed: () {
            Navigator.pushNamed(context, JsonParseHomeView.routeName);
          }, icon: const Icon(Icons.person_off))
        ]),
        body: BlocBuilder<HomePageJsonCubit, HomePageJsonState>(
          builder: (context, state) {
            return Column(
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 70.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.reactionEmojiList.length,
                        itemBuilder: (context, index) {
                          var emoji = state.reactionEmojiList[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                context.read<HomePageJsonCubit>().keyListOnClick(emoji);
                              },
                              child: Container(
                                width: 90.0,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black45, width: 1),
                                  color: state.selectedEmoji == emoji ? Colors.yellow : Colors.white,
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Center(child: Text("${emoji.toString()} ${context.read<HomePageJsonCubit>().count(emoji)}")),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: ListView.builder(
                    itemCount: state.reactionUserList.length,
                    itemBuilder: (context, index) {
                      final reaction = state.reactionUserList[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text(reaction["reactionByName"].toString()),
                          trailing: Text(reaction["reactionEmoji"].toString()),
                          leading: const CircleAvatar(
                            radius: 50.0,
                            backgroundImage: NetworkImage(
                              "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?cs=srgb&dl=pexels-pixabay-220453.jpg&fm=jpg",
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
