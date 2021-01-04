import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper/modals/wallpaper_model.dart';
import 'package:wallpaper/views/image_view.dart';

Widget brandName() {
  return RichText(
    text: TextSpan(
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        children: <TextSpan>[
          TextSpan(
            text: 'Wallpaper',
            style: TextStyle(color: Colors.black87),
          ),
          TextSpan(
            text: 'App',
            style: TextStyle(color: Colors.blue),
          ),
        ]),
  );
}

Widget wallpapersList({
  List<WallpaperModel> wallpapers,
  context,
}) {
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: 16,
    ),
    child: GridView.count(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6,
      crossAxisSpacing: 6,
      children: wallpapers.map((wallpaper) {
        return GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ImageView(
                    imgUrl: wallpaper.src.portrait,
                  ),
                ),
              );
            },
            child: Hero(
              tag: wallpaper.src.portrait,
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    wallpaper.src.portrait,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    ),
  );
}
