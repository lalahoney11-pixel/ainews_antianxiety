# 阿里云 OSS 免费部署方案

## 费用说明
- **存储费**：约 ¥0.12/GB/月
- **流量费**：约 ¥0.50/GB（每月 10GB 以内约 ¥5）
- **请求费**：约 ¥0.01/万次
- **总计**：个人使用每月约 **¥5-10 元**

## 部署步骤

### 1. 配置 OSS 跨域（CORS）

登录阿里云 OSS 控制台：https://oss.console.aliyun.com

1. 进入您的 Bucket：`oss-pai-jthp4harhlmya8j0ax-cn-shanghai`
2. 点击 **数据安全** → **跨域设置**
3. 点击 **创建规则**：
   - **来源**：`*`
   - **允许 Methods**：POST, GET, PUT, DELETE, HEAD
   - **允许 Headers**：`*`
   - **暴露 Headers**：`ETag, x-oss-request-id, x-oss-object-type`
   - **缓存时间**：`600`
4. 点击 **确定**

### 2. 上传网站文件

#### 方法 A：使用 OSS 控制台（推荐）

1. 进入 Bucket 文件列表
2. 点击 **上传文件**
3. 上传以下文件到根目录：
   - `flow-a.html`
   - `flow-b-standalone.html`
   - `tutorial.html`
   - `config.js.example`（可选）

#### 方法 B：使用 ossutil 命令行

```bash
# 安装 ossutil
brew install ossutil  # macOS
# 或
pip install ossutil   # Python

# 配置
ossutil config -i YOUR_ACCESS_KEY_ID -k YOUR_ACCESS_KEY_SECRET -e oss-cn-shanghai.aliyuncs.com

# 上传所有文件
cd "/Users/lulu/Library/Mobile Documents/com~apple~CloudDocs/Documents/Project  text/release/new-project"
ossutil cp -r ./ oss://oss-pai-jthp4harhlmya8j0ax-cn-shanghai/ --include "*.html" --include "*.js" --include "*.json" --include "*.png" --include "*.jpg"
```

### 3. 开启静态网站托管

1. 进入 Bucket → **基础设置**
2. 找到 **静态页面** 区域
3. 点击 **设置**：
   - **默认首页**：`flow-a.html`
   - **默认 404 页**：`flow-a.html`
4. 点击 **确定**

### 4. 获取访问地址

开启静态网站托管后，您会获得访问地址：

```
http://oss-pai-jthp4harhlmya8j0ax-cn-shanghai.oss-cn-shanghai.aliyuncs.com/index.html
```

或者使用自定义域名（可选）：

```
https://your-domain.com
```

### 5. （可选）绑定自定义域名

1. 进入 Bucket → **域名管理**
2. 点击 **绑定域名**
3. 输入您的域名
4. 按照提示配置 CNAME 记录
5. 配置 SSL 证书（可选，建议使用 HTTPS）

## 访问测试

- ✅ **国内访问**：直接访问，速度极快
- ✅ **图片上传**：OSS 直传，无需代理
- ✅ **Coze API**：浏览器端调用，无限制

## 优化建议

### 1. 使用 CDN 加速（可选）

如果访问量增加，可以开启 CDN：

1. 进入 Bucket → **传输管理** → **CDN 加速**
2. 开启 CDN
3. 费用：约 ¥0.18/GB（比 OSS 流量便宜）

### 2. 压缩文件

上传前压缩 HTML/JS 文件，减少流量：

```bash
# 使用 gzip 压缩
gzip -k flow-a.html
```

### 3. 设置缓存策略

在 OSS 控制台设置文件缓存：
- HTML 文件：不缓存或短时间缓存
- 图片文件：长时间缓存（7 天）

## 监控用量

在 OSS 控制台查看：
- **监控视图** → **基础监控**
- 查看存储量、流量、请求次数

## 故障排查

### 1. 访问 403 Forbidden

- 检查文件是否为公共读权限
- 检查 CORS 配置是否正确

### 2. 图片上传失败

- 确认 OSS CORS 已配置
- 检查 AccessKey 是否正确

### 3. 页面显示不正常

- 清除浏览器缓存
- 检查 HTML 文件是否完整上传

## 总结

**优点**：
- ✅ 费用极低（每月 ¥5-10）
- ✅ 国内访问速度极快
- ✅ 稳定可靠（阿里云背书）
- ✅ 配置简单

**缺点**：
- ⚠️ 需要实名认证
- ⚠️ 自定义域名需要备案（可选）
