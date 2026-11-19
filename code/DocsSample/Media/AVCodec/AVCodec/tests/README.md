# AVCodec验证

在示例目录执行`node scripts/verify.mjs`。默认依次执行Host、Native、CodeLinter、HAP构建，任一步失败即退出；未安装依赖也视为失败，不自动跳过阶段。PR修改应通过完整命令，并附构建产品、SDK版本和退出码。真机操作另按[ohosTest.md](../ohosTest.md)执行。

## 验证结果

| 检查项 | 结果 |
|---|---|
| 324条功能、兼容性、稳定性及新增回归用例 | Pass |
| 17套Host回归及3组验证入口检查 | Pass |
| 23项Native宿主测试：Debug、Release | Pass |
| ASan、UBSan：各5项Native定向测试 | Pass |
| 播放流程、PiP、资源归属与EOS设备回归 | Pass |
| CodeLinter | Pass：245条存量结果，0条新增；基线未修改 |
| HAP构建与签名 | Pass |
| 默认Hypium设备测试：13套、49条 | Pass |
| 音频轮询设备采样：3轮、9项 | Pass |

设备用例和逐项结果见[ohosTest.md](../ohosTest.md)。Host替身验证控制流程，设备测试覆盖实际系统接口和媒体链路；两者的验证范围分别保留。

### 告警修复与预览收尾

本次报告共28条。按报告位置完成27条修改：12条语义常量、7条SDK替身命名、1条C++缩进、1条finally异常控制和6条文档措辞。SDK替身使用项目函数名，汇编链接名保留系统符号，C链接及参数、返回类型不变。输入PCM块大小由采样率、声道数、S16LE样本宽度和20ms时长推导；中断与回调计数使用语义常量。

预览将文件关闭与解码、位图处理分开。finally只清理资源并记录关闭结果，关闭失败在其结束后上报；处理异常与关闭失败同时发生时保留原处理异常，关闭器仍保留File并阻止后续媒体任务。Host覆盖打开失败、解码失败、第二张位图创建失败、打开与解码等待期间取消，以及成功、失败或结果过期时叠加关闭失败；关闭失败测试通过独立进程隔离永久门控。

17套Host回归及3组验证入口检查、23项Native宿主测试的Debug与Release构建、CodeLinter和签名HAP构建均为Pass。Debug和Release均验证`NativeCheckTest --fail-check`按预期退出1。CodeLinter为245条存量结果、0条新增，基线未修改。默认Hypium设备回归13套、49/49为Pass，0失败、0错误、0忽略。设备默认套件不包含本次预览关闭故障注入，这部分结果仅来自Host。

`AudioCapturerInitTest`、`VideoEncoderBufferTest`和`RecorderLifecycleIntegrationTest`分别通过Release配置的ASan与UBSan，共6项；日志为`.validation/warning-173154-address-<测试名>.log`和`warning-173154-undefined-<测试名>.log`。

本次日志为`.validation/warning-173154-host.log`、`warning-173154-native-debug.log`、`warning-173154-native-release.log`、`warning-173154-lint.log`、`warning-173154-build.log`和`warning-173154-device.log`。设备结构化结果为`.validation/device-result.json`。构建仍有存量警告。原告警平台尚未复扫，不能据本地结果宣称平台已清零。

剩余1条`WordsTool.297`命中下方真实的Ability Assistant测试命令。保留可运行的`aa test`及其用途说明，按误报待平台复核；不拆字符或编造替代命令。

### PCM队列基准

以下命令使用Linux或WSL中的C++17编译器驱动；也可用当前工具链的驱动路径替换`c++`。

在Linux或WSL的AVCodec示例目录编译并运行：

```sh
c++ -std=c++17 -O2 -Ientry/src/main/cpp tests/native/PcmQueueBenchmark.cpp \
  -o /tmp/avcodec-pcm-queue-benchmark
/tmp/avcodec-pcm-queue-benchmark
```

基准每次处理4096字节、重复2000块，运行7轮并比较中位数；两种队列使用相同输入和输出校验和。Windows主机通过WSL Ubuntu 22.04、LLVM 14工具链、`-O2`的一次结果为：`PcmQueue` 1.14µs/块，原`std::queue<uint8_t>`操作11.89µs/块，约10.47倍。结果只描述主机上的PCM队列操作，受编译器和运行环境影响，不代表真机AudioRenderer、codec或GPU性能。

SDK 26.0.0本轮复验：17套Host及3组入口检查、22项Native的Debug与Release构建、CodeLinter、签名HAP构建均通过。CodeLinter为245条存量结果、0条新增，未修改基线。默认Hypium设备测试13套、49/49通过，0失败、0错误；结构化结果为`.validation/device-result.json`，逐项报告为`entry/.test/default/intermediates/ohosTest/coverage_data/test_result.txt`。本轮日志为`.validation/current-host.log`、`current-native-debug.log`、`current-native-release.log`、`current-lint.log`、`current-build.log`和`current-device.log`。构建仍有存量警告；新增故障注入、系统PiP、完整页面迁移和实际GPU送显设备回归均为Pass，逐项结果见测试指南。

## 环境和参数

- Node：DevEco Studio随附版本。脚本使用当前Node运行Host、CodeLinter和Hvigor。
- `OHOS_SDK_HOME`或`--sdk`：同时包含ets和native的SDK版本目录。
- `DEVECO_STUDIO_HOME`或`--studio`：包含plugins、tools、jbr的DevEco Studio安装目录。
- Linux：LLVM C++编译器及系统C++17开发环境。Windows：WSL中的上述环境；用`AVCODEC_WSL_DISTRO`或`--wsl-distro`指定发行版。用`CXX`或`--cxx`指定编译器在Linux或WSL内的可执行文件路径。
- HAP构建使用项目已有product=default、entry@default配置，签名配置由本机或CI提供。脚本不改签名设置。

