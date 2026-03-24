#!/usr/bin/env bash
# merge-parallel.sh - Merge parallel implement outputs into a single file.
# Combines iter_{NN}_implement_*.md files into iter_{NN}_implement.md.

set -euo pipefail

# --- Usage ---
usage() {
    echo "用法: bash scripts/merge-parallel.sh <task_dir> <iteration>"
    echo ""
    echo "参数:"
    echo "  task_dir    任务目录路径 (例: .surge/tasks/20260319-abc1)"
    echo "  iteration   迭代编号 (例: 1)"
    echo ""
    echo "示例: bash scripts/merge-parallel.sh .surge/tasks/20260319-abc1 1"
    exit 1
}

if [[ $# -ne 2 ]]; then
    usage
fi

TASK_DIR="$1"
ITERATION="$2"
ITER_DIR="${TASK_DIR}/iterations"

# Validate task directory
if [[ ! -d "$ITER_DIR" ]]; then
    echo "错误: iterations 目录不存在: ${ITER_DIR}" >&2
    exit 1
fi

# Validate iteration is a number
if ! [[ "$ITERATION" =~ ^[0-9]+$ ]]; then
    echo "错误: 迭代编号必须是数字: ${ITERATION}" >&2
    exit 1
fi

# Zero-pad iteration number to 2 digits
NN=$(printf "%02d" "$ITERATION")
PATTERN="iter_${NN}_implement_"
OUTPUT_FILE="${ITER_DIR}/iter_${NN}_implement.md"

# Find all matching partial implement files, sorted by name
PART_FILES=()
while IFS= read -r -d '' f; do
    PART_FILES+=("$f")
done < <(find "$ITER_DIR" -maxdepth 1 -name "${PATTERN}*.md" -print0 | sort -z)

if [[ ${#PART_FILES[@]} -eq 0 ]]; then
    echo "错误: 未找到匹配文件: ${ITER_DIR}/${PATTERN}*.md" >&2
    exit 1
fi

echo "正在合并第 ${ITERATION} 轮并行实现产出..."
echo "  找到 ${#PART_FILES[@]} 个模块文件:"

# Build merged file
{
    echo "# Iteration ${NN} - Implement (Merged)"
    echo ""
    echo "> 由 merge-parallel.sh 自动合并，共 ${#PART_FILES[@]} 个模块。"
    echo ""

    FIRST=true
    for f in "${PART_FILES[@]}"; do
        BASENAME=$(basename "$f")
        # Extract module name: iter_NN_implement_<module>.md -> <module>
        MODULE_NAME="${BASENAME#${PATTERN}}"
        MODULE_NAME="${MODULE_NAME%.md}"

        if [[ "$FIRST" == true ]]; then
            FIRST=false
        else
            # Horizontal rule separator between modules
            echo ""
            echo "---"
            echo ""
        fi

        echo "## Module: ${MODULE_NAME}"
        echo ""
        cat "$f"
        echo ""
    done
} > "$OUTPUT_FILE"

# Print progress to stdout (outside the redirect block)
for f in "${PART_FILES[@]}"; do
    BASENAME=$(basename "$f")
    MODULE_NAME="${BASENAME#${PATTERN}}"
    MODULE_NAME="${MODULE_NAME%.md}"
    echo "  - ${BASENAME} (${MODULE_NAME})"
done

echo ""
echo "合并完成 ✓"
echo "  输出文件: ${OUTPUT_FILE}"
echo "  模块数量: ${#PART_FILES[@]}"
