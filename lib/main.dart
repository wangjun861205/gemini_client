import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_client/blocs/common.dart';
import 'package:gemini_client/blocs/settings.dart';
import 'package:gemini_client/models/settings.dart';
import 'package:gemini_client/screens/error.dart';
import 'package:gemini_client/screens/home.dart';
import 'package:gemini_client/screens/settings.dart';
import 'package:gemini_client/screens/spin.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: BlocProvider(
            create: (_) => FutureCubit<Settings?, dynamic>.simple(
                futureFactory: (args) async {
                  final prefs = await SharedPreferences.getInstance();
                  final settingsStr = prefs.getString("settings");
                  if (settingsStr == null) {
                    return null;
                  }
                  return Settings.fromJson(jsonDecode(settingsStr));
                },
                args: null),
            child: Builder(builder: (context) {
              final settingsFuture =
                  BlocProvider.of<FutureCubit<Settings?, dynamic>>(context,
                      listen: true);
              if (settingsFuture.state is Failed) {
                return ErrorScreen(
                    error: (settingsFuture.data as Failed).error,
                    retry: () => settingsFuture.refresh());
              }
              if (settingsFuture.state is Loading) {
                return const SpinScreen();
              }
              if ((settingsFuture.state as Success).data == null) {
                return BlocProvider(
                    create: (_) => SettingsCubit(Settings.empty()),
                    child: SettingsScreen());
              }
              return BlocProvider(
                  create: (_) =>
                      SettingsCubit((settingsFuture.state as Success).data),
                  child: const HomeScreen());
            })));
  }
}
