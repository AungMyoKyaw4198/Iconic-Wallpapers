import 'package:WallpaperApp/views/category.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final String imageURL,title;
  CategoryTile({this.imageURL,this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
                          builder: (context)=> CategoryView(
                        categoryName: title,
                          )));
      },
          child: Container(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: ClipRRect
              (
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(imageUrl: imageURL,
                height: 50,width: 100, fit: BoxFit.cover,)),
            ),
            Container(
               height: 50,width: 100,
              alignment: Alignment.center,
              child: Text(title,style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),),
              )
          ],),
      ),
    );
  }
}