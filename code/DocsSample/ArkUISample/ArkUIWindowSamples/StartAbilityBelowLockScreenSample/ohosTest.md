# StartAbilityBelowLockScreenSample hap测试用例归档

## 用例表

| 测试功能     | 预置条件   | 输入                                 | 预期输出                                              | 是否自动 | 测试结果 |
|----------|--------|------------------------------------|---------------------------------------------------|------|------|
| 页面标题文本验证 | 成功拉起应用 | 通过Driver查找id为startAbilityText的组件   | 组件存在，文本内容包含"Click the button to start the target ability" | 是    | Pass |
| 按钮文本验证   | 成功拉起应用 | 通过Driver查找id为startAbilityButton的组件 | 组件存在，文本内容为"Start Ability"                         | 是    | Pass |
| 点击按钮     | 成功拉起应用 | 通过Driver点击id为startAbilityButton的按钮 | 点击成功，不抛出异常                                        | 是    | Pass |
