---
name: skill-validation
description: 校验必填文本，用于验证 PluginAndSkill 应用 Skill 的成功回包和业务失败回包
---

# skill-validation

本 Skill 提供无外部依赖的 `validateText` 方法。文本去除首尾空白后非空时返回成功，否则返回 `ERR_INVALID_PARAMS`。

## 触发场景

当需要验证应用 Skill 的必填参数校验、成功回包或业务失败回包时使用。

## 校验文本（validateText）

执行命令示例：

```
exec-cli(command: ohos-arkTSScript --skillName 'skill-validation' --scriptPath 'scripts/ValidationSkill.ets' --functionName 'validateText' --args '["PluginAndSkill"]')
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
      "const": "skill-validation"
    },
    "scriptPath": {
      "type": "string",
      "const": "scripts/ValidationSkill.ets"
    },
    "functionName": {
      "type": "string",
      "const": "validateText"
    },
    "args": {
      "type": "array",
      "items": {
        "type": "string"
      },
      "minItems": 1,
      "maxItems": 1
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
    "text": "PluginAndSkill",
    "length": 14
  }
}
```

参数错误返回值：

```
{
  "type": "result",
  "status": "failed",
  "errCode": "ERR_INVALID_PARAMS",
  "errMsg": "The required text is empty",
  "suggestion": "Provide a non-empty text argument"
}
```
