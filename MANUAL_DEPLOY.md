# 手动部署指南

既然GitHub CLI工具遇到了认证问题，您可以使用以下手动步骤来创建GitHub仓库并推送代码：

## 1. 创建GitHub仓库

### 方法一：通过GitHub网页界面创建

1. 访问 [GitHub.com](https://github.com) 并登录
2. 点击右上角的 "New repository" 按钮（绿色）
3. 填写仓库信息：
   - **Repository name**: `zodiac-color-search-app`
   - **Description**: `生肖波色高级搜索系统 - 基于HTML的混合应用，可打包为APK`
   - **Visibility**: 选择 "Public"
   - **Initialize with README**: **不要勾选**（我们已经有README.md）
4. 点击 "Create repository"

### 方法二：通过GitHub CLI（如果网页方法有问题）

虽然MCP工具认证有问题，但您可以尝试在PowerShell中运行：

```powershell
cd e:\tmzs\capacitor-zodiac-app
gh repo create zodiac-color-search-app --public --description="生肖波色高级搜索系统 - 基于HTML的混合应用，可打包为APK"
```

## 2. 推送项目代码

创建仓库后，切换到项目目录并运行以下命令：

```powershell
# 进入项目目录
cd e:\tmzs\capacitor-zodiac-app

# 初始化Git仓库
git init

# 添加所有文件
git add .

# 创建初始提交
git commit -m "Initial commit: 生肖波色搜索系统混合应用"

# 添加远程仓库（替换 renqw2023 为您的GitHub用户名）
git remote add origin https://github.com/renqw2023/zodiac-color-search-app.git

# 设置主分支并推送
git branch -M main
git push -u origin main
```

## 3. 验证部署

推送成功后，您可以：

1. 访问 `https://github.com/renqw2023/zodiac-color-search-app`
2. 查看代码是否成功上传
3. 进入 "Actions" 标签页查看构建状态
4. 构建成功后下载APK文件

## 4. 构建状态监控

推送代码后，GitHub Actions会自动开始构建：

1. **查看Actions页面**：
   - 进入仓库的 "Actions" 标签页
   - 应该能看到一个正在运行的workflow

2. **下载APK文件**：
   - 构建完成后（通常需要5-10分钟）
   - 在workflow详情页面的底部可以找到Artifacts
   - 下载 `zodiac-search-debug-apk` 或 `zodiac-search-release-apk`

## 5. 测试APK文件

下载APK后：

1. **启用开发者模式**：
   - 在Android设备上打开"设置"
   - 找到"关于手机"
   - 连续点击"版本号"7次
   - 返回"设置"进入"开发者选项"

2. **安装APK**：
   - 将APK文件传输到Android设备
   - 在设备上打开APK文件
   - 如果提示"未知来源"，请允许安装

3. **测试应用功能**：
   - 打开安装的"生肖波色搜索"应用
   - 测试各种检索功能
   - 确认界面正常显示和交互

## 常见问题解决

### 如果推送失败

1. **检查Git配置**：
   ```powershell
   git config --global user.name "Your Name"
   git config --global user.email "your.email@example.com"
   ```

2. **如果遇到认证问题**：
   ```powershell
   gh auth status
   gh auth refresh
   ```

### 如果构建失败

1. **检查Actions页面**的构建日志
2. **常见问题**：
   - Node.js版本问题：我们的配置使用Node.js 18
   - 依赖安装失败：检查网络连接
   - Android构建失败：检查Java JDK版本

## 下一步

部署成功后，您可以：

1. **分享APK文件**：将下载的APK分享给他人
2. **创建发布版本**：通过GitHub Releases发布正式版本
3. **添加协作者**：邀请其他人参与开发
4. **配置自定义域名**：为项目设置自定义域名

## 获取帮助

如果遇到问题：

1. 查看 [GitHub Actions文档](https://docs.github.com/en/actions)
2. 检查 [Capacitor文档](https://capacitorjs.com/docs)
3. 提交GitHub Issue到您的仓库

祝您部署成功！🎉
