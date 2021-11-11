class Constant{
  static const APIKEY="8fc4f9d1af304c39b4cdbd02fce178d1";
  static const TOPHEADLINES="https://newsapi.org/v2/top-headlines?country=tr&category=business&apiKey=$APIKEY"; 


  static String headliensFor(String country){
    return "https://newsapi.org/v2/top-headlines?country=$country&category=business&apiKey=$APIKEY"; 
  }

  static const Map<String, String> Countries={
    'USA':'us',
    'Turkey':'tr',
    'China':'cn'
  };



}