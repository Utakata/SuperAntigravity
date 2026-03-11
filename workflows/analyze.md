---
name: analyze
description: name: analyze
---
# Analyze (分析)

品質、セキュリティ、パフォーマンス、およびアーキテクチャにわたる包括的なコード分析を行います。

## 分析領域 (Analysis Domains)

### 品質 (Quality)
- コードの臭い (Code smells)、重複、複雑さ
- 保守性指標 (Maintainability index)
- デッドコードや未使用のインポート
- 命名規則と一貫性

### セキュリティ (Security)
完全な OWASP チェックリストについては `security-review` スキルをロードしてください。

### パフォーマンス (Performance)
`performance-optimization` スキルをロードしてください — 分析前に測定を行ってください。

### アーキテクチャ (Architecture)
構造分析については `architecture-design` スキルをロードしてください。

## 使用方法 (Usage)
焦点を指定します: `/analyze --focus quality|security|performance|architecture`
または、すべての領域を実行して包括的なレポートを作成します。

## 出力フォーマット (Output Format)
各発見事項について:
1. **領域 (Domain)** (品質/セキュリティ/パフォーマンス/アーキテクチャ)
2. **重要度 (Severity)** (致命的/高/中/低/情報)
3. **場所 (Location)** (ファイル名:行番号)
4. **問題 (Issue)** (何が問題か)
5. **推奨事項 (Recommendation)** (具体的な修正案)

## 分析後 (After Analysis)
- 致命的(Critical)/高(High): 次の作業に進む前に修正する
- 中(Medium): 対応するためのタスクを作成する
- 低(Low)/情報(Info): 将来の改善のために文書化する
