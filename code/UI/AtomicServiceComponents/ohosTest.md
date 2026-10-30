# AtomicServiceComponents 测试用例归档

## 测试环境

- 设备：RK3568 开发板（DAYU200），OpenHarmony 7.0.0.46 / API 26
- 应用：`com.example.atomicservicecomponents`
- 测试框架：Hypium，测试模块 `entry_test`，执行器 `OpenHarmonyTestRunner`
- 开发环境：DevEco Studio 6.1.1，编译 SDK API 26，`compatibleSdkVersion 6.1.1(24)`

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| --- | --- | --- | --- | --- | --- |
| 应用启动与首页渲染 | 设备已安装应用 | 启动 `EntryAbility` | 首页正常显示设备 profile、组件目录、搜索区和事件日志 | 否 | Pass |
| 首页关键字过滤 | 位于首页 | 输入关键字 `web` | 组件目录仅保留 `AtomicServiceWeb`，日志记录命中数量 | 否 | Pass |
| 首页分类与组合过滤 | 位于首页 | 切换分类「交互」，再组合关键字 | 结果同时满足分类与关键字条件，清空后恢复完整目录 | 否 | Pass |
| 首页组件卡片跳转 | 位于首页 | 点击任一组件卡片 | 进入对应演示页，日志记录打开的组件名 | 否 | Pass |
| Search 页搜索与选择 | 位于 Search 演示页 | 输入关键字、切换分类 | 匹配结果实时更新，日志记录关键字、分类与命中数 | 否 | Pass |
| Search 页结果跳转 | 位于 Search 演示页 | 点击任一匹配结果 | 进入对应组件演示页，日志记录导航动作 | 否 | Pass |
| Navigation 标题与渐变切换 | 位于 Navigation 演示页 | 切换标题预设、开关渐变背景 | 标题与背景即时变化，日志记录切换结果 | 否 | Pass |
| Navigation 分栏与隐藏标题栏 | 位于 Navigation 演示页 | 开启 Split 分栏、隐藏标题栏后返回 | 分栏生效；隐藏标题栏后仍可正常返回，导航栈判空不崩溃 | 否 | Pass |
| Navigation 恢复默认 | 位于 Navigation 演示页，已修改多项配置 | 点击“恢复默认” | 按设备 profile 重新计算，dayu200 回落为分栏关闭 | 否 | Pass |
| Tabs 页签切换 | 位于 Tabs 演示页 | 点击三个页签或按钮切换 | 内容随页签切换，`onTabBarClick` / `onChange` 写入日志 | 否 | Pass |
| Tabs 锁定拦截 | 位于 Tabs 演示页 | 开启锁定后点击其他页签或按钮 | 保持当前页签，日志记录 WARN 与“尝试 x → y，被拦截” | 否 | Pass |
| Web 本地资源完整性 | 已完成 HAP 构建 | 读取打包后的 `index.html`、`page2.html` | 两个文件均存在、内容标记正确，`index.html` 含跳转链接 | 是 | Pass |
| Web 页面加载与互跳 | 位于 Web 演示页 | 点击“前往第二页”、后退、前进 | 两页正常切换，`onPageBegin` / `onPageEnd` 写入日志 | 否 | Pass |
| Web 控制器刷新 | 位于 Web 演示页 | 点击刷新 | 页面重新加载，进度按 25% 分档记录（10% / 70% / 100%） | 否 | Pass |
| Web H5 消息 | 位于 Web 演示页 | 点击 H5“向 ArkTS 发送消息” | JS SDK 可用时回调写入日志；未注入时页面状态区给出提示 | 否 | Pass |
| Download 开发板沙箱写入 | 位于 Download 演示页（`deviceType=default`） | 点击下载按钮 | 不调用选择器，文本写入 `filesDir`，页面显示真实路径 | 是 | Pass |
| Download 超时降级逻辑 | 设备侧单元环境 | 构造选择器超时与迟到回调 | 3 秒后降级沙箱，过期 attempt 回调被丢弃 | 是 | Pass |
| HalfScreen 占位 appId 降级 | 位于 HalfScreen 演示页 | 点击拉起组件 | 触发 `onError`（16000050），页面与日志显示错误码及“属预期”说明 | 否 | Pass |
| 日志面板展示与清空 | 任一演示页 | 产生若干日志后点击清空 | 面板清空，后续操作继续正常记日志 | 否 | Pass |
| Logger 双通道往返 | 设备侧单元环境 | 调用 `Logger.warn` 后读取 `AppStorage('appLogs')` | source / level / detail 正确，清空后为 0 条 | 是 | Pass |
| 设备 profile 与断点 | 设备已启动 | 读取真实 display 快照 | 断点与宽高自洽；dayu200 判定为不可用选择器形态 | 是 | Pass |
| 沙箱文件读写 | 设备侧单元环境 | 写入文本、读回、删除；再传入空 `filesDir` | 内容一致，删除后不存在，空路径被拒绝 | 是 | Pass |
| 本地纯逻辑单测 | 开发机 | 执行 `entry@default` 测试任务 | 89 条用例全部通过 | 是 | Pass |
| 开发板集成测试 | RK3568 已连接 | 执行 `entry@ohosTest` 测试任务 | 89 条用例全部通过 | 是 | Pass |

## 执行方式

设备侧测试：

```bash
"<DevEco Studio>/tools/node/node" "<DevEco Studio>/tools/hvigor/bin/hvigorw.js" \
  assembleHap --mode module -p module=entry@ohosTest -p product=default --no-daemon
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap
hdc shell aa test -b com.example.atomicservicecomponents -m entry_test \
  -s unittest OpenHarmonyTestRunner -s timeout 150000
```

本地纯逻辑测试：

```bash
"<DevEco Studio>/tools/node/node" "<DevEco Studio>/tools/hvigor/bin/hvigorw.js" \
  test --mode module -p module=entry@default -p product=default --no-daemon
```

验证结果：本地 `Tests run: 89, Failure: 0, Error: 0, Pass: 89`；开发板 `Tests run: 89, Failure: 0, Error: 0, Pass: 89`。
