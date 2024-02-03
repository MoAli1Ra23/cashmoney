// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for _file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'day_repot.dart';

class GeneralReport extends Equatable {
  final DateTime begin;
  final DateTime end;
  final double beginValue;
  final double endValue;
  final String state;
  final List<DayReport> days;
  const GeneralReport({
    required this.begin,
    required this.end,
    required this.beginValue,
    required this.endValue,
    required this.state,
    required this.days,
  });

  @override
  List<Object> get props {
    return [
      begin,
      end,
      beginValue,
      endValue,
      state,
      days,
    ];
  }

  GeneralReport copyWith({
    DateTime? begin,
    DateTime? end,
    double? beginValue,
    double? endValue,
    String? state,
    List<DayReport>? days,
  }) {
    return GeneralReport(
      begin: begin ?? this.begin,
      end: end ?? this.end,
      beginValue: beginValue ?? this.beginValue,
      endValue: endValue ?? this.endValue,
      state: state ?? this.state,
      days: days ?? this.days,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'begin': begin.millisecondsSinceEpoch,
      'end': end.millisecondsSinceEpoch,
      'beginValue': beginValue,
      'endValue': endValue,
      'state': state,
      'days': days.map((x) => x.toMap()).toList(),
    };
  }

  factory GeneralReport.fromMap(Map<String, dynamic> map) {
    return GeneralReport(
      begin: DateTime.fromMillisecondsSinceEpoch(map['begin'] as int),
      end: DateTime.fromMillisecondsSinceEpoch(map['end'] as int),
      beginValue: map['beginValue'] as double,
      endValue: map['endValue'] as double,
      state: map['state'] as String,
      days: List<DayReport>.from(
        (map['days'] as List<int>).map<DayReport>(
          (x) => DayReport.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory GeneralReport.fromJson(String source) =>
      GeneralReport.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
