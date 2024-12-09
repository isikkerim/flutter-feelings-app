import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';

import '../Auth/auth_service.dart';
import '../Root/user_state_util.dart';

String email = '';
String password = '';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const inputBorder = BorderRadius.vertical(
      bottom: Radius.circular(10.0),
      top: Radius.circular(20.0),
    );

    return FlutterLogin(
      savedEmail: email,
      savedPassword: password,
      messages: LoginMessages(
        providersTitleFirst: "veya",
        userHint: 'E-posta',
        // Email input alanı için ipucu
        passwordHint: 'Şifre',
        // Şifre input alanı için ipucu
        confirmPasswordHint: 'Şifreyi Onayla',
        // Şifre onayı için ipucu
        loginButton: 'Giriş Yap',
        // Giriş yap butonu
        signupButton: 'Kayıt Ol',
        // Kayıt ol butonu
        forgotPasswordButton: 'Şifremi Unuttum',
        // Şifremi unuttum butonu
        recoverPasswordButton: 'Gönder',
        // Şifre kurtarma butonu
        recoverPasswordIntro: 'Lütfen e-posta adresinizi girin.',
        // Şifre kurtarma açıklaması
        recoverPasswordDescription:
            'Şifre kurtarma bağlantısı e-posta adresinize gönderilecektir.',
        goBackButton: 'Geri Dön',
        // Geri dön butonu
        confirmPasswordError: 'Şifreler eşleşmiyor.',
        // Şifre onayı hatası
        recoverPasswordSuccess: 'Şifre kurtarma bağlantısı gönderildi.',
        // Şifre kurtarma başarı mesajı

        additionalSignUpFormDescription: "veya",
        additionalSignUpSubmitButton: "veya",
      ),
      onLogin: (data) => Future(() async {
        email = data.name;
        password = data.password;
        UserCredential? credential =
            await FirebaseAuthService().userLoginWithEmailPassword(
          emailAddress: data.name,
          password: data.password,
        );
        if (credential != null) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => Root(),
            ),
          );
        } else {
          Get.snackbar(
            'Giriş Hatası',
            'Kullanıcı adı veya şifre yanlış.',
            backgroundColor: Colors.red,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      }),
      onSignup: (data) => Future(
        () async {
          UserCredential? credential =
              await FirebaseAuthService().createUserwithMailandPassword(
            emailAddress: data.name.toString(),
            password: data.password.toString(),
          );

          if (credential != null) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => Root(),
              ),
            );
          } else {
            Get.snackbar(
              'Kayıt Hatası',
              'Kullanıcı oluşturulurken bir hata oluştu.',
              backgroundColor: Colors.red,
              colorText: Colors.white,
              snackPosition: SnackPosition.BOTTOM,
            );
          }
        },
      ),
      onRecoverPassword: (data) => Future(
        () {
          FirebaseAuthService().changeUserPassword(email: data);
        },
      ),
      loginProviders: <LoginProvider>[
        LoginProvider(
          icon: Icons.g_mobiledata,
          label: 'Google ile Giriş Yap',
          callback: () async {
            // UserCredential? credential =
            // await FirebaseAuthService().signInWithGoogle();
            // if (credential != null) {
            //   Navigator.of(context).pushReplacement(
            //     MaterialPageRoute(
            //       builder: (context) => Root(),
            //     ),
            //   );
            // } else {
            //   Get.snackbar(
            //     'Giriş Hatası',
            //     'Google hesabı ile giriş başarısız.',
            //     backgroundColor: Colors.red,
            //     colorText: Colors.white,
            //     snackPosition: SnackPosition.BOTTOM,
            //   );
            // }
          },
        ),
      ],
      theme: LoginTheme(
        textFieldStyle:
            TextStyle(color: Colors.black, backgroundColor: Colors.black),
        titleStyle: const TextStyle(
          color: Colors.black,
          fontFamily: 'Quicksand',
          letterSpacing: 4,
        ),
        bodyStyle: const TextStyle(
          color: Colors.black,
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline,
        ),
        buttonStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w800,
        ),
        cardTheme: CardTheme(
          elevation: 5,
          margin: const EdgeInsets.only(top: 15),
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(100.0)),
        ),
        inputTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.purple.withOpacity(.1),
          contentPadding: EdgeInsets.zero,
          errorStyle: const TextStyle(),
          labelStyle: const TextStyle(
            fontSize: 12,
            color: Colors.black,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 4),
            borderRadius: inputBorder,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 5),
            borderRadius: inputBorder,
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 7),
            borderRadius: inputBorder,
          ),
          focusedErrorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(width: 8),
            borderRadius: inputBorder,
          ),
          disabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(width: 5),
            borderRadius: inputBorder,
          ),
        ),
        buttonTheme: LoginButtonTheme(
          elevation: 9.0,
          highlightElevation: 6.0,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
