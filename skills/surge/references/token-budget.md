# Token Budget Guidelines

Long-running tasks (5+ iterations, parallel subagents) can exhaust context windows. Apply these rules to keep subagent prompts lean.

---

## Rules

| Rule | When | Action |
|------|------|--------|
| **Summary over history** | Always | Pass summaries of upstream outputs to subagents, not full documents. Full files stay on disk for Read access. |
| **Rolling context window** | Iteration ≥ 3 | Analyze subagent receives only the latest QA report (`iter_{N-1}_qa.md`) and the original `context.md`, not all prior analyze/research outputs. |
| **Quality history trim** | Iteration ≥ 4 | When injecting `quality_history` into QA subagent prompts, include only the most recent 3 rounds (sufficient for oscillation detection and trend analysis). Full history remains in `state.md`. |
| **Expert review slim input** | Always | Expert subagents receive candidate **summaries** (not full detailed designs). See `references/expert-review.md` §Constraints. |
| **Research raw materials by reference** | Always | The research summary document references raw material files by path — never inline full web content into downstream prompts. |
| **Optimization directives only** | Iteration ≥ 2 | When injecting optimization context into implement/design subagents, pass only the filtered directive list from `state.md`, not the full previous QA report. |

---

## Director Self-Monitoring

If a subagent prompt exceeds ~40% of the estimated context window, the Director should apply scope reduction (summarize further, split into sub-tasks) before dispatching.

**Estimation heuristic**: Approximate 1 token ≈ 4 characters. If the concatenated prompt exceeds ~80K characters, apply scope reduction.
