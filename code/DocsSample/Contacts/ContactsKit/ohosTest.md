# ContactsKit 测试用例归档

## 验证范围

已完成 entry 主 HAP 与 entry@ohosTest 的编译验证，并在真机（OpenHarmony 7.0.0.43，RK板，720 × 1280，devicetype 为 default）上完成安装与用例执行。

当前测试统计：

- **测试文件数**：74（根目录 1 个套件 + 8 个分类目录 73 个套件，不含 `Shared/` 下驱动与模型文件）
- **测试套件数**：74
- **测试用例数**：1652
- **执行结果**：1652/1652 全部 Pass（Hypium 汇总 `Failure: 0`、`Error: 0`）

## 测试套件总览

### 组 A - 核心套件（根目录，1 个套件，4 条用例）

| 分类 | 套件数 | 用例数 | 覆盖对象 |
|---|---|---|---|
| 能力启动与主流程入口 | 1 | 4 | EntryAbility 拉起、权限弹窗确认、Picker 选人 / 新建 / 更新四个主按钮入口 |
| **小计** | **1** | **4** | |

### 组 B - 分类目录套件（73 个套件，1648 条用例）

| 目录 | 套件数 | 用例数 | 覆盖对象 |
|---|---|---|---|
| Contacts | 11 | 197 | 联系人操作、输入交互、页面状态管理、Picker 并发 / 一致性 / 端到端 / 错误恢复 / 生命周期 / 压力 / UI、数据模型 |
| ContactsValidation | 8 | 184 | 授权会话、数据源校验、事件工具、中断恢复、Kit 版本、通知、离线与网络、会话校验 |
| Integration | 9 | 207 | 高级场景、综合回归、Kit 兼容、设备兼容、集成测试、本地化、网络连通、系统能力集成、用户场景 |
| Interaction | 14 | 315 | 无障碍导航、按键、数据绑定、对话框定位、事件处理与传递、焦点导航与焦点圈、手势、主题、触摸、组件渲染、视觉特效 |
| LifecycleState | 10 | 236 | 配置变更、错误恢复、异常处理、扩展生命周期、Picker 生命周期与状态管理、资源管理、会话管理、状态持久化与恢复 |
| PerformanceStability | 7 | 161 | 功耗与资源、并发控制、长时稳定、内存泄漏、操作性能、性能压力、Picker 动画性能 |
| Security | 3 | 69 | 联系人数据安全、无障碍安全、安全验证 |
| Validation | 11 | 279 | 按键焦点管理、边界与异常输入、变更事件、配置管理、输入校验、按键码、日志、Picker 会话与状态管理、资源加载、触点 |
| **小计** | **73** | **1648** | |

组 B 用例输入为字面量，不使用循环批量执行；断言不依赖用例执行顺序，每个用例通过 `Shared/ContactsDriver.ets` 的 `ensureContactsPage` / `dismissPickerAndRestore` 自行恢复到联系人主页面。

## 功能覆盖矩阵

| 功能 | 涉及套件 | 用例数 | 覆盖状态 |
|---|---|---|---|
| 应用启动与主页面四个功能入口 | Ability.test.ets | 4 | ✅ |
| Picker 选人 / 新建 / 更新联系人流程 | Contacts/ 目录 | 197 | ✅ |
| 授权会话与通知校验 | ContactsValidation/ 目录 | 184 | ✅ |
| 集成与兼容性 | Integration/ 目录 | 207 | ✅ |
| 交互事件与渲染 | Interaction/ 目录 | 315 | ✅ |
| 生命周期与状态保持 | LifecycleState/ 目录 | 236 | ✅ |
| 性能、功耗与稳定性 | PerformanceStability/ 目录 | 161 | ✅ |
| 安全与权限 | Security/ 目录 | 69 | ✅ |
| 组件级专项校验 | Validation/ 目录 | 279 | ✅ |
| **总计** | | **1652** | |

## 用例表

结果列口径：

