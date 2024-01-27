// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Source extends Equatable {
  final int id;
  final String text;

  const Source({required this.id, required this.text});

  @override
  List<Object?> get props => [text, id];

  Source copyWith({
    int? id,
    String? text,
  }) {
    return Source(
      id: id ?? this.id,
      text: text ?? this.text,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'text': text,
    };
  }

  factory Source.fromMap(Map<String, dynamic> map) {
    return Source(
      id: map['id'] as int,
      text: map['text'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Source.fromJson(String source) => Source.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
