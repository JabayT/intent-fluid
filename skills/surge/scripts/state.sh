#!/usr/bin/env bash
# state.sh - Read/update YAML fields in state.md safely.
# Supports multi-line blocks (arrays/objects) using Node.js.

set -euo pipefail

# --- Usage ---
usage() {
    echo "用法: bash scripts/state.sh <subcommand> <state_file> [field] [value]"
    echo ""
    echo "子命令:"
    echo "  get <state_file> <field>          读取字段值"
    echo "  set <state_file> <field> <value>  设置字段值"
    echo "  increment <state_file> <field>    数值字段 +1"
    echo "  show <state_file>                 显示所有字段"
    echo ""
    echo "示例:"
    echo "  bash scripts/state.sh get ./state.md current_phase"
    echo "  bash scripts/state.sh set ./state.md current_phase design"
    echo "  bash scripts/state.sh increment ./state.md iteration"
    echo "  bash scripts/state.sh show ./state.md"
    exit 1
}

if [[ $# -lt 2 ]]; then
    usage
fi

SUBCMD="$1"
STATE_FILE="$2"

# Validate state file exists
if [[ ! -f "$STATE_FILE" ]]; then
    echo "错误: state 文件不存在: ${STATE_FILE}" >&2
    exit 1
fi

if [[ "$SUBCMD" == "show" ]]; then
    echo "--- ${STATE_FILE} ---"
    cat "$STATE_FILE"
    exit 0
fi

# Use Node.js for robust regex-based multi-line parsing
# This replaces the brittle sed-based logic which corrupted arrays/objects
node -e '
const fs = require("fs");
const subcmd = process.argv[1];
const file = process.argv[2];
const field = process.argv[3];
let newValue = process.argv[4];

if (!field) {
    console.error("用法错误: 缺少 field 参数");
    process.exit(1);
}

let text = fs.readFileSync(file, "utf8");
// Regex to match a key at root level, and all subsequent lines that are indented
const regex = new RegExp(`^(${field}):([ \\t]*.*(?:\\n[ \\t]+.*)*)`, "m");

const match = text.match(regex);
if (!match) {
    console.error(`错误: 字段不存在: ${field}`);
    process.exit(1);
}

let val = match[2];
let isQuoted = false;
let trimmedVal = val.trim();
if (trimmedVal.startsWith("\"") && trimmedVal.endsWith("\"") && !trimmedVal.includes("\n")) {
    isQuoted = true;
    trimmedVal = trimmedVal.slice(1, -1);
}

if (subcmd === "get") {
    console.log(trimmedVal);
} else if (subcmd === "set" || subcmd === "increment") {
    if (subcmd === "increment") {
        const num = parseInt(trimmedVal, 10);
        if (isNaN(num)) {
            console.error(`错误: 字段值不是数字: ${field} = ${trimmedVal}`);
            process.exit(1);
        }
        newValue = (num + 1).toString();
    } else {
        if (newValue === undefined) {
             console.error("用法错误: 缺少 value 参数");
             process.exit(1);
        }
    }
    
    let replacement = `${field}:`;
    if (newValue.includes("\n") || newValue.trim().startsWith("-") || newValue.trim().startsWith("{") || newValue.trim().startsWith("[")) {
        // Multi-line or array/object
        replacement += (newValue.startsWith("\n") ? "" : "\n") + newValue;
    } else {
        // Single line
        if (isQuoted && !newValue.startsWith("\"")) {
            replacement += ` "${newValue}"`;
        } else {
            replacement += ` ${newValue}`;
        }
    }
    
    text = text.replace(regex, replacement);
    fs.writeFileSync(file, text);
    
    if (subcmd === "increment") {
        console.log(`${field}: ${trimmedVal} → ${newValue}`);
    } else {
        console.log(`${field}: ${newValue}`);
    }
} else {
    console.error(`错误: 未知子命令: ${subcmd}`);
    process.exit(1);
}
' "$SUBCMD" "$STATE_FILE" "${3:-}" "${4:-}"