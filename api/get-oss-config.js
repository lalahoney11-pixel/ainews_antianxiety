// Vercel Serverless Function - 获取 OSS 配置
// 从环境变量读取 OSS 配置并返回给前端

export default async function handler(req, res) {
  // 设置 CORS 头
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

  if (req.method === 'OPTIONS') {
    res.status(200).end();
    return;
  }

  if (req.method !== 'GET') {
    res.status(405).json({ error: 'Method not allowed' });
    return;
  }

  try {
    // 从环境变量读取 OSS 配置
    const accessKeyId = process.env.OSS_ACCESS_KEY_ID;
    const accessKeySecret = process.env.OSS_ACCESS_KEY_SECRET;
    const bucket = process.env.OSS_BUCKET || 'oss-pai-jthp4harhlmya8j0ax-cn-shanghai';
    const region = process.env.OSS_REGION || 'oss-cn-shanghai';
    const endpoint = process.env.OSS_ENDPOINT || 'oss-cn-shanghai.aliyuncs.com';

    if (!accessKeyId || !accessKeySecret) {
      res.status(500).json({ error: 'OSS configuration not found in environment variables' });
      return;
    }

    // 构建 OSS host URL
    const host = `https://${bucket}.${endpoint}`;

    // 返回配置给前端
    res.status(200).json({
      accessKeyId,
      accessKeySecret,
      bucket,
      region,
      endpoint,
      host
    });
  } catch (error) {
    console.error('Get config error:', error);
    res.status(500).json({ error: error.message });
  }
}
