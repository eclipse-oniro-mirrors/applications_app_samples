# Web预渲染优化测试说明

## 范围与环境

- 工程：`code/Performance/web_import/WebImportRender`。
- bundleName：`com.example.myrender`；主模块：`entry`；测试模块：`entry_test`。
- 运行器：默认 `OpenHarmonyTestRunner`，由 hvigor 生成；入口：`entry/src/ohosTest/ets/test/List.test.ets`。
- 使用 DevEco Studio 6.1.1、OpenHarmony API 26 SDK 在备份工程中编译；原 `runtimeOS: OpenHarmony`、最低兼容 API 14、`default`/`tablet` 设备类型保持不变。
- 自动化测试使用 API 26 设备；控制器守卫测试使用 API 22 起提供的 `UIContext` 构造函数，不表示测试 HAP 可以在 API 14 上执行。
- 先安装同一签名的主 HAP 和测试 HAP。路由查询需要已安装的主 `entry` 模块，不能只安装测试 HAP。

## 用例规模与覆盖

15 个套件、120 条用例；套件源码 52083 行，含入口及共享工具的测试目录 ETS 源码共 52202 行。原有占位用例已改写，新增用例 119 条。

**其中 117 条为 NavPathStack SDK 基础行为测试，不验证 Web 预渲染业务或性能。** 所有导航栈实例为用例内局部对象，期望值由生成时的独立列表模型计算，不把业务实现复制到测试中。

| 套件 | 用例数 | 检查内容 |
|---|---:|---|
| Ability | 1 | 独立测试进程中未注册 URL 的查找、空白节点缺失、重复查找不注册节点 |
| ControllerGuardSequence | 1 | 真实 MyNodeController 未初始化时的 makeNode、loadUrl、生命周期守卫 |
| RouteRegistrationMatrix | 1 | 已安装主模块的 pageOne、PageTwoBuilder、EntryAbility 和 bundleName |
| NavPushSequence | 10 | 入栈、删除、回退、重新入栈后的顺序和参数 |
| NavPopSequence | 10 | 空栈出栈、出栈返回信息、复入和后续操作 |
| NavRemoveIndexMatrix | 10 | 单个、相邻、间隔及端点索引删除后的状态 |
| NavRemoveNameMatrix | 10 | 同名、缺失名称、恢复后的名称删除 |
| NavPopNameSequence | 10 | 按名称回退、重复名称的第一个匹配项、缺失目标 |
| NavPopIndexSequence | 9 | 按索引回退、重复页面及删除后索引变化 |
| NavMoveNameSequence | 9 | 名称匹配移动、缺失目标及后续回退 |
| NavMoveIndexSequence | 9 | 按索引移动后的参数归属和后续删除 |
| NavReplaceSequence | 10 | 顶部替换、同名页面与恢复序列 |
| NavClearSequence | 10 | 清空、重建及清空后的查询和操作 |
| NavDuplicateSequence | 10 | 同名不同参数的页面在多种操作下的保留关系 |
| NavIsolationSequence | 10 | 两个独立栈交错操作，检查另一栈不被修改 |

## 执行方式

1. 在 API 26 的 `default` 或 `tablet` 设备上安装匹配签名的主 HAP，再安装测试 HAP；构建副本当前没有签名配置，生成的是未签名 HAP。
2. 使用默认 TestAbility 独立运行。不要在同一测试进程中先初始化业务的 createNWeb；控制器查找套件明确检查未初始化状态。
3. 在 DevEco Studio 执行完整 ohosTest，不使用 `-s class` 分批，也不通过删除用例规避失败。
4. 如需命令行执行，使用 OpenHarmony Ability Assistant 测试命令，参数为 `-b com.example.myrender -m entry_test -s unittest OpenHarmonyTestRunner -s timeout 300000`。
5. 保存实际的用例总数、失败数、通过数和 `OHOS_REPORT_RESULT`。`TestFinished-ResultCode: 0` 本身不能证明断言全部通过。
6. 按实际设备报告复核同名删除、缓存页面复入的参数行为和全量运行稳定性；当前没有新增设备执行证据，不填写真机通过结论，也未完成两轮连续全量通过验证。

## 执行限制

每个套件在用例执行前等待 30 ms，用于让出事件循环。用例不创建 Web 组件、不调用 createNWeb、不联网、不反复拉起 Ability、不检查 GC 计数。

## 未覆盖的业务路径

节点挂载、空白 Web 组件复用、Web 页面实际加载、第一次渲染耗时和跳转优化效果依赖真实界面。本轮自动化未覆盖上述业务路径，导航栈 SDK 用例只验证栈数据行为，不能替代这些场景。以下场景仍需人工复核：

| 待人工复核的场景 | 操作 | 预期 | 复核状态 |
|---|---|---|---|
| 拉起应用 | 正常启动主 EntryAbility | 首页显示 | 未复核，历史记录为通过 |
| 进入页面 | 点击加载下一页 | 进入第二页 | 未复核，历史记录为通过 |
