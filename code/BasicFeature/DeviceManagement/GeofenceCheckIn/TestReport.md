# 地理围栏签到测试报告

## 测试环境

| 项目 | 信息 |
| --- | --- |
| 设备型号 | ohos（rk 开发板，720×1280） |
| 系统版本 | OpenHarmony 7.0.0.39 |
| SDK 版本 | 26.0.0（API 26） |
| 应用包名 | com.samples.geofencecheckin |
| 测试类型 | ohosTest UI 自动化，本地单元测试 |

> 前置条件：地理围栏依赖 GNSS 芯片能力，模拟器可能不支持。UI 自动化用例不依赖真实围栏事件，通过页面“模拟进入”“模拟离开”完成签到流程验证。应用首次启动会自动弹出前台定位与通知授权框，用例初始化阶段会自动点击「允许/仅使用期间允许」关闭弹窗后再执行断言；输入框聚焦会弹出软键盘（kikakeyboard，rk 板第三方键盘在“焦点从输入框转移”时收起会挂死，因此保存动作前统一用 Back 收起键盘、且 Back 后校验主页面存在以自愈）。
>
> 耗时约束：hypium 单用例超时由运行参数决定（当前 15000ms，1.0.25 不支持按用例配置），超时强杀时若有 uitest 调用在飞会锁死单通道，后续用例全部报 `uitest-api dose not allow calling concurrently`。本机实测：一次 `inputText` 约 1.6–1.9s，一次 `swipe` 约 2–3s，`Component.scrollToTop()` 约 4–9s，因此冷启动保存用例只输入纬度与经度（半径默认 200 已合法、名称非校验必填），把该用例控制在 10.5s 内。
>
> 滚动寻址：uitest 的 `findComponent` 只命中当前视口内的节点，`locate` 在首屏找不到时先下滑一屏、再上滑回顶重试；`ensurePageTop` 会在需要顶部控件的用例开头把页面拉回首屏。testSaveConfig0001 填写的配置在后续用例间复用（prepareConfig 比对经纬度文本决定是否重新输入，但每次都执行保存以保证状态提示存在）；testInvalidParams0001 清空纬度的操作放在最后一个执行以避免影响签到类用例；若设备已授予相关权限，仅影响“权限与定位”卡片的展示状态，不影响用例断言。无可用 GNSS 的设备上，“当前位置”会提示未获取到定位结果（3301200），“开启围栏”会提示位置服务暂不可用（3301000），属于设备能力限制，用例未覆盖这两个分支。

## UI 自动化用例

用例文件：[entry/src/ohosTest/ets/test/GeofenceCheckIn.test.ets](entry/src/ohosTest/ets/test/GeofenceCheckIn.test.ets)

| 序号 | 用例名称 | 测试场景 | 操作步骤 | 预期结果 | 测试结果 |
| --- | --- | --- | --- | --- | --- |
| 1 | testStartAbility0001 | 应用启动 | 启动应用并等待首页加载 | 主页面、标题、围栏状态卡片均存在，标题文本非空 | 通过（0.25s） |
| 2 | testSaveConfig0001 | 保存围栏参数 | 填写经纬度（半径取默认 200），收起键盘后点击保存参数 | 页面提示文本非空，模拟进入按钮变为可用 | 通过（冷启动 10.5s / 配置已存在 2.0s） |
| 3 | testSimulateCheckIn0001 | 模拟进入围栏 | 保存参数后点击模拟进入 | 页面提示非空，签到记录列表出现且宽度大于 0 | 通过（6.8s） |
| 4 | testSimulateCheckOut0001 | 模拟离开围栏 | 点击模拟离开 | 页面提示非空，签到记录列表仍然存在 | 通过（7.8s） |
| 5 | testClearRecords0001 | 清空签到记录 | 点击签到记录区域的清空按钮 | 记录列表切换为空状态 | 通过（2.1s） |
| 6 | testResponsiveLayout0001 | 手机与平板布局 | 分别在手机、平板上查看设置卡片与权限卡片 | 两张卡片均存在且宽度大于 0 | 通过（2.7s） |
| 7 | testInvalidParams0001 | 非法参数校验 | 清空纬度后点击保存参数 | 页面给出参数不合法提示 | 通过（7.6s） |

## 本地单元测试

用例文件：[Library/src/test/TimeUtil.test.ets](Library/src/test/TimeUtil.test.ets)

| 序号 | 用例名称 | 测试场景 | 预期结果 | 测试结果 |
| --- | --- | --- | --- | --- |
| 1 | testPadTwo0001 | 两位数补零 | 9 补零后为 09，12 保持 12 | 待执行 |
| 2 | testFormatDuration0001 | 停留时长格式化 | 3661000 毫秒格式化为 01:01:01，0 毫秒为 00:00:00 | 待执行 |
| 3 | testFormatTime0001 | 时间格式化 | 时间戳格式化为 03:04:05 | 待执行 |
| 4 | testGetDayStart0001 | 当天零点计算 | 结果小时数为 0 且早于原始时间戳 | 待执行 |

## 测试结论

UI 自动化用例在 rk 开发板（OpenHarmony 7.0.0.39，API 26）上连续两轮全绿：冷启动（清空应用数据）7 通过 / 0 失败，总耗时 37.7s，单用例最长 10.5s；配置已存在的热启动 7 通过 / 0 失败，总耗时 29.0s，单用例最长 7.6s。单用例耗时均低于 15000ms 上限，未再出现 `execute timeout` 与 `uitest-api dose not allow calling concurrently`。

本地单元测试（TimeUtil）本次未执行，需另行运行 `hvigorw test` 或 DevEco 的 Local Test 配置确认。
