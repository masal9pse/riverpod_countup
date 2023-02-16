import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_countup/todo.dart';

final counterProvider = StateProvider<int>((ref) => 0);

void main() {
  runApp(
    // プロバイダをウィジェットで利用するには、アプリ全体を
    // `ProviderScope` ウィジェットで囲む必要があります。
    // ここに各プロバイダのステート（状態）・値が格納されていきます。
    const ProviderScope(
      child: StateNotifierProviderPage(),
    ),
  );
}

// Widget example.
class StateNotifierProviderPage extends ConsumerWidget {
  const StateNotifierProviderPage({
    super.key,
  });

  static const String title = 'StateNotifierProvider';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // StateNotifierProviderを読み取る。watchを使用しているので、
    // state（状態）であるTODOリストが更新されると、buildメソッドが再実行されて画面が更新される
    var counter = ref.watch(counterProvider);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
          actions: [],
        ),
        body: ElevatedButton(
          onPressed: () {
            // counter++;
            // ref.read(counterProvider.notifier).state++;
            // updateを使う書き方もできる。
            // ref.read(counterProvider.notifier).update((state) => state ++);
            ref.read(counterProvider.notifier).update((state) => state + 1);
          },
          child: Text(counter.toString()),
        ),
      ),
    );
  }
}
