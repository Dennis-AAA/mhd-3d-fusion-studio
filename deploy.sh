#!/usr/bin/env bash
set -e

REPO_URL="$1"
if [ -z "$REPO_URL" ]; then
  echo "用法 (Usage): ./deploy.sh https://github.com/<username>/<repo>.git"
  exit 1
fi

if [ ! -d ".git" ]; then
  git init
  git branch -M main
fi

git add -A
git commit -m "Deploy 3D MHD Analytic Fusion Equilibrium Studio (arXiv:2609.26742 & 2610.07304)" || true

if git remote | grep -q "^origin$"; then
  git remote set-url origin "$REPO_URL"
else
  git remote add origin "$REPO_URL"
fi

git push -u origin main --force
echo "✅ 已成功推送到 $REPO_URL ！请在 GitHub 仓库 Settings -> Pages 中启用 GitHub Pages。"
