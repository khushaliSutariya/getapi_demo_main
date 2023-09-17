import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getapi_demo_main/jsonparse/home_json_view/home_page_json_view.dart';

import 'home_page_cubit.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);
  static const String routeName = "/home_page_name";

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageCubit(const HomePageState()),
      child: const HomePageView(),
    );
  }

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Dio get api call"),
        actions: [IconButton(onPressed:() {
          Navigator.pushNamed(context, HomePageJsonView.routeName);
        }, icon: const Icon(Icons.emoji_emotions))],
      ),
      body: BlocBuilder<HomePageCubit, HomePageState>(
        builder: (context, state) {
          return state.userList.isNotEmpty
              ? ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: state.userList.length,
                  itemBuilder: (context, index) {
                    var userData = state.userList[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("User:-",style: TextStyle(fontSize: 20.0)),
                                Text(
                                    "Name:- ${userData.name.title.toString()} ${userData.name.first.toString()} ${userData.name.last.toString()}"),
                                Text("Email:- ${userData.email.toString()}"),
                                Text("Gender:- ${userData.gender.toString()}"),
                                Text("Phone:- ${userData.phone.toString()}"),
                                Text("Cell:- ${userData.cell.toString()}"),
                                Text("Nat:- ${userData.nat.toString()}"),
                                const Text("Location:-",style: TextStyle(fontSize: 20.0)),
                                Text("City:- ${userData.location?.city.toString()} "),
                                Text("Country:- ${userData.location?.country.toString()} "),
                                Text("State:- ${userData.location?.state.toString()} "),
                                Text("Postcode:- ${userData.location?.postcode.toString()} "),
                                const Text("Street:-",style: TextStyle(fontSize: 17.0)),
                                Text("Name :- ${userData.location?.street?.name.toString()} "),
                                Text("Number :- ${userData.location?.street?.number.toString()} "),
                                const Text("Coordinates:-",style: TextStyle(fontSize: 17.0)),
                                Text("Latitude:- ${userData.location?.coordinates?.latitude.toString()}"),
                                Text("Longitude:- ${userData.location?.coordinates?.longitude.toString()} "),
                                const Text("Timezone:-",style: TextStyle(fontSize: 17.0)),
                                Text("Offset:- ${userData.location?.timezone?.offset.toString()}"),
                                Text("Description:- ${userData.location?.timezone?.description.toString()} "),
                                const Text("Login:-",style: TextStyle(fontSize: 20.0)),
                                Text("Uuid:- ${userData.login?.uuid.toString()}"),
                                Text("Username:- ${userData.login?.username.toString()}"),
                                Text("Password:- ${userData.login?.password.toString()}"),
                                Text("Salt:- ${userData.login?.salt.toString()}"),
                                Text("Md5:- ${userData.login?.md5.toString()}"),
                                Text("Sha1:- ${userData.login?.sha1.toString()}"),
                                Text("Sha256:- ${userData.login?.sha256.toString()}"),
                                const Text("Dob:-",style: TextStyle(fontSize: 20.0)),
                                Text("Date:- ${userData.dob.date.toString()}"),
                                Text("Age:- ${userData.dob.age.toString()}"),
                                const Text("Registered:-",style: TextStyle(fontSize: 20.0)),
                                Text("Date:- ${userData.registered.date.toString()}"),
                                Text("Age:- ${userData.registered.age.toString()}"),
                                const Text("id:-",style: TextStyle(fontSize: 20.0)),
                                Text("Name:- ${userData.id.name.toString()}"),
                                Text("Value:- ${userData.id.value.toString()}"),
                                const Text("Picture:-",style: TextStyle(fontSize: 20.0)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.network(userData.picture!.large.toString()),
                                    Image.network(userData.picture!.medium.toString()),
                                    Image.network(userData.picture!.thumbnail.toString()),
                                  ],
                                )
                              ],
                            ),
                          )),
                    );
                  },
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
// ListTile(
// title: Text(
// userData.name!.title.toString(),
// style: const TextStyle(fontWeight: FontWeight.bold),
// ),
// subtitle: Text(userData.email.toString()),
// ),
