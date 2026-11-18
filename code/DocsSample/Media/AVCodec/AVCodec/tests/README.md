# AVCodec验证

在示例目录执行`node scripts/verify.mjs`。默认依次执行Host、Native、CodeLinter、HAP构建，任一步失败即退出；未安装依赖也视为失败，不自动跳过阶段。PR修改应通过完整命令，并附构建产品、SDK版本和退出码。真机操作另按[ohosTest.md](../ohosTest.md)执行。

## 验证结果

| 检查项 | 结果 |
|---|---|
| 324条功能、兼容性、稳定性及新增回归用例 | Pass |
| 8套Host回归及验证入口检查 | Pass |
| 15项Native宿主测试 | Pass |
| CodeLinter | Pass：252条存量结果，0条新增 |
| HAP构建与签名 | Pass |

设备用例和逐项结果见[ohosTest.md](../ohosTest.md)。Host替身验证控制流程，设备测试覆盖实际系统接口和媒体链路；两者的验证范围分别保留。

## 环境和参数

- Node：DevEco Studio随附版本。脚本使用当前Node运行Host、CodeLinter和Hvigor。
- `OHOS_SDK_HOME`或`--sdk`：同时包含ets和native的SDK版本目录。
- `DEVECO_STUDIO_HOME`或`--studio`：包含plugins、tools、jbr的DevEco Studio安装目录。
- Linux：LLVM C++编译器及系统C++17开发环境。Windows：WSL中的上述环境；用`AVCODEC_WSL_DISTRO`或`--wsl-distro`指定发行版。用`CXX`或`--cxx`指定编译器在Linux或WSL内的可执行文件路径。
- HAP构建使用项目已有product=default、entry@default配置，签名配置由本机或CI提供。脚本不改签名设置。

单阶段可用`--only host`、`--only native`、`--only lint`、`--only build`。定位单个Native测试可再传`--native-test TranscodeAudioPipelineTest`；单项通过不能代替完整验证。CI可直接调用默认命令，远端必需检查由仓库维护者设置。

每个Host或Native测试默认限时60秒，单项Native编译180秒，CodeLinter 300秒，HAP构建600秒。可用`--test-timeout-ms`、`--compile-timeout-ms`、`--lint-timeout-ms`和`--build-timeout-ms`传入正整数毫秒值。阶段和测试日志保存在`.validation/logs/`，失败信息包含名称、退出码或超时原因及日志路径。WSL内同时使用系统`timeout`终止超时命令，外层再清理启动进程；CTest每项默认限时60秒，可用`-DAVCODEC_TEST_TIMEOUT_SECONDS=120`调整。

## 检查范围

录制生命周期回归还覆盖保存面板的交互关闭：关闭按钮、手势或返回触发同一取消方法，在能力查询、会话登记和初始化等待期间关闭均不再跳转，完成清理后可重试。相机控制器在stop或release开始后拒绝新的prepare，既有准备仍等结束后释放；录制页结束或隐藏后，迟到的onLoad、准备成功和准备失败都不再改动页面。Host使用可控替身验证这些时序，面板交互与相机链路的设备回归结果为Pass。

API 26真机已通过保存面板三种关闭方式各2次、录制页连续进入退出20次，以及随后录制、停止、成品参数校验和自然播放结束。具体结果见`ohosTest.md`的CONCURRENT-012和CONCURRENT-013；这些设备操作不代替可控延迟下的组合验证。

`RecordingPageLifecycle.test.cjs`运行Index中的录制授权、保存和离页方法，并接入生产RecorderLaunchController、MediaFileActivity和MediaTaskCoordinator。测试在权限、能力查询、会话登记、输出初始化和路由处阻塞异步调用，覆盖重复点击、授权成功或拒绝后晚返回、离页重入、PiP离页、取消后重试，以及路由成功后的资源交接。取消尚未交接的初始化时，先等待Native停止再关闭两个fd、释放租约和待处理会话；Native未释放时保留资源。正常录制和无路由分段初始化保持原有交接方式。测试使用文件、路由和Native替身；系统授权与录制页行为的设备回归结果为Pass。

`RecordingPersistence.test.cjs`接入生产录制历史、收尾和文件关闭实现，覆盖多实例并发写入、读取交错、分段合并、深拷贝，以及初始读取失败后的旧历史恢复。put和flush故障分别检查单次失败、持续失败、每次最多两次尝试、失败结果与后续flush恢复。连续35次未开录取消不读取成品参数、不占用历史容量；真正启动失败、相机失败和部分输出仍保留结果。

损坏历史回归覆盖无效JSON和非数组根节点：备份原文并flush后才允许写入正式entries，备份put或flush失败则保留原文、返回保存失败；另检查多实例恢复、已知历史保留和旧备份不被覆盖。同一进程、同一存储目录的实例连续刷新10次只生成一次已确认备份；原文变化、备份丢失或内容变化时新建，失败备份恢复成功后才复用。分段测试让第一段保存失败、第二段恢复成功，核对两段均已落盘且未保存提示清除；未知结果、重复结果和再次保存失败分别检查。备份使用同一Preferences的`entries_corrupt_<时间戳>_<序号>`键，不自动清除。

