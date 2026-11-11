# 应用性能（AppPerformance）

[English](README.md) · [测试用例与待验证清单](ohosTest.md)

## 介绍

本示例基于 OpenHarmony Stage 模型，演示应用文件页回收请求、应用快启（HyperSnap）控制、真实业务负载实验及有条件比较。它把“请求结果”“资源完整性”“阶段耗时”和“能否观测实际回收效果”分别记录，不把成功回调等同于已回收内存。

主要功能：

- 发现已安装文件、模块目标，调用 `appMemoryOptimizer.evictFilePages` / `evictModuleFilePages`；允许输入符合校验规则的文件名。
- 开启、关闭 HyperSnap，发起重建请求并进行本地冷却控制。
- 六阶段维护流程：发现目标 → 校验配置 → 读取负载 → 对照/请求回收 → 同资源重读 → 配置回读。
- 文本、笔记列表、图片索引、表单草稿四类打包负载；有界账本记录条件、完整性、校验值、耗时和缺口。
- 1–10 次串行重复实验（默认 3 次）；“本次完成后停止”与“取消本地等待”具有不同语义；历史系列按自身引用取样，不借用其他系列记录。
- 同条件统计、阈值和回归检查，脱敏 Markdown / CSV 报告及账本复制。
- 独立记录真实 `AbilityStage.onLaunchFromHyperSnap` 回调；测试模块含 C++ N-API 文件页探针。

> **测量边界**：页面内容加载完成耗时不等于点击到首帧耗时，也不证明系统实际走了 HyperSnap 路径。回收请求成功不证明实际释放了多少内存。缺失样本不能当作 0；不具备条件的记录不得强行比较。

## 效果预览

本次修订没有经过验证的运行截图，因此不提供生成图片或伪造的 PASS 截图。主页面包含“内存优化、应用快启、调用记录、维护计划、检查结果”五个页签；负载实验台包含单次实验、重复实验、历史账本、比较和报告复制。后续应在真实设备分别以英文、简体中文补拍截图，并记录设备、系统、应用版本和测试时间。

## 使用说明

1. 在支持 OpenHarmony 的 DevEco Studio 中打开工程，使用自己的调试签名。工程 `signingConfigs` 为空，product 仍引用 `default`；部署前需在本地配置对应签名，不能把本机密钥提交到仓库。
2. 启动应用，在内存优化页刷新目标。选择真实已安装文件/模块，或输入合法 `.so`、`.hap`、`.hsp` 文件名；目录不可枚举时仅提供能验证存在的目标，不捏造安装路径。
3. 建议先运行“无回收对照”，然后在同设备、版本、前后台、目标和资源内容条件下执行文件/模块回收实验。先查看请求结果和资源完整性，再查看统计。
4. 在实验台选择负载及模式；运行一次或设置重复次数。取消仅停止本地等待，不能中止已经发给 SDK 的请求；原请求未结束前保持隔离，不自动重发。
5. 仅在确实希望改变当前应用快启设置时使用开启、关闭和重建。重建成功回调不代表已经产生新快照，也不保证下一次由快启启动。
6. 按需复制调用记录、内容加载采样、脱敏账本或所选系列报告。清空操作仅清理对应本地记录，不修改系统设置。分享前应再次检查复制内容是否包含设备或业务信息。

## 工程目录

```text
AppScope/                             应用标识及中英文应用名称
entry/src/main/ets/
  entryability/EntryAbility.ets        生命周期与页面加载
  entrystage/EntryStage.ets            启动路径证据
  pages/Index.ets                      主工具页面
  pages/WorkloadLabPage.ets            业务负载实验台
  components/                         响应式卡片、系列及历史组件
  core/AppPlatform.ets                平台接口与 Preferences 边界
  core/AppService.ets                 请求、实验、系列所有权及持久化
  core/SafeExecutor.ets               超时、取消、未结束请求隔离
  core/Experiment*.ets                实验账本与系列
  core/report/                        条件、统计、脱敏报告
  core/Logger.ets                     统一日志
  core/UiText.ets                     当前UI上下文资源解析及历史值显示
entry/src/main/cpp/                   pageprobe 实现及 N-API 类型声明
entry/src/main/resources/             base/zh_CN 文案、配置、业务负载
entry/src/ohosTest/                   用例、平台夹具、UI清理支持及独立探针Runner
```

## 具体实现

- 平台边界：[AppPlatform.ets](entry/src/main/ets/core/AppPlatform.ets) 将资源读取、图片解码、文件目标、Preferences、剪贴板、快启和回收 API 收敛为可替换接口；测试可以替换 I/O，但不能把 FakePlatform 结果称为系统 API 测量。
- 服务编排：[AppService.ets](entry/src/main/ets/core/AppService.ets) 管理并发限制、冷却、有界记录、流程、系列所有权和落盘；[SafeExecutor.ets](entry/src/main/ets/core/SafeExecutor.ets) 只结束本地等待，不声称取消原始 SDK Promise。
- 实验账本：[ExperimentLedger.ets](entry/src/main/ets/core/ExperimentLedger.ets) 校验恢复记录并按同条件分组；[ExperimentSeries.ets](entry/src/main/ets/core/ExperimentSeries.ets) 约束系列次数和状态。失败、缺口与元信息淘汰显式呈现。
- 报告：[ReportExport.ets](entry/src/main/ets/core/report/ReportExport.ets) 对路径、凭据等进行脱敏和长度限制，校验不通过时不返回可交付报告；条件不足时不制造可比结论。
- 日志：[Logger.ets](entry/src/main/ets/core/Logger.ets) 使用 `DOMAIN = 0xF811`、`TAG = [Sample_AppPerformance]`。路由失败、图片释放失败等记录英文诊断；释放失败仍不能阻断其他资源清理。
- Native：[pageprobe.cpp](entry/src/main/cpp/pageprobe.cpp) 暴露只读文件采样、私有文件校准、持有映射采样等接口。本轮只补完整版权主体/年份，不改 native 行为。`mincore` 的原始结果需要可信性判断；私有文件校准通过不意味着已安装 HAP 可观测。pagemap PRESENT 是所持映射的状态，不是全局缓存回收量。

