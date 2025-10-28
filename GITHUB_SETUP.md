# GitHub 设置和部署指南

## 1. 创建 GitHub 仓库

由于GitHub API需要认证凭据，您需要手动创建仓库：

### 方法一：通过GitHub网页界面创建

1. 登录 [GitHub.com](https://github.com)
2. 点击右上角的 "+" 号
3. 选择 "New repository"
4. 填写仓库信息：
   - **Repository name**: `zodiac-color-search-app`
   - **Description**: `生肖波色高级搜索系统 - 基于HTML的混合应用，可打包为APK`
   - **Visibility**: 选择 "Public" 或 "Private"
   - **Initialize with README**: 不勾选（我们已有README.md）

### 方法二：通过GitHub CLI创建

如果您已安装GitHub CLI，可以运行：

```bash
# 认证（首次使用）
gh auth login

# 创建仓库
gh repo create zodiac-color-search-app --public --description="生肖波色高级搜索系统 - 基于HTML的混合应用，可打包为APK"
```

## 2. 推送项目到GitHub

创建仓库后，在项目目录中运行：

```bash
# 初始化Git仓库
git init

# 添加所有文件
git add .

# 创建初始提交
git commit -m "Initial commit: 生肖波色搜索系统混合应用"

# 添加远程仓库（替换YOUR_USERNAME为您的GitHub用户名）
git remote add origin https://github.com/YOUR_USERNAME/zodiac-color-search-app.git

# 推送代码到GitHub
git branch -M main
git push -u origin main
```

## 3. 配置仓库设置

### 启用GitHub Actions

1. 进入仓库的 "Actions" 标签页
2. 如果提示启用Actions，点击 "I understand my workflows, go ahead and enable them"
3. 我们的工作流文件 `.github/workflows/android-build.yml` 已经配置好了

### 设置分支保护（推荐）

1. 进入仓库的 "Settings" 标签页
2. 选择 "Branches"
3. 点击 "Add rule"
4. 设置规则：
   - **Branch name pattern**: `main`
   - 勾选 "Require a pull request before merging"
   - 勾选 "Dismiss stale PR approvals when new commits are pushed"

### 配置仓库信息

1. 在仓库主页点击齿轮图标（Settings）
2. 完善以下信息：
   - **Description**: 已设置
   - **Website**: 可以添加应用下载链接
   - **Topics**: 添加相关标签，如 `android`, `capacitor`, `html`, `webapp`, `zodiac`, `search`

## 4. 自动化构建测试

推送代码后，GitHub Actions会自动开始构建：

1. 进入仓库的 "Actions" 标签页
2. 查看构建状态：
   - 🟢 **绿色勾号**: 构建成功
   - 🔴 **红色X**: 构建失败
   - 🟡 **黄色圆点**: 正在构建

### 构建产物下载

构建成功后：

1. 点击构建工作流
2. 在 "Artifacts" 部分可以看到：
   - `zodiac-search-debug-apk`: 调试版APK
   - `zodiac-search-release-apk`: 发布版APK

### 发布版本（可选）

如果您想创建正式的APK发布版本：

1. 创建一个Git标签：
   ```bash
   git tag v1.0.0
   git push origin v1.0.0
   ```

2. 这将自动触发发布流程，APK文件会作为Release附件上传

## 5. 项目徽章（可选）

在README.md中添加构建状态徽章：

```markdown
[![Android Build](https://github.com/YOUR_USERNAME/zodiac-color-search-app/actions/workflows/android-build.yml/badge.svg)](https://github.com/YOUR_USERNAME/zodiac-color-search-app/actions/workflows/android-build.yml)
```

替换 `YOUR_USERNAME` 为您的GitHub用户名。

## 6. 常见问题解决

### 构建失败

如果构建失败，检查：

1. **依赖安装失败**：
   - 检查 `package.json` 中的依赖版本
   - 确保Node.js版本兼容性

2. **Android构建失败**：
   - 检查Java JDK版本设置
   - 确认Android SDK配置

3. **文件路径错误**：
   - 确保所有配置文件路径正确
   - 检查工作流文件中的路径设置

### 权限问题

如果GitHub Actions没有权限：

1. 进入仓库的 "Settings" > "Actions"
2. 检查 "Workflow permissions" 设置
3. 选择 "Read and write permissions"

### APK签名（发布版）

对于发布版APK，您可能需要配置签名：

1. 生成签名密钥：
   ```bash
   keytool -genkey -v -keystore zodiac-app.keystore -alias zodiac-key -keyalg RSA -keysize 2048 -validity 10000
   ```

2. 在Android项目中配置签名
3. 在GitHub Secrets中存储密钥信息

## 7. 下一步

仓库设置完成后，您可以：

1. 邀请协作者加入项目
2. 设置Issues和Projects来跟踪任务
3. 配置Webhook集成其他服务
4. 设置自动化测试（如果有的话）

## 8. 联系支持

如果在设置过程中遇到问题：

1. 查看 [GitHub Actions文档](https://docs.github.com/en/actions)
2. 检查 [Capacitor文档](https://capacitorjs.com/docs)
3. 提交GitHub Issue到本项目
