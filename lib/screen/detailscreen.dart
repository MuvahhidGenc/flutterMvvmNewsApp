import 'package:flutter/material.dart';
import 'package:fluttermvvmnewsproject/viewmodel/viewmodel.dart';

// ignore: must_be_immutable
class DetailScreen extends StatelessWidget {
  ViewModel article;
  DetailScreen(@required this.article);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body:ListView(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Image.network(article.urlToImage),
              ),
              SizedBox(height: 5,),
              Card(
                child: ListTile(
                  title: Text(article.title),
                  subtitle: article.description!=null?Text(article.description):Text("Açıklama Mevcut Değil"),
                ),
              )
            ],
      ),
    );
  }
}
