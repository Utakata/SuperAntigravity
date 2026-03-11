---
name: git
description: name: git
---
# Git

スマートなコミットメッセージによる Git 操作を行います。

## スマートコミットプロトコル (Smart Commit Protocol)
1. `git status` を実行し、何が変更されたかを理解します
2. `git diff` を実行し、実際の変更をレビューします
3. 特定のファイルをステージングします (決して盲目的に `git add .` しないこと)
4. Conventional Commits に従ってコミットメッセージを生成します:
   - `feat:` 新機能
   - `fix:` バグ修正
   - `refactor:` 動作を変更しないコードの変更
   - `test:` テストの追加/変更
   - `docs:` ドキュメントのみ
   - `chore:` メンテナンスタスク

## コミットメッセージのフォーマット (Commit Message Format)

```
種類(スコープ): 短い説明

（オプション）「何」をしたかではなく、「なぜ」したのかに関する長い説明。
```

## 安全ルール (Safety Rules)
- main/master ブランチに強制プッシュ (force push) は**絶対に行わない**でください
- シークレット、.env ファイル、または認証情報をコミットしては**いけません**
- プレコミットフックをスキップ (--no-verify) しては**いけません**
- 公開済みのコミットを修正 (amend) しては**いけません**
- --force を使用する前に、常に調査を行ってください

## ブランチの命名 (Branch Naming)
- 機能: `feat/説明`
- 修正: `fix/説明`
- 実験: `experiment/説明`

## よく使う操作 (Common Operations)
```
git status                    # 何が変更されたか確認
git diff                      # 変更内容をレビュー
git add path/to/file          # 特定のファイルをステージング
git commit -m "feat: add X"   # メッセージを付けてコミット
git log --oneline -10         # 最近の履歴を確認
git stash                     # 作業を一時的に保存
```
