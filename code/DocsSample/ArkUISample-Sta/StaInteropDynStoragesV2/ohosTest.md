# 状态存储V2跨模式调用测试用例归档

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---------|---------|------|---------|:-------:|:-------:|
| AppStorageV2互操作示例 | 设备正常运行 | 点击按钮connect key | 连接AppStorageV2数据，UI显示当前值 | 否 | Pass |
| AppStorageV2互操作示例 | 设备正常运行 | 点击按钮remove key | 删除AppStorageV2数据，UI刷新 | 否 | Pass |
| AppStorageV2互操作示例 | 设备正常运行 | 点击ArkTS-Dyn组件按钮connect key | ArkTS-Dyn组件连接AppStorageV2数据，UI刷新 | 否 | Pass |
| PersistenceV2封装接口交互示例 | 设备正常运行 | 点击按钮connect key DynDataModel by Dyn | 连接PersistenceV2数据，UI显示当前值 | 否 | Pass |
| PersistenceV2封装接口交互示例 | 设备正常运行 | 点击按钮remove key DynDataModel by Dyn | 删除PersistenceV2数据，UI刷新 | 否 | Pass |
| PersistenceV2封装接口交互示例 | 设备正常运行 | 点击按钮save key DynDataModel by Dyn | 保存PersistenceV2数据，UI刷新 | 否 | Pass |
| PersistenceV2封装接口交互示例 | 设备正常运行 | 点击ArkTS-Dyn组件按钮refresh data | ArkTS-Dyn组件刷新数据，UI刷新 | 否 | Pass |
