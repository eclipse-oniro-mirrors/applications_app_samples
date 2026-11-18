# HiCollie测试用例归档

## 用例表

| 测试功能                   | 预置条件     | 输入                                          | 预期输出                                     | 是否自动 | 测试结果 |
| -------------------------- | ------------ | --------------------------------------------- | -------------------------------------------- | -------- | -------- |
| 拉起应用                   | 设备正常运行 | 点击应用图标                                  | 成功拉起应用                                 | 否       | Pass     |
| 应用线程卡顿检测           | 位于主页     | 点击“testHiCollieJankNdk”按钮                 | 输出卡顿检测初始化日志                       | 否       | Pass     |
| 应用线程卡死检测           | 位于主页     | 点击“testHiCollieStuckNdk”按钮                | 输出卡死检测初始化日志                       | 否       | Pass     |
| 自定义检测时间的卡死检测   | 位于主页     | 点击“testHiCollieStuckWithTimeoutNdk”按钮     | 输出卡死检测初始化日志                       | 否       | Pass     |
| 应用输入无响应上报         | 位于主页     | 点击“testHiCollieInputBlock”按钮              | 业务线程卡死时输出输入无响应上报日志         | 否       | Pass     |
| 冻屏回调设置               | 位于主页     | 点击“testHiCollieSetFreezeCallback”按钮       | 冻屏回调设置成功                             | 否       | Pass     |
| 进程冻屏事件上报           | 位于主页     | 点击“testHiCollieAssociateProcessReport”按钮  | 输出进程执行超时事件上报日志                 | 否       | Pass     |
| 接口导出完整性             | 位于主页     | 运行ohosTest用例                              | 6个HiCollie接口均可正常调用                  | 是       | Pass     |
