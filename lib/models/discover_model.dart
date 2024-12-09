import 'package:flutter/material.dart';
import 'dart:convert';

class KesfetModel {
  final String name;
  final String bilgilendirme;
  final String egzersizler;
  final String denemeYazisi;
  final String yapilabilecekler;
  final String konuAnlatimi;

  KesfetModel({
    required this.name,
    required this.bilgilendirme,
    required this.egzersizler,
    required this.denemeYazisi,
    required this.yapilabilecekler,
    required this.konuAnlatimi,
  });

  factory KesfetModel.fromJson(String name, Map<String, dynamic> json) {
    return KesfetModel(
      name: name,
      bilgilendirme: json['bilgilendirme'],
      egzersizler: json['egzersizler'],
      denemeYazisi: json['deneme_yazısı'],
      yapilabilecekler: json['yapilabilecekler'],
      konuAnlatimi: json['konu_anlatimi'],
    );
  }
}
