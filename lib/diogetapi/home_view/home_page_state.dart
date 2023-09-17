part of 'home_page_cubit.dart';

// ignore: must_be_immutable
class HomePageState extends Equatable {
  final List<Users> userList;

  const HomePageState({this.userList = const []});

  @override
  List<Object?> get props => [userList];

  HomePageState copyWith({
    List<Users>? userList,
  }) {
    return HomePageState(
      userList: userList ?? this.userList,
    );
  }
}
