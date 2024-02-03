// ignore_for_file: public_member_api_docs, sort_constructors_first
 
import 'dart:convert';

import 'package:equatable/equatable.dart';

class DayReport extends Equatable {
  final DateTime date;
  final double beginValue;
  final double endValue;
  final double totalIncomes;
  final double totalExpense;
   final String state;
  const DayReport({
    required this.date,
    required this.beginValue,
    required this.endValue,
    required this.totalIncomes,
    required this.totalExpense,
    required this.state,
  });

   
  @override
   List<Object> get props {
    return [
      date,
      beginValue,
      endValue,
      totalIncomes,
      totalExpense,
      state,
    ];
  }
  
  

  DayReport copyWith({
    DateTime? end,
    double? beginValue,
    double? endValue,
    double? totalIncomes,
    double? totalExpense,
    String? state,
  }) {
    return DayReport(
      date: end ?? this.date,
      beginValue: beginValue ?? this.beginValue,
      endValue: endValue ?? this.endValue,
      totalIncomes: totalIncomes ?? this.totalIncomes,
      totalExpense: totalExpense ?? this.totalExpense,
      state: state ?? this.state,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'end': date.millisecondsSinceEpoch,
      'beginValue': beginValue,
      'endValue': endValue,
      'totalIncomes': totalIncomes,
      'totalExpense': totalExpense,
      'state': state,
    };
  }

  factory DayReport.fromMap(Map<String, dynamic> map) {
    return DayReport(
      date: DateTime.fromMillisecondsSinceEpoch(map['end'] as int),
      beginValue: map['beginValue'] as double,
      endValue: map['endValue'] as double,
      totalIncomes: map['totalIncomes'] as double,
      totalExpense: map['totalExpense'] as double,
      state: map['state'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DayReport.fromJson(String source) => DayReport.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
   }
