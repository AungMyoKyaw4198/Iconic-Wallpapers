import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wallpaper_manager/wallpaper_manager.dart';


class ImageView extends StatefulWidget {
  final String imageURL;
  ImageView({@required this.imageURL});

  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  var filePath;
  int location = WallpaperManager.HOME_SCREEN; // or location = WallpaperManager.LOCK_SCREEN;
  String result;

  setImage(String url) async{
    var file = await DefaultCacheManager().getSingleFile(url);
    await WallpaperManager.setWallpaperFromFile(file.path, location);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
            Hero(
              tag: widget.imageURL,
                      child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.network(widget.imageURL, fit: BoxFit.cover,)),
            ),
            Container(
            child: Align(
              alignment: Alignment.center,
                          child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                
                // 'Set Wallpaper' Button
                GestureDetector(
                  onTap: (){
                    _save();
                  },
                      child: Container(
                    width: MediaQuery.of(context).size.width/2,
                    padding: EdgeInsets.symmetric(horizontal: 8 , vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white54, width: 1),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 4,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      gradient: LinearGradient( 
                        colors: [
                        Color(0x36FFFFFFF),
                        Color(0x0FFFFFFF),
                        ]
                      )
                    ),
                    child: Column(children: <Widget>[
                      Text("Set Wallpaper", style: TextStyle(fontSize: 16,
                      color: Colors.white70,)),
                      Text("Image will be saved to gallery", style: TextStyle(fontSize: 10,
                      color: Colors.white70,),
                      )
                    ],),
                  ),
                ),

                SizedBox(height: 10),
                
                // 'Cancel' Button
                GestureDetector(
                  onTap: (){
                          Navigator.pop(context);
                        },
                  child: Container(
                    width: MediaQuery.of(context).size.width/5,
                    padding: EdgeInsets.symmetric(horizontal: 4 , vertical: 4),
                                        decoration: BoxDecoration(
                      border: Border.all(color: Colors.white54, width: 1),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 4,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      gradient: LinearGradient( 
                        colors: [
                        Colors.red[100],
                        Colors.red[200],
                        ]
                      )
                    ),
                    child: Align(
                       alignment: Alignment.center,
                      child: Text("Cancel", style: TextStyle(color: Colors.white),)))
                ),

                SizedBox(height: 50),
              ],),
            ),
          )
      ],),
    );
  }

  // Request user permission before storing the image
  _requestPermission() async {
    final PermissionHandler _permissionHandler = PermissionHandler();
    await _permissionHandler.requestPermissions([PermissionGroup.storage]);
  }

   // Show massages after user saving the image
  _toastInfo(String info) {
    Fluttertoast.showToast(msg: info, toastLength: Toast.LENGTH_LONG);
  }

  // Save image function
  _save() async {
     await _requestPermission();
    var response = await Dio().get(widget.imageURL,
        options: Options(responseType: ResponseType.bytes));
    final result =
        await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    if(result["isSuccess"]){
      _toastInfo("Image Saved to Gallery");
    } else {
      _toastInfo("Failed to save Image!");
    }
    Navigator.pop(context);
  }
}
