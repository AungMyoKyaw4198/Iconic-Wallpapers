import 'package:WallpaperApp/model/category.dart';
import 'package:WallpaperApp/model/wallpaper.dart';

String apiKey = "563492ad6f917000010000011c1fe9fe22a04a2497b3a1b9577d2ced";
List<Wallpaper> favPics = new List();

List<Wallpaper> getFavWallpaper(){
  return favPics;
}
void addFavWallpaper(Wallpaper value){
  favPics.add(value);
}

void removeFavWallpaper(int index){
  favPics.removeAt(index);
}

List<Category> getCategories(){
  List<Category> categories = new List();
  Category category = new Category();

  //
  category.imageUrl =
      "https://images.pexels.com/photos/1038916/pexels-photo-1038916.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  category.name = "Gaming";
  categories.add(category);
  category = new Category();

  //
  category.imageUrl =
      "https://images.pexels.com/photos/2752777/pexels-photo-2752777.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  category.name = "Movie";
  categories.add(category);
  category = new Category();

  //
  category.imageUrl =
      "https://images.pexels.com/photos/4472111/pexels-photo-4472111.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  category.name = "Music";
  categories.add(category);
  category = new Category();

  //
  category.imageUrl =
      "https://images.pexels.com/photos/4052752/pexels-photo-4052752.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  category.name = "Anime";
  categories.add(category);
  category = new Category();

  //
  category.imageUrl =
      "https://images.pexels.com/photos/1667849/pexels-photo-1667849.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  category.name = "Love";
  categories.add(category);
  category = new Category();

  //
  category.imageUrl =
      "https://images.pexels.com/photos/1056991/pexels-photo-1056991.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  category.name = "Korean";
  categories.add(category);
  category = new Category();

    //
  category.imageUrl =
      "https://images.pexels.com/photos/2643896/pexels-photo-2643896.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  category.name = "Myanmar";
  categories.add(category);
  category = new Category();

    //
  category.imageUrl =
      "https://images.pexels.com/photos/4089658/pexels-photo-4089658.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  category.name = "Cartoon";
  categories.add(category);
  category = new Category();

  //
  category.imageUrl =
      "https://images.pexels.com/photos/545008/pexels-photo-545008.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  category.name = "Street Art";
  categories.add(category);
  category = new Category();

  //
  category.imageUrl =
      "https://images.pexels.com/photos/704320/pexels-photo-704320.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  category.name = "Wild Life";
  categories.add(category);
  category = new Category();

  //
  category.imageUrl =
      "https://images.pexels.com/photos/34950/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  category.name = "Nature";
  categories.add(category);
  category = new Category();

  //
  category.imageUrl =
      "https://images.pexels.com/photos/466685/pexels-photo-466685.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  category.name = "City";
  categories.add(category);
  category = new Category();

  //
  category.imageUrl =
      "https://images.pexels.com/photos/1434819/pexels-photo-1434819.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
  category.name = "Motivation";

  categories.add(category);
  category = new Category();

  //
  category.imageUrl =
      "https://images.pexels.com/photos/2116475/pexels-photo-2116475.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  category.name = "Bikes";
  categories.add(category);
  category = new Category();

  //
  category.imageUrl =
      "https://images.pexels.com/photos/1149137/pexels-photo-1149137.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  category.name = "Cars";
  categories.add(category);
  category = new Category();

  //
  category.imageUrl =
      "https://images.pexels.com/photos/269948/pexels-photo-269948.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260";
  category.name = "Sports";
  categories.add(category);
  category = new Category();

  //
  category.imageUrl =
      "https://images.pexels.com/photos/1669096/pexels-photo-1669096.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260";
  category.name = "Christmas";
  categories.add(category);
  category = new Category();

   //
  category.imageUrl =
      "https://images.pexels.com/photos/509922/pexels-photo-509922.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  category.name = "Minimalism";
  categories.add(category);
  category = new Category();

     //
  category.imageUrl =
      "https://images.pexels.com/photos/4588065/pexels-photo-4588065.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260";
  category.name = "Animals";
  categories.add(category);
  category = new Category();

       //
  category.imageUrl =
      "https://images.pexels.com/photos/4587959/pexels-photo-4587959.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  category.name = "Cats";
  categories.add(category);
  category = new Category();

       //
  category.imageUrl =
      "https://images.pexels.com/photos/825949/pexels-photo-825949.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";
  category.name = "Dogs";
  categories.add(category);
  category = new Category();

  return categories;
}