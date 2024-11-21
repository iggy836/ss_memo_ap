import 'package:flutter/material.dart';

// メモ作成・編集画面
// 機能：
// - メモのタイトル入力
// - メモの本文入力
// - メモの保存
// - 画像の添付
// - 作成日時の表示（編集時のみ）
// - 更新日時の表示（編集時のみ） 


class MemoEditScreen extends StatelessWidget { // メモ編集画面のStatelessWidgetクラスを定義
  final bool isEditing; // 編集モードかどうかを示すフラグ
  final String? initialTitle; // 初期タイトルを保持する変数
  final String? initialContent; // 初期内容を保持する変数

  const MemoEditScreen({super.key, this.isEditing = false, this.initialTitle, this.initialContent}); // コンストラクタ

  @override
  Widget build(BuildContext context) { // ウィジェットのビルドメソッド
    TextEditingController titleController = TextEditingController(text: initialTitle); // タイトル用のコントローラ
    TextEditingController contentController = TextEditingController(text: initialContent); // 内容用のコントローラ

    return Scaffold( // 画面の基本的なレイアウトを提供
      appBar: AppBar( // アプリバーを定義
        leading: IconButton( // 戻るボタンを定義
          icon: const Icon(Icons.close), // 閉じるアイコン
          onPressed: () { // ボタンが押されたときの処理
            Navigator.of(context).pop(); // 前の画面に戻る
          },
        ),
        title: const Text('メモ編集'), // アプリバーのタイトル
        actions: [ // アプリバーのアクションボタン
          TextButton(
            onPressed: () { // 保存ボタンが押されたときの処理
              // 保存機能の実装
            },
            child: const Text(
              '保存', // ボタンのテキスト
              style: TextStyle(color: Colors.white), // テキストのスタイル
            ),
          ),
        ],
      ),
      body: Padding( // パディングを追加
        padding: const EdgeInsets.all(16.0), // 16.0のパディング
        child: Column( // 縦にウィジェットを並べる
          crossAxisAlignment: CrossAxisAlignment.start, // 左寄せ
          children: [
            TextField( // タイトル入力用のテキストフィールド
              controller: titleController, // タイトルコントローラを設定
              decoration: const InputDecoration(
                hintText: 'タイトルを入力してください', // プレースホルダーテキスト
              ),
            ),
            const SizedBox(height: 16.0), // スペースを追加
            Expanded( // 残りのスペースを占める
              child: TextField( // 内容入力用のテキストフィールド
                controller: contentController, // 内容コントローラを設定
                decoration: const InputDecoration(
                  hintText: 'メモの内容を入力してください', // プレースホルダーテキスト
                  border: OutlineInputBorder(), // 枠線を追加
                ),
                maxLines: null, // 行数を制限しない
                expands: true, // フィールドを拡張
              ),
            ),
            Row( // 横にウィジェットを並べる
              mainAxisAlignment: MainAxisAlignment.end, // 右寄せ
              children: [
                IconButton(
                  icon: const Icon(Icons.star_border), // お気に入りアイコン
                  onPressed: () { // ボタンが押されたときの処理
                    // お気に入り機能の実装
                  },
                ),
              ],
            ),
            if (isEditing) ...[ // 編集モードの場合のみ表示
              const Divider(), // 区切り線を追加
              Row( // 横にウィジェットを並べる
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 均等に配置
                children: [
                  TextButton.icon(
                    onPressed: () { // 削除ボタンが押されたときの処理
                      // 削除機能の実装
                    },
                    icon: const Icon(Icons.delete, color: Colors.red), // 削除アイコン
                    label: const Text('削除', style: TextStyle(color: Colors.red)), // ボタンのテキスト
                  ),
                  TextButton.icon(
                    onPressed: () { // アーカイブボタンが押されたときの処理
                      // アーカイブ機能の実装
                    },
                    icon: const Icon(Icons.archive), // アーカイブアイコン
                    label: const Text('アーカイブ'), // ボタンのテキスト
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}