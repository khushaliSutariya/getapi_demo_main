part of 'home_page_json_view.dart';

class HomePageJsonState extends Equatable {
  final List<dynamic> reactionAllList;
  final List<dynamic> reactionUserList;
  final List<String> reactionEmojiList;
  final Map<dynamic, List<dynamic>> groupReaction;
  final String selectedEmoji;
  late  int count;
   HomePageJsonState(
      {this.reactionEmojiList = const [],
      this.reactionUserList = const [],
      this.reactionAllList = const [],
      this.groupReaction = const {},
      this.selectedEmoji = '',this.count =0});
  @override
  List<Object?> get props =>
      [ reactionAllList, reactionUserList, reactionEmojiList, groupReaction, selectedEmoji,count];

  HomePageJsonState copyWith({
    List<dynamic>? reactionAllList,
    List<dynamic>? reactionUserList,
    List<String>? reactionEmojiList,
    Map<dynamic, List<dynamic>>? groupReaction,
    String? selectedEmoji,
    int? count,
  }) {
    return HomePageJsonState(
      reactionAllList: reactionAllList ?? this.reactionAllList,
      reactionUserList: reactionUserList ?? this.reactionUserList,
      reactionEmojiList: reactionEmojiList ?? this.reactionEmojiList,
      groupReaction: groupReaction ?? this.groupReaction,
      selectedEmoji: selectedEmoji ?? this.selectedEmoji,
      count: count ?? this.count,
    );
  }

}
