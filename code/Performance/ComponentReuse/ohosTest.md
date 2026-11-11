# 组件复用性能优化指导示例代码测试用例归档

## 手工用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
|---|---|---|---|---|---|
| 拉起应用 | 设备正常运行 | 点击桌面应用图标 | 成功拉起应用 | 是 | Pass |
| 减少组件复用的嵌套层级正例 | 拉起应用成功，在应用首页 | 点击“减少组件复用的嵌套层级”按钮 | 列表正常显示，可以上下滑动 | 是 | Pass |
| 减少组件复用的嵌套层级反例 | 拉起应用成功，在应用首页 | 点击“减少组件复用的嵌套层级 - 反例”按钮 | 列表正常显示，可以上下滑动 | 是 | Pass |
| 使用 AttributeUpdater 精准控制组件属性的刷新正例 | 拉起应用成功，在应用首页 | 点击“使用AttributeUpdater精准控制组件属性的刷新”按钮 | 列表正常显示，可以上下滑动 | 是 | Pass |
| 使用 AttributeUpdater 精准控制组件属性的刷新反例 | 拉起应用成功，在应用首页 | 点击“使用AttributeUpdater精准控制组件属性的刷新 - 反例”按钮 | 列表正常显示，可以上下滑动 | 是 | Pass |
| 使用 @Link/@ObjectLink 替代 @Prop 减少深拷贝反例 | 拉起应用成功，在应用首页 | 点击“使用@Link/@ObjectLink替代@Prop减少深拷贝 - 反例”按钮 | 列表正常显示，可以上下滑动 | 是 | Pass |
| 避免在 aboutToReuse 中更新状态变量反例 | 拉起应用成功，在应用首页 | 点击“避免状态变量在aboutToReuse方法中再进行更新 - 反例”按钮 | 列表正常显示，可以上下滑动 | 是 | Pass |
| 使用 reuseId 标记不同结构的组件正例 | 拉起应用成功，在应用首页 | 点击“使用reuseId标记不同结构的组件”按钮 | 列表正常显示，可以上下滑动 | 是 | Pass |
| 使用 reuseId 标记不同结构的组件反例 | 拉起应用成功，在应用首页 | 点击“使用reuseId标记不同结构的组件 - 反例”按钮 | 列表正常显示，可以上下滑动 | 是 | Pass |
| 避免使用函数/方法作为复用组件创建时的入参正例 | 拉起应用成功，在应用首页 | 点击“避免使用函数/方法作为复用组件创建时的入参”按钮 | 列表正常显示，可以上下滑动 | 是 | Pass |
| 避免使用函数/方法作为复用组件创建时的入参反例 | 拉起应用成功，在应用首页 | 点击“避免使用函数/方法作为复用组件创建时的入参 - 反例”按钮 | 列表正常显示，可以上下滑动 | 是 | Pass |

## 自动化测试执行

- 测试模块：`entry_test`（ohosTest），`TestAbility` + `OpenHarmonyTestRunner`。
- 设备前置：解锁、无系统弹窗；main HAP 与 ohosTest HAP 均安装。
- 运行命令：

```bash
hdc uninstall com.example.componentreuse
hdc install -r entry/build/default/outputs/default/entry-default-signed.hap
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap
hdc shell aa test -b com.example.componentreuse -m entry_test \
  -s unittest OpenHarmonyTestRunner -s class builderContextCoreTest -s timeout 15000
```

- 全部套件运行：去掉 `-s class` 参数即可。
- UI 套件 `ActsAbilityTest` 已拆成 10 条独立用例（每个页面一条），单条远低于 15s 默认超时。

## 套件总览

`List.test.ets` 共注册 **25 个套件、1,546 条用例**。

### UI 用例（1 套件 / 10 条）

| 套件 | 用例数 | 职责 |
|---|---:|---|
| `ActsAbilityTest` | 10 | 拉起 `EntryAbility`，逐个进入 10 个组件复用场景页面、滑动列表并返回 |

### 组件复用数据与上下文矩阵（24 套件 / 1,536 条）

| 分组 | 套件 | 用例数 | 验证点 |
|---|---|---:|---|
| 全局 Builder 上下文 | `BuilderContext{Core,Extended,Advanced,Tail}` | 256 | 10 个 NavDestination key 均可取到 builder；`setObject/getObject` 写入后可读；未知 key 返回 undefined |
| 数据源监听 | `DataSourceListener{Core,Extended,Advanced,Tail}` | 256 | 2~8 个监听器注册、重复注册去重、`notifyDataAdd` 回调 index、unregister 后不再回调 |
| ColorData | `ColorData{Core,Extended,Advanced,Tail}` | 256 | `pushData` 后 `totalCount/getData` 的 id/text/color 与写入一致 |
| FriendMomentsData | `FriendMomentData{Core,Extended,Advanced,Tail}` | 256 | `pushData` 后 `totalCount/getData` 的 id/userName/share 与写入一致 |
| 常量表 | `ConstantsData{Core,Extended,Advanced,Tail}` | 256 | `navDestinationData` 10 项顺序/唯一性、detail 存在、LIST_SPACE/LAYOUT_MAX/COMM_INIT |
| 数据模型 | `ModelContract{Core,Extended,Advanced,Tail}` | 256 | `FriendMoment/ShareModel/ColorModel` 构造字段赋值与实例独立性 |

- 每个矩阵套件 64 条用例，`Core/Extended/Advanced/Tail` 各覆盖一段参数区间。
- 所有用例直接引用 `entry/src/main/ets` 下的真实类与常量，并通过 `hilog`（DOMAIN `0xF811`、TAG `[Sample_ComponentReuse_*]`）输出 begin/end 日志，带完整 `@tc.number/@tc.name/@tc.desc` 元数据。
- 已补齐 `testability/TestAbility.ets`、`testability/pages/Index.ets`、`testrunner/OpenHarmonyTestRunner.ets`、`resources` 与 `module.json5` 测试入口，保证 `aa test` 可直接运行。

## 验证记录

- `assembleHap`：`BUILD SUCCESSFUL`。
- 真机抽样：`builderContext{Core,Tail}`、`dataSourceListener{Core,Tail}`、`colorData{Core,Tail}`、`friendMomentData{Core,Tail}`、`constantsData{Core,Tail}`、`modelContract{Core,Tail}` 均 64/64 通过。
- `ActsAbilityTest`：`Tests run: 10, Failure: 0, Error: 0, Pass: 10`，`TestFinished-ResultCode: 0`（15s 超时下通过）。
