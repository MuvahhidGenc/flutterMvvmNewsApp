import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
   final String iUrl;
  CircleImage({this.iUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: iUrl,
      imageBuilder: (context,imageProvider){
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(18),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: imageProvider,
            )
          ),
        );
      },
    );
  }
}