文件关闭回归检查Native未释放时不close、EBADF视为已关闭，以及主或副fd关闭结果不明时保留对应fd、租约和待处理会话。同一进程不再重试该fd，避免误关已复用的描述符；启动控制器另覆盖路由失败后的关闭错误。Host替身和设备故障注入分别验证，结果均为Pass。

API 26真机另完成5次进入预览后取消，历史标题与操作前一致；随后录制约6.6秒，成品为1920×1080、含音频、参数一致，播放自然结束后保持停止。强制停止并重启应用后，新录制历史仍存在。见`ohosTest.md`的RECORD-HISTORY-001和RECORD-HISTORY-002。

PlaybackPageLifecycle.test.cjs从Index.ets提取生产页面方法，通过TypeScript扫描器匹配方法体后转译运行，并接入生产PlaybackSourceController和PlaybackQueueController。URI准备、AVSession停止、Seek等待和Native完成通知使用可控替身，覆盖准备期间停止、旧准备成功或失败后返回、立即重播、离页再进入、准备期间切换下一项，以及等待队列切换时另选文件、替换或清空队列。测试还检查正常停止保留完成回调、历史保存不阻塞Native停止、手动切换和自然完成后续播。它验证页面方法之间的控制流程，不渲染ArkUI，也不验证设备授权、真实编解码器或送显。

Host回归使用SDK中的TypeScript转译器和文件/Native替身，覆盖模型计算、文件调用顺序、任务租约、异步生命周期、错误保留、常亮状态、报告兼容/脱敏及SHA256读取边界。它不能验证ArkUI布局、系统URI授权或真实codec行为。

断点续播回归检查默认关闭、显式开启后读取有效历史位置、关闭后保留历史、临近片尾从头播放，以及设置草稿取消/应用、配置保存重载、旧11字段配置恢复和预设默认关闭。

`PlaybackConcurrency.test.cjs`检查历史写入串行、连续进度合并、最终保存等待，以及损坏记录隔离、去重、排序和数量限制。初始化测试分别阻塞Preferences获取和数据读取，再插入进度更新、完成标记和重复加载，确认新进度不被旧读取覆盖。保存测试区分缓存和落盘数据，检查单次保存最多尝试两次、失败返回false、不推进页面的已保存位置，以及最终flush和重新加载保留待保存快照。

播放历史还分别注入初始open、初始get和重载读取失败，确认更新、完成标记和flush不会覆盖尚未读出的旧记录，且不报告保存成功；读取恢复后合并旧历史与待保存进度。可控时钟检查5秒内高频更新不重读、到期并发请求共用一次读取、持续失败重新计时，以及最终flush立即恢复和完成进度仍为0。初始加载和重载分别覆盖`{}`、`null`、数字、字符串及无效JSON，核对原文和已知内存记录保留，更新与最终保存均不写入；恢复合法数组后再合并待保存的完成位置。

写入退避回归分别注入put和flush持续失败：20次间隔250ms的进度更新只进行两次写入尝试和两条警告；到期保存最新快照，成功后解除退避。并发测试检查已排队进度在前一次失败后也不重复写入；强制进度、完成标记和最终flush可绕过退避。页面回归延迟完成标记与flush，确认界面已清理、下一项可起播，迟到的保存不会重置新播放状态；返回false或抛错均执行收尾并处理失败。页面与真实历史模型组合检查完成标记两次写入失败后，最终flush仍能保存0位置。上述故障测试使用Host替身，设备存储故障结果单独记录。

来源切换回归接入页面的生产进度保存方法，分别在播放中选择文档、媒体库文件、最近历史和录制成品，确认旧任务完成前不改播放路径，进度始终保存到旧URI；停止期间连续选择只启动最后一项，清空队列可取消待播目标。另检查普通来源选择仍查询恢复位置开关，等待Seek的旧停止请求不能停止新播放。

队列回归还检查停止期间连续点击不同队列项、重新点击正在停止的项，确认只请求一次Native停止，最终只启动最后选择。分别在AVSession停止和Seek等待处追加项目，确认追加不取消原目标、不重复入队，起播后仍保留新增项目；清空和替换队列的取消回归同时保留。

完成保存回归还覆盖初始open或get失败、损坏原文恢复时内存尚无对应记录的场景，确认完成操作被保留；同文件的新进度或重读期间的重播会取代旧完成标记。页面缓存时长和Native完成时长分别取0与有效值组合，确认自然完成始终执行标记及最终flush；真实历史模型组合验证短媒体可用Native完成时长补建已完成记录。设备用例及Pass结果在`ohosTest.md`逐项列出。

