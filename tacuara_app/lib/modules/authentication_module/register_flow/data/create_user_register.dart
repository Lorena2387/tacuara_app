import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:tacuara_app/modules/authentication_module/register_flow/domain/models/user.dart';

class CreateUserRegister {
  static Future<void> saveUserData(
      {required UserModel user, required String uid}) async {
    final userRegister = FirebaseFirestore.instance.collection('user').doc(uid);
    await userRegister.set(user.toJson());
  }
}
