import 'package:flutter/material.dart'; // Flutterのマテリアルデザインウィジェットをインポート
import 'screens/memo_list_screen.dart'; // メモリスト画面を定義しているファイルをインポート

void main() { // アプリケーションのエントリーポイント
  runApp(const MyApp()); // MyAppウィジェットをルートとしてアプリを起動
}

class MyApp extends StatelessWidget { // StatelessWidgetを継承したMyAppクラス
  const MyApp({super.key}); // コンストラクタ

  @override
  Widget build(BuildContext context) { // ウィジェットツリーを構築するメソッド
    return MaterialApp( // MaterialAppウィジェットを返す
      title: 'メモ帳アプリ', // アプリのタイトルを設定
      theme: ThemeData( // アプリのテーマを設定
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue), // 青色を基にしたカラースキームを生成
        useMaterial3: true, // Material 3を使用
      ),
      home: const MemoListScreen(), // アプリのホーム画面をMemoListScreenに設定
    );
  }
}