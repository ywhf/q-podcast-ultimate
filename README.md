# 🎙️ 毒舌 Q 的十日谈 - 播客网站

> 一个沉浸式的 3D 播客品牌体验网站

## 📖 项目介绍

这是一个为"毒舌 Q 的十日谈"播客打造的**现代化、沉浸式网站**。

### ✨ 核心特性

- 🎬 **Three.js 3D 场景** - 交互式 Q 女士 3D 角色
- ✨ **Canvas 粒子系统** - 鼠标跟踪粒子效果
- 🎵 **音效同步系统** - 完美的视听体验
- 📱 **完全响应式** - 桌面/平板/手机完美适配
- 🚀 **高性能优化** - 60fps 流畅体验
- 🎨 **小赖字体** - 温暖亲切的品牌调性

---

## 🎯 项目结构

```
q-podcast-ultimate/
├─ index.html              # 主入口文件
├─ README.md              # 项目说明（就是这个文件）
├─ package.json           # 项目配置
│
├─ src/                   # 源代码目录
│  ├─ css/
│  │  ├─ base.css        # 基础样式
│  │  ├─ animations.css  # 动画样式
│  │  └─ responsive.css  # 响应式样式
│  │
│  └─ js/
│     ├─ main.js         # 主程序入口
│     ├─ three-scene.js  # 3D 场景管理
│     ├─ particle-system.js  # 粒子系统
│     ├─ interactions.js  # 交互逻辑
│     ├─ audio-manager.js    # 音效管理
│     └─ utils.js        # 工具函数
│
├─ assets/               # 资源文件
│  ├─ sounds/           # 音效文件
│  ├─ images/           # 图片文件
│  └─ models/           # 3D 模型（可选）
│
└─ docs/                # 文档
   ├─ SETUP.md          # 快速开始
   ├─ DEPLOYMENT.md     # 部署指南
   └─ ARCHITECTURE.md   # 架构说明
```

---

## 🚀 快速开始

### 1. 克隆仓库到本地

```bash
git clone https://github.com/ywhf/q-podcast-ultimate.git
cd q-podcast-ultimate
```

### 2. 本地预览

**方法 A：用 Python 启动本地服务器（推荐）**

```bash
# Python 3
python -m http.server 8000

# 然后打开浏览器访问：http://localhost:8000
```

**方法 B：用 Node.js 的 http-server**

```bash
npm install -g http-server
http-server
```

**方法 C：直接用 VS Code 的 Live Server 扩展**

1. 装 Live Server 扩展
2. 右键 `index.html`
3. 选 "Open with Live Server"

### 3. 查看效果

打开 http://localhost:8000 或 http://127.0.0.1:8000

你应该看到：
- ✅ 毒舌 Q 的 3D 头像
- ✅ 动态粒子背景
- ✅ 播客集数卡片
- ✅ 完整的交互效果

---

## 📦 部署到 GitHub Pages（免费托管）

### 方法 1：直接推送到 GitHub（最简单）

```bash
# 确保你在项目文件夹
cd q-podcast-ultimate

# 添加所有文件到 Git
git add .

# 提交
git commit -m "Initial commit: Q podcast ultimate project"

# 推送到 GitHub
git push -u origin master
```

### 方法 2：在 GitHub 上启用 Pages

1. 打开你的仓库：https://github.com/ywhf/q-podcast-ultimate
2. 点 Settings
3. 左边栏找 "Pages"
4. "Source" 选择 "master branch"
5. 保存

**5 分钟后，你的网站就会在这个地址上线：**
```
https://ywhf.github.io/q-podcast-ultimate
```

---

## 🎨 自定义和修改

### 修改颜色

编辑 `src/css/base.css` 的 `:root` 部分：

```css
:root {
  --primary: #ff9a76;      /* 主色 - 橙色 */
  --secondary: #ffd93d;    /* 副色 - 黄色 */
  --accent: #a8e6cf;       /* 强调色 - 绿色 */
  --dark: #2d2d44;         /* 深色背景 */
  --light: #fff8f3;        /* 浅色背景 */
}
```

