#!/bin/bash

# 腾讯云云开发一键部署脚本
# 使用方法：./deploy-cloudbase.sh

set -e

echo "🚀 开始部署到腾讯云云开发..."

# 项目目录
PROJECT_DIR="/Users/lulu/Library/Mobile Documents/com~apple~CloudDocs/Documents/Project  text/release/new-project"

# 检查 Node.js 是否安装
if ! command -v node &> /dev/null; then
    echo "❌ Node.js 未安装，请先安装 Node.js"
    echo "下载地址：https://nodejs.org/"
    exit 1
fi

# 检查 CloudBase CLI 是否安装
if ! command -v tcb &> /dev/null; then
    echo "❌ CloudBase CLI 未安装，正在安装..."
    npm install -g @cloudbase/cli
fi

echo "✅ CloudBase CLI 已安装"

# 登录腾讯云
echo "🔐 请登录腾讯云..."
tcb login

# 进入项目目录
cd "$PROJECT_DIR"

# 初始化项目（如果是第一次）
if [ ! -f "cloudbaserc.json" ]; then
    echo "⚙️ 初始化项目配置..."
    tcb init
fi

# 部署到云开发
echo "📤 部署到云开发..."
tcb hosting:deploy .

echo "✅ 部署完成！"

# 获取环境信息
echo ""
echo "🎉 部署成功！"
echo "======================================"
echo "📱 访问地址："
echo "请在云开发控制台查看：https://console.cloud.tencent.com/tcb"
echo ""
echo "💡 提示："
echo "1. 登录云开发控制台查看您的环境域名"
echo "2. 确保已开通【网站托管】服务"
echo "3. 如需绑定自定义域名，请在【域名管理】中配置"
echo "======================================"
echo ""
