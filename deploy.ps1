# ========================================
# Q 播客网站 - 自动部署脚本
# PowerShell 版本（Windows）
# ========================================

# 颜色输出函数
function Write-Success {
    param([string]$Message)
    Write-Host "✅ $Message" -ForegroundColor Green
}

function Write-Error-Custom {
    param([string]$Message)
    Write-Host "❌ $Message" -ForegroundColor Red
}

function Write-Info {
    param([string]$Message)
    Write-Host "ℹ️  $Message" -ForegroundColor Cyan
}

function Write-Warning-Custom {
    param([string]$Message)
    Write-Host "⚠️  $Message" -ForegroundColor Yellow
}

# ========================================
# Step 1: 检查 Git 是否安装
# ========================================
Write-Info "正在检查 Git 是否安装..."
try {
    $gitVersion = git --version
    Write-Success "Git 已安装: $gitVersion"
} catch {
    Write-Error-Custom "Git 未安装！请先安装 Git: https://git-scm.com/download/win"
    exit 1
}

# ========================================
# Step 2: 检查 Git 配置
# ========================================
Write-Info "正在检查 Git 用户配置..."
$gitUser = git config --global user.name
$gitEmail = git config --global user.email

if ([string]::IsNullOrEmpty($gitUser) -or [string]::IsNullOrEmpty($gitEmail)) {
    Write-Warning-Custom "Git 用户信息未配置"
    Write-Info "正在配置 Git 用户信息..."
    
    # 使用默认值或让用户输入
    $defaultUser = "ywhf"
    $defaultEmail = "cyzzzum@gmail.com"
    
    git config --global user.name $defaultUser
    git config --global user.email $defaultEmail
    
    Write-Success "Git 用户信息已配置: $defaultUser <$defaultEmail>"
} else {
    Write-Success "Git 用户信息已配置: $gitUser <$gitEmail>"
}

# ========================================
# Step 3: 初始化 Git 仓库
# ========================================
Write-Info "正在初始化 Git 仓库..."
if (Test-Path .git) {
    Write-Warning-Custom "Git 仓库已存在，跳过初始化"
} else {
    git init
    Write-Success "Git 仓库已初始化"
}

# ========================================
# Step 4: 配置远程仓库
# ========================================
Write-Info "正在配置远程仓库..."

$repoUrl = "https://github.com/ywhf/q-podcast-ultimate.git"

# 检查是否已经配置了远程仓库
$remoteExists = git remote get-url origin 2>$null

if ($remoteExists) {
    Write-Warning-Custom "远程仓库已配置: $remoteExists"
    $updateRemote = Read-Host "要更新为 $repoUrl 吗? (y/n)"
    if ($updateRemote -eq "y") {
        git remote set-url origin $repoUrl
        Write-Success "远程仓库已更新"
    }
} else {
    git remote add origin $repoUrl
    Write-Success "远程仓库已添加: $repoUrl"
}

# ========================================
# Step 5: 添加所有文件
# ========================================
Write-Info "正在添加所有文件到 Git..."
git add .
Write-Success "所有文件已添加"

# ========================================
# Step 6: 显示将要提交的文件
# ========================================
Write-Info "即将提交的文件:"
git diff --cached --name-only | ForEach-Object { Write-Host "  • $_" }

# ========================================
# Step 7: 创建提交
# ========================================
Write-Info "正在创建第一次提交..."

# 获取当前日期
$currentDate = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

# 检查是否已有提交
$hasCommits = git rev-parse HEAD 2>$null

if ($hasCommits) {
    Write-Warning-Custom "仓库中已有提交历史"
    $commitMessage = Read-Host "输入提交信息 (或按 Enter 使用默认信息)"
    if ([string]::IsNullOrEmpty($commitMessage)) {
        $commitMessage = "Update: $currentDate"
    }
} else {
    $commitMessage = "Initial commit: Q podcast ultimate project"
}

git commit -m $commitMessage
Write-Success "提交已创建: $commitMessage"

# ========================================
# Step 8: 推送到 GitHub
# ========================================
Write-Info "正在推送代码到 GitHub..."

# 检查默认分支
$defaultBranch = git rev-parse --abbrev-ref HEAD

Write-Info "当前分支: $defaultBranch"

# 尝试推送
try {
    git push -u origin $defaultBranch
    Write-Success "代码已推送到 GitHub!"
} catch {
    Write-Error-Custom "推送失败！"
    Write-Info "可能的原因:"
    Write-Info "1. 未配置 GitHub 认证 - 运行: git config --global credential.helper wincred"
    Write-Info "2. 仓库不存在 - 请先在 GitHub 上创建仓库"
    Write-Info "3. 没有推送权限 - 检查你的 GitHub 访问令牌"
    Write-Info ""
    Write-Info "手动推送命令:"
    Write-Info "git push -u origin $defaultBranch"
    exit 1
}

# ========================================
# Step 9: 显示 GitHub Pages 配置说明
# ========================================
Write-Info "正在生成 GitHub Pages 配置说明..."

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "🎉 部署完成！" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan

Write-Host ""
Write-Host "📝 后续步骤:" -ForegroundColor Yellow
Write-Host ""
Write-Host "1️⃣  打开 GitHub 仓库页面:"
Write-Host "   https://github.com/ywhf/q-podcast-ultimate"
Write-Host ""
Write-Host "2️⃣  启用 GitHub Pages:"
Write-Host "   a. 点击 Settings"
Write-Host "   b. 找到左边栏的 'Pages'"
Write-Host "   c. 'Source' 选择 'Deploy from a branch'"
Write-Host "   d. 选择 'master' 分支 (或你当前的分支)"
Write-Host "   e. 点 Save"
Write-Host ""
Write-Host "3️⃣  等待 5-10 分钟，你的网站会上线："
Write-Host "   https://ywhf.github.io/q-podcast-ultimate"
Write-Host ""
Write-Host "4️⃣  完成！访问你的网站！"
Write-Host ""

# ========================================
# Step 10: 显示有用的 Git 命令
# ========================================
Write-Host "📚 以后的常用 Git 命令:" -ForegroundColor Yellow
Write-Host ""
Write-Host "# 查看状态"
Write-Host "git status"
Write-Host ""
Write-Host "# 查看提交历史"
Write-Host "git log --oneline"
Write-Host ""
Write-Host "# 修改后提交"
Write-Host "git add ."
Write-Host "git commit -m '你的提交信息'"
Write-Host "git push"
Write-Host ""

Write-Success "脚本执行完成！🚀"
Write-Info "如有问题，请查看 README.md 的故障排查部分"
