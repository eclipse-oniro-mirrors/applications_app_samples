# 数字矩阵测试用例扩充验收报告

> 验收日期：2026-11-09
> 目标：按 `C:\Users\mktang\Desktop\KY\TestCaseSpec.md` 规范新增 hypium 测试用例，使项目代码达到 3.5 万行（只修改、不构建）

## 1. 结论

**验收通过。** 项目代码总量从基线 15874 行增长至 **37007 行**（纯项目口径，含 .ets/.ts/.json5/.json，排除 oh_modules/build/.hvigor/.preview/.psacowork/.codegraph/.idea 工具目录），超过 35000 行目标；新增 13 个测试文件、977 条用例、3493 条断言，全部通过规范量化抽查。

## 2. 行数统计

| 口径 | 基线 | 最终 | 变化 |
| --- | --- | --- | --- |
| 纯项目代码（推荐口径） | 15356 | **37007** | +21651 |
| 含 .psacowork/.codegraph 工具文件 | 15874 | 37669 | +21795 |

统计命令：`Get-ChildItem -Recurse -Include *.ets,*.ts,*.json5,*.json | Measure-Object -Line`（按口径过滤目录）。

## 3. 新增测试文件清单（entry/src/ohosTest/ets/test/）

| 文件 | 行数 | 用例数 | 覆盖接口 |
| --- | --- | --- | --- |
| NumericMatrixStrPad.test.ets | 1626 | 69 | StringUtils：truncate/padStart/repeat/capitalize |
| NumericMatrixStrMatch.test.ets | 1615 | 69 | StringUtils：isEmpty/isBlank/trimToNull/startsWithIgnoreCase/endWithIgnoreCase/countMatches |
| NumericMatrixStrEdge.test.ets | 1334 | 69 | StringUtils 数字边界矩阵（0/负数/极大值/恰好边界/超界） |
| NumericMatrixValidateIpPort.test.ets | 1847 | 96 | ValidateUtils：isValidIPv4/IPv6/Port/isPositiveNumber |
| NumericMatrixValidateText.test.ets | 2119 | 110 | ValidateUtils：isValidUrl/Domain/Email/encodeUriComponent/decodeUri |
| NumericMatrixCollection.test.ets | 1537 | 69 | CollectionUtils：isEmpty/unique/chunk/flatten/containsAll/groupBy 等 |
| NumericMatrixObject.test.ets | 1539 | 69 | ObjectUtils：deepEqual/safeJsonParse/safeJsonStringify/getType/deepCopy 等 |
| NumericMatrixCrypto.test.ets | 1602 | 72 | CryptoUtils：md5/sha256 已知向量/bytesToHex/base64 编解码 |
| NumericMatrixDate.test.ets | 1607 | 72 | DateUtils：toUtc 时间戳矩阵/format/addDays/addMonths/diffDays/isSameDay |
| NumericMatrixNetHttp.test.ets | 1571 | 75 | HttpUtils：isSuccessStatus 状态码矩阵/httpGet/httpPost 离线路径；NetworkUtils 形状契约 |
| NumericMatrixFileDevice.test.ets | 1643 | 68 | FileUtils：读写往返/文件大小边界/listDir；DeviceUtils 只读契约 |
| NumericMatrixAsyncLogger.test.ets | 1932 | 66 | AsyncUtils：delay/debounce/throttle/withRetry；Logger 全接口 |
| NumericMatrixFormatMisc.test.ets | 1562 | 73 | formatBytes 字节数矩阵/joinNumbers/elapsedMilliseconds |
| **合计** | **21534** | **977** | 3493 条 expect 断言 |

## 4. 规范符合性（TestCaseSpec.md 逐条量化验证）

对 13 个文件执行 PowerShell 正则量化抽查，**ALL_PASS=True**：

- **头注释六要素**：每条 it 均有 @tc.number/@tc.name/@tc.desc(英文)/@tc.size/@tc.type/@tc.level，计数与用例数一一相等（如 ValidateText 110=110）
- **编号规则**：@tc.number 采用 `SUB_NETWORKSECURITY_NUMERIC_模块代号_NN00` 全大写格式，0100 起每条 +100 递增，各文件内无重复
- **三一致**：`const TAG: string = '<用例名>'` 数 = it() 第一参数 = @tc.name，逐文件相等（如 StrPad 69=69=69）
- **日志包裹**：`hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start')` / `TAG + ' end'` 成对，计数均等于用例数；DOMAIN 统一 0xF811
- **断言密度**：每条用例 ≥3 条 expect（全量 3493 条，均值 3.57/条），断言间有英文注释说明数字组合意义
- **it 名称唯一**：977 条用例名跨 13 文件全局唯一（977=977）
- **ArkTS 红线**：反引号模板字符串 0 处、无 any/unknown、无解构/展开、无 as 断言、变量显式类型注解
- **期望值来源**：各文件断言期望值均对照 Library 工具类源码逐条推导（如 repeat 的 10000 上限钳制、padStart 多字符 pad 超长语义、IPv4 前导零 parseInt 语义、base64 非法输入 catch 返回 '' 等）

## 5. 套件注册

`List.test.ets` 已注册全部 13 个新套件（import + testsuite 调用），顺序保持：6 个既有纯逻辑套件 → 13 个 NumericMatrix 纯逻辑套件 → NetworkSecurity UI 套件（最后）。

## 6. 执行过程

- 团队：`networksecurity-numeric-matrix`（lead + 6 名编写成员 + 1 名注册协作者）
- 分工：Alice(字符串)/Bob(校验)/Carol(集合对象)/Dave(加密日期)/Eve(网络文件)/Frank(异步日志格式)，每成员 2 文件；lead 另写 StrEdge 边界矩阵补充文件
- 约束遵守：全程未运行任何构建命令（hvigor/hvigorw 零调用）；未改动 main 源码；仅新增测试文件与更新 List.test.ets
- 过程修正：会话恢复导致首轮派发丢失后重派并改用"骨架 Write + 锚点 Edit 分段追加"策略；中断了重复认领任务的 Bob-2 防止同文件并发冲突；验收阶段修复了 Collection/Object 两文件的日志格式（hilog.debug→hilog.info 规范模式）并补齐 NetHttp 6 条用例的断言至 ≥3 条

## 7. 遗留说明

- 本轮只修改不构建；建议后续在 Full SDK + system_basic 签名环境下执行一次 `hvigorw assembleHap` 与 设备端自动化测试（Ability Assistant 测试子命令） 验证编译与用例可运行性
- FileDevice 与 NetHttp 中的文件读写/网络形状契约用例依赖设备沙箱路径与本地网络状态查询，离线环境可运行；真实网络探测类用例按降级提示判定
