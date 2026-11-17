# windowDensitySample hap测试用例归档

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|-----------|--------|--------------------------------|------------------------------|------|------|
| 页面信息文本验证 | 成功拉起应用 | 通过Driver查找文本"窗口所在屏幕ID"的组件 | 组件存在，文本内容以"窗口所在屏幕ID："开头 | 是 | Pass |
| 当前策略文本验证 | 成功拉起应用 | 通过Driver查找id为strategyText的组件 | 组件存在，文本内容为"当前density跟随策略：系统density策略" | 是 | Pass |
| 点击默认density策略开关 | 成功拉起应用 | 通过Driver点击id为defaultDensitySwitch的开关 | 点击成功，不抛出异常，策略文本更新为"当前density跟随策略：默认density策略" | 是 | Pass |
| 关闭默认density策略开关 | 成功拉起应用且开关已开启 | 通过Driver点击id为defaultDensitySwitch的开关 | 点击成功，不抛出异常，策略文本更新为"当前density跟随策略：系统density策略" | 是 | Pass |
| 点击自定义density策略按钮 | 成功拉起应用 | 通过Driver点击id为customDensityButton的按钮 | 点击成功，不抛出异常，策略文本更新为"当前density跟随策略：自定义density策略（2.0）" | 是 | Pass |
