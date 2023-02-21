import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_countup/app.dart';
import 'importer.dart';

Future<void> main() async {
  runApp(const ProviderScope(child: App()));
}