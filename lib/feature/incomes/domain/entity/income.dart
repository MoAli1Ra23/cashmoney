// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Income extends Equatable {
  final int id;
  final double value;
  final String source;
  final DateTime date;

  const Income(
      {required this.id,
      required this.value,
      required this.source,
      required this.date});

  @override
  List<Object> get props => [id, value, source, date];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'value': value,
      'source': source,
      'date': date.millisecondsSinceEpoch,
    };
  }

  Income copyWith({
    int? id,
    double? value,
    String? source,
    DateTime? date,
  }) {
    return Income(
      id: id ?? this.id,
      value: value ?? this.value,
      source: source ?? this.source,
      date: date ?? this.date,
    );
  }

  factory Income.fromMap(Map<String, dynamic> map) {
    return Income(
      id: map['id'] as int,
      value: map['value'] as double,
    source:  map['source'] as String,
    date:  DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Income.fromJson(String source) =>
      Income.fromMap(json.decode(source) as Map<String, dynamic>);
}
