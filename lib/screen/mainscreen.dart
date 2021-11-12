import 'package:flutter/material.dart';
import 'package:fluttermvvmnewsproject/constant/constant.dart';
import 'package:fluttermvvmnewsproject/viewmodel/listviewmodel.dart';
import 'package:fluttermvvmnewsproject/widgets/grids.dart';
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
        title: Center(child: Text("Haberler")),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (country) {
              listviewmodel.fetchNewsByCountry(Constant.Countries[country]);
              print(country);
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) {
              return Constant.Countries.keys
                  .map(
                    (e) => PopupMenuItem(value: e,
                      child: Text(e),
                    ),
                  )
                  .toList();
            },
          ),
        ],
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 15),
            child: Center(
              child: Text(
                "Başlık",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
            ),
          ),
          Expanded(
            //child: Text("Test"),
            child: listviewmodel.article!=null? Grids(articles: listviewmodel.article):CircularProgressIndicator(),
          )
        ],
      )),
    );
  }
 
}
