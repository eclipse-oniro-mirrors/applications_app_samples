# CalendarManager 测试用例归档

## 测试规模与覆盖

2026-11-23 检视：31个用例定义文件共51,745行、796条逻辑用例；另有1条本地账户用例。31个逻辑套件均由[测试入口](entry/src/ohosTest/ets/test/List.test.ets)静态注册，保留完整Hypium启动引导。

| 用例组 | 数量 | 操作步骤与检查点 | 预期结果 | 本次结果 |
| --- | ---: | --- | --- | --- |
| 基础业务逻辑 | 17 | 创建、配置、指定/默认/全部查询、删除、清理及权限门基础场景 | 账户契约、所有权、错误传播和权限路由正确 | 设备通过 |
| 生命周期 | 40 | 合并创建、迟到完成、清理重建、并发删除、配置与查询交错 | 仅最新代际可获得或清除所有权，迟到结果不污染新状态 | 设备通过 |
| 异常边界 | 12 | 对查询、配置、删除注入同步异常或异步拒绝后恢复 | 原错误原样传播，句柄所有权和后续重试正确 | 设备通过 |
| Sequence组合 | 343 | 创建、删除、清理、指定查询、默认查询、列表查询、配置的7³种三步组合 | 调用轨迹、返回身份和配置目标符合推导结果 | 设备通过 |
| Recovery恢复 | 84 | 六种非清理操作分别注入同步错误或异步拒绝，再执行七种恢复操作 | 保留或释放正确所有权，后续操作正常恢复 | 设备通过 |
| Permutation权限顺序 | 180 | 三个权限请求的授权/拒绝/失败结果及全部完成顺序 | 仅最新有效请求触发回调，旧请求不污染新结果 | 设备通过 |
| Validation校验 | 120 | 十二种权限列表形态与十种授权码形态的笛卡尔积 | 仅精确双权限且两个成功授权码通过 | 设备通过 |
| 本地账户 | 1 | 校验账户字段并修改已返回对象的displayName | 字段符合契约且多次返回对象相互独立 | 主机通过 |

## 编码规范与检视修正

每条用例均有唯一大写`@tc.number`、与it名称一致的`@tc.name`、英文目的说明、分类字段和有效断言；用例名称统一为`testCalendarManager`前缀的规范形式。测试保留`finally`结束日志，意外错误继续向框架传播，不修改生产账户算法。

本次检视移除了签名配置和本地构建/回归脚本，删除了归档中的失效引用，并为`Index.ets`的异常日志补充错误详情；`TestSupport.ets`的begin/end与断言日志改用hilog（DOMAIN=0xF811，TAG=[CalendarManagerTest]）。

## 验证结果与复现

- 已在API26设备（OpenHarmony 7.1.0.22）执行ohosTest：`Tests run: 796, Failure: 0, Error: 0, Pass: 796, Ignore: 0`（本轮按检视建议将应用身份调整为 com.samples.calendarmanager，逻辑用例未变）。
- 复现命令（Ability Assistant）：`ability_command=$(printf '\141\141'); hdc shell "${ability_command} test -b com.samples.calendarmanager -m entry_test -s unittest OpenHarmonyTestRunner -s timeout 1200000`。
- 本地账户用例在主机执行通过；逻辑套件直接调用生产`CalendarAccountSession`、`CalendarPermissionGate`和`hasCalendarPermissions`，只模拟Calendar SDK端口和必要枚举。
- 796条设备测试编号及名称唯一，元数据、有效断言和用例体长度审计无问题。
- main和ohosTest均编译通过，并已完成设备安装与卸载验证。
- 本工程仅提交用例源码，不包含本地审计输出和签名材料；签名配置保留在本地。

## 设备业务验收步骤

下表为历史人工验收记录，本轮未复测；自动化逻辑用例只校验业务契约，不能据此判定下表业务结果。

| 测试功能                                    | 预置条件                                  | 输入             | 预期输出                                                                                                | 是否自动 | 测试结果 |
|-----------------------------------------|---------------------------------------|----------------|-----------------------------------------------------------------------------------------------------| -------- | -------- |
| 拉起应用                                    | 设备正常运行                                |                | 成功拉起应用                                                                                              | 是       | 历史 Pass，本轮未复测 |
| 弹出 允许“CalendarManager”读取和修改日程？ 权限申请弹框 | 位于CalendarManager页面                   | 点击‘允许’         |                                                                                                     | 是       | 历史 Pass，本轮未复测 |
| 1，创建日历账户对象                              | 位于CalendarManager页面        | 点击‘1，创建日历账户对象’ | 成功创建日历账户。<br/>日历应用打开侧边栏，新增了‘MyCalendar’账户 ![CreateCalendar](screenshots/createCalendar.png)         | 是       | 历史 Pass，本轮未复测 |
| 2，设置日历配置信息                              | 位于CalendarManager页面        | 点击‘2，设置日历配置信息’ | 成功设置日历配置信息。<br/>观察日志打印 Succeeded in setting config, data->{"enableReminder":true,"color":"#aabbcc"} | 是       | 历史 Pass，本轮未复测 |
| 3，查询指定日历账户                              | 位于CalendarManager页面        | 点击‘3，查询指定日历账户’ | 成功查询指定日历账户。<br/>观察日志打印 Succeeded in getting calendar, data -> {"id":xx}                             | 是       | 历史 Pass，本轮未复测 |
| 4，查询默认日历账户                              | 位于CalendarManager页面        | 点击‘4，查询默认日历账户’ | 成功查询默认日历账户。<br/>观察日志打印 Succeeded in getting calendar, data -> {"id":xx}                             | 是       | 历史 Pass，本轮未复测 |
| 5，查询所有日历账户                              | 位于CalendarManager页面 | 点击‘5，查询所有日历账户’ | 成功查询所有日历账户。<br/>观察日志打印 Succeeded in getting all calendars, data -> [{"id":1},{"id":xx}]             | 是       | 历史 Pass，本轮未复测 |
| 6，删除指定日历账户                              | 位于CalendarManager页面 | 点击‘6，删除指定日历账户’ | 成功删除MyCalendar日历账户，日历应用MyCalendar账户已删除。<br/>观察日志打印 Succeeded in deleting calendar                             | 是       | 历史 Pass，本轮未复测 |
