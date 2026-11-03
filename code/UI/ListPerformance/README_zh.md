# 长列表性能（ListPerformance）

### 介绍

本示例基于 API 26，演示长列表的占位渲染与内容预取：

- 占位注册：通过 `PlaceholderRegistry` 维护每一行的加载状态，未加载行由 `LazyForEach` 渲染骨架占位，加载后切换为真实内容；
- [Prefetcher](https://docs.openharmony.cn/pages/v6.0/zh-cn/application-dev/reference/apis-arkui/js-apis-arkui-Prefetcher.md)：使用 `BasicPrefetcher` 与实现 `IDataSourcePrefetching` 的数据源，提前加载即将进入可视区的条目；
- 长列表：200 条数据、分批加载、滚动窗口预取、预取统计与清空；
- 设备适配：首页按断点 1/2 栏排列并展示设备信息，列表使用弹性高度与 `cachedCount`。

> **说明**：SDK 26.0.0 未导出 `@ohos.arkui.placeholderRegister` 模块；示例使用 `PlaceholderRegistry + LazyForEach` 实现等价的占位登记与替换逻辑，接口隔离在 `utils/PlaceholderRegistry.ts`，后续 SDK 提供该模块时可直接替换实现。

工程包含占位/批次/预取状态、设备信息与响应式断点工具类，包含 95 条 ohosTest 用例与 7 条本地工具单测。

### 功能特性

- 占位列表：PlaceholderRegistry 记录行加载状态，LazyForEach 渲染骨架/内容；
- 分批加载：默认 20 条，加载更多、重置、Loaded/Remaining/Actions 统计；
- 预取列表：BasicPrefetcher + IDataSourcePrefetching，预取下一条与滚动窗口补充；
- 操作历史：最近 3 条加载/预取操作、清空、Toast 反馈；
- 工具类：占位控制器、数据源、预取窗口、批次与状态格式化；
- 响应式布局：断点边距、弹性列表、cachedCount；
- 说明：SDK 26.0.0 未导出 placeholderRegister，使用等价占位注册实现。

### 交互说明

| 页面 | 主要操作 | 反馈 |
|---|---|---|
| PlaceholderList | 加载更多、重置 | 已加载/剩余/动作统计与骨架替换 |
| PrefetchList | 预取下一条、清空统计、滚动 | 预取数、已加载数、状态文本更新 |

### 实现架构

```text
页面 -> PlaceholderController/PrefetchDataSource
     -> PlaceholderRegistry、ListDataUtils、PrefetchUtils
     -> BreakpointUtils、DeviceInfoUtils、Logger
```

### 测试覆盖

| 类型 | 数量 | 说明 |
|---|---:|---|
| ohosTest | 95 | 入口、占位列表、预取列表、边界、稳定性、逻辑 |
| 本地单测 | 7 | 占位注册、批次、预取窗口、断点 |

### 效果预览

| 首页 | PlaceholderList |
|:---:|:---:|
| <img src="screenshots/index.jpeg" width="360" /> | <img src="screenshots/placeholderList.jpeg" width="360" /> |

> 截图基于 OpenHarmony 7.0.0.47 真机（API 26）拍摄。

### 工程目录

```
entry/src/main/ets/
|---entryability
|   |---EntryAbility.ets                   // 应用入口（含窗口尺寸日志）
|---pages
|   |---Index.ets                          // 首页：入口、断点与设备信息
|   |---PlaceholderListDemo.ets            // 占位列表：骨架/加载更多/重置
|   |---PrefetchListDemo.ets               // 预取列表：BasicPrefetcher/预取统计
|---utils
|   |---Constants.ts                       // 路由、总数/批次/预取常量
|   |---BreakpointUtils.ts                 // 断点/栏数/Grid 模板/内容边距
|   |---ListDataUtils.ts                   // 条目标题、批次、状态格式化
|   |---PlaceholderRegistry.ts             // 占位注册：加载标记/范围/计数/重置
|   |---PlaceholderController.ts            // 占位加载/重置/状态与日志编排
|   |---PrefetchUtils.ts                   // 预取窗口索引与日志描述
|   |---ListDataSources.ts                 // LazyForEach 数据源与 IDataSourcePrefetching 实现
|   |---DeviceInfoUtils.ts                 // 设备类型/屏幕/方向信息
|---util
|   |---Logger.ts                          // 统一日志
entry/src/ohosTest/ets/
|---testkit/SharedDriver.ets               // 测试驱动与断言封装
|---test/*.test.ets                        // 功能、稳定性与逻辑单测
entry/src/test/
|---UtilsUnit.test.ets                    // 工具类本地单元测试
```

### 具体实现

- 占位注册：`PlaceholderRegistry` 以布尔数组记录每行加载状态，支持单条/范围注册、计数与重置；`PlaceholderController` 编排加载/重置与日志，`ListDataSource` 在 `getData` 中按注册状态返回骨架或真实行，加载后 `notifyReload`，源码参考：[PlaceholderRegistry.ts](entry/src/main/ets/utils/PlaceholderRegistry.ts)、[PlaceholderListDemo.ets](entry/src/main/ets/pages/PlaceholderListDemo.ets)；
- 预取：`PrefetchDataSource` 实现 `IDataSourcePrefetching.prefetch`，同步登记数据并回调统计；`PrefetchUtils.nextIndices` 计算滚动窗口后 3 条，页面绑定 `BasicPrefetcher`，点击按钮预取下一条，滚动时补充预取，源码参考：[ListDataSources.ts](entry/src/main/ets/utils/ListDataSources.ts)、[PrefetchListDemo.ets](entry/src/main/ets/pages/PrefetchListDemo.ets)；
- 工具与适配：`ListDataUtils` 负责条目文案、批次边界与状态文本；`BreakpointUtils.contentPadding` 随断点调整首页边距；`DeviceInfoUtils` 获取设备与屏幕信息；`Logger` 统一生命周期、初始加载、加载更多、预取与滚动窗口日志；
- 防抖与日志：预取回调只更新计数与状态，避免在预取过程中频繁重建列表；滚动日志记录可视区范围。

### 相关权限

不涉及。

### 依赖

不涉及。

### 约束与限制

1. 本示例仅支持标准系统上运行，支持设备：RK3568、手机、平板、2in1；
2. 本示例基于 ArkTS 1.1 动态环境开发，已适配 API version 26 版本 SDK，版本号：26.0.0；
3. 本示例需要使用 DevEco Studio 26.0.0 及以上版本才可编译运行；
4. SDK 26.0.0 未导出 `@ohos.arkui.placeholderRegister`，占位能力由 `PlaceholderRegistry` 等价实现；`BasicPrefetcher` 自 API 12 起可用；
5. 本示例包含 95 条 ohosTest 用例，另有 7 条本地工具单测，用例说明见 [ohosTest.md](ohosTest.md)；
6. 工程已配置本机 DevEco 调试签名，可直接在 IDE 部署；提交仓库前请清空 `signingConfigs` 并重新自动签名；

### 下载

如需单独下载本工程，执行如下命令：

```
git init
git config core.sparsecheckout true
echo code/UI/ListPerformance/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```