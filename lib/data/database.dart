import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brave_the_future/data/auth.dart';
import 'package:brave_the_future/data/user.dart';

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
