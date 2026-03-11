# SuperAntigravity

**Google Antigravity IDE 向けの Superpowers + SuperClaude 機能拡張です。**

インストールはコマンド1つで完了し、自動的に機能します。AIアシストによる完全な開発ワークフローを提供します。

## インストール

```shell
curl -fsSL https://raw.githubusercontent.com/derHaken/SuperAntigravity/main/install.sh | bash
```

Antigravity を再起動してください。これだけで準備完了です。

## 提供される機能

### 19種類の自動トリガースキル

タスクのコンテキストが一致した際に、スキルが自動的に発動します。コマンド入力は不要です。

**ワークフローパイプライン** ([Superpowers](https://github.com/obra/superpowers) より)

| スキル | 発動条件... |
|-------|--------------|
| `brainstorming` | 新しいものを構築したいとき |
| `writing-plans` | 承認された設計があり、実装の準備ができているとき |
| `executing-plans` | 実行すべき計画が書かれているとき |
| `subagent-driven-development` | タスクごとに新しいサブエージェントを使って計画を実行するとき |
| `test-driven-development` | 機能やバグ修正を実装するとき |
| `systematic-debugging` | バグ、テストの失敗、または予期せぬ挙動が発生したとき |
| `verification-before-completion` | 作業が完了したと宣言する直前 |
| `requesting-code-review` | 実装タスクの合間 |
| `receiving-code-review` | コードレビューのフィードバックを受け取ったとき |
| `finishing-a-development-branch` | 実装が完了したとき |
| `dispatching-parallel-agents` | 2つ以上の独立したタスクを並列化するとき |
| `writing-skills` | Antigravity スキルを作成または編集するとき |

**スペシャリストスキル** ([SuperClaude](https://github.com/NomenAK/SuperClaude) より)

| スキル | 発動条件... |
|-------|--------------|
| `deep-research` | 作業を進める前に外部情報の調査が必要なとき |
| `performance-optimization` | コードのプロファイリングと最適化が必要なとき |
| `security-review` | 認証、入力処理、または機密データに触れるコードのとき |
| `architecture-design` | システム、API、または重要な機能の設計時 |
| `confidence-check` | 実装直前 — 準備が整っているか確認するとき |
| `browser-agent` | UIフローのテスト、Webアプリの挙動確認、ブラウザ自動化時 |

### 16種類のスラッシュコマンド

Antigravity 上で `/` + コマンド名 を入力します:

| コマンド | 機能 |
|---------|-------------|
| `/brainstorm` | [ステップ 1] コードを書く前の要件定義とディスカッション |
| `/plan` | [ステップ 2] 詳細な実装計画の作成 |
| `/implement` | [ステップ 3] TDD（テスト駆動開発）による機能実装 |
| `/research` | 複数ソースを用いた詳細なリサーチ |
| `/build` | プロジェクトのビルドとパッケージング |
| `/test` | カバレッジを含むテストの実行 |
| `/git` | [ステップ 5] スマートコミットを含むGit操作 |
| `/analyze` | コード品質、セキュリティ、パフォーマンスのレビュー |
| `/design` | アーキテクチャとAPIの設計 |
| `/troubleshoot` | 体系的なデバッグ |
| `/explain` | コードや概念の説明 |
| `/improve` | コードの改善適用 |
| `/review` | [ステップ 4] コードレビュー |
| `/cleanup` | デッドコード（不要なコード）の削除 |
| `/document` | ドキュメントの生成 |
| `/estimate` | 開発工数の見積もり |
| `/business-panel` | ビジネスの専門家によるAIパネルディスカッション |
| `/spec-panel` | 技術仕様の品質に関する複数専門家によるレビュー |
| `/recommend` | SuperAntigravity コマンドのインテリジェントな推奨 |

> 各コマンドは `~/.gemini/antigravity/global_workflows/` にあるワークフローファイルによって実行されます。内容を確認し、カスタマイズすることも可能です。

### 6種類の専門エージェント

| エージェント | 専門分野 |
|-------|---------------|
| `code-reviewer` | 計画および品質基準に対する実装のレビュー |
| `backend-architect` | バックエンドシステム、API、データベース、信頼性 |
| `frontend-architect` | UIコンポーネント、状態管理、パフォーマンス |
| `security-engineer` | 脆弱性レビュー、認証設計、脅威モデリング |
| `deep-research` | 情報源の品質評価を伴う複数ソースリサーチ |
| `system-architect` | 分散システム、マイグレーション、可観測性 |
| `socratic-mentor` | ソクラテス式問答による発見的学習のガイド |
| `repo-index` | リポジトリコンテキストの圧縮とインデックス化 |

## 仕組み

```
インストール → GEMINI.md に SuperAntigravity のブートストラップブロックが追加されます（常時有効）
          → skills/ は ~/.gemini/antigravity/skills/ に配置されます
          → workflows/ は ~/.gemini/antigravity/global_workflows/ に配置されます
          → agents/ は ~/.gemini/antigravity/agents/ に配置されます

セッション → エージェントが GEMINI.md を読み込む → スキルの存在を認識し、確認するようになります
         → スキルは説明文とのマッチングにより自動的にトリガーされます
         → ワークフロー経由で /コマンド が明示的に利用可能になります
```

## ⚡ 会話モード

SuperAntigravity は Antigravity ネイティブのモード切り替えに最適化されています:

- **計画モード (Planning Mode)**: `/brainstorm`、`/plan`、`/research`、`/troubleshoot` では必須です。深く考える作業、設計、複雑な問題の切り分けに使用してください。
- **高速モード (Fast Mode)**: `/implement`、`/test`、およびバッチ実行に推奨されます。直接的なコード生成や機械的なタスクに最適化されています。

## ワークフロー

```
/brainstorm  →  ディスカッション + 設計（まだコードは書きません）
     ↓
/plan        →  TDDステップを含む、小さく分割されたタスクの作成
     ↓
/implement   →  タスクごとにサブエージェントを起動 + 中間でコードレビュー
     ↓
/review      →  計画通りに実装されているか検証
     ↓
/git         →  スマートなコミットとプッシュ
```

## 哲学 (Philosophy)

- **コードを書く前に設計する** — ブレインストーミングはオプションではなく必須です
- **テストファースト** — TDDは絶対の法則であり、例外はありません
- **アドホックではなく体系的に** — 当てずっぽうよりもプロセスが常に勝ります
- **主張よりも証拠** — 完了を宣言する前に必ず検証を実行します
- **YAGNI (You Aren't Gonna Need It)** — 架空の将来のニーズではなく、今必要なものを作ります

## アンインストール

```shell
curl -fsSL https://raw.githubusercontent.com/derHaken/SuperAntigravity/main/uninstall.sh | bash
```

## クレジット

- ワークフローパイプラインは Jesse Vincent による [Superpowers](https://github.com/obra/superpowers) (MIT) を適合させたものです
- スペシャリストコマンドは [SuperClaude](https://github.com/NomenAK/SuperClaude) (MIT) を適合させたものです
- [Google Antigravity](https://antigravity.google) 向けに構築されています

## 貢献 (Contributing)

スキルは `skills/`、ワークフローは `workflows/`、エージェントは `agents/` に配置されています。
新しいスキルを作成する際は、`writing-skills` スキルに従ってください。
プルリクエスト (PR) を歓迎します。

## ライセンス

MIT
