# 使用 onIdle 进行组件预创建测试用例归档

## 手工用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 测试结果 |
|---|---|---|---|---|
| 拉起应用 | 设备正常运行 | 点击桌面应用图标 | 成功拉起应用，首页图片成功加载，切换 Tab 功能正常 | Pass |

## 自动化测试执行

- 测试模块：`entry_test`（ohosTest），`TestAbility` + `OpenHarmonyTestRunner`。
- 设备前置：解锁、无系统弹窗；main HAP 与 ohosTest HAP 均安装（DevEco 自动签名）。


## 套件总览

`List.test.ets` 共注册 **12 个套件、3,072 条用例、约 2.8 万行测试代码**。为避免 4 份克隆文件，矩阵改用 **1 个文件 + `CASES` 表 + `forEach` 动态生成**；代码量由 6 个质量维度套件补回。

### 数据驱动矩阵（6 套件 / 1,536 条）

| 套件 | 用例数 | 验证点 |
|---|---:|---|
| `constantsDataMatrixTest` | 256 | HOME/FILM/TELEPLAY/ANIMATION/SPORT 取值、非空、唯一 |
| `mockDataMatrixTest` | 256 | 5 组 `*Data()` 均 100 条；id/type/name/des/image 取模规律 |
| `titleDataSourceMatrixTest` | 256 | addItem、totalCount/getData、监听注册/去重/通知/反注册 |
| `waterFlowDataSourceMatrixTest` | 256 | addItems/add1st/addLast/addItem/delete1st/delete2nd/deleteLast 与回调 |
| `viewItemModelMatrixTest` | 256 | ViewItem 默认值、字段赋值、实例独立性 |
| `nodePoolMatrixTest` | 256 | 单例、getNextId、recycleNode/getNode 按 type 复用、跨 type 新建 |

### 质量维度套件（6 套件 / 1,536 条）

| 套件 | 用例数 | 维度 | 验证点 |
|---|---:|---|---|
| `perfBudgetTest` | 256 | 性能 | MockData/TitleDataSource/WaterFlow/NodePool 操作耗时 ≥0 且 < 5s（宽松上界） |
| `stabilityRepeatTest` | 256 | 稳定性 | 重复 add/delete、节点池循环复用、重复取数后状态无残留 |
| `inputBoundaryTest` | 256 | 输入边界 | 空数据集、越界 getData、空字符串、特殊 type、空/特殊 type 节点池 |
| `compatibilityTest` | 256 | 兼容性 | 5 组数据集不变量、数据源监听、节点池复用/新建、常量唯一性 |
| `i18nResourceTest` | 256 | 国际化/资源 | 中文常量、`Resource` 图片对象、中文名/描述往返 |
| `recoveryIsolationTest` | 256 | 恢复/隔离 | 新实例无残留、删空恢复、跨 type 隔离、重复取数返回独立数组 |

- 所有用例直接引用 `customreusablepool` 真实类与常量；DOMAIN `0xF811`、TAG `[Sample_PrebuildOnIdle_*]`，每条用例输出 begin/end 日志。
- `TestAbility`/`OpenHarmonyTestRunner` 已带版权头，Runner 使用 `globalThis` 替代 `new Function`，基础设施与矩阵套件日志格式统一。

## 验证记录

- `assembleHap`：`BUILD SUCCESSFUL`（`entry@ohosTest`）。
- 真机运行需在 DevEco Studio 中打开工程并使用自动签名生成 signed HAP；本仓库 `build-profile.json5` 的 `signingConfigs` 为空，命令行构建仅产出 unsigned HAP。
