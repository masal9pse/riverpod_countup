import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 値（ここでは "Hello world"）を格納する「プロバイダ」を作成します。
// プロバイダを使うことで値のモックやオーバーライドが可能になります。
// Providerの定数をグローバルに宣言
final counterProvider = StateProvider((ref) => 0);

void main() {
  runApp(
    // プロバイダをウィジェットで利用するには、アプリ全体を
    // `ProviderScope` ウィジェットで囲む必要があります。
    // ここに各プロバイダのステート（状態）・値が格納されていきます。
    ProviderScope(
      child: MyApp(),
    ),
  );
}

// StatelessWidget の代わりに Riverpod の ConsumerWidget を継承します。
class MyApp extends HookConsumerWidget {
  // `ConsumerWidget` と同じく、buildメソッドの引数に
  // `WidgetRef ref` が追加され、使い方も一緒です。
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Providerを読み取る。 `.notifier` を付けると `StateController` が、
    // 付けなければ、 `state` つまり int が取得できる。
    final counter = ref.watch(counterProvider.notifier);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Example')),
        body: ElevatedButton(
          // ボタンタップでcounterProviderの状態をプラス１する
          // ↓ `counter.state++` や、 `counter.state = counter.state + 1` と書いても同じ。
          onPressed: () => counter.update((state) => state + 1),
          // counterProviderの状態（カウント数）をTextで表示。値が変わると再描画される。
          child: Text('Count: ${ref.watch(counterProvider)}'),
        ),
      ),
    );
  }
}
