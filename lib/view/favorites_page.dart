import 'dart:convert';

import 'package:app1/models/model_newsApi.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  List<String> favoriteList = [];
  List<Source> sourceList = [];
  List<String> stringList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites List'),
      ),
      body: Container(
        padding: EdgeInsets.only(right: 10, left: 10),
        child: Column(
          children: [
            FutureBuilder<List<Source>>(
              future: getFavoritesList(),
              // ignore: missing_return
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  Container(
                      child: ListView.builder(
                          itemCount: snapshot.data.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Text(snapshot.data[index].Name);
                          }));
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<List<Source>> getFavoritesList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    favoriteList = prefs.getStringList('FavoriteList') ?? [];
    List<Source> tempsourceList;
    favoriteList.forEach((json) async {
      Source sourcs = Source.fromjson(jsonDecode(json));
      //stringList.add(temp.name.toString());
      sourceList.add(sourcs);
    });

    print(sourceList);
    return sourceList;
  }
}
