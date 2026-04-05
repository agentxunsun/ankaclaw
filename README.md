# AnKaClaw

基于 [Karpathy 的 LLM Wiki 思想](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f)构建的个人知识管理 Agent，运行在 [OpenClaw](https://github.com/openclaw/openclaw) 平台上。

## 核心理念

将 LLM 作为"个人 Wiki 的读写者"——通过 Ingest（录入）、Query（查询）、Lint（维护）三步循环，构建和管理个人知识库。

## 架构

```
ankawiki/
├── raw/           # 原始来源（不可变）
├── wiki/          # 结构化 Wiki 页面
│   ├── entities/  # 人物、组织、工具
│   ├── concepts/  # 概念、方法、框架
│   ├── sources/   # 来源记录
│   └── synthesis/ # 综合分析
└── schema/        # 索引与元数据
```

## Skills

| Skill | 功能 |
|-------|------|
| `ingest` | 从 URL、飞书文档、文件、图片中提取知识并写入 Wiki |
| `query` | 基于 Wiki 内容回答问题，附带引用 |
| `lint`   | 检查 Wiki 一致性、完整性，自动修复问题 |

## 支持的来源类型

- URL（网页文章、GitHub Gist）
- 飞书云文档
- 本地文件（PDF、文本等）
- 图片（OCR 提取）

## 配置要求

- OpenClaw >= 2026.4
- 飞书应用（可选，用于文档摄取和交互）
- 模型：`zai/glm-5.1`（默认）

## 文件说明

| 文件 | 用途 |
|------|------|
| `SOUL.md` | Agent 人格与行为准则 |
| `AGENTS.md` | 工作流程与约定 |
| `IDENTITY.md` | Agent 身份信息 |
| `USER.md` | 用户偏好 |
| `TOOLS.md` | 工具配置笔记 |
| `BOOTSTRAP.md` | 首次启动引导（执行后删除） |

## License

MIT
