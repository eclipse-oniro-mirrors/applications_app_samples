# \@ReusableV2装饰器测试用例归档
  	 
## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---------|---------|------|---------|:-------:|:-------:|
| ReusableV2BasicUsage | 设备正常运行 | 查看页面 | 组件正常显示 | 是 | Pass |
| ReusableV2Lifecycle | 设备正常运行 | 点击按钮 | 生命周期回调触发 | 是 | Pass |
| ReusableV2Freeze | 设备正常运行 | 点击按钮 | 组件冻结行为验证 | 是 | Pass |
| ReusableV2Reset | 设备正常运行 | 点击按钮 | 状态变量重置验证 | 是 | Pass |
| ReusableV2ResetMonitor | 设备正常运行 | 点击按钮 | @Monitor重置验证 | 是 | Pass |
| ReusableV2IfUsage | 设备正常运行 | 点击按钮 | if分支切换复用验证 | 是 | Pass |
| ReusableV2RepeatUsage | 设备正常运行 | 点击按钮 | Repeat组件复用验证 | 是 | Pass |
| ReusableV2RepeatTemplate | 设备正常运行 | 点击按钮 | Repeat template复用验证 | 是 | Pass |
| ReusableV2RepeatNoLazy | 设备正常运行 | 点击按钮 | Repeat非懒加载复用验证 | 是 | Pass |
| ReusableV2ForEachUsage | 设备正常运行 | 点击按钮 | ForEach组件复用验证 | 是 | Pass |
| ReusableV2LazyForEachUsage | 设备正常运行 | 点击按钮 | LazyForEach组件复用验证 | 是 | Pass |
