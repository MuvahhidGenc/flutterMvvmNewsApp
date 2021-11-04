import 'package:flutter/cupertino.dart';
import 'package:fluttermvvmnewsproject/model/modelfile.dart';
import 'package:fluttermvvmnewsproject/service/service.dart';
import 'package:fluttermvvmnewsproject/viewmodel/viewmodel.dart';

enum LoadingStatus{
  Completed,
  Searching,
  Empty,
}

class ListViewModel with ChangeNotifier{
  LoadingStatus loadingStatus=LoadingStatus.Empty;


  List<ViewModel> article = List<ViewModel>();


//Methods to fetch news
  void fetchTopNewsHeadlines() async{
    List<ModelNewsArticle> _newsarticle=await WebService().getTopHeadlines();

    loadingStatus=LoadingStatus.Searching;
    notifyListeners();
    this.article=_newsarticle.map((e) =>ViewModel(article: e)).toList();

    if(this.article.isEmpty){
      loadingStatus=LoadingStatus.Empty;
    }else{
      loadingStatus=LoadingStatus.Completed;
    }

    notifyListeners() ;
  }
//Methods for news from each country
    void fetchNewsByCountry(String country) async{
    List<ModelNewsArticle> _newsarticle=await WebService().getNewsByCountry(country);

    loadingStatus=LoadingStatus.Searching;
    notifyListeners();
    this.article=_newsarticle.map((e) =>ViewModel(article: e)).toList();

    if(this.article.isEmpty){
      loadingStatus=LoadingStatus.Empty;
    }else{
      loadingStatus=LoadingStatus.Completed;
    }

    notifyListeners() ;
  }
  
}