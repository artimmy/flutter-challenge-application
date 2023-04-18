import 'package:flutter/material.dart';

@immutable
abstract class IAppException implements Exception {
  final String message;
  final StackTrace stackTrace;

  const IAppException({
    required this.message,
    required this.stackTrace,
  });

  @override
  String toString() {
    return message;
  }
}
