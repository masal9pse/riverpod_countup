import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_countup/importer.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ホーム画面'),
      ),
      body: Center(
        child: ref.watch(homeViewModelProvider).when(
          init: () {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text(
                  'Result型のすゝめ',
                  style: TextStyle(fontSize: 20),
                ),
                ElevatedButton(
                  onPressed: ref.read(homeViewModelProvider.notifier).findData,
                  child: const Text("データを取得する"),
                )
              ],
            );
          },
          loading: () {
            return const AppIndicator();
          },
          success: (String name) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text(
                  'データの取得に成功！',
                  style: TextStyle(color: AppColors.accentColor),
                ),
                Text(name),
                ElevatedButton(
                  onPressed:
                      ref.read(homeViewModelProvider.notifier).initializeState,
                  child: const Text("戻る"),
                )
              ],
            );
          },
          failure: (AppError error) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text(
                  'データの取得に失敗...',
                  style: TextStyle(color: AppColors.accentColor),
                ),
                Text(error.message),
                ElevatedButton(
                  onPressed:
                      ref.read(homeViewModelProvider.notifier).initializeState,
                  child: const Text("戻る"),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}