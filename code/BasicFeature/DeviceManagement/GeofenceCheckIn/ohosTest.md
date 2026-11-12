# GeofenceCheckIn 自动化用例

本清单面向本工程的开发和测试人员，覆盖 `entry/src/ohosTest/ets/test` 下由 [List.test.ets](entry/src/ohosTest/ets/test/List.test.ets) 注册的 **41 个测试套件、369 个用例**。以下分节按 `List.test.ets` 的实际调用顺序排列，每个 `it()` 对应一行；编号保留前置注释的 `@tc.number` 原文，名称保留 `it()` 字面量，并核对 `@tc.name`。矩阵和穷举用例内部的数据循环仍计为一个用例，不把数据表中的每一行另行编号。

## 运行前提与阅读说明

- 在 DevEco Studio 中运行本工程的 ohosTest；设备或模拟器须能运行本工程。本文只说明代码中的操作和断言，不代表已经执行或通过测试。
- 文件测试在应用缓存目录创建和清理文件。数据库测试会写入配置、创建记录并删除记录，宜在专用测试安装上执行；配置快照恢复不等于恢复被清除的历史记录。
- 逻辑及矩阵用例由测试代码调用接口，不需要用户手动操作界面。表内数据表名称均指对应源文件中的常量；“逐项与预设一致”明确指所列输出字段与该行 `expected`（或对应命名字段）比较。
- 时间构造采用设备本地时间。真实围栏能力、定位开关及授权状态只影响 UI 围栏切换的成功／拒绝分支，不要求设备真实移动穿越围栏。网络测试检查网络名称及本地端口 1 请求的失败结果，不要求公网联网。
- UI 套件先写库预置 `Sample Fence`（纬度 `39.908722`、经度 `116.397499`、半径 `200`），启动 `EntryAbility`，处理“允许／仅使用期间允许”弹窗，必要时补齐表单。9 个 UI 用例按定义顺序执行，末尾的无效纬度用例会清空纬度字段。UI 的模拟签到／签退不以记录数量增减为断言；响应式用例不自动切换手机和平板。

## 1. [GeofenceTypes.test.ets](entry/src/ohosTest/ets/test/GeofenceTypes.test.ets)（4 个）

| 用例编号 | 用例名称 | 测试步骤 | 预期结果 |
| --- | --- | --- | --- |
| SUB_GEOFENCECHECKIN_TYPES_0100 | testCreateDefaultConfig0001 | 调用 `createDefaultConfig()`，读取全部配置字段。 | `name=''`，经纬度均为 0，`radius=DEFAULT_RADIUS`，`fenceId=INVALID_FENCE_ID`，`enabled=false`，`updatedAt=0`。 |
| SUB_GEOFENCECHECKIN_TYPES_0200 | testCreateEmptySummary0001 | 调用 `createEmptySummary()`，读取次数和时长并相加。 | `count=0`、`durationMs=0`，两者之和为 0。 |
| SUB_GEOFENCECHECKIN_TYPES_0300 | testGeofenceConstants0001 | 读取围栏错误码、开放记录标记及半径常量，比较半径顺序。 | `OPEN_END=-1`、`INVALID_FENCE_ID=-1`、`NO_ERROR=0`、`FENCE_CAPABILITY_UNSUPPORTED=801`；最小／默认／最大半径为 50／200／5000，严格递增。 |
| SUB_GEOFENCECHECKIN_TYPES_0400 | testTransitionActionEnum0001 | 读取 `FenceTransitionAction` 三个成员，逐对比较。 | `NONE=0`、`ENTER=1`、`EXIT=2`，三者互不相等。 |

## 2. [TimeUtil.test.ets](entry/src/ohosTest/ets/test/TimeUtil.test.ets)（5 个）

| 用例编号 | 用例名称 | 测试步骤 | 预期结果 |
| --- | --- | --- | --- |
| SUB_GEOFENCECHECKIN_TIME_0100 | testPadTwo0001 | 对 0、9、10、59、100 调用 `padTwo`，另取 7 的输出长度。 | 依次为 `00`、`09`、`10`、`59`、`100`；7 的输出长度为 2。 |
| SUB_GEOFENCECHECKIN_TIME_0200 | testFormatDuration0001 | 对 0、-500、999、1000、59999、60000、3600000、3661000、86399999 毫秒调用 `formatDuration`，另检查 125000 的输出长度。 | 依次为 `00:00:00`、`00:00:00`、`00:00:00`、`00:00:01`、`00:00:59`、`00:01:00`、`01:00:00`、`01:01:01`、`23:59:59`；125000 的输出长度为 8。 |
| SUB_GEOFENCECHECKIN_TIME_0300 | testFormatDateTime0001 | 格式化 0、-1 及本地 `2026-01-15 09:05:03` 的时间戳。 | 0、-1 均为 `--`；固定日期为 `2026-01-15 09:05:03`，长度 19，位置 11 起为 `09:05:03`。 |
| SUB_GEOFENCECHECKIN_TIME_0400 | testFormatTime0001 | 格式化 0、本地 `2026-11-06 23:59:09` 和 `2026-01-01 00:00:00`。 | 依次为 `--`、`23:59:09`、`00:00:00`；午夜输出长度为 8。本用例未单独断言负时间戳。 |
| SUB_GEOFENCECHECKIN_TIME_0500 | testGetDayStart0001 | 对本地 `2026-01-15` 的 09:30 和 22:15 调用 `getDayStart`，格式化结果，再对日首重复调用。 | 两结果相等且均不晚于输入；时刻为 `00:00:00`，日期为 `2026-01-15`，再次归一化不变。 |

## 3. [BasicUtil.test.ets](entry/src/ohosTest/ets/test/BasicUtil.test.ets)（7 个）

| 用例编号 | 用例名称 | 测试步骤 | 预期结果 |
| --- | --- | --- | --- |
| SUB_GEOFENCECHECKIN_BASIC_0100 | testStringChecks0001 | 对 `undefined`、`''`、`'a'` 调用 `isEmptyString`；再对空格和 `a b` 调用 `isBlank`，对缺失值和带空格的 x 调用 `trimSafe`。 | 空值判定依次 true、true、false；空白判定依次 true、false；修剪依次 `''`、`x`。 |
| SUB_GEOFENCECHECKIN_BASIC_0200 | testStringTransforms0001 | 对 `geofence`、空串、`aBc` 首字母大写；反转 `abc`、空串，再对 `abc` 双重反转。 | 首字母结果为 `Geofence`、`''`、`ABc`；反转为 `cba`、`''`，双重反转恢复 `abc`。 |
| SUB_GEOFENCECHECKIN_BASIC_0300 | testCountOccurrences0001 | 调用 `countOccurrences` 检查 `aXbXc/X`、`aaa/aa`、`abc/空目标`、`abc/z`、`空源/a`。 | 次数依次为 2、1、0、0、0，重叠的 `aa` 只计一次。 |
| SUB_GEOFENCECHECKIN_BASIC_0400 | testNumberHelpers0001 | 限幅 5、-3、99、1 到 [1,10]；调用随机数单点、倒置区间和 [1,100]；判断 1、0、-1、NaN、Infinity 是否为正数。 | 限幅依次 5、1、10、1；随机单点为 1、倒置区间 `(5,3)` 为 3，普通结果在 [1,100]；仅 1 的正数判定为 true。 |
| SUB_GEOFENCECHECKIN_BASIC_0500 | testFormatPercent0001 | 格式化 0.256、`(0.5,2)`、0、1，检查默认结果后缀。 | 依次 `25.6%`、`50.00%`、`0.0%`、`100.0%`，默认结果以 `%` 结尾。 |
| SUB_GEOFENCECHECKIN_BASIC_0600 | testValidationHelpers0001 | 校验邮箱 `a@b.com/bad/a@b`、手机 `13800138000/12800138000/1380013800`、身份证 `11010519491231002X` 及小写 x、缺位、错校验码样本。 | 邮箱和手机均依次 true、false、false；正确身份证及小写 x 为 true，缺位和 `110105194912310021` 为 false。 |
| SUB_GEOFENCECHECKIN_BASIC_0700 | testArrayHelpers0001 | 去重 `a,b,a,c,b` 和空数组；拼接含空项数组、全空项数组、单项；将布尔值转为标记。 | 去重为 3 项 `a,b,c`；空数组长度 0；拼接为 `a-b`、`''`、`x`；true→1、false→0。 |

## 4. [GeofenceValidation.test.ets](entry/src/ohosTest/ets/test/GeofenceValidation.test.ets)（3 个）

辅助函数 `makeConfig` 填入名称 `test`、`fenceId=-1`、停用状态和零更新时间，只改变传入的经纬度、半径。

| 用例编号 | 用例名称 | 测试步骤 | 预期结果 |
| --- | --- | --- | --- |
| SUB_GEOFENCECHECKIN_VALIDATION_0100 | testValidateConfigValid0001 | 检查半径常量；校验 `(39.908722,116.397499,200)`，逐次替换纬度 ±90、经度 ±180、半径 MIN_RADIUS/MAX_RADIUS。 | 最小／最大半径为 50／5000；普通配置及上述所有端点配置均返回 true，端点包含在有效范围内。 |
| SUB_GEOFENCECHECKIN_VALIDATION_0200 | testValidateConfigBadLatitude0001 | 保持经度 116.397499、半径 200，依次校验纬度 90.1、-90.1、NaN。 | 三种配置均返回 false。 |
| SUB_GEOFENCECHECKIN_VALIDATION_0300 | testValidateConfigBadLongitudeRadius0001 | 保持其他字段有效，校验经度 ±180.1 和半径 49.9、5000.1、0、-1。 | 六种配置均返回 false。 |

## 5. [FileSecurityUtil.test.ets](entry/src/ohosTest/ets/test/FileSecurityUtil.test.ets)（6 个）

文件路径位于 `cacheDir`。清理辅助函数 `safeDeleteFile` 先检查存在性再删除；各文件操作通过 `finally` 清理，套件结束时再清理文件和目录。

| 用例编号 | 用例名称 | 测试步骤 | 预期结果 |
| --- | --- | --- | --- |
| SUB_GEOFENCECHECKIN_SECURITY_0100 | testSecurityDigest0001 | 计算空串和 `abc` 的 MD5，再计算 `abc` 的 SHA256。 | 空串 MD5=`d41d8cd98f00b204e9800998ecf8427e`；abc MD5=`900150983cd24fb0d6963f7d28e17f72`、长度32；abc SHA256=`ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad`、长度64。 |
| SUB_GEOFENCECHECKIN_SECURITY_0200 | testSecurityBase64RoundTrip0001 | 编码并解码 `GeofenceCheckIn`；对 `鸿蒙签到` 编码两次，再解码。 | 英文解码长度15，索引0/8/13/14为71/67/73/110；中文两次编码相同、长度为4的倍数，解码字节数12。未逐字节比较中文内容。 |
| SUB_GEOFENCECHECKIN_SECURITY_0300 | testSecurityUuidAndHex0001 | 生成两个 UUID 和两份8字节随机十六进制串，检查长度、分隔及每个字符。 | 首个 UUID 长36、分为5段，两 UUID 不同；首串长16、两串不同，索引0/7/15及全体字符均属于 `0123456789abcdef`。 |
| SUB_GEOFENCECHECKIN_SECURITY_0400 | testSecurityFileWriteReadDelete0001 | 向 `gc_sec_test_write.txt` 写入 `hello geofence 2026`，检查存在、读回内容和大小，再删除。 | 写后存在；读回文本完全相同；大小19字节；删除后不存在。 |
| SUB_GEOFENCECHECKIN_SECURITY_0500 | testSecurityFileCopyRename0001 | 写入 `copy rename payload` 到 src，复制到 dst，读双方内容和大小；将 dst 重命名到 renamed。 | 副本内容等于原文且与源内容相同；两文件大小相等；重命名后 dst 不存在、renamed 存在。 |
| SUB_GEOFENCECHECKIN_SECURITY_0600 | testSecurityDirOps0001 | 创建 `gc_sec_test_dir` 两次，写入 `one.txt`，读取目录条目。 | 两次创建后目录均存在；条目列表非空且含 `one.txt`。 |

## 6. [RuntimeNetUtil.test.ets](entry/src/ohosTest/ets/test/RuntimeNetUtil.test.ets)（4 个）

| 用例编号 | 用例名称 | 测试步骤 | 预期结果 |
| --- | --- | --- | --- |
| SUB_GEOFENCECHECKIN_RUNTIME_0100 | testRuntimeDeviceInfo0001 | 调用 `getDeviceModel`、`getOsFullName`、`getSdkApiVersion`。 | 型号及系统名称非空；SDK API版本≥9。 |
| SUB_GEOFENCECHECKIN_RUNTIME_0200 | testRuntimeBundleInfo0001 | 调用 `getBundleName`、`getAppVersionName`。 | 包名为 `com.samples.geofencecheckin`、版本名为 `1.0.0`，二者非空。 |
| SUB_GEOFENCECHECKIN_RUNTIME_0300 | testRuntimeNetTypeName0001 | 连续两次调用 `getNetTypeName`。 | 第一次非空且属于 None/Unknown/Wi-Fi/Cellular/Ethernet/Bluetooth/VPN；两次结果相同。允许无网络。 |
| SUB_GEOFENCECHECKIN_RUNTIME_0400 | testRuntimeHttpFailure0001 | 对 `http://127.0.0.1:1/gc_no_such` 先 GET，再 POST `payload`，超时参数均3000毫秒。 | GET：`success=false`、`responseCode=-1`、`body=''`、错误消息非空；POST仅断言 `success=false`、`responseCode=-1`。 |

## 7. [RecordStore.test.ets](entry/src/ohosTest/ets/test/RecordStore.test.ets)（6 个）

套件获取顶层 UIAbility 的 context，保存原配置并清空记录；结束时清空测试记录、恢复配置。每个用例通过 `requireContext()` 获取此 context，并先清空记录。

| 用例编号 | 用例名称 | 测试步骤 | 预期结果 |
| --- | --- | --- | --- |
| SUB_GEOFENCECHECKIN_STORE_0100 | testStoreConfigRoundTrip0001 | 保存 `test_store_config`（纬度30.5、经度120.5、半径300、fenceId42、停用、updatedAt12345），再 `getConfig`。 | 上述七个字段逐一等于保存值。 |
| SUB_GEOFENCECHECKIN_STORE_0200 | testStoreEnterExit0001 | 在 t=`Date.now()` 进入，t+1 重复进入，t+60000 退出。 | 首次记录非 undefined，enterTime=t、exitTime=OPEN_END、durationMs=0；重复进入为 undefined；退出记录非 undefined、ID与进入相同、exitTime=t+60000、durationMs=60000。 |
| SUB_GEOFENCECHECKIN_STORE_0300 | testStoreExitWithoutEnter0001 | 查询开放记录，无进入先退出；然后进入、退出，再次退出。 | 起初开放记录和无进入退出均为 undefined；进入记录存在且 exitTime=OPEN_END；首次退出存在且ID相同；再次退出为 undefined。 |
| SUB_GEOFENCECHECKIN_STORE_0400 | testStoreRecordsOrder0001 | 在 t、t+1000、t+2000 各进入并在500毫秒后退出；查全部记录和 limit=2。 | 三次进入均有记录；全量为3项，enterTime从新到旧为t+2000/t+1000/t，每条均非开放记录；限量为2项、首项为t+2000。 |
| SUB_GEOFENCECHECKIN_STORE_0500 | testStoreDaySummary0001 | t进入、t+1000退出；t+5000进入、t+7000退出；按当前日首查询，再清空并查询。 | 两次进入记录存在；日汇总 count=2、durationMs=3000；清空后两字段均为0。 |
| SUB_GEOFENCECHECKIN_STORE_0600 | testStoreSimulateTransition0001 | 以参数1调用 `CheckInService.simulate`：ENTER、ENTER、EXIT、EXIT。 | changed依次true/false/true/false；首个进入记录存在、exitTime=OPEN_END、durationMs=0；首个退出记录存在、durationMs≥0。 |

## 8. [BasicUtilArrayMatrix.test.ets](entry/src/ohosTest/ets/test/BasicUtilArrayMatrix.test.ets)（8 个）

| 用例编号 | 用例名称 | 测试步骤 | 预期结果 |
| --- | --- | --- | --- |
| SUB_GEOFENCECHECKIN_BASICARR_0100 | testRemoveDuplicates0001 | 遍历 `DEDUP_CASES`（重复、空项、大小写、中文），按逗号拆分、去重再逗号连接；另检查空数组、两个a和a/b。 | 每行等于expected，checked等于非空表长度；空数组长度0、两个a去重长度1、a/b第二项为b。 |
| SUB_GEOFENCECHECKIN_BASICARR_0200 | testRemoveDuplicatesIdempotent0002 | 对唯一数组a至f连续去重两次，比较各元素及源长度。 | 两次结果长度均6、逐项相等；源长度仍6。 |
| SUB_GEOFENCECHECKIN_BASICARR_0300 | testSafeJoin0003 | 遍历 `JOIN_CASES`（空项、空分隔符、中文、多种分隔符），拆分后按指定分隔符拼接；另检查空／单项／全空数组。 | 每行等于expected，checked等于非空表长度；附加结果依次 `''`、`a`、`''`。空白项不等于空项。 |
| SUB_GEOFENCECHECKIN_BASICARR_0400 | testSafeJoinSeparators0004 | 使用 `- _ / \| , ; : 空格 +` 九种分隔符连接a/b/c，再用空分隔符连接a/b。 | 每行输出为a+分隔符+b+分隔符+c；分隔符数9；空分隔符输出ab。 |
| SUB_GEOFENCECHECKIN_BASICARR_0500 | testBooleanToFlag0005 | 遍历 `FLAG_CASES`，再检查true与false标记的加法、乘法。 | 每行等于expected、checked等于非空表长度；true→1、false→0，和为1、true标记乘2为2。 |
| SUB_GEOFENCECHECKIN_BASICARR_0600 | testArrayOrderPreservation0006 | 去重 `z,a,z,b,a,c,b`，读取结果及源数组。 | 长度4、顺序z/a/b/c；源长度7、首项z。未逐项断言源数组全部内容。 |
| SUB_GEOFENCECHECKIN_BASICARR_0700 | testArrayMixedContent0007 | 去重 `1,a,中,1,文,a`；连接去重结果和原数组。 | 去重为4项1/a/中/文；短横连接为 `1-a-中-文`；原数组竖线连接为 `1\|a\|中\|1\|文\|a`。 |
| SUB_GEOFENCECHECKIN_BASICARR_0800 | testArrayLargeInput0008 | 生成120项 `(i%7).toString()`，去重并连接。 | 去重长度7、首末为0/6，连接为 `0,1,2,3,4,5,6`；源长度120。 |

