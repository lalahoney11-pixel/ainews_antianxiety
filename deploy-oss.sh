#!/bin/bash

# 阿里云 OSS 一键部署脚本
# 使用方法：./deploy-oss.sh

set -e

echo "🚀 开始部署到阿里云 OSS..."

# 配置信息
BUCKET="YOUR_BUCKET_NAME"
ACCESS_KEY_ID="YOUR_ACCESS_KEY_ID"
ACCESS_KEY_SECRET="YOUR_ACCESS_KEY_SECRET"
ENDPOINT="YOUR_ENDPOINT"

# 项目目录
PROJECT_DIR="."

# 使用项目目录中的 ossutil
OSSUTIL="$PROJECT_DIR/ossutil"

# 检查 ossutil 是否存在
if [ ! -f "$OSSUTIL" ]; then
    echo "❌ ossutil 未找到，请手动安装："
    echo "cd $PROJECT_DIR"
    echo "curl -fsSL https://gosspublic.alicdn.com/ossutil/current/ossutil-mac-arm64.zip -o ossutil.zip"
    echo "unzip ossutil.zip"
    echo "chmod +x ossutil-mac-arm64/ossutil"
    echo "mv ossutil-mac-arm64/ossutil ."
    exit 1
fi

echo "✅ ossutil 已找到"

# 配置 ossutil
echo "⚙️ 配置 ossutil..."
"$OSSUTIL" config -i "$ACCESS_KEY_ID" -k "$ACCESS_KEY_SECRET" -e "$ENDPOINT"

# 进入项目目录
cd "$PROJECT_DIR"

# 上传文件
echo "📤 上传文件到 OSS..."
"$OSSUTIL" cp -r ./ oss://$BUCKET/ --include "*.html" --include "*.js" --include "*.json" --include "*.css" --include "*.png" --include "*.jpg" --include "*.jpeg" --include "*.gif" --include "*.svg" --include "*.ico" --exclude ".git" --exclude "node_modules" --exclude "*.md" -r -f

echo "✅ 文件上传完成！"

# 获取访问地址
echo ""
echo "🎉 部署成功！"
echo "======================================"
echo "📱 访问地址："
echo "http://$BUCKET.$ENDPOINT/flow-a.html"
echo ""
echo "💡 提示："
echo "1. 请确保 OSS Bucket 已开启【静态页面托管】"
echo "2. 请确保 OSS Bucket 已配置【CORS 跨域】"
echo "3. 文件权限请设置为【公共读】"
echo "======================================"
echo ""
