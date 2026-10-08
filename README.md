# 红脉智联：项目复现

这是原项目的独立复现副本，用于学习、运行验证和后续改进。原项目文件保留在上一级目录。
当前副本来自已有源码；不将原项目全部功能声称为个人原创成果。

## 目录

- `api/`：PHP 后端接口和 MySQL 初始化脚本。
- `frontend/`：Vue 3、Vite、Pinia 前端。
- `photo/`：原项目照片素材。网站实际访问 `frontend/public/photos/`。
- `docs/原项目技术说明.md`：原技术文档的脱敏副本，部分说明需通过运行核对。
- `docs/复现记录.md`：复现进度和验证结果。
- `tools/`：辅助使用本机运行环境的脚本。

## 本机环境

已经在上一级目录 `.runtime/` 安装 PHP 8.4.26 和 MySQL 8.4.11。
该运行环境、数据库文件、密码、依赖目录和构建产物不提交到 Git。
本目录不会自动启动服务或导入数据库。

```powershell
cd C:\Users\lenovo\Desktop\red-pulse-good\red-pulse-reproduction
. .\tools\Use-LocalRuntime.ps1
php -v
mysql --version
```

## 下一步复现

1. 为复现项目建立专用数据库和账号。`api/init.sql` 含 `DROP TABLE`，且数据库名写为 `red-pulse`；执行前应核对并为复现库调整数据库名。
2. 在启动 PHP 的终端设置 `DB_HOST`、`DB_PORT`、`DB_NAME`、`DB_USER`、`DB_PASS`、`SECRET` 环境变量。SECRET 应为本地随机值。
3. AI 功能按需设置 `AI_KEY`、`AI_URL`、`AI_MODEL`。AI_KEY 不填写时该功能尚不可用。
4. 将 `frontend/.env.example` 复制为 `frontend/.env.local`，填写本人的高德地图配置。
5. 安装前端依赖并启动前后端。现有 Vite 代理指向 `http://localhost:80`；若 PHP 使用其他端口，需同步调整代理地址。
6. 验证登录、用户权限和志愿项目提交审核，再逐项检查地图、游戏、商城与 AI。

前端命令：

```powershell
cd frontend
npm ci
npm run dev
```

副本中的后端配置已改为读取环境变量；没有携带原项目的 AI 密钥、地图密钥、数据库密码或 Token 签名密钥。
新电脑需另行安装 Node.js、PHP 和 MySQL，并启用 PHP 的 `pdo_mysql`、`mbstring`、`curl` 等扩展。

## 当前边界

源码基线已经整理，尚未完成这个副本的数据库初始化、登录测试或完整功能验证。
思政成长馆目前使用浏览器 localStorage；英烈模块存在模拟数据回退。页面显示内容不等于后端验证成功。
