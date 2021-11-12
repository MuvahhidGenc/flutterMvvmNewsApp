import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';



// ignore: must_be_immutable
class CircleImage extends StatelessWidget {
  String iUrl;
  CircleImage({this.iUrl});

  @override
  Widget build(BuildContext context) {
    
    return  CachedNetworkImage(
      //progressIndicatorBuilder: (context,iUrl,downloadProgress)=>CircularProgressIndicator(value: downloadProgress.progress,valueColor: AlwaysStoppedAnimation(Colors.black),),
      imageUrl: iUrl,
      placeholder: (context,iUrl)=>Center(child: CircularProgressIndicator(),),
      errorWidget: (context, iUrl, error) => Icon(Icons.error),
      imageBuilder: (context,imageProvider){
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(18),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: imageProvider,
            ),
          ),
        );
      },
       /*placeholder: (context,iUrl){
        return Center(child: CircularProgressIndicator(),);
       },*/
      /*errorWidget: (context,url,error){
        return Icon(Icons.error);
      },*/
      
     
    );
  }



 


}

