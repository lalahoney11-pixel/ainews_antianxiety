# Trae 一键部署指南

## 🎯 在 Trae 中直接部署

### 方案 A：部署到阿里云 OSS（推荐）

#### 1️⃣ 在 Trae 终端执行

打开 Trae，在终端中运行：

```bash
cd "/Users/lulu/Library/Mobile Documents/com~apple~CloudDocs/Documents/Project  text/release/new-project"
./deploy-oss.sh
```

#### 2️⃣ 等待部署完成

脚本会自动：
- ✅ 检查并安装 ossutil 工具
- ✅ 配置 OSS 认证信息
- ✅ 上传所有文件到 OSS
- ✅ 显示访问地址

#### 3️⃣ 访问网站

部署成功后，访问：
```
http://oss-pai-jthp4harhlmya8j0ax-cn-shanghai.oss-cn-shanghai.aliyuncs.com/flow-a.html
```

---

### 方案 B：部署到腾讯云云开发

#### 1️⃣ 在 Trae 终端执行

```bash
cd "/Users/lulu/Library/Mobile Documents/com~apple~CloudDocs/Documents/Project  text/release/new-project"
./deploy-cloudbase.sh
```

#### 2️⃣ 登录腾讯云

根据提示完成腾讯云登录：
```bash
tcb login
```

#### 3️⃣ 部署

按照提示选择环境并部署。

---

## 📋 部署前准备

### 阿里云 OSS

1. **已有 OSS Bucket**
   - Bucket 名称：`oss-pai-jthp4harhlmya8j0ax-cn-shanghai`
   - AccessKey 已配置在脚本中

2. **配置 CORS（一次性操作）**
   
   访问 OSS 控制台：https://oss.console.aliyun.com
   - 进入您的 Bucket
   - 点击 **数据安全** → **跨域设置**
   - 创建规则：
     - 来源：`*`
     - Methods：POST, GET, PUT
     - Headers：`*`
     - 暴露 Headers：`ETag, x-oss-request-id`
     - 缓存时间：`600`

3. **开启静态网站托管**
   - 进入 Bucket → **基础设置**
   - 找到 **静态页面**
   - 设置：
     - 默认首页：`flow-a.html`
     - 默认 404 页：`flow-a.html`

### 腾讯云云开发

1. **注册腾讯云账号**
   - 访问：https://cloud.tencent.com
   - 完成实名认证

2. **开通云开发**
   - 访问：https://console.cloud.tencent.com/tcb
   - 创建免费环境

---

## 🔧 故障排查

### 问题 1：ossutil 安装失败

**解决方法**：手动安装

```bash
# macOS
brew install ossutil

# 或从官网下载
wget http://gosspublic.alicdn.com/ossutil/install.sh
chmod +x install.sh
./install.sh
```

### 问题 2：上传失败 - 权限不足

**解决方法**：检查 OSS Bucket 权限

1. 进入 OSS 控制台
2. 选择您的 Bucket
3. 点击 **权限管理**
4. 确保 ACL 为 **公共读** 或 **公共读写**

### 问题 3：访问页面显示 403

**解决方法**：

1. 检查文件是否上传成功
   ```bash
   ossutil ls oss://oss-pai-jthp4harhlmya8j0ax-cn-shanghai/
   ```

2. 检查文件权限
   ```bash
   ossutil set-acl oss://oss-pai-jthp4harhlmya8j0ax-cn-shanghai/flow-a.html public-read
   ```

### 问题 4：图片上传失败

**解决方法**：配置 OSS CORS

参考上面的 CORS 配置步骤。

---

## 📊 部署对比

| 项目 | 阿里云 OSS | 腾讯云云开发 |
|------|-----------|-------------|
| 费用 | ¥5-10/月 | 🆓 免费 |
| 速度 | ⚡⚡ 极快 | ⚡ 快 |
| 难度 | ⭐⭐ 简单 | ⭐⭐ 简单 |
| Trae 支持 | ✅ 支持 | ✅ 支持 |
| 国内访问 | ✅ 直接访问 | ✅ 直接访问 |

---

## 🎉 推荐方案

**首选：阿里云 OSS**
- 速度最快
- 费用极低
- 稳定可靠

**备选：腾讯云云开发**
- 完全免费
- 额度充足
- 部署简单

---

## 💡 快速开始

```bash
# 部署到阿里云 OSS（推荐）
cd "/Users/lulu/Library/Mobile Documents/com~apple~CloudDocs/Documents/Project  text/release/new-project"
./deploy-oss.sh

# 或部署到腾讯云云开发
# ./deploy-cloudbase.sh
```

部署成功后，国内用户可以直接访问，无需翻墙！🎉
