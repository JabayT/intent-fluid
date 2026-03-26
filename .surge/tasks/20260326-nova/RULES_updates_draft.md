# RULES 更新建议草案

> **来源**: Task 20260326-nova Retro
> **日期**: 2026-03-26
> **状态**: Draft — 待 Director 审批

---

## 建议 1: 子代理输出量预拆分规则

**建议新增规则**:

```
[RULE] sub-agent-output-limit
对于 document 类型交付物，Design/Implement 阶段的单次子代理调用输出目标不超过 300 行。
超过预估时，必须在 dispatch 前按模块/章节预拆分，而非等超时后被动拆分。

预估经验值：
- 世界观/概念文档: 200-400 行
- 章节大纲: 50-80 行/章
- 角色档案: 80-120 行/角色
```

**理由**: 20260326-nova Design 阶段因未预拆分导致2次超时重试，增加约30%阶段耗时。

---

## 建议 2: 并行 Implement 术语同步步骤

**建议新增规则**:

```
[RULE] parallel-implement-terminology-sync
当 Implement 阶段包含 ≥2 个并行模块时，全部模块完成后、提交 QA 前，
必须执行术语对账步骤：
1. 从权威文档提取术语表
2. 扫描其他文档中的新增术语
3. 回填至权威术语表或替换为已有术语
```

**理由**: 20260326-nova 的3个并行 Implement 模块产生了4处术语不一致（Minor偏差），QA 阶段才发现。

---

## 建议 3: 创意任务读者画像映射检查

**建议新增规则**:

```
[RULE] audience-persona-mapping-check
当 context.md 定义了目标受众画像时，Design 阶段的角色设计必须包含
「读者代入感检查」：
- 至少 1 名核心或重要配角的年龄落在目标读者年龄区间内
- 角色背景/经历中包含目标读者可共情的元素
此检查结果记录在 Design 输出中，失败时标记为 design-level warning。
```

**理由**: 20260326-nova 的4名核心角色年龄均>30岁，与18-35岁目标读者存在代入感差距，直到 QA 阶段才被识别。

---

## 建议 4: 专家评审增加商业视角

**建议修改规则**:

```
[RULE] expert-review-commercial-dimension
对于面向市场的创意类任务（context.md 中包含目标读者/市场定位描述），
expert_roles 中必须包含至少一个覆盖「商业可行性」的角色，
或在所有专家评审模板中增加强制的商业适配检查项：
- 目标读者代入感
- 商业吸引力元素覆盖度（≥3种）
- 平台/形态适配度
```

**理由**: 20260326-nova 的4位专家均聚焦叙事/科学/美学/逻辑，商业风险（角色年龄、缺浪漫线、术语门槛高）在 QA 才被系统性识别，优化成本偏高。

---

## 建议 5: 拓扑预估反馈校准

**建议新增规则**:

```
[RULE] topology-estimation-feedback
Retro 阶段必须记录「预估迭代轮数 vs 实际迭代轮数」。
当累积 ≥10 个同类型任务的数据后，用于校准 topology 阶段的迭代预估模型。
数据字段：
- task_id
- deliverable_type
- estimated_iterations
- actual_iterations
- convergence_factors (列表: 哪些因素加速/延缓了收敛)
```

**理由**: 20260326-nova 预估2-3轮、实际1轮收敛。虽然超预期是正面的，但持续的预估偏差说明拓扑模型缺乏历史数据校准。

---

*Draft generated from 20260326-nova retro | Pending Director approval*
