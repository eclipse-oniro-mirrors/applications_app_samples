---
name: skill-echo
description: 回显输入参数，用于验证 PluginAndSkill 应用 Skill 的字符串参数传递和结果返回
---

# skill-echo

本 Skill 提供无外部依赖的 `echoArguments` 方法，返回全部输入参数和参数数量。

## 触发场景

当需要验证应用 Skill 的字符串参数传递、空参数调用或多参数调用时使用。

## 回显参数（echoArguments）

执行命令示例：

```
exec-cli(command: ohos-arkTSScript --skillName 'skill-echo' --scriptPath 'scripts/EchoSkill.ets' --functionName 'echoArguments' --args '["hello", "OpenHarmony"]')
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
      "const": "skill-echo"
    },
    "scriptPath": {
      "type": "string",
      "const": "scripts/EchoSkill.ets"
    },
    "functionName": {
      "type": "string",
      "const": "echoArguments"
    },
    "args": {
      "type": "array",
      "items": {
        "type": "string"
      }
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
    "arguments": ["hello", "OpenHarmony"],
    "argumentCount": 2
  }
}
```
