import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tacuara_app/modules/authentication_module/register_flow/domain/user_register_domain.dart';
//import 'package:tacuara_app/modules/dashboard_admin_module/home_flow/presentation/views/regsiter_user_view.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;

  UserRepositoryImpl({
    required FirebaseAuth firebaseAuth,
    required FirebaseFirestore firebaseFirestore,
  })  : _firebaseAuth = firebaseAuth,
        _firebaseFirestore = firebaseFirestore;

  @override
  Future<String> registerUser(String name, String lastname, String cellphone,
      String email, String password, String confirmpassword) async {
    try {
      final UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      final userId = userCredential.user!.uid;

      await _firebaseFirestore.collection('user').doc(userId).set({
        'name': name,
        'lastname': lastname,
        'cellphone': cellphone,
        'email': email,
        'isAdmin': false,
      });
      return userId;
    } catch (e) {
      return e.toString();
    }
  }

  @override
  Future<String> registerAdmin(String name, String lastname, String cellphone,
      String email, String password, String confirmpassword) async {
    try {
      final UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      final userId = userCredential.user!.uid;

      await _firebaseFirestore.collection('admins').doc(userId).set({
        'name': name,
        'lastname': lastname,
        'cellphone': cellphone,
        'email': email,
        'isAdmin': true,
      });
      return userId;
    } catch (e) {
      return e.toString();
    }
  }
}


  // Future<void> registerAdmin(String name, String lastname, String cellphone,
  //     String email, String password, String confirmpassword) async {
  //   try {
  //     final UserCredential userCredential = await _firebaseAuth
  //         .createUserWithEmailAndPassword(email: email, password: password);

  //     final userId = userCredential.user!.uid;

  //     await _firebaseFirestore.collection('admins').doc(userId).set({
  //       'name': name,
  //       'lastname': lastname,
  //       'cellphone': cellphone,
  //       'email': email,
  //       'isAdmin': true,
  //     });
  //     return userId;
  //   } catch (e) {
  //     return e.toString();
  //   }
  // }