单阶段可用`--only host`、`--only native`、`--only lint`、`--only build`。定位单个Native测试可再传`--native-test TranscodeAudioPipelineTest`；单项通过不能代替完整验证。CI可直接调用默认命令，远端必需检查由仓库维护者设置。

### Native构建与检测参数

在AVCodec示例目录执行；先配置上述SDK、WSL和编译器参数。

```sh
node scripts/verify.mjs --only native --native-build debug
node scripts/verify.mjs --only native --native-build release
node scripts/verify.mjs --only native --native-build release --sanitizer address --native-test PcmQueueTest
node scripts/verify.mjs --only native --native-build release --sanitizer undefined --native-test VulkanResourcesTest
```

`--native-build`只接受`debug`或`release`，后者使用`-O2 -DNDEBUG`。`--sanitizer`接受`none`、`address`、`undefined`或`thread`，分别为无检测、AddressSanitizer（ASan，地址检查）、UndefinedBehaviorSanitizer（UBSan，未定义行为检查）和ThreadSanitizer（TSan，数据竞争检查）。检测器需要相应编译器运行库；缺库、无法启动或测试失败均返回非零，不自动跳过。产物分别存入`.validation/native/<build>-<sanitizer>/`。

ASan宿主可执行文件关闭PIE（Position Independent Executable，位置无关可执行文件），保持地址检查开启。本机WSL上，默认装载方式连空检查程序也偶发在ASan初始化前崩溃；固定装载后正向控制连续20次退出0，负向控制退出1，记录为`.validation/current-asan-control.log`。UBSan使用`-fno-sanitize-recover=all`，发现问题即失败。`NativeCheckTest --fail-check`必须退出1，验证脚本只接受该退出码；这项检查在Release中同样执行。

本轮`PcmQueueTest`、`AudioCapturerInitTest`、`VideoEncoderBufferTest`、`VulkanResourcesTest`和`NativeCheckTest`分别通过ASan与UBSan，共10项，日志为`.validation/current-sanitizers.log`及对应的`current-address-*.log`、`current-undefined-*.log`。TSan和CMake/CTest路径尚未执行；不能据此写为通过。

### 转码与Native资源调整

转码开始后，在进入异步预检前保存请求和配置说明的值快照，预检、区间校验、大小预估、Native提交和报告均读取同一份输入。执行按准备、运行、收尾和持久化拆分，共用任务上下文持有文件和输入身份。队列保存8个具名设置；旧7项或8项数组只在恢复时转换，缺少的缩放方式使用默认值0。Host覆盖等待预检时修改草稿、请求和报告保持原值，以及旧格式迁移和新格式往返。

转码、预检和预览共用文件关闭器。同一fd并发关闭合并为一次；EBADF表示已关闭，非EBADF关闭错误保留File并阻止同进程继续播放、录制、转码或清理。界面结束忙碌状态、队列暂停并提示重启；转码待处理会话保留。不重复关闭结果不明的fd，避免误关被系统复用的描述符。Host分别注入预检、预览和正式转码关闭错误，使用独立进程隔离永久门控，验证租约、门控与会话归属。

录音采集缓存改用固定容量PCM环形队列，S16LE格式按2秒采样量预分配，至少容纳一个`audioMaxInputSize`块，最多4MiB；容量超限或参数无效时初始化失败。该容量是保护策略，并非真机性能结论。回调中不扩容、不前移剩余PCM；检测到溢出后记录一次`recorder.audio.capacity`并进入既有错误收尾，保留已排队数据。诊断`audio`对象增加`peakPendingPcmBytes`、`captureCapacityBytes`、`captureOverflows`和`captureCallback`。最后一项统计尝试获取队列锁至完成队列处理的耗时，包含锁等待，不含后续诊断入账；没有新增UI行。同步音频EOS和既有Flush/Stop约定保留。

`AudioPlaybackCallbackContext`集中音频中断、恢复、音量及诊断引用，由Player持有，回调只借用；renderer释放并等待工作线程退出后才销毁。Native回归覆盖用户暂停时系统恢复、正常恢复、duck/unduck、停止后不恢复和销毁后迟到回调。

Vulkan按帧资源、交换链和上传图像分组；资源组不可复制，部分初始化也可重复清理。sink仍先显式等待GPU完成，再归还子资源，最后销毁device、surface和窗口引用；析构不隐藏GPU等待。NativeBuffer导入缓存维持原所有权，本轮未迁入资源组。`VulkanResourcesTest`检查各阶段失败、释放顺序与重复清理，真实驱动的Stop、Seek和窗口重建设备回归结果为Pass。

### 录音PCM基准

```sh
c++ -std=c++17 -O2 -Ientry/src/main/cpp tests/native/CaptureQueueBenchmark.cpp -o /tmp/avcodec-capture-queue-benchmark
/tmp/avcodec-capture-queue-benchmark
```

对照实现为原录音缓存的vector前移算法。固定积压192000字节，每次读写4096字节，重复2000次，交替顺序运行7轮，输出校验和一致。WSL Ubuntu 22.04、LLVM 14、`-O2`本轮中位数：环形队列1309.35ns/块，原实现5608.85ns/块，约4.28倍；原始记录为`.validation/current-CaptureQueueBenchmark.log`。这是宿主容器操作测量，不包含设备采集、编码或回调调度，不能换算成真机端到端提升。

