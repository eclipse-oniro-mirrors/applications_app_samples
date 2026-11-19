# 合理使用系统接口测试用例归档

## 一、范围与运行方式

保留原有 30 条自动化用例，新增 13 套、984 条逻辑用例。默认注册 16 套、1010 条用例；应用信息和入口启动的 4 条 `EntryAbilityTest` 用例仅在显式选择该测试类时注册。混合选择其他类不会注册 Ability 套件，不以删除 UI 功能降低测试依赖。

```bash
hvigorw --mode module -p module=entry@default -p product=default assembleHap
hvigorw --mode module -p module=entry@ohosTest -p product=default assembleHap
```

设备执行前，在 DevEco Studio 中为 default 产品配置合法签名，连接标准系统设备，然后运行 entry 模块的 `Run 'test'`。默认执行逻辑/SDK 用例；单独选择 `EntryAbilityTest` 执行应用信息及入口启动验证。

新增用例的 `@tc.name`、`@tc.number` 与 `it` 名称相同，按套件内四位序号递增；原有用例名称和编号不变。每条用例有输入日志、断言前日志和成功结束日志，断言失败由 Hypium 报告，不以输出结束日志代替成功判定。

## 二、新增逻辑矩阵

下表编号均以 `SUB_REASONABLE_SYSTEM_INTERFACE_` 为前缀，起止序号均包含在内。具体输入、步骤和固定预期在对应源码的每条 `@tc.desc` 及断言中，不以同一被测函数生成预期。

| 源文件 | 编号后缀与范围 | 数量 | 测试点和预期 |
|---|---|---:|---|
| [DisplayLimitLogic.test.ets](entry/src/ohosTest/ets/test/DisplayLimitLogic.test.ets) | LOGIC_TEXT_LIMIT_0001–0096 | 96 | 空、单字符、控制符、组合符、代理对、1998/1999/2000/2001/4000 等边界；固定完整输出、截断不新拆合法代理对、源不变及重复调用一致 |
| [DisplayDecodeLogic.test.ets](entry/src/ohosTest/ets/test/DisplayDecodeLogic.test.ets) | LOGIC_TEXT_DISPLAYDECODE_0001–0096 | 96 | 明确 UTF-8 字节经真实页面共用函数解码；固定限长结果、字节输入不变、独立调用隔离 |
| [ZeroWidthSpaceLogic.test.ets](entry/src/ohosTest/ets/test/ZeroWidthSpaceLogic.test.ets) | LOGIC_TEXT_ZEROWIDTH_0001–0096 | 96 | 按码点插入、已有零宽字符保留、CRLF 相邻、代理对、长度与字符计数、源不变及调用隔离；不承诺字素簇完整 |
| [TextDecoderStreamLogic.test.ets](entry/src/ohosTest/ets/test/TextDecoderStreamLogic.test.ets) | LOGIC_TEXT_DECODERSTREAM_0001–0096 | 96 | 48 条多字节拆分、16 条逐字节流、16 条 replacement、16 条 fatal 错误及恢复；手工字节对应固定文本、空流及 flush 边界 |
| [IntlNumberLogic.test.ets](entry/src/ohosTest/ets/test/IntlNumberLogic.test.ets) | LOGIC_INTL_NUMBER_0001–0072 | 72 | 十进制、正负零、分组、舍入、符号与有效位；两实现分别对具体常量断言 |
| [IntlScientificLogic.test.ets](entry/src/ohosTest/ets/test/IntlScientificLogic.test.ets) | LOGIC_INTL_SCIENTIFIC_0001–0072 | 72 | 科学/工程记数、1/3/21 有效位、大小数量级和邻接值；固定格式及选项预期 |
| [IntlLocaleLogic.test.ets](entry/src/ohosTest/ets/test/IntlLocaleLogic.test.ets) | LOGIC_INTL_LOCALE_0001–0072 | 72 | 规范化、地区、日历、小时制、编号系统、numeric、caseFirst 与独立实例；原始类型及值均符合预期 |
| [IntlDateTimeLogic.test.ets](entry/src/ohosTest/ets/test/IntlDateTimeLogic.test.ets) | LOGIC_INTL_DATETIME_0001–0072 | 72 | UTC 固定时间、前后一天、闰年/月末/年末；固定输出与全部 Date 输入不变 |
| [IntlCollatorLogic.test.ets](entry/src/ohosTest/ets/test/IntlCollatorLogic.test.ets) | LOGIC_INTL_COLLATOR_0001–0072 | 72 | 比较方向、反向、自反、数字排序、忽略标点及不可变源数组；固定排序及符号 |
| [IntlPluralLogic.test.ets](entry/src/ohosTest/ets/test/IntlPluralLogic.test.ets) | LOGIC_INTL_PLURAL_0001–0072 | 72 | 英文基数/序数、中文 other、整数/小数/负数；独立类别规则 |
| [IntlRelativeLogic.test.ets](entry/src/ohosTest/ets/test/IntlRelativeLogic.test.ets) | LOGIC_INTL_RELATIVE_0001–0072 | 72 | 八种单数时间单位、auto/always、方向与负零；独立英文固定结果 |
| [ResourceObjectTraceLogic.test.ets](entry/src/ohosTest/ets/test/ResourceObjectTraceLogic.test.ets) | LOGIC_RESOURCE_RESOURCE_0001–0048 | 48 | 真实封装传入同一 Resource；start/read/finish 顺序、各阶段错误与错误覆盖、全部字段不变、retry 新值及一次读取 |
| [ResourceIdTraceLogic.test.ets](entry/src/ohosTest/ets/test/ResourceIdTraceLogic.test.ets) | LOGIC_RESOURCE_ID_0001–0048 | 48 | 真实封装仅传入精确 ID；同样验证异常、完整输入保护及重试隔离 |