## 相关权限与依赖

主模块没有声明 `requestPermissions`。这不代表所有目标或 API 必然可用：设备支持、系统策略、文件访问、pagemap 和测量可观测性仍需逐项检查真实返回。

工程声明 Hypium `1.0.25`，使用工具链提供的 Hvigor OpenHarmony 插件，依赖本地 `libpageprobe.so`，配置了 CMake/N-API native 构建路径。未声明额外网络权限。

## 约束、修订范围与未完成项

1. 配置保留 compile/target/compatible SDK `26.0.0`、`runtimeOS: OpenHarmony`、`deviceTypes: [default]` 及 `modelVersion: 26.0.0`。这里记录配置事实，不宣称本轮已经构建或部署。
2. **当前状态：修改后的文件未编译、未构建、未运行。** 用户最新指令禁止继续编译、构建检查、类型检查、转译、应用测试和真机操作，后续仅进行文本、JSON、资源引用及差异检查；这些不是测试 PASS，也不代表本会话更早时点从未进行过工具链探查。
3. 主页面/组件的静态按钮、页签、对话框、计数、负载选择等使用默认英文与 `zh_CN` 资源；string API 通过当前 UI 上下文的 ResourceManager 解析，不在模块加载时缓存语言。历史状态值在显示边界映射，不更改序列化结果。
4. **国际化仍未全部完成，不能视为完全满足“非注释中文清零”门禁。** 具体待处理区域：
   - [AppService.ets](entry/src/main/ets/core/AppService.ets) 的动态 notice、阶段 detail、配置/错误说明和报告标题；其中部分写入调用记录或账本，需将消息身份/参数与历史消息文本分离，兼容旧记录，而不是对所有中文做替换。
   - [SeriesPresentation.ets](entry/src/main/ets/core/SeriesPresentation.ets)、[SeriesHistoryPresentation.ets](entry/src/main/ets/core/SeriesHistoryPresentation.ets)、[SeriesHistoryController.ets](entry/src/main/ets/core/SeriesHistoryController.ets) 仍拼接中文进度、可用引用、保存提示及历史反馈。这些主要是纯展示文本，不属于全部豁免的协议字段；需继续资源化并同步按文本断言的用例。
   - [LaunchBudget.ets](entry/src/main/ets/core/LaunchBudget.ets)、[LoadProfile.ets](entry/src/main/ets/core/LoadProfile.ets)、[MaintenancePlan.ets](entry/src/main/ets/core/MaintenancePlan.ets)、[ThresholdCatalog.ets](entry/src/main/ets/core/ThresholdCatalog.ets)、[RegressionGate.ets](entry/src/main/ets/core/RegressionGate.ets) 的统计/检查标题及摘要，以及报告目录中的可见报告段落，仍需拆分数据与呈现。尤其 ReportExport 的必填段落检查与文本常量有关，不能仅替换输出而漏改校验。
   - [WorkloadCatalog.ets](entry/src/main/ets/core/WorkloadCatalog.ets) 的工作负载描述/校验说明、[ExperimentLedger.ets](entry/src/main/ets/core/ExperimentLedger.ets) 和 [SeriesHistory.ets](entry/src/main/ets/core/SeriesHistory.ets) 的比较文本尚未全部迁移；页面的选择标题/描述已有独立资源，原始模型与历史存储未重写。
5. 明确保留的历史值不是全部中文：`AppService.validLaunch` 接受“启用/禁用/初始”分组，构造和恢复逻辑依此分组；`ExperimentLedger.restoreRecords` 及 `complete()` 依据“成功/失败/跳过/超时/已取消”和“一致”等值验证既有账本。`ExperimentRecorder`、`FlowMetrics`、`Index.planRun` 必须继续使用这些数据值，而不能用当前语言文本做判断。schema、Preferences 名称、key、稳定 UI ID、用例编号和业务负载内容均保持。
6. 完整测试结果需要 Hypium 全量报告。自定义 `app-performance-test-report.json` 仅收录 `BoundedCase` 包装的结果，不能代表直接使用 `it` 的所有用例。

以上未迁移展示内容是真实剩余工作，不声称已经修完。恢复验证授权后，应先验证双语言显示和旧数据恢复，再完成模型/报告资源化与回归。

## 测试说明

详见 [ohosTest.md](ohosTest.md)。保留有价值的超时、让出事件循环、真实断言、故障注入和仅清理本测试 Ability 的封装。共享 case/UI 包装补充 begin/failure/end；不全量重命名用例，不把初始化成功、日志输出或单次 Promise 返回称为整套通过。

## 下载

下面是**拟提交目录的 sparse-checkout 模板**，使用前确认远端分支和目录是否已收录本修订。本次没有执行远端操作，也不声称这些命令已验证成功。

```sh
git init applications_app_samples
cd applications_app_samples
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git sparse-checkout init --cone
git sparse-checkout set code/BasicFeature/Ability/AppPerformance
git pull origin master
```
