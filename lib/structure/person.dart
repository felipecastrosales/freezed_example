import 'dart:developer' as developer;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'person.freezed.dart';

@freezed
class Person with _$Person {
  factory Person({String? name, int? age}) = _Person;
}



void main() {
  var person = Person(name: 'Felipe', age: 18);
  developer.log('${person.name}');
  developer.log('${person.age}');
  developer.log('$person.toString()');
}