资源矩阵使用可注入的边界记录器验证生产封装，不将合成 ID 当作实际 SDK 有效资源。真实资源可用性由原有 ResourceManagerSync 用例承担。

国际化数值、Locale、UTC 日期和排序常量来自生成阶段 Node Intl/ICU 78.3；复数及相对时间主要使用独立规则并离线交叉检查。kit 和 runtime 各自对固定预期断言，不互为唯一 oracle。UTC 和 ASCII 不保证跨 ICU/CLDR 版本完全相同；设备发现差异时应保留原始失败证据并核对平台语义与数据版本，不把 actual 写回 expected 消除失败。

## 三、保留的原有用例

下表编号同样以 `SUB_REASONABLE_SYSTEM_INTERFACE_` 为前缀。预置条件为已签名安装本工程，并由测试进程获得应用上下文；原有 SDK 套件需要 `sanguo.txt` 与应用字符串资源。

### Ability.test.ets：显式选择 EntryAbilityTest

| 编号后缀 | 原有用例名 | 步骤与预期 | 本轮设备结果 |
|---|---|---|---|
| ABILITY_0100 | testAppContext0001 | 获取上下文，校验资源管理器可用及应用名 | 未执行 |
| ABILITY_0200 | testBundleInfo0001 | 获取自身 BundleInfo，校验包名 | 未执行 |
| ABILITY_0300 | testBundleVersion0001 | 校验版本名 1.0.0 和版本号 1000000 | 未执行 |
| ABILITY_0400 | testStartEntryAbility0001 | await 启动 EntryAbility；失败 Promise 由 Hypium 报告 | 未执行 |

### ResourceManagerSync.test.ets

