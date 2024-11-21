import 'package:flutter/material.dart'; // Flutterのマテリアルデザインウィジェットをインポート
import 'memo_edit_screen.dart';
import 'settings_screen.dart';

class MemoListScreen extends StatelessWidget { // メモリスト画面のStatelessWidgetクラスを定義
  const MemoListScreen({super.key}); // コンストラクタ、キーを受け取る

  final List<Map<String, String>> memos = const [ // メモのリストを定義
    {
      'title': 'ショッピングリスト', // メモのタイトル
      'content': '牛乳、パン、卵、野菜...', // メモの内容
      'date': '2024/3/20', // メモの日付
      'favorite': 'true', // お気に入りかどうか
    },
    {
      'title': '会議メモ',
      'content': '新プロジェクトについての打ち合わせ内容...',
      'date': '2024/3/19',
      'favorite': 'false',
    },
    {
      'title': 'アイデアメモ',
      'content': '新しいアプリケーションのアイデア...',
      'date': '2024/3/18',
      'favorite': 'true',
    },
  ];

  @override
  Widget build(BuildContext context) { // ウィジェットのビルドメソ��ド
    return Scaffold( // 画面の基本的なレイアウトを提供
      appBar: AppBar( // アプリバーを定義
        title: const Text('Memo App'), // アプリバーのタイトル
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Column( // 縦にウィジェットを並べる
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'メモを検索...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    // 検索機能の実装
                  },
                ),
              ],
            ),
          ),
          DropdownButton<String>(
            items: <String>['作成日時', '更新日時', 'お気に入り']
                .map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (_) {
              // 並び替え機能の実装
            },
            hint: const Text('並び替え'),
          ),
          Expanded( // 残りのスペースを占める
            child: ListView.builder( // リストビューを構築
              itemCount: memos.length, // メモの数を指定
              itemBuilder: (context, index) { // 各メモのウィジェットを構築
                return Card( // カードウィジェットを使用
                  child: ListTile( // リストタイルを使用
                    title: Text(memos[index]['title']!), // メモのタイトルを表示
                    subtitle: Text(memos[index]['content']!), // メモの内容を表示
                    trailing: Row( // 右側にアイコンボタンを配置
                      mainAxisSize: MainAxisSize.min, // 最小限のスペースを使用
                      children: [
                        IconButton(
                          icon: Icon(
                            memos[index]['favorite'] == 'true' // お���に入りかどうかでアイコンを変更
                                ? Icons.star
                                : Icons.star_border,
                          ),
                          onPressed: () {
                            // お気に入り機能の実装
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete), // 削除アイコン
                          onPressed: () {
                            // 削除機能の実装
                          },
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MemoEditScreen(
                            isEditing: true, // 編集モード
                            initialTitle: memos[index]['title'],
                            initialContent: memos[index]['content'],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton( // フローテ��ングアクションボタンを追加
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MemoEditScreen(
                isEditing: false, // 新規作成モード
              ),
            ),
          );
        },
        child: const Icon(Icons.add), // 追加アイコン
      ),
    );
  }
}