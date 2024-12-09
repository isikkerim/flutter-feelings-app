import 'package:flutter/material.dart';

import '../Auth/auth_service.dart';
import '../views/login_view.dart';
import '../widgets/bottom_nav_bar.dart';

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: FirebaseAuthService().authStateChanges(),
      builder: (context, helperSnapshot) {
        if (helperSnapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator()); // Yükleniyor ekranı
        }

        if (helperSnapshot.hasError) {
          return const Center(child: Text("Bir hata oluştu!")); // Hata ekranı
        }

        if (helperSnapshot.data == true) {
          // İlk defa giriş yapıldıysa onboarding sayfasına yönlendir
          //
          //  return OnBoardingPage();
          return BottomNavBar();
        } else {
          return FutureBuilder(
              future: FirebaseAuthService().authStateChanges(),
              builder: (context, authSnapshot) {
                if (authSnapshot.connectionState == ConnectionState.waiting) {
                  return const Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ); // Yükleniyor ekranı
                }
                if (authSnapshot.hasError) {
                  return const Scaffold(
                      body: Center(
                          child: Text("Bir hata oluştu!"))); // Hata ekranı
                }
                if (authSnapshot.data == true) {
                  return BottomNavBar(); // Kullanıcı giriş yaptıysa
                } else {
                  return LoginScreen(); // Kullanıcı giriş yapmadıysa
                }
              });
        }
      },
    );
  }
}