| 编号后缀 | 原有用例名 | 步骤与预期 | 本轮设备结果 |
|---|---|---|---|
| RESOURCEMANAGERSYNC_0100 | testGetStringSyncByResource0001 | Resource 参数读取，结果为非空字符串 | 修复前设备通过；修复后待确认 |
| RESOURCEMANAGERSYNC_0200 | testGetStringByNameSync0001 | 按 test 名称读取，结果为非空字符串 | 修复前设备通过；修复后待确认 |
| RESOURCEMANAGERSYNC_0300 | testGetStringByResourceAndNameEqual0001 | Resource 与名称读取结果相同 | 修复前设备通过；修复后待确认 |
| RESOURCEMANAGERSYNC_0400 | testGetStringSyncRepeatCall0001 | 重复读取五次，结果稳定 | 修复前设备通过；修复后待确认 |
| RESOURCEMANAGERSYNC_0500 | testGetStringSyncAnotherResource0001 | label 等于 Reasonable_Using_System_Interfaces | 修复前设备通过；修复后待确认 |
| RESOURCEMANAGERSYNC_0600 | testResourceIdValid0001 | 资源 ID 是正数 | 修复前设备通过；修复后待确认 |
| RESOURCEMANAGERSYNC_0700 | testGetRawFileContent0001 | 异步读取 sanguo.txt，字节非空 | 修复前设备通过；修复后待确认 |
| RESOURCEMANAGERSYNC_0800 | testGetRawFileContentSync0001 | 同步/异步读取字节长度相同 | 修复前设备通过；修复后待确认 |
| RESOURCEMANAGERSYNC_0900 | testGetRawFileContentMissingFile0001 | 缺失文件调用必须抛错 | 修复前设备通过；修复后待确认 |
| RESOURCEMANAGERSYNC_1000 | testGetStringSyncInvalidId0001 | 无效资源 ID 调用必须抛错 | 修复前设备通过；修复后待确认 |

### TextDecode.test.ets

| 编号后缀 | 原有用例名 | 步骤与预期 | 本轮设备结果 |
|---|---|---|---|
| TEXTDECODE_0100 | testDecodeRawFile0001 | 原有 decodeWithStream 解码，得到非空文本 | 修复前设备通过；修复后待确认 |
| TEXTDECODE_0200 | testDecodeResultContent0001 | 含“三国”，无 U+FFFD | 修复前设备通过；修复后待确认 |
| TEXTDECODE_0300 | testDecodeWithStreamChunk0001 | 原有流式解码与一次性结果相同 | 修复前设备通过；修复后待确认 |
| TEXTDECODE_0400 | testRawTextHasNoZeroWidthSpace0001 | 原资源不含 U+200B | 修复前设备通过；修复后待确认 |
| TEXTDECODE_0500 | testInsertZeroWidthSpace0001 | 原 BMP split 方案表征：长度 2n-1、插入 U+200B | 修复前设备通过；修复后待确认 |
| TEXTDECODE_0600 | testRemoveZeroWidthSpace0001 | 原 split 方案移除分隔符后还原资源原文 | 修复前设备通过；修复后待确认 |
| TEXTDECODE_0700 | testZeroWidthSpaceBoundary0001 | 原方案对空串及单字符不额外插入 | 修复前设备通过；修复后待确认 |

旧文本套件保留原 SDK/反例行为表征；不把旧 BMP 公式推广为新码点处理的通用规则。

### IntlInterface.test.ets

| 编号后缀 | 原有用例名 | 步骤与预期 | 本轮设备结果 |
|---|---|---|---|
| INTLINTERFACE_0100 | testRelativeTimeFormat0001 | 中文前一天格式，两实现相同且不等于原数字 | 修复前设备通过；修复后待确认 |
| INTLINTERFACE_0200 | testLocale0001 | zh-CN 两实现相同 | 修复前设备通过；修复后待确认 |
| INTLINTERFACE_0300 | testDateTimeFormat0001 | 固定日期，两实现相同且含 2025 | 修复前设备通过；修复后待确认 |
| INTLINTERFACE_0400 | testNumberFormat0001 | 十进制格式相同且不等于原数值字符串 | 修复前设备通过；修复后待确认 |
| INTLINTERFACE_0500 | testNumberFormatScientific0001 | 科学记数格式相同并包含 E | 修复前设备通过；修复后待确认 |
| INTLINTERFACE_0600 | testCollatorCompare0001 | 正反方向及自反比较符合预期 | 修复前设备通过；修复后待确认 |
| INTLINTERFACE_0700 | testCollatorSort0001 | 输出 a、b、c，源数组不改 | 修复前设备通过；修复后待确认 |
| INTLINTERFACE_0800 | testPluralRulesChinese0001 | 中文返回 other | 修复前设备通过；修复后待确认 |
| INTLINTERFACE_0900 | testPluralRulesEnglish0001 | 英文 1 返回 one，2 返回 other | 修复前设备通过；修复后待确认 |

## 四、本轮检视与验证记录

验证日期：2026-11-19。

