# ComposeListAndTitleDemo 测试用例归档

## 测试环境

- 设备：RK3568 开发板（DAYU200），OpenHarmony 7.0.0.46 / API 26
- 应用：`com.samples.composelistandtitledemo`
- 测试框架：Hypium，测试模块 `entry_test`，执行器 `OpenHarmonyTestRunner`
- 开发环境：DevEco Studio 6.1.1，编译 SDK API 26，`compatibleSdkVersion 6.1.1(24)`
- 测试代码：`entry/src/ohosTest/ets/test/`，4 个套件 54 条用例，由 `List.test.ets` 聚合

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| --- | --- | --- | --- | --- | --- |
| 应用启动与页面渲染 | 设备已安装应用 | 启动 `EntryAbility` | 显示标题栏、设备信息行、搜索框、3 个演示分区与日志面板，日志记录设备档案与初始联系人数量 | 否 | Pass |
| 标题栏 V1 菜单 | 位于首页 | 点击头像、「刷新」、「设置」 | 三次点击均写入日志；点击「刷新」后列表重新查询并记录当前展示人数 | 否 | Pass |
| 标题栏 V2 菜单 | 位于分区 1 | 点击头像、「搜索」、「更多」 | `menuItems` 回调触发并写入日志 | 否 | Pass |
| 标题栏 V2 动态副标题 | 位于首页 | 切换分区 3 中某位联系人的 toggle | 副标题“共 N 人 · 在线 M 人”中的在线人数随数据仓库变化 | 否 | Pass |
| 搜索实时过滤 | 位于首页，列表非空 | 输入姓名或部门关键字，再清空 | 列表按关键字实时过滤；清空后恢复全部联系人；无匹配时列表为空 | 否 | Pass |
| 列表项 V1 联系人与箭头 | 位于分区 2 | 点击任一联系人行的箭头 | 日志记录“V1 列表项箭头点击：姓名” | 否 | Pass |
| 列表项 V1 开关 | 位于分区 2 | 点击“消息免打扰”开关 | 开关状态切换，日志记录 `V1 开关切换 → true/false` | 否 | Pass |
| 列表项 V1 按钮与复选框 | 位于分区 2 | 点击“安装”按钮、切换“同步到云端”复选框 | 按钮显示正常；复选框切换并写入日志 | 否 | Pass |
| 列表项 V1 单选与双图标 | 位于分区 2 | 切换“默认铃声”单选，分别点击“收藏与分享”两个图标 | 单选切换写入日志；两个图标各自触发独立回调并区分为第一个 / 第二个 | 否 | Pass |
| 列表项 V1 三行文本与 BADGE | 位于分区 2 | 观察“未读消息”行 | BADGE 档位显示 8vp 小图标，description 换行展示，右侧文本操作区显示“3 条” | 否 | Pass |
| 列表项 V1 PREVIEW 与图片操作区 | 位于分区 2 | 观察“图片预览”行 | 内容区使用 96vp 预览图档位，操作区显示图片 | 否 | Pass |
| 列表项 V2 toggle 联动数据 | 位于分区 3 | 切换任一联系人的 toggle | 数据仓库在线状态更新、列表刷新，日志记录切换结果，标题栏副标题同步 | 否 | Pass |
| 列表项 V2 按钮与箭头 | 位于分区 3 | 点击“检查”按钮、点击“关于本机”箭头 | 按钮响应；箭头回调写入日志 | 否 | Pass |
| 列表项 V2 复选框与双图标 | 位于分区 3 | 切换“多选模式”复选框，分别点击两个图标 | 复选框与两个图标回调均写入日志 | 否 | Pass |
| 列表项 V2 三行文本与 PREVIEW | 位于分区 3 | 观察“图片预览”行 | PREVIEW 档位与 `primaryText` + `secondaryText` + `description` 三行文本正常展示 | 否 | Pass |
| 断点自适应布局 | 设备已启动 | 观察 480×853vp 竖屏与 ≥600vp 窗口 | `sm` 单栏、日志固定 200vp；`md/lg` 左右双栏、日志占 38%，切换时日志记录断点 | 否 | Pass |
| 日志面板容量与置顶 | 位于首页 | 连续操作产生超过 120 条日志 | 最新日志置顶，最多保留 120 条 | 否 | Pass |
| ContactStore 联系人仓库 | 设备侧测试环境 | 执行 `ListModels.test.ets` 中 ContactStore 相关 15 条用例 | 增删、缺失删除、在线切换、搜索（特殊字符 / 部分关键字）、副本返回、清空、findById、id 不复用与单调递增均符合预期 | 是 | Pass |
| ListConfigFactory 配置工厂 | 设备侧测试环境 | 执行配置工厂相关 20 条用例 | V1/V2 内容项（含三行文本）、8 种操作区、菜单项、图标透传与回调触发字段映射正确 | 是 | Pass |
| LogUtil 日志双通道 | 设备侧测试环境 | 执行 `LogUtil.test.ets` 9 条用例 | 回调投递、行格式含时间戳、级别过滤与标记、时间补零、错误级别投递、重复 init 替换回调、省略级别保持最小值 | 是 | Pass |
| DeviceUtil 设备与断点 | 设备侧测试环境 | 执行 `DeviceUtil.test.ets` 9 条用例 | 设备类型非空、形态互斥、断点边界（599 / 600 / 839 / 840）、档案字段、宽屏与双栏阈值一致、极值 | 是 | Pass |
| Ability 冒烟 | 设备侧测试环境 | 执行 `Ability.test.ets` 1 条用例 | 用例通过 | 是 | Pass |

## 执行方式

设备侧测试（签名由 DevEco Studio 自动签名或本地签名材料提供）：

```bash
"<DevEco Studio>/tools/node/node" "<DevEco Studio>/tools/hvigor/bin/hvigorw.js" \
  assembleHap --mode module -p module=entry@ohosTest -p product=default --no-daemon
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap
hdc shell aa test -b com.samples.composelistandtitledemo -m entry_test \
  -s unittest OpenHarmonyTestRunner -s timeout 150000
```

查看应用日志：

```bash
hdc shell hilog | grep ComposeList
```

## 验证结果

`Tests run: 54, Failure: 0, Error: 0, Pass: 54`（4 个套件：ListModels 35、LogUtil 9、DeviceUtil 9、Ability 1）。

## 补充说明

- 设备侧用例全部为纯逻辑验证（联系人仓库、配置工厂、日志、设备档案），不依赖 UI 树，也不包含 UI 自动化用例；界面行为由上表中标为「否」的手工用例覆盖。
- `entry/src/test/` 仅包含模板自带的 1 条本地冒烟用例，功能验证以 `entry/src/ohosTest` 下的 54 条设备侧用例为准。
- ComposeListItemV2、ComposeTitleBarV2 为 API 26 新增组件，低于 API 26 的设备上 V2 分区不可用，测试环境需使用 API 26 镜像。
- hilog tag 有 `ComposeListTitle`（LogUtil）与 `ComposeListAndTitle`（EntryAbility）两个，排查日志时使用 `grep ComposeList` 可同时覆盖。
