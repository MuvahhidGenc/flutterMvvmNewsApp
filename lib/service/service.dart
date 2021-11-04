import 'package:dio/dio.dart';
import 'package:fluttermvvmnewsproject/model/modelfile.dart';
import 'package:fluttermvvmnewsproject/constant/constant.dart';

class WebService{
  var dio=Dio();

  Future<List<ModelNewsArticle>> getNewsByCountry(String country) async{
    final response =await dio.get(Constant.headliensFor(country));

    if(response.statusCode==200){
      final result=response.data;
      Iterable list=result["articles"];
      print(result["totalResults"]);
      return list.map((e) => ModelNewsArticle.fromJson(e)).toList();
    }else{
      throw Exception("Response (Sonuç) Değeri 200 Dönmedi Http Sorunu Var");
    }
  }

  Future<List<ModelNewsArticle>> getTopHeadlines() async{
    final response =await dio.get(Constant.TOPHEADLINES);

    if(response.statusCode==200){
      final result=response.data;
      Iterable list=result["articles"];
      return list.map((e) => ModelNewsArticle.fromJson(e)).toList();
    }else{
      throw Exception("getTopHeadlines Response (Sonuç) Değeri 200 Dönmedi Http Sorunu Var");
    }
  }
}