- 已按 pr-review_origin 的 style、security、logging、typescript 和适用 basic 项检视。
- 修复限长及插入过程拆开合法代理对的问题；保留零宽反例本身的数据污染特征，并保持 CRLF 换行相邻。
- 资源封装和两种国际化 benchmark 在异常路径使用 finally 结束打点，原有构造类型、选项、每类 100 次及 trace 名称/ID 保留。
- 修复旧异步用例混用 Promise/done 的问题，失败交给 Hypium；补齐开始、结束及断言前日志，避免日志重复调用 SDK。
- runner 等待 monitor 注册与启动 Promise，去除公开 Want/Ability/mock 内容日志；保留可选 mock 功能，非法 mock 内容明确失败。
- 强化原始类型、options、全部 Date 输入和完整 Resource 首次/重试后的保护，不以字符串化掩盖数字或布尔类型错误。
- 本轮测试扩展未修改签名、包名、权限和静态资源。最终 SHA-256 检查中，35 个保护文件有 34 个与基线一致；根 build-profile.json5 与基线不同，当前存在 default 签名配置并成功生成签名包，未覆盖该配置。基线一致性审计因此仍报告这一差异，不把它当作全量一致通过。
- 未提交或推送。无 PR 链接和 Git 元数据，提交格式/目标分支、下载分支及二进制合入策略不能据此验收。保留原多页面性能演示布局和相关截图，未为结构/截图数量建议搬移页面或删减示例。

检视后最终复验结果：

| 项目 | 结果与范围 |
|---|---|
| 主包 assembleHap | 设备修复后 BUILD SUCCESSFUL，17 秒 792 毫秒，签名步骤完成 |
| ohosTest assembleHap | 设备修复后 BUILD SUCCESSFUL，22 秒 991 毫秒，签名步骤完成 |
| 新增逻辑矩阵主机回归 | 13 套，984/984 条通过，15,801 个断言，无意外原生调用 |
| benchmark / runner 主机边界 | 46/46 项通过；含每类构造第 1/50/100 次异常及 mock/monitor/start 错误 |
| 源码审计 | 用例名称和编号、断言前日志、120 列行宽、异步完成方式及六种套件选择路由通过 |
| 新增测试源码量 | 71,774 物理行，63,618 行去注释及空行有效测试代码；高于约五万行目标，不等于 Git 净改动量 |
| 原始基线保护审计 | 34/35 个配置和资源文件哈希一致，build-profile.json5 签名配置差异保留并报告，未全量通过 |
| 本轮设备修复保护快照 | 修复前后 35/35 个配置和资源文件哈希一致，全部 1014 个用例名称及编号保留；不替换原始基线 |
| Locale 单套设备回归 | 72/72 条通过，Failure 0、Error 0，OHOS_REPORT_CODE 0 |
| 16:04 设备附件 | 报告 75 条不同用例失败，均可对应当前源码断言；无完整执行/通过数量汇总，不声明全量通过 |
| 修复后本地设备整轮回归 | 已中断，未取得最终汇总；不作为完整结果 |

本轮主机回归仅覆盖新增矩阵及生产函数/runner 的主机边界执行。Node Intl/TextDecoder 是替身，不能证明真实 OpenHarmony SDK、ArkUI 或设备性能正确。原有 30 条用例保留，原有 59 处断言语义保留；默认 1010 条、总计 1014 条登记数量不等于设备执行结果。

最终构建已生成 entry-default-signed.hap 和 entry-ohosTest-signed.hap，两个包均已更新安装成功。本轮修复使用更新安装，未卸载、清数据或修改授权；16:04 附件记录的 IDE 部署流程另有卸载重装，两者是不同执行记录。编译和安装成功不等于设备全部通过。

### 设备修复与最新失败证据

