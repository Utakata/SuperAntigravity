---
name: implement
description: レビューゲートを設けた TDD (テスト駆動開発) による機能の実装を調整します。
---
# /implement (実装)

**このコマンドの機能:** レビューゲートを設けた TDD による機能の実装を調整します。

**前提条件:**
- 設計が承認されていること (`docs/plans/*-design.md` が存在すること) — ない場合は、まず `/brainstorm` を実行してください
- 実装計画が存在すること (`docs/plans/*-plan.md`) — ない場合は、まず `/plan` を実行してください
- フィーチャーブランチ上にいること (main/master ではない)
- Antigravity の設定で **高速モード (Fast Mode)** がアクティブになっていること

**依存するスキル:** このワークフローは以下のスキルを使用します: `confidence-check`, `test-driven-development`, `systematic-debugging`, `requesting-code-review`, `verification-before-completion`, `finishing-a-development-branch` (すべて `skills/` にあります)。

## セッション状態 (Session State)

各タスクの開始時に、以下を出力します:
```
セッション: /implement
計画: [計画ファイルへのパス]
タスク: [N / M] — [タスク名]
確信度 (Confidence): [スコア]/30
ステータス: [確信度チェック | RED フェーズ | GREEN フェーズ | レビュー | 完了]
```

## ステップ 0: 計画の読み込み (Load the Plan)

`confidence-check` を実行する前に、`docs/plans/*-plan.md` にある計画ファイルを読み込みます。
計画の特定のタスクやファイルパスを参照しない `confidence-check` は無効です。

## オーケストレーションフロー (Orchestration Flow)

```
confidence-check スキル → 進めるにはスコアが27以上必要
         ↓
test-driven-development スキル → RED フェーズ (失敗するテストを書く)
         ↓
最小限の実装
         ↓
test-driven-development スキル → GREEN フェーズ (テストをパスさせる)
         ↓
コミット
         ↓
requesting-code-review スキル → 計画に対するレビュー
         ↓
次のタスクへ (繰り返し)
         ↓
verification-before-completion スキル → 最終確認
         ↓
finishing-a-development-branch スキル → マージ/PR の決定
```

## セッションの宣言 (Session Announcement)

開始時: 「[タスク/機能] のための `/implement` を開始します。確信度チェック (confidence-check) をロードしています...」

## 確信度が27未満の場合 (On Confidence Below 27)

次のように宣言します: 「確信度チェックに失敗しました: [項目] のスコアが [X] です。
不足している情報 (Gap): [特定の未知事項]。
アクション: [ファイルを読み込む | 調査を実行する | ユーザーに質問する]」
スコアが27以上になるまで、実装を開始しないでください。

不足情報を補っても、2回の反復内に確信度が27以上にならない場合は、残っている具体的な不足情報をユーザーに伝え、入力を待ちます。27以上に達することなく実装を開始してはいけません。

## 実装後のテスト失敗時 (On Test Failure After Implementation)

`systematic-debugging` スキルをロードします。診断なしに再試行**しないでください**。

## コミットのタイミング (Commit Cadence)

GREEN テストが成功するたびにコミットします。メッセージフォーマット: `test: [現在テストされている動作]`
コミットする前に、複数の GREEN テストをため込まないでください。

コミットが失敗した場合: 直ちに停止します。別のテストを実行してはいけません。まずコミット失敗の診断を行ってください（必要に応じて `systematic-debugging` をロードします）。コミットが保留になっている間に GREEN テストをため込まないでください。