### 修改集数信息

编辑 `index.html` 中的集数卡片部分：

```html
<div class="episode-card">
  <div class="episode-number">S1E10</div>
  <div class="episode-title">你的标题</div>
  <p class="episode-desc">你的描述</p>
  <span class="episode-tag">💡 标签</span>
  <button class="play-btn">▶️ 播放</button>
</div>
```

### 添加音效

将音频文件放到 `assets/sounds/` 文件夹，然后在 `src/js/audio-manager.js` 中引用：

```javascript
audioManager.loadSound('click', 'assets/sounds/click.mp3');
audioManager.play('click', 0.5);
```

---

## 🔧 技术栈

| 技术 | 用途 | 版本 |
|------|------|------|
| **HTML5** | 结构 | - |
| **CSS3** | 样式 + 动画 | - |
| **JavaScript** | 交互逻辑 | ES6+ |
| **Three.js** | 3D 渲染 | r128 |
| **Xiaolai Font** | 字体 | 最新 |
| **Web Audio API** | 音效管理 | 原生 |

---

## 📱 浏览器兼容性

| 浏览器 | 支持 | 备注 |
|------|------|------|
| Chrome | ✅ | 完美支持 |
| Firefox | ✅ | 完美支持 |
| Safari | ✅ | 完美支持 |
| Edge | ✅ | 完美支持 |
| IE 11 | ❌ | 不支持 WebGL |

---

## 🐛 常见问题

### Q: 页面加载很慢？

**A:** 
- 检查网络连接
- 清除浏览器缓存（Ctrl+Shift+Del）
- Three.js 首次加载会比较慢，之后会缓存

### Q: 3D 模型不显示？

**A:**
- 确保你的浏览器支持 WebGL
- 检查浏览器控制台（F12）看有没有错误
- 更新显卡驱动

### Q: 手机上卡顿？

**A:**
- 某些低端手机可能不支持 3D
- 可以关闭粒子效果来提升性能
- 编辑 `src/js/particle-system.js`，注释掉粒子生成代码

### Q: 怎么修改播客平台链接？

**A:** 编辑 `index.html` 中的按钮链接：

```html
<button class="platform-btn" onclick="window.open('https://你的链接')">
  🎧 小宇宙
</button>
```

---

## 📝 开发指南

### 添加新的集数

1. 编辑 `index.html`，在 `.episodes-grid` 中添加新卡片：

```html
<div class="episode-card">
  <div class="episode-number">S1E11</div>
  <div class="episode-title">新集标题</div>
  <p class="episode-desc">集数描述</p>
  <span class="episode-tag">💡 标签</span>
  <button class="play-btn">▶️ 播放</button>
</div>
```

### 自定义动画

编辑 `src/css/animations.css` 或 `src/js/animations.js`：

```css
@keyframes customAnimation {
  0% { transform: scale(1); opacity: 1; }
  50% { transform: scale(1.1); opacity: 0.8; }
  100% { transform: scale(1); opacity: 1; }
}
```

### 添加新的交互

编辑 `src/js/interactions.js`：

```javascript
document.addEventListener('click', (event) => {
  if (event.target.classList.contains('your-element')) {
    // 你的交互逻辑
  }
});
```

---

## 🚀 性能优化建议

1. **压缩图片** - 使用 TinyPNG 压缩
2. **启用 Gzip** - 服务器启用 Gzip 压缩
3. **CDN 加速** - 使用 Cloudflare 免费 CDN
4. **代码分割** - 大文件分解成多个模块
5. **懒加载** - 图片和模块按需加载

---

## 📞 支持和反馈

有问题或建议？提交 Issue 或 PR！

---

## 📄 开源协议

MIT License - 可自由使用和修改

---

## 🎉 感谢

感谢所有使用和支持这个项目的人！

**让我们一起打造"小红书最靓的仔"！** 🌚✨

---

**最后更新：** 2025 年 1 月
**维护者：** ywhf
**GitHub：** https://github.com/ywhf/q-podcast-ultimate
