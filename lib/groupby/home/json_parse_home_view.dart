import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getapi_demo_main/groupby/model/reactiondatamodel.dart';



part  'json_parse_cubit.dart';
part  'json_parse_state.dart';

class JsonParseHomeView extends StatefulWidget {
  const JsonParseHomeView({Key? key}) : super(key: key);

  static const String routeName = "json_parse_home_view";

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => JsonParseCubit(const JsonParseState()),
      child: const JsonParseHomeView(),
    );
  }
  @override
  State<JsonParseHomeView> createState() => _JsonParseHomeViewState();
}

class _JsonParseHomeViewState extends State<JsonParseHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Json parse with groupby in name",style: TextStyle(fontSize: 17.0),)),
      body: BlocBuilder<JsonParseCubit,JsonParseState>(builder: (context, state) {
        return Column(
          children: [
            Flexible(child: SizedBox(
              height: 70.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.reactionNameList.length,
                  itemBuilder: (context, index) {
                    var name = state.reactionNameList[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        context.read<JsonParseCubit>().reactionChangeOnClick(name);
                      },
                      child: Container(
                        width: 95.0,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black45, width: 1),
                          color:state.selectedName == name?Colors.yellow:Colors.white,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Center(child: Text('${name.toString()} ${context.read<JsonParseCubit>().count(name)}')),
                      ),
                    ),
                  );
                },),
              ),
            )),
            Expanded(
              flex: 5,
                child: ListView.builder(
              itemCount: state.reactionEmojiList.length,
              itemBuilder: (context, index) {
                var emoji = state.reactionEmojiList[index];
              return ListTile(
                title: Text(emoji.reactionEmoji.toString()),
              );
            },)),
          ],
        );
      },)
    );
  }
}
