# 自定义视图实现Tab效果测试说明

## 1. 简介

本示例使用 Text、List、Row 等组件，结合 `onClick`、`animateTo`、`scrollToIndex`、`PanGesture` 实现类似 Tab 的页签切换效果。本文档说明本工程 `ohosTest` 自动化测试的覆盖范围、目录结构、执行方式与结果判定。

## 2. 测试环境

| 项目 | 说明 |
|---|---|
| 设备 | Phone / Tablet / 2in1 真机或模拟器 |
| SDK | HarmonyOS 6.0.0(20) 及以上 |
| 测试框架 | Hypium + UiTest（`@kit.TestKit`） |
| 测试模块 | `entry_test` |
| 应用包名 | `com.samples.CustomviewSample` |

## 3. 测试目录结构

```
entry/src/ohosTest/ets/test
├─ List.test.ets                 # 测试入口，注册 83 个套件
├─ Ability.test.ets              # 基础断言用例
├─ Api                           # 页签模型 API 用例（4 个文件）
├─ CustomView                    # 核心业务用例（16 个文件）
├─ CustomViewValidation          # 业务校验用例（8 个文件）
├─ Integration                   # 集成与兼容性用例（9 个文件）
├─ Interaction                   # 交互、焦点、手势用例（14 个文件）
├─ LifecycleState                # 生命周期与状态用例（10 个文件）
├─ PerformanceStability          # 性能与稳定性用例（7 个文件）
├─ Security                      # 安全与权限用例（3 个文件）
├─ Validation                    # 参数、边界、工具类校验用例（11 个文件）
└─ Shared                        # CustomViewTestDriver / CustomViewFixtures
```

## 4. 测试覆盖统计

| 分类 | 文件数 | 用例数 | 说明 |
|---|---:|---:|---|
| Api | 4 | 70 | 页签数量、标题、索引、宽度计算等纯模型校验 |
| CustomView | 16 | 365 | 页签目录、操作流、状态管理、输入交互、UI 渲染、压力场景 |
| CustomViewValidation | 8 | 280 | 应用版本、会话、数据源、事件工具、中断恢复、通知、离线场景校验 |
| Integration | 9 | 61 | 综合回归、用户场景、系统集成、本地化、网络与设备兼容性 |
| Interaction | 14 | 144 | 点击、触摸、滑动、手势、焦点、事件传递、无障碍与视觉表现 |
| LifecycleState | 10 | 98 | 页面生命周期、状态持久化、异常恢复、配置变化、资源管理 |
| PerformanceStability | 7 | 80 | 动画性能、并发控制、内存泄漏、长时间稳定性、压力测试 |
| Security | 3 | 39 | 权限、敏感信息脱敏、安全校验 |
| Validation | 11 | 313 | 键码、指针、动画控制器、日志、输入、边界与资源加载校验 |
| Ability | 1 | 1 | 基础断言用例 |
| **合计** | **83** | **1,451** | `List.test.ets` 注册全部 83 个套件 |

## 5. 主要测试场景

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 初始页面渲染 | 1. 真机环境<br/>2. 构建并安装测试 HAP<br/>3. 启动应用 | 打开应用首页 | 默认选中“候补预测”，页签加粗放大，指示条位于首个页签下方 | 是 | Pass |
| 点击页签切换 | 同上 | 依次点击“在线换座”“余票挖掘”“个人中心” | 对应页签选中，字体由 14 变为 18 并加粗，指示条移动到目标页签 | 是 | Pass |
| 内容区滑动切换 | 同上 | 在内容区左右滑动 | 列表通过 `scrollToIndex` 平滑切换，页签选中态与指示条同步更新 | 是 | Pass |
| 首尾边界处理 | 同上 | 在第一个页签向左滑、在最后一个页签向右滑 | 页面不越界，选中态保持不变 | 是 | Pass |
| 指示条动画 | 同上 | 跨多个页签快速点击 | `animateTo` 时长按距离计算，指示条平滑移动，结束后位置正确 | 是 | Pass |
| 重复点击当前页签 | 同上 | 连续点击已选中的页签 | 页面与指示条状态保持稳定，无重复动画或错位 | 是 | Pass |
| 无障碍属性 | 同上 | 查询页签节点属性 | 选中页签的 `accessibilitySelected` 为 `true`，其余为 `false` | 是 | Pass |
| 状态与生命周期 | 同上 | 前后台切换、页面重建 | 页签索引、指示条位置与内容区状态正确恢复 | 是 | Pass |
| 性能与稳定性 | 同上 | 连续切换、快速滑动、长时间操作 | 无卡顿、无内存持续增长，组件数量保持稳定 | 是 | Pass |
| 参数与边界校验 | 单元测试环境 | 输入非法索引、空标题、异常参数 | 模型返回合法结果或安全兜底，不抛出未处理异常 | 是 | Pass |

## 6. 构建与运行

```powershell
# 构建主 HAP
hvigorw --mode module -p product=default -p module=entry@default -p buildMode=debug assembleHap

# 构建测试 HAP
hvigorw --mode module -p product=default -p module=entry@ohosTest -p buildMode=debug assembleHap

# 安装（签名 profile 需包含当前设备 UDID）
hdc install -r entry/build/default/outputs/default/entry-default-signed.hap
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap

# 运行测试
hdc shell aa test -b com.samples.CustomviewSample -m entry_test -s unittest /ets/testrunner/OpenHarmonyTestRunner -s timeout 15000
```

## 7. 结果判定

- `OHOS_REPORT_RESULT: Tests run: N, Failure: 0, Error: 0, Pass: N` 表示全部通过。
- `OHOS_REPORT_CODE: 0` 且 `TestFinished-ResultCode: 0` 表示测试任务正常结束。
- 存在 `Failure`、`Error` 或 `STATUS_CODE: -1` 时，根据 `stack` 与 `stream` 定位失败用例。
