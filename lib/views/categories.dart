import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:wallpaper/data/data.dart';
import 'package:wallpaper/modals/wallpaper_model.dart';
import 'package:wallpaper/widgets/widget.dart';

class Categories extends StatefulWidget {
  final String categoryName;
  Categories({this.categoryName});
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<WallpaperModel> wallpapers = new List();

  getSearchWallpapers(String query) async {
    var response = await http.get(
      'https://api.pexels.com/v1/search?query=$query&per_page=30',
      headers: {
        'Authorization': apiKey,
      },
    );

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData['photos'].forEach((element) {
      WallpaperModel wallpaperModel = new WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
    });
  }

  @override
  void initState() {
    super.initState();
    getSearchWallpapers(widget.categoryName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: brandName(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 16,
              ),
              wallpapersList(
                wallpapers: wallpapers,
                context: context,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