## 9. [BasicUtilNumberExhaustive.test.ets](entry/src/ohosTest/ets/test/BasicUtilNumberExhaustive.test.ets)（4 个）

| 用例编号 | 用例名称 | 测试步骤 | 预期结果 |
| --- | --- | --- | --- |
| SUB_GEOFENCECHECKIN_NUMBEXH_0100 | testClampGrid0001 | 遍历 `CLAMP_CASES` 的value/low/high组合调用clamp，再检查NaN和倒置范围。 | 81行均等于expected；`clamp(NaN,0,10)`为NaN；`clamp(5,10,0)=0`。 |
| SUB_GEOFENCECHECKIN_NUMBEXH_0200 | testPercentExhaustive0002 | 遍历 `PERCENT_CASES` 百分比文本样本，使用默认精度，再检查指定精度。 | 200行均等于expected；`(0.5,2)`→`50.00%`、`(1,0)`→`100%`。 |
| SUB_GEOFENCECHECKIN_NUMBEXH_0300 | testPositiveExhaustive0003 | 遍历 `POSITIVE_CASES` 正负整数样本，另检查NaN、Infinity。 | 200行判定均等于expected；NaN、Infinity均为false。 |
| SUB_GEOFENCECHECKIN_NUMBEXH_0400 | testRandomIntRanges0004 | 调用 `randomInt(10,20)` 100次，再调用 `(1,1)`、`(5,3)`。 | 每次均在闭区间[10,20]，检查次数100；附加结果1、3。未要求采样覆盖所有端点。 |

## 10. [BasicUtilStringDeepExhaustive.test.ets](entry/src/ohosTest/ets/test/BasicUtilStringDeepExhaustive.test.ets)（2 个）

| 用例编号 | 用例名称 | 测试步骤 | 预期结果 |
| --- | --- | --- | --- |
| SUB_GEOFENCECHECKIN_BASICDEEP_0100 | testCapitalizeDeep0001 | 遍历 `STRING_DEEP_CASES` 标识符样本调用capitalize，再检查空串和a。 | 500行均等于capitalized；空串→空串、a→A。 |
| SUB_GEOFENCECHECKIN_BASICDEEP_0200 | testReverseStringDeep0002 | 遍历 `STRING_DEEP_CASES` 调用reverseString，并反转预设reversed；另反转空串。 | 500行首次等于reversed，反转reversed恢复input；空串仍为空串。 |

## 11. [BasicUtilStringExhaustive.test.ets](entry/src/ohosTest/ets/test/BasicUtilStringExhaustive.test.ets)（4 个）

| 用例编号 | 用例名称 | 测试步骤 | 预期结果 |
| --- | --- | --- | --- |
| SUB_GEOFENCECHECKIN_BASICEXH_0100 | testCapitalizeExhaustive0001 | 遍历 `CAPITALIZE_CASES` 文本样本调用capitalize，另检查空串和aBc。 | 100行均等于expected；空串不变、aBc→ABc。 |
| SUB_GEOFENCECHECKIN_BASICEXH_0200 | testReverseExhaustive0002 | 遍历 `REVERSE_CASES` 文本样本，单次和双重反转，再检查空串。 | 100行单次等于expected，双重恢复input；空串不变。 |
| SUB_GEOFENCECHECKIN_BASICEXH_0300 | testCountExhaustive0003 | 遍历 `COUNT_CASES` 的input/target统计次数，另检查空目标及aaa/aa。 | 100行均等于expected；abc/空目标为0、aaa/aa为1。 |
| SUB_GEOFENCECHECKIN_BASICEXH_0400 | testTrimExhaustive0004 | 遍历 `TRIM_CASES` 带空格文本调用trimSafe和isBlank，另检查undefined和全空格。 | 100行修剪均等于expected、原文本isBlank=false；undefined修剪为空串，全空格isBlank=true。 |

## 12. [BasicUtilStringMatrix.test.ets](entry/src/ohosTest/ets/test/BasicUtilStringMatrix.test.ets)（31 个）

| 用例编号 | 用例名称 | 测试步骤 | 预期结果 |
| --- | --- | --- | --- |
| SUB_GEOFENCECHECKIN_BASICSTR_0100 | testIsEmptyStringMatrix0001 | 遍历 `EMPTY_PROBES` 的缺失、空串、空白、文字、Unicode、数字和符号，调用isEmptyString；另直接检查典型样本。 | 14行均等于isEmpty及“缺失或长度0”；仅undefined、空串为true，空格、制表符、a、中文、0为false。 |
| SUB_GEOFENCECHECKIN_BASICSTR_0200 | testIsBlankMatrix0001 | 遍历 `EMPTY_PROBES` 调用isBlank并统计，检查修剪关联；另检查各空白字符和带内容文本。 | 各行等于isBlank及“缺失或修剪长度0”；空白行修剪为空串，空白数8；空格/tab/LF/CR/混合空白为true，` x `、0为false。 |
| SUB_GEOFENCECHECKIN_BASICSTR_0300 | testEmptyAndBlankRelationship0001 | 遍历 `EMPTY_PROBES` 比较empty和blank，统计差集，再比较空格、空串、undefined、a、tab。 | empty且非blank始终false、计数0；blank非empty有6行；空格两判定不同，空串/undefined/a一致，tab为blank但非empty。 |
| SUB_GEOFENCECHECKIN_BASICSTR_0400 | testTrimSafeMatrix0001 | 遍历 `TRIM_PROBES` 修剪缺失、空白、带边空白、内部空格、中文和补充平面字符样本，再修剪一次。 | 14行结果与trimmed、长度与trimmedLength一致；长度不增、二次修剪不变，非空结果首尾非普通空格；undefined/空串/全空格为空串，x及tab包围x为x。 |
| SUB_GEOFENCECHECKIN_BASICSTR_0500 | testTrimSafeIdempotent0001 | 对 `TRIM_PROBES` 修剪两次并判空白，另检查a、空格、a b、undefined、LF/tab的重复修剪。 | 14行两次相等；3个空白行结果为空，其余长度>0；附加结果为a、空串、a b、空串、空串。 |
| SUB_GEOFENCECHECKIN_BASICSTR_0600 | testTrimSafeLongText0001 | 生成100份数字块共1000字符，加两端5空格；检查500空格、tab包围正文、200份“围栏”。 | 带边空格长1010、修剪恢复1000字符正文，非empty非blank；500空格blank但非empty、修剪为空；tab包围正文恢复原文；中文正文长400、修剪不变。 |
| SUB_GEOFENCECHECKIN_BASICSTR_0700 | testCapitalizeMatrix0001 | 遍历 `CAPITALIZE_PROBES` 的大小写、空串、数字/符号/空格开头、中文及补充平面字符，检查首字母转换和再次转换。 | 12行等于expected及expectedLength，长度与原文相同、substring(1)不变、转换幂等；geofence→Geofence、GEOFENCE不变、aBc→ABc、空串不变、z→Z。 |
| SUB_GEOFENCECHECKIN_BASICSTR_0800 | testCapitalizeIdempotent0001 | 对 `CAPITALIZE_PROBES` 转换两次并统计变化行，再检查b/B及空格、数字、中文开头。 | 12行二次不变、变化行4；b→B、B不变、空串不变，双重geofence→Geofence，` a`、1a、中文不变。 |
| SUB_GEOFENCECHECKIN_BASICSTR_0900 | testReverseStringMatrix0001 | 遍历 `REVERSE_PROBES`（空串、回文、大小写、数字、符号、空格、中文）反转并双重反转。 | 12行等于expected及expectedLength，长度不变、双重恢复；abc→cba、空串不变、a不变、ab→ba、`ab `→` ba`、中文→文中。 |
| SUB_GEOFENCECHECKIN_BASICSTR_1000 | testReverseStringRoundTrip0001 | 遍历 `REVERSE_PROBES` 反转再恢复，非空时比较首尾；另反转level、空串、a、ab、abc、aabb。 | 12行双重恢复，非空首尾互换；附加依次level、空串、a、ba、cba、bbaa。 |
| SUB_GEOFENCECHECKIN_BASICSTR_1100 | testReverseStringEmoji0001 | 使用 `\u{1F4CD}`、`a+该字符+b`、双字符、`\u{1F680}`、CR/LF/NUL及孤立代理项调用反转；检查火箭前缀go。 | 单字符长度2且反转不变；混合长4、反转为b+该字符+a，首b末a且可恢复；双字符长4且不变；两种补充平面字符交换；以P表示 `\u{1F4CD}`，`a\r\n+P+\u0000b` 反转为 `b\u0000+P+\n\ra`；`\uD800a`→`a\uD800`，`a\uDC00`→`\uDC00a`；火箭go长4、反转首字符o，g计数1、非blank、capitalize长4。 |
| SUB_GEOFENCECHECKIN_BASICSTR_1200 | testReverseStringLongText0001 | 反转100份 `0123456789`，双重恢复，统计正反文子串并调用blank/empty/trim/capitalize。 | 源及反文长1000，反文=`9876543210`重复100次、首9末0；双重恢复；源0123与反文3210计数100、反文0123计数0；非blank非empty、trim及capitalize不变。 |
| SUB_GEOFENCECHECKIN_BASICSTR_1300 | testCountOccurrencesMatrix0001 | 遍历 `OCCURRENCE_PROBES` 的空目标、空源、缺失匹配、重复、重叠、中文、数字和符号样本统计。 | 15行均等于expected，次数≥0且≤可起始位置上界；预期0时目标为空或源不含目标；abc/abc=1、abc/abcd=0、空/空=0、abcabc/bc=2，首行目标为空。 |
| SUB_GEOFENCECHECKIN_BASICSTR_1400 | testCountOccurrencesEmptyTarget0001 | 以空串、a、geofence、围栏围栏、a b c五种源检查空目标及反向空源，再检查完整目标和重复。 | 空目标／空源均0；源数5、空串blank；geofence自身1、加X目标0，abcabc/abc及/a均2，a b c/空格2，空/空及空/a均0。 |
| SUB_GEOFENCECHECKIN_BASICSTR_1500 | testCountOccurrencesOverlap0001 | 统计aaaa/aa、aaaaa/aa、aaaaaa/aa、aaa/aa、ababab/aba、abababa/aba、哈哈哈/哈哈、哈哈哈哈/哈哈、abab/ab。 | 依次2、2、3、1、1、2、1、2、2；aaaa/aa≤3，按非重叠匹配计数。 |
| SUB_GEOFENCECHECKIN_BASICSTR_1600 | testCountOccurrencesLongText0001 | 生成ab重复500次，统计a、b、ab、ba、abab、cd、整文、ababab、空目标；再加ab统计ba并双重反转。 | 文长1000；计数依次500、500、500、499、250、0、1、166、0；加ab后ba=500；双重恢复原文。 |
| SUB_GEOFENCECHECKIN_BASICSTR_1700 | testRemoveDuplicatesStringMatrix0001 | 去重 `b,a,b,空串,两空格,a,围栏,围栏,tab`，统计结果empty/blank，再查空数组。 | 源长9，去重6项为b/a/空串/两空格/围栏/tab；empty数1、blank数3；空数组去重长度0。 |
| SUB_GEOFENCECHECKIN_BASICSTR_1800 | testSafeJoinMatrix0001 | 连接含空项、全空、空数组、单项、空白和中文数组；组合计数、反转及trim。 | 依次a-b-c、空串、空串、x、` \|a\| `、围栏/区域；短横数2，ab/cd反转连接为dc-ba，边空格修剪为`a  ,b`；空分隔符a/b→ab，单a→a，空/a冒号连接→a。 |
| SUB_GEOFENCECHECKIN_BASICSTR_1900 | testBooleanToFlagMatrix0001 | 遍历 `EMPTY_PROBES` 把empty/blank转标记并求和，检查空格及x。 | 标记均为0或1、blankFlag≥emptyFlag；14行empty合计2、blank合计8；true→1、false→0，空格blank/empty为1/0，x两者均0。 |
| SUB_GEOFENCECHECKIN_BASICSTR_2000 | testUnicodeChineseMatrix0001 | 对地理围栏执行判空、capitalize、反转、子串计数和trim，再查全角空格、双重反转及连接。 | 长4、非empty非blank、capitalize不变、反转栏围理地；围栏/地/安全计数1/1/0；trim恢复原文、全角空格blank、双重恢复、地理与围栏连接为原文。 |
| SUB_GEOFENCECHECKIN_BASICSTR_2100 | testDigitSymbolMatrix0001 | 检查数字块及 `+-*/=<>` 的判空、大写、反转、计数，修剪42。 | 数字非empty非blank、大写不变、反转9876543210，0计数1、00计数0，修剪为42；符号长7、反转`><=/*-+`、大写不变；--++--/--=2，短横非blank非empty。 |
| SUB_GEOFENCECHECKIN_BASICSTR_2200 | testValidateEmailStringMatrix0001 | 校验普通／子域邮箱、空白、缺用户名／域名／后缀、前导空格；修剪带空格邮箱后再校验，计数@并反转反文。 | 两合法邮箱true；空串/空白/不完整/带前空格均false，空白blank；修剪后合法、@计数1；反转得到user@example.com。 |
| SUB_GEOFENCECHECKIN_BASICSTR_2300 | testStringMatrixSummary0001 | 读取五种PROBES长度，统计缺失、零匹配预设、反转不变、空白行。 | EMPTY/TRIM/CAPITALIZE/REVERSE/OCCURRENCE分别14/14/12/12/15；missing=1、零匹配=4、反转不变=3、blank=8，首个TRIM预设长度0。 |
| SUB_GEOFENCECHECKIN_BASICSTR_2400 | testUnicodeCodePointMatrix0001 | 使用 `\u{1F4CD}` 检查判空、反转／恢复、前缀capitalize、重复计数和trim。 | 字符长2、非empty非blank、单／双反转不变；字符+ab大写后长4、substring(2)=ab；两字符以竖线隔开计数2、单字符计数1；边空格修剪不变。 |
| SUB_GEOFENCECHECKIN_BASICSTR_2500 | testLongTextMillionMatrix0001 | 生成geofence重复250次及2000空格，检查计数、首字母、反转恢复和修剪。 | 实际正文长2000，并非百万字符；非empty非blank，geofence/fence/Geo计数250/250/0，首字符变G；反文长2000且可恢复，trim恢复正文；2000空格blank但非empty、trim为空。未断言耗时或复杂度。 |
| SUB_GEOFENCECHECKIN_BASICSTR_2600 | testSafeJoinTrimmingMatrix0001 | 连接空／单项／多项／含空项／含空白／带边空格数组；过滤空项后逐项trim再连接，检查去重。 | 输出为空、a、a,b,c、a,b、空、`a, ,b`、ab、` a \| b `；逐项修剪后a-b；去重a/a/b长2、a/b/a首a、空数组长0、x/y第二项y。 |
| SUB_GEOFENCECHECKIN_BASICSTR_2700 | testFlagAndPercentStringMatrix0001 | 转换布尔及判空结果标记；格式化百分比默认/0位/2位，统计文本符号、trim和反转。 | true/false为1/0，blank全空格及empty空串为1、empty a为0；输出25.0%、26%、25.60%、100.0%、0.0%；100.0%的点和百分号各1，修剪50%，反转为%05。 |
| SUB_GEOFENCECHECKIN_BASICSTR_2800 | testOverlapAndCompoundMatrix0001 | 检查aaa重叠、a/aa、aba、abc和小数点计数，再遍历 `OCCURRENCE_PROBES`。 | aaaa/aaa=1、aaaaa/aaa=1、aaaaaa/aaa=2、aaaa/a=4、aaaa/aa=2、abababa/aba=2、abcabcab/abc=2、0.1.0.1/点=3；各行等于expected，正预期行源和目标非空。 |
| SUB_GEOFENCECHECKIN_BASICSTR_2900 | testPhoneIdCardStringMatrix0001 | 校验合法手机、空白、短／长／带空格手机，并修剪后再校验；校验正确／空／错码身份证及修剪样本，计数1。 | 13800138000和19912345678合法；空、空白、10/12位及前空格手机不合法，trim后合法；正确身份证和trim后合法，空与错码不合法，空串blank；正确身份证中1计数6。 |
| SUB_GEOFENCECHECKIN_BASICSTR_3000 | testWhitespaceFamilyMatrix0001 | 对空格、tab、LF、CR、CRLF及混合空白判blank；对含内容样本判blank，修剪、计数和反转。 | 七种纯空白均true，a-tab-b和LF-LF-a为false；修剪混合边空白得到a b，LF/tab修剪为空；tab与LF各计数2；a-tab-b反转为b-tab-a。未单独断言不换行空格。 |
| SUB_GEOFENCECHECKIN_BASICSTR_3100 | testBoundaryLengthMatrix0001 | 对空格、一／两字符、带边空格调用判空、trim、大写、反转、计数、连接和去重。 | 空格非empty但blank、trim为空；` a `→a；a/ab/空格a大写为A/Ab/空格a；反转a/ab为a/ba；a/a=1、a/b=0、ab/ba=0、aa/a=2；a+b连接正确、去重a/b长2，两空格单项保留、修剪纯空格仍blank。 |

## 13. [BasicUtilValidationMatrix.test.ets](entry/src/ohosTest/ets/test/BasicUtilValidationMatrix.test.ets)（9 个）

