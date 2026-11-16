# AVCodec验证

在示例目录执行`node scripts/verify.mjs`。默认依次执行Host、Native、CodeLinter、HAP构建，任一步失败即退出；未安装依赖也视为失败，不自动跳过阶段。PR修改应通过完整命令，并附构建产品、SDK版本和退出码。真机操作另按[ohosTest.md](../ohosTest.md)执行。

## 环境和参数

- Node：DevEco Studio随附版本。脚本使用当前Node运行Host、CodeLinter和Hvigor。
- `OHOS_SDK_HOME`或`--sdk`：同时包含ets和native的SDK版本目录。
- `DEVECO_STUDIO_HOME`或`--studio`：包含plugins、tools、jbr的DevEco Studio安装目录。
- Linux：Clang及系统C++17开发环境。Windows：WSL中的上述环境；用`AVCODEC_WSL_DISTRO`或`--wsl-distro`指定发行版。编译器默认使用`clang++`，可通过`CXX`或`--cxx`指定Linux或WSL内的Clang路径。
- HAP构建使用项目已有product=default、entry@default配置，签名配置由本机或CI提供。脚本不改签名设置。

单阶段可用`--only host`、`--only native`、`--only lint`、`--only build`。定位单个Native测试可再传`--native-test TranscodeAudioPipelineTest`；单项通过不能代替完整验证。CI可直接调用默认命令，远端必需检查由仓库维护者设置。

## 检查范围

Host回归使用SDK中的TypeScript转译器和文件/Native替身，覆盖模型计算、文件调用顺序、任务租约、异步生命周期、错误保留、常亮状态、报告兼容/脱敏及SHA256读取边界。它不能验证ArkUI布局、系统URI授权或真实codec行为。

断点续播回归检查默认关闭、显式开启后读取有效历史位置、关闭后保留历史、临近片尾从头播放，以及设置草稿取消/应用、配置保存重载、旧11字段配置恢复和预设默认关闭。

Native入口按[targets.json](native/targets.json)编译并执行全部14个测试，复用生产实现和SDK声明，由测试提供OHOS函数替身。Clang直接解析SDK版本可用性属性，不再通过宏重定义保留标识符。`-Wno-ignored-attributes`仅关闭宿主平台无法应用的SDK属性提示，`--gc-sections`排除测试没有调用的设备代码；运行通过不能代替设备上的编码、图形或驱动验证。测试产物写入已忽略的`.validation/`。

`AudioCodecBufferTest`直接组合AudioDecoder与AudioOutputPump，检查同步EOS在解码器内调用Free并返回END、异步EOS在输出线程归还、尾部PCM顺序、EOS不进入PCM回调、Buffer归还调用次数，以及查询超时、查询失败和查询期间停止的区别。同步EOS按当前接口约定不检查Free返回值，测试只确认调用一次、清空Buffer且不重复归还；异步EOS和普通PCM归还失败仍按错误处理。同时检查音频编码器Stop前Flush、编解码器Release前Flush/Stop，以及清理失败后仍执行Destroy且不重复销毁。

`VideoFramePacerTest`使用片尾日志中的14帧PTS，检查0.5x、1x和2x的帧间隔与总时长，以及暂停恢复或Seek后重建时钟锚点。`VideoEncoderBufferTest`调用生产音频回调，检查最后一包PCM不足回调长度时的补零、有效帧计数，以及音频结束后的纯补零回调不会覆盖视频推进的播放位置。这些宿主测试覆盖计时器和回调；Player在音频结束时唤醒等待、保留当前视频帧并切换时钟的完整链路仍需按真机用例验证。

也可使用同一份清单运行CMake/CTest（Linux或WSL，CMake至少3.19）：

```sh
cmake -S tests/native -B .validation/cmake -DCMAKE_CXX_COMPILER=clang++ -DOHOS_SDK_HOME="$OHOS_SDK_HOME"
cmake --build .validation/cmake --parallel
ctest --test-dir .validation/cmake --output-on-failure
```

CodeLinter使用正式配置[code-linter.json5](../code-linter.json5)，检查全部生产ets文件，排除依赖与构建目录。[lint-baseline.json](lint-baseline.json)记录本轮前已存在的273条结果，包括格式项和Promise类型识别误报。入口按文件、规则、级别、完整信息、源代码行和出现次数匹配；新增或变更的error/warn使检查失败，完整结果仍保存在`.validation/lint.json`。基线只用于记录已有问题，禁止为通过检查而批量追加新告警。修复存量问题后应删去对应记录；新增规则或更新检查器时需单独评审基线变化。

构建阶段调用Hvigor assembleHap，并设置随附JBR。构建时生成应用版本、提交号、源码SHA256及时间到rawfile/build-info.json，该文件不入库。源码校验覆盖应用源码、资源和列入生成脚本的构建元数据，排除本机签名配置及自身生成文件。没有Git记录时提交号显示unknown，仍计算源码校验值。
