part of 'home_page_json_view.dart';

class HomePageJsonCubit extends Cubit<HomePageJsonState> {
  HomePageJsonCubit(super.initialState) {
    emit(state.copyWith(reactionAllList: [
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
    var groupedReactions = groupBy(state.reactionAllList, (reaction) => reaction['reactionEmoji']);
    List<String> reactionEmojiList = [];
    reactionEmojiList.addAll(List<String>.from(groupedReactions.keys));
    if (reactionEmojiList.length > 1) {
      reactionEmojiList.insert(0, "All");
    }
    emit(state.copyWith(
        reactionEmojiList: reactionEmojiList, groupReaction: groupedReactions, selectedEmoji: reactionEmojiList.first));
    keyListOnClick(reactionEmojiList.first);
  }

  void keyListOnClick(String selectedEmoji) {
    List<dynamic> reactionUserList = [];
    state.groupReaction.forEach((key, value) {
      if (selectedEmoji == "All") {
        reactionUserList.addAll(value);
      } else {
        if (key == selectedEmoji) {
          reactionUserList.addAll(value);
        }
      }
    });
    emit(state.copyWith(reactionUserList: reactionUserList, selectedEmoji: selectedEmoji));
  }

  String? count(String selectedEmoji) {
    var reactionUserList = [];
    debugPrint("Length::: ${(state.groupReaction[selectedEmoji] ?? []).length}");
    state.groupReaction.forEach((key, value) {
      if (selectedEmoji == "All") {
        reactionUserList.addAll(value);
      } else {
        if (key == selectedEmoji) {
          reactionUserList.addAll(value);
        }
      }
    });
    return reactionUserList.length.toString();
  }
}
