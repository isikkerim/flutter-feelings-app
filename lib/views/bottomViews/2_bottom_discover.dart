import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Root/color.dart';
import '../../widgets/kesfet_widget/kesfet_content_selector.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: ColorConstants.light_background_linear_gradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(10.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 3 / 2,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return GestureDetector(
                    onTap: () {
                      if (index >= 0 && index < 18) {
                        Get.to(DynamicContentSelector(pageKey: index + 1));
                      } else {
                        print('Invalid index');
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        image: DecorationImage(
                          image: AssetImage(category['image']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          gradient: LinearGradient(
                            colors: [
                              Colors.black.withOpacity(0.6),
                              Colors.transparent,
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            category['title']!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final List<Map<String, String>> categories = [
  {
    'title': 'aile_iliskileri',
    'image': 'assets/images/asmr01.jpg',
    'description': 'Ruhsal ve bedensel rahatlama için rehberli meditasyonlar.'
  },
  {
    'title': 'anksiyete',
    'image': 'assets/images/bakim01.jpg',
    'description':
        'Hayatta daha fazla motivasyon ve ilham bulmanıza yardımcı olacak içerikler.'
  },
  {
    'title': 'arkadaslik_iliskileri',
    'image': 'https://via.placeholder.com/150',
    'description':
        'Anksiyete ile başa çıkmak için çeşitli teknikler ve tavsiyeler.'
  },
  {
    'title': 'depresyon',
    'image': 'https://via.placeholder.com/150',
    'description':
        'Daha kaliteli ve derin uyku uyumanıza yardımcı olacak rehberler.'
  },
  {
    'title': 'duygusal_zeka',
    'image': 'https://via.placeholder.com/150',
    'description':
        'Depresyon belirtileri ile nasıl başa çıkılacağına dair bilgiler ve stratejiler.'
  },
  {
    'title': 'empati',
    'image': 'https://via.placeholder.com/150',
    'description':
        'Stresinizi yönetmek için uygulayabileceğiniz rahatlatıcı egzersizler.'
  },
  {
    'title': 'farkindalik',
    'image': 'https://via.placeholder.com/150',
    'description':
        'Günlük hayatınızdaki küçük anlara dikkat etmenizi sağlayacak farkındalık teknikleri.'
  },
  {
    'title': 'iletisim_becerileri',
    'image': 'https://via.placeholder.com/150',
    'description':
        'Kendinize nasıl daha fazla özen gösterebileceğiniz ile ilgili ipuçları.'
  },
  {
    'title': 'kariyer_yonetimi',
    'image': 'https://via.placeholder.com/150',
    'description': 'Sağlıklı ilişkiler kurmak için etkili iletişim teknikleri.'
  },
  {
    'title': 'kendine_guven',
    'image': 'https://via.placeholder.com/150',
    'description': 'Kişisel gelişim için okuma, düşünme ve uygulama yöntemleri.'
  },
  {
    'title': 'kisisel_gelisim',
    'image': 'https://via.placeholder.com/150',
    'description':
        'Özgüveninizi artırmaya yardımcı olacak ipuçları ve tavsiyeler.'
  },
  {
    'title': 'meditasyon',
    'image': 'https://via.placeholder.com/150',
    'description':
        'Zihinsel sağlığınızı iyileştirmek için günlük yaşamınıza uygulayabileceğiniz pratik öneriler.'
  },
  {
    'title': 'oz_bakim',
    'image': 'https://via.placeholder.com/150',
    'description':
        'Duygusal zekanızı geliştirmek ve duygusal durumları daha iyi yönetmek için bilgiler.'
  },
  {
    'title': 'stres_yonetimi',
    'image': 'https://via.placeholder.com/150',
    'description':
        'Zamanınızı daha verimli kullanmak için ipuçları ve stratejiler.'
  },
  {
    'title': 'uyku',
    'image': 'https://via.placeholder.com/150',
    'description':
        'Aile içi ilişkilerde uyumu sağlamak için rehberler ve tavsiyeler.'
  },
  {
    'title': 'zaman_yonetimi',
    'image': 'https://via.placeholder.com/150',
    'description':
        'Aile içi ilişkilerde uyumu sağlamak için rehberler ve tavsiyeler.'
  },
];
