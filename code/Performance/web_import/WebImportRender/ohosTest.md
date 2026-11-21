# Web预渲染优化测试说明

## 范围与环境

- 工程：`code/Performance/web_import/WebImportRender`。
- bundleName：`com.example.myrender`；主模块：`entry`；测试模块：`entry_test`。
- 运行器：默认 `OpenHarmonyTestRunner`，由 hvigor 生成；入口：`entry/src/ohosTest/ets/test/List.test.ets`。
- 使用 DevEco Studio 6.1.1、OpenHarmony API 26 SDK 在备份工程中编译；原 `runtimeOS: OpenHarmony`、最低兼容 API 14、`default`/`tablet` 设备类型保持不变。
- 自动化测试使用 API 26 设备；控制器守卫测试使用 API 22 起提供的 `UIContext` 构造函数，不表示测试 HAP 可以在 API 14 上执行。
- 先安装同一签名的主 HAP 和测试 HAP。路由查询需要已安装的主 `entry` 模块，不能只安装测试 HAP。

## 用例规模与覆盖

15 个套件、120 条用例；套件源码 52068 行，含入口及共享工具的测试目录 ETS 源码共 52183 行。原有占位用例已改写，新增用例 119 条。

**其中 117 条是样例使用的 NavPathStack SDK 基础依赖测试，不是 Web 预渲染业务或性能验证。** 所有导航栈实例为用例内局部对象，期望值由生成时的独立列表模型计算，不把业务实现复制到测试中。

| 套件 | 用例数 | 检查内容 |
|---|---:|---|
| Ability | 1 | 独立测试进程中未注册 URL 的查找、空白节点缺失、重复查找不注册节点 |
| ControllerGuardSequence | 1 | 真实 MyNodeController 未初始化时的 makeNode、loadUrl、生命周期守卫 |
| RouteRegistrationMatrix | 1 | 已安装主模块的 pageOne、PageTwoBuilder、EntryAbility 和 bundleName |
| NavPushSequence | 10 | 入栈、删除、回退、重新入栈后的顺序和参数 |
| NavPopSequence | 10 | 空栈出栈、出栈返回信息、复入和后续操作 |
| NavRemoveIndexMatrix | 10 | 单个、相邻、间隔及端点索引删除后的状态 |
| NavRemoveNameMatrix | 10 | 同名、缺失名称、恢复后的名称删除 |
| NavPopNameSequence | 10 | 按名称回退、重复名称的首次匹配、缺失目标 |
| NavPopIndexSequence | 9 | 按索引回退、重复页面及删除后索引变化 |
| NavMoveNameSequence | 9 | 名称匹配移动、缺失目标及后续回退 |
| NavMoveIndexSequence | 9 | 按索引移动后的参数归属和后续删除 |
| NavReplaceSequence | 10 | 顶部替换、同名页面与恢复序列 |
| NavClearSequence | 10 | 清空、重建及清空后的查询和操作 |
| NavDuplicateSequence | 10 | 同名不同参数的页面在多种操作下的保留关系 |
| NavIsolationSequence | 10 | 两个独立栈交错操作，检查另一栈不被修改 |

每条导航用例最多 11 次栈修改，每次修改后检查顺序、大小、参数和索引；没有为凑行数增加空转循环或重复操作序列。索引查询结果先按数值排序，仅比较索引集合，不假定 SDK 的返回排序；参数名称查询顺序按 SDK 声明核对。

所有套件都有 30 ms 非零节流；本批不创建 Web 组件、不调用 createNWeb、不联网、不反复拉起 Ability、不检查 GC 计数。

### 未覆盖的业务路径

已初始化节点的挂载、重用空白 Web 组件、Web 页面实际加载、首次渲染耗时和跳转优化效果依赖真实界面。本批没有把 SDK 栈操作测试当成这些业务路径的覆盖，以下原有人工场景仍需设备复核。

| 原有人工场景 | 操作 | 预期 | 本轮状态 |
|---|---|---|---|
| 拉起应用 | 正常启动主 EntryAbility | 首页显示 | 未复验，原归档记录为 Pass |
| 进入页面 | 点击加载下一页 | 进入第二页 | 未复验，原归档记录为 Pass |
| 返回首页 | 点击返回键 | 返回首页 | 未复验，原归档记录为 Pass |

## 运行步骤

1. 在 API 26 的 default 或 tablet 设备上安装匹配签名的主 HAP，再安装测试 HAP；构建副本当前没有签名配置，生成的是 unsigned HAP。
2. 使用默认 TestAbility 独立运行。不要在同一测试进程中先初始化业务的 createNWeb；控制器查找套件明确检查未初始化状态。
3. 在 DevEco Studio 执行完整 ohosTest，或使用下面的命令；不使用 `-s class` 分批，也不通过删除用例规避失败。

```bash
hdc shell aa force-stop com.example.myrender
hdc shell aa test -b com.example.myrender -m entry_test -s unittest OpenHarmonyTestRunner -s timeout 300000
```

4. 保存实际的 `Tests run`、`Failure`、`Pass` 和 `OHOS_REPORT_RESULT`。`TestFinished-ResultCode: 0` 本身不能证明断言全通过。
5. 按实际设备报告复核同名删除、缓存页面复入的参数行为和全量运行稳定性；当前没有设备执行证据，不填写真机 Pass，也未完成两轮全绿验证。

## 本轮验证记录（2026-11-19）

| 项目 | 结果 |
|---|---|
| 主 HAP 编译 | BUILD SUCCESSFUL，requiredDeviceType=default |
| 测试 HAP 增量编译及最终全量编译 | BUILD SUCCESSFUL，最终 120 条用例全部注册 |
| 用例名、编号、元数据、少于 3 条静态断言 | 0 问题 |
| 去除日志后的完全重复用例体 | 0 组 |
| 屏蔽字面量后的相同用例结构候选 | 0 组 |
| 归一化操作骨架相同及相差 1/2 次操作的近似候选 | 0 组；共同的准备和快照检查框架仍存在，不宣称所有文本零相似 |
| 矛盾断言静态扫描、严格类型、空行、超过 120 字符的套件源码行 | 0 问题 |
| 本地化文本断言 | 未断言硬编码的本地化资源文案 |
| main 基线 | 15 个文件，哈希 0 差异 |
| 配置范围 | 只把 compileSdkVersion 从 20 改为 26.0.0，无新增签名或权限 |
| 真机全量及人工预渲染验证 | 未执行，hdc 无连接设备 |

静态检视不等同于真机验证。业务源码已有的 console.log、小写 common.ets 文件名及硬编码界面文案未在本次修改；本次只整改测试及测试文档，不因此宣称整个存量工程规范检视通过。
