import 'dart:convert';

import 'package:WallpaperApp/model/wallpaper.dart';
import 'package:WallpaperApp/service/data.dart';
import 'package:WallpaperApp/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Search extends StatefulWidget {
  final String searchTerm;
  Search({@required this.searchTerm});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
    List<Wallpaper> wallpapers = new List();
  TextEditingController searchController = new TextEditingController();
  bool _loading = true;
  bool isLoadingFailed = false;
   int pageValue = 0;

  getSearchedWallpaper(String query) async{
    int pageNumber = pageValue + 1 ;
    await http.get("https://api.pexels.com/v1/search?query=$query&per_page=30&page=$pageNumber",
    headers: {
      "Authorization" : apiKey
    }).then((value){
        Map<String, dynamic> jsonData = jsonDecode(value.body);
        jsonData["photos"].forEach((element){
          Wallpaper wallpaperModel = new Wallpaper();
          wallpaperModel = Wallpaper.fromMap(element);
          wallpapers.add(wallpaperModel);
        });
        setState(() {
          _loading = false;
          isLoadingFailed = false;
        });
        pageValue ++;
    }).catchError((error){
      setState(() {
      _loading = false;
      isLoadingFailed = true;
    });
    });
  }

  @override
  void initState() {
    getSearchedWallpaper(widget.searchTerm);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: brandName(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 16,),
              Container(
                padding: EdgeInsets.only(left: 16),
                              child: Row(
                  children: <Widget>[
                    Text("Search Result for ", style: TextStyle(fontSize: 15)),
                    Text(widget.searchTerm, style: TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.w500),),
                  ]
                ),
              ),
              
              SizedBox(height: 16,),
               _loading ? Center(
              child: Container(
          child: CircularProgressIndicator(),
        ),
      ) :isLoadingFailed ? Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(height:30,),
                    Text('Failed to load Wallpapers!', style: TextStyle(color: Colors.black45, fontSize: 14),),
                              IconButton(
                    icon: Icon(Icons.refresh),
                    color: Colors.black45,
                    tooltip: 'Tap to Retry',
                      onPressed: () {
                      getSearchedWallpaper(widget.searchTerm);
                      },
                  ),
                  SizedBox(height:(MediaQuery.of(context).size.height/2)-120)
                  ],)
              ):wallpaperList(wallpapers: wallpapers, context: context),
                SizedBox(height:10,),
                  wallpapers.length != 0 ?  GestureDetector(
                  onTap: (){
                    getSearchedWallpaper(widget.searchTerm);
                  },
                                  child: Container(
                    width: MediaQuery.of(context).size.width/2,
                    padding: EdgeInsets.symmetric(horizontal: 8 , vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white54, width: 1),
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient( 
                        colors: [
                        Color(0xFF0D47A1),
                    Color(0xFF1976D2),
                    Color(0xFF42A5F5),
                        ]
                      )
                    ),
                    child: Column(children: <Widget>[
                      Text("See More", style: TextStyle(fontSize: 16,
                      color: Colors.white70,)),
                    ],),
                  ),
                ) : SizedBox.shrink(),

              SizedBox(height:10,),
              // Container(
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(5),color: Colors.blue[200],
              //     gradient: LinearGradient( 
              //           colors: [
              //           Color(0x36FFFFFFF),
              //           Color(0x0FFFFFFF),
              //           ]
              //         )
              //   ),
              //   width: MediaQuery.of(context).size.width,
              //   padding: EdgeInsets.symmetric(vertical: 10),
              //   child: Column(children: <Widget>[
              //     Text('Copyright ©2020, All Rights Reserved.',style: TextStyle(fontWeight:FontWeight.w300, fontSize: 10.0, color: Color(0xFF162A49)),),
              //     Text('Powered by Pexels.com',style: TextStyle(fontWeight:FontWeight.w300, fontSize: 10.0,color: Color(0xFF162A49)),),
              //   ],)
              // )
            ],) ,),),
    );
  }
}