import 'package:e_commerce_app/data/repositories/user/user_repository.dart';
import 'package:e_commerce_app/features/authentication/screens/login/login.dart';
import 'package:e_commerce_app/features/authentication/screens/onboarding/onboarding.dart';
import 'package:e_commerce_app/features/authentication/screens/signup/email_verification.dart';
import 'package:e_commerce_app/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce_app/navigation_menu.dart';
import 'package:e_commerce_app/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:e_commerce_app/utils/exceptions/firebase_exceptions.dart';
import 'package:e_commerce_app/utils/exceptions/format_exceptions.dart';
import 'package:e_commerce_app/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // Variables
  final deviceStorage = GetStorage();
  final FirebaseAuth authUser = FirebaseAuth.instance;
  UserCredential? userCredential;
  GetStorage storage = GetStorage();

  // Called from main.dart on app launch
  @override
  void onReady() {
    // Remove the native splash screen
    FlutterNativeSplash.remove();
    // Redirect to appropriate screen
    screenRedirect();
  }

  ///  Function to Show Relevant Screen
  void screenRedirect() {
    final controller = UserController.instance;
    controller.fetchUserRecord();
    final user = authUser.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: user.email));
      }
    } else {
      // Local Storage
      deviceStorage.writeIfNull("isFirstTime", true);
      deviceStorage.read("isFirstTime") != true
          ? Get.offAll(() => LoginScreen())
          : Get.offAll(() => OnboardingScreen());
    }
  }

  /* ----------------------- Email & Password SignIn -----------------------*/

  /// Login
  Future<UserCredential> login({
    required String email,
    required String password,
  }) async {
    try {
      return await authUser.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseExceptions(e.code).message;
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } on FormatException catch (_) {
      throw AppFormatException();
    } catch (e) {
      throw "Something went wrong! please try again";
    }
  }

  /// SignIn / Create new Account or User
  Future<UserCredential> registerWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      return await authUser.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseExceptions(e.code).message;
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } on FormatException catch (_) {
      throw AppFormatException();
    } catch (e) {
      throw "Something went wrong! please try again";
    }
  }

  /// Send Email Verification
  Future<void> sendEmailVerificationToUser() async {
    try {
      await authUser.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseExceptions(e.code).message;
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } on FormatException catch (_) {
      throw AppFormatException();
    } catch (e) {
      throw "Something went wrong! please try again";
    }
  }

  /// Logout Function
  Future<void> logout() async {
    try {
      await GoogleSignIn.instance.signOut();
      await authUser.signOut();
      // Get.delete<UserController>();
      Get.offAll(() => LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseExceptions(e.code).message;
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } on FormatException catch (_) {
      throw AppFormatException();
    } catch (e) {
      throw "Something went wrong! please try again";
    }
  }

  /// Logout Function
  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord();
      await GoogleSignIn.instance.disconnect();
      await AuthenticationRepository.instance.authUser.currentUser?.delete();
      storage.remove("REMEMBER_ME_EMAIL");
      storage.remove("REMEMBER_ME_PASSWORD");
      // Get.delete<UserController>();
      Get.offAll(() => LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseExceptions(e.code).message;
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } on FormatException catch (_) {
      throw AppFormatException();
    } catch (e) {
      throw "Something went wrong! please try again";
    }
  }

  Future<void> reAuthenticateUserCredentials(
    String email,
    String password,
  ) async {
    try {
      final credentials = EmailAuthProvider.credential(
        email: email,
        password: password,
      );
      await authUser.currentUser!.reauthenticateWithCredential(
        credentials,
      );
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseExceptions(e.code).message;
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } on FormatException catch (_) {
      throw AppFormatException();
    } catch (e) {
      throw "Something went wrong! please try again";
    }
  }

  /* ----------------------- Federated & Social SignIn -----------------------*/

  /// Google Sign-In
  Future<UserCredential> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      // await GoogleSignIn.instance.initialize();

      final GoogleSignInAccount googleUser = await GoogleSignIn.instance
          .authenticate();

      // if (googleUser == null) {
      //   throw Exception("Google Sign-In aborted by user");
      // }

      // final authorization = await googleUser.authorizationClient
      //     .authorizeScopes(['email', 'openId', 'profile']);

      // obtain the authUser details from the request
      // final accessToken = authorization.accessToken;
      final idToken = googleUser.authentication.idToken;

      if (idToken == null) {
        throw "Id Token is Null";
      }

      final credentials = GoogleAuthProvider.credential(
        idToken: idToken,
        // accessToken: accessToken,
      );

      return await authUser.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseExceptions(e.code).message;
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } on FormatException catch (_) {
      throw AppFormatException();
    } catch (e) {
      throw "Something went wrong! please try again";
    }
  }

  /* ----------------------- ./end Federated Identity & Social SignIn  -----------------------*/

  /* ----------------------- Forget Password -----------------------*/

  Future<void> sendResetPasswordEmail(String email) async {
    try {
      await authUser.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw AppFirebaseExceptions(e.code).message;
    } on FormatException catch (_) {
      throw AppFormatException();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong! please try again";
    }
  }
}
