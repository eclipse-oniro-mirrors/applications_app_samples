# 状态管理V1V2混用测试用例归档

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---------|---------|------|---------|:-------:|:-------:|
| 普通JS Object V1->V2 | 设备正常运行 | 点击Change object in V1 | 非Observed类组件不刷新 | 是 | Pass |
| 普通JS Object V2->V1 | 设备正常运行 | 点击Change object in V2 | 非Observed类组件不刷新 | 是 | Pass |
| @Observed装饰的class V1->V2 | 设备正常运行 | 点击name | name属性追加a，V1和V2均刷新 | 是 | Pass |
| @Observed装饰的class V2->V1 | 设备正常运行 | 点击name V2 | name属性追加a，V2和V1均刷新 | 是 | Pass |
| 内置类型Array V1->V2 | 设备正常运行 | 点击Change object in V1 | 数组项递增，V1和V2均刷新 | 是 | Pass |
| 内置类型Array V2->V1 | 设备正常运行 | 点击Change object in V2 | 数组项递增，V2和V1均刷新 | 是 | Pass |
| 二维数组 V1->V2 | 设备正常运行 | 点击push two-dimensional array item | 二维数组项追加，V1和V2均刷新 | 是 | Pass |
| 二维数组 V2->V1 | 设备正常运行 | 点击push two-dimensional array item | 二维数组项追加，V2和V1均刷新 | 是 | Pass |
| 嵌套类型 V1->V2 | 设备正常运行 | 点击outer.outerValue | outerValue追加!，多层组件刷新 | 是 | Pass |
| 嵌套类型 V2->V1 | 设备正常运行 | 点击outer.outerValue | outerValue追加!，多层组件刷新 | 是 | Pass |