| 用例编号 | 用例名称 | 测试步骤 | 预期结果 |
| --- | --- | --- | --- |
| SUB_GEOFENCECHECKIN_BASICVAL_0100 | testEmailValidity0001 | 遍历 `EMAIL_CASES` 普通／子域／标签邮箱和缺字段、非法字符、空白等样本调用isValidEmail。 | 每行等于expected，checked等于非空表长度；a@b.com=true、空串及a@b=false。 |
| SUB_GEOFENCECHECKIN_BASICVAL_0200 | testEmailLocalPart0002 | 校验本地部分含点、加号、下划线、短横、百分号的accepted数组和含空格、#、/、括号的rejected数组。 | 5个accepted均true、4个rejected均false。 |
| SUB_GEOFENCECHECKIN_BASICVAL_0300 | testPhoneValidity0003 | 遍历 `PHONE_CASES` 手机号前缀、位数、字符和空白样本。 | 每行等于expected，checked等于非空表长度；13800138000=true、12800138000及10位样本=false。 |
| SUB_GEOFENCECHECKIN_BASICVAL_0400 | testPhonePrefixes0004 | 用3至9七种第二位拼成 `1+前缀+800138000`，再检查第二位0/1/2。 | 七种均true；10800138000/11800138000/12800138000均false；前缀数7。 |
| SUB_GEOFENCECHECKIN_BASICVAL_0500 | testIdCardValidity0005 | 遍历 `ID_CASES` 正确校验码、缺位、非法字符、空白和错码样本。 | 每行等于expected，checked等于非空表长度；11010519491231002X及小写x为true，尾码1的错码为false。 |
| SUB_GEOFENCECHECKIN_BASICVAL_0600 | testIdCardChecksum0006 | 对bases六个17位基数，以weights加权、取 `10X98765432[sum%11]` 拼出正确码，再替换成错误码。 | 六个正确候选均true，六个错码均false；accepted等于bases.length=6。 |
| SUB_GEOFENCECHECKIN_BASICVAL_0700 | testValidationDeterminism0007 | 对user.name@example.com、13800138000、11010519491231002X重复校验20轮，再比较同邮箱两次结果。 | 每轮三项均true，轮数20，同邮箱两次结果相等。 |
| SUB_GEOFENCECHECKIN_BASICVAL_0800 | testValidationBoundaries0008 | 对空串、空格、三空格、tab、LF、CRLF及50个a分别调用三个校验器。 | 六种空白及50字符文本在三个校验器中全部false；样本数6、长文本长度50。 |
| SUB_GEOFENCECHECKIN_BASICVAL_0900 | testValidationShape0009 | 校验a@b.cd/a@b.c、11/10/12位手机号、正确／17位／缺位身份证。 | 邮箱依次true/false；手机号true/false/false；身份证true/false/false。 |

## 14. [FileSecurityEncodingExhaustive.test.ets](entry/src/ohosTest/ets/test/FileSecurityEncodingExhaustive.test.ets)（4 个）

| 用例编号 | 用例名称 | 测试步骤 | 预期结果 |
| --- | --- | --- | --- |
| SUB_GEOFENCECHECKIN_FILESECEXH_0100 | testBase64EncodeExhaustive0001 | 遍历 `BASE64_CASES` 生成文本及已知向量调用base64Encode，另检查abc输出长度。 | 104行均等于expected；abc编码长度4。 |
| SUB_GEOFENCECHECKIN_FILESECEXH_0200 | testBase64DecodeExhaustive0002 | 生成sample0至sample99，编码后解码，另解码空串。 | 100次解码长度等于源文本长度；空串解码长度0。未逐字节断言内容。 |
| SUB_GEOFENCECHECKIN_FILESECEXH_0300 | testUuidExhaustive0003 | 生成50个UUID，检查长度、分隔位置、版本字符，收集唯一值。 | 每个长36，索引8/13/18/23为短横、14为4；唯一数及seen长度均50。 |
| SUB_GEOFENCECHECKIN_FILESECEXH_0400 | testRandomHexExhaustive0004 | 分别请求1/2/4/8/16/32/64字节随机串，再查1及16字节。 | 七次长度均为字节数×2，转小写后不变；检查数7，附加长度2和32。本用例未逐字符断言十六进制集合。 |

## 15. [FileSecurityEncodingMatrix.test.ets](entry/src/ohosTest/ets/test/FileSecurityEncodingMatrix.test.ets)（8 个）

| 用例编号 | 用例名称 | 测试步骤 | 预期结果 |
| --- | --- | --- | --- |
| SUB_GEOFENCECHECKIN_FILESECB64_0100 | testBase64Encode0001 | 遍历 `BASE64_CASES` 的空串、ASCII和中文向量调用base64Encode。 | 每行等于expected，checked等于非空表长度；abc→YWJj、空串→空串。 |
| SUB_GEOFENCECHECKIN_FILESECB64_0200 | testBase64Decode0002 | 解码YWJj、YQ==、空串，再检查YWJj字节。 | 长度3/1/0；YWJj三个字节为97/98/99、长度3。 |
| SUB_GEOFENCECHECKIN_FILESECB64_0300 | testBase64RoundTrip0003 | 对a、ab、abc、hello、geofence、123456789编码后解码。 | 六种编码均非空，解码长度等于各源文本长度；样本数6。未逐字节比较内容。 |
| SUB_GEOFENCECHECKIN_FILESECB64_0400 | testUuidFormat0004 | 生成UUID，检查长度、四处分隔符、版本和段数。 | 长36，索引8/13/18/23为短横、14为4，分为5段。 |
| SUB_GEOFENCECHECKIN_FILESECB64_0500 | testUuidUniqueness0005 | 生成30个UUID并统计重复，比较前两个。 | seen长度30、重复数0、前两项不同。 |
| SUB_GEOFENCECHECKIN_FILESECB64_0600 | testRandomHexLength0006 | 遍历 `HEX_LENGTH_CASES` 的1/2/4/8/16/32/64字节，另请求0和1字节。 | 每行长度等于expectedLength，checked等于非空表长度；0字节长0、1字节长2。 |
| SUB_GEOFENCECHECKIN_FILESECB64_0700 | testRandomHexCharset0007 | 请求64字节随机串，逐字符检查 `0123456789abcdef`，转小写比较。 | 长128，合法字符数等于全长，转小写不变。 |
| SUB_GEOFENCECHECKIN_FILESECB64_0800 | testBase64Padding0008 | 编码a、ab、abc，检查等号后缀和长度。 | a以双等号结尾、ab以等号结尾、abc不以等号结尾；三者长度均4。 |

## 16. [FixtureFactory.test.ets](entry/src/ohosTest/ets/test/FixtureFactory.test.ets)（24 个）

辅助实现见 [FixtureFactory.ets](entry/src/ohosTest/ets/test/support/FixtureFactory.ets)。本节 `SAMPLE_TIME=1735660800000`；分钟／小时／天分别为60000／3600000／86400000毫秒。配置比较覆盖七字段，记录比较覆盖四字段，汇总比较覆盖次数和时长；rename/close操作原地修改，clone返回独立副本。

| 用例编号 | 用例名称 | 测试步骤 | 预期结果 |
| --- | --- | --- | --- |
| SUB_GEOFENCECHECKIN_FIXTURE_0100 | testDefaultConfigFixture0001 | 创建工厂默认配置与库默认配置，逐字段读取并调用configEquals/configDiffFields。 | 工厂name为空、经纬度0、radius=DEFAULT_RADIUS、fenceId=INVALID_FENCE_ID、enabled=false、updatedAt=0；两配置相等、差异列表空；库radius及fenceId保持默认标记。 |
| SUB_GEOFENCECHECKIN_FIXTURE_0200 | testConfigBuilderFields0001 | 用builder_case、31.2304、121.4737、350、12、true、SAMPLE_TIME构造配置，再用空名及零值构造。 | 首个七字段均等于参数；零配置的name/latitude/radius/fenceId/enabled/updatedAt分别为空/0/0/0/false/0。零配置未单独断言longitude。 |
| SUB_GEOFENCECHECKIN_FIXTURE_0300 | testConfigPresetRadiusMatrix0001 | 遍历 `RADIUS_PRESET_ROWS` 默认、正常、半径端点／越界、名称和状态预设，按kind构造并计算半径范围。 | radius等于row.radius，范围判定等于accepted；name.length≥0；有效12、无效2，合计等于表长14。此处检查半径范围，不调用配置校验器。 |
| SUB_GEOFENCECHECKIN_FIXTURE_0400 | testConfigPresetCenterMatrix0001 | 获取allConfigPresets，逐项检查坐标有限性和边界，另查ORIGIN_CENTER。 | 预设数等于RADIUS_PRESET_ROWS长度；经纬度均有限且在[-90,90]/[-180,180]；原点纬经度0、fenceId0。 |
| SUB_GEOFENCECHECKIN_FIXTURE_0500 | testConfigPresetNameMatrix0001 | 获取EMPTY_NAME/BLANK_NAME/UNICODE_NAME/NOMINAL，检查名称及nominalConfig的空后缀和gate后缀。 | 空名长0且trim长0；空白名长3且trim长0；Unicode名长4且trim长4；NOMINAL以preset_开头且更长、不同于nominalConfig空后缀；gate名fence_gate、启用、默认半径。 |
| SUB_GEOFENCECHECKIN_FIXTURE_0600 | testCloneConfigIndependence0001 | clone nominalConfig(clone)，比较七字段；修改副本name/radius/fenceId/enabled。 | 初始实例不同、值全相等；修改后源名fence_clone、默认半径、fenceId非999、仍启用；副本与源不再相等。 |
| SUB_GEOFENCECHECKIN_FIXTURE_0700 | testConfigDiffFieldMatrix0001 | 用 `CONFIG_DIFF_ROWS` 和applySingleFieldChange依次改变七个字段，调用差异及相等比较。 | fieldNames数7，自比差异0；每行差异恰好1项且为expectedField，configEquals=false，字段属于fieldNames、row.changed非空。 |
| SUB_GEOFENCECHECKIN_FIXTURE_0800 | testRenameConfigKeepsOtherFields0001 | 快照nominalConfig(rename)，原地改名renamed_fence，比较其他字段和差异，再改为空名。 | 返回实例即原实例，name更新；其余六字段等于快照；差异仅name；再次改空名后长0。 |
| SUB_GEOFENCECHECKIN_FIXTURE_0900 | testOpenAndClosedRecordFixture0001 | 构造ID1的开放记录及ID2的一分钟闭合记录，读取字段并比较。 | 开放ID1、enterTime=SAMPLE_TIME、exitTime=OPEN_END、durationMs0、isOpen=true；闭合ID2、退出=SAMPLE_TIME+60000、时长60000、isOpen=false，退出减进入等于时长；两记录不等。 |
| SUB_GEOFENCECHECKIN_FIXTURE_1000 | testRecordPresetDurationMatrix0001 | 遍历 `DURATION_PRESET_ROWS` 开放、分钟、小时、1毫秒、零／负停留、全天、特殊ID及epoch预设。 | 时长及开放状态逐行等于预设；进入／退出均有限；开放标记等于OPEN_END、闭合标记不同；开放3、闭合7，合计10。 |
| SUB_GEOFENCECHECKIN_FIXTURE_1100 | testRecordPresetIdentityMatrix0001 | 两次allRecordPresets，逐项比较实例、值和预设时长，再收集ID。 | 两列表等长且等于时长表长；逐项实例不同、记录值相等、时长符合预设；ID列表长10且含-1/0/7/4。未断言全部ID互异。 |
| SUB_GEOFENCECHECKIN_FIXTURE_1200 | testCloneRecordIndependence0001 | 克隆ID9开放记录，再对副本closeRecord至SAMPLE_TIME+一小时。 | 初始副本不同实例但值相等，ID9、进入=SAMPLE_TIME、开放且时长0；close返回同副本、退出及一小时时长正确、非开放；源仍开放、exitTime=OPEN_END、时长0，最终值不等。 |
| SUB_GEOFENCECHECKIN_FIXTURE_1300 | testRecordBatchShape0001 | 生成5条一分钟停留、按小时间隔的recordBatch；另生成0条及1条零停留记录。 | 5条ID为index+1、进入=SAMPLE_TIME+index×小时、时长60000、均闭合；首两和末两进入递增；0条为空；1条零停留长1、时长0。 |
| SUB_GEOFENCECHECKIN_FIXTURE_1400 | testEnterAndExitResultFixture0001 | 将开放／一分钟闭合记录放入enterResult/exitResult，检查引用、动作和时间。 | 两者changed=true、动作ENTER/EXIT、record即各输入实例、timestamp分别SAMPLE_TIME及+60000；动作不同、时间递增；进入record存在且开放。 |
| SUB_GEOFENCECHECKIN_FIXTURE_1500 | testUnchangedResultFixture0001 | 构造unchangedResult及手动result(false,NONE,undefined,SAMPLE_TIME)，比较字段和动作常量。 | 两者changed=false、action=NONE、record=undefined、时间相同且为SAMPLE_TIME；ENTER/EXIT均非NONE；时间有限且>0。 |
| SUB_GEOFENCECHECKIN_FIXTURE_1600 | testCloneResultIndependence0001 | 克隆携带ID11开放记录的进入结果，关闭副本嵌套记录；另克隆unchangedResult(1)。 | 结果实例不同，changed/action/timestamp相等；嵌套记录均存在、实例不同且值相等；副本关闭后非开放、源仍开放；无记录副本仍record=undefined、changed=false。 |
| SUB_GEOFENCECHECKIN_FIXTURE_1700 | testSummaryPresetMatrix0001 | 比较工厂与库空汇总；遍历 `SUMMARY_PRESET_ROWS` 空、零时长、聚合、负值预设；另比较不同次数／时长并汇总空记录。 | 空汇总相等；每行count/durationMs与预设一致、等于同参数构造结果；仅次数或时长不同的比较均false；空记录汇总count0。 |
| SUB_GEOFENCECHECKIN_FIXTURE_1800 | testSummaryOfRecordsAggregation0001 | 汇总4条一分钟记录；汇总OPEN/ONE_MINUTE/OPEN/ONE_HOUR预设，另汇总零停留。 | 首汇总count4=记录长、时长240000；混合记录长4、count4、时长3660000；零停留汇总时长0；首汇总等于(4,240000)、与混合汇总不等。 |
| SUB_GEOFENCECHECKIN_FIXTURE_1900 | testLocationPresetMatrix0001 | 遍历 `LOCATION_PRESET_ROWS` 普通、原点、极值、小数坐标及失败结果；另构造locationFailure(201)。 | success/errorCode逐项等于预设，经纬度在闭区间内，成功码为0；失败数4；额外失败结果坐标0/0、success=false、errorCode201。无真实定位调用。 |
| SUB_GEOFENCECHECKIN_FIXTURE_2000 | testPermissionPresetMatrix0001 | 遍历 `PERMISSION_PRESET_ROWS` 零／部分／全满足快照，计算permissionScore/isFullyReady；再获取全满足和全不满足快照。 | score/ready与预设一致、score在[0,5]；foregroundGranted/capabilitySupported类型boolean；全满足五标志均true、score5；全不满足score0。 |
| SUB_GEOFENCECHECKIN_FIXTURE_2100 | testOperationPresetMatrix0001 | 遍历 `OPERATION_PRESET_ROWS` 成功、错误及能力不支持结果，另获取operationUnsupported。 | success/errorCode等于预设；成功fenceId非INVALID_FENCE_ID、失败为该标记；成功数4；不支持结果success=false、fenceId无效、errorCode=FENCE_CAPABILITY_UNSUPPORTED=801。 |
| SUB_GEOFENCECHECKIN_FIXTURE_2200 | testConfigBatchOrdering0001 | 按NOMINAL/LOWER_EDGE/UPPER_EDGE/ENABLED构造批次，逐项与对应预设比较，再查空批次和首末实例。 | 长度与kind数一致、各项值相同；半径依次默认/最小/最大且严格有序，第四项启用；空批次长0、首与第四非同实例。 |
| SUB_GEOFENCECHECKIN_FIXTURE_2300 | testRecordBatchOfPresetsOrdering0001 | 按FULL_DAY/ONE_HOUR/ONE_MINUTE/SHORTEST/OPEN构造批次，检查时长、开放状态和空批次。 | 长度5，时长86400000/3600000/60000/1/0且严格递减；末项开放、首项闭合；空批次长0。 |
| SUB_GEOFENCECHECKIN_FIXTURE_2400 | testFixtureDeterminism0001 | 同参数分别构造两份nominalConfig、closedRecord、summary、locationSuccess及operationSuccess。 | 配置／记录／汇总值相等但实例不同；定位实例不同且纬度、经度、错误码相等；操作实例不同且fenceId、错误码相等。未逐字段比较两种结果的success。 |

## 17. [GeoGrid.test.ets](entry/src/ohosTest/ets/test/GeoGrid.test.ets)（11 个）

辅助实现见 [GeoGridUtil.ets](entry/src/ohosTest/ets/test/support/GeoGridUtil.ets)。索引计算与中心计算为纯数学操作，并不注册真实围栏。

| 用例编号 | 用例名称 | 测试步骤 | 预期结果 |
| --- | --- | --- | --- |
| SUB_GEOFENCECHECKIN_GEOGRID_0100 | testClampGridIndex0001 | 遍历 `CLAMP_CASES` 范围内、负数、溢出、零及单格数量样本调用clampGridIndex，再查(-1,10)/(10,10)/(3,0)/(3,-5)。 | 表逐项等于expected、checked等于非空表长；附加结果0/9/0/0。 |
| SUB_GEOFENCECHECKIN_GEOGRID_0200 | testWrapLongitudeIndex0002 | 遍历 `WRAP_CASES` 正负及溢出索引调用wrapLongitudeIndex，再查(-1,10)/(10,10)/(5,0)。 | 表逐项等于expected、checked等于非空表长；附加结果9/0/0。 |
| SUB_GEOFENCECHECKIN_GEOGRID_0300 | testCoordinateValidity0003 | 遍历 `LATITUDE_CASES`、`LONGITUDE_CASES` 的端点、范围内及越界样本；另查NaN、纬度+Infinity、经度-Infinity。 | 两表逐项等于expected且各checked等于非空表长；端点有效、越界无效，附加非有限值全部false。 |
| SUB_GEOFENCECHECKIN_GEOGRID_0400 | testLatitudeIndex0004 | 遍历 `LAT_INDEX_CASES` 用0.5度步长定位，再检查步长0/-1及纬度91。 | 表逐项等于expected、checked等于非空表长；-90→0、90→360；三个非法输入均-1。 |
| SUB_GEOFENCECHECKIN_GEOGRID_0500 | testLongitudeIndex0005 | 遍历 `LON_INDEX_CASES` 用0.5度步长定位，再检查步长0/-1及经度181。 | 表逐项等于expected、checked等于非空表长；-180→0、180→720；三个非法输入均-1。 |
| SUB_GEOFENCECHECKIN_GEOGRID_0600 | testCenterLatitude0006 | 遍历 `LAT_CENTER_CASES` 计算中心纬度；另查负索引、零／负步长。 | 每行与expected绝对误差<0.000001，checked等于非空表长；三种非法输入均0。 |
| SUB_GEOFENCECHECKIN_GEOGRID_0700 | testCenterLongitude0007 | 遍历 `LON_CENTER_CASES` 计算中心经度；另查负索引、零／负步长。 | 每行与expected绝对误差<0.000001，checked等于非空表长；三种非法输入均0。 |
| SUB_GEOFENCECHECKIN_GEOGRID_0800 | testGridKey0008 | 遍历 `KEY_CASES` 正／负／零索引对生成键，另检查典型键及长度。 | 表逐项等于expected、checked等于非空表长；(0,0)/(1,2)/(-1,-2)为0:0/1:2/-1:-2；10:20长度5。 |
| SUB_GEOFENCECHECKIN_GEOGRID_0900 | testNeighborKeys0009 | 调用neighborKeys(5,5)，读取八项并检查中心是否包含。 | 长8，顺序4:4/4:5/4:6/5:4/5:6/6:4/6:5/6:6；不含5:5。 |
| SUB_GEOFENCECHECKIN_GEOGRID_1000 | testCellCount0010 | 以步长1/0.5/10求纬经格数；另查纬度步长0、经度步长-1及两轴比例。 | 纬格数180/360/18，经格数360/720/36；非法步长均0；步长1的经格数为纬格数两倍。 |
| SUB_GEOFENCECHECKIN_GEOGRID_1100 | testGridRoundTrip0011 | 遍历步长1至10和索引0至9，先中心纬度再索引；另求步长1格数。 | 100组合中心纬度有效、回算索引等于原索引；格数180/360。覆盖前10行索引，不是每种步长的全球全部网格。 |

