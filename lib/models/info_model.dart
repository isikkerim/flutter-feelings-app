import 'dart:convert';
import 'package:flutter/services.dart';

class InfoCard {
  final int id;
  final String title;
  final String description;

  // InfoCard constructoru
  InfoCard({
    required this.id,
    required this.title,
    required this.description,
  });

  // JSON verisini Dart objesine dönüştürmek için bir factory constructor
  factory InfoCard.fromJson(Map<String, dynamic> json) {
    return InfoCard(
      id: json['id'], // id'yi JSON'dan alıyoruz
      title: json['title'], // title'ı JSON'dan alıyoruz
      description: json['description'], // description'ı JSON'dan alıyoruz
    );
  }

  // Dart objesini JSON formatına dönüştürmek için bir method
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }
}
class InfoCardService {
  // JSON verisini uygulama içi assetlerden okuyoruz
  Future<List<InfoCard>> loadInfoCards() async {
    final String response = await rootBundle.loadString('assets/jsons/info.json');
    final data = json.decode(response);

    // 'quotes' array'ini çekip, her bir elemanı InfoCard modeline dönüştürüp liste olarak döndürüyoruz
    List<InfoCard> infoCards = (data['quotes']  as List)
        .map((cardData) => InfoCard.fromJson(cardData))
        .toList();

    return infoCards;
  }
}
