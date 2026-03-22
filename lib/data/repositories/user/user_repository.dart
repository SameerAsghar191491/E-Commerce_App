import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/data/repositories/authentication/authetication_repository.dart';
import 'package:e_commerce_app/features/authentication/models/userModel.dart';

import 'package:e_commerce_app/utils/exceptions/firebase_exceptions.dart';
import 'package:e_commerce_app/utils/exceptions/format_exceptions.dart';
import 'package:e_commerce_app/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  /// Variables
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  /// Function to store userdata in Firebase Firestore
  Future<void> saveUserData(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw AppFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const AppFormatException();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong, please try again later";
    }
  }

  /// fetch user details from Firestore
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser.currentUser?.uid)
          .get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseException catch (e) {
      throw AppFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const AppFormatException();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong, please try again later";
    }
  }

  /// Funtion to update user data in Firestore
  Future<void> updateUserDetails(UserModel updatedUser) async {
    try {
      await _db
          .collection("Users")
          .doc(updatedUser.id)
          .set(updatedUser.toJson());
    } on FirebaseException catch (e) {
      throw AppFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const AppFormatException();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong, please try again later";
    }
  }

  /// Funtion to update Single Field in Firestore
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser.currentUser?.uid)
          .update(json);
    } on FirebaseException catch (e) {
      throw AppFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const AppFormatException();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong, please try again later";
    }
  }

  /// Funtion to update user data in Firestore
  Future<void> removeUserRecord() async {
    try {
      await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser.currentUser?.uid)
          .delete();
    } on FirebaseException catch (e) {
      throw AppFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const AppFormatException();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong, please try again later";
    }
  }

  Future<String> uploadImage(String path, File image) async {
    try {
      final ref = _firebaseStorage.ref().child(path);
      final uploadedImage = ref.putFile(image);

      final imageUrl = await uploadedImage.snapshot.ref.getDownloadURL();

      return imageUrl;
    } on FirebaseException catch (e) {
      throw AppFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw const AppFormatException();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong, please try again later";
    }
  }
}
