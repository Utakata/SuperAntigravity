---
name: design
description: name: design
---
# Design (設計)

システムアーキテクチャ、API、およびコンポーネントの設計を行います。

完全なプロセスについては `architecture-design` スキルをロードしてください。

## 設計の種類 (Design Types)

### システムアーキテクチャ (System Architecture)
- コンポーネント間の関係と境界
- データフローと状態管理 (State management)
- スケーラビリティと信頼性の考慮事項
- トレードオフを伴う技術選択

### API設計 (API Design)
- エンドポイント構造 (REST) またはスキーマ (GraphQL)
- リクエスト / レスポンス形式
- 認証と認可 (Authentication and authorization)
- エラーハンドリングとステータスコード
- バージョニング戦略

### コンポーネント設計 (Component Design)
- インターフェースの契約 (Interface contracts)
- 依存関係と結合度 (Coupling)
- 状態管理
- テストのアプローチ

### データベース設計 (Database Design)
- エンティティの関係性
- 型と制約を持つスキーマ
- インデックス戦略
- マイグレーションのアプローチ

## 出力 (Output)
1. **制約 (Constraints)** — 満たすべき条件
2. **オプション (Options)** — トレードオフを伴う2〜3のアプローチ
3. **推奨事項 (Recommendation)** — 理由を伴う明確な選択
4. **決定記録 (Decision record)** — 何が決定され、その理由は何か
5. **未解決の質問 (Open questions)** — 解決が必要な事項
