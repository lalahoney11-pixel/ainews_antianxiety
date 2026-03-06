# AI 资讯短视频生成器

## 📁 文件说明

- `flow-a.html` - 主页面（流程 A + 流程 B 整合）
- `flow-b-standalone.html` - 独立流程 B 页面（手动输入参数）
- `tutorial.html` - 使用教程页面

## 🚀 使用方法

### 方式 1：本地服务器（推荐）

1. 打开终端，进入当前文件夹
2. 运行：`python3 -m http.server 8080`
3. 打开浏览器访问：`http://localhost:8080/flow-a.html`

### 方式 2：直接打开

直接双击 `flow-a.html` 文件（但部分功能可能受限于浏览器安全策略）

### 方式 3：Vercel 部署

1. Fork 本仓库到您的 GitHub 账号
2. 登录 [Vercel](https://vercel.com)
3. 导入 GitHub 仓库并部署
4. 获得在线访问地址

## ⚙️ 配置说明

### 阿里云 OSS 配置（图片上传）

**重要**：OSS AccessKey 等敏感信息不要直接提交到代码仓库！

在 `flow-a.html` 同级目录创建 `config.js` 文件：

```javascript
// config.js
window.OSS_ACCESS_KEY_ID = '您的阿里云AccessKey ID';
window.OSS_ACCESS_KEY_SECRET = '您的阿里云AccessKey Secret';
```

然后在 `flow-a.html` 的 `<head>` 中引入：
```html
<script src="config.js"></script>
```

### Coze API 配置

```javascript
// 流程 A - 生成标题和文案
const API_CONFIG = {
    token: 'YOUR_COZE_TOKEN',
    workflow_id: '7612164466931253298'
};

// 流程 B - 生成视频
const FLOW_B_CONFIG = {
    token: 'YOUR_COZE_TOKEN',
    workflow_id: '7612552233687613480',
    app_id: '7611848851917996051'
};
```

## 📝 使用流程

1. 打开 `http://localhost:8080/flow-a.html`
2. 输入 AI 新闻主题
3. 点击"生成内容"（流程 A）
4. 选择标题、编辑文案
5. 选择图片（可以使用 API 返回的，也可以上传本地图片到阿里云 OSS）
6. 点击"生成视频"（流程 B）
7. 等待 3-5 分钟，视频生成完成后可以预览和下载

## ⚠️ 注意事项

1. **OSS 跨域设置**：确保阿里云 OSS Bucket 已配置 CORS 跨域规则
   - 来源：`*` 或您的域名
   - 允许的方法：GET, POST, PUT
   - 允许 Header：`*`
   - 暴露 Header：`ETag, x-oss-request-id`

2. **OSS 权限**：确保 Bucket 是"公共读"权限

3. **Token 有效期**：如果 API 返回 401 错误，说明 Token 已过期，需要更新

4. **视频生成超时**：流程 B 可能需要 3-5 分钟，请耐心等待

5. **安全提醒**：不要将包含敏感信息的 `config.js` 提交到 GitHub

## 📅 打包时间

2026-03-04
