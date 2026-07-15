#!/bin/bash
# SoloCharge — 一键启动
# Usage: ./start.sh

PORT="${1:-8800}"
DIR="$(cd "$(dirname "$0")" && pwd)"

echo "╔══════════════════════════════════════╗"
echo "║        SoloCharge v1.0               ║"
echo "║        内向者的能量管理工具           ║"
echo "╚══════════════════════════════════════╝"
echo ""
echo "🔗 打开浏览器访问:"
echo "   http://localhost:${PORT}/index.html"
echo ""
echo "📱 支持安装为桌面应用（Chrome/Edge）"
echo "   地址栏右侧点按「安装」图标即可"
echo ""
echo "⌨️  Ctrl+C 停止服务"
echo ""

cd "$DIR"
python3 -m http.server "$PORT"
