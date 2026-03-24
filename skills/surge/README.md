# surge — Structured Expert Multi-Agent System

Dynamically orchestrates a professional team via a Director Agent, autonomously approaching the optimal solution for complex problems through multi-round iterations.

## Core Concept

`surge` models the problem-solving process of complex issues as **multi-expert collaboration + gradient descent-style iterative optimization**:

- **Automatic Multi-Expert Task Allocation**: After analyzing the PRD, the Director generates domain-specialized roles (instead of generic ones) for each phase based on the problem domain, assembling a customized team of experts.
- **Complete Workflow within a Single Round**: Each iteration contains a full `analyze → research → design → implement → qa` pipeline, ensuring the output of each round is deliverable.
- **Gradient Descent-Style Iteration**: QA doesn't just judge "right or wrong," but evaluates "how good." It outputs a multi-dimensional quality vector and optimization gradients (improvement directions + expected benefits), driving the next round closer to the optimal solution.
- **Automatic Convergence Detection**: Automatically determines when to stop based on conditions like marginal benefits, plateau detection, and Pareto frontiers, avoiding meaningless iterative consumption.
- **Autonomous Evolution of Test Suites**: Acceptance criteria are not static. Edge cases discovered in the `implement` phase, vulnerabilities identified by `QA`, and regression risks exposed during rollback fixes automatically feed back into the test suite. The deeper the iteration, the more comprehensive the testing becomes.

## Design Philosophy

### Gradient Descent-Like Iterative Optimization

The iteration in traditional Agent orchestration is an "error-correction loop"—fix bugs if they exist, stop if there are none. The iteration in `surge` is an "optimization loop":

```
Round 1: PRD → Analyze → Research → Design → Implement → QA (L1 Core Standards)
         ↓ Quality Gradient: Edge case handling = Insufficient, Maintainability = Basic
Round 2: Optimization Directives Injection → Implement → QA (L1+L2 Quality Standards)
         ↓ Quality Gradient: Edge case handling = Good, Maintainability = Good
Round 3: Optimization Directives Injection → Implement → QA (L1+L2+L3 Excellence Standards)
         ↓ All dimensions ≥ Good, Converged → Enter Retro
```

- **Loss Function** = Multi-dimensional quality evaluation vector (4 levels: Insufficient / Basic / Good / Excellent)
- **Gradient** = Specific improvement suggestions for each insufficient dimension + Expected benefit (High / Medium / Low)
- **Learning Rate** = Only execute high/medium benefit improvements, ignore low benefit items.
- **Early Stopping** = All marginal benefits are low / No change for two consecutive rounds / Dimensional tradeoffs appear (Pareto frontier).

### Three-Tier Progressive Acceptance Standards

Acceptance is not a one-time setting, but raises the target level by level as iterations progress:

| Tier | Evaluation Timing | Focus |
|------|-------------------|-------|
| **L1 Core Standards** | From Round 1 | Functional correctness, basic requirements met |
| **L2 Quality Standards** | After L1 passes | Robustness, edge case handling, engineering quality |
| **L3 Excellence Standards** | After L2 passes | Maintainability, extensibility, best practices |

### Closed-Loop Evolution of Test Suites

```
Implement discovers edge cases → QA converts them into test suggestions → Director reviews and appends to acceptance criteria → Use more comprehensive criteria for acceptance in the next round
```

In the early stages, cognitive understanding is limited, and the test suite is coarse-grained. As iterations deepen, edge cases, vulnerabilities, and regression risks are continuously discovered and codified into new test entries.

## Phase Workflow

| Phase | Responsibility |
|-------|----------------|
| **analyze** | Requirements analysis, outputting structured requirements lists and risk warnings. |
| **research** | Targeted research to resolve technical risks and unknown areas. |
| **design** | Compare and evaluate 2-3 solutions, refine the selected solution, and plan parallel task packages. |
| **implement** | Implementation (supports serial/parallel), proactively marking edge cases. |
| **qa** | Three-value acceptance (Fail / Pass-Optimizable / Pass-Converged) + Quality gradients + Test suite evolution. |
| **retro** | Global retrospective, formalizing experience into Memory / RULES / Candidate SKILLs. |

## Usage

Provide the PRD and invoke the `surge` skill. You can configure the iteration limit via natural language or YAML metadata:

```yaml
surge_config:
  max_iterations: 5         # Maximum iteration rounds, default 5
  parallel_agent_limit: 10  # Maximum parallel agents, default 10
```

## Project Structure

```
surge/
├── SKILL.md          # Director Agent main flow (simplified, ~130 lines)
├── phases/           # Phase prompt templates (subagent instructions)
│   ├── analyze.md
│   ├── research.md
│   ├── design.md
│   ├── implement.md
│   ├── qa.md
│   └── retro.md
├── references/       # Progressive disclosure reference documents (read on demand by Director)
│   ├── startup.md        # Detailed startup steps, config schema
│   ├── qa-handling.md    # QA three-value logic, convergence conditions, deviation handling
│   ├── state-schema.md   # Full field definitions for state.md
│   └── output-structure.md # Directory structure, file naming rules
├── scripts/          # Helper scripts (reduces manual operations for Director)
│   ├── init.sh           # Initialize Context Package
│   ├── state.sh          # Read/update state.md fields
│   └── merge-parallel.sh # Merge parallel implement outputs
└── templates/        # Runtime templates
    └── rules.md          # Stable constraints (NEVER/ALWAYS/PREFER)
```

Runtime artifacts are stored under `{surge_root}/tasks/{task_id}/` (`{surge_root}` defaults to `.surge`, configurable at startup):

```
{surge_root}/tasks/{task_id}/
├── context.md              # PRD + Background knowledge
├── state.md                # Execution state
├── topology.md             # Topology report
├── acceptance.md           # Acceptance criteria
├── test_cases.md           # Evolving test suite
├── deliverables.md         # Deliverables definition
├── memory_draft.md         # Process experience
├── retro.md                # Retrospective report
├── iterations/             # Phase outputs for each iteration
│   ├── iter_01_analyze.md
│   ├── iter_01_research.md
│   ├── iter_01_design.md
│   ├── iter_01_implement.md
│   ├── iter_01_qa.md
│   └── ...
└── output/                 # Final deliverables (only for document/mixed types)
```

- `iterations/`: Saves the output results of each phase during each iteration.
- `output/`: Saves the final output (created only for `document` and `mixed` types; `code` types are written directly to `project_root`).
- Task data does not require additional archiving; `tasks/{task_id}/` serves as the complete history.