### 设备报告校验

连接设备后执行`node scripts/verify.mjs --only device --studio <DevEco安装目录>`。该阶段调用Hvigor的`onDeviceTest`构建、签名、安装并运行entry测试，默认要求49条全部通过。它不进入默认`all`，Host验证环境不需要连接设备。运行可能重新安装测试HAP，缓存素材应在安装后按对应场景重新准备。

指定范围时同时提供条数，例如`--device-scope PlaybackPolicyTest --expected-device-tests 5`。使用Hypium的套件名或`套件#用例`，多个范围用逗号分隔；条数必须与选择范围一致。轮询基准需要额外素材，仍按下文的专门步骤执行。

执行前删除旧`test_result.txt`并重置结构化结果，执行后检查报告修改时间、唯一汇总、实际条数、逐项Success、套件范围、失败、错误及忽略数。报告缺失、过期、零用例、重复用例或断言失败均使验证失败，即使Hvigor退出码为0。结果在`.validation/device-result.json`，进程日志在`.validation/logs/device.log`。`DeviceVerification.test.mjs`覆盖这些失败路径和超时收尾。

### 后台策略与流程契约

设备另完成文档起播、重播、暂停、开启后台播放、确认系统PiP窗口、关闭后台开关及停止检查，页面状态和提示一致。系统控制面板、快速请求与故障注入回归结果均为Pass，基本路径的证据及范围见`ohosTest.md`的后台播放基本路径。

`PlaybackPictureInPicture`补充后台开启、关闭、自动启动失败、清理未完成、创建或启动期间关闭、重复请求和播放代次变化。`PlaybackCommand`先复现页面状态滞后导致Native暂停被跳过，再检查Native状态控制、重复目标和停止阶段拒绝。`PlaybackControlFlow`直接组合真实Flow、Command、Seek检查各阶段权限；页面适配另检查AVSession目标命令和过期后台提示。

`PlaybackContracts`使用SDK的TypeScript编译器检查只读消费接口和事件必需参数，运行时同时核对代次、活动源只读以及重播代次递增。它不能替代ArkTS构建；HAP构建负责验证平台类型限制和页面初始化。共有17套Host回归，验证入口另有进程运行器、Native构建参数和设备报告检查三组。

各阶段的最新结果见本文开头的验证表。Host替身、默认Hypium和新增设备回归分别记录；故障注入、实际送显、播放流程迁移及EOS退出用例的设备结果均为Pass。

每个Host或Native测试默认限时60秒，单项Native编译180秒，CodeLinter 300秒，HAP构建600秒。可用`--test-timeout-ms`、`--compile-timeout-ms`、`--lint-timeout-ms`和`--build-timeout-ms`传入正整数毫秒值。阶段和测试日志保存在`.validation/logs/`，失败信息包含名称、退出码或超时原因及日志路径。WSL内同时使用系统`timeout`终止超时命令，外层再清理启动进程；CTest每项默认限时60秒，可用`-DAVCODEC_TEST_TIMEOUT_SECONDS=120`调整。

## 检查范围

录制生命周期回归还覆盖保存面板的交互关闭：关闭按钮、手势或返回触发同一取消方法，在能力查询、会话登记和初始化等待期间关闭均不再跳转，完成清理后可重试。相机控制器在stop或release开始后拒绝新的prepare，既有准备仍等结束后释放；录制页结束或隐藏后，迟到的onLoad、准备成功和准备失败都不再改动页面。Host使用可控替身验证这些时序，面板交互与相机链路的设备回归结果为Pass。

API 26真机已通过保存面板三种关闭方式各2次、录制页连续进入退出20次，以及随后录制、停止、成品参数校验和自然播放结束。具体结果见`ohosTest.md`的CONCURRENT-012和CONCURRENT-013；这些设备操作不代替可控延迟下的组合验证。

`RecordingPageLifecycle.test.cjs`运行Index中的录制授权、保存和离页方法，并接入生产RecorderLaunchController、MediaFileActivity和MediaTaskCoordinator。测试在权限、能力查询、会话登记、输出初始化和路由处阻塞异步调用，覆盖重复点击、授权成功或拒绝后晚返回、离页重入、PiP离页、取消后重试，以及路由成功后的资源交接。取消尚未交接的初始化时，先等待Native停止再关闭两个fd、释放租约和待处理会话；Native未释放时保留资源。正常录制和无路由分段初始化保持原有交接方式。测试使用文件、路由和Native替身；系统授权与录制页行为的设备回归结果为Pass。

`RecordingPersistence.test.cjs`接入生产录制历史、收尾和文件关闭实现，覆盖多实例并发写入、读取交错、分段合并、深拷贝，以及初始读取失败后的旧历史恢复。put和flush故障分别检查单次失败、持续失败、每次最多两次尝试、失败结果与后续flush恢复。连续35次未开录取消不读取成品参数、不占用历史容量；真正启动失败、相机失败和部分输出仍保留结果。

损坏历史回归覆盖无效JSON和非数组根节点：备份原文并flush后才允许写入正式entries，备份put或flush失败则保留原文、返回保存失败；另检查多实例恢复、已知历史保留和旧备份不被覆盖。同一进程、同一存储目录的实例连续刷新10次只生成一次已确认备份；原文变化、备份丢失或内容变化时新建，失败备份恢复成功后才复用。分段测试让第一段保存失败、第二段恢复成功，核对两段均已落盘且未保存提示清除；未知结果、重复结果和再次保存失败分别检查。备份使用同一Preferences的`entries_corrupt_<时间戳>_<序号>`键，不自动清除。

