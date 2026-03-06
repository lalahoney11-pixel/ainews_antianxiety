# Zeabur 部署指南

## 为什么选择 Zeabur？

- ✅ **国内访问速度快** - 服务器位于亚洲，无需翻墙
- ✅ **免费额度充足** - 每月 $5 免费额度，个人项目足够使用
- ✅ **部署简单** - 类似 Vercel，一键部署
- ✅ **支持静态网站** - 完美适配本项目

## 部署步骤

### 方法一：通过 GitHub 部署（推荐）

#### 1. 准备 GitHub 仓库

```bash
# 进入项目目录
cd "/Users/lulu/Library/Mobile Documents/com~apple~CloudDocs/Documents/Project  text/release/new-project"

# 初始化 Git（如果还没有）
git init
git add .
git commit -m "Initial commit for Zeabur deployment"

# 推送到 GitHub（创建新仓库）
# 在 GitHub 创建新仓库后执行：
git remote add origin https://github.com/YOUR_USERNAME/ai-video-generator.git
git push -u origin main
```

#### 2. 在 Zeabur 部署

1. **访问 Zeabur**: https://zeabur.com
2. **注册/登录**: 使用 GitHub 账号登录
3. **创建新项目**: 
   - 点击 "New Project"
   - 输入项目名称（如：ai-video-generator）
4. **添加服务**:
   - 点击 "New Service"
   - 选择 "Deploy from GitHub"
   - 选择你的仓库：`ai-video-generator`
5. **配置**:
   - Build Command: 留空（静态网站不需要）
   - Output Directory: `./`
6. **部署**:
   - 点击 "Deploy"
   - 等待部署完成（约 1-2 分钟）

#### 3. 获取访问地址

部署成功后，您会获得一个 Zeabur 提供的域名：
```
https://ai-video-generator-xxx.zeabur.app
```

**国内用户可以直接访问！**

### 方法二：通过 Docker 部署

如果您想部署到国内服务器，可以使用 Docker：

#### 1. 创建 Dockerfile

```dockerfile
FROM nginx:alpine

COPY . /usr/share/nginx/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
```

#### 2. 部署到国内云平台

可以选择：
- **阿里云函数计算**
- **腾讯云云开发**
- **华为云 FunctionGraph**

## 配置 OSS（重要）

无论使用哪种部署方式，都需要配置阿里云 OSS：

1. 在 Zeabur 控制台，找到 "Environment Variables"
2. 添加以下环境变量：
   ```
   OSS_ACCESS_KEY_ID=YOUR_ACCESS_KEY_ID
   OSS_ACCESS_KEY_SECRET=YOUR_ACCESS_KEY_SECRET
   OSS_BUCKET=YOUR_BUCKET_NAME
   OSS_REGION=YOUR_REGION
   OSS_ENDPOINT=YOUR_ENDPOINT
   ```

**或者**，直接修改 `flow-a.html` 文件中的 `OSS_CONFIG` 配置（适合静态部署）。

## 自定义域名（可选）

Zeabur 支持绑定自定义域名：

1. 在 Zeabur 项目设置中找到 "Domains"
2. 添加您的域名
3. 按照提示配置 DNS 记录

## 访问速度对比

| 平台 | 国内访问 | 国外访问 |
|------|---------|---------|
| Vercel | 需要翻墙 ❌ | 快速 ✅ |
| Zeabur | 快速 ✅ | 快速 ✅ |
| 阿里云 OSS | 极快 ✅ | 一般 |

## 费用说明

- **Zeabur**: 每月 $5 免费额度（个人项目足够）
- **阿里云 OSS**: 按量付费（每月约 ¥10-20）
- **Coze API**: 目前免费

## 故障排查

### 1. 部署失败

检查 `zeabur.json` 配置是否正确，确保项目根目录有 `flow-a.html` 等文件。

### 2. 图片上传失败

- 确认 OSS 配置正确
- 检查 OSS CORS 设置（参考之前的配置指南）

### 3. API 调用失败

- 确认 Coze API Token 有效
- 检查工作流是否已发布

## 技术支持

- Zeabur 文档：https://docs.zeabur.com
- Zeabur Discord: https://discord.gg/zeabur
