// @dart=2.9
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wpmgr/bloc/pics_bloc.dart';
import 'package:wpmgr/bloc/pics_event.dart';
import 'package:flutter/material.dart';
import 'package:wpmgr/widgets/tabs.dart';

import 'const/color.dart';

String pexelAPIKey = "563492ad6f91700001000001f19e0fde9c284d91a33407f215c46a60";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'WallPaper Manager',
      theme: ThemeData(
        //Color(0xFF232323)
        primarySwatch: MaterialColor(0xFF151515, color),
        scaffoldBackgroundColor: MaterialColor(0xFF101010, color),
      ),
      home: const MyHomePage(title: 'WallPaper Manager'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({key, this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  PicsBloc _picsBloc;
  @override
  void initState() {
    TabController _tabController = TabController(length: 6, vsync: this);
    _picsBloc = PicsBloc(context: context, tabController: _tabController);
    _picsBloc.add(PicsUpdate());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PicsBloc>(
      create: (context) => _picsBloc,
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 130, 0, 50),
              child: const Tabs(),
            ),
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
