# 🚀 完整部署指南 - 一步步教你上线网站

> 针对 Windows PowerShell 7.6.0 用户

---

## 📋 目录

1. [准备工作](#准备工作)
2. [本地测试](#本地测试)
3. [上传到 GitHub](#上传到-github)
4. [启用 GitHub Pages](#启用-github-pages)
5. [常见问题](#常见问题)
6. [之后怎么修改](#之后怎么修改)

---

## 准备工作

### ✅ 你已经有的（不用做）

```
✓ Git 已安装（git version 2.53.0.windows.2）
✓ PowerShell 7.6.0
✓ GitHub 账户和仓库已创建（q-podcast-ultimate）
✓ 所有项目文件已准备好
```

### 📁 项目文件说明

你现在应该有这些文件：

```
q-podcast-ultimate/
├─ index.html          ← 网站主页面（最重要！）
├─ README.md          ← 项目说明
├─ deploy.ps1         ← 自动部署脚本
├─ package.json       ← 项目配置
└─ .gitignore        ← Git 忽略规则
```

---

## 本地测试

**在上传到 GitHub 前，先在本地测试一下网站有没有问题。**

### 步骤 1：打开项目文件夹

在你的项目文件夹里（应该是 `C:\Users\你的用户名\某个位置\q-podcast-ultimate`），**右键打开 PowerShell**：

```
右键 → "在此处打开 PowerShell"
```

你应该看到类似这样：

```
PS C:\Users\ywhf\q-podcast-ultimate>
```

### 步骤 2：启动本地服务器

**方法 A：用 Python（推荐，最简单）**

```powershell
python -m http.server 8000
```

你应该看到：

```
Serving HTTP on 0.0.0.0 port 8000 (http://0.0.0.0:8000/) ...
```

**方法 B：用 Node.js**

```powershell
npx http-server
```

### 步骤 3：打开浏览器

打开你的浏览器（Chrome、Edge、Firefox 都行），访问：

```
http://localhost:8000
```

你应该看到：
- ✅ 毒舌 Q 的头像（左边，有眼睛和嘴巴）
- ✅ 大标题"欢迎来到毒舌 Q 的十日谈"
- ✅ 橙色的按钮
- ✅ 集数卡片
- ✅ 所有东西看起来很好看

**如果没有出现，检查：**

1. 有没有错误信息？（在浏览器 F12 的 Console 标签）
2. 网址有没有打对？
3. 试试按 Ctrl+R 刷新页面

### 步骤 4：关闭本地服务器

在 PowerShell 里按 **Ctrl+C** 停止服务器。

---

## 上传到 GitHub

### 方法 1：用自动脚本（超简单，推荐）

**步骤 1：打开 PowerShell**

在项目文件夹里右键 → "在此处打开 PowerShell"

**步骤 2：允许脚本执行**

首次运行可能需要允许脚本执行：

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

按 `Y` 然后 Enter

**步骤 3：运行部署脚本**

```powershell
.\deploy.ps1
```

**就这样！** 脚本会自动：
- ✅ 初始化 Git
- ✅ 配置远程仓库
- ✅ 添加所有文件
- ✅ 创建第一次提交
- ✅ 推送到 GitHub

你会看到类似这样的输出：

```
✅ Git 已安装: git version 2.53.0.windows.2
✅ Git 用户信息已配置: ywhf <cyzzzum@gmail.com>
✅ Git 仓库已初始化
✅ 远程仓库已添加: https://github.com/ywhf/q-podcast-ultimate.git
✅ 所有文件已添加
✅ 提交已创建: Initial commit: Q podcast ultimate project
✅ 代码已推送到 GitHub!

========================================
🎉 部署完成！
========================================
```

---

### 方法 2：手动一步步来（如果脚本有问题）

**步骤 1：初始化 Git**

```powershell
git init
```

**步骤 2：添加远程仓库**

```powershell
git remote add origin https://github.com/ywhf/q-podcast-ultimate.git
```

**步骤 3：添加所有文件**

```powershell
git add .
```

**步骤 4：创建第一次提交**

```powershell
git commit -m "Initial commit: Q podcast ultimate project"
```

**步骤 5：推送到 GitHub**

```powershell
git push -u origin master
```

可能会弹出一个登录窗口，登录你的 GitHub 账号就行。

---

## 启用 GitHub Pages

现在你的代码已经在 GitHub 上了，但网站还没上线。需要启用 GitHub Pages。

### 步骤 1：打开你的仓库页面

打开浏览器，访问：

```
https://github.com/ywhf/q-podcast-ultimate
```

### 步骤 2：点 Settings

![点击 Settings](https://docs.github.com/assets/cb-11507/mw-1440/images/help/repository/repo-actions-settings.webp)

（在仓库页面右上角）

### 步骤 3：找 Pages

在左边栏找 **"Pages"** 并点击

### 步骤 4：配置 Source

- **Source** 选择 **"Deploy from a branch"**
- **Branch** 选择 **"master"**（或你用的分支名）
- **Folder** 选择 **"/ (root)"**
- 点 **"Save"**

### 步骤 5：等待部署

GitHub 会开始部署，你会看到一条黄色的提示：

```
Your site is live at https://ywhf.github.io/q-podcast-ultimate
```

🎉 **你的网站上线了！**

---

## 查看你的网站

等 5-10 分钟后，访问：

```
https://ywhf.github.io/q-podcast-ultimate
```

你应该看到你的播客网站！

**分享给朋友的链接就是这个！**

---

## 常见问题

### Q: 推送时要求输入用户名和密码？

**A:** GitHub 不再用密码了，要用 Personal Access Token（访问令牌）

解决方法：

1. 去 https://github.com/settings/tokens
2. 点 "Generate new token" → "Generate new token (classic)"
3. 勾选 `repo` 和 `workflow`
4. 生成 token
5. 复制 token
6. 在 PowerShell 的密码框粘贴 token（不是密码！）

### Q: 网站上线了但看不到内容？

**A:** 可能是缓存问题，试试：

1. 在网址栏按 **Ctrl+Shift+Del** 清除缓存
2. 或用隐身窗口打开
3. 等等，有时候 GitHub 需要几分钟才能完全部署

### Q: 怎么修改网站内容？

**A:** 编辑 `index.html`，然后：

```powershell
git add .
git commit -m "修改内容"
git push
```

GitHub 会自动重新部署！

### Q: 怎么修改集数？

**A:** 在 `index.html` 中找到 `<div class="episode-card">` 的部分，修改里面的内容：

```html
<div class="episode-card">
    <div class="episode-number">S1E10</div>
    <div class="episode-title">你的标题</div>
    <p class="episode-desc">你的描述</p>
    <span class="episode-tag">💡 标签</span>
    <button class="play-btn">▶️ 播放</button>
</div>
```

然后 `git add . → git commit → git push`

### Q: 怎么修改颜色？

**A:** 在 `index.html` 的 `<style>` 部分找到 `:root` 这一块：

```css
:root {
    --primary: #ff9a76;      /* 改这个改主色 */
    --secondary: #ffd93d;    /* 改这个改副色 */
    --accent: #a8e6cf;       /* 改这个改强调色 */
    ...
}
```

改成你喜欢的颜色代码（可以去 https://www.color-hex.com 找颜色）

### Q: 推送失败，说"Permission denied"？

**A:** 检查你有没有 SSH 密钥或 Token 配置。运行：

```powershell
git config --list
```

看看有没有 `credential.helper`，如果没有：

```powershell
git config --global credential.helper wincred
```

然后再试一次 `git push`

---

## 之后怎么修改

### 修改后重新部署（三步）

1. **编辑文件**（用记事本或 VS Code）
2. **上传到 GitHub：**

```powershell
git add .
git commit -m "你的改动说明"
git push
```

3. **等待 5 分钟**，GitHub 自动部署，刷新网站就能看到新内容

### 有用的 Git 命令

```powershell
# 查看修改了什么
git status

# 查看提交历史
git log --oneline

# 回滚到上一个版本（如果改坏了）
git reset --hard HEAD~1
git push --force
```

---

## 🎉 完成！

你现在有：

- ✅ 一个本地的项目文件夹
- ✅ GitHub 上的备份
- ✅ 一个上线的网站
- ✅ 一个可以随时修改和更新的系统

**祝你的播客网站爆红！** 🚀

---

## 📞 还有问题？

1. 查看 `README.md`
2. 查看错误信息（通常 Git 会告诉你什么问题）
3. 去 GitHub 的 Issues 部分提问

**加油！** 💪😏🌚
