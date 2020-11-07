import 'package:bomoco/models/article.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices {
  FirebaseFirestore _fireStoreDataBase = FirebaseFirestore.instance;

 //recieve the data
 
  Stream<List<Article>> getUserList() {
    return _fireStoreDataBase.collection('informations').doc('various').collection('news')
        .snapshots()
        .map((snapShot) => snapShot.docs
        .map((document) => Article.fromJson(document.data()))
        .toList());
  }

  //upload a data
  addUser(){
    var addUserData = Map<String,dynamic>();
    addUserData['name'] = "Andrew Holder";
    addUserData['age'] = "31yrs";
    return _fireStoreDataBase.collection('user').document('user_03').setData(addUserData);
  }
}