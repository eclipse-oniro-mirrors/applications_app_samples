# 主页Tabs嵌套场景测试用例归档

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| -------------------------------- | -------------------------------- | -------------------------------- | -------------------------------- | -------------------------------- | -------------------------------- |
| TabBar 页签渲染 | 设备正常运行，应用已安装 | 启动测试页 | TabBar 各页签完整渲染可见 | 是 | 通过（OpenHarmony 7.0.0.43，RK板） |
| 页签切换导航 | 位于测试页 | 点击/滑动切换页签 | 内容区切换到对应 Tab，状态一致 | 是 | 通过（OpenHarmony 7.0.0.43，RK板） |
| 页签增删与数据模型 | 位于测试页 | 连续执行页签增删改查操作 | 数据模型状态与预期一致且不漂移 | 是 | 通过（OpenHarmony 7.0.0.43，RK板） |
| TabBar 自定义构造 | 位于测试页 | 配置 BarPosition、TabMode、BarWidth/BarHeight | 布局按配置正确生效 | 是 | 通过（OpenHarmony 7.0.0.43，RK板） |
| 手势与触摸交互 | 位于测试页 | 滑动切页、点击、连续快速操作 | 事件被目标组件正确消费，页面稳定 | 是 | 通过（OpenHarmony 7.0.0.43，RK板） |
| 焦点与无障碍导航 | 位于测试页 | 按键移动焦点、遍历无障碍节点 | 焦点按预期顺序转移，无障碍文本可读 | 是 | 通过（OpenHarmony 7.0.0.43，RK板） |
| 生命周期与状态恢复 | 应用已启动过一次 | 触发配置变更后恢复页面 | 状态正确持久化并恢复 | 是 | 通过（OpenHarmony 7.0.0.43，RK板） |
| 异常与边界校验 | 位于测试页 | 注入越界 index、非法输入 | 越界输入被拦截并钳位，页面不崩溃 | 是 | 通过（OpenHarmony 7.0.0.43，RK板） |
| 性能与功耗 | 位于测试页 | 连续切页动画、持续交互采样 | 动画帧耗在预算内，功耗表现正常 | 是 | 通过（OpenHarmony 7.0.0.43，RK板） |
| 数据与网络安全校验 | 位于测试页 | 注入边界数据、离线场景 | 数据校验按预期拦截，状态一致 | 是 | 通过（OpenHarmony 7.0.0.43，RK板） |

## 测试规模

- **测试文件数**：80（78 个分类测试套件 + 根目录 `Ability.test.ets` 与 `List.test.ets`，不含工具类 `Shared/SharedDriver.ets`）
- **测试套件数**：78
- **测试用例数**：3621
- **覆盖目录**：TabsCore（776 条）、Interaction（687 条）、Validation（752 条）、TabsValidation（405 条）、LifecycleState（379 条）、Integration（279 条）、PerformanceStability（240 条）、Security（99 条）

## 说明

1. 自动化用例位于 entry/src/ohosTest/ets/test 目录，按 TabsCore、Integration、Interaction、LifecycleState、PerformanceStability、Security、TabsValidation、Validation 八个分类组织，用例命名为"测试模块名_场景_序号"，基于 hypium 框架注册于 List.test.ets。
2. 测试采用分层覆盖结构（核心功能、交互、生命周期与状态、性能与稳定性、安全、集成、校验），覆盖 Tabs 组件核心能力、交互行为、生命周期状态管理与异常/边界校验。
3. 全量用例已在真机执行并通过，执行镜像为 OpenHarmony 7.0.0.43 的 RK 板（720x1280）。
4. 执行 UI 用例前设备需处于解锁亮屏状态；息屏会导致被测窗口退到后台，组件查找落空。
5. 单套件回归可在 hypium 运行参数后追加 `-s class <套件名>`；全量执行在 DevEco Studio 中通过 List.test.ets 的 testsuite 入口拉起。
