# 腾讯云云开发免费部署方案

## 费用说明
- **免费额度**：每月 10GB 存储 + 10GB 流量 + 10 万次请求
- **超出费用**：按量计费
- **总计**：个人使用 **完全免费** ✅

## 部署步骤

### 1. 注册腾讯云

访问：https://cloud.tencent.com
- 注册账号（需要实名认证）
- 开通"云开发 CloudBase"

### 2. 创建云开发环境

1. 进入云开发控制台：https://console.cloud.tencent.com/tcb
2. 点击 **创建环境**
3. 选择 **免费版**
4. 输入环境名称（如：ai-video）
5. 点击 **确定**

### 3. 部署网站

#### 方法 A：控制台上传（推荐）

1. 进入环境 → **网站托管**
2. 点击 **上传文件**
3. 上传项目文件：
   - `flow-a.html`
   - `flow-b-standalone.html`
   - `tutorial.html`
   - 其他静态文件

#### 方法 B：使用 CLI 工具

```bash
# 安装 CloudBase CLI
npm install -g @cloudbase/cli

# 登录
tcb login

# 初始化项目
cd "/Users/lulu/Library/Mobile Documents/com~apple~CloudDocs/Documents/Project  text/release/new-project"
tcb init

# 部署
tcb hosting:deploy .
```

### 4. 获取访问地址

部署成功后，您会获得免费域名：

```
https://ai-video-xxx.service.tcloudbase.com
```

**✅ 国内用户可以直接访问！**

### 5. （可选）绑定自定义域名

1. 进入 **网站托管** → **域名管理**
2. 添加域名
3. 配置 CNAME 记录
4. 上传 SSL 证书（或使用免费证书）

## 配置 OSS

与之前相同，在 `flow-a.html` 中配置阿里云 OSS：

```javascript
const OSS_CONFIG = {
    accessKeyId: 'YOUR_ACCESS_KEY_ID',
    accessKeySecret: 'YOUR_ACCESS_KEY_SECRET',
    bucket: 'YOUR_BUCKET_NAME',
    region: 'YOUR_REGION',
    endpoint: 'oss-cn-shanghai.aliyuncs.com',
    host: 'https://oss-pai-jthp4harhlmya8j0ax-cn-shanghai.oss-cn-shanghai.aliyuncs.com'
};
```

## 访问测试

- ✅ **国内访问**：直接访问，速度快
- ✅ **图片上传**：OSS 直传
- ✅ **Coze API**：浏览器端调用

## 监控用量

在云开发控制台查看：
- **监控中心** → 查看用量统计
- 设置用量告警（避免超额）

## 总结

**优点**：
- ✅ 完全免费（每月 10GB 存储 + 流量）
- ✅ 国内访问速度快
- ✅ 部署简单
- ✅ 支持 HTTPS

**缺点**：
- ⚠️ 需要实名认证
- ⚠️ 自定义域名需要备案（可选）
