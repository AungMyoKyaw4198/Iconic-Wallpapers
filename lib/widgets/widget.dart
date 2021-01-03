import 'package:WallpaperApp/model/wallpaper.dart';
import 'package:WallpaperApp/views/image_view.dart';
import 'package:flutter/material.dart';

Widget brandName(){
  return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
      Text("ICONIC", style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.w600, fontSize: 20),),
      Text(" Wallpapers", style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.w600, fontSize: 20),),
    ],
  );
}

Widget wallpaperList({List<Wallpaper> wallpapers, context}){
  return wallpapers.length != 0 ? Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: wallpapers.map((wallpaper){
        return GridTile(child: Container(
          child: GestureDetector(
            onTap:(){
              Navigator.push(context, MaterialPageRoute(
                builder: (context)=> ImageView(imageURL: wallpaper.src.portrait,) ) );
            },
                      child: Hero(
              tag: wallpaper.src.portrait,
                        child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(wallpaper.src.portrait, fit: BoxFit.cover,)),
            ),
          ),
        ),
        );
      }).toList(),
      ),
  ) : Center(
    child: Column(children: <Widget>[
      SizedBox(height: 30),
      Text("Could not find what you are looking for!", style: TextStyle(color: Colors.black45, fontSize: 14),),
      Icon(Icons.error),
      SizedBox(height:(MediaQuery.of(context).size.height/1.8)),
    ],)
  );
}