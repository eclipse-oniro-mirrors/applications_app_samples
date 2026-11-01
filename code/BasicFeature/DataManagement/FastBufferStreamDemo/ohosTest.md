# FastBufferStreamDemo 测试用例归档

## 测试环境

- 设备：RK3568 开发板（DAYU200），OpenHarmony 7.0.0.46 Beta1 / API 26，分辨率 720×1280（断点 `sm`）
- 应用：`com.samples.fastbufferstreamdemo`
- 测试框架：Hypium，测试模块 `entry_test`，执行器 `OpenHarmonyTestRunner`
- 开发环境：DevEco Studio 6.1.1，编译 SDK API 26，`compatibleSdkVersion 6.1.1(24)`
- 测试代码：`entry/src/ohosTest/ets/test/`，9 个套件 74 条用例，由 `List.test.ets` 聚合

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试结果 |
| --- | --- | --- | --- | --- | --- |
| 应用启动与首页渲染 | 设备已安装应用 | 启动 `EntryAbility` | 显示设备信息卡、9 个场景按钮与事件日志面板 | 否 | Pass |
| 场景1 FastBuffer 基础操作 | 位于首页 | 点击场景1 | 同步完成创建、二进制读写、hex / base64 编码转换、concat / copy / subarray、equals / compare，日志打印魔数 `0x4F484F53`、版本 20 与各步骤预期 / 实际值 | 否 | Pass |
| 场景2 性能对比 | 位于首页 | 点击场景2 | 同一负载（1 万轮 4B 写读 + 2000 片拼接）分别用 fastbuffer 与 buffer 执行，两套校验和与拼接长度一致，日志给出耗时与倍数关系；执行期间不触发 `THREAD_BLOCK_6S` | 否 | Pass |
| 场景3 Writable 流式写入 | 位于首页 | 点击场景3 | 异步执行，cork / uncork 分批写入，越过高水位线时 `write()` 返回 `false` 并记录背压；`finish` 校验文件 409600B | 否 | Pass |
| 场景4 Readable 流式读取 | 位于首页；未运行场景3 时使用 200KB 兜底文件 | 点击场景4 | 按 4KB 分块消费，`on('data')` 累计块数与字节数，`on('end')` 总字节与文件大小一致，日志强调未整载 | 否 | Pass |
| 场景5 三流流水线 | 位于首页 | 点击场景5 | Readable→Transform→Writable 级联完成，`doFlush` 追加尾块，落盘 20502B，文件头读回已转大写 | 否 | Pass |
| 场景6 协议封包与解包 | 位于首页 | 点击场景6 | 构造 64B 数据包并解析 CRC，`hexDump` 展示前 48B；翻转 payload 后重算 CRC 能检出篡改 | 否 | Pass |
| 场景7 TLV 多记录解析 | 位于首页 | 点击场景7 | 从 324B 带噪声字节流中定位魔数并解析 5 条记录；坏 CRC 标记后继续解析；砍掉末尾 6B 后返回 `errorIndex` 与 `errorMessage` | 否 | Pass |
| 场景8 pipe 流水线 | 位于首页 | 点击场景8 | `source.pipe(transform)` + `transform.pipe(sink)` 完成，落盘 2582B，文件头确认已大写 | 否 | Pass |
| 场景9 Duplex 双工流 | 位于首页 | 点击场景9 | 写侧内容转大写后回送读侧，`on('data')` 收到 `HELLOSTREAM`，`on('end')` 正常 | 否 | Pass |
| 场景按钮高亮与锁 | 位于首页 | 连续点击不同场景，观察异步场景执行期间按钮状态 | 最近点击的场景按钮深色高亮；流式场景执行期间按钮锁定，完成后自动解锁 | 否 | Pass |
| 事件日志面板 | 已执行多个场景 | 观察面板行格式与容量 | 行格式 `[HH:mm:ss][D/I/W/E][Tag] 消息`，新日志置顶，最多 120 条 | 否 | Pass |
| 断点自适应布局 | 设备已启动 | 观察 720×1280（`sm`）与 ≥600vp / ≥840vp 窗口 | `sm` 单栏上下布局；`md/lg` 左按钮右日志双栏 | 否 | Pass |
| hilog 输出 | 已执行若干场景 | `hdc shell hilog -T FastBufferStream` | 输出与面板一致的日志，domain `0x0001` | 否 | Pass |
| FastBuffer 基础 API | 设备侧测试环境 | 执行 `FastBufferBasics.test.ets` 16 条用例 | `from` / `alloc` 长度与填充、uint32 大小端写读、int8 负数、hex / base64 / hex 解码、concat、copy、subarray 共享内存、equals / compare、多字节 byteLength、isBuffer / fill 均正确 | 是 | Pass |
| FastBufferUtil 工具 | 设备侧测试环境 | 执行 `FastBufferUtil.test.ets` 16 条用例 | utf8 往返、hex / base64 编解码与非法输入抛错、大小端读写、concatAll、hexDump 行数 / ASCII 列 / 不可打印字符、CRC32 已知向量 / 空输入 / 篡改检测 / 十六进制格式均正确 | 是 | Pass |
| StreamPipeline 流式场景 | 设备侧测试环境（真实沙箱文件） | 执行 `StreamPipeline.test.ets` 11 条用例 | Writable 落盘大小与背压、Readable 总量一致、三流流水线大小 / 大写 / 尾块 / 复用、pipe 大小与大写、Duplex 往返与 EOF 均符合预期 | 是 | Pass |
| StreamFileUtil 文件流 | 设备侧测试环境（真实沙箱文件） | 执行 `StreamFileUtil.test.ets` 6 条用例 | 写入大小、读取总量与进度、内容还原、复制大小与内容一致、缺失文件 `getFileSize` 返回符合预期 | 是 | Pass |
| TlvUtil 协议工具 | 设备侧测试环境 | 执行 `TlvUtil.test.ets` 6 条用例 | 构造 / 解析往返、噪声中定位魔数、长度字段大端、坏 CRC 检出、截断记录、空流均正确 | 是 | Pass |
| PerfTimer 计时器 | 设备侧测试环境 | 执行 `PerfTimer.test.ets` 6 条用例 | start / stop 非负、未 start 的 stop 返回负数、measure 返回值与记录、summary 格式、clear 清空均正确 | 是 | Pass |
| DeviceUtil 设备与断点 | 设备侧测试环境 | 执行 `DeviceUtil.test.ets` 6 条用例 | 设备类型非空、形态互斥、断点边界、档案字段完整、宽屏与断点一致 | 是 | Pass |
| LogUtil 日志双通道 | 设备侧测试环境 | 执行 `LogUtil.test.ets` 6 条用例 | 回调投递、行格式含时间戳、级别过滤与标记、时间格式、错误级别投递 | 是 | Pass |
| Ability 冒烟 | 设备侧测试环境 | 执行 `Ability.test.ets` 1 条用例 | 用例通过 | 是 | Pass |

