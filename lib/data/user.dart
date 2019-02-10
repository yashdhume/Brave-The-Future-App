class User{
  final String uid;
  final String name;
  double totalDonated;
  int braveCoins;
  String documentID;
  Map<String, int> votes;
  Map<String, double> donations;
  User({this.uid, this.name, this.braveCoins, this.votes, this.totalDonated, this.donations, this.documentID});
  
  factory User.fromMap(Map<String, dynamic> map, String docID){
    return User(
      uid: map['uid'],
      name: map['name'],
      braveCoins: map['braveCoins'],
      totalDonated: map['totalDonated'],
      documentID: docID,
    );
  }
  factory User.newUser(String uid){
    return User(
      uid: uid,
      braveCoins: 10,
      votes: {},
      totalDonated: 0.0,
      donations: {}
    );
  }

  Map<String, dynamic> mapTo(){
    var dataMap = new Map<String, dynamic>();
    dataMap['name'] = this.name;
    dataMap['uid'] = this.uid;
    dataMap['braveCoins'] = this.braveCoins;
    dataMap['votes'] = this.votes;
    dataMap['totalDonated'] = this.totalDonated;
    dataMap['donations'] = this.donations;
    return dataMap;
  }
}