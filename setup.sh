#!/bin/bash

# 生肖波色搜索系统 - 快速设置脚本
# 这个脚本会帮助您快速设置和构建应用

echo "🎉 生肖波色搜索系统 - 快速设置开始..."
echo "================================"

# 检查Node.js是否安装
if ! command -v node &> /dev/null; then
    echo "❌ Node.js 未安装，请先安装 Node.js 18+ 版本"
    echo "下载地址: https://nodejs.org/"
    exit 1
fi

# 检查Node.js版本
NODE_VERSION=$(node -v | sed 's/v//' | cut -d. -f1)
if [ "$NODE_VERSION" -lt "16" ]; then
    echo "❌ Node.js 版本过低，需要 16+ 版本，当前版本: $(node -v)"
    exit 1
fi

echo "✅ Node.js 版本检查通过: $(node -v)"

# 安装依赖
echo ""
echo "📦 安装项目依赖..."
npm install

if [ $? -ne 0 ]; then
    echo "❌ 依赖安装失败"
    exit 1
fi

echo "✅ 依赖安装完成"

# 构建Web资源
echo ""
echo "🔨 构建Web资源..."
npm run build

if [ $? -ne 0 ]; then
    echo "❌ Web构建失败"
    exit 1
fi

echo "✅ Web构建完成"

# 检查Android开发环境（可选）
echo ""
echo "📱 检测Android开发环境..."
if command -v java &> /dev/null; then
    echo "✅ Java JDK 已安装: $(java -version 2>&1 | head -n1)"
else
    echo "⚠️  Java JDK 未安装，需要安装 JDK 17+ 来构建Android应用"
fi

if command -v adb &> /dev/null; then
    echo "✅ Android SDK 已安装"
else
    echo "⚠️  Android SDK 未安装，需要安装 Android SDK 来构建Android应用"
fi

echo ""
echo "🎯 设置完成！"
echo "================================"
echo ""
echo "可用命令:"
echo "  npm run dev           - 启动开发服务器"
echo "  npm run build         - 构建生产版本"
echo "  npm run android:add   - 添加Android平台"
echo "  npm run android:sync  - 同步代码到Android"
echo "  npm run android:run   - 在Android设备上运行"
echo "  npm run android:build - 构建APK文件"
echo ""
echo "GitHub Actions将自动构建APK文件"
echo "详细说明请查看 README.md 和 GITHUB_SETUP.md"
echo ""
echo "🚀 祝您使用愉快！"
