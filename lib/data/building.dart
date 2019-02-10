import 'package:brave_the_future/data/database.dart';
import 'package:flutter/material.dart';
class Building{
  final String id;
  final String docID;
  final String name;
  final String location;
  final String image;
  final String imageBig;
  final String open;
  final String squareMeter;
  final String description;
  int votes;
  Building({this.docID,this.id,this.name, this.location, this.image, this.imageBig,this.open, this.squareMeter, this.description, this.votes} );
  factory Building.fromMap(Map<String, dynamic> data, String id){
    return Building(
      name: data['name'],
      id: data['id'],
      location: data['location'],
      open: data['open'],
      squareMeter: data['squareMeter'],
      description: data['description'],
      votes: data['coins'],
      docID: id,
    );
  }
  factory Building.fromMapandImage(String thumb, String img, Map<String, dynamic> data, String key){
    return Building(
      name: data['name'],
      id: data['id'],
      location: data['location'],
      open: data['open'],
      description: data['description'],
      squareMeter: data['squareMeter'],
      votes: data['coins'],
      docID: key,
      image: thumb,
      imageBig: img,
    );
  }
}
class Event{

}