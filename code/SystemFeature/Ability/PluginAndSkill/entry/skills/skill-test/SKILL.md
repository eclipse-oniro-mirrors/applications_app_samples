---
name: skill-test
description: 返回固定测试消息，用于验证 PluginAndSkill 应用 Skill 的注册、查询和 ArkTS 脚本执行链路
---

# skill-test

本 Skill 提供一个无外部依赖的测试方法 `getTestMessage`。调用后通过 `scriptManager.completeArkTSScriptInApp` 返回成功状态和固定测试消息。

## 触发场景

当用户明确要求测试 PluginAndSkill 的应用 Skill，或验证 Skill 脚本执行链路时调用。

## 获取测试消息（getTestMessage）

执行命令示例：

```
exec-cli(command: ohos-arkTSScript --skillName 'skill-test' --scriptPath 'scripts/TestSkill.ets' --functionName 'getTestMessage' --args '{}')
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
      "const": "skill-test"
    },
    "scriptPath": {
      "type": "string",
      "const": "scripts/TestSkill.ets"
    },
    "functionName": {
      "type": "string",
      "const": "getTestMessage"
    },
    "args": {
      "type": "object",
      "properties": {}
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
    "message": "PluginAndSkill test skill is ready",
    "argumentCount": 0
  }
}
```
