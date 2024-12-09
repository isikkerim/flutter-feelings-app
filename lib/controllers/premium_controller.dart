// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:faluygulamasione/services/premiumUserService/fastest_service.dart';
// import 'package:faluygulamasione/services/premiumUserService/vip_service.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class UserPremiumController extends GetxController {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//
//   var isPremium = false.obs;
//   var premiumExpiry = Rxn<DateTime>();
//   var isFastest = false.obs;
//   var fastestExpiry = Rxn<DateTime>();
//
//   @override
//   void onInit() {
//     super.onInit();
//     _checkUserStatus();
//   }
//
//   Future<void> _checkUserStatus() async {
//     User? user = _auth.currentUser;
//     if (user != null) {
//       var userData = await _userService.getUserPremiumStatus(user.uid);
//       var fastestData = await _fastestService.getUserFastestStatus(user.uid);
//       isPremium.value = userData['isPremium'] ?? false;
//       premiumExpiry.value = (userData['premiumExpiry'] as Timestamp?)?.toDate();
//
//       isFastest.value = fastestData['isFastest'] ?? false;
//       fastestExpiry.value =
//           (fastestData['fastestExpiry'] as Timestamp?)?.toDate();
//     }
//   }
//
//   Future<void> extendPremium() async {
//     User? user = _auth.currentUser;
//     if (user != null && isPremium.value) {
//       // Extend premium by adding a period to the current expiry date
//       DateTime newExpiry = premiumExpiry.value?.add(Duration(days: 30)) ??
//           DateTime.now().add(Duration(days: 30));
//
//       await _userService.updateUserPremiumStatus(user.uid, true, newExpiry);
//       premiumExpiry.value = newExpiry; // Update local state
//       Get.snackbar("Success", "Premium extended for another 30 days");
//     } else {
//       Get.snackbar("Error", "You are not a premium user");
//     }
//   }
//
//   Future<void> buyPremium() async {
//     User? user = _auth.currentUser;
//     if (user != null) {
//       // Buy premium by setting the initial expiry date
//       DateTime expiry =
//       DateTime.now().add(Duration(days: 30)); // 30 days of premium access
//
//       await _userService.updateUserPremiumStatus(user.uid, true, expiry);
//       premiumExpiry.value = expiry; // Update local state
//       isPremium.value = true; // Update premium status
//       Get.snackbar("Success", "You are now a premium user");
//     }
//   }
//
//   Future<void> extendFastest() async {
//     User? user = _auth.currentUser;
//     if (user != null && isFastest.value) {
//       // Extend fastest service by adding a period to the current expiry date
//       DateTime newExpiry = fastestExpiry.value?.add(Duration(days: 30)) ??
//           DateTime.now().add(Duration(days: 30));
//
//       await _fastestService.updateUserFastestStatus(user.uid, true, newExpiry);
//       fastestExpiry.value = newExpiry; // Update local state
//       Get.snackbar("Success", "Fastest service extended for another 30 days");
//     } else {
//       Get.snackbar("Error", "You are not a fastest user");
//     }
//   }
//
//   Future<void> buyFastest() async {
//     User? user = _auth.currentUser;
//     if (user != null) {
//       // Buy fastest service by setting the initial expiry date
//       DateTime expiry =
//       DateTime.now().add(Duration(days: 30)); // 30 days of fastest access
//
//       await _fastestService.updateUserFastestStatus(user.uid, true, expiry);
//       fastestExpiry.value = expiry; // Update local state
//       isFastest.value = true; // Update fastest status
//       Get.snackbar("Success", "You are now a fastest user");
//     }
//   }
// }