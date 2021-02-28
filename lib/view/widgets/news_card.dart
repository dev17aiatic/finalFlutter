import 'dart:convert';

import 'package:app1/models/news.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewsCard extends StatefulWidget {
  final News news;
  final Function(News) onTapFav;
  NewsCard({Key key, @required this.news, this.onTapFav}) : super(key: key);

  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  bool pressHeart = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 344,
      height: MediaQuery.of(context).size.height / 1.72,
      margin: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(blurRadius: 2, spreadRadius: 2, color: Colors.black12)
          ]),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10)),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: widget.news.urlToImage != null
                        ? NetworkImage(widget.news.urlToImage)
                        : AssetImage('assets/img/backbit.png'))),
          ),
          Flexible(
            child: Container(
              padding: EdgeInsets.all(13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.news.title ?? 'Title not find',
                      maxLines: 3,
                      style: GoogleFonts.signika(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  Text(widget.news.author ?? 'Author not find',
                      style: GoogleFonts.signika(
                          fontSize: 14,
                          color: Colors.black45,
                          fontWeight: FontWeight.normal)),
                  Container(
                    height: 10,
                  ),
                  Text(widget.news.description ?? 'Description not find',
                      maxLines: 3,
                      style: GoogleFonts.signika(
                          fontSize: 12,
                          color: Colors.black87,
                          fontWeight: FontWeight.normal)),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 13, left: 13),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    //icon: Icon(Icons.favorite_border_outlined),
                    icon: pressHeart != true
                        ? Icon(Icons.favorite_border_outlined)
                        : Icon(Icons.favorite),
                    onPressed: () {
                      setState(() {
                        pressHeart = !pressHeart;
                        _saveFavoriteList(snapshotReceive: widget.news);
                      });

                      //widget.onTapFav(widget.news);
                    },
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/preview',
                          arguments: widget.news);
                    },
                    child: Text(
                      'MORE',
                      style: GoogleFonts.signika(
                          fontSize: 14,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.normal),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _saveFavoriteList({@required News snapshotReceive}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> FavoriteList = prefs.getStringList('FavoriteList') ?? [];

    FavoriteList.add(json.encode(snapshotReceive.source.toJson()));

    await prefs.setStringList('FavoriteList', FavoriteList);
  }
}
