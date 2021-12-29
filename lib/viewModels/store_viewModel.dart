// ignore_for_file: non_constant_identifier_names
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:multi_sort/multi_sort.dart';
import 'package:mystore/models/store_model.dart';


class StoreVM{

  Future<List<Articles>> getArticles() async{
    var data = await http.get(Uri.parse(apiUrl));

    var jsonData = json.decode(data.body);

    List<Articles> articlesList = [];
    List<bool> criteria = [false, false];

    for(var a in jsonData){

      Articles article = Articles(
          a["images_url"]["thumb"].toString(),
          a["category_id"],
          a["title"],
          a["price"],
          a["creation_date"],
          a["description"],
          a["is_urgent"].toString(),
      );
      DateTime.parse(article.creation_date);

      articlesList.add(article);
      //List<String> prefer = [article.is_urgent, article.creation_date];
      //articlesList.multisort(criteria, prefer);
    }
    articlesList.sort((a,b){
      if(a.is_urgent == "false"){
          return a.creation_date.compareTo(b.creation_date);
      }
      return -1;
    });

    /*
    articlesList.sort(
        (a,b){
          return a.creation_date.compareTo(b.creation_date);
        }
    );*/



    return articlesList;
  }
}

class Articles{
  String images_url;
  final String title;
  final int category_id;
  final double price;
  final String creation_date;
  final String description;
  String is_urgent;

  //Articles(this.category_id,this.title);
  Articles(
      this.images_url,
      this.category_id,
      this.title,
      this.price,
      this.creation_date,
      this.description,
      this.is_urgent
      );
}