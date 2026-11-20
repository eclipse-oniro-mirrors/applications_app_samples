# CalendarEvent 测试用例归档

## 测试规模与覆盖

2026-11-20 扩充并检视：37个用例定义文件共56,064行、1092条用例，其中1085条逻辑用例、保留6条UI用例和1条真实SDK用例；另有1条本地权限用例。行数只统计用例定义文件，不包含生成脚本、验证报告和共享夹具。35个逻辑套件及UI、SDK套件均由[测试入口](entry/src/ohosTest/ets/test/List.test.ets)静态注册，保留完整Hypium启动引导。

| 用例组 | 数量 | 操作步骤与检查点 | 预期结果 | 本次结果 |
| --- | ---: | --- | --- | --- |
| 原生产逻辑 | 19 | 注入端口调用Session和PermissionGate，检查状态、参数与调用轨迹 | 状态及权限路由符合生产契约 | 主机通过 |
| Payload参数矩阵 | 120 | 在初始、重新配置、clear重建状态下执行创建、添加、编辑、修改；组合时间边界与事件ID | 账户、配置、完整日程参数及对象隔离正确，ID=0有效 | 主机通过 |
| Result结果矩阵 | 128 | 设置空、单项、多项、重复ID与中文标题结果；执行查询 | 返回数组和成员身份、顺序、固定筛选参数及选择状态正确 | 主机通过 |
| State状态矩阵 | 96 | 在创建中、配置中、就绪、选中、已删除、已清理及配置失败状态调用各操作 | 前置条件失败无端口副作用，允许操作及恢复路径正确 | 主机通过 |
| Failure错误矩阵 | 240 | 对各端口安排同步抛错、异步拒绝，并执行重试、clear和查询 | 原异常身份保持，选择状态不丢失，分支启动及恢复符合契约 | 主机通过 |
| Permission权限矩阵 | 242 | 组合权限名称、数组长度、授权码、完成顺序、invalidate与重入 | 只接受完整双授权，回调排他，过期请求不改变当前状态 | 主机通过 |
| Race竞态矩阵 | 240 | 使用Pending精确控制创建、添加、删除、查询的完成全排列及跨clear时序 | 最新发起请求拥有选择权，迟到结果不覆盖新状态，实例隔离 | 主机通过 |
| UI冒烟 | 6 | 拉起应用、查找六个按钮、断言存在及文本后点击 | 控件可用且点击完成；不代表日历业务成功 | 设备未执行 |
| 真实SDK | 1 | 实际用户授权后创建专属日历，执行生产adapter配置与CRUD，finally删除专属日历 | 真实查询、修改、删除结果正确，清理不涉及用户日历 | 设备未执行 |
| 本地权限 | 1 | 输入反序全部授予、部分拒绝两种结果 | 返回true、false，并打印断言参数 | 主机通过 |

## 编码规范与检视修正

每条设备测试有唯一大写`@tc.number`、与it名称一致的`@tc.name`、英文目的说明和有效断言；用例名称统一为`CalendarEvent<功能>_0001`形式。通过TestSupport集中记录begin/end及每次断言的实际值，补齐旧用例的显式类型、返回类型及type导入；修复UI用例缺断言和async/done混用，移除本地恒真占位用例。新增逻辑矩阵不增加UI数量、不使用sleep调度竞态，也不修改生产日历业务或权限配置。

首次main及ohosTest编译通过后使用pr-review_origin检视；修复命名、函数头说明、日志和过时归档，并修正主机运行器把非Error异常值误判为成功、初始化失败未缓存和套件清理延迟的问题。检视后的构建记录以[构建审计](.validation/audit.json)为准。

## 验证结果与复现

