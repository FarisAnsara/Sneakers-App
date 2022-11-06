import 'dart:convert';
import 'dart:io';
import 'shoe_data.dart';
import 'package:flutter/services.dart' show rootBundle;

// void main() async{
//   print(await fetchData());
// }

Future<List<Shoe>> fetchData() async {
  final json = await rootBundle.loadString('assets/json/json.json');
  List<Shoe> listOfShoes=  List<Shoe>.from((jsonDecode(json)).map((e) => Shoe.fromJson(e))).toList();
  return listOfShoes;
  }

Future<List<Shoe>> fetchDataMen() async {
  final json = await rootBundle.loadString('assets/json/json.json');
  List<Shoe> listOfShoes=  List<Shoe>.from((jsonDecode(json)).map((e) => Shoe.fromJson(e))).where((element) => element.gender=="MEN").toList();
  return listOfShoes;
}

Future<List<Shoe>> fetchDataWomen() async {
  final json = await rootBundle.loadString('assets/json/json.json');
  List<Shoe> listOfShoes=  List<Shoe>.from((jsonDecode(json)).map((e) => Shoe.fromJson(e))).where((element) => element.gender=="WOMEN").toList();
  return listOfShoes;
}

Future<List<Shoe>> fetchDataChild() async {
  final json = await rootBundle.loadString('assets/json/json.json');
  List<Shoe> listOfShoes=  List<Shoe>.from((jsonDecode(json)).map((e) => Shoe.fromJson(e))).where((element) => element.gender=="KIDS").toList();
  return listOfShoes;
}