## 18. [GeoGridDeepExhaustive.test.ets](entry/src/ohosTest/ets/test/GeoGridDeepExhaustive.test.ets)（2 个）

| 用例编号 | 用例名称 | 测试步骤 | 预期结果 |
| --- | --- | --- | --- |
| SUB_GEOFENCECHECKIN_GEOGDEEP_0100 | testCenterLatitudeDeep0001 | 遍历 `LAT_CENTER_CASES` 半度网格中心预设，以固定步长0.5调用centerLatitude，再查索引-1。 | 361行严格等于expected，包含index360→90.25的数学结果；负索引→0。本用例不判定各中心是否为合法纬度。 |
| SUB_GEOFENCECHECKIN_GEOGDEEP_0200 | testCenterLongitudeDeep0002 | 遍历 `LON_CENTER_CASES` 半度网格中心预设，以固定步长0.5调用centerLongitude，再查索引-1。 | 721行严格等于expected，包含index720→180.25；负索引→0。本用例不判定各中心是否为合法经度。 |

## 19. [GeoGridExhaustive.test.ets](entry/src/ohosTest/ets/test/GeoGridExhaustive.test.ets)（3 个）

| 用例编号 | 用例名称 | 测试步骤 | 预期结果 |
| --- | --- | --- | --- |
| SUB_GEOFENCECHECKIN_GEOGEXH_0100 | testLatitudeIndexExhaustive0001 | 遍历 `LAT_GRID_CASES` 整度纬度样本，以步长1算索引及中心。 | 181行索引等于row.index，中心与row.center误差<0.000001；-90→0、90→180。中心是公式结果，不额外断言在合法纬度范围内。 |
| SUB_GEOFENCECHECKIN_GEOGEXH_0200 | testLongitudeIndexExhaustive0002 | 遍历 `LON_GRID_CASES` 整度经度样本，以步长1算索引及中心。 | 361行索引等于row.index，中心与row.center误差<0.000001；-180→0、180→360。 |
| SUB_GEOFENCECHECKIN_GEOGEXH_0300 | testValidityExhaustive0003 | 对-100至100整度纬度及-200至200整度经度判有效性，再查NaN纬度和Infinity经度。 | 判定逐项等于[-90,90]/[-180,180]闭区间条件；有效数181/361；NaN及Infinity均false。 |

## 20. [GeofenceConfigCartesianMatrix.test.ets](entry/src/ohosTest/ets/test/GeofenceConfigCartesianMatrix.test.ets)（6 个）

辅助函数makeConfig使用名称matrix、无效围栏ID、停用和零更新时间。

| 用例编号 | 用例名称 | 测试步骤 | 预期结果 |
| --- | --- | --- | --- |
| SUB_GEOFENCECHECKIN_CFGCART_0100 | testCartesianValidity0001 | 遍历 `CONFIG_CASES` 七种纬度×七种经度×六种半径的组合，构造配置调用validateConfig。 | 294行均等于expected，checked等于非空表长度；半径49/5001、纬度90.1或经度180.1均为无效分支。 |
| SUB_GEOFENCECHECKIN_CFGCART_0200 | testLatitudeBoundary0002 | 经度0、半径200，依次校验纬度±90、±90.0001、NaN、±Infinity。 | ±90均true，其余五种均false。 |
| SUB_GEOFENCECHECKIN_CFGCART_0300 | testLongitudeBoundary0003 | 纬度0、半径200，依次校验经度±180、±180.0001、NaN、±Infinity。 | ±180均true，其余五种均false。 |
| SUB_GEOFENCECHECKIN_CFGCART_0400 | testRadiusBoundary0004 | 原点配置半径分别MIN_RADIUS/MAX_RADIUS、MIN_RADIUS-1/MAX_RADIUS+1、0/-1/NaN。 | 两端点true，五个越界或非数值样本false。 |
| SUB_GEOFENCECHECKIN_CFGCART_0500 | testMultipleInvalid0005 | 校验(91,181,200)/(91,0,49)/(0,181,49)/(91,181,5001)/(-91,-181,0)/(NaN,NaN,NaN)，最后检查(0,0,200)。 | 前六个多字段无效配置均false，最后正常配置true。 |
| SUB_GEOFENCECHECKIN_CFGCART_0600 | testConfigFieldIndependence0006 | 遍历纬度[-90,0,90]、经度[-180,0,180]、半径[50,200,5000]三重组合。 | 27种均true，validCount及三个数组长度乘积均27。 |

## 21. [NumberFormat.test.ets](entry/src/ohosTest/ets/test/NumberFormat.test.ets)（9 个）

辅助实现见 [NumberFormatUtil.ets](entry/src/ohosTest/ets/test/support/NumberFormatUtil.ets)。

| 用例编号 | 用例名称 | 测试步骤 | 预期结果 |
| --- | --- | --- | --- |
| SUB_GEOFENCECHECKIN_NUMFMT_0100 | testGroupThousands0001 | 遍历 `GROUP_CASES` 位数边界、千位及负数样本调用groupThousands。 | 逐项等于expected、checked等于非空表长；0→0、1000→1,000、-1000→-1,000、1234567→1,234,567。 |
| SUB_GEOFENCECHECKIN_NUMFMT_0200 | testPadLeft0002 | 遍历 `PAD_CASES` 宽度、补字符、负数和零宽度样本，再查(1,3,0)/(1,1,0)/(1,0,0)/(1,4,空字符)。 | 逐项等于expected、checked等于非空表长；附加结果001/1/1/1。未单独测试多字符补串。 |
| SUB_GEOFENCECHECKIN_NUMFMT_0300 | testToRoman0003 | 遍历 `ROMAN_CASES` 普通值、减法表示及范围外样本，再查1/4/9/3999/-1。 | 逐项等于expected、checked等于非空表长；1/4/9为I/IV/IX，3999输出长度9，-1输出空串。 |
| SUB_GEOFENCECHECKIN_NUMFMT_0400 | testToBaseString0004 | 遍历 `BASE_CASES` 二／八／十六／三十六进制样本；另查0、1、A、Z及负值／非法进制。 | 逐项等于expected、checked等于非空表长；(0,2)→0、(1,2)→1、(10,16)→A、(35,36)→Z；(-1,10)/(10,1)/(10,37)均空串。 |
| SUB_GEOFENCECHECKIN_NUMFMT_0500 | testBaseWrappers0005 | 遍历0至128，比较二／八／十六进制包装函数与通用转换，再查10、255及负数。 | 129项三包装输出分别与通用相等；10为1010/12/A，255十六进制FF，-1二进制为空串。 |
| SUB_GEOFENCECHECKIN_NUMFMT_0600 | testFormatFixed0006 | 遍历 `FIXED_CASES` 舍入、补零及精度越界样本，再查(1.5,0)/(1.5,2)/(1.005,2)/(-1.5,1)。 | 逐项等于expected、checked等于非空表长；附加结果2/1.50/1.00/-1.5；1.005保留两位的断言为1.00，不改写成1.01。 |
| SUB_GEOFENCECHECKIN_NUMFMT_0700 | testAbbreviate0007 | 遍历 `ABBREVIATE_CASES` K/M/B阈值、舍入及负值样本，再查999/1000/百万/十亿。 | 逐项等于expected、checked等于非空表长；附加999/1.0K/1.0M/1.0B；表中临近阈值允许1000.0K、1000.0M。 |
| SUB_GEOFENCECHECKIN_NUMFMT_0800 | testFormatInvariants0008 | 对0至200的千倍值查逗号存在性；对0至200十六进制转换再parseInt；对1至300查罗马文本长度。 | 千倍值仅0无逗号，检查201次；十六进制回算等于原值，201次；300个罗马文本均非空。未断言罗马前缀规则。 |
| SUB_GEOFENCECHECKIN_NUMFMT_0900 | testFormatBoundaries0009 | 对0/-0、补零、罗马范围外、36进制、固定精度及缩写阈值调用格式化函数。 | 千分组±0→0；0补宽5→00000；罗马0/4000为空；36进制0→0、1295→ZZ；固定(0,0)→0、(-0,2)→0.00；缩写0→0、-1000→-1.0K、999999999→1000.0M。 |

## 22. [NumberFormatDeepExhaustive.test.ets](entry/src/ohosTest/ets/test/NumberFormatDeepExhaustive.test.ets)（2 个）

| 用例编号 | 用例名称 | 测试步骤 | 预期结果 |
| --- | --- | --- | --- |
| SUB_GEOFENCECHECKIN_NUMFMTDEEP_0100 | testGroupThousandsDeep0001 | 遍历 `GROUP_DEEP_CASES` 整数分组文本，再检查-1000。 | 801行均等于expected；-1000→-1,000。 |
| SUB_GEOFENCECHECKIN_NUMFMTDEEP_0200 | testRomanDeep0002 | 遍历 `ROMAN_DEEP_CASES` 罗马文本预设，再检查0和4000。 | 800行均等于expected；0、4000均空串。 |

## 23. [NumberFormatExhaustive.test.ets](entry/src/ohosTest/ets/test/NumberFormatExhaustive.test.ets)（4 个）

| 用例编号 | 用例名称 | 测试步骤 | 预期结果 |
| --- | --- | --- | --- |
| SUB_GEOFENCECHECKIN_NUMFMEXH_0100 | testGroupThousandsExhaustive0001 | 遍历 `GROUP_EXHAUSTIVE_CASES` 整数分组文本，再检查±1000。 | 501行均等于expected；1000→1,000、-1000→-1,000。 |
| SUB_GEOFENCECHECKIN_NUMFMEXH_0200 | testRomanExhaustive0002 | 遍历 `ROMAN_EXHAUSTIVE_CASES` 罗马文本预设，再检查3999和0。 | 500行均等于expected；3999→MMMCMXCIX、0→空串。 |
| SUB_GEOFENCECHECKIN_NUMFMEXH_0300 | testBinaryExhaustive0003 | 遍历 `BASE2_EXHAUSTIVE_CASES` 二进制预设，再检查0和256。 | 301行均等于expected；0→0、256输出长度9。 |
| SUB_GEOFENCECHECKIN_NUMFMEXH_0400 | testHexExhaustive0004 | 遍历 `BASE16_EXHAUSTIVE_CASES` 十六进制预设，再检查255和256。 | 301行均等于expected；255→FF、256→100。 |

## 24. [NumberPuzzle.test.ets](entry/src/ohosTest/ets/test/NumberPuzzle.test.ets)（12 个）

辅助实现见 [NumberPuzzleUtil.ets](entry/src/ohosTest/ets/test/support/NumberPuzzleUtil.ets)。

| 用例编号 | 用例名称 | 测试步骤 | 预期结果 |
| --- | --- | --- | --- |
| SUB_GEOFENCECHECKIN_PUZZLE_0100 | testDivisorSum0001 | 遍历 `DIVISOR_CASES` 普通数、质数、完全数和亲和数求真因子和，再查0/1/-8/2/4/6/28。 | 表逐项等于expected、checked等于非空表长；附加结果0/0/0/1/3/6/28。 |
| SUB_GEOFENCECHECKIN_PUZZLE_0200 | testClassifyNumber0002 | 遍历 `CLASSIFY_CASES` 亏数／完全数／盈数样本，再分类0/-1/6/12/13。 | 表逐项等于expected、checked等于非空表长；附加invalid/invalid/perfect/abundant/deficient。 |
| SUB_GEOFENCECHECKIN_PUZZLE_0300 | testCollatzSteps0003 | 遍历 `COLLATZ_CASES` 求到1的步骤数，再查0/1/-3/2/4。 | 表逐项等于expected、checked等于非空表长；附加步骤0/0/0/1/2。 |
| SUB_GEOFENCECHECKIN_PUZZLE_0400 | testHappyNumber0004 | 遍历 `HAPPY_CASES` 快乐／非快乐数样本，再判断0/-7/1/7/2。 | 表逐项等于expected、checked等于非空表长；附加false/false/true/true/false。 |
| SUB_GEOFENCECHECKIN_PUZZLE_0500 | testTriangularNumber0005 | 遍历 `TRIANGULAR_CASES` 三角数索引预设，再查-1/0/1/2/10。 | 表逐项等于expected、checked等于非空表长；附加0/0/1/3/55。 |
| SUB_GEOFENCECHECKIN_PUZZLE_0600 | testIsTriangular0006 | 遍历 `TRIANGULAR_CHECK_CASES` 三角数及其邻值，再判-1/0/1/2/3。 | 表逐项等于expected、checked等于非空表长；附加false/true/true/false/true。 |
| SUB_GEOFENCECHECKIN_PUZZLE_0700 | testDigitalRoot0007 | 遍历 `DIGITAL_ROOT_CASES` 数字根预设，再求0/-12/9/10/999999。 | 表逐项等于expected、checked等于非空表长；附加0/0/9/1/9。 |
| SUB_GEOFENCECHECKIN_PUZZLE_0800 | testPowerOfTwo0008 | 遍历 `POWER_TWO_CASES` 2的幂及其他值，再判0/-2/1/2/3。 | 表逐项等于expected、checked等于非空表长；附加false/false/true/true/false。 |
| SUB_GEOFENCECHECKIN_PUZZLE_0900 | testNextPowerOfTwo0009 | 遍历 `NEXT_POWER_CASES` 求不小于输入的2次幂，再求0/-9/1/2/3。 | 表逐项等于expected、checked等于非空表长；附加1/1/1/2/4。 |
| SUB_GEOFENCECHECKIN_PUZZLE_1000 | testKaprekarSteps0010 | 遍历 `KAPREKAR_CASES` 的6174、收敛、重复数字及非四位样本，再查6174/999/10000/1111/2222。 | 表逐项等于expected、checked等于非空表长；6174为0步，其余附加输入均-1。 |
| SUB_GEOFENCECHECKIN_PUZZLE_1100 | testPuzzleInvariants0011 | 索引1至120生成三角数再判断；1至200求数字根；1至64内若为2次幂则求nextPowerOfTwo。 | 120个生成数均为三角数；200个根在[1,9]且root%9=n%9；7个2次幂的next结果为自身。 |
| SUB_GEOFENCECHECKIN_PUZZLE_1200 | testPuzzleBoundaries0012 | 检查大质数2147483647、三角索引1000、MAX_SAFE_INTEGER和负6174等边界。 | 大质数真因子和1、分类deficient；Collatz(1)=0、1为快乐数；T1000=500500且为三角数；MAX_SAFE_INTEGER数字根4、非2次幂、nextPowerOfTwo>0；负6174步骤-1；因子和1→0、2→1。 |

## 25. [NumberPuzzleDeepExhaustive.test.ets](entry/src/ohosTest/ets/test/NumberPuzzleDeepExhaustive.test.ets)（3 个）

| 用例编号 | 用例名称 | 测试步骤 | 预期结果 |
| --- | --- | --- | --- |
| SUB_GEOFENCECHECKIN_NUMDEEP_0100 | testDivisorSumDeep0001 | 遍历 `DIVISOR_DEEP_CASES` 真因子和预设，再求0和1。 | 800行等于expected；0/1均为0。 |
| SUB_GEOFENCECHECKIN_NUMDEEP_0200 | testDigitalRootDeep0002 | 遍历 `ROOT_DEEP_CASES` 数字根预设，再求-1。 | 401行等于expected；-1为0。 |
| SUB_GEOFENCECHECKIN_NUMDEEP_0300 | testTriangularDeep0003 | 遍历 `TRIANGULAR_DEEP_CASES` 判定预设并统计true行，再判-1。 | 401行等于expected，true预设数28；-1为false。 |

## 26. [NumberPuzzleExhaustive.test.ets](entry/src/ohosTest/ets/test/NumberPuzzleExhaustive.test.ets)（5 个）

| 用例编号 | 用例名称 | 测试步骤 | 预期结果 |
| --- | --- | --- | --- |
| SUB_GEOFENCECHECKIN_NUMEXH_0100 | testClassifyExhaustive0001 | 遍历 `CLASSIFY_EXHAUSTIVE_CASES` 分类并统计完全／盈／亏三种结果。 | 300行等于expected；完全数2、盈数和亏数各>0，三类合计300。 |
| SUB_GEOFENCECHECKIN_NUMEXH_0200 | testDivisorExhaustive0002 | 遍历 `DIVISOR_EXHAUSTIVE_CASES` 求真因子和、统计零和，再求220/284。 | 300行等于expected、零和1项；220→284、284→220。 |
| SUB_GEOFENCECHECKIN_NUMEXH_0300 | testDigitalRootExhaustive0003 | 遍历 `ROOT_EXHAUSTIVE_CASES` 求数字根，对正数交叉检查模9公式，再求0。 | 301行等于expected；正数根等于余数或余数0时为9；0根为0。 |
| SUB_GEOFENCECHECKIN_NUMEXH_0400 | testPowerOfTwoExhaustive0004 | 遍历 `POWER_EXHAUSTIVE_CASES` 判2次幂并统计预设true，再判256/255。 | 300行等于expected、true预设数9；256=true、255=false。 |
| SUB_GEOFENCECHECKIN_NUMEXH_0500 | testTriangularExhaustive0005 | 遍历 `TRI_EXHAUSTIVE_CASES` 判三角数并统计，再求T24和判301。 | 301行等于expected、true预设数25；T24=300、301非三角数。 |

## 27. [NumberSequence.test.ets](entry/src/ohosTest/ets/test/NumberSequence.test.ets)（42 个）