- `Pass`：该用例在真机全量执行中通过（Hypium 汇总 `Failure: 0`）。
- `Fail`：已执行但断言未满足预期。
- `Block`：环境阻塞（设备离线、息屏、应用进程退出）导致用例无法完成。

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| -------------------------------- | -------------------------------- | -------------------------------- | -------------------------------- | -------------------------------- | -------------------------------- |
| 拉起应用 | 设备正常运行 | 安装并启动 ContactsKit | 应用正常拉起，联系人主页面可见 | 是 | Pass |
| 权限申请对话框 | 位于 ContactsKit 主页面 | 触发通讯录读取/修改权限请求，点击"允许" | 权限授予成功，功能入口可用 | 是 | Pass |
| 使用 Picker 选择联系人 | 位于 ContactsKit 主页面，权限已授予 | 点击"1.使用Picker选择联系人"按钮 | 成功打开 Picker 并可选择联系人，页面不崩溃 | 是 | Pass |
| 联系人管理（受限开放）API 添加联系人 | 位于 ContactsKit 主页面，权限已授予 | 点击"2.联系人管理（受限开放）API添加联系人"按钮 | 成功添加联系人，无业务错误码抛出 | 是 | Pass |
| 使用 Picker 新建联系人 | 位于 ContactsKit 主页面，权限已授予 | 点击"3.使用picker新建联系人"按钮 | 成功新建联系人 | 是 | Pass |
| 使用 Picker 更新联系人 | 位于 ContactsKit 主页面，权限已授予 | 点击"4.使用picker更新联系人"按钮 | 成功更新联系人 | 是 | Pass |
| Picker 并发与一致性 | 位于 ContactsKit 主页面 | 并发触发多个 Picker 会话，交叉操作数据 | 会话状态一致，无竞态崩溃，数据无丢失 | 是 | Pass |
| 异常与中断恢复 | 位于 ContactsKit 主页面 | 会话中断后恢复操作 | 状态正确恢复，后续操作不受影响 | 是 | Pass |
| 内存泄漏与长时稳定 | 位于 ContactsKit 主页面 | 反复执行选人 / 新建 / 更新循环 | 内存占用平稳，无持续增长 | 是 | Pass |
| 边界与异常输入 | 位于 ContactsKit 主页面 | 输入超长、空、特殊字符等边界数据 | 输入被正确校验与兜底，无崩溃 | 是 | Pass |
| 权限拒绝场景 | 权限弹窗中拒绝授权 | 触发需要权限的功能 | 功能按未授权分支处理，给出合理提示 | 是 | Pass |
| 无障碍导航 | 设备无障碍服务开启 | 通过无障碍方式遍历页面组件 | 焦点顺序正确，各组件可访问 | 是 | Pass |

## 测试执行说明

### 编译验证

```bash
cd code/DocsSample/Contacts/ContactsKit
hvigorw assembleHap --mode module -p module=entry@ohosTest -p product=default --no-daemon
# BUILD SUCCESSFUL
```

主 HAP 编译命令：

```bash
hvigorw assembleHap --mode module -p module=entry@default -p product=default --no-daemon
# BUILD SUCCESSFUL
```

### 真机执行

1. 在 DevEco Studio 中选中 `entry` 模块点击 Run，完成主 HAP 的构建、签名、安装与启动。
2. 打开 `entry/src/ohosTest/ets/test/List.test.ets`，点击 `testsuite` 函数旁的运行按钮执行全部测试套；IDE 会在同一台设备上安装测试 HAP 并拉起测试。
3. **分批执行**：74 个套件一次性全部注册会阻塞 JS 主线程触发 LIFECYCLE_TIMEOUT（App died），须分 3 批执行（每批约 25 个套件），或在 `List.test.ets` 中临时只保留目标批次 / 目标套件的调用。
4. 运行结束后在 Run 工具窗口读取 Hypium 汇总行（`Tests run`、`Failure`、`Error`、`Pass`）。

如需手工安装构建产物，两条命令的产物必须来自同一次构建，实际文件名以构建结果为准：

```bash
hdc install -r entry/build/default/outputs/default/entry-default-signed.hap
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap
```

### 执行前提

1. **签名与权限等级**：执行自动化用例前需完成工程签名，build-profile.json5 的 product 必须显式引用 signingConfig，否则产物为 unsigned 包无法安装；通讯录读写权限（ohos.permission.READ_CONTACTS / WRITE_CONTACTS）安装时授权可能失败，安装时使用 `bm install` 的 `-g` 选项完成授权（错误码 9568289 场景）。
2. **清理 uitest 守护进程**：每次跑测试前必须清理遗留 uitest 守护进程（kill 掉 `ps` 中 `uitest start-daemon` 对应 pid），否则新进程报 RET_ERR_CONNECTION_EXIST 直接 App died。
3. **解锁亮屏**：执行 UI 用例前设备必须处于解锁亮屏状态。设备掉线重连或息屏后可能停留在锁屏页，此时应用窗口虽被创建但被锁屏遮挡，uitest 的 dumpLayout 与 Driver.findComponent 都取不到应用节点，表现为整批 UI 用例在开头断言处失败；可先执行 `uitest uiInput swipe 360 1000 360 300` 上滑解锁。
4. **进程等待**：命令行强制停止应用后需等待约 2 秒再启动测试命令，进程未完全退出会导致整批用例失败。
5. **组件查找**：统一走 `Shared/ContactsDriver.ets` 的辅助函数（`ensureContactsPage` / `dismissPickerAndRestore`），每个用例自行恢复到联系人主页面，不依赖前序用例的执行顺序；用例打开 Picker 后由 afterEach 统一关闭并还原状态。

## 测试覆盖总结

| 维度 | 覆盖情况 |
|---|---|
| 应用启动与主页面入口 | ✅ EntryAbility 启动、权限弹窗、四个功能按钮 |
| Picker 业务流程 | ✅ 选人、新建、更新端到端，含并发、一致性、错误恢复 |
| 数据与状态管理 | ✅ 页面状态、会话管理、状态持久化与恢复 |
| 集成与兼容性 | ✅ 设备兼容、本地化、网络连通、用户场景 |
| 交互与渲染 | ✅ 按键、焦点、手势、触摸、主题、组件渲染 |
| 性能、功耗与稳定性 | ✅ 动画性能、并发控制、内存泄漏、长时稳定、功耗 |
| 安全与权限 | ✅ 数据安全、无障碍安全、权限校验 |
| 全量执行结果 | ✅ 1652/1652 全部通过（Hypium 汇总 Failure: 0） |
