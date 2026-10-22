# NativePrintFile 测试用例

编译、静态检查、UI 自动化执行和实际打印是不同的验收阶段。未执行的项目保留待验证状态，不以构建成功代替运行结果。

## 本机检查（2026-10-21）

| 项目 | 当前结果 |
| --- | --- |
| API 24 主模块编译 | 通过，最新代码生成未签名 HAP |
| API 24 ohosTest 模块编译 | 通过，最新代码生成未签名测试 HAP |
| 文档同源检查 | 通过，18 组标签及代码块与本地源码逐字符一致；未运行远端 SampleCodeAccuracy CI |
| 资源及 README 链接检查 | 通过，base/en_US/zh_CN 各 71 个同名字符串资源；README 本地源码链接有效 |
| 二进制登记及差异格式检查 | 通过，JPEG/PDF 和 3 张实机截图已在 OAT 登记，相关文件的 git diff --check 通过 |
| CodeLinter | 通过，按工程现有配置检查 7 个主 ETS 文件及工程；eslintAgent、performanceAgent、arkPerfCheck 均完成，0 缺陷；不包含配置中排除的 ohosTest，也不替代 C++ 编译 |

构建环境：DevEco Studio 6.1.1.280、OpenHarmony API 24 SDK 组件 6.1.1.125、`runtimeOS: OpenHarmony`。Sample 保持未签名，未在 Sample 中保存签名材料或 `local.properties`。CodeLinter 使用可识别的本机 SDK 目录完成检查，未通过关闭规则或跳过引擎取得结果。

实机调试使用独立工程 `print_ndk_demo` 的既有签名和包名 `com.ohos.newndkdemo`，同步本示例的 Native、ArkTS、资源及 4 条测试用例；保留调试工程原有 `runtimeOS: HarmonyOS`、6.1.1(24) 产品配置。这是同源代码在调试工程中的运行验证，不是未签名 Sample 原包的安装证明。设备为 HUAWEI MateBook Pro，系统 OpenHarmony-7.0.0.108 / API 26；网络打印机为 Pantum M6700DW Plus Series。

## UI 自动化（可在支持的模拟器或真机执行）

前置条件：安装应用和测试包，保持设备屏幕解锁且不显示屏保，从首次启动的页面开始，不手动选择打印机。用例使用 `NativePrintFile_功能_序号` 命名，日志 TAG 为 `[Sample_NativePrintFile]`，DOMAIN 为 `0xF811`；每条用例包含开始、结束和断言参数日志。

| 用例 | 操作 | 预期结果 | 当前结果 |
| --- | --- | --- | --- |
| NativePrintFile_ControlsAndDialog_001 | 查看文件、打印机和三种打印入口；打开并取消打印机弹窗 | 核心控件可找到，弹窗可打开关闭，不选择打印机 | 通过 |
| NativePrintFile_FileSelection_002 | 选择 PDF | 当前文件显示为 `printDemo.pdf` | 通过 |
| NativePrintFile_PrintSettings_003 | 增加份数；切换相片纸/普通纸；启用无边距 | 份数变为 2；纸张类型显示与选择一致；四边距归零并禁用输入 | 通过 |
| NativePrintFile_NoPrinter_004 | 未选择打印机时点击直接打印 | 返回错误码 `24300005`，应用不崩溃 | 通过 |

每条用例开始前滚动回页面顶部；设置用例恢复份数、纸张类型和无边距开关。UI 自动化只验证页面行为，不证明参数已被驱动接受或打印机已出纸。

最新源码在上述设备的调试工程中运行结果：`Tests run: 4, Failure: 0, Error: 0, Pass: 4, Ignore: 0`，测试套件耗时 71.360 秒。真机回归修复了弹窗控制器创建位置导致的运行异常、无边距输入值未更新、下拉框初始文字缺失，以及打印机状态更新重置纸张选择的问题；未以构建成功替代 UI 执行。

## 必须真机验证

前置条件：OpenHarmony API 24 及以上的目标设备、可用的 Print Extension 和受支持的物理打印机。记录设备/系统版本、打印机型号、操作步骤、实际结果和相关日志。

