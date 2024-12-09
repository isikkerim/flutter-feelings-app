import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class Quote {
  final int id;
  final String quote;

  Quote({required this.id, required this.quote});

  // JSON verisini dart objesine dönüştürmek için bir factory constructor
  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      id: json['id'],
      quote: json['quote'],
    );
  }

  // Dart objesini JSON formatına dönüştürmek için bir method
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'quote': quote,
    };
  }
}

class QuoteService {
  // JSON dosyasını okuma ve liste olarak döndürme işlemi
  Future<List<Quote>> loadQuotes() async {
    // Burada JSON dosyasını uygulama içi assetlerden okuyoruz
    final String response = await rootBundle.loadString('assets/jsons/sozler.json');
    final data = json.decode(response);

    // 'quotes' array'ini çekip, her bir elemanı Quote modeline dönüştürüp liste olarak döndürüyoruz
    List<Quote> quotes = (data['quotes'] as List)
        .map((quoteData) => Quote.fromJson(quoteData))
        .toList();

    return quotes;
  }
}
