import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_client/apis.dart';
import 'package:gemini_client/blocs/conversation.dart';
import 'package:gemini_client/blocs/model.dart';
import 'package:gemini_client/blocs/settings.dart';
import 'package:gemini_client/components/message_list.dart';
import 'package:gemini_client/components/multiparts_input_group.dart';
import 'package:gemini_client/components/multiparts_list.dart';
import 'package:gemini_client/screens/settings.dart';

class HomeScreenState extends State<HomeScreen> {
  List<Content> contents = [];
  HomeScreenState() : super();

  @override
  Widget build(BuildContext context) {
    final settings = BlocProvider.of<SettingsCubit>(context);
    return Scaffold(
        appBar: AppBar(title: const Text("Home"), centerTitle: true, actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BlocProvider.value(
                        value: settings, child: SettingsScreen())));
              },
              child: const Text("Settings"))
        ]),
        body: Align(
            child: MultiBlocProvider(
                providers: [
              BlocProvider(create: (_) => ContentsCubit(contents: [])),
              BlocProvider(
                  create: (_) => ContentCubit(content: Content.user())),
              BlocProvider(create: (_) => ModelCubit())
            ],
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: const MessageList()),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: const Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(flex: 4, child: MultipartsList()),
                                Expanded(flex: 6, child: MultipartsInputGroup())
                              ])),
                    ]))));
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}
