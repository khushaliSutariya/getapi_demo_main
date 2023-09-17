part of 'json_parse_home_view.dart';

class JsonParseCubit extends Cubit<JsonParseState> {
  JsonParseCubit(super.initialState) {
    emit(state.copyWith(allReactionList: [
      {
        "reactionEmoji": "😮",
        "reactionById": 4,
        "reactionByName": "Jennifer",
        "reactionByImage": "2n6mAHghfk6Ta556r7QNF8d71TCWMNBXCaJMltsv.jpg"
      },
      {
        "reactionEmoji": "👍",
        "reactionById": 4,
        "reactionByName": "Jennifer",
        "reactionByImage": "2n6mAHghfk6Ta556r7QNF8d71TCWMNBXCaJMltsv.jpg"
      },
      {
        "reactionEmoji": "👏️",
        "reactionById": 4,
        "reactionByName": "Jennifer",
        "reactionByImage": "2n6mAHghfk6Ta556r7QNF8d71TCWMNBXCaJMltsv.jpg"
      },
      {
        "reactionEmoji": "🙄",
        "reactionById": 4,
        "reactionByName": "Jennifer",
        "reactionByImage": "2n6mAHghfk6Ta556r7QNF8d71TCWMNBXCaJMltsv.jpg"
      },
      {
        "reactionEmoji": "😮",
        "reactionById": 199,
        "reactionByName": "Bhavesh",
        "reactionByImage": "KxSKjK2KmLRRp3nYTgzVSW7kmXeW31P1auXv01Eg.jpg"
      },
      {
        "reactionEmoji": "😂",
        "reactionById": 199,
        "reactionByName": "Bhavesh",
        "reactionByImage": "KxSKjK2KmLRRp3nYTgzVSW7kmXeW31P1auXv01Eg.jpg"
      },
      {
        "reactionEmoji": "👍",
        "reactionById": 199,
        "reactionByName": "Bhavesh",
        "reactionByImage": "KxSKjK2KmLRRp3nYTgzVSW7kmXeW31P1auXv01Eg.jpg"
      },
      {
        "reactionEmoji": "👏️",
        "reactionById": 199,
        "reactionByName": "Bhavesh",
        "reactionByImage": "KxSKjK2KmLRRp3nYTgzVSW7kmXeW31P1auXv01Eg.jpg"
      },
      {
        "reactionEmoji": "🙄",
        "reactionById": 199,
        "reactionByName": "Bhavesh",
        "reactionByImage": "KxSKjK2KmLRRp3nYTgzVSW7kmXeW31P1auXv01Eg.jpg"
      }
    ]));
    groupByData();
  }

  void groupByData() {
    List<ReactionDataModel> objectsToList =
        state.allReactionList.map((reactionJson) => ReactionDataModel.fromJson(reactionJson)).toList();
    var reactionGroups = groupBy(
      objectsToList,
      (reaction) => reaction.reactionByName,
    );
    List<String> reactionNameList = [];
    reactionNameList.addAll(List.from(reactionGroups.keys));
    if (reactionNameList.length > 1) {
      reactionNameList.insert(0, "All");
    }
    emit(state.copyWith(
        reactionNameList: reactionNameList, selectedName: reactionNameList.first, groupReaction: reactionGroups));
    reactionChangeOnClick(reactionNameList.first);
  }

  void reactionChangeOnClick(String selectedName) {
    List<ReactionDataModel> reactionEmojiList = [];
    state.groupReaction.forEach((key, value) {
      if(selectedName == "All"){
        reactionEmojiList.addAll(value);
      }
      else{
        if (key == selectedName) {
          reactionEmojiList.addAll(value);
        }
      }

    });
    emit(state.copyWith(reactionEmojiList: reactionEmojiList, selectedName: selectedName));
  }

  String? count(String selectedName){
    var reactionEmojiCountList = [];
    state.groupReaction.forEach((key, value) {
      if(selectedName == "All"){
        reactionEmojiCountList.addAll(value);
      }
      else{
        if(key == selectedName){
          reactionEmojiCountList.addAll(value);
        }
      }
    });
    return reactionEmojiCountList.length.toString();

  }
}
