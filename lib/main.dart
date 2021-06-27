import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_test/helper_tools/size_config.dart';
import 'package:search_test/search_provider.dart';
import 'package:search_test/search_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SearchProvider>(create: (_) => SearchProvider()),
      ],
      child: MaterialApp(
        home: MyApp2(),
      ),
    );
  }
}

class MyApp2 extends StatefulWidget {
  @override
  _MyApp2State createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SearchScreen();
  }
}