辅助实现见 [NumberSequenceUtil.ets](entry/src/ohosTest/ets/test/support/NumberSequenceUtil.ets)。本工具的进制文本为小写，可保留负号；不要与 NumberFormatUtil 的大写、拒绝负数规则混淆。

| 用例编号 | 用例名称 | 测试步骤 | 预期结果 |
| --- | --- | --- | --- |
| SUB_GEOFENCECHECKIN_NUMSEQ_0100 | testRangeAscending0001 | 生成range(1,5)、(0,10,2)、(1,10,3)、单点7、单点5及(1,100,10)，检查顺序和统计。 | 第一列为[1,2,3,4,5]、长5、递增；偶数列长6、首0末10；步长3为[1,4,7,10]；7两种单点长1且值7、5单点长1；宽列长10、末及max91、[40,60]计数2。 |
| SUB_GEOFENCECHECKIN_NUMSEQ_0200 | testRangeBoundary0001 | range(1,3)分别传0/-1/NaN/Infinity步长；再生成(0,1,0.25)、大步长和负区间。 | 0/-1步长为[1,2,3]；NaN/Infinity长3；小数步长长5、索引1为0.25、末1；大步长只含1；负区间为[-3,-2,-1]。 |
| SUB_GEOFENCECHECKIN_NUMSEQ_0300 | testRangeDescending0001 | 生成(10,0,5)、(3,1)、(5,1,0)、(100,0,33)，反转(5,1)与(1,5)比较。 | 依次[10,5,0]且递减、[3,2,1]长3首3末1、[5,4,3,2,1]、[100,67,34,1]长4；反转后等于升序列。 |
| SUB_GEOFENCECHECKIN_NUMSEQ_0400 | testArithmeticSeries0001 | 生成奇数、零公差、负公差、单项、空项、负起点等差列，并求奇数列差分和和。 | 列分别[1,3,5,7,9]长5、[4,4,4,4]、[10,7,4,1]递减、单8、空列、[-5,0,5]；奇数差分[2,2,2,2]，和25。 |
| SUB_GEOFENCECHECKIN_NUMSEQ_0500 | testArithmeticSeriesBoundary0001 | 数量传0/-1/-100/NaN/Infinity、首项或公差NaN；检查数量2.5、小数首项公差和10项大值列。 | 前七情况为空；count2.5生成3项；0.5起、0.5差的3项末1.5；大列长10、max10000。 |
| SUB_GEOFENCECHECKIN_NUMSEQ_0600 | testGeometricSeries0001 | 生成比2、3、0.5、0、1的等比列；检查count0、ratioNaN、单项及2次幂列求和。 | 分别[1,2,4,8,16,32]长6、[1,3,9,27]、[16,8,4,2,1]递减、[5,0,0]、[7,7,7]；非法情况为空、单项长1；幂列和63。 |
| SUB_GEOFENCECHECKIN_NUMSEQ_0700 | testGeometricSeriesRatioMatrix0001 | 生成负比、负首项、零首项、比1、小数比的列，另查负count和无限ratio。 | [1,-2,4,-8,16]且索引1/3=-2/-8；[-1,-3,-9,-27]递减；四个0；五个2且去重长1；负count／无限ratio为空；0.5起比0.5的3项末0.125。 |
| SUB_GEOFENCECHECKIN_NUMSEQ_0800 | testFibonacci0001 | 分别生成10、1、2、0、-3、20项Fibonacci。 | 10项为[0,1,1,2,3,5,8,13,21,34]；1项[0]、2项[0,1]；0/-3为空；20项长20、索引19=4181、16=987。 |
| SUB_GEOFENCECHECKIN_NUMSEQ_0900 | testFibonacciRecurrence0001 | 生成30项逐项检查递推、顺序及差分；检查小数／非有限count、51项和10项数字和及总和。 | 30项每个后项为前两和、末514229；全列非严格递增、slice(2)递增；差分长29、首三为1/0/1；count2.9长3、NaN/Infinity空；51项长51、索引50/49=12586269025/7778742049；10项末数字和7、全和88。 |
| SUB_GEOFENCECHECKIN_NUMSEQ_1000 | testPrimeMembership0001 | 遍历 `PRIME_ROWS` 的负数、0/1、质数、平方合数、Carmichael数；另判小数、非有限和大值。 | 各行等于expected；-2/-7/2.5/NaN/Infinity/104730/25为false；104729及1000003为true。 |
| SUB_GEOFENCECHECKIN_NUMSEQ_1100 | testPrimesBelow0001 | 分别求上界30、≤2、3、20、100、1000、10、4、NaN、13、100000以内的质数，检查统计。 | 30内为[2,3,5,7,11,13,17,19,23,29]；≤2空、3内[2]；20内长8末19，100内长25末97、[40,60]计数5；1000内长168且递增；10内和17，4内第二项3；NaN空，13内长5末11；100000内长9592。上界不包含。 |
| SUB_GEOFENCECHECKIN_NUMSEQ_1200 | testGcdLcmMatrix0001 | 遍历 `GCD_ROWS` 正负、零、互质及相同数对；另求非有限、小数和负数对。 | 每行gcd/lcm等于预设；gcd(NaN,4)、gcd(4,Infinity)、lcm(NaN,4)、gcd(NaN,5)为0；(3.9,6.1)→3/6；gcd(-36,24)=12，(13,17)→1/221；gcd(1,1)=1。 |
| SUB_GEOFENCECHECKIN_NUMSEQ_1300 | testFactorialMatrix0001 | 遍历 `FACTORIAL_ROWS`，另求负数、小数、NaN、Infinity、171及1/12/13。 | 各行等于expected；-1/-20/1.5/2.5/NaN/Infinity/171为0；1→1、12→479001600、13→6227020800。 |
| SUB_GEOFENCECHECKIN_NUMSEQ_1400 | testDigitSumAndReverse0001 | 遍历 `DIGIT_ROWS` 求digitSum/digitReverse/palindrome/armstrong及反文数字和，再查负数、非有限和大重复值。 | 四输出分别等于sum/reversed/palindrome/armstrong，反文数字和也等于sum；-123和6、反转321；NaN数字和0、Infinity反转0；-121回文true、NaN回文false；1111111和7且反转不变，2048和14。 |
| SUB_GEOFENCECHECKIN_NUMSEQ_1500 | testPalindromeAndArmstrong0001 | 用 `DIGIT_ROWS`、expectedTwice、expectedReversedPalindrome比较双重数值反转和反文回文；另判Armstrong样本。 | 两预设数组长等于DIGIT_ROWS；逐项等于相应预设、单反转等于row.reversed，末尾0在双重反转中不恢复；1/153/1634/8208/9474/0/-153为Armstrong，154/100不是。 |
| SUB_GEOFENCECHECKIN_NUMSEQ_1600 | testPerfectNumber0001 | 判完全数及邻值、非法输入，再求2/0/-6/6/28/1/12的真因子和。 | 6/28/496/8128/33550336为true；1/0/-6/5/7/27/495/6.5/NaN为false；因子和依次1/0/0/6/28/0/16。 |
| SUB_GEOFENCECHECKIN_NUMSEQ_1700 | testToBaseString0001 | 遍历 `BASE_ROWS` 的二／八／十／十六／36进制含负数样本；另传非法进制和NaN。 | 文本及长度与row.text一致；进制1/37/0/-2/2.5、NaN值均空串；123十进制123、255二进制长8、1000的32进制等于原生toString(32)、1的36进制1。 |
| SUB_GEOFENCECHECKIN_NUMSEQ_1800 | testParseBaseString0001 | 遍历 `PARSE_ROWS` 的大小写、负号、空串和非法数字样本；检查非法进制及具体二／八／16／36进制值。 | valid行等于row.value且非NaN，其他为NaN；进制1/40、独立负号、十进制a为NaN；1010→10、777八进制511、1z→71、-1010→-10、-0→0、ZZ→1295、11二进制3、ff→255、1000十六进制4096、110二进制6。 |
| SUB_GEOFENCECHECKIN_NUMSEQ_1900 | testBaseRoundTrip0001 | 遍历进制2至36及values[0,1,7,42,255,1024,65535,-123]，编码解码；另检查进制及典型文本。 | 35种进制均有效，280次回算恢复原值；1/37/2.5无效、10有效；9二进制1001、0/35/36的36进制0/z/10，-8二进制-1000，7.9十进制截断为7。 |
| SUB_GEOFENCECHECKIN_NUMSEQ_2000 | testClampIntMatrix0001 | 遍历 `CLAMP_ROWS` 的端点、越界、小数、倒置范围；另传NaN/Infinity及小数边界。 | 逐项等于expected；NaN/Infinity落在(3,9)下界3；5.99→5、-5.99限到[0,10]→0；单点7→7；(1,2.9,8.9)→2。 |
| SUB_GEOFENCECHECKIN_NUMSEQ_2100 | testLerpMatrix0001 | 对端点、中间比例、外插、负值、同端点及非有限值调用lerp。 | (0,10)比例0/1/0.5→0/10/5；(10,20)比例0.25/2/-1→12.5/30/0；(-10,10,0.5)=0，同端5→5；NaN/Infinity比例回退起点1，NaN起点结果NaN；(0,1,0.1)=0.1、(100,200,0.75)=175、(-100,100,-0.5)=-200、零端点0。 |
| SUB_GEOFENCECHECKIN_NUMSEQ_2200 | testPercentOfMatrix0001 | 遍历 `PERCENT_ROWS` 部分／总数、负数及零总数样本，另传非有限和超100%的比例。 | 各行与expected误差<1e-12；(1,0)/(0,0)/(NaN,4)/(4,Infinity)为0；(2,1)=200、(1,8)=12.5、(7,4)=175。 |
| SUB_GEOFENCECHECKIN_NUMSEQ_2300 | testRoundToMatrix0001 | 遍历 `ROUND_ROWS` 小数、负精度、负值及浮点舍入预设；另检查π、NaN/Infinity、NaN精度和-0.5。 | 各行等于expected；π精度3/0/4→3.142/3/3.1416，-1234精度-2→-1200；NaN仍NaN、Infinity不变、7的NaN精度不变、0不变；-0.5舍入为负零，其倒数为-Infinity。 |
| SUB_GEOFENCECHECKIN_NUMSEQ_2400 | testArrayStatistics0001 | 对[3,1,4,1,5,9,2,6]、空数组、含NaN/Infinity、负数数组和[2,4]求统计。 | 主样本和31、max9、min1、mean31/8；空数组和/mean0、max/min为NaN；含非有限值求和3；负数max-1、min-9；[2,4]均值3。 |
| SUB_GEOFENCECHECKIN_NUMSEQ_2500 | testCounterHelpers0001 | 对1至10查countAbove阈值5/0/10/-1、countInRange常规／倒置／范围外；查空、同值和小数数组。 | 大于阈值数5/10/0/10，空数组0；区间[3,6]/[1,10]/[11,20]/[6,3]数4/10/0/4，空数组0；三个2在[2,2]数3，小数[1.5,2.5,3.5]大于2数2。 |
| SUB_GEOFENCECHECKIN_NUMSEQ_2600 | testDistinctAndFrequency0001 | 去重并分桶[3,1,3,2,1,3]，查空／单项及桶总数。 | 去重[3,1,2]长3、空长0、单5长1；三个桶按3/1/2排列，count3/2/1；空桶表长0、总数6=源长。 |
| SUB_GEOFENCECHECKIN_NUMSEQ_2700 | testPrefixSumsAndDifferences0001 | 对[1,2,3,4,5]前缀和再差分，检查空／单项及负数前缀和。 | 前缀[1,3,6,10,15]与源等长、末等于源和；差分[2,3,4,5]长4；空前缀、空差分、单9差分均空，单5前缀长1；[-1,-2,-3]前缀末-6且递减。 |
| SUB_GEOFENCECHECKIN_NUMSEQ_2800 | testOrderingChecks0001 | 检查升／降序、重复、空／单项的严格顺序及两数组相等性，另查range和Fibonacci。 | 升[1,2,3]true、重复及倒序false，空／单7true；降[3,2,1]true、重复及升序false、空true；同序列及两空列相等，换序／不同长度不等；升降range对应true，Fibonacci10非严格升序。 |
| SUB_GEOFENCECHECKIN_NUMSEQ_2900 | testSumMultiplesBelow0001 | 对不同上界和除数调用sumMultiplesBelow，含0、负数、小数及NaN。 | (10,2)=30、(9,3)=18、(100,5)=1050、(1,1)=1；上界0/-10/NaN或除数0/0.5/-3/NaN均0；(3,5)=0、(10,2.7)=30、(10,3)=18、(6,6)=6、(100,1)=5050。实际包含上界，不按函数名解释为严格小于。 |
| SUB_GEOFENCECHECKIN_NUMSEQ_3000 | testCollatzSteps0001 | 对1/2/3/4/5/6/7/10/27/0/-5/2.5/NaN/97/9/16/26求Collatz步骤。 | 依次0/1/7/2/5/8/16/6/111/0/0/0/0/118/19/4/10。 |
| SUB_GEOFENCECHECKIN_NUMSEQ_3100 | testToFixedWidth0001 | 遍历 `WIDTH_ROWS` 补零、截长及负号预设；另查零／负宽、NaN、小数、长数和负数。 | 文本等于row.text，正数长width、负数长width+1；宽0/-2或值NaN为空；1.6宽2→02、123456宽3→456、-42宽4→-0042长5、0宽3→000、7宽2→07长2。 |
| SUB_GEOFENCECHECKIN_NUMSEQ_3200 | testBasicUtilClampMatrix0001 | 检查BasicUtil.clamp典型小数和半径；遍历 `CLAMP_ROWS` 同时调用真实clamp及参考clampInt。 | 常规[0,10]中5/-5/15/0/10→5/0/10/0/10，小数3.5保留，[-0.5,1.5]限[0,1]→0/1；半径±8000→5000/50；非倒置行真实结果符合范围条件，所有参考值等于expected；额外0/7/0/5000正确。倒置行不直接断言真实clamp。 |
| SUB_GEOFENCECHECKIN_NUMSEQ_3300 | testBasicUtilRandomInt0001 | 检查单点及倒置范围，抽200次[1,10]，另抽[-1000,1000]、[-5,5]。 | 单点5/0/-7/42/-3返回自身；(5,3)→3、(-1,-9)→-9；200次均为区间内整数，两个额外抽样在各自闭区间内。 |
| SUB_GEOFENCECHECKIN_NUMSEQ_3400 | testBasicUtilPositiveNumber0001 | 判有限正数、±0、负数和非有限；筛选[-200,0,50,5000,5001]并与countAbove比较。 | 1/0.0001/5000/MAX_SAFE_INTEGER/1e-10为true，其余直接否定样本false；筛选[50,5000,5001]长3，countAbove0=3。正数判定不等同围栏半径有效性。 |
| SUB_GEOFENCECHECKIN_NUMSEQ_3500 | testBasicUtilBooleanToFlag0001 | 转换true/false及七项flags，统计true和标记总和，再检查比较表达式标记。 | 每个标记为0或1；true→1、false→0，flagSum=trueCount=4；true/false标记和1；1>0→1、1<0→0。 |
| SUB_GEOFENCECHECKIN_NUMSEQ_3600 | testBasicUtilFormatPercentMatrix0001 | 对ratios[0,0.1,0.25,0.5,0.75,1]检查expectedDefault/expectedZeroDigits及2位后缀，另格式化其他精度和边界。 | 默认为0.0/10.0/25.0/50.0/75.0/100.0%，零位去小数、2位以%结尾；附加25.6%、25.600%、12.3%、99.90%、200.0%、-50.0%、0.000%、0.01%；(0.1234,4)长8，50.0%首5、点索引2。 |
| SUB_GEOFENCECHECKIN_NUMSEQ_3700 | testPercentCrossCheck0001 | 遍历 `PERCENT_ROWS` 比较percentOf预设；对合法[0,1]比例解析formatPercent零位文本，与roundTo比较；另查三分之一、三分之二及一半。 | 误差<1e-12，合法比例文本数字等于四舍五入百分数；1/3一位33.3及33.3%，2/3一位66.7及66.7%；重复固定再舍入为33.3；一半50及50%；3/4与1/4百分数和100。 |
| SUB_GEOFENCECHECKIN_NUMSEQ_3800 | testSeriesCombinationMatrix0001 | 对count1/2/3/5/8比较等差(0,1,count)与range；再统计Fibonacci12及前缀、频率、range和均值。 | 各列相等、长count、和count×(count-1)/2、max=count-1、min0；Fibonacci大于10数5、[2,21]数6、去重长11；前缀末7、首桶count2、偶range长10、1至10和55、奇数列均值5。 |
| SUB_GEOFENCECHECKIN_NUMSEQ_3900 | testLargeValueBoundary0001 | 检查MAX_SAFE_INTEGER数字、gcd、进制、限幅、跨度和比例；检查170!、20!及70项Fibonacci阈值。 | 最大安全整数数字和76、反转>0，与前整数gcd1；170!>0、与169!比170；16进制长14、1fffffffffffff解析恢复；正／负限[0,100]→100/0，最大跨度range长2、自比例100、非回文，与3的gcd1；20!数字和54，255→ff；Fibonacci70大于1e15数0，大于1e10数>0。 |
| SUB_GEOFENCECHECKIN_NUMSEQ_4000 | testNegativeInputMatrix0001 | 遍历negatives[-1,-9,-10,-121,-1001,-1234]与绝对值比较数字函数及进制往返；另查负数理论函数。 | 数字和、反转、回文等于绝对值结果；十进制带负号、二进制往返保留负值；-1/-9为Armstrong，-10不是；限幅-150→-100，gcd(-12,-18)=6、lcm(-6,-8)=24，round(-12.345,2)=-12.34、percent(-1,4)=-25。 |
| SUB_GEOFENCECHECKIN_NUMSEQ_4100 | testGeometricAndArithmeticComposition0001 | 对count2至6生成2次幂列及差分；对(3,3,10)等差列求前缀、均值、区间数及去重。 | 幂列长count、末2^(count-1)、差分长count-1且递增、和2^count-1；等差前缀末165、均值16.5、[10,20]数3、去重长10。未使用对数断言。 |
| SUB_GEOFENCECHECKIN_NUMSEQ_4200 | testNumberTheoryCrossLink0001 | 遍历values[6,28,496,12,17,97]比较完全数与真因子和、质数与primesBelow成员关系；查gcd及数字和。 | 完全数判定等于因子和=自身，质数判定等于质数列表含该值；列表长、gcd及数字和均>0；8内质数长4、496为完全数。未断言跨样本质数数量单调。 |