文件关闭回归检查Native未释放时不close、EBADF视为已关闭，以及主或副fd关闭结果不明时保留对应fd、租约和待处理会话。同一进程不再重试该fd，避免误关已复用的描述符；启动控制器另覆盖路由失败后的关闭错误。Host替身和设备故障注入分别验证，结果均为Pass。

API 26真机另完成5次进入预览后取消，历史标题与操作前一致；随后录制约6.6秒，成品为1920×1080、含音频、参数一致，播放自然结束后保持停止。强制停止并重启应用后，新录制历史仍存在。见`ohosTest.md`的RECORD-HISTORY-001和RECORD-HISTORY-002。

`PlaybackFlow.test.cjs`直接创建生产`PlaybackFlowController`，接入生产队列、恢复模型和历史协调器；通过`PlaybackFlowRuntime`显式注入URI准备、Native操作及定时器替身，不读取页面源码、不加载文件选择器，也不映射提示资源。测试以路径、配置、进度快照为输入，检查准备请求、状态、业务事件、取消代次、队列续播及单次恢复。

`PlaybackQueueState.test.cjs`检查队列输入与展示快照隔离、最新切换请求、追加不取消待播、清空与替换失效，以及准备、播放、停止、释放和关闭结果不明的阶段约束。业务权限由阶段推导，不能通过按钮显示或修改快照绕过。

`PlaybackCommand.test.cjs`直接调用生产命令控制器并组合生产`SeekRequestController`，检查请求合并、Seek期间修改倍速、当前温控恢复、暂停互斥及失败结果。停止被拒绝、离页、完成和重播后，旧Seek不再发送界面事件或恢复Native控制。`PlaybackStartup.test.cjs`核对运行时的倍速、温控及暂停调用；页面适配测试核对进度、Seek统计、提示资源与AVSession状态。

停止被拒绝的页面回归先复现`isSeeking`未清除，再验证停止结果事件主动结束Seek展示，旧Seek仍不恢复控制项。定向记录为`.bundle-flow/playback-design-stop-before.log`和`playback-design-stop-after.log`。

`PlaybackOrdering.test.cjs`用可控Promise排列停止、同URI重播、旧保存完成、队列追加、清空和替换的先后顺序，每步检查活动源、阶段权限与启动次数。共享夹具提供`waitAt()`业务检查点，超时或断言失败输出执行轨迹；固定次数微任务等待已移除，页面适配在需要排空当前事件循环时使用`setImmediate`。

`PlaybackHistoryCoordinator.test.cjs`直接检查保存间隔、强制保存、失败不推进限流位置、同URI重播隔离、完成时长回退和最终flush。结合真实历史模型检查初始读取失败恢复、完成标记两次写入失败后的最终重试，以及短媒体在进度刷新前结束的保存。`PlaybackConcurrency.test.cjs`继续检查模型串行写入、损坏数据保护、快照合并和失败退避，并核对协调器普通进度与强制保存的区别。

`PlaybackSourceFlow.test.cjs`保留文档、媒体库、最近记录、录制成品与流程的集成测试，覆盖停止期间改选、追加和清空队列。它与`PlaybackPageLifecycle.test.cjs`使用`helpers/PlaybackPageFixture.cjs`，执行生产页面的事件适配、提示映射及生命周期方法；共享的运行时替身来自`helpers/PlaybackFlowFixture.cjs`，不再另写一套页面事件分支。核心流程测试只使用后者，页面字段或提示文字调整不会影响核心断言。

