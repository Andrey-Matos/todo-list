import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/app/controller/task_provider.dart';
import 'package:todo_list/app/view/home/home.dart';

import 'app/config/config.dart';
import 'app/controller/theme_provider.dart';
import 'app/model/entities/hive_task_scheme.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox<HiveTaskScheme>('taskBox');
  Hive.registerAdapter(HiveTaskSchemeAdapter());
  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => TaskProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) {
          return themeChangeProvider;
        },
        child: Consumer<DarkThemeProvider>(
          builder: (BuildContext context, value, Widget? child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: Styles.themeData(themeChangeProvider.darkTheme, context),
              home: Home(),
            );
          },
        ),
      )
    ]);
  }
}
