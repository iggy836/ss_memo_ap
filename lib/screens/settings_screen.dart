import 'package:flutter/material.dart'; // Flutterのマテリアルデザインウィジェットをインポート

// 設定画面
// 機能：
// - テーマの切り替え（ライト/ダーク）
// - フォントサイズの変更
// - メモの表示順の設定（作成日時、更新日時、タイトル）
// - データのバックアップ/リストア 
// Flutterのマテリアルデザインウィジェットを再度インポート（重複）

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
 // 設定画面のStatelessWidgetクラスを定義
  @override
  Widget build(BuildContext context) { // ウィジェットのビルドメソッド
    bool isDarkMode = false; // ダークモードの状態を保持する変数
    bool isVoiceEnabled = false; // 音声読み上げの状態を保持する変数
    double fontSize = 14.0; // フォントサイズを保持する変数

    return Scaffold( // 画面の基本的なレイアウトを提供
      appBar: AppBar( // アプリバーを定義
        title: const Text('設定'), // アプリバーのタイトル
      ),
      body: ListView( // スクロール可能なリストビューを定義
        padding: const EdgeInsets.all(16.0), // リストビューのパディングを設定
        children: [ // リストビューの子ウィジェットを定義
          Card( // カードウィジェットを使用
            child: ListTile( // リストタイルを使用
              title: const Text('テーマ設定'), // リストタイルのタイトル
              subtitle: Column( // 縦にウィジェットを並べる
                crossAxisAlignment: CrossAxisAlignment.start, // 左寄せ
                children: [
                  SwitchListTile( // スイッチ付きのリストタイル
                    title: const Text('ダークモード'), // スイッチのタイトル
                    value: isDarkMode, // スイッチの状態
                    onChanged: (bool value) { // スイッチが変更されたときの処理
                      // ダークモード切り替えの実装
                    },
                  ),
                  ListTile( // リストタイルを使用
                    title: const Text('アクセントカラー'), // リストタイルのタイトル
                    trailing: Container( // 右側に表示するコンテナ
                      width: 24, // コンテナの幅
                      height: 24, // コンテナの高さ
                      color: Colors.black, // コンテナの色
                    ),
                    onTap: () { // タップされたときの処理
                      // カラー選択の実装
                    },
                  ),
                ],
              ),
            ),
          ),
          Card( // カードウィジェットを使用
            child: ListTile( // リストタイルを使用
              title: const Text('データ管理'), // リストタイルのタイトル
              subtitle: Column( // 縦にウィジェットを並べる
                crossAxisAlignment: CrossAxisAlignment.start, // 左寄せ
                children: [
                  SwitchListTile( // スイッチ付きのリストタイル
                    title: const Text('自動バックアップ'), // スイッチのタイトル
                    value: false, // スイッチの状態
                    onChanged: (bool value) { // スイッチが変更されたときの処理
                      // 自動バックアップ切り替えの実装
                    },
                  ),
                  OverflowBar( // ボタンを横に並べる
                    children: [
                      ElevatedButton( // ボタンを定義
                        onPressed: () { // ボタンが押されたときの処理
                          // バックアップ機能の実装
                        },
                        child: const Text('バックアップ'), // ボタンのテキスト
                      ),
                      ElevatedButton( // ボタンを定義
                        onPressed: () { // ボタンが押されたときの処理
                          // リストア機能の実装
                        },
                        child: const Text('リストア'), // ボタンのテキスト
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Card( // カードウィジェットを使用
            child: ListTile( // リストタイルを使用
              title: const Text('アクセシビリティ'), // リストタイルのタイトル
              subtitle: Column( // 縦にウィジェットを並べる
                crossAxisAlignment: CrossAxisAlignment.start, // 左寄せ
                children: [
                  SwitchListTile( // スイッチ付きのリストタイル
                    title: const Text('音声読み上げ'), // スイッチのタイトル
                    value: isVoiceEnabled, // スイッチの状態
                    onChanged: (bool value) { // スイッチが変更されたときの処理
                      // 音声読み上げ切り替えの実装
                    },
                  ),
                  ListTile( // リストタイルを使用
                    title: const Text('フォントサイズ'), // リストタイルのタイトル
                    subtitle: Slider( // スライダーを使用
                      value: fontSize, // スライダーの値
                      min: 10.0, // スライダーの最小値
                      max: 30.0, // スライダーの最大値
                      onChanged: (double value) { // スライダーが変更されたときの処理
                        // フォントサイズ変更の実装
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Card( // カードウィジェットを使用
            child: ListTile( // リストタイルを使用
              title: Text('アプリ情報'), // リストタイルのタイトル
              subtitle: Column( // 縦にウィジェットを並べる
                crossAxisAlignment: CrossAxisAlignment.start, // 左寄せ
                children: [
                  Text('バージョン: 1.0.0'), // アプリのバージョン情報
                  Text('開発者: Created with ❤️ by StackBlitz Team'), // 開発者情報
                  Text('ライセンス: MIT License'), // ライセンス情報
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}