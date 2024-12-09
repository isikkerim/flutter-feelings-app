// import 'package:google_mobile_ads/google_mobile_ads.dart';
//
// import '../Admob/admob_util.dart';
//
// class AdController {
//   InterstitialAd? _interstitialAd;
//   bool _isAdLoaded = false;
//   AdvertisingService _advertisingService = AdvertisingService();
//
//   // Reklamı yükleme
//
//   // Reklam gösterme
//   void showInterstitialAd() {
//     if (_isAdLoaded && _interstitialAd != null) {
//       _interstitialAd!.show();
//       _interstitialAd = null; // Reklam gösterildikten sonra sıfırlayın
//       _advertisingService.loadFullScreenAdvertising();
//     }
//   }
//
//   // Reklam olayları için geri çağırmaları ayarlayın
//   void _setAdCallbacks() {
//     _interstitialAd?.fullScreenContentCallback = FullScreenContentCallback(
//       onAdDismissedFullScreenContent: (ad) {
//         _interstitialAd = null;
//         _isAdLoaded = false;
//         _advertisingService.loadFullScreenAdvertising();
//       },
//       onAdFailedToShowFullScreenContent: (ad, error) {
//         print('Reklam gösterilemedi: $error');
//         ad.dispose();
//         _advertisingService.loadFullScreenAdvertising();
//       },
//     );
//   }
//
//   // Bellek yönetimi için reklamları serbest bırak
//   void dispose() {
//     _interstitialAd?.dispose();
//   }
// }