## 执行方式

设备侧测试（签名由 DevEco Studio 自动签名或本地签名材料提供）：

```bash
"<DevEco Studio>/tools/node/node" "<DevEco Studio>/tools/hvigor/bin/hvigorw.js" \
  assembleHap --mode module -p module=entry@ohosTest -p product=default --no-daemon
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap
hdc shell aa test -b com.samples.fastbufferstreamdemo -m entry_test \
  -s unittest OpenHarmonyTestRunner -s timeout 150000
```

查看应用日志：

```bash
hdc shell hilog -T FastBufferStream
```

## 验证结果

`Tests run: 74, Failure: 0, Error: 0, Pass: 74`（9 个套件：FastBufferBasics 16、FastBufferUtil 16、StreamPipeline 11、StreamFileUtil 6、TlvUtil 6、PerfTimer 6、DeviceUtil 6、LogUtil 6、Ability 1）。

## 补充说明

- 设备侧用例中，FastBuffer / TLV / 计时 / 日志 / 设备档案为纯逻辑断言；Stream 相关用例使用真实沙箱文件与真实 stream，场景 3–5/8/9 通过直接调用业务方法后断言落盘文件与日志。工程不含 UI 自动化用例，界面行为由上表中标为「否」的手工用例覆盖。
- 安装 ohosTest HAP 可能顶替设备上的主模块，测试完成后重新安装主 HAP 即可；自动化前建议 `power-shell wakeup` 并解锁，避免锁屏导致的“应用消失”假象。
- 场景 2 的基准取 1 万轮（约 1.2 秒），本 ROM 对 UI 线程阻塞超过约 6 秒会报 `THREAD_BLOCK_6S` 并杀进程；放大轮次时需改为分片 `setTimeout` 让出主线程。
- `entry/src/test/` 仅包含模板自带的 1 条本地冒烟用例，功能验证以 `entry/src/ohosTest` 下的 74 条设备侧用例为准。
