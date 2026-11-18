# CliInvocation测试用例归档

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 |是否自动|测试结果|
|---|---|---|---|---|---|
| 启动EntryAbility | 设备正常运行，已开启开发者模式 | 通过abilityDelegator启动com.example.clisandbox的EntryAbility | 成功启动Ability，当前顶层Ability名称为EntryAbility |是|Pass|
| 通过ohos-aa启动目标应用 | 位于应用主页面 | 点击"启动目标应用 (ohos-aa)"按钮 | 调用forkAndExecute接口通过fork+execvp执行ohos-aa start命令，返回值为0表示启动成功 |是|Pass|
