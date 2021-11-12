//import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttermvvmnewsproject/screen/detailscreen.dart';
import 'package:fluttermvvmnewsproject/viewmodel/viewmodel.dart';
import 'package:fluttermvvmnewsproject/widgets/circleImage.dart';
//import 'package:fluttermvvmnewsproject/widgets/circleImage.dart';

// ignore: must_be_immutable
class Grids extends StatelessWidget {
  
  List<ViewModel> articles=[];
  Grids({this.articles});

  // ignore: non_constant_identifier_names
  void ShowNewsDetailPage(BuildContext context,ViewModel viewModel){
   Navigator.push(context, MaterialPageRoute(builder: (_){
      return DetailScreen(viewModel);
    }),
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return articles!=null ? GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:2,
      ),
      itemCount: articles.length,
      itemBuilder: (_,index){
        var article=articles[index];
        return GestureDetector(
          onTap: (){
            ShowNewsDetailPage(context, article);
          },
          child: GridTile(
            child: Container(
              //child: Text("Test İmage"),
              child:CircleImage(iUrl: article.urlToImage),
             ),
              
            ),
        );
      },
    ):Center(child: CircularProgressIndicator());

    
  }

  Future<bool> httpImageStatusControl(String url)async{
    var res;
    if(url!=null)
    res=await Dio().get(url);
    else
    return false;

    if(res.statusCode==200 ){
      
      return true;
    }else{
      return false;
    }
  }


}