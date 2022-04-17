import 'dart:developer' as developer;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'pattern_matching.freezed.dart';

@freezed
class Union with _$Union {
  factory Union(int value) = UnionData;
  factory Union.loading() = UnionLoading;
  factory Union.error([String? message]) = UnionError;
}

void main() {
  var union = Union(1);

  // when
  var when = union.when<String>(
    (value) => 'Union Data implement',
    loading: () => 'Loading implement',
    error: (String? message) => 'Error implement',
  );
  developer.log(when);

  // maybeWhen
  var maybeWhen = union.maybeWhen(
    null,
    error: (String? message) => 'Error implement',
    orElse: () => 'Padrão implementado',
  );
  developer.log(maybeWhen);

  // map
  var map = union.map(
    (UnionData value) => '${value.runtimeType} implement',
    loading: (UnionLoading loading) => '${loading.runtimeType} implement',
    error: (UnionError error) => '${error.runtimeType} implement',
  );
  developer.log(map);

  // maybeMap
  var maybeMap = union.maybeMap(
    null,
    error: (UnionError error) => '${error.runtimeType} implement',
    orElse: () => 'Padrão implementado',
  );
  developer.log(maybeMap);
}
