part of 'json_parse_home_view.dart';


class JsonParseState extends Equatable {
  final List<dynamic> allReactionList;
  final List<ReactionDataModel> reactionList;
  final List<String> reactionNameList;
  final List<ReactionDataModel> reactionEmojiList;
  final Map<dynamic, List<ReactionDataModel>> groupReaction;
  final String selectedName;
  const JsonParseState({this.groupReaction = const {},this.reactionEmojiList = const [],this.selectedName = '',this.reactionNameList = const [],this.reactionList = const [],this.allReactionList =  const []});
  @override
  List<Object?> get props => [groupReaction,reactionEmojiList,allReactionList,reactionList,reactionNameList,selectedName];

  JsonParseState copyWith({
    List<dynamic>? allReactionList,
    List<ReactionDataModel>? reactionList,
    List<String>? reactionNameList,
    List<ReactionDataModel>? reactionEmojiList,
    Map<dynamic, List<ReactionDataModel>>? groupReaction,
    String? selectedName,
  }) {
    return JsonParseState(
      allReactionList: allReactionList ?? this.allReactionList,
      reactionList: reactionList ?? this.reactionList,
      reactionNameList: reactionNameList ?? this.reactionNameList,
      reactionEmojiList: reactionEmojiList ?? this.reactionEmojiList,
      groupReaction: groupReaction ?? this.groupReaction,
      selectedName: selectedName ?? this.selectedName,
    );
  }
}
