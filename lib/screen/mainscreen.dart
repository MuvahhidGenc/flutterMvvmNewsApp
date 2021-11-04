import 'package:flutter/material.dart';
import 'package:fluttermvvmnewsproject/constant/constant.dart';
import 'package:fluttermvvmnewsproject/viewmodel/listviewmodel.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ListViewModel>(context, listen: false).fetchTopNewsHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    var listviewmodel = Provider.of<ListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (country) {
              listviewmodel.fetchNewsByCountry(Constant.Countries[country]);
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) {
              return Constant.Countries.keys
                  .map(
                    (e) => PopupMenuItem(
                      child: Text(e),
                    ),
                  )
                  .toList();
            },
          ),
        ],
      ),
    );
  }
}
