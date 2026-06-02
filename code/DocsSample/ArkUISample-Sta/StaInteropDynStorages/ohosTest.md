# 状态存储跨模式调用测试用例归档

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---------|---------|------|---------|:-------:|:-------:|
| @StorageLink交互示例 | 设备正常运行 | 点击按钮update value | 数值加1，父子组件UI均刷新 | 否 | Pass |
| @StorageLink交互示例 | 设备正常运行 | 点击ArkTS-Dyn组件按钮click times | 数值加1，父子组件UI均刷新 | 否 | Pass |
| @LocalStorageLink交互示例 | 设备正常运行 | 点击按钮update value | 数值加1，父子组件UI均刷新 | 否 | Pass |
| @LocalStorageLink交互示例 | 设备正常运行 | 点击ArkTS-Dyn组件按钮click times | 数值加1，父子组件UI均刷新 | 否 | Pass |
| @StorageProp交互示例 | 设备正常运行 | 点击按钮update value | 数值加1，仅当前组件UI刷新 | 否 | Pass |
| @StorageProp交互示例 | 设备正常运行 | 点击ArkTS-Dyn组件按钮click times | 数值加1，仅ArkTS-Dyn组件UI刷新 | 否 | Pass |
| @LocalStorageProp交互示例 | 设备正常运行 | 点击按钮update value | 数值加1，仅当前组件UI刷新 | 否 | Pass |
| @LocalStorageProp交互示例 | 设备正常运行 | 点击ArkTS-Dyn组件按钮click times | 数值加1，仅ArkTS-Dyn组件UI刷新 | 否 | Pass |
| AppStorage接口交互示例 | 设备正常运行 | 点击ArkTS-Dyn组件按钮change AppStorage | AppStorage值更新，UI刷新 | 否 | Pass |
| PersistentStorage交互示例 | 设备正常运行 | 点击按钮change LinkA | LinkA末尾追加字符，ArkTS-Dyn组件UI同步刷新 | 否 | Pass |
| PersistentStorage交互示例 | 设备正常运行 | 点击按钮change PropB | PropB末尾追加字符，仅当前组件UI刷新 | 否 | Pass |
| Environment交互示例 | 设备正常运行 | 点击按钮change fontScale link | fontScaleLink增加1.0，ArkTS-Dyn组件UI同步刷新 | 否 | Pass |
| Environment交互示例 | 设备正常运行 | 点击按钮change fontScale prop | fontScaleProp增加1.0，仅当前组件UI刷新 | 否 | Pass |