`PlaybackStartup.test.cjs`接入生产启动控制器、任务协调器和文件活动门控，检查正常完成、停止、错误、重复完成通知、EBADF，以及输入关闭结果不明时保留File、租约和待处理会话。空文件、stat失败、Native同步拒绝和异步初始化失败分别覆盖；后续媒体任务被阻止，不重新打开文件或重试close。页面回归另检查手动待续队列、自然续播、错误恢复和已等待Seek的续播均取消，界面清理完成并提示重启。文件接口和Native完成通知使用Host替身，真实故障行为按设备用例验证。

文件选择测试使用可控的选择器、授权Promise和计时器，检查文件/相册乱序返回、授权期间切换最近播放、离页后重入、过期错误提示、清空队列和来源弹窗失效；当前请求仍可正常入队播放。这些替身只验证控制流程，不证明设备选择器或URI授权行为。AVSession测试在创建、元数据、队列、启动入口、激活和状态写入处暂停异步调用，再插入停止、重播或切换媒体，检查旧任务不会覆盖新会话，旧会话以STOP结束且仅销毁一次。监听故障回归分别在play、seek和setSpeed注册处抛错，确认会话不激活、已注册监听被清理、会话仅销毁一次，重试可注册全部9项控制。`VerificationRunner.test.mjs`检查非零退出、启动失败、日志输出和挂起进程超时清理。

A-B循环回归运行生产控制器，在一次Seek等待期间分别重新设置A、重设A和B、仅重设B及清除循环，再返回旧请求的失败、完成、取消和被替换结果，共16种组合。检查旧结果不覆盖新端点或开关，停用后无轮询，启用的新循环仍能向当前A点发出Seek；当前请求失败仍清除循环。计时器、播放信息和Seek为Host替身；实际送显与设备Seek回归结果为Pass。

Native入口按[targets.json](native/targets.json)编译并执行全部15个测试，复用生产实现和SDK声明，由测试提供OHOS函数替身。宿主编译器直接解析SDK版本可用性属性，不再通过宏重定义保留标识符。`-Wno-ignored-attributes`仅关闭宿主平台无法应用的SDK属性提示，`--gc-sections`排除测试没有调用的设备代码；运行通过不能代替设备上的编码、图形或驱动验证。测试产物写入已忽略的`.validation/`。

`AudioCodecBufferTest`直接组合AudioDecoder与AudioOutputPump，检查同步EOS在解码器内调用Free并返回END、异步EOS在输出线程归还、尾部PCM顺序、EOS不进入PCM回调、Buffer归还调用次数，以及查询超时、查询失败和查询期间停止的区别。新增组合覆盖暂停期间不消费输出、重建时丢弃待送PCM、EOS归还后释放并重建解码器；同步和异步模式各重复20次。同步EOS按当前接口约定不检查Free返回值，测试只确认调用一次、清空Buffer且不重复归还；异步EOS和普通PCM归还失败仍按错误处理。同时检查音频编码器Stop前Flush、编解码器Release前Flush/Stop，以及清理失败后仍执行Destroy且不重复销毁。

同步视频查询返回TRY_AGAIN_LATER时按AGAIN重试，调用层等待日志改为每120次一次的DEBUG，查询失败仍报错。真机回放日志未再出现原输入等待超时ERROR和重复WARN；本次设备未显示DEBUG，未据此验证限频次数。此前预览取消时仍能复现音频Flush返回8，当时的临时诊断字段记录为started=0、eosSubmitted=0。当前已撤回音频编码器的临时状态字段和日志修改，Flush/Stop顺序和同步音频EOS分支保持原样。

`VideoFramePacerTest`使用片尾日志中的14帧PTS，检查0.5x、1x和2x的帧间隔与总时长，以及暂停恢复或Seek后重建时钟锚点。`VideoEncoderBufferTest`调用生产音频回调，检查最后一包PCM不足回调长度时的补零、有效帧计数，以及音频结束后的纯补零回调不会覆盖视频推进的播放位置。这些宿主测试覆盖计时器和回调；Player在音频结束时唤醒等待、保留当前视频帧并切换时钟的完整链路仍需按真机用例验证。

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
| 2 | 恢复Seek晚返回会在停止、离页、完成或重播后提示成功；等待前后都核对当前播放。 | PlaybackPageLifecycle：testLateResumeFeedback |
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

测试代码与说明同样遵守[代码与文档编写约定](../CONTRIBUTING.md)。C++测试函数有效代码不超过50行，lambda显式捕获；拆分测试时保留同步边界、断言和重复次数。

`PlaybackLifecycleTest`的工作线程按值捕获共享状态，线程对象保留在外层上下文，停止处理使用普通函数。启动函数返回后回调仍持有有效状态；各轮退出和重播均Join，并检查回调释放共享状态的所有权，避免悬空引用和所有权环。返回、保存或异步执行的回调按`G.RES.05-CPP`核对捕获方式与对象有效期，文档说明回调执行及结束条件。
