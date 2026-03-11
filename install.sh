#!/usr/bin/env bash
set -euo pipefail

# SuperAntigravity — Superpowers + SuperClaude for Google Antigravity
# https://github.com/derHaken/SuperAntigravity

REPO_URL="https://github.com/derHaken/SuperAntigravity"
BRANCH="main"
SKILLS_DIR="$HOME/.gemini/antigravity/skills"
WORKFLOWS_DIR="$HOME/.gemini/antigravity/global_workflows"
AGENTS_DIR="$HOME/.gemini/antigravity/agents"
GEMINI_DIR="$HOME/.gemini"
GEMINI_FILE="$GEMINI_DIR/GEMINI.md"
LIFTOFF_MARKER="# SuperAntigravity Skills"

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

log()   { echo -e "${GREEN}[superantigravity]${NC} $1"; }
warn()  { echo -e "${YELLOW}[superantigravity]${NC} $1"; }
error() { echo -e "${RED}[superantigravity]${NC} $1" >&2; exit 1; }

# 部分的なインストールがないか確認する
if [ -f "$HOME/.gemini/antigravity/.superantigravity-installed" ]; then
  warn "以前のインストールが検出されました。再実行すると既存のスキル/ワークフロー/エージェントが上書きされます。"
fi

command -v git >/dev/null 2>&1 || error "git が必要ですが、インストールされていません。"

log "SuperAntigravity をインストールしています..."

TMPDIR=$(mktemp -d)
trap "rm -rf $TMPDIR" EXIT

log "ダウンロード中..."
git clone --depth 1 --branch "$BRANCH" "$REPO_URL" "$TMPDIR/superantigravity" 2>/dev/null \
  || error "クローンに失敗しました。インターネット接続を確認して再試行してください。"

mkdir -p "$SKILLS_DIR" "$WORKFLOWS_DIR" "$AGENTS_DIR" "$GEMINI_DIR"

log "スキルをインストールしています..."
for skill_dir in "$TMPDIR/superantigravity/skills"/*/; do
  skill_name=$(basename "$skill_dir")
  if [ -f "$skill_dir/SKILL.md" ]; then
    mkdir -p "$SKILLS_DIR/$skill_name"
    cp -r "$skill_dir"/* "$SKILLS_DIR/$skill_name/"
    echo "  ✓ $skill_name"
  fi
done

log "ワークフローをインストールしています..."
for wf in "$TMPDIR/superantigravity/workflows"/*.md; do
  name=$(basename "$wf")
  cp "$wf" "$WORKFLOWS_DIR/$name"
  echo "  ✓ ${name%.md}"
done

log "エージェントをインストールしています..."
for agent in "$TMPDIR/superantigravity/agents"/*.md; do
  name=$(basename "$agent")
  cp "$agent" "$AGENTS_DIR/$name"
  echo "  ✓ ${name%.md}"
done

log "~/.gemini/GEMINI.md を更新しています..."
if [ -f "$GEMINI_FILE" ] && grep -q "$LIFTOFF_MARKER" "$GEMINI_FILE"; then
  warn "SuperAntigravity のブロックはすでに GEMINI.md に存在します — スキップします (再インストールする場合は先に uninstall.sh を実行してください)"
else
  [ -s "$GEMINI_FILE" ] && printf '\n\n' >> "$GEMINI_FILE"
  cat "$TMPDIR/superantigravity/rules/GEMINI.md" >> "$GEMINI_FILE"
  log "ブートストラップルールが追加されました"
fi

echo ""
echo -e "${GREEN}✓ SuperAntigravity がインストールされました！${NC}"
echo ""
echo "  19 スキル   → $SKILLS_DIR"
echo "  16 ワークフロー → $WORKFLOWS_DIR"
echo "   6 エージェント   → $AGENTS_DIR"
echo ""
echo "Antigravity を再起動し、/brainstorm と入力して始めてください。"
echo ""

# 完全にインストールが成功した場合のみマニフェストを書き込む
MANIFEST_FILE="$HOME/.gemini/antigravity/.superantigravity-installed"
echo "superantigravity-version=1.0.0" > "$MANIFEST_FILE"
echo "install-date=$(date -u +%Y-%m-%dT%H:%M:%SZ)" >> "$MANIFEST_FILE"
