#!/bin/bash
# GERD SONO 研究平台啟動器
# 雙擊執行，自動開啟瀏覽器

PORT=8877

# 切換到 Sono 根目錄（serve.command 的上層）
cd "$(dirname "$0")/.."

echo "======================================"
echo "  GERD SONO 研究平台"
echo "======================================"
echo "  目錄：$(pwd)"
echo "  網址：http://localhost:$PORT/viewer/"
echo "======================================"

# 清除佔用此 port 的舊程序
lsof -ti:$PORT | xargs kill -9 2>/dev/null
sleep 0.5

# 等一下再開瀏覽器（讓 server 先啟動）
(sleep 1 && open "http://localhost:$PORT/viewer/") &

# 啟動 Python 伺服器
python3 -m http.server $PORT

echo "伺服器已停止。"
