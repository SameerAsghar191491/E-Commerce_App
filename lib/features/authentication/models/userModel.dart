// Model Class representing User Data

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? firstName;
  String? lastName;
  String? userName;
  String? email;
  String? password;
  String? phoneNumber;
  String? profilePicture;
  String? fullName;

  /// constructor for UserModel
  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    this.password,
    required this.phoneNumber,
    required this.userName,
    required this.profilePicture,
    this.fullName,
  });

  /// Convert model to JSON structure for storing data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'UserName': userName,
      'Email': email,
      'Password': password,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
      'FullName': "$firstName $lastName",
    };
  }

  static List<String> nameParts(String fullName) => fullName.split(" ");

  static String generateUsername(String fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseusername = "$firstName$lastName";
    String usernameWithPrefix = "MSA_$camelCaseusername";
    return usernameWithPrefix;
  }

  static UserModel empty() => UserModel(
    id: "",
    email: "",
    firstName: "",
    lastName: "",
    phoneNumber: "",
    userName: "",
    profilePicture: "",
    fullName: "",
  );

  /// Factory method to create a UserModel from a Firebase document snapshot
  factory UserModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        email: data['Email'] ?? '',
        firstName: data['FirstName'] ?? '',
        lastName: data['LastName'] ?? '',
        password: data['Password'] ?? '',
        phoneNumber: data['PhoneNumber'] ?? '',
        userName: data['UserName'] ?? '',
        profilePicture: data['ProfilePicture'] ?? '',
        fullName: data['FullName'] ?? '',
      );
    }
    return UserModel.empty();
  }
}
