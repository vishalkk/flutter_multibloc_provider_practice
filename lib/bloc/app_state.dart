import 'dart:typed_data';

import 'package:flutter/foundation.dart';

@immutable
class AppState {
  final bool isLoading;
  final Uint8List? data;
  final Object? error;
  const AppState({
    required this.isLoading,
    this.data,
    this.error,
  });

  const AppState.empty()
      : isLoading = false,
        data = null,
        error = null;

  @override
  String toString() =>
      {'isLoading': isLoading, 'data': data != null, 'error': error}.toString();
}
