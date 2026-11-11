# AudioToVideoSync 测试设计说明 
- 工程：applications_app_samples / BasicFeature/Media/AudioToVideoSync 
- 测试模块：entry_test（ohosTest），目标 API 26 
- 规模：101 个套件，4,224 条 it（不含 List.test.ets 与 Shared） 
- 规范：@tc.number / @tc.name / @tc.desc / @tc.size / @tc.type / @tc.level，命名 testXxxNNNN 
- 最近修复：Base64/TextCodec/Buffer/OpenMode/FileIoContract 共 44 条失败已全部通过 
- 前置条件：设备解锁、无系统弹窗；main HAP 与 ohosTest HAP 均安装 

## 一、设计原则 
1. 契约级强断言：确定值精确断言；设备相关值用不变量；时间/性能用宽松上界与单调性。 
2. 不做假覆盖：镜像主代码常量再自证、恒真断言、|| 兜底、可选字段兜底一律禁止。 
3. 能 import 的真实实现优先直接调用：CommonConstants、fileIo、audio、media、display、systemDateTime、util/buffer/uri/url/集合。 
4. 矩阵化：文件大小段、打开模式、偏移、目录深度、音频 usage×rate×channel、时间间隔、UTF-8 脚本、Base64 向量。 
5. 复用基础设施：TestPace 事件循环让出、TestSupport 沙箱/编解码/清理、UiSession Driver 单例与重试。 

## 二、被测对象拆解 
- ArkTS：pages/Index、entryability/EntryAbility、common/CommonConstants。 
- Native：Player（解封装/解码线程/音画同步/倍速）、Demuxer、VideoDecoder、AudioDecoder、EglCore/PluginRender/PluginManager（Surface 与送显）。 
- 系统能力：fileIo、media.AVPlayer、audio.AudioRenderer、display、systemDateTime、util/buffer/uri/url/集合。 

## 三、风险与约束 
- 32 位设备必须包含 armeabi-v7a 产物；abilist 异常会导致原生库不解压，出现 libplayer 未加载/黑屏。 
- OnSurfaceCreatedCB 未触发时 pluginWindow_ 为空，SetSurface 被跳过，表现为有音频无画面。 
- AVPlayer 在各状态下对 play/pause/stop/seek 可能拒绝或静默保持，用例统一断言状态不变量。 
- 文件 API 语义差异：rmdir 对非空目录递归删除；rename 覆盖成功；0 长度 write 抛错；open 目录成功但 read 失败；空路径/超长名抛错。 
- UI 用例依赖前台环境；修改测试后若 install -r 未生效，需先 uninstall 再安装，避免执行旧 abc。 

## 四、覆盖维度与分类统计 
| 分类 | 套件数 | 用例数 | 职责 | 
|---|---:|---:|---| 
| Validation | 5 | 97 | 常量、布局、显示度量、取整、兼容矩阵 | 
| FileIo | 13 | 207 | 内容、大小、模式、偏移、句柄、目录、列表、stat、复制截断、Unicode | 
| Audio | 5 | 73 | Renderer 生命周期、格式、usage/channel/rate、音量、循环 | 
| Media | 1 | 7 | AVPlayer 状态机与 fd 源 | 
| Time | 6 | 65 | 墙钟、uptime、时区、日期、定时器精度与漂移 | 
| Integration | 5 | 32 | 文件+音频、显示+文件、工具类+文件、pipeline 压力 | 
| Performance | 3 | 16 | 操作时延、文件吞吐、音频生命周期吞吐 | 
| Stability | 2 | 9 | 文件/音频 50 次循环 | 
| Robustness | 4 | 30 | 文件/目录/媒体/路径非法输入 | 
| Utils | 8 | 75 | TextCodec、UUID、Base64、Buffer、URI/URL、集合 | 
| Interaction | 2 | 23 | 页面结构、按钮状态、返回与重复进入 | 
| 根目录基础/扩量 | 47 | 3,590 | 基础用例与 Expanded/More 矩阵套件 | 

## 五、用例规范 
- 每条用例唯一命名，完整 @tc 元数据，至少一个能因行为变化而失败的断言。 
- 异常优先断言具体错误码：13900002、13900015 等；拿不到错误码时断言“操作被拒绝 + 资源状态未变”。 
- 时序只写上限预算与单调关系，不写精确耗时；用例间通过 paceTurn 让出事件循环。 
- UI 只覆盖标题、按钮文本/启用态/顺序、重复进入与返回恢复，先解锁并清弹窗。 

## 六、执行方式 
```bash
hdc uninstall com.samples.AudioToVideoSync 
hdc install -r entry/build/default/outputs/default/entry-default-signed.hap 
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap 
hdc shell "a""a" test -b com.samples.AudioToVideoSync -m entry_test -s unittest OpenHarmonyTestRunner -s class clockContractTest,fileContentMatrixTest -s timeout 15000 
hdc shell "a""a" test -b com.samples.AudioToVideoSync -m entry_test -s unittest OpenHarmonyTestRunner -w 900000 
``` 

## 七、已知问题与修复记录 
| 问题 | 现象 | 处理 | 
|---|---|---| 
| Base64 空输入 | encodeToStringSync 空数组抛 Parameter error | 断言空输入被拒绝 | 
| TextEncoder 空串 | encode('') 返回 undefined，读 length 报错 | 改为空字节数组解码为空串 | 
| Buffer 偏移重复断言 | 同一 case 断言 readUInt8(0)==3 又 ==0 | 改为断言未写入偏移 readUInt8(1)==0 | 
| OpenMode 全 false | mode 合法为 0，却断言 mode>0 | 移除该断言，保留 CREATE 位与类型断言 | 
| 安装未生效 | 改完测试仍执行旧代码 | 先 uninstall 再安装 main + ohosTest | 

## 八、未直接覆盖 
- C++ Player::ProcessWaitTime 等同步算法无 native 单测（需新增 native 测试目标，当前不改生产构建）。 
- 图库选择器到真实播放的端到端自动化受系统 UI 与媒体资源限制，主要依赖手工验收。 
- 真实硬件解码/蓝牙时延需要设备组合验证。 

## 九、手工用例表 
| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 结果 | 
|---|---|---|---|---|---| 
| 相册视频正常播放 | 启动应用、设备解锁 | 点击播放，选择图库视频 | 视频正常播放、有画面有声音 | 否 | Pass | 
| 倍速播放 | 正在播放 | 点击 x1/x2/x3 | 倍速切换生效，音画仍同步 | 否 | Pass | 
| 返回后重新进入 | 播放页 | 返回桌面再进入 | 页面恢复，按钮初始状态正确 | 否 | Pass | 
| 异常视频 | 选择损坏或不支持格式 | 播放 | 不崩溃，停留在可恢复状态 | 否 | Pass | 
