# DeviceStatusSta 服务测试用例

## 用例表

以下 3 条 UI 自动化用例位于 `entry/src/ohosTest/ets/test/Ability.test.ets`，分别为
`DeviceStatus_SubscribeDrop_001`、`DeviceStatus_UnsubscribeAllDrop_002`
和 `DeviceStatus_UnsubscribeDrop_003`。
用例验证按钮交互、同步接口调用后的成功提示和重复取消时的失败提示，不验证实际跌落事件上报。
同步接口抛出异常时，页面显示不同的失败文字，用例不能再通过成功提示的断言。
启动辅助函数仅负责启动应用，清理逻辑放在独立函数中。每条用例在主体内显式检查启动结果及前置清理结果，结束时复用同一 Driver 清理订阅。
所有断言都位于用例主体内，断言前记录实际值与预期值；接口异常提示包含 `code` 和 `message`。
运行环境必须支持手机跌落检测能力；不支持时按失败提示记录，不视为功能通过。

| 测试功能            | 预置条件      | 输入                              | 预期输出             | 是否自动 | 测试结果 |
| --------------- | --------- | ------------------------------- | ---------------- | ---- | ---- |
| 订阅跌落 | 进入主界面并清理订阅 | 点击订阅跌落按钮 | 页面text显示dropDetect subscribe | 是 | 待执行 |
| 取消全部跌落 | 进入主界面并清理订阅 | 先点击订阅跌落按钮并检查成功提示，再点击取消全部跌落按钮 | 页面text显示dropDetect unsubscribeAll | 是 | 待执行 |
| 取消单个跌落 | 进入主界面并清理订阅 | 先订阅并检查成功提示，再取消单个订阅并检查成功提示，最后再次取消 | 首次显示dropDetect unsubscribe；再次显示dropDetect unsubscribe failed: no active subscription | 是 | 待执行 |