| 项目 | 操作 | 验收标准 | 当前结果 |
| --- | --- | --- | --- |
| 发现、连接与弹窗实时刷新 | 保持弹窗打开，新增/断开打印机，观察状态变化并连接 | 无需重开弹窗即可显示新增、丢失和状态更新；连接回调正确更新选中项 | 已发现并连接奔图网络打印机，回调更新选中项；新增/断开场景未执行 |
| 纸张类型和打印参数生效 | 使用支持的纸张类型，分别提交普通纸、相片纸任务；验证份数、单双面、方向、边距及受支持的无边距组合 | 任务参数正确到达驱动，实际输出符合所选参数；不支持的组合有可解释结果 | 已核对作业 45 的 A4、普通纸、1 份、黑白、单面参数到达 CUPS/filter；打印机报告缺纸，实际输出未确认；该 PPD 未声明相片纸，未提交相片纸任务 |
| 属性查询、更新与恢复 | 使用目标系统支持的 Key 操作；检查空 ID 等无效参数及查询失败 | 正确返回属性数组；无效参数返回 401 且 properties 为 []；失败不覆盖页面值；更新/恢复需核对实际值 | 待真机执行 |
| JPEG/PDF 直接打印 | 分别打印内置 JPEG 和 PDF | 任务成功提交、实际出纸，内容正确；不能仅根据 API 返回 0 判定成功 | JPEG 直接打印返回 0，修复后作业 45 使用 A4；因打印机报告缺纸，未完成出纸验证。PDF 直接打印未执行 |
| 状态回调打印 | 分别触发成功、失败、取消、阻塞后恢复 | API 24 状态 0/1/2/3 语义正确；阻塞后仍可收到终态，终态与实际任务一致 | PDF 回调打印返回 0 并生成作业 44；修复纸张重置前已取消该任务，不计为成功。四类回调及阻塞恢复仍待验证 |
| 系统 PDF 预览 | JPEG 下点击预览，再选 PDF；验证布局写入、打印、取消和关闭 | JPEG 提示选择 PDF；PDF 正确预览；每次写入回调一次，writeCode 为 0/1；预览销毁不作为出纸成功 | JPEG 保护提示通过；PDF 正确显示 1 页，writeCode=0；关闭返回 state=5。未从预览提交任务，未验证每次布局回调计数 |
| 生命周期和资源释放 | 反复进入退出、开始停止发现、打开关闭预览并提交任务 | 无崩溃、残留回调及持续增长的文件描述符/Native 资源占用 | 待真机执行 |
| 多设备布局、语言和效果图 | 在目标手机、tablet、2in1 上检查中英文页面、设置和弹窗，并截取实际效果图 | 布局与交互可用；README 补充不超过 4 个真机效果图 | 已补充 MateBook Pro 中文页面的 3 张真实截图；手机、tablet 与英文布局未验证 |

### 本次打印证据与限制

- 网络队列：`Pantum_M6700DW_Plus_Series_4DC825`，打印机地址 `192.168.2.64:631/ipp/print`。实际使用设备已安装 PPD，普通纸对应 `Stationery`，驱动为 `bsUniFilter` / `bsUniBackend`；不以本地参考 PPD 代替设备配置。
- 首轮作业 43（JPEG）和 44（PDF 回调）暴露状态更新重置纸张的问题：页面选 A4 后被重置为 Letter。问题修复后，查询详情及后续状态变化保留 A4；复测作业 45 的实际参数为 `media=iso_a4_210x297mm,stationery,auto`、`media-type=stationery`、`print-color-mode=monochrome`、`sides=one-sided`、1 份。
- JPEG 作业已进入 `imagetopdf -> bsUniFilter -> bsUniBackend` 链路，但奔图持续报告 `media-empty-error / media-needed-error`，没有实际出纸确认。PPD 中的 `PageSize=A4.Borderless` 是驱动选项名，不能据此认定物理无边距打印已经验证。
- 本次测试作业 43、44、45 已逐项取消，CUPS 活动队列为空，避免补纸后意外出纸。需现场检查 A4 纸、进纸状态和面板提示，恢复就绪后重新验证 JPEG/PDF 实际输出及成功回调。
- 已保存设备 HILOG、CUPS 作业日志和真实界面截图。未更改系统日志级别；设备无 `tcpdump`，本次没有网络抓包证据。
- 额外观察：本机 `OH_Print_LaunchPrinterManager` 返回 `24300001`，未将该入口标记为通过；系统设置中的打印管理可手动打开。属性更新/恢复和资源泄漏专项测试仍未执行。
