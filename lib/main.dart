import 'package:flutter/material.dart';
import 'package:fluttermvvmnewsproject/screen/mainscreen.dart';
import 'package:fluttermvvmnewsproject/viewmodel/listviewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Home());
}
 
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => ListViewModel(),
          ),
        ],
        child: MainScreen(),
      ),
    );
  }
}
