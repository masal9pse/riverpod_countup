import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_countup/importer.dart';

import '../error.dart';

part 'home_ui_state.freezed.dart';

@freezed
abstract class HomeUiState<T> with _$HomeUiState<T> {
  const factory HomeUiState.init() = _Init;

  const factory HomeUiState.loading() = _Loading;

  const factory HomeUiState.success(String name) = _Success;

  const factory HomeUiState.failure(AppError error) = _Failure;
}