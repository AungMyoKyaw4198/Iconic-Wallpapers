import 'dart:convert';

import 'package:WallpaperApp/components/category_tile.dart';
import 'package:WallpaperApp/model/category.dart';
import 'package:WallpaperApp/model/wallpaper.dart';
import 'package:WallpaperApp/service/data.dart';
import 'package:WallpaperApp/views/search.dart';
import 'package:WallpaperApp/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = new TextEditingController();
  List<Category> categories = new List();
  List<Wallpaper> wallpapers = new List();
  bool _loading = true;
  bool isLoadingFailed = false;
   int pageValue = 0;

  // getting wallpapers from the api
  getTrendingWallpaper() async{
    int pageNumber = pageValue + 1 ;
    await http.get("https://api.pexels.com/v1/curated?per_page=30&page=$pageNumber",
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
    super.initState();
    getTrendingWallpaper();
    // get categories from the data file
    categories = getCategories();
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

              // Search Box Container
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xfff5f8fd),
                  ),
                            child: Row(
                  children: <Widget>[
                    Expanded(
                        child: TextField(
                           autofocus: false,
                          controller: searchController,
                        decoration: InputDecoration(
                          hintText: "Search Wallpaper...",
                        border: InputBorder.none),
                      ),
                    ),
                     GestureDetector(
                      onTap: (){
                       FocusScope.of(context).unfocus();
                      searchController.clear();
                      },
                      child: Container(child: Icon(Icons.clear, color: Colors.red,))),
                      SizedBox(width: 5),
                    GestureDetector(
                      onTap: (){
                        if (searchController.text != ''){
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context)=> Search(
                              searchTerm: searchController.text,
                            )));
                        }
                      },
                      child: Container(child: Icon(Icons.search , color: Colors.blueAccent,))),
                  ]
                ),
              ),

              SizedBox(height: 10),

              // Categories Container
              Container(
                padding: EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                child:
                  Text("Categories", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.blueAccent),
                )),
                 SizedBox(height: 16),
              Container(
                height: 80,
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                  itemCount : categories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index ){
                    return CategoryTile(
                      title: categories[index].name,
                      imageURL: categories[index].imageUrl,
                    );
                  }),
              ),

              // Treanding Photos Container
              Container(
                padding: EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                child: Text("Trending Photos", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.blueAccent),)),
              SizedBox(height:10,),
               _loading ? Center(
                 child: Container(
                  child: CircularProgressIndicator(),
               ),
              ) : isLoadingFailed ? 
              
              // Show error message if loading failed
              Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(height:30,),
                    Text('Failed to load Wallpapers!', style: TextStyle(color: Colors.black45, fontSize: 14),),
                              IconButton(
                    icon: Icon(Icons.refresh),
                    color: Colors.black45,
                    tooltip: 'Tap to Retry',
                      onPressed: () {
                      getTrendingWallpaper();
                      },
                  ),
                  SizedBox(height:(MediaQuery.of(context).size.height/2)-120)
                  ],)
              ): 

              // show wallpapers if there is no error
              wallpaperList(wallpapers: wallpapers, context: context),

              SizedBox(height:10,),

              // if loading or loading is failed , remove the 'see more' button
              // else show the  'see more' button
              _loading || isLoadingFailed ? SizedBox.shrink() : GestureDetector(
              onTap: (){
                getTrendingWallpaper();
              },
              child: Container(
                width: MediaQuery.of(context).size.width/2,
                padding: EdgeInsets.symmetric(horizontal: 8 , vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white54, width: 1),
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient( 
                    colors: [
                    Colors.blue[300],
                    Colors.blue[400],
                    Colors.blue[500],
                    Colors.blue[400],
                    ]
                  )
                ),
                child: Column(children: <Widget>[
                  Text("See More", style: TextStyle(fontSize: 16,
                  color: Colors.white70,)),
                    ],),
                  ),
                ),

            SizedBox(height:10,),
            ],
            ),
            ),
      ),
      
    );
  }
}