- Locale 原测试把 kit 的 toString 原始表示必须规范化作为预期，缺乏接口规格依据；现在对完整序列化标签做规范化语义校验，并独立验证 baseName，保留 runtime 规范化断言、全部属性、类型和实例隔离断言。单套设备 72/72 条通过。
- 本设备 Array.from(string) 的快捷实现按 UTF-16 码元拆分，不能用作代理对的处理或码点计数。生产插入函数改为显式合并合法代理对及 CRLF；四套文本测试使用独立 UTF-16 计数，固定输出、字节、快照及用例编号保留。
- 修复前完整设备回归实际执行 1010 条：Pass 661、Failure 349、Error 0，OHOS_REPORT_CODE -1；仅收到 990 条终结事件，不能误写为只执行 990 条。修复后本地整轮回归已中断，未取得最终汇总。
- 16:04 附件列出 75 条不同用例失败，全部堆栈对应当前源码的断言行；没有新增失败编号，Locale、显示限长/解码及零宽插入的旧错误未再出现。附件只有测试完成提示，没有各套件通过数及整轮汇总，不能据此宣称其余 935 条通过、所有终结事件已收到或 1010 条全量验收完成。
- 附件同时选择 EntryAbilityTest 和其他类，按现有路由不注册 Ability 套件；不能把这次混合选择作为 4 条 Ability 的验证证据。

以下编号后缀均接在 SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_ 后，失败预期保持原样：

| 失败类别 | 数量 | 编号后缀 | 证据与处理边界 |
|---|---:|---|---|
| 科学/工程计数有效位 | 40 | INTL_SCIENTIFIC_0001–0012、0016–0019、0021–0024、0037–0048、0052–0055、0057–0060 | 最大有效位 1 时 0.125 应为 1E-1，设备为 1.25E-1；失败止于 kit 断言，不证明后续 runtime 断言通过 |
| 数值默认舍入 | 14 | INTL_NUMBER_0011、0013、0014、0018、0020、0022、0024–0026、0030、0032、0034、0036、0047 | SDK API 18 起默认 halfExpand，0.125 保留两位应为 0.13，设备为 0.12；不是可直接接受的格式数据差异 |
| 数值有效位 | 8 | INTL_NUMBER_0051、0052、0054、0055、0057–0060 | 有效位选项未按规格限制输出；不以设备实际值替换预期 |
| 数值整数补零 | 7 | INTL_NUMBER_0061、0062、0065–0068、0071 | minimumIntegerDigits 为 3 时 1 应为 001，设备为 1；保留补零合同检查 |
| 空输入 replacement 终结 | 3 | TEXT_DECODERSTREAM_0072–0074 | 待处理的不完整 UTF-8 在 stream:false 空输入终结时应输出 U+FFFD，设备返回空串 |
| 空输入 fatal 终结 | 3 | TEXT_DECODERSTREAM_0088–0090 | fatal:true 的不完整 UTF-8 在空输入终结时应抛错，设备未抛错；不泛化为所有 fatal 行为失败 |

依据当前 SDK 的 @ohos.intl.d.ts 中 minimumIntegerDigits、minimumSignificantDigits、maximumSignificantDigits 和 roundingMode 合同，以及 @ohos.util.d.ts 中 decodeToString 的 stream 合同，上述 75 项保留为平台回归失败。设备已确认 API 26、OpenHarmony-7.1.0.22；修复需要目标系统对应实现，不在 Sample 中添加改变语义的兼容包装、删除用例或回写 actual 消除失败。

## 五、手工 UI 与性能验证

| 场景 | 步骤 | 预期 | 本轮结果 |
|---|---|---|---|
| 拉起应用 | 签名安装后启动 | 首页正常显示 | 未执行 |
| getStringSync(Resource) | 首页进入对应页面 | 正常显示，资源对象路径打点结束 | 未执行 |
| getStringSync(id) | 首页进入对应页面 | 正常显示，ID 路径打点结束 | 未执行 |
| UsingWordBreak | 进入断行正例 | 片段正常折行，无新增零宽字符 | 未执行 |
| UsingZeroWidthSpace | 进入断行反例 | 片段显示、CRLF 不拆断；仍有额外零宽字符 | 未执行 |
| RuntimeInterface | 进入 Intl 反例 | 六类对象构造，打点正常闭合 | 未执行 |
| LocalizationKitInterface | 进入 intl 正例 | 六类对象构造，打点正常闭合 | 未执行 |
| 性能对比 | 相同设备/版本/输入，多轮采集 trace 与帧率 | 区分实际接口耗时及封装/打点开销 | 未执行 |

逻辑断言通过不是 UI 或性能验收。不得由字符数推断布局开销必然翻倍，也不得由主机结果宣布 intl 在目标设备上更快。
