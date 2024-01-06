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
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(title: const Text("Home"), centerTitle: true, actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BlocProvider.value(
                        value: settings, child: const SettingsScreen())));
              },
              child: const Text("Settings"))
        ]),
        body: Align(
            child: MultiBlocProvider(
                providers: [
              BlocProvider(
                  create: (_) => HistoryCubit(
                      history: const History(contents: [], validCount: 0))),
              BlocProvider(
                  create: (_) => ContentCubit(content: Content.user())),
              BlocProvider(create: (_) => ModelCubit())
            ],
                child: Builder(builder: (context) {
                  final content =
                      BlocProvider.of<ContentCubit>(context, listen: true);
                  return SizedBox(
                      width: screenWidth * 0.9,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: content.state.parts.isEmpty
                              ? [
                                  const Expanded(child: MessageList()),
                                  const Divider(height: 4),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 5, bottom: 5),
                                    child: const MultipartsInputGroup(),
                                  ),
                                ]
                              : [
                                  const Expanded(child: MessageList()),
                                  const Divider(height: 4),
                                  SizedBox(
                                    height: screenWidth * 0.2,
                                    child: const MultipartsList(),
                                  ),
                                  Container(
                                      margin: const EdgeInsets.only(bottom: 5),
                                      child: const MultipartsInputGroup())
                                ]));
                }))));
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}
