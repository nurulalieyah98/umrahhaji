import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:umrahhaji/models/users_model.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  //Collection Reference (Users)
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');

  // Get Users using Future Data Type
  Future getUser(String id) async {
    final DocumentSnapshot snapshot = await _usersCollection.doc(id).get();

    return Users(
      uid: snapshot.get('uid'),
      name: snapshot.get('name'),
      email: snapshot.get('email'),
      cellnumber: snapshot.get('cellnumber'),
    );
  }

  //create user info
  Future userInfo(String name, String email, String cellnumber) async {
    return await _usersCollection.doc(uid).set({
      'name': name,
      'email': email,
      'cellnumber': cellnumber,
    });
  }

  //Update Users Info
  Future updateUserData(String name, String email, String cellnumber) async {
    return await _usersCollection.doc(uid).set({
      'name': name,
      'email': email,
      'cellnumber': cellnumber,
    });
  }

  //Get User Data from Snapshot
  Users _usersDataFromSnapshot(DocumentSnapshot snapshot) {
    return Users(
      uid: uid,
      name: snapshot.get('name') ?? '',
      cellnumber: snapshot.get('cellnumber') ?? '',
      email: snapshot.get('email') ?? '',
    );
  }

  //Get User Document Stream
  Stream<Users> get userData {
    return _usersCollection.doc(uid).snapshots().map(_usersDataFromSnapshot);
  }
}