## 28. [NumberStatistics.test.ets](entry/src/ohosTest/ets/test/NumberStatistics.test.ets)（11 个）

辅助实现见 [NumberStatisticsUtil.ets](entry/src/ohosTest/ets/test/support/NumberStatisticsUtil.ets)。DATA_SETS覆盖空、单项、奇偶数量、乱序、重复、正负、小数和较大值；方差采用总体公式。

| 用例编号 | 用例名称 | 测试步骤 | 预期结果 |
| --- | --- | --- | --- |
| SUB_GEOFENCECHECKIN_NUMSTAT_0100 | testTotal0001 | 按 `TOTAL_CASES.index` 取DATA_SETS求total，另求空/[1]/[1,2,3]/[-1,1]。 | 各行与expected误差<0.000001、checked等于表长；附加和0/1/6/0。 |
| SUB_GEOFENCECHECKIN_NUMSTAT_0200 | testMean0002 | 按 `MEAN_CASES.index` 取DATA_SETS求mean，另求空/[2]/[1,2,3]/[-1,1]。 | 各行与expected误差<0.000001、checked等于表长；附加均值0/2/2/0。 |
| SUB_GEOFENCECHECKIN_NUMSTAT_0300 | testMedian0003 | 按 `MEDIAN_CASES.index` 取DATA_SETS求median，另求空、乱序奇／偶项及重复值。 | 各行与expected误差<0.000001、checked等于表长；空→0、[3,1,2]→2、[4,1,3,2]→2.5、[5,5,5]→5。 |
| SUB_GEOFENCECHECKIN_NUMSTAT_0400 | testMode0004 | 按 `MODE_CASES.index` 取DATA_SETS求mode，另求空、唯一众数、并列及单项。 | 各行与expected误差<0.000001、checked等于表长；空→0、[1,1,2]→1、[2,1,2,1]→1、[9]→9；并列取较小值。 |
| SUB_GEOFENCECHECKIN_NUMSTAT_0500 | testRange0005 | 按 `RANGE_CASES.index` 取DATA_SETS求极差，另求空/[7]/[1,5]/[-5,5]。 | 各行与expected误差<0.000001、checked等于表长；附加极差0/0/4/10。 |
| SUB_GEOFENCECHECKIN_NUMSTAT_0600 | testMinMax0006 | 对空、[3,1,2]、[-3,-1,-2]、[5]、[1,1,1]求minValue/maxValue。 | 分别0/0、1/3、-3/-1、5/5、1/1。 |
| SUB_GEOFENCECHECKIN_NUMSTAT_0700 | testVariance0007 | 按 `VARIANCE_CASES.index` 求总体方差，另求空/[5]/[1,3]及标准差。 | 方差与expected误差<0.000001、checked等于表长；空及单项方差0、[1,3]方差1、标准差与1误差<0.000001；空标准差0。 |
| SUB_GEOFENCECHECKIN_NUMSTAT_0800 | testPercentile0008 | 对空、单项及[1,2,3,4]求分位0/25/50/75/100，另求乱序50及-10/150。 | 空50→0、单5→5；五分位1/1/2/3/4；乱序50→2；-10→1、150→4，使用nearest-rank并限幅。 |
| SUB_GEOFENCECHECKIN_NUMSTAT_0900 | testCountAbove0009 | 按 `COUNT_CASES.index` 对DATA_SETS查大于3数量；另查空、[4,5]、[1,2]及[3]的上下计数。 | 表结果与expected误差<0.000001、checked等于表长；空上下计数0、[4,5]大于3为2、[1,2]小于3为2；等于阈值3的项上下均不计。 |
| SUB_GEOFENCECHECKIN_NUMSTAT_1000 | testNormalize0010 | 归一化[1,2,3]、[5,5,5]、空和[-1,1]。 | 第一列长3且0/0.5/1；常量列三项均0；空长0；负正两项为0/1。 |
| SUB_GEOFENCECHECKIN_NUMSTAT_1100 | testDistinctCount0011 | 对空、单1、三个1、[1,2,3]、[1,2,1,2]、[-1,1]、三个0及1至5求不同值数。 | 依次0/1/1/3/2/2/1/5。 |

## 29. [NumberStatisticsExhaustive.test.ets](entry/src/ohosTest/ets/test/NumberStatisticsExhaustive.test.ets)（3 个）

| 用例编号 | 用例名称 | 测试步骤 | 预期结果 |
| --- | --- | --- | --- |
| SUB_GEOFENCECHECKIN_NUMSTEXH_0100 | testStatisticsExhaustive0001 | 遍历 `DATASET_CASES`，为第i行生成1至i+1数组，求total/mean/range，再求空数组total。 | 表长100、checked100；三个输出分别等于row.total/mean/range；空和0。 |
| SUB_GEOFENCECHECKIN_NUMSTEXH_0200 | testMedianExhaustive0002 | 对size1至100生成1至size数组，求中位数，再求空数组。 | 100次分别等于奇数(size+1)/2或偶数size/2+0.5；空中位数0。 |
| SUB_GEOFENCECHECKIN_NUMSTEXH_0300 | testModeExhaustive0003 | 对size1至100生成1至size数组，额外加入1，求众数，再求空数组。 | 100次众数均1；空众数0。本用例通过额外重复1制造唯一众数。 |

## 30. [NumericMatrix.test.ets](entry/src/ohosTest/ets/test/NumericMatrix.test.ets)（26 个）

辅助实现见 [NumericMatrixUtil.ets](entry/src/ohosTest/ets/test/support/NumericMatrixUtil.ets)。其空数组统计值为0；倒置区间筛选不自动交换，与 NumberSequenceUtil 的规则不同。

| 用例编号 | 用例名称 | 测试步骤 | 预期结果 |
| --- | --- | --- | --- |
| SUB_GEOFENCECHECKIN_NUMMAT_0100 | testCartesian2Matrix0001 | 遍历 `CARTESIAN_CASES` 空边、单点、行列、方阵、负数、小数、重复值调用cartesian2。 | 表长9；各结果长expectedCount且等于两边长度积；非空首末pair字段等于预设、首second=b[0]；任一边为空及两边空均长0。 |
| SUB_GEOFENCECHECKIN_NUMMAT_0200 | testCartesian2Order0001 | 对a[10,20,30]与b[1,2,3,4]生成乘积，按i×b.length+j逐项比对，求每对字段和的总和。 | 长12、每对first=a[i]/second=b[j]；first按4项块排列10/20/30，末second4，second周期1至4、指定位置一致；字段总和270。 |
| SUB_GEOFENCECHECKIN_NUMMAT_0300 | testCartesian3Matrix0001 | 生成[1,2]×[3]×[4,5]，检查指定字段；再查空边和[-1,0,1]三维立方。 | 主积长4、首(1,3,4)、第二third5、后两first2、末(2,3,5)；任何空边长0；立方长27、全部坐标总和0。 |
| SUB_GEOFENCECHECKIN_NUMMAT_0400 | testFlattenMatrix0001 | 展平空／空行、单7、2×2方阵、不等长行、负数矩阵。 | 三种空情况长0；单项长1值7；方阵为1/2/3/4长4；不等长长6、索引0/2/5为1/3/6；负数展平min-3/max-1/和-6。 |
| SUB_GEOFENCECHECKIN_NUMMAT_0500 | testChunkMatrix0001 | 遍历 `CHUNK_CASES` 空源、非法大小、整除／余数／超大／小数大小及负值，分块再展平。 | 块数与expectedChunks、首末块长度与预设一致；非空分块展平长度及每项恢复源；size0/-1及空源长0，单7按1分块长1值7，3项按5分块长1。 |
| SUB_GEOFENCECHECKIN_NUMMAT_0600 | testUniqueNumbersMatrix0001 | 去重空、单项、重复、混合顺序、负数、小数及100项i%10。 | 空长0、单长1、四个1→单1；混合为[3,1,2,5]长4；负数长3首-1末1；小数长2首0.5；大数组去重长10末9。 |
| SUB_GEOFENCECHECKIN_NUMMAT_0700 | testSortMatrix0001 | 对[10,9,100,1,-5]升降序；检查源首末和长度，再排序空／单42、小数、重复数组。 | 升序[-5,1,9,10,100]、降序首100末-5；源首10末-5长5；空升序空、单42降序42；小数首0.1末0.3，重复长4首1末2。未逐项断言源全部内容或降序中间值。 |
| SUB_GEOFENCECHECKIN_NUMMAT_0800 | testStatisticsMatrix0001 | 遍历 `STATS_CASES` 空、单项、重复、负数、小数、较大值，计算七统计量及count。 | count/sum/average/min/max/median等于预设；variance/stdDev误差<1e-9；空min/max/median/variance/stdDev均0。 |
| SUB_GEOFENCECHECKIN_NUMMAT_0900 | testStatisticsConsistency0001 | 生成500项(i%37)-18，求统计；按-18至18分桶求和，调用describe，再描述空数组。 | 长500、min-18/max18、均值在范围内；stdDev²与variance误差<1e-9、variance>0；桶和等于总和；describe.count500、其他统计与独立函数一致，浮点误差<1e-9；空count/stdDev0。 |
| SUB_GEOFENCECHECKIN_NUMMAT_1000 | testBoundaryValuesMatrix0001 | 遍历 `BOUNDARY_CASES` 数量0/1/多项、零跨度、负中心、小数跨度，求boundaryValues；另查负步数和(0,4,5)。 | 长度等于expectedLength，首末与预设误差<1e-9且夹住center；负步数只含5；五项中间为-2/0/2、非递减。 |
| SUB_GEOFENCECHECKIN_NUMMAT_1100 | testGridOfNumbersMatrix0001 | 遍历 `GRID_CASES` 零／负维度、单点、行列、方阵、零／小数步长生成网格；另查3×3的行列和。 | rows/cols、首末值等于预设，展平长为预设行列乘积；3×3索引[0][1]/[1][0]/[2][2]=2/4/9；首行和6、第三列和18，展平严格递增。此用例未单独传非有限维度。 |
| SUB_GEOFENCECHECKIN_NUMMAT_1200 | testGridInfoMatrix0001 | 描述(-3,5)/(0,0)/(4,4)/(2,7)/(9,1)，将4×4实体展平，再描述Infinity和NaN行。 | 负行rows0/cols5/total0，零total0；方阵4/4/16，宽total14、高total9；实体长度16；Infinity行rows0/total0；NaN行rows0/cols3。 |
| SUB_GEOFENCECHECKIN_NUMMAT_1300 | testRangeHelpers0001 | 对[-5,-1,0,1,2,3,4,5]计数常规／单点／范围外／全范围／倒置；筛选[-1,2]，再筛选小数。 | 计数[-1,1]=3、[0,0]=1、[10,20]=0、空0、全范围8、倒置[4,1]=0；筛选长4首-1末2且与计数一致，范围外空；小数[0.2,0.3]长2末0.3。 |
| SUB_GEOFENCECHECKIN_NUMMAT_1400 | testMatrixShapeHelpers0001 | 对[[1,2,3],[4,5,6]]求行列和、非法索引和转置，再对不等长矩阵转置。 | 行和6/15、负／越界／空行0；列0/2为5/9、负／越界列0；转置长3、首行长2且1/4、[2][1]=6；空转置空；不等长首列和7，转置长3、首行长3、末行长1值6。 |
| SUB_GEOFENCECHECKIN_NUMMAT_1500 | testSequenceHelpers0001 | 对[1,2,3,4]左转1/5/-1/4，查空／单项，再求前缀和与原列差分。 | 左转1/5首2末1，-1首4次1，4首1末4；空旋转空、单9不变；前缀长4、索引0/1/3=1/3/10，空前缀空；原列差分长3首1，空／单项差分空。未将前缀差分与原列作恢复比较。 |
| SUB_GEOFENCECHECKIN_NUMMAT_1600 | testScaleAndRound0001 | 对[1,2,3]缩放2/0/-1，查空源；对[1.2345,2.3456,3.4567]取2位／0位，另用负精度。 | 倍列长3首2末6，零列和0、负列和-6、空缩放空、源首1；两位为1.23/2.35/3.46、零位1/2/3；[1.7]负精度结果2；小数源首仍1.2345。 |
| SUB_GEOFENCECHECKIN_NUMMAT_1700 | testHistogram0001 | 以edges[0,10,20]求-5/0/9/10/25的桶及空edges；统计六样本、空样本和无边界直方图。 | 桶索引0/1/1/2/3，空edges索引0；六样本四桶[1,2,2,1]、合计6；空样本四桶且首0；无边界两值仅一桶、count2。 |
| SUB_GEOFENCECHECKIN_NUMMAT_1800 | testProgressionHelpers0001 | 生成等差(1,3,5)、负步长(10,-2,4)、count0/-5，等比(1,2,5)、减半(8,0.5,4)、比1及count0。 | 正等差长5、首1次4末13、和35且严格升序；负等差首10末4、非升序；非法count空；等比长5、索引0/2/4=1/4/16，减半索引1/3=4/1；比1长3、count0空。 |
| SUB_GEOFENCECHECKIN_NUMMAT_1900 | testOrderingHelpers0001 | 比较严格升序和非递减的重复、倒序、空、单项；对样本排序后判顺序。 | 严格[1,2,3]true，重复／倒序／空／单项false；非递减重复升序true、[2,1]和空false、单5true；排序后升序非递减true、降序false且首7。 |
| SUB_GEOFENCECHECKIN_NUMMAT_2000 | testDecimateAndCombine0001 | 对0至7按stride2/3/0/-2抽样，查空；对两列逐项加减，检查不同长度和空列。 | stride2长4、指定值0/2/6；stride3长3末6；0/-2长8、空长0；加法长3首11末33，减法首-9末-27；长度不齐取较短长2/1，两空列长0。 |
| SUB_GEOFENCECHECKIN_NUMMAT_2100 | testIndexOfValue0001 | 查询[4,1,4,2,4]中4/1/9及空／单项／负／小数样本；生成20项交替0/1查询0。 | 4索引[0,2,4]长3，1长1索引1，9和空无命中；单7索引0、两个-1命中2、小数0.5命中1；交替0命中10、末索引18。 |
| SUB_GEOFENCECHECKIN_NUMMAT_2200 | testClampCrossCheck0001 | 遍历 `CLAMP_CASES` 越界、端点、倒置、小数和大值调用BasicUtil.clamp；限[-20,-5,0,5,20]到[-5,5]再统计。 | 各行等于expected，正常区间内不越界；派生列首/中/末=-5/0/5，min-5/max5、范围内5项；绝对值总和严格小于原列。 |
| SUB_GEOFENCECHECKIN_NUMMAT_2300 | testRandomIntCrossCheck0001 | 抽200次[1,100]整数，统计区间；检查单点／倒置，抽50次[0,1]并取[1,9]判正。 | 200次均为闭区间整数、长200、区间内200、[-100,0]数0；(7,7)=7、(5,1)=1、(-3,-3)=-3；50个小样本全部在[0,1]；[1,9]结果为正数。 |
| SUB_GEOFENCECHECKIN_NUMMAT_2400 | testPositiveNumberCrossCheck0001 | 判有限正数、零、负数和非有限；从[-2,-0.5,0,0.5,2]筛选正范围，再比较min/max/average的判定。 | 1/0.0001/1e9 true，其余直接否定样本false；筛选长2、等于另一正范围计数；max2且判正true、min判正false、对称均值判正false、正值子集均值判正true。 |
| SUB_GEOFENCECHECKIN_NUMMAT_2500 | testFormatPercentCrossCheck0001 | 遍历 `PERCENT_CASES` 的比例、精度、负值及超1样本，解析数字部分；再查默认／3位／0位及均值派生比例。 | 每行等于expected、末字符%、数字非NaN，与ratio×100差<10^(-digits)/2+1e-9；0.5输出50.0%/50.000%/50%；均值≈0.2、输出20.0%；0.25→25.0%、0.125两位→12.50%、0零位→0%。 |
| SUB_GEOFENCECHECKIN_NUMMAT_2600 | testLargeMatrixAggregation0001 | 生成40×25、0起步长1网格，展平、求行列和、全行聚合、直方图和250项分块。 | 行40列25，展平长1000首0末999且升序；首行300、末行300+39×25×25，首／末列19500/20460；全行和等于展平和；四桶合计1000、首末桶各100；分4块、末块250。 |

## 31. [NumericString.test.ets](entry/src/ohosTest/ets/test/NumericString.test.ets)（10 个）

辅助实现见 [NumericStringUtil.ets](entry/src/ohosTest/ets/test/support/NumericStringUtil.ets)。

| 用例编号 | 用例名称 | 测试步骤 | 预期结果 |
| --- | --- | --- | --- |
| SUB_GEOFENCECHECKIN_NUMSTR_0100 | testParseInteger0001 | 遍历 `PARSE_INT_CASES` 带符号、边空白、前零、非法小数／指数／空文本及fallback；另查42/-42/边空白42/4.2。 | 逐项等于expected、checked等于非空表长；附加42/-42/42/-1。 |
| SUB_GEOFENCECHECKIN_NUMSTR_0200 | testParseDecimal0002 | 遍历 `PARSE_DECIMAL_CASES` 符号、缺整数／小数部分、边空白和非法文本；另查1.5/-1.5/.5/1e3。 | 逐项等于expected、checked等于非空表长；附加1.5/-1.5/0.5/-1（fallback）。 |
| SUB_GEOFENCECHECKIN_NUMSTR_0300 | testIsNumeric0003 | 遍历 `NUMERIC_CASES` 普通十进制及指数、分组、十六进制、空文本，另查123/-123/1.2.3/空串。 | 逐项等于expected、checked等于非空表长；附加true/true/false/false。 |
| SUB_GEOFENCECHECKIN_NUMSTR_0400 | testExtractDigits0004 | 遍历 `DIGIT_CASES` 字母／数字／符号／中文混合样本，提取并计数；另查abc及1a2b3c。 | 提取等于digits、数量等于count，checked等于非空表长；abc为空／0，1a2b3c为123／3。 |
| SUB_GEOFENCECHECKIN_NUMSTR_0500 | testNormalizeIntegerText0005 | 遍历 `NORMALIZE_CASES` 符号、前零、负零、边空白和非法文本，另查000123/-000/+000120/12a。 | 逐项等于expected、checked等于非空表长；附加123/0/120/空串，零不保留负号，正数不保留加号。 |
| SUB_GEOFENCECHECKIN_NUMSTR_0600 | testCompareNumericText0006 | 遍历 `COMPARE_CASES` 大小、等值、负值、前零和非法输入对，另比10/9、9/10、10/010、x/10。 | 逐项等于expected、checked等于非空表长；附加1/-1/0/0，非法输入回退0不表示数值真实相等。 |
| SUB_GEOFENCECHECKIN_NUMSTR_0700 | testFormatWithSign0007 | 遍历 `SIGN_CASES` 0、正负整数和小数，另查0/1/-1及100首字符。 | 逐项等于expected、checked等于非空表长；0→0、1→+1、-1→-1，100首字符+。 |
| SUB_GEOFENCECHECKIN_NUMSTR_0800 | testSplitNumericText0008 | 遍历 `SPLIT_CASES` 带符号、小数、整数、缺部分和非法文本，求integerPart/fractionPart；另查12和abc。 | 两部分分别等于预设、checked等于非空表长；12为12/空串，abc两部分均空。 |
| SUB_GEOFENCECHECKIN_NUMSTR_0900 | testNumericStringInvariants0009 | 对-200至200转字符串，再parseInteger和normalizeIntegerText；另查00123和formatWithSign(7)。 | 401次解析恢复整数、归一化文本不变；00123解析123、归一化123；7带符号+7。 |
| SUB_GEOFENCECHECKIN_NUMSTR_1000 | testNumericStringBoundaries0010 | 检查空／纯空白／独立符号、空解析fallback、空数字提取、空归一化／比较；检查20位9整数部分和其小数解析。 | 空／空白／+／-均非numeric；空解析返回9和9.5；空提取空、数量0、空白归一化空、两空比较0；20位9整数部分原文保留，小数解析仅断言>0，不保证精度无损。 |

