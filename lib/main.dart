import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// final counterProvider = StateProvider<int>((ref) => 0);

@immutable
class CountModel {
  const CountModel({required this.count});
  final int count;

  CountModel copyWith({required int count}) {
    return CountModel(count: count);
  }
}

class CountNotifier extends StateNotifier<CountModel> {
  CountNotifier() : super(const CountModel(count: 0));

  void addCount() {
    state = state.copyWith(count: state.count + 1);
  }
}

final countProvider = StateNotifierProvider<CountNotifier, CountModel>((ref) {
  return CountNotifier();
});

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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // StateNotifierProviderを読み取る。watchを使用しているので、
    var counter1 = ref.watch(countProvider).count;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('title'),
          actions: [],
        ),
        body: ElevatedButton(
          onPressed: () {
            // updateを使う書き方もできる。
            ref.read(countProvider.notifier).addCount();
          },
          child: Text(counter1.toString()),
        ),
      ),
    );
  }
}
