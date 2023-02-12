import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 値（ここでは "Hello world"）を格納する「プロバイダ」を作成します。
// プロバイダを使うことで値のモックやオーバーライドが可能になります。
final appNameProvider = Provider((ref) => 'Special App!');

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
    // `ref.watch` を使用して Providerを読み取ります。
    final String value = ref.watch(appNameProvider);
    // `HookConsumerWidget` を継承しているので `useXxx` メソッドが使用できる。
    final counter = useState(0);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Example')),
        body: Center(
          // Providerから読み取った値と、 `useState` の値を使用する例
          child: Text('$value, ${counter.value}'),
        ),
      ),
    );
  }
}