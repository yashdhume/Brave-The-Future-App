import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brave_the_future/data/auth.dart';
import 'package:brave_the_future/data/user.dart';
import 'package:brave_the_future/data/building.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

Future<User> createUser(User user)async {
  await Firestore.instance.runTransaction((transaction) async{
    DocumentReference ref = Firestore.instance.collection('Users').document();
    user.documentID = ref.documentID;
    await transaction.set(ref, user.mapTo());
  });
  return user;
}

Future<User> getUser(Auth auth) async{
  QuerySnapshot snapshot = await Firestore.instance.collection('Users')
    .where('uid', isEqualTo: auth.getUID())
    .getDocuments();
  print(snapshot.documents);
  if (snapshot.documents == null ||  snapshot.documents.isEmpty) return null; 
  var document = snapshot.documents[0];
  return User.fromMap(document.data, document.documentID);
}

Future<bool> updateUser(User user)async{
  await Firestore.instance.runTransaction((transaction)async{
    await Firestore.instance.document('Users/' + user.documentID).updateData(user.mapTo())
    .catchError((e){print('Error Updating User Data : ' + e); return false;});
  });
  return true;
}

Future<List<Building>> getBuildings()async{
  QuerySnapshot snapshot = await Firestore.instance.collection("Buildings").getDocuments();
  List<Building> a = [];
  await snapshot.documents.forEach((doc) async{
    if (doc['thumbnail'] != null){
      String thumb = await getImage(doc['thumbnail']);
      a.add(Building.fromMapandImage(thumb, null, doc.data));
    }else{
      a.add(Building.fromMap(doc.data));
    }
  });
  return a;
}
Future<String> getImage(String path) async{
  return await FirebaseStorage.instance.ref().child(path).getDownloadURL();
}
/*
get the link and throw it in here tada
Image.network(
  'https://raw.githubusercontent.com/flutter/website/master/_includes/code/layout/lakes/images/lake.jpg',
)
*/
