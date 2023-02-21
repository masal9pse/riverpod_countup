import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:sample/importer.dart';

part 'error.freezed.dart';

@freezed
abstract class AppError with _$AppError {
  const AppError._();

  const factory AppError.fetchError() = _FetchError;

  String get message => when(
        fetchError: () => Strings.fetchError,
      );
}