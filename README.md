# AnKaClaw

基于 [Karpathy 的 LLM Wiki 思想](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f)构建的个人知识管理 Agent，运行在 [OpenClaw](https://github.com/openclaw/openclaw) 平台上。

## Status: **v1.0 MVP Complete** ✅

## 核心理念

将 LLM 作为"个人 Wiki 的读写者"——通过 Ingest（录入）、Query（查询）、Lint（维护）三步循环，构建和管理个人知识库。

## 架构

```
ankawiki/
├── raw/              # 原始来源（不可变）
│   └── assets/       # 图片和附件
├── wiki/
│   ├── entities/     # 人物、组织、产品、项目
│   ├── concepts/     # 技术、理论、方法、框架
│   ├── sources/      # 来源摘要
│   ├── comparisons/  # 对比分析
│   └── synthesis/    # 综合分析
├── index.md          # 内容目录
└── log.md            # 操作时间线
```

## Skills

| Skill | 功能 |
|-------|------|
| `ingest` | 从 URL、飞书文档、文件、图片中提取知识并写入 Wiki（支持交互式讨论） |
| `query` | 基于 Wiki 内容回答问题，附带引用，支持答案归档 |
| `lint`   | 检查 Wiki 一致性、完整性、知识缺口，自动修复问题 |

## 支持的来源类型

- URL（网页文章、GitHub Gist）
- 飞书云文档（知识库 Wiki、独立文档）
- 本地文件（PDF、文本等）
- 图片（OCR 提取）
- 纯文本（直接输入）

## 工具

| 工具 | 功能 |
|------|------|
| `tools/search.sh` | 关键词搜索 Wiki 内容 |
| `tools/stats.sh` | Wiki 统计（页面数、分类分布、最近活动） |
| `tools/check-links.sh` | 检查 [[]] 引用是否指向存在的页面 |

## 配置要求

- OpenClaw >= 2026.4
- 飞书应用（可选，用于文档摄取和交互）
- 模型：`zai/glm-5.1`（默认）

## License

MIT
