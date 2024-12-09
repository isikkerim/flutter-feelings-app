import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/news_detail_widget.dart';

class NewsController extends GetxController {
  // Kategoriler ve içerikleri
// Kategoriler ve içerikleri
  final categories = [
    "Kaygı",
    "Stres",
    "Depresyon",
    "Bilinçli Farkındalık",
    "Bağımlılık",
    "İlişkiler"
  ].obs;

  final selectedCategory = "Kaygı".obs;

  final news = {
    "Kaygı": [
      {
        "title": "Kaygı Bozukluğu ile Baş Etme Yöntemleri",
        "image": "https://via.placeholder.com/300",
        "date": "2024-12-05",
        "admin": "Admin1",
        "content":
            "Kaygı bozukluğu, anksiyete düzeylerinin aşırı artmasıyla ortaya çıkar. Kaygı ile başa çıkmak için terapiler, gevşeme teknikleri ve egzersiz gibi yöntemler etkilidir. Ayrıca sağlıklı yaşam alışkanlıkları kaygıyı yönetmeye yardımcı olabilir.",
        "tags": ["Kaygı", "Anksiyete", "Psikoloji"]
      },
      {
        "title": "Kaygı Düzeylerini Azaltmanın Yolları",
        "image": "https://via.placeholder.com/300",
        "date": "2024-12-02",
        "admin": "Admin2",
        "content":
            "Kaygıyı azaltmak için meditasyon, derin nefes alma teknikleri ve pozitif düşünme stratejileri kullanılabilir. Bu yöntemler, hem zihinsel hem de fiziksel rahatlama sağlar.",
        "tags": ["Kaygı", "Meditasyon", "Rahatlama"]
      }
    ],
    "Stres": [
      {
        "title": "Stres Yönetimi için 10 Etkili Yöntem",
        "image": "https://via.placeholder.com/300",
        "date": "2024-12-03",
        "admin": "Admin3",
        "content":
            "Stres, modern yaşamın kaçınılmaz bir parçası haline gelmiştir. Bu yazıda, stresle başa çıkmak için mindfulness, spor, zaman yönetimi gibi etkili yöntemlere yer verilmektedir.",
        "tags": ["Stres", "Yönetim", "Psikoloji"]
      },
      {
        "title": "Stresin Zihinsel ve Fiziksel Etkileri",
        "image": "https://via.placeholder.com/300",
        "date": "2024-11-29",
        "admin": "Admin4",
        "content":
            "Uzun süreli stres, sadece zihinsel sağlığı değil, aynı zamanda vücut sağlığını da olumsuz etkileyebilir. Bu yazı, stresin kalp sağlığı, uyku düzeni ve bağışıklık sistemi üzerindeki etkilerine odaklanmaktadır.",
        "tags": ["Stres", "Sağlık", "Psikoloji"]
      }
    ],
    "Depresyon": [
      {
        "title": "Depresyon Belirtileri ve Tedavi Yöntemleri",
        "image": "https://via.placeholder.com/300",
        "date": "2024-11-28",
        "admin": "Admin5",
        "content":
            "Depresyon, düşük enerji, ilgi kaybı ve umutsuzluk gibi belirtilerle kendini gösterir. Depresyon tedavisinde psikoterapi ve ilaç tedavisi gibi yöntemler kullanılabilir.",
        "tags": ["Depresyon", "Tedavi", "Psikoloji"]
      },
      {
        "title": "Kronik Depresyonla Yaşamak",
        "image": "https://via.placeholder.com/300",
        "date": "2024-11-25",
        "admin": "Admin6",
        "content":
            "Kronik depresyon, yıllarca sürebilen bir durumdur. Ancak, depresyonla başa çıkmak için destek almak ve yaşam tarzını değiştirmek mümkündür. Bu yazıda kronik depresyonun yönetimi için öneriler yer almaktadır.",
        "tags": ["Depresyon", "Psikoterapi", "Psikoloji"]
      }
    ],
    "Bilinçli Farkındalık": [
      {
        "title": "Bilinçli Farkındalık Teknikleri ile Zihinsel Rahatlık",
        "image": "https://via.placeholder.com/300",
        "date": "2024-12-01",
        "admin": "Admin7",
        "content":
            "Bilinçli farkındalık, anı yaşama ve düşünceleri yargılamadan kabul etme pratiğidir. Bu yazı, bilinçli farkındalık tekniklerinin zihinsel rahatlama ve stresle başa çıkmadaki rolüne odaklanmaktadır.",
        "tags": ["Farkındalık", "Zihinsel Sağlık", "Psikoloji"]
      },
      {
        "title": "Bilinçli Farkındalık ile Stres Azaltma",
        "image": "https://via.placeholder.com/300",
        "date": "2024-11-20",
        "admin": "Admin8",
        "content":
            "Bilinçli farkındalık, stresli durumlarda duygu ve düşünceleri kontrol altında tutmak için etkili bir tekniktir. Düzenli olarak yapılan meditasyon ve farkındalık çalışmaları, stresin etkilerini azaltmada önemli bir rol oynar.",
        "tags": ["Farkındalık", "Stres", "Psikoloji"]
      }
    ],
    "Bağımlılık": [
      {
        "title": "Bağımlılıkla Mücadelede Psikolojik Yaklaşımlar",
        "image": "https://via.placeholder.com/300",
        "date": "2024-11-22",
        "admin": "Admin9",
        "content":
            "Bağımlılık, kişinin bir maddeye veya davranışa karşı aşırı bağımlılık geliştirdiği bir durumdur. Bağımlılıkla mücadelede psikoterapi ve destek grupları önemli bir yer tutar. Bu yazı, bağımlılık tedavisinde kullanılan psikolojik yaklaşımları ele alıyor.",
        "tags": ["Bağımlılık", "Tedavi", "Psikoloji"]
      },
      {
        "title": "Bağımlılıkla Baş Etme Stratejileri",
        "image": "https://via.placeholder.com/300",
        "date": "2024-11-15",
        "admin": "Admin10",
        "content":
            "Bağımlılıkla başa çıkmanın en önemli adımlarından biri, kişinin kendisine ve çevresine karşı dürüst olmasıdır. Ayrıca, duygusal destek almak ve sağlıklı alışkanlıklar geliştirmek bağımlılıkla başa çıkmada etkili stratejilerdir.",
        "tags": ["Bağımlılık", "Psikoloji", "Destek"]
      }
    ],
    "İlişkiler": [
      {
        "title": "Sağlıklı İlişkiler Kurma Yolları",
        "image": "https://via.placeholder.com/300",
        "date": "2024-12-04",
        "admin": "Admin11",
        "content":
            "Sağlıklı bir ilişki, karşılıklı saygı, anlayış ve iletişim üzerine kuruludur. Bu yazıda, sağlıklı ilişkiler kurmanın temel prensipleri ve sağlıklı sınırlar koymanın önemi anlatılmaktadır.",
        "tags": ["İlişkiler", "Sağlık", "Psikoloji"]
      },
      {
        "title": "Zihinsel Sağlık ve İlişkiler",
        "image": "https://via.placeholder.com/300",
        "date": "2024-11-18",
        "admin": "Admin12",
        "content":
            "Zihinsel sağlık, ilişkilerin sağlıklı bir şekilde gelişmesinde kritik bir rol oynar. Zihinsel sağlık sorunları, ilişkileri zorlaştırabilir, ancak doğru destekle bu zorlukların üstesinden gelinebilir.",
        "tags": ["İlişkiler", "Zihinsel Sağlık", "Psikoloji"]
      }
    ],
  };

  List<Map<String, dynamic>> get selectedNews =>
      news[selectedCategory.value] ?? [];
}

class NewsHomePage extends StatelessWidget {
  const NewsHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NewsController());

    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: Get.height*0.05,),
          // Kategoriler with border
          Obx(() {
            return SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: controller.categories.map(
                      (category) {
                    return GestureDetector(
                      onTap: () {
                        controller.selectedCategory.value = category;
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: controller.selectedCategory.value == category
                              ? Colors.purpleAccent
                              : Colors.grey[300],
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: controller.selectedCategory.value == category
                                ? Colors.purple
                                : Colors.grey,
                            width: 2,
                          ),
                        ),
                        child: Text(
                          category,
                          style: TextStyle(
                            color: controller.selectedCategory.value == category
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            );
          }),
          const SizedBox(height: 10),
          // Haber Listesi inside a Card widget
          Obx(() {
            final newsList = controller.selectedNews;
            return Expanded(
              child: ListView.builder(
                itemCount: newsList.length,
                itemBuilder: (context, index) {
                  final news = newsList[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          news["image"],
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        news["title"],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(news["date"]),
                      onTap: () {
                        Get.to(() => NewsDetailPage(news: news));
                      },
                    ),
                  );
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}

