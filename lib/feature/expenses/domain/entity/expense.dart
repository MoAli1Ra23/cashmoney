// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Expense extends Equatable {
  final int id;
  final double value;
  final String title;
  final String details;
  final String? note;
  final DateTime date;

  @override
  List<Object?> get props {
    return [
      id,
      value,
      title,
      details,
      note,
      date
    ];
  }

  const Expense({
    required this.id,
    required this.value,
    required this.title,
    required this.details,
    required this.note,
    required this.date
});

  Expense copyWith({
    int? id,
    double? value,
    String? title,
    String? details,
    String? note,
    DateTime? date,
  }) {
    return Expense(
      id: id ?? this.id,
      value: value ?? this.value,
      title: title ?? this.title,
      details: details ?? this.details,
      note: note ?? this.note,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'value': value,
      'title': title,
      'details': details,
      'note': note,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory Expense.fromMap(Map<String, dynamic> map) {
    return Expense(
      id: map['id'] as int,
      value: map['value'] as double,
      title: map['title'] as String,
      details: map['details'] as String,
      note: map['note'] != null ? map['note'] as String : null,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Expense.fromJson(String source) => Expense.fromMap(json.decode(source) as Map<String, dynamic>);
}
