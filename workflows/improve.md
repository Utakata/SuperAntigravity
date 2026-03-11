---
name: improve
description: name: improve
---
# Improve (改善)

コードの品質、パフォーマンス、保守性に体系的な改善を適用します。

## 改善のカテゴリー (Improvement Categories)

### コードの品質 (Code Quality)
- 重複するロジックを再利用可能な関数に抽出する
- 複雑な条件分岐をシンプルにする
- 明確さを向上させるための命名の改善
- 関数やメソッドの長さを短縮する

### パフォーマンス (Performance)
`performance-optimization` スキルをロードしてください — 改善する前に測定を行ってください。

### セキュリティ (Security)
`security-review` スキルをロードしてください — 脆弱性がないか確認してください。

### 保守性 (Maintainability)
- システムの境界部分で不足しているエラーハンドリングを追加する
- 重要な経路 (critical paths) のテストカバレッジを向上させる
- 過剰に設計された抽象化 (over-engineered abstractions) を簡素化する
- 明白でない決定事項を文書化する

## ルール (Rules)
- パフォーマンスを改善する前に**測定**すること
- いかなるリファクタリングの前と後にも**テスト**すること
- 改善は一度に1つずつ — それぞれの間にコミットすること
- **YAGNI** (You Aren't Gonna Need It) — 将来の架空のニーズのための抽象化は追加しないこと
- 改善が完了したと宣言する前に、`verification-before-completion` スキルをロードすること