播放流程、命令、队列与历史职责拆分的前次完整验证记录在`.bundle-flow/playback-design-all.log`。本次完整验证日志为`.bundle-flow/pip-commands/all-final.log`，检查16套Host回归及验证入口、15项Native测试、CodeLinter和HAP构建签名；PiP补充回归的最新Host日志为同目录的`host-final.log`。CodeLinter报告250条存量结果、0条新增，未扩大基线；构建仍有存量ArkTS警告。Host不渲染ArkUI，不验证设备授权、真实编解码器或送显；设备操作及结果见[播放流程模块迁移回归](../ohosTest.md#playback-flow-migration)。

`PlaybackControlFlow.test.cjs`组合生产Flow、Command和Seek控制器，覆盖停止等待实际Seek结束、停止被拒绝、自然完成或错误先于Seek返回、重播、离页、请求合并及单帧跳转。`PlaybackPictureInPicture.test.cjs`运行生产PiP控制器，覆盖创建和启动期间取消、播放代次变化、重复启动共用请求、过期系统事件、部分监听注册失败、解绑失败、关闭失败后重试，以及同一播放的自动PiP重入。系统窗口接口使用替身，实际窗口回归仍需执行。

启动结果回归核对`kind`与`reason`：启动成功、Native仍持有资源、同步拒绝和关闭结果不明分别处理，空文件、文件读取失败及Native拒绝保留具体原因；输入和租约仍由原启动尝试负责收尾。

### 轮询真机采样

`PlaybackPollingBenchmark`仅在显式指定该套件时注册，不进入默认13套、49条Hypium功能回归。使用大于10秒的本地AAC音频作为`polling-fixture.m4a`，放入测试应用的cacheDir；准备素材后直接执行Ability Assistant（系统Ability管理工具）的测试命令，不要再次运行会重装并清理cacheDir的`onDeviceTest`。素材和生成结果不合入仓库。

```powershell
# 先使用onDeviceTest构建安装测试HAP，再复制素材。
# hdc是设备连接工具；以下命令通过Ability Assistant运行已安装的测试。
hdc shell aa test -b com.samples.avcodecsample -m entry_test -s unittest OpenHarmonyTestRunner `
  -s class PlaybackPollingBenchmark -s timeout 10000 -w 30
```

用例在每个模式下预热4次，以250ms间隔采样8次；分别测量`getPlaybackInfo()`和包含另一次NAPI读取的`PlaybackViewModel.update()`，两项耗时不能相加当作生产单次更新成本。每次结果写入cacheDir的`polling-idle.json`、`polling-playing.json`和`polling-paused.json`。以报告中的`Tests run`、`Failure`、`Error`和`Pass`确认结果，Hvigor退出0不能单独证明断言通过。

SGT-AL10、OpenHarmony-7.0.0.33、SDK 26.0.0上重复3轮，每个模式共24个样本，9项全部通过。AAC为48kHz双声道、音量0；输入SHA256为`8081cbacb267ff3cb3608b107772c5511404de6ffcae469d1916e78638fca71d`。

| 模式 | NAPI均值/最大值（ms） | 完整模型更新均值/最大值（ms） | 快照字符数 |
|---|---|---|---|
| 空闲 | 0.543 / 1.312 | 0.581 / 1.282 | 1227 |
| 播放 | 0.791 / 1.301 | 0.862 / 1.301 | 1723 |
| 暂停 | 0.813 / 1.456 | 0.914 / 1.190 | 1807 |

当前保留250ms完整刷新，暂不增加轻量状态与完整诊断的双接口。该结果仅覆盖音频、NAPI同步读取和未挂载ArkUI的模型更新，不包含页面渲染、视频或GPU诊断负载，也不用于推算整机CPU占用。后续若出现这些场景的性能问题，按相同条件补测再决定是否拆分。初版WAV输入因设备拒绝audio/raw配置而失败，未计入通过结果。原始日志为`.bundle-flow/pip-commands/device-polling-run1.log`至`run3.log`和对应的`polling-run*.jsonl`。

Host回归使用SDK中的TypeScript转译器和文件/Native替身，覆盖模型计算、文件调用顺序、任务租约、异步生命周期、错误保留、常亮状态、报告兼容/脱敏及SHA256读取边界。它不能验证ArkUI布局、系统URI授权或真实codec行为。

断点续播回归检查默认关闭、显式开启后读取有效历史位置、关闭后保留历史、临近片尾从头播放，以及设置草稿取消/应用、配置保存重载、旧11字段配置恢复和预设默认关闭。

`PlaybackConcurrency.test.cjs`检查历史写入串行、连续进度合并、最终保存等待，以及损坏记录隔离、去重、排序和数量限制。初始化测试分别阻塞Preferences获取和数据读取，再插入进度更新、完成标记和重复加载，确认新进度不被旧读取覆盖。保存测试区分缓存和落盘数据，检查单次保存最多尝试两次、失败返回false、不推进协调器的已保存位置，以及最终flush和重新加载保留待保存快照。

播放历史还分别注入初始open、初始get和重载读取失败，确认更新、完成标记和flush不会覆盖尚未读出的旧记录，且不报告保存成功；读取恢复后合并旧历史与待保存进度。可控时钟检查5秒内高频更新不重读、到期并发请求共用一次读取、持续失败重新计时，以及最终flush立即恢复和完成进度仍为0。初始加载和重载分别覆盖`{}`、`null`、数字、字符串及无效JSON，核对原文和已知内存记录保留，更新与最终保存均不写入；恢复合法数组后再合并待保存的完成位置。

写入退避回归分别注入put和flush持续失败：20次间隔250ms的进度更新只进行两次写入尝试和两条警告；到期保存最新快照，成功后解除退避。并发测试检查已排队进度在前一次失败后也不重复写入；强制进度、完成标记和最终flush可绕过退避。流程回归延迟完成标记与flush，确认界面已清理、下一项可起播，迟到的保存不会重置新播放状态；返回false或抛错均执行收尾并处理失败。历史协调器与真实历史模型组合检查完成标记两次写入失败后，最终flush仍能保存0位置。上述故障测试使用Host替身，设备存储故障结果单独记录。

来源切换回归接入生产流程及历史协调器，分别在播放中选择文档、媒体库文件、最近历史和录制成品，确认旧任务完成前不改播放路径，进度始终保存到旧URI；停止期间连续选择只启动最后一项，清空队列可取消待播目标。另检查普通来源选择仍查询恢复位置开关，等待Seek的旧停止请求不能停止新播放。

队列回归还检查停止期间连续点击不同队列项、重新点击正在停止的项，确认只请求一次Native停止，最终只启动最后选择。分别在AVSession停止和Seek等待处追加项目，确认追加不取消原目标、不重复入队，起播后仍保留新增项目；清空和替换队列的取消回归同时保留。

完成保存回归还覆盖初始open或get失败、损坏原文恢复时内存尚无对应记录的场景，确认完成操作被保留；同文件的新进度或重读期间的重播会取代旧完成标记。页面缓存时长和Native完成时长分别取0与有效值组合，确认自然完成始终执行标记及最终flush；真实历史模型组合验证短媒体可用Native完成时长补建已完成记录。设备用例及Pass结果在`ohosTest.md`逐项列出。

`PlaybackStartup.test.cjs`接入生产启动控制器、任务协调器和文件活动门控，检查正常完成、停止、错误、重复完成通知、EBADF，以及输入关闭结果不明时保留File、租约和待处理会话。空文件、stat失败、Native同步拒绝和异步初始化失败分别覆盖；后续媒体任务被阻止，不重新打开文件或重试close。页面回归另检查手动待续队列、自然续播、错误恢复和已等待Seek的续播均取消，界面清理完成并提示重启。文件接口和Native完成通知使用Host替身，真实故障行为按设备用例验证。

文件选择测试使用可控的选择器、授权Promise和计时器，检查文件/相册乱序返回、授权期间切换最近播放、离页后重入、过期错误提示、清空队列和来源弹窗失效；当前请求仍可正常入队播放。这些替身只验证控制流程，不证明设备选择器或URI授权行为。AVSession测试在创建、元数据、队列、启动入口、激活和状态写入处暂停异步调用，再插入停止、重播或切换媒体，检查旧任务不会覆盖新会话，旧会话以STOP结束且仅销毁一次。监听故障回归分别在play、seek和setSpeed注册处抛错，确认会话不激活、已注册监听被清理、会话仅销毁一次，重试可注册全部9项控制。`VerificationRunner.test.mjs`检查非零退出、启动失败、日志输出和挂起进程超时清理。

A-B循环回归运行生产控制器，在一次Seek等待期间分别重新设置A、重设A和B、仅重设B及清除循环，再返回旧请求的失败、完成、取消和被替换结果，共16种组合。检查旧结果不覆盖新端点或开关，停用后无轮询，启用的新循环仍能向当前A点发出Seek；当前请求失败仍清除循环。计时器、播放信息和Seek为Host替身；实际送显与设备Seek回归结果为Pass。

Native入口按[targets.json](native/targets.json)编译并执行全部23个测试，复用生产实现和SDK声明，由测试提供OHOS函数替身。宿主编译器直接解析SDK版本可用性属性，不再通过宏重定义保留标识符。`-Wno-ignored-attributes`仅关闭宿主平台无法应用的SDK属性提示，`--gc-sections`排除测试没有调用的设备代码；运行通过不能代替设备上的编码、图形或驱动验证。测试产物写入已忽略的`.validation/`。

`AudioCodecBufferTest`直接组合AudioDecoder与AudioOutputPump，检查同步EOS在解码器内调用Free并返回END、异步EOS在输出线程归还、尾部PCM顺序、EOS不进入PCM回调、Buffer归还调用次数，以及查询超时、查询失败和查询期间停止的区别。新增组合覆盖暂停期间不消费输出、重建时丢弃待送PCM、EOS归还后释放并重建解码器；同步和异步模式各重复20次。同步EOS按当前接口约定不检查Free返回值，测试只确认调用一次、清空Buffer且不重复归还；异步EOS和普通PCM归还失败仍按错误处理。同时检查音频编码器Stop前Flush、编解码器Release前Flush/Stop，以及清理失败后仍执行Destroy且不重复销毁。

范围调整前验证：AudioCodecBufferTest、RecorderLifecycleIntegrationTest、TranscodeAudioPipelineTest及`PlayerLifecycleIntegrationTest`的Debug、Release均通过；Release使用NDEBUG，`NativeCheckTest --fail-check`负向控制按预期返回1。音频Buffer回归的ASan和录制生命周期回归的UBSan通过；Host全量、CodeLinter和签名HAP构建通过，CodeLinter为245条存量、0条新增。SDK对本次修改的C++执行普通与NDEBUG语法检查。播放器视频工作线程在生命周期测试中仍为替身，生产视频输出循环、GPU和设备codec的EOS回收设备验证结果见[设备回归说明](../ohosTest.md#eos线程退出与回收回归)，对应3项用例均为Pass；TSan未执行。

范围收敛后验证：音频EOS和停止时Buffer处理已恢复；AudioCodecBufferTest、TranscodeAudioPipelineTest的Debug、Release重新通过。RecorderLifecycleIntegrationTest新增链接生产视频输入循环，在SYNC/ASYNC下检查普通帧后停止、无图像停止、暂停中停止、EOS取Buffer和提交失败、回调故障；确认EOS由输入线程提交一次，输入退出后输出继续排空，普通帧仍写入并归还。新增回归的Debug、Release和UBSan均通过，NDEBUG失败检查负向控制按预期返回1。Host全量通过，CodeLinter为245条存量、0条新增；SDK普通与NDEBUG语法检查、签名HAP构建通过。日志见`.validation/video-input-eos-host.log`、`video-input-eos-lint.log`、`video-input-eos-build.log`及`.validation/logs/`。设备EOS回收验证的3项用例均为Pass；TSan未执行。

同步视频查询返回TRY_AGAIN_LATER时按AGAIN重试，调用层等待日志改为每120次一次的DEBUG，查询失败仍报错。真机回放日志未再出现原输入等待超时ERROR和重复WARN；本次设备未显示DEBUG，未据此验证限频次数。此前预览取消时仍能复现音频Flush返回8，当时的临时诊断字段记录为started=0、eosSubmitted=0。当前已撤回音频编码器的临时状态字段和日志修改，Flush/Stop顺序和同步音频EOS分支保持原样。

`VideoFramePacerTest`使用片尾日志中的14帧PTS，检查0.5x、1x和2x的帧间隔与总时长，以及暂停恢复或Seek后重建时钟锚点。`VideoEncoderBufferTest`调用生产音频回调，检查最后一包PCM不足回调长度时的补零、有效帧计数，以及音频结束后的纯补零回调不会覆盖视频推进的播放位置。这些宿主测试覆盖计时器和回调；Player在音频结束时唤醒等待、保留当前视频帧并切换时钟的完整链路真机回归结果为Pass。

`PlaybackLifecycleTest`组合生产状态机、音视频工作线程容器和视频计时器，使用条件变量屏障控制片尾时机，在同步和异步模式下各执行完成、暂停恢复、Seek重建状态、切轨重建状态、停止后立即重播，每种组合重复20次。它检查线程退出、模式分发、状态转换和时钟重建；不调用真实解码器、Player完成回调或设备送显。Buffer归还仍由`AudioCodecBufferTest`检查，完整链路按`ohosTest.md`新增用例验证。

也可使用同一份清单运行CMake/CTest（Linux或WSL，CMake至少3.19）。先将`CXX`设为LLVM C++编译器的可执行文件路径；配置时会检查编译器是否支持SDK版本可用性属性：

```sh
cmake -S tests/native -B .validation/cmake -DCMAKE_CXX_COMPILER="$CXX" -DOHOS_SDK_HOME="$OHOS_SDK_HOME"
cmake --build .validation/cmake --parallel
ctest --test-dir .validation/cmake --output-on-failure
```

CodeLinter使用正式配置[code-linter.json5](../code-linter.json5)，检查全部生产ets文件，排除依赖与构建目录。[lint-baseline.json](lint-baseline.json)记录252条存量结果，包括格式项和Promise类型识别误报；旧代码对应的18条失效记录已移除，本轮再移除1条随转码队列字段换行失效的记录。入口按文件、规则、级别、完整信息、源代码行和出现次数匹配；新增或变更的error/warn使检查失败，完整结果仍保存在`.validation/lint.json`。基线只用于记录已有问题，禁止为通过检查而批量追加新告警。修复存量问题后应删去对应记录；新增规则或更新检查器时需单独评审基线变化。

构建阶段调用Hvigor assembleHap，并设置随附JBR。构建时生成应用版本、提交号、源码SHA256及时间到rawfile/build-info.json，该文件不入库。源码校验覆盖应用源码、资源和列入生成脚本的构建元数据，排除本机签名配置及自身生成文件。没有Git记录时提交号显示unknown，仍计算源码校验值。

<a id="ten-round-review"></a>

## 十轮检视与回归

这10轮接续此前4轮，分别保留修复前失败和修复后通过的Host日志。PlaybackReview已接入`verify.mjs --only host`；页面方法和AVSession组合测试仍使用现有套件。

| 轮次 | 复现问题与修复 | Host回归 |
|---|---|---|
| 1 | 换源或停止后确认旧音轨选择框会操作新播放；确认前核对活动播放代次。 | PlaybackReview：audioDialog |
| 2 | 恢复Seek晚返回会在停止、离页、完成或重播后提示成功；等待前后都核对当前播放。 | PlaybackFlow与PlaybackPageLifecycle：testLateResumeFeedback |
| 3 | 字幕取消后仍继续读取或解析；stat和readText结束后检查取消代次。 | PlaybackReview：subtitleCancellation |
| 4 | 字幕加载失败晚返回会在离页或同文件重播后弹提示；结果和错误处理绑定播放代次。 | PlaybackPageLifecycle：testLateSubtitleFeedback |
| 5 | 单个监听off抛错后跳过剩余监听解绑与STOP同步；逐项隔离异常，继续停止和销毁。 | PlaybackReview：sessionCleanup |
| 6 | 旧AVSession已排队的控制回调会调用新播放；每次注册捕获会话与代次，复用时重绑。 | PlaybackConcurrency：testStaleSessionEvents |
| 7 | getEntries返回的条目对象可改写内部历史并在后续保存；返回独立条目副本。 | PlaybackReview：historySnapshots |
| 8 | 满额历史恢复先截断，丢失刚完成播放的旧记录；先应用完成标记再排序截断，完成时同步刷新顺序。 | PlaybackReview：historyCompletion |
| 9 | 入队质量对象、校验后的恢复条目仍共用输入引用；复制条目、选项数组和全部质量字段。 | PlaybackReview：queueSnapshots |
| 10 | 拖动取消或换源后，迟到的生成器仍绑定fd并取帧；创建返回后重新检查请求，仍按生成器、fd的顺序释放。 | PlaybackReview：seekPreviewCancellation |

修复前日志为`.bundle-flow/ten-round-1-before.log`至`ten-round-10-before.log`，修复后为对应的`after.log`。完整Host、CodeLinter和SDK 26.0.0的HAP构建签名通过，日志为`.bundle-flow/ten-round-host.log`、`ten-round-lint.log`和`ten-round-build.log`。CodeLinter为252条存量结果、0条新增；构建仍有存量警告。15项Native宿主测试及设备时序、故障注入回归结果为Pass；设备场景见ohosTest.md的CONCURRENT-018至027。

## 测试代码编写约定

测试代码与说明同样遵守仓库[CodeCommitChecklist.md](../../../../../../CodeCommitChecklist.md)及本文约定。C++测试函数有效代码不超过50行，lambda显式捕获；拆分测试时保留同步边界、断言和重复次数。

前次告警修复的Host回归、20项Native测试、CodeLinter和HAP构建签名均通过；当次CodeLinter为250条存量结果、0条新增，基线未修改。NativeHandle、PcmQueue、PlayerControlParser、PlayerLifecycleIntegration和RecorderLifecycleIntegration的测试另以`-O2 -DNDEBUG`构建并运行通过；故意失败的检查仍返回非零，PCM基准也正常完成。日志见`.validation/warning-host.log`、`warning-native.log`、`warning-lint.log`、`warning-build-final.log`和`warning-release.log`；最后调整的转码等待常量另以`warning-transcode.log`复验通过。

测试检查使用不受`NDEBUG`影响的失败退出路径，等待操作先执行再核对结果。录制器测试通过生产输出队列传递模拟EOS，并由生产取消路径唤醒等待线程。`OH_AVBuffer_GetAddr`和`OH_AVBuffer_GetCapacity`的替身现使用`FakeAvBufferGetAddr`和`FakeAvBufferGetCapacity`作为C++标识符，通过汇编链接名保留SDK符号、C链接和函数签名；Debug与Release均已编译链接并运行。本轮默认设备测试49条通过，告警来源平台的C++与WordsTool扫描未重跑，本地复核不代表平台告警已经清零。

`PlaybackLifecycleTest`的工作线程按值捕获共享状态，线程对象保留在外层上下文，停止处理使用普通函数。启动函数返回后回调仍持有有效状态；各轮退出和重播均Join，并检查回调释放共享状态的所有权，避免悬空引用和所有权环。返回、保存或异步执行的回调按`G.RES.05-CPP`核对捕获方式与对象有效期，文档说明回调执行及结束条件。

## 本轮告警逐项复核

| 报告项 | 处理与验证 |
|---|---|
| G.NAM.03-CPP：两个Buffer接口替身 | C++标识符改为项目命名，用链接别名保留SDK符号和ABI；Native Debug、Release编译链接通过。 |
| G.EXP.22-CPP：基准除数 | 实际计算比值的分支显式检查`ringMedian != 0.0`，保留有限性和正值校验；基准运行通过。 |
| G.FMT.03-CPP：范围for初始化列表 | 将输入提为具名`invalidSpeeds`容器，再执行循环；相关测试Debug、Release通过。 |
| WordsTool.297：两处工具说明 | 改用Ability Assistant全称，说明执行阶段与工具用途。 |
| WordsTool.297：真实系统命令 | 保留可运行的系统命令；命令名仍可能命中词语扫描，需平台按误报复核。 |

报告共7条，以上按相同处理合并展示。对应预防规则已写入本地开发约定：SDK替身保持ABI、实际除法附近防零、具名范围集合，以及保留真实命令。没有放宽CodeLinter基线，也没有用拆字符、编码或伪造命令规避检查。原平台复扫尚未执行。

## 合并回归验证

本次在`c77adf42`内容基础上修复异步视频输入变量名不一致、音频索引归还接口空实现，以及音频输出示例将原子计数直接传入日志接口的问题。Muxer按本地版本保留调用Destroy后清空句柄并返回成功的释放约定。音频编解码EOS及Flush/Stop顺序不变。视频输入示例路径改为不含嵌套注释起始符的沙箱路径，消除编译器注释告警。

`AudioCodecBufferTest`新增按索引归还的未创建、普通帧、EOS、系统接口失败和销毁后调用检查；每次有效归还只调用一次系统接口并保留原索引。新增`MuxerLifecycleTest`直接链接生产Muxer，覆盖空对象释放、系统Destroy成功或失败时保留既有返回约定、重复释放及析构不重复销毁。既有`RecorderLifecycleIntegrationTest`继续链接生产视频输入循环，覆盖SYNC/ASYNC普通帧、暂停、无图像停止及EOS失败路径。

| 检查项 | 本次结果 |
|---|---|
| 17套Host回归及3组验证入口检查 | Pass |
| 23项Native宿主测试，Debug及Release | 全部Pass；Release使用`-O2 -DNDEBUG` |
| Native检查负向控制 | Debug、Release均按预期退出1 |
| AudioCodecBufferTest、MuxerLifecycleTest | ASan及UBSan均Pass，共4项 |
| RecorderLifecycleIntegrationTest | UBSan Pass |
| CodeLinter | 245条存量，0条新增，基线未修改 |
| HAP构建及签名 | Pass；仍有存量ArkTS警告 |
| 默认Hypium设备回归 | 13套、49/49 Pass，0失败、0错误 |

环境使用SDK 26.0.0、DevEco Studio和WSL Ubuntu 22.04的LLVM工具链。日志为`.validation/merge-fix-host.log`、`merge-fix-native-debug.log`、`merge-fix-native-release.log`、`merge-fix-lint.log`、`merge-fix-build.log`、`merge-fix-device.log`及对应`merge-fix-address-*`、`merge-fix-undefined-*`日志。设备结构化结果为`.validation/device-result.json`。

本次默认设备套件不覆盖录制页面完整操作与真实codec的EOS排空，未重新执行手工EOS、系统PiP、GPU送显或性能采样。TSan与CMake/CTest路径本次未执行；既有设备和性能记录保留原适用范围。

### Muxer本地行为复验

Muxer按本地版本保留直接调用Destroy、清空句柄并返回成功的行为；相关测试检查系统Destroy成功或失败时都不重复销毁，不要求改变生产返回约定。该调整后，MuxerLifecycleTest的Debug、Release、ASan、UBSan及HAP构建签名重新通过，日志为`.validation/muxer-local-*`。本次未重新执行完整Host、全部Native或设备套件，前表结果保留原验证范围。
