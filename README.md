# 生肖波色高级搜索系统

一个基于 HTML/CSS/JavaScript 的混合应用，使用 Ionic Capacitor 打包为 Android APK。

## 📱 功能特点

- 🧮 **智能检索**：支持生肖和波色的智能组合检索
- 🎨 **美观界面**：现代化的渐变设计，丰富的动画效果
- 📊 **数据统计**：实时显示检索统计信息
- 🎯 **精确匹配**：支持生肖与波色的交集、差集运算
- 📱 **移动优化**：完美适配手机和平板设备
- ⚡ **快速响应**：基于原生JavaScript，无需后端

## 🛠️ 技术栈

- **前端**：HTML5, CSS3, JavaScript (ES6+)
- **构建工具**：Vite
- **混合应用框架**：Ionic Capacitor
- **CI/CD**：GitHub Actions
- **平台**：Android (APK)

## 📋 项目结构

```
capacitor-zodiac-app/
├── index.html              # 主应用文件
├── package.json            # 项目依赖和脚本
├── capacitor.config.ts     # Capacitor 配置
├── vite.config.js          # Vite 构建配置
├── README.md               # 项目说明
├── .gitignore             # Git 忽略文件
└── .github/
    └── workflows/
        └── android-build.yml # GitHub Actions 构建配置
```

## 🚀 快速开始

### 本地开发

```bash
# 安装依赖
npm install

# 启动开发服务器
npm run dev

# 在浏览器中预览
npm run preview
```

### Android 应用构建

```bash
# 添加 Android 平台
npm run android:add

# 同步代码到 Android 项目
npm run android:sync

# 在模拟器或设备上运行
npm run android:run

# 构建 APK 文件
npm run android:build
```

### 使用 Android Studio

```bash
# 打开 Android Studio
npm run android:open
```

## 📦 构建和发布

### 自动化构建

项目配置了 GitHub Actions，推送到 main 分支时会自动构建 APK：

1. 推送代码到 GitHub
2. GitHub Actions 自动运行构建
3. 在 Actions 页面下载生成的 APK 文件

### 手动构建

```bash
# 构建生产版本
npm run build

# 构建 Android APK
cd android
./gradlew assembleDebug
```

生成的 APK 文件位置：
`android/app/build/outputs/apk/debug/app-debug.apk`

## 🔧 配置说明

### Capacitor 配置

在 `capacitor.config.ts` 中可以配置：

- 应用ID和名称
- Web资源目录
- 插件设置（启动画面、状态栏等）

### Vite 配置

在 `vite.config.js` 中可以配置：

- 构建输出目录
- 资源文件处理
- 开发服务器设置

## 📱 应用权限

应用包含以下权限（如果需要的话）：
- 网络访问（如果需要联网功能）
- 存储权限（如果需要保存数据）

## 🎯 生肖和波色规则

### 生肖数字对应
- 鼠: 6, 18, 30, 42
- 牛: 5, 17, 29, 41
- 虎: 4, 16, 28, 40
- 兔: 3, 15, 27, 39
- 龙: 2, 14, 26, 38
- 蛇: 1, 13, 25, 37, 49
- 马: 12, 24, 36, 48
- 羊: 11, 23, 35, 47
- 猴: 10, 22, 34, 46
- 鸡: 9, 21, 33, 45
- 狗: 8, 20, 32, 44
- 猪: 7, 19, 31, 43

### 波色数字对应
- **红波**：18, 30, 29, 40, 2, 1, 13, 12, 24, 23, 35, 34, 46, 45, 8, 7, 19
- **蓝波**：42, 41, 4, 3, 15, 14, 26, 25, 37, 36, 48, 47, 10, 9, 20, 31
- **绿波**：6, 5, 17, 16, 28, 27, 39, 38, 49, 11, 22, 21, 33, 32, 44, 43

## 🎮 使用说明

### 检索示例

1. **多条件组合检索**：
   ```
   兔猪龙牛猴狗羊 红 蓝
   ```
   查找属兔猪龙牛猴狗羊且为红波或蓝波的数字

2. **单波色检索**：
   ```
   红 绿
   ```
   查找所有红波和绿波的数字

3. **单生肖检索**：
   ```
   鼠牛虎
   ```
   查找属鼠牛虎的所有数字

### 操作按钮

- 🔍 **开始检索**：执行当前输入条件的检索
- 🗑️ **清空结果**：清除输入和结果
- 📊 **显示筛选数据**：显示被筛选掉的数据

## 📝 开发说明

### 修改应用配置

1. **应用名称**：在 `capacitor.config.ts` 中修改 `appName`
2. **应用包名**：在 `capacitor.config.ts` 中修改 `appId`
3. **启动画面**：在 Android 项目中修改相应配置

### 添加新功能

1. 在 `index.html` 中添加HTML结构
2. 在 `<style>` 标签中添加CSS样式
3. 在 `<script>` 标签中添加JavaScript逻辑

## 🔗 相关链接

- [Ionic Capacitor 官方文档](https://capacitorjs.com/)
- [Vite 官方文档](https://vitejs.dev/)
- [Android 开发指南](https://developer.android.com/guide)

## 📄 许可证

MIT License

## 👨‍💻 贡献

欢迎提交 Issue 和 Pull Request！
