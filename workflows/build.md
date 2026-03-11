---
name: build
description: name: build
---
# Build (ビルド)

プロジェクトのビルド、コンパイル、およびパッケージ化を行います。

## 手順 (Steps)
1. プロジェクト構造とビルド構成の分析
2. 環境と依存関係の検証
3. ターゲット (dev/prod/test) に適したフラグを使用してビルドを実行
4. 診断分析によるエラーの解析
5. 生成されたアーティファクトとビルド指標のレポート

## 一般的なビルドシステム (Common Build Systems)
- npm/bun: `npm run build` / `bun run build`
- Python: `python -m build` / `poetry build`
- Go: `go build ./...`
- Rust: `cargo build --release`
- Docker: `docker build -t name .`

## ビルド失敗時の対応 (On Build Failure)
根本原因を診断するために `systematic-debugging` スキルをロードしてください。
同じ失敗するコマンドを再試行**しない**でください — まず診断を行ってください。
