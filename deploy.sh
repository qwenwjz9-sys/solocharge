#!/bin/bash
# SoloCharge 部署脚本
# 用法: bash deploy.sh [目标目录]

set -e
TARGET="${1:-dist}"

echo "🏗️  构建 SoloCharge 发布包..."
mkdir -p "$TARGET/pwa"

echo "📦 复制文件..."
cp index.html "$TARGET/"
cp pwa/icon.svg "$TARGET/pwa/"
cp pwa/manifest.json "$TARGET/pwa/"
cp README.md "$TARGET/"

echo "✅ 发布包已创建: $TARGET/"
echo ""
echo "📋 部署方式："
echo "  1. 将 $TARGET/ 上传到任意静态托管服务"
echo "  2. 访问 index.html 即可使用"
echo ""
echo "🔧 推荐平台："
echo "  • Vercel        → vercel $TARGET"
echo "  • Netlify       → netlify deploy --dir=$TARGET"
echo "  • GitHub Pages  → 推送 $TARGET 到 gh-pages 分支"
echo "  • 阿里云 OSS    → ossutil cp -r $TARGET oss://your-bucket/"
echo "  • 腾讯云 COS    → coscli cp -r $TARGET cos://your-bucket/"
echo ""
echo "📱 PWA 要求：必须通过 HTTPS 访问才能使用离线功能"
echo "🌐 微信小程序：将 $TARGET 部署到 HTTPS 后，使用 WebView 嵌入"
