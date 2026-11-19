# HEIF 软解码器案例测试用例

## 自动化用例

自动化用例位于 `entry/src/ohosTest/ets/test`，直接调用 `decodeheifimage` HAR 导出的
`ImageInfo`、`WaterFlowDataSource`、`getTasks`/`executeTasks` 真实实现。覆盖数据源状态机、
监听器生命周期、通知分发、splice 边界、任务列表构造与空任务执行，不依赖网络和解码结果。

| 套件 | 覆盖点 | 用例数 | 是否自动 | 测试结果 |
| --- | --- | ---: | --- | --- |
| WaterFlowDataMatrixPart1/2 | ImageInfo、push/add/clear、监听器基础协议 | 43 | 是 | pass |
| FlowOperationMatrixPart1~7 | P/A0/A1/clear 四步操作序列（4^4）的全量状态与通知断言 | 256 | 是 | pass |
| FlowSpliceMatrixPart1/2 | addData 在 0~5 长度、负索引、越界索引的 splice 顺序 | 48 | 是 | pass |
| ListenerLifecycleMatrixPart1/2 | 注册/注销 A/B 三步序列后的通知对象矩阵 | 64 | 是 | pass |
| NotifyMatrixPart1 | add/change/delete/reload/move 直接通知参数矩阵 | 34 | 是 | pass |
| ImageInfoMatrixPart1 | 尺寸边界、负数、小数、超长/多语言/换行描述 | 16 | 是 | pass |
| TaskpoolMatrixPart1 | 任务数量、对象互异、新数组、入参不变、空列表执行 | 12 | 是 | pass |
| TaskpoolExtraMatrixPart1 | 更多数量档、URL 变体、100 URL、已有数据执行空任务 | 19 | 是 | pass |
| 合计 |  | 492 |  |  |


## 手工用例

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| --- | --- | --- | --- | --- | --- |
| 正常加载所有 HEIF 图片 | 启动示例应用 | 访问示例应用首页 | 进入 HEIF 软解码器页面，正常加载所有网络图片 | 是 | Pass |
