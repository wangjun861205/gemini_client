import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_client/apis.dart';
import 'package:gemini_client/blocs/settings.dart';

class HomeScreenState extends State<HomeScreen> {
  String text = "";
  List<String> contents = [];
  HomeScreenState() : super();

  @override
  Widget build(BuildContext context) {
    final settings = BlocProvider.of<SettingsCubit>(context);
    final textCtrl = TextEditingController(text: text);
    return Column(children: [
      SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.7,
          child: ListView.builder(
              itemCount: contents.length,
              itemBuilder: (context, i) => Text(contents[i]))),
      SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.2,
          child: TextField(
            controller: textCtrl,
            maxLines: 10,
            onChanged: (val) => setState(() {
              () => text = val;
            }),
          )),
      Align(
          child: TextButton(
              onPressed: () async {
                final resp = await generateContentSingleText(
                    apiKey: settings.state.apiKey, text: text);
                setState(() => contents = [...contents, resp]);
                textCtrl.clear();
              },
              child: const Text("Send")))
    ]);
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}
