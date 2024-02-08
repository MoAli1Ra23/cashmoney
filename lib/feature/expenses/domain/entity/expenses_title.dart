// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ExpensesTitle extends Equatable {
 final int id;
 final  Icon? icon;
 final String text;

  const ExpensesTitle({
    required this.id,
    this.icon,
    required this.text,
  });


  @override
  List<Object?> get props => [id, icon, text];

  ExpensesTitle copyWith({
    int? id,
    Icon? icon,
    String? text,
  }) {
    return ExpensesTitle(
      id: id ?? this.id,
      icon: icon ?? this.icon,
      text: text ?? this.text,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
       'text': text,
    };
  }

  factory ExpensesTitle.fromMap(Map<String, dynamic> map) {
    return ExpensesTitle(
      id: map['id'] as int,
       text: map['text'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExpensesTitle.fromJson(String source) => ExpensesTitle.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