## 32. [NumericStringExhaustive.test.ets](entry/src/ohosTest/ets/test/NumericStringExhaustive.test.ets)（3 个）

| 用例编号 | 用例名称 | 测试步骤 | 预期结果 |
| --- | --- | --- | --- |
| SUB_GEOFENCECHECKIN_NUMSTREXH_0100 | testParseIntegerExhaustive0001 | 遍历 `PARSE_INT_CASES` 整数文本，fallback=-9999；另解析bad和空串，fallback42。 | 301行均等于expected；bad、空串返回42。 |
| SUB_GEOFENCECHECKIN_NUMSTREXH_0200 | testNormalizeTextExhaustive0002 | 遍历 `NORMALIZE_TEXT_CASES` 前零文本，另检查-000/+007。 | 101行均等于expected；附加0/7。 |
| SUB_GEOFENCECHECKIN_NUMSTREXH_0300 | testDigitScanExhaustive0003 | 遍历 `DIGIT_SCAN_CASES` 混合数字文本，提取及计数，再查abc/a1b2c3。 | 101行提取等于digits、数量等于count；abc提取为空，a1b2c3数量3。 |

## 33. [RecordStoreMatrix.test.ets](entry/src/ohosTest/ets/test/RecordStoreMatrix.test.ets)（18 个）

套件以顶层UIAbility context操作数据库，开始时克隆配置快照、清空记录，结束时清空记录并恢复配置。下表记录类用例均先clearRecords；纯配置覆盖／标志用例不另外清记录。`recordCount`只返回列表长度。分钟／小时／天为60000／3600000／86400000毫秒。

| 用例编号 | 用例名称 | 测试步骤 | 预期结果 |
| --- | --- | --- | --- |
| SUB_GEOFENCECHECKIN_STOREMAT_0100 | testConfigFieldMatrix0001 | 遍历drafts的正常、最小／最大半径、空名原点半径25、极端坐标半径1配置，逐次saveConfig/getConfig。 | 每个配置七字段均等于draft，configEquals=true、差异数0。仅检查持久化，不要求这些配置通过围栏校验。 |
| SUB_GEOFENCECHECKIN_STOREMAT_0200 | testConfigOverwriteMatrix0001 | 保存overwrite_first(11.1,22.2,100,1,false,1000)，再保存overwrite_second(33.3,44.4,900,2,true,2000)并读回。 | 首次name正确且停用；第二次七字段为second值，等于second、不等于first、差异非空。未直接统计配置表行数。 |
| SUB_GEOFENCECHECKIN_STOREMAT_0300 | testConfigEnabledFlagMatrix0001 | 四轮保存toggle_step、坐标10/20、默认半径、fenceId=step、updatedAt=5000+step，enabled交替true/false。 | 每轮enabled/name/fenceId/updatedAt/radius等于本轮值；最终enabled=false、name=toggle_3。本用例未逐轮断言坐标。 |
| SUB_GEOFENCECHECKIN_STOREMAT_0400 | testEnterCreatesOpenRecord0001 | 查空表开放记录，t进入，再查开放记录和列表。 | 起初undefined；创建记录存在、enterTime=t、exitTime=OPEN_END、durationMs0、ID>0且开放；重读开放记录存在且时间／标记／时长一致；列表1条。 |
| SUB_GEOFENCECHECKIN_STOREMAT_0500 | testRepeatedEnterIgnored0001 | t首次进入，t+1分钟和t+2分钟再进入，查开放记录和列表。 | 首次存在、后两次undefined；开放记录ID为首次ID、enterTime=t、exitTime=OPEN_END；列表仍1条且进入时间t。 |
| SUB_GEOFENCECHECKIN_STOREMAT_0600 | testExitClosesOpenRecord0001 | t进入，t+7分钟退出，查开放记录和列表。 | 进入／退出均存在；退出ID保持、enterTime=t、exitTime=t+420000、durationMs420000、非开放；查询开放记录undefined；列表1条、退出和时长相同。 |
| SUB_GEOFENCECHECKIN_STOREMAT_0700 | testExitWithoutEnterIgnored0001 | 空表退出并读列表；t进入、+1分钟退出、+2分钟重复退出，查列表和开放记录。 | 空退出undefined、列表0；进入及首次退出存在，重复退出undefined；列表1条、duration60000、exitTime=t+60000；无开放记录。 |
| SUB_GEOFENCECHECKIN_STOREMAT_0800 | testTransitionStateMachineCycles0001 | 三轮按小时间隔进入，每轮查询开放记录、1分钟后退出，再查开放记录；末尾读全列表。 | 每轮进入／开放查询／退出存在，开放时间及标记正确、退出时长60000，轮后无开放记录；最终3条、每条一分钟且闭合。 |
| SUB_GEOFENCECHECKIN_STOREMAT_0900 | testOpenRecordSelectsNewest0001 | 先查空表，再建立t的一分钟闭合记录；t+1小时建立开放记录并查，关闭后再查列表。 | 空查询undefined；两次进入存在；选中开放记录ID对应第二次、enterTime=t+小时、exitTime=OPEN_END、duration0；关闭后undefined、列表2条。未制造多条同时开放记录。 |
| SUB_GEOFENCECHECKIN_STOREMAT_1000 | testRecordsOrderNewestFirst0001 | 建立四条每隔1小时进入、一分钟停留记录，读取全部。 | 长4，逐项enterTime=t+(3-index)×小时、duration60000；首新于末且相邻时间严格递减。 |
| SUB_GEOFENCECHECKIN_STOREMAT_1100 | testRecordsLimitMatrix0001 | 建立五条小时间隔的一分钟记录，先查全部，再以limit1至5及15查询。 | 全量5；每个limit返回恰好limit条、首为最新、末与full[limit-1]相同；limit15仍5条。 |
| SUB_GEOFENCECHECKIN_STOREMAT_1200 | testRecordsDefaultLimitBound0001 | 建立23条每分钟进入、停留1000毫秒记录，默认查询，再显式limit20。 | 默认恰好20条且少于23，首enter=t+22分钟、duration1000，相邻时间严格递减；显式20长20、首时间与默认一致。 |
| SUB_GEOFENCECHECKIN_STOREMAT_1300 | testDaySummaryCountMatrix0001 | 从当天日首空汇总开始，在日首+1/2/3小时分别建立1/2/3分钟记录，每轮查询汇总。 | 初始count/duration均0；各轮count=index+1、duration为累计时长；最终count3、duration360000。 |
| SUB_GEOFENCECHECKIN_STOREMAT_1400 | testDaySummaryWindowMatrix0001 | 建立日首前1小时的一分钟、恰在日首的两分钟、日首+5小时的三分钟记录；按当天／前一天／后一天日首查询。 | 当天count2、duration300000；前一天起查询count3、duration360000；未来count/duration0。反映进入时间下界筛选，不宣称仅统计封闭的一天窗口。 |
| SUB_GEOFENCECHECKIN_STOREMAT_1500 | testClearRecordsResetsStore0001 | 保存clear_kept(12.5,34.5,600,5,true,9000)，建立一分钟记录查汇总，再清空、查全部及配置，最后重新进入。 | 清空前count1；清空后列表0、开放undefined、汇总0/0；配置name/radius正确且七字段等于keptConfig；重新进入存在、列表1条。 |
| SUB_GEOFENCECHECKIN_STOREMAT_1600 | testSimulateTransitionStateMatrix0001 | simulate参数3，按ENTER/ENTER/EXIT/EXIT执行，再读取记录。 | 首进入changed=true、actionENTER、record存在且开放／时长0；重复进入changed=false、无record；首退出changed=true、actionEXIT、record存在、duration≥0且闭合；重复退出false且无record；列表1条且非开放。 |
| SUB_GEOFENCECHECKIN_STOREMAT_1700 | testCombinedStoreOperationSequence0001 | 保存configA后覆盖combined_b(30,120,MAX_RADIUS,9,false,8800)；建立三轮1/2/3分钟记录，查全部／limit2／日汇总／开放记录，再清空及读配置。 | 读回name=combined_b、radius=MAX_RADIUS；各轮进入／退出存在；全量3、限量2、首时间一致；汇总3/360000、无开放记录；清空后列表0、配置名仍combined_b。 |
| SUB_GEOFENCECHECKIN_STOREMAT_1800 | testFixtureDrivenRecordRoundTrip0001 | t进入，与工厂开放预设比较并克隆；+2分钟退出，与闭合预设比较；以工厂汇总列表再比存储日汇总。 | 进入存在、开放，时间／标记／时长等于预设、ID>0；克隆值相等实例不同；退出存在、闭合、duration120000、exit=t+120000、四字段等于闭合预设；两汇总相等，stored.count1。 |

## 34. [TimeCombinationMatrix.test.ets](entry/src/ohosTest/ets/test/TimeCombinationMatrix.test.ets)（8 个）

| 用例编号 | 用例名称 | 测试步骤 | 预期结果 |
| --- | --- | --- | --- |
| SUB_GEOFENCECHECKIN_TIMECMB_0100 | testDateTimeCombination0001 | 遍历 `DATE_CASES` 固定本地日期（含闰日、年末和2038样本），构造时间戳，格式化日期时间和时刻；查0/-1。 | 两文本分别等于dateTime/time，长度19/8，checked等于非空表长；formatDateTime(0/-1)、formatTime(0)均--。 |
| SUB_GEOFENCECHECKIN_TIMECMB_0200 | testDurationCombination0002 | 遍历 `DURATION_CASES` 负值、毫秒截断、秒分时日边界及百小时，再查0/-500/1000。 | 文本及长度等于expected，checked等于非空表长；百小时可输出100:00:00、不截为两位；附加00:00:00/00:00:00/00:00:01。 |
| SUB_GEOFENCECHECKIN_TIMECMB_0300 | testPadCombination0003 | 遍历 `PAD_CASES` 0至120代表值调用padTwo；再逐个检查0至100输出长度。 | 表逐项等于expected、checked等于非空表长；额外101次长度均≥2，不要求100仍是两位。 |
| SUB_GEOFENCECHECKIN_TIMECMB_0400 | testDateTimeParts0004 | 格式化本地2026-01-15 09:05:03，拆分日期、空格、时间并检查位置。 | 日期2026-01-15、分隔空格、时刻09:05:03；空格索引10、全长19、分2段、索引4为短横。 |
| SUB_GEOFENCECHECKIN_TIMECMB_0500 | testDayStartCombination0005 | 对2026-01-15 09:30和22:15求日首，格式化并再次归一化。 | 两日首相等且不晚于输入；时刻00:00:00、日期2026-01-15、重复调用不变。 |
| SUB_GEOFENCECHECKIN_TIMECMB_0600 | testDayStartWeek0006 | 从本地2026-05-01中午起，按86400000毫秒增加六次，逐次求日首比较。 | 各后日首严格大于前值；初始日首时刻00:00:00且不晚于base，次日大于首日。未断言相邻日首差恰好86400000。 |
| SUB_GEOFENCECHECKIN_TIMECMB_0700 | testDurationBoundaries0007 | 格式化999/1000/59999/60000/3599999/3600000/86399999/86400000毫秒。 | 依次00:00:00/00:00:01/00:00:59/00:01:00/00:59:59/01:00:00/23:59:59/24:00:00。 |
| SUB_GEOFENCECHECKIN_TIMECMB_0800 | testTimeRoundTrip0008 | 格式化本地2026-09-09 14:25:36，按冒号拆分为数字，另用padTwo拼接。 | 三段数字14/25/36，文本14:25:36，手工pad拼接与文本一致。 |

## 35. [TimeDurationDeepExhaustive.test.ets](entry/src/ohosTest/ets/test/TimeDurationDeepExhaustive.test.ets)（1 个）

| 用例编号 | 用例名称 | 测试步骤 | 预期结果 |
| --- | --- | --- | --- |
| SUB_GEOFENCECHECKIN_TIMEDEEPDUR_0100 | testDurationDeep0001 | 遍历 `DURATION_DEEP_CASES` 整秒对应毫秒样本调用formatDuration，再查-1。 | 1501行等于expected；-1→00:00:00。 |

## 36. [TimeExhaustiveMatrix.test.ets](entry/src/ohosTest/ets/test/TimeExhaustiveMatrix.test.ets)（3 个）

| 用例编号 | 用例名称 | 测试步骤 | 预期结果 |
| --- | --- | --- | --- |
| SUB_GEOFENCECHECKIN_TIMEEXH_0100 | testFormatDateTimeEveryDay20240001 | 遍历 `DATE_EXHAUSTIVE_CASES` 的2024日期，以本地08:30:15构造并格式化，再查0/-1。 | 366行等于expected（含闰日）；0及-1均--。 |
| SUB_GEOFENCECHECKIN_TIMEEXH_0200 | testFormatTimeEveryMinute0002 | 遍历 `TIME_EXHAUSTIVE_CASES` 时分表，以本地2025-01-15、秒0构造，另查0/-1000。 | 1440行等于expected；0和-1000均--。 |
| SUB_GEOFENCECHECKIN_TIMEEXH_0300 | testFormatDurationEverySecond0003 | 遍历 `DURATION_EXHAUSTIVE_CASES`，将input秒乘1000格式化，再查0/-1。 | 301行等于expected且每项长8；0/-1均00:00:00。 |

## 37. [TimeFormatDeepExhaustive.test.ets](entry/src/ohosTest/ets/test/TimeFormatDeepExhaustive.test.ets)（1 个）

| 用例编号 | 用例名称 | 测试步骤 | 预期结果 |
| --- | --- | --- | --- |
| SUB_GEOFENCECHECKIN_TIMEDEEPFMT_0100 | testFormatTimeDeep0001 | 遍历 `TIME_MINUTE_CASES` 全天时分预设，以本地2024-01-01、秒0构造并格式化，另查0。 | 1440行等于expected；0→--。 |

## 38. [TimePadMatrix.test.ets](entry/src/ohosTest/ets/test/TimePadMatrix.test.ets)（44 个）

`PAD_LIMIT=10`，`PLACEHOLDER='--'`。padTwo按数值是否小于10决定前置一个0，而不是截成两位；因此负数和小数的输出规则需按下列断言阅读。

