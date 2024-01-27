import 'dart:convert';

import 'package:equatable/equatable.dart';

class Wallate extends Equatable {
   final int id;
final    double balance;
    const Wallate({required this.id,required this.balance});
  


  @override
  List<Object?> get props => [id, balance];

  Wallate copyWith({
    int? id,
    double? balance,
  }) {
    return Wallate(
      id: id ?? this.id,
      balance: balance ?? this.balance,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'balance': balance,
    };
  }

  factory Wallate.fromMap(Map<String, dynamic> map) {
    return Wallate(
      id: map['id'] as int,
      balance: map['balance'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Wallate.fromJson(String source) => Wallate.fromMap(json.decode(source) as Map<String, dynamic>);
}
