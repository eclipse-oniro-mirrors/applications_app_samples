---
name: skill-calculator
description: 计算两个数值的和，用于验证 PluginAndSkill 应用 Skill 的数值参数解析和计算结果
---

# skill-calculator

本 Skill 提供无外部依赖的 `addNumbers` 方法，接收两个数值字符串并返回加法结果。参数数量错误或包含非有限数值时返回参数错误。

## 触发场景

当需要验证应用 Skill 的数值参数解析、计算结果或非法数值处理时使用。

## 计算加法（addNumbers）

执行命令示例：

```
exec-cli(command: ohos-arkTSScript --skillName 'skill-calculator' --scriptPath 'scripts/CalculatorSkill.ets' --functionName 'addNumbers' --args '["12.5", "7.5"]')
```

参数约束：

```
{
  "type": "object",
  "properties": {
    "command": {
      "type": "string",
      "const": "ohos-arkTSScript"
    },
    "skillName": {
      "type": "string",
      "const": "skill-calculator"
    },
    "scriptPath": {
      "type": "string",
      "const": "scripts/CalculatorSkill.ets"
    },
    "functionName": {
      "type": "string",
      "const": "addNumbers"
    },
    "args": {
      "type": "array",
      "items": {
        "type": "string"
      },
      "minItems": 2,
      "maxItems": 2
    }
  },
  "required": ["command", "skillName", "scriptPath", "functionName", "args"]
}
```

成功返回值：

```
{
  "type": "result",
  "status": "success",
  "data": {
    "left": 12.5,
    "right": 7.5,
    "sum": 20
  }
}
```

参数错误返回值：

```
{
  "type": "result",
  "status": "failed",
  "errCode": "ERR_INVALID_PARAMS",
  "errMsg": "Both arguments must be finite numbers"
}
```