- 主机回归1086/1086通过（1085条逻辑、1条本地权限），直接调用生产Session/Gate，只模拟SDK端口和必要枚举；不执行真实Calendar SDK、UI、权限弹框或数据库副作用。见[逐例执行报告](.validation/expansion-host-regression.json)。
- 运行器19/19自检通过，覆盖同步/异步非Error异常、beforeAll失败缓存、嵌套初始化与清理顺序、afterEach/afterAll失败；见[运行器报告](.validation/expansion-runner-contract.json)。
- 检视修正后main和ohosTest均重新编译成功，源码保护检查无缺失或构建修改；见[main构建日志](.validation/build-013-default.log)及[ohosTest构建日志](.validation/build-014-ohosTest.log)。仍有未修改SDK adapter的可抛异常告警和未配置签名告警，不宣称零告警。
- 1092条设备测试编号及名称唯一，元数据、有效断言、用例体长度和120字符行宽审计无问题；见[规范审计](.validation/expansion-metadata-audit.json)。
- [逐例清单](.validation/expansion-test-catalog.json)包含编号、名称、源码位置、目的、调用步骤、断言预期及本次结果；只有源码SHA-256与回归报告一致的条目才标记主机通过，7条设备用例标记未执行。
- 已连接API26设备，但未安装或执行本工程，未修改签名或设备权限。未签名HAP的编译成功不能视为真机通过。
- `.validation`为本地审计输出，已被gitignore排除；若正式提交PR，须按仓库要求另附测试报告与完整逐例清单，本次未提交或推送。

```bash
# 默认执行1085条逻辑用例；本地权限可作为额外文件参数执行
node host-regression.cjs
node host-regression.cjs entry/src/test/LocalUnit.test.ets
# 两目标按顺序构建，避免共享构建目录冲突
node build-audit.cjs default
node build-audit.cjs ohosTest
```

显式文件参数会替代默认扫描，回归报告记录本次实际执行文件列表；独立执行本地权限会覆盖最新主机报告，不代表完整回归。

## 设备业务验收步骤

下表保留原业务验收步骤及效果截图。本次均未执行；六条UI冒烟用例只校验控件和点击，不能据此判定下表业务结果。

| 测试功能                                  | 预置条件                | 输入          | 预期输出                                                                                         | 是否自动 | 测试结果 |
|---------------------------------------|---------------------|-------------|----------------------------------------------------------------------------------------------| -------- | -------- |
| 拉起应用                                  | 设备正常运行              |             | 成功拉起应用                                                                                       | 是       | 未执行   |
| 弹出 允许“CalendarManager”读取和修改你的日程？ 权限申请弹框 | 位于CalendarEvent页面 | 点击‘允许’      |                                                                                              | 是       | 未执行   |
| 1，创建日历账户                              | 位于CalendarEvent页面   | 点击‘1，创建日历账户’ | 成功创建日历账户。<br/>日历应用打开侧边栏，新增了‘MyCalendar’账户 ![CreateCalendar](screenshots/createCalendar.png)  | 是       | 未执行   |
| 2，创建日程                            | 位于CalendarEvent页面 | 点击‘2，创建日程 ’ | 成功创建日程。<br/>![CreateCalendar](screenshots/createEvent.png)                                   | 是       | 未执行   |
| 3，修改日程                            | 位于CalendarEvent页面 | 点击‘3，修改日程’ | 成功修改日程。<br/>![CreateCalendar](screenshots/updateEvent.png)                                   | 是       | 未执行   |
| 4，查询所有日程                            | 位于CalendarEvent页面 | 点击‘4，查询所有日程’ | 成功查询所有日程。<br/>观察日志打印 Succeeded in getting events, data -> [xxx]                              | 是       | 未执行   |
| 5，查询指定日程                            | 位于CalendarEvent页面 | 点击‘5，查询指定日程’ | 成功查询指定日程。<br/>观察日志打印 Succeeded in getting events filter by time/eventId/title, data -> [xxx] | 是       | 未执行   |
| 6，删除指定日程                            | 位于CalendarEvent页面 | 点击‘6，删除指定日程’ | 成功删除指定日程。<br/>观察日志打印 Succeeded in deleting event                                          | 是       | 未执行   |