| 用例编号 | 用例名称 | 测试步骤 | 预期结果 |
| --- | --- | --- | --- |
| SUB_GEOFENCECHECKIN_TIMEPAD_0100 | testPadTwoSingleDigit0001 | 遍历 `PAD_SINGLE_ROWS` 的0至9，比较文本、首字符和回算；另查0/9/5。 | 每项等于row.text、长2、首0、Number回算原值；0→00、9→09、5输出第二字符5。 |
| SUB_GEOFENCECHECKIN_TIMEPAD_0200 | testPadTwoTeenBand0001 | 遍历 `PAD_TEEN_ROWS` 的10至19，另查10/19/11长度。 | 每项等于row.text和原值toString、长2、首1；10/19原文不变、11长2。 |
| SUB_GEOFENCECHECKIN_TIMEPAD_0300 | testPadTwoTwentyBand0001 | 遍历 `PAD_TWENTY_ROWS` 的20至29，检查文本、长度、首字符及空子串位置；另查20/29/25。 | 每项等于row.text、长2、首2，空子串indexOf=0；20/29不变、25第二字符5。 |
| SUB_GEOFENCECHECKIN_TIMEPAD_0400 | testPadTwoThirtyBand0001 | 遍历 `PAD_THIRTY_ROWS` 的30至39并Number回算，另查30/39/33。 | 每项等于row.text、长2、首3、回算原值；附加30/39/33原文不变。 |
| SUB_GEOFENCECHECKIN_TIMEPAD_0500 | testPadTwoFortyBand0001 | 遍历 `PAD_FORTY_ROWS` 的40至49并回算，另查40/49/44。 | 每项等于row.text、长2、首4、回算原值；40/49不变、44第二字符4。 |
| SUB_GEOFENCECHECKIN_TIMEPAD_0600 | testPadTwoFiftyBand0001 | 遍历 `PAD_FIFTY_ROWS` 的50至59并回算，另查50/59/55。 | 每项等于row.text、长2、首5、回算原值；附加50/59/55不变。 |
| SUB_GEOFENCECHECKIN_TIMEPAD_0700 | testPadTwoSixtyBand0001 | 遍历 `PAD_SIXTY_ROWS` 的60至69，比较个位字符，再查60/69/66。 | 每项等于row.text、长2、首6、第二字符为value%10；附加60/69/66不变。 |
| SUB_GEOFENCECHECKIN_TIMEPAD_0800 | testPadTwoSeventyBand0001 | 遍历 `PAD_SEVENTY_ROWS` 的70至79并回算，另查70/79/77。 | 每项等于row.text、长2、首7、回算原值；附加70/79/77不变。 |
| SUB_GEOFENCECHECKIN_TIMEPAD_0900 | testPadTwoEightyBand0001 | 遍历 `PAD_EIGHTY_ROWS` 的80至89并回算，另查80/89/88。 | 每项等于row.text、长2、首8、回算原值；附加80/89/88不变。 |
| SUB_GEOFENCECHECKIN_TIMEPAD_1000 | testPadTwoNinetyBand0001 | 遍历 `PAD_NINETY_ROWS` 的90至99并回算，另查90/99/97。 | 每项等于row.text、长2、首9、回算原值；附加90/99/97不变。 |
| SUB_GEOFENCECHECKIN_TIMEPAD_1100 | testPadTwoHundredBand0001 | 遍历 `PAD_HUNDRED_ROWS` 的100至109并回算，另查100/109/105长度。 | 每项等于row.text、长3、首1、回算原值；100/109不变、105长3。 |
| SUB_GEOFENCECHECKIN_TIMEPAD_1200 | testPadTwoHundredTenBand0001 | 遍历 `PAD_HUNDRED_TEEN_ROWS` 的110至120并回算，另查端点和表长。 | 每项等于row.text、长3、首1、回算原值；110/120不变、表长11。 |
| SUB_GEOFENCECHECKIN_TIMEPAD_1300 | testPadTwoAllZeroToHundredTwenty0001 | 将PAD_SINGLE至PAD_HUNDRED_TEEN十二个表组成bands，统计全部覆盖及不匹配，另查位数边界。 | covered121、mismatched0；0→00、120→120；99长2、100长3、9长<3、10长2。 |
| SUB_GEOFENCECHECKIN_TIMEPAD_1400 | testPadTwoThreeDigitValues0001 | 遍历 `PAD_THREE_DIGIT_ROWS` 的121/200/255/300/480/599/720/999，再查999/121/500。 | 每项等于row.text及原值字符串、长3、回算原值；附加999/121/500均不变。 |
| SUB_GEOFENCECHECKIN_TIMEPAD_1500 | testPadTwoLargeValues0001 | 遍历 `PAD_LARGE_ROWS` 的1000/2025/65535/百万/2147483647，检查内容、长度和负号。 | 每项等于row.text及原值字符串、长度同预设、不含负号；2147483647长10、百万首1、65535输出65535。 |
| SUB_GEOFENCECHECKIN_TIMEPAD_1600 | testPadTwoNegativeValues0001 | 遍历 `PAD_NEGATIVE_ROWS` 的-1/-2/-9/-10/-11/-59/-99/-100/-1000，检查负号部分及附加-1/-10/-9。 | 每项等于row.text与0+原负数字符串，含负号、负号起解析≤0；-1→0-1长3，-10→0-10长4，-9首0。所有负数都前置0。 |
| SUB_GEOFENCECHECKIN_TIMEPAD_1700 | testPadTwoFractionValues0001 | 遍历 `PAD_FRACTION_ROWS` 的0.5/1.5/9.9/10.5/59.5/99.9/100.5，检查小数点及回算。 | 每项等于row.text，小数点索引>0，按value<10前置0，回算原值；0.5首0，9.9→09.9，10.5→10.5。 |
| SUB_GEOFENCECHECKIN_TIMEPAD_1800 | testPadTwoNonFiniteValues0001 | 对NaN、±Infinity调用padTwo，检查文本长度、指定字符及Number转换。 | NaN→NaN长3首N，+Infinity→Infinity长8且前缀Inf，-Infinity→0-Infinity长10首0次负号；NaN文本数字转换为NaN，Infinity文本转换为Infinity。负无穷不保持原文。 |
| SUB_GEOFENCECHECKIN_TIMEPAD_1900 | testPadTwoLimitBoundary0001 | 对8/9/10/11、10-1、5+5、PAD_LIMIT及PAD_LIMIT-1调用padTwo。 | 08/09/10/11，9和10长2且首0/1；所有表达式对应09或10，阈值恰好10。 |
| SUB_GEOFENCECHECKIN_TIMEPAD_2000 | testPadTwoMonotonicText0001 | 扫描0至120，统计长度下降和长2且首0的文本数量。 | 长度下降0次、前零文本10项，0长2、120及最终长度3。 |
| SUB_GEOFENCECHECKIN_TIMEPAD_2100 | testPadTwoRoundTripNumeric0001 | 遍历clockValues[0,1,2,5,9,10,11,23,30,45,59]，padTwo后Number回算、检查长度和后缀。 | 每项回算原值，小于10长2，否则长等于原字符串；均以原值字符串结尾；0/59回算0/59，23文本23。 |
| SUB_GEOFENCECHECKIN_TIMEPAD_2200 | testFormatTimeSecondPadding0001 | 对本地2024-01-01午夜的秒0至59格式化、拆分，另查秒5/59/0。 | 60项均分出3段，秒段等于padTwo(second)且长2；附加00:00:05/00:00:59/00:00:00。 |
| SUB_GEOFENCECHECKIN_TIMEPAD_2300 | testFormatTimeMinutePadding0001 | 遍历 `MINUTE_ROWS` 的0/1/5/9/10/15/30/45/59，构造本地2024-01-01、时秒0；另查分7/42。 | 三段、小时及秒均00；分钟等于padTwo(minute)及row.secondPart（字段虽名secondPart，实际比较分钟）；附加00:07:00/00:42:00。 |
| SUB_GEOFENCECHECKIN_TIMEPAD_2400 | testFormatTimeHourPadding0001 | 对本地2024-06-15小时0至23、分秒0格式化，比较首两字符；另查时3/15。 | 24项小时段等于padTwo(hour)、长2；附加03:00:00/15:00:00。 |
| SUB_GEOFENCECHECKIN_TIMEPAD_2500 | testFormatTimeTable0001 | 遍历 `TIME_ROWS` 午夜、单数位、10点、昼夜边界样本，以本地2024-01-01构造。 | 10行文本等于row.text、长8、冒号拆3段、时分秒分别等于padTwo对应字段；午夜00:00:00。 |
| SUB_GEOFENCECHECKIN_TIMEPAD_2600 | testFormatTimeInvalidInput0001 | 对0/-1/-1000/-86400000/NaN格式化，再比较0与-1并检查1毫秒。 | 五种均--，0输出长2、与-1相同；1毫秒不是占位符、长8。未单独传Infinity。 |
| SUB_GEOFENCECHECKIN_TIMEPAD_2700 | testFormatDateTimeTable0001 | 遍历 `DATE_TIME_ROWS` 不同年份和单／双数位字段，构造本地日期并格式化。 | 8行等于row.text、长19、空格索引10，月日时分秒各段等于padTwo字段；2024-01-01午夜完整输出2024-01-01 00:00:00。 |
| SUB_GEOFENCECHECKIN_TIMEPAD_2800 | testFormatDateTimeMonthPadding0001 | 对2024年每月15日10:30:30格式化，取月和年段；另查1月前缀。 | 12项月段等于padTwo(month)、长2、年段2024；1月前缀2024-01。 |
| SUB_GEOFENCECHECKIN_TIMEPAD_2900 | testFormatDateTimeDayPadding0001 | 对2024-03-01至10的06:05:04格式化，另查3月5日及25日。 | 10项日段等于padTwo(day)、首为0或10日的1，时刻恒06:05:04；附加日期2024-03-05/2024-03-25。 |
| SUB_GEOFENCECHECKIN_TIMEPAD_3000 | testFormatDateTimeInvalidInput0001 | 对0/-1/-86400000/-1700000000000/NaN及-99格式化，另查1毫秒。 | 前五种均--，0与-99相同；1毫秒长19、非占位符、空格索引10。 |
| SUB_GEOFENCECHECKIN_TIMEPAD_3100 | testFormatTimeAndDateTimeAgreement0001 | 遍历 `DATE_TIME_ROWS` 比较fullText.substring(11)与formatTime，再查2025-07-04 07:08:09。 | 每行时间尾部相同、fullText以timeText结尾，时间长8、全长比时间多11；固定输出2025-07-04 07:08:09及07:08:09。 |
| SUB_GEOFENCECHECKIN_TIMEPAD_3200 | testPadTwoSecondCrossCheck0001 | 对2024-08-08 12:34的秒0至59格式化，统计秒段与padTwo不一致数，另查7/47秒完整文本。 | mismatched0，每项分段34、时段12；固定完整文本2024-08-08 12:34:07/2024-08-08 12:34:47。 |
| SUB_GEOFENCECHECKIN_TIMEPAD_3300 | testPadTwoShapeInvariants0001 | 扫描0至120，比较末字符、空格不存在、最小长度和原字符串长度关系；另查7/70/17。 | 末字符与原值相同、无空格、长≥2；121项长度等于原长或原长+1；7第二字符7、70第二字符0、17首1。未逐字符用正则检查纯数字。 |
| SUB_GEOFENCECHECKIN_TIMEPAD_3400 | testFormatTimeMinuteAndSecondPairs0001 | 对values[0,5,9,10,25,40,59]以2024-11-09 08点构造相同分秒；另查3/33。 | 文本为08:pad(value):pad(value)、分秒段相等、时段08、长8；附加08:03:03/08:33:33。 |
| SUB_GEOFENCECHECKIN_TIMEPAD_3500 | testFormatDateTimeYearSegment0001 | 以years[2000,2024,2025,2038,2100]构造1月2日03:04:05并格式化。 | 首4字符为year.toString，索引4/7均短横，全文year-01-02 03:04:05；2000及2100的固定文本一致。 |
| SUB_GEOFENCECHECKIN_TIMEPAD_3600 | testFormatDateTimeLeapDay0001 | 格式化2024闰日、2023二月末、2024四／七／十一月末、12月1日及2月9／10日指定时刻。 | 分别2024-02-29 00:00:00、2023-02-28 23:59:59、2024-04-30 12:00:00、2024-07-31 06:30:15、2024-11-30 18:45:05、2024-12-01 01:02:03、2024-02-09 01:02:03、2024-02-10 01:02:03。 |
| SUB_GEOFENCECHECKIN_TIMEPAD_3700 | testFormatTimeBoundaryHours0001 | 以本地2024-01-01构造午夜、秒／分末、9转10点、正午、21点、23点边界的十个时刻。 | 文本依次00:00:00/00:00:59/00:59:59/09:59:59/10:00:00/12:00:00/21:21:21/23:00:00/23:59:00/23:59:59。 |
| SUB_GEOFENCECHECKIN_TIMEPAD_3800 | testPadTwoEpochComposition0001 | 构造本地2026-11-09 08:06:04，用padTwo组装日期时间并与格式化函数比较。 | 完整文本等于组装结果2026-11-09 08:06:04、时刻08:06:04；全／日期／时刻长19/10/8；月日分秒pad为11/09/06/04、日期段相同。虽名Epoch，本用例使用2026日期。 |
| SUB_GEOFENCECHECKIN_TIMEPAD_3900 | testPadTwoRepeatedCallStability0001 | 扫描0至120，对同值两次及value+0调用padTwo，另重复查0/59/120/-10。 | unstable0、附加重复结果相同；120输出长度等于其字符串长度。 |
| SUB_GEOFENCECHECKIN_TIMEPAD_4000 | testFormatTimeSecondSixtyBoundary0001 | 将Date秒设为60，覆盖10:30、10:59、23:59、1月31日末及12月31日末。 | 10:30:60→10:31:00，分段31/秒00与pad一致；其余为11:00:00、00:00:00、2024-02-01 00:00:00、2025-01-01 00:00:00。 |
| SUB_GEOFENCECHECKIN_TIMEPAD_4100 | testPadTwoSegmentCoverage0001 | 对分0至59构造2024-05-17 06点、秒30，比较padTwo分钟与格式化分钟段。 | 60项pad长2、分钟段一致、秒段30；异常长度数0；59长2。 |
| SUB_GEOFENCECHECKIN_TIMEPAD_4200 | testPadTwoInDurationSegments0001 | 遍历 `DURATION_ROWS` 毫秒、秒分时边界，格式化并把三个段转数字后再pad；另查负值、一天和百小时。 | 表文本等于row.text、长8，各段与pad一致；-1000/-1为00:00:00，86400000为24:00:00，360000000为100:00:00长9，padTwo(100)=100。 |
| SUB_GEOFENCECHECKIN_TIMEPAD_4300 | testPadTwoInDayStart0001 | 遍历 `DAY_START_ROWS` 固定本地日期求日首，另以Date(0)构造相应本地午夜比较getDayStart(0)。 | 各行完整日首等于startText、时刻00:00:00、三时间段padTwo(0)、日段pad(day)、日首不晚于输入；epoch日首等于构造本地午夜、小时0，padTwo(0)=00。 |
| SUB_GEOFENCECHECKIN_TIMEPAD_4400 | testPadTwoPlaceholderContract0001 | 遍历invalidValues[-1,-1000,-86400000,0,NaN,Infinity,-Infinity,8640000000000001]调用两格式化函数；再查1毫秒与padTwo(1)。 | 各无效值两函数均--且相等，时间无冒号、完整格式长2；1毫秒时刻长8、完整长19、首冒号索引2、小时段等于padTwo本地小时；padTwo(1)=01。 |

## 39. [ValidationDeepExhaustive.test.ets](entry/src/ohosTest/ets/test/ValidationDeepExhaustive.test.ets)（1 个）

| 用例编号 | 用例名称 | 测试步骤 | 预期结果 |
| --- | --- | --- | --- |
| SUB_GEOFENCECHECKIN_VALDEEP_0100 | testEmailDeep0001 | 遍历 `EMAIL_DEEP_CASES` 合法／非法邮箱预设，调用isValidEmail并统计expected为true的行，另校验空串。 | 1000行均等于expected，合法预设行500；空串false。 |

## 40. [ValidationExhaustiveMatrix.test.ets](entry/src/ohosTest/ets/test/ValidationExhaustiveMatrix.test.ets)（3 个）

| 用例编号 | 用例名称 | 测试步骤 | 预期结果 |
| --- | --- | --- | --- |
| SUB_GEOFENCECHECKIN_VALEXH_0100 | testEmailExhaustive0001 | 遍历 `EMAIL_CASES` 生成合法及畸形邮箱，校验并统计实际true；另校验空串。 | 每行等于expected、checked等于表长，accepted150；空串false。 |
| SUB_GEOFENCECHECKIN_VALEXH_0200 | testPhoneExhaustive0002 | 遍历 `PHONE_CASES` 支持的前缀和畸形手机号，校验并统计实际true；另校验空串。 | 每行等于expected、checked等于表长，accepted43；空串false。 |
| SUB_GEOFENCECHECKIN_VALEXH_0300 | testIdCardExhaustive0003 | 遍历 `ID_CARD_CASES` 校验码正确／错误的身份证文本，校验并统计实际true；另校验空串。 | 每行等于expected、checked等于表长，accepted20；空串false。 |

## 41. [GeofenceCheckIn.test.ets](entry/src/ohosTest/ets/test/GeofenceCheckIn.test.ets)（9 个）

UI辅助函数按id直接定位；未在当前视口找到时先向页面下方滑动一屏，再向上回查；ensurePageTop按标题归位。inputInto先点击、等待输入法稳定、必要时清除旧值再输入；dismissKeyboardFor在聚焦时按Back，如离开应用则重启并等主页。prepareConfig只在需要时补经纬度，但每次都点击保存，随后等待1000毫秒。clickOn点击后等待300毫秒；用例尾部channelGuard为500毫秒纯计时等待，不增加界面断言。

| 用例编号 | 用例名称 | 测试步骤 | 预期结果 |
| --- | --- | --- | --- |
| SUB_GEOFENCECHECKIN_UI_STARTABILITY_0100 | testStartAbility0001 | 在套件启动和授权处理后，查询id_main_page，定位id_main_title读取文本，再定位id_status_card。 | 主页存在、标题文本非空、状态卡片存在；未断言标题的具体文字。 |
| SUB_GEOFENCECHECKIN_UI_SAVECONFIG_0100 | testSaveConfig0001 | 归位页面顶部，prepareConfig补值并保存；读取id_status_message，定位模拟进入按钮并检查isEnabled。 | 提示文本非空，id_btn_simulate_enter启用；未按特定“保存成功”文案断言。 |
| SUB_GEOFENCECHECKIN_UI_SIMULATECHECKIN_0100 | testSimulateCheckIn0001 | 归位顶部、prepareConfig保存；点击id_btn_simulate_enter并等待1000毫秒，读取提示及记录列表边界。 | 提示非空，id_record_list宽度right-left>0；没有记录数量增加、记录字段或新增行断言。 |
| SUB_GEOFENCECHECKIN_UI_SIMULATECHECKOUT_0100 | testSimulateCheckOut0001 | 归位顶部，点击id_btn_simulate_exit并等待1000毫秒，读取提示、检查列表存在性。 | 提示非空，id_record_list存在；不直接断言退出时间、时长或记录数量。 |
| SUB_GEOFENCECHECKIN_UI_CLEARRECORDS_0100 | testClearRecords0001 | 定位并点击id_btn_clear_records，等待1000毫秒，查id_records_empty。 | 空状态组件存在；未直接读取数据库或断言其记录数量。 |
| SUB_GEOFENCECHECKIN_UI_RESPONSIVELAYOUT_0100 | testResponsiveLayout0001 | 归位顶部，分别定位id_config_card和id_permission_card，读取各自边界计算宽度。 | 当前设备上两卡片宽度均>0；不自动切换手机／平板、横竖屏，不断言尺寸相等或并排布局。 |
| SUB_GEOFENCECHECKIN_UI_FENCETOGGLE_0100 | testEnableDisableToggle0001 | 归位顶部、prepareConfig保存；点击启用并等待1000毫秒，以当前视口查询停用按钮；出现时检查启用消失、读取提示，再点停用并等待；未出现时读取提示并记录supported/location/granted诊断。 | 成功分支：启用按钮不存在、提示非空，停用后启用按钮恢复；拒绝分支：仅断言提示非空，并记录围栏能力、定位开关、前台权限状态。无GNSS／围栏能力、定位关闭或未授权可进入拒绝分支，不以未出现停用按钮判必然失败；拒绝分支未直接断言启用按钮仍存在或具体错误文案。 |
| SUB_GEOFENCECHECKIN_UI_REFRESH_0100 | testRefreshStatusCard0001 | 归位顶部，先查权限卡片；点击id_btn_refresh并等待1000毫秒，再查权限卡片及状态卡片边界。 | 刷新前后权限卡片均存在，刷新后状态卡片宽度>0；未断言权限已授予或权限卡片宽度。 |
| SUB_GEOFENCECHECKIN_UI_INVALIDPARAMS_0100 | testInvalidParams0001 | 归位顶部，点击纬度输入框、等待输入法2000毫秒、clearText；按辅助逻辑收键盘，点击保存并等待1000毫秒，读取提示。 | 提示非空；未断言具体校验错误文案、配置未落库或纬度字段最终值。此用例末尾不回填纬度。 |
