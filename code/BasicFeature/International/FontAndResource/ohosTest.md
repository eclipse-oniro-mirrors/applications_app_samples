# FontAndResource ohosTest 测试说明

## 1. 测试范围与规模

设备侧测试位于 `entry/src/ohosTest/ets/test`，采用 `@ohos/hypium` 框架。该目录包含 68 个 `.test.ets` 文件，其中 [List.test.ets](entry/src/ohosTest/ets/test/List.test.ets) 为注册入口，不包含独立 `it(...)` 用例；其余 67 个文件均已在入口中导入并调用，组成 67 个测试套件。

共声明 563 条 `it(...)` 用例，其中 UI 自动化 10 条，数据模型与工具类测试 553 条。矩阵和扫描类用例在单个 `it(...)` 内遍历多组数据，数据行数不计为独立用例数。

| 测试范围 | 测试文件数 | 覆盖内容 |
| --- | --- | --- |
| 字体与资源界面 | 1 | 启动、导航、字体文件准备与预览、资源转换、TaskPool/Worker、日志清空 |
| 数据模型 | 3 | 字体、资源和日志模型的默认值、字段、实例独立性与日志追加 |
| 错误码说明 | 1 | 严重级别映射、编号回显、未知错误码 |
| 日志与性能打点 | 2 | Logger 级别与文件开关调用、TraceUtil 同步和异步包装 |
| 日期时间 | 8 | 日期格式化、时间戳、日期运算、时长与矩阵数据 |
| 屏幕与单位换算 | 2 | 屏幕属性、显示对象、px/vp/fp 换算 |
| 编码与摘要 | 8 | Base64、URL 编解码、MD5/SHA1/SHA256、空值与非法输入 |
| 数值处理 | 20 | 舍入、范围限定、解析、格式化、随机整数、角度与单位换算 |
| 字符串处理 | 8 | 空值与空白判断、大小写、填充、截断、计数、重复与连接 |
| 格式校验与解析 | 8 | 手机号、邮箱、IPv4、颜色、证件格式、字符类别与长度边界 |
| 系统工具 | 6 | 剪贴板、设备信息、网络、权限、Preferences、随机数据 |
| 合计 | 67 | 1 个 UI 自动化套件、66 个数据模型与工具类套件 |

本说明仅覆盖 `entry/src/ohosTest` 中已注册的设备侧测试，不包含 `Library/src/test` 本地单元测试，也不将未写入测试代码的功能视为已覆盖。

## 2. 测试前置条件与执行步骤

1. 使用工程要求的 API 26 Full SDK 和 DevEco Studio 6.0.0 Release 或以上版本，完成依赖同步。
2. 连接支持本示例的标准系统真机，确认应用与 `entry_test` 测试模块使用一致的签名证书。应用声明 `ohos.permission.UPDATE_FONT`，签名配置需包含该受限权限对应的 ACL；缺少 ACL 时可能在安装阶段报错 9568289。
3. 固定纪元格式用例按 UTC+8 编写，设备需使用相同时区。执行期间保持系统时钟、网络和显示配置稳定，避免外部状态变化影响时间及重复查询断言。
4. 执行 UI 自动化前保持设备解锁、应用可见，确保随包字体和媒体资源完整，避免人工操作干扰页面定位和开关状态。
5. 在 DevEco Studio 中运行 `entry` 模块的 `ohosTest` 测试目标，使用 [List.test.ets](entry/src/ohosTest/ets/test/List.test.ets) 执行全部套件；定位问题时可单独运行清单中的测试文件。
6. 根据 Hypium 执行报告核对用例名称、通过数和失败数，结合 hilog 定位失败断言。剪贴板用例会清理或覆盖设备文本；Preferences 用例会清空 `font_resource_test_store` 和 `font_resource_test_store_alt`，随后写入测试数据。剪贴板和 Preferences 用例没有统一的结束清理或原状态恢复，执行前请确认其中没有需保留的数据。

本文件记录测试范围、步骤和预期结果，不表示本次已执行测试。实际通过状态以当次测试报告为准，历史执行记录见 [TestReport.md](TestReport.md)。

## 3. 用例清单

清单按测试文件汇总，每个文件对应一个编号、一个测试名称、一组测试步骤和预期结果。编号 `OHOS-FILE-xxx` 是本说明的汇总项编号，不替代代码中的 `@tc.number` 或 `it(...)` 用例名称；用例数按各文件实际声明的 `it(...)` 统计，同一个用例内部遍历的数据行不另计为独立用例。

| 用例编号 | 测试文件 | 用例名称 | 用例数 | 测试步骤 | 预期结果 |
| --- | --- | --- | ---: | --- | --- |
| OHOS-FILE-001 | [ClipboardUtil.test.ets](entry/src/ohosTest/ets/test/ClipboardUtil.test.ets) | 剪贴板读写、覆盖与清理 | 13 | 写入 ASCII、中文、空串、单字符及长文本后读取；重复往返、连续覆盖和清理，并检查异步返回类型。 | 写入返回布尔值，读取返回字符串；写入成功时内容与输入一致，往返匹配数等于成功数；清理后仅检查字符串类型和非负长度。 |
| OHOS-FILE-002 | [DateArithmeticMatrix.test.ets](entry/src/ohosTest/ets/test/DateArithmeticMatrix.test.ets) | 日期运算矩阵 | 4 | 对月末、闰日和年底的日期执行正负天数偏移，比较星期、同日状态及不同时间单位的间隔。 | 偏移日期、星期和同日结果符合表值；秒、分、小时、一天的间隔分别为 1000、60000、3600000、86400000 毫秒。 |
| OHOS-FILE-003 | [DateArithmeticSweep.test.ets](entry/src/ohosTest/ets/test/DateArithmeticSweep.test.ets) | 日期运算多输入扫描 | 4 | 从固定日期执行多组正负偏移，扫描星期、分钟间隔及不同时间的同日比较。 | 偏移和间隔等于固定预期；星期一为 0、星期日为 6；同日判断不受时分秒影响。 |
| OHOS-FILE-004 | [DateDataMatrix.test.ets](entry/src/ohosTest/ets/test/DateDataMatrix.test.ets) | 日期大数据矩阵与定时器让出 | 5 | 检查套件初始化中的零延迟定时器标记；遍历日期、时间、组合格式及日期偏移四张表，各 500 行。 | 定时器标记为真；四张表长度均为 500，日期时间文本和偏移结果逐项等于表中预期。 |
| OHOS-FILE-005 | [DateDurationMatrix.test.ets](entry/src/ohosTest/ets/test/DateDurationMatrix.test.ets) | 毫秒时长分段格式 | 4 | 格式化不足一秒、秒、分钟、小时及超过一天的毫秒数。 | 不足一秒输出 `0s`，分钟和小时采用固定组合格式；一天和两天分别输出 `24h 0m 0s`、`48h 0m 0s`。 |
| OHOS-FILE-006 | [DateFormatSweep.test.ets](entry/src/ohosTest/ets/test/DateFormatSweep.test.ets) | 日期时间格式与纪元扫描 | 4 | 遍历 2000—2004 年的 60 组日期，比较日期、时间及组合格式；转换七个固定纪元毫秒值。 | 各格式等于固定字符串；纪元结果匹配 UTC+8 预期，例如 0 对应 `1970-01-01 08:00:00`。 |
| OHOS-FILE-007 | [DateFormattedMatrix.test.ets](entry/src/ohosTest/ets/test/DateFormattedMatrix.test.ets) | 日期补零与时间戳重建 | 4 | 检查十组日期的日期、时间及组合格式，并用 `new Date(source.getTime())` 重建日期后再次格式化。 | 各字段补零且与固定文本一致；时间戳重建后的日历日期不变。 |
| OHOS-FILE-008 | [DateUtils.test.ets](entry/src/ohosTest/ets/test/DateUtils.test.ets) | 日期工具基础契约 | 9 | 检查时间单位、日期时间格式、纪元转换、时长、正反时间差、同日、跨月偏移及星期。 | 单位常量和格式匹配预期，时间差按较晚时间减去较早时间计算；偏移不修改原日期，星期索引符合约定。 |
| OHOS-FILE-009 | [DateUtilsAdvanced.test.ets](entry/src/ohosTest/ets/test/DateUtilsAdvanced.test.ets) | 日期边界与扩展契约 | 22 | 遍历月份、小时、毫秒及星期矩阵，检查当前时间、纪元重建、时长、午夜、闰日、跨年和偏移往返。 | 格式、补零和边界值符合断言；当前时间满足范围与非递减要求；偏移保持时间字段和原对象，往返恢复原时间戳。 |
| OHOS-FILE-010 | [DeviceUtils.test.ets](entry/src/ohosTest/ets/test/DeviceUtils.test.ets) | 设备信息、API 门槛与摘要 | 27 | 对照平台设备字段，检查 API 门槛、设备类型、重复读取、可打印字符及摘要拼接。 | 字段类型、非空、平台映射和稳定性符合断言；API 为 1—100 的整数，门槛结果等于大小比较；摘要按市场名称、设备类型、系统名称和 API 拼接，长度小于 1024。 |
| OHOS-FILE-011 | [DigestDataMatrix.test.ets](entry/src/ohosTest/ets/test/DigestDataMatrix.test.ets) | 中文载荷摘要大数据矩阵 | 3 | 分别遍历 MD5、SHA1、SHA256 的 200 行中文混合载荷表，等待摘要完成后比对。 | 三张表各 200 行；摘要逐项等于固定值，长度分别为 32、40、64。 |
| OHOS-FILE-012 | [DisplayConversionMatrix.test.ets](entry/src/ohosTest/ets/test/DisplayConversionMatrix.test.ets) | 显示属性与单位转换矩阵 | 7 | 读取显示参数，执行 vp/fp 转换与往返，重复读取旋转和横屏状态。 | 显示参数大于 0、转换值非负、往返误差小于 0.01；本文件要求旋转值在 0—3，横屏结果等于宽度严格大于高度。 |
| OHOS-FILE-013 | [DisplayUtils.test.ets](entry/src/ohosTest/ets/test/DisplayUtils.test.ets) | 显示工具基础契约 | 4 | 读取屏幕宽高、密度、刷新率和旋转，按密度校验 vp/fp 乘积及往返换算。 | 宽高大于 0、密度至少为 1、换算误差小于 0.001；刷新率为 0 或 1—360；旋转为 0/90/180/270，横屏结果等于宽度大于等于高度。 |
| OHOS-FILE-014 | [EncodingBase64Matrix.test.ets](entry/src/ohosTest/ets/test/EncodingBase64Matrix.test.ets) | Base64 编解码与非法输入 | 4 | 编解码八组空串、ASCII、中文和数字文本，检查往返；解码五组非法输入。 | 正常输入匹配固定编码并恢复原文；`!`、`not base64!`、`%%%%`、`a`、`====` 解码返回空串。 |
| OHOS-FILE-015 | [EncodingDataMatrix.test.ets](entry/src/ohosTest/ets/test/EncodingDataMatrix.test.ets) | 编码大数据矩阵 | 4 | 遍历 Base64 编码、解码及 URL 编码、解码四张表，各 500 行，覆盖中文和路径查询参数。 | 四张表长度均为 500，各项结果等于对应固定预期。 |
| OHOS-FILE-016 | [EncodingDigestMatrix.test.ets](entry/src/ohosTest/ets/test/EncodingDigestMatrix.test.ets) | 标准摘要向量与长度 | 4 | 对三种摘要分别检查七组空串、ASCII、中文及长文本向量，再比较代表输入的摘要长度。 | 摘要等于固定向量；MD5、SHA1、SHA256 长度分别为 32、40、64。 |
| OHOS-FILE-017 | [EncodingMatrix.test.ets](entry/src/ohosTest/ets/test/EncodingMatrix.test.ets) | 编码填充与摘要交叉矩阵 | 15 | 遍历 Base64 长度、填充和非法输入，URL 保留字符、安全字符、多字节和往返表；比较摘要形状、向量和编码前后结果。 | 编码值、长度和填充符合预期；非法 Base64 返回空串，指定畸形 URL 原样返回；摘要为规定长度的小写十六进制，固定值与重复结果一致。 |
| OHOS-FILE-018 | [EncodingSweep.test.ets](entry/src/ohosTest/ets/test/EncodingSweep.test.ets) | 多语言编码与摘要扫描 | 8 | 编解码中文、日文、换行和制表符等文本，检查非法 Base64、URL 输入及三种摘要向量。 | 编解码和摘要等于固定值；非法 Base64 返回空串；URL 转义指定保留字符，`a'b(c)*~!` 保持不变。 |
| OHOS-FILE-019 | [EncodingUrlMatrix.test.ets](entry/src/ohosTest/ets/test/EncodingUrlMatrix.test.ets) | URL 编解码与异常矩阵 | 4 | 对十组空串、ASCII、保留字符和中文执行编解码及往返；解码四组异常转义输入。 | 正常输入匹配百分号转义表并恢复原文；`%`、`%E4`、`%ZZ`、`a%2` 原样返回。 |
| OHOS-FILE-020 | [EncryptUtils.test.ets](entry/src/ohosTest/ets/test/EncryptUtils.test.ets) | 编码与摘要综合契约 | 18 | 检查 ASCII、中文、表情的 Base64/URL 编解码、非法输入、摘要向量、稳定性及编码交叉比较。 | 固定编码和摘要值匹配，往返恢复原文；非法 Base64 返回空串，指定畸形 URL 原样返回；摘要为对应长度的小写十六进制，重复结果一致。 |
| OHOS-FILE-021 | [ErrorCodeMap.test.ets](entry/src/ohosTest/ets/test/ErrorCodeMap.test.ets) | 错误码严重级别与回显 | 4 | 查询权限、参数、字体状态、服务异常及未知错误码，检查严重级别和编号回显。 | 201/202/31100110 为 `error`，401/31100101/31100106 为 `warning`，31100104/31100111 为 `info`；未知码为 `error`，被检查的编号原样回显。 |
| OHOS-FILE-022 | [FontResource.test.ets](entry/src/ohosTest/ets/test/FontResource.test.ets) | 字体与资源 UI 集成 | 10 | 启动应用并切换字体/资源页，准备字体、切换预览、转换资源与媒体、执行 TaskPool/Worker，再清理字体页日志。 | 页面存在、标题和字体状态非空、字体路径以 `.ttf` 结尾；开关符合开/关/开断言；颜色详情非空、媒体宽度大于 0；路径显示 `TaskPool`/`Worker`，Worker 包名非空；清理后空态出现、列表消失、面板标题保留。 |
| OHOS-FILE-023 | [FontTypes.test.ets](entry/src/ohosTest/ets/test/FontTypes.test.ets) | 字体模型构造与字段隔离 | 22 | 构造默认和准备状态字体、操作记录、能力检查及错误解释，遍历路径、错误码、级别和时间戳表，并修改实例检查隔离。 | 默认字体为 Droid Serif、指定 rawfile、空沙箱路径且未准备；字段保持输入、实例互不影响；路径、时间戳和关联符合断言，不涉及真实字体安装或权限申请。 |
| OHOS-FILE-024 | [LogTypes.test.ets](entry/src/ohosTest/ets/test/LogTypes.test.ets) | 日志模型与列表追加 | 7 | 检查当前时钟文本，向空或非空日志列表追加记录，使用多种容量检查截断、排序及源列表。 | 时钟为合法的八字符文本；新记录置首，旧记录保序并按容量截断；返回新数组且不修改原列表，构造字段与输入一致。 |
| OHOS-FILE-025 | [Logger.test.ets](entry/src/ohosTest/ets/test/Logger.test.ets) | 日志级别与调用契约 | 13 | 获取上下文、初始化日志，遍历级别名称、非法级别、阈值和文件开关，调用五级日志及特殊消息。 | 级别值为 0—4，名称为 DEBUG 至 FATAL，非法级别名称回退 FATAL；上下文有效，调用完成并满足计数断言；不验证实际日志内容、过滤数量或文件落盘。 |
| OHOS-FILE-026 | [ModelTypes.test.ets](entry/src/ohosTest/ets/test/ModelTypes.test.ets) | 字体与资源模型基础契约 | 5 | 构造默认字体、字体操作、资源条目、往返结果和失败摘要，逐项检查默认值及传入字段。 | 默认字体未准备；资源条目状态为 `idle`、详情为空；操作字段保持输入，往返结果保留摘要引用；失败摘要标记失败、保留错误消息并重置测量字段。 |
| OHOS-FILE-027 | [NetworkUtils.test.ets](entry/src/ohosTest/ets/test/NetworkUtils.test.ets) | 网络状态、返回类型与一致性 | 16 | 读取联网、网络类型、Wi-Fi 和蜂窝状态，执行重复、并发和顺序探测，检查耗时、离线回退和摘要。 | 布尔和数值返回类型符合断言，网络类型在 -1—20；离线时 Wi-Fi/蜂窝为假，两者不同时为真；被检查的探测耗时小于 5000 毫秒，摘要字段有序且不含 `undefined`；不要求设备必须联网。 |
| OHOS-FILE-028 | [NumberUtils.test.ets](entry/src/ohosTest/ets/test/NumberUtils.test.ets) | 数值工具基础契约 | 11 | 检查有限数、范围限定、舍入、文件大小、毫秒时长、千分位、解析、角度、百分比和随机整数。 | 各固定输入匹配预期，NaN/无穷数判定正确；角度往返误差小于 1e-9，随机值为闭区间整数并满足边界采样断言。 |
| OHOS-FILE-029 | [NumberUtilsAdvanced.test.ets](entry/src/ohosTest/ets/test/NumberUtilsAdvanced.test.ets) | 数值边界与组合契约 | 22 | 遍历有限数、退化及反向范围、不同位数舍入、单位边界、正负千分位、解析、角度、百分比和随机采样矩阵。 | 结果逐项匹配固定表值；无效解析使用指定回退，单位和小数位符合断言；角度转换、采样范围及组合格式保持预期关系。 |
| OHOS-FILE-030 | [NumericAngleMatrix.test.ets](entry/src/ohosTest/ets/test/NumericAngleMatrix.test.ets) | 角度与弧度转换矩阵 | 3 | 对代表角度和弧度执行双向转换，并检查角度往返。 | 转换值及往返误差满足源码精度断言。 |
| OHOS-FILE-031 | [NumericBoundaryMatrix.test.ets](entry/src/ohosTest/ets/test/NumericBoundaryMatrix.test.ets) | 单位后缀与角度边界 | 3 | 输入 1024 的各级单位边界和百分比边界，检查后缀；对代表角度执行往返换算。 | 文件大小文本含 `B`、百分比文本含 `%`；角度往返误差小于 1e-9，本文件不逐项断言完整大小和百分比文本。 |
| OHOS-FILE-032 | [NumericClampData.test.ets](entry/src/ohosTest/ets/test/NumericClampData.test.ets) | 范围限定大数据矩阵 | 6 | 遍历六张各 800 行的范围内、下界外、上界外、变化范围、单点范围及小数范围表。 | 每张表规模与断言一致，限定结果逐项等于固定预期。 |
| OHOS-FILE-033 | [NumericClampMatrix.test.ets](entry/src/ohosTest/ets/test/NumericClampMatrix.test.ets) | 范围限定输入矩阵 | 10 | 检查范围内外、端点、负数、单点、小数、大数、跨界扫描和对称输入。 | 范围内及端点保持原值，越界值限定到边界，单点范围返回同一点；固定矩阵和对称关系符合断言。 |
| OHOS-FILE-034 | [NumericClampSweep.test.ets](entry/src/ohosTest/ets/test/NumericClampSweep.test.ets) | 范围限定密集扫描 | 10 | 密集扫描范围内外、负数、小数、大数、单点、端点与对称范围。 | 扫描结果匹配固定预期，端点包含在范围内，越界值返回对应边界，对称结果符合断言。 |
| OHOS-FILE-035 | [NumericDurationMatrix.test.ets](entry/src/ohosTest/ets/test/NumericDurationMatrix.test.ets) | 毫秒时长格式矩阵 | 6 | 遍历不同量级的毫秒数并检查完整格式及后缀。 | 时长文本匹配固定值，保留一位小数并以 `ms` 结尾。 |
| OHOS-FILE-036 | [NumericFileSizeMatrix.test.ets](entry/src/ohosTest/ets/test/NumericFileSizeMatrix.test.ets) | 文件大小单位矩阵 | 7 | 输入字节、KB、MB、GB 代表值、负数及精确的 1024 单位边界。 | 字节和各级单位文本匹配固定值，KB/MB/GB 使用两位小数；负数返回 `-`，边界按预期切换单位。 |
| OHOS-FILE-037 | [NumericFormatData.test.ets](entry/src/ohosTest/ets/test/NumericFormatData.test.ets) | 数值格式大数据矩阵 | 6 | 遍历六张各 500 行的字节与 KB/MB、毫秒时长、正负千分位和百分比表。 | 各表长度符合断言，格式文本逐项等于固定预期。 |
| OHOS-FILE-038 | [NumericFormatSweep.test.ets](entry/src/ohosTest/ets/test/NumericFormatSweep.test.ets) | 数值格式多输入扫描 | 8 | 扫描字节至 GB、负文件大小、毫秒时长、正负千分位及百分比输入。 | 单位、小数位、千分位和百分比文本匹配固定值；负文件大小返回 `-`。 |
| OHOS-FILE-039 | [NumericMathSweep.test.ets](entry/src/ohosTest/ets/test/NumericMathSweep.test.ets) | 角度与百分比扫描 | 3 | 扫描角度/弧度转换，并按 0—4 位小数格式化比值。 | 转换满足精度断言，百分比按比值乘 100、指定小数位和 `%` 后缀输出。 |
| OHOS-FILE-040 | [NumericParseMatrix.test.ets](entry/src/ohosTest/ets/test/NumericParseMatrix.test.ets) | 数值解析与回退矩阵 | 9 | 检查十进制整数、前缀文本、异常输入、小数和指数文本的整数/浮点解析。 | 各输入返回固定预期；不能按该解析路径处理的输入返回指定回退值。 |
| OHOS-FILE-041 | [NumericParseSweep.test.ets](entry/src/ohosTest/ets/test/NumericParseSweep.test.ets) | 数值解析多输入扫描 | 8 | 扫描有符号整数、数字前缀、进制样式、指数、小数及无效文本。 | 整数前缀按表值解析，整数路径中 `7e2` 返回 -1、`0x10` 返回 0；浮点路径支持表中指数输入，无效文本使用回退。 |
| OHOS-FILE-042 | [NumericPercentMatrix.test.ets](entry/src/ohosTest/ets/test/NumericPercentMatrix.test.ets) | 百分比格式矩阵 | 6 | 遍历不同正负比值和小数位数，比较百分比文本。 | 比值乘 100，符号、小数位和 `%` 后缀符合固定预期。 |
| OHOS-FILE-043 | [NumericRandomMatrix.test.ets](entry/src/ohosTest/ets/test/NumericRandomMatrix.test.ets) | 随机整数范围与有限数 | 8 | 从单点、正数及跨零区间重复采样，检查有限数、NaN 和无穷数。 | 样本满足各闭区间和整数断言；单点区间恒为该值；有限数判真，NaN 和无穷数判假。 |
| OHOS-FILE-044 | [NumericRoundData.test.ets](entry/src/ohosTest/ets/test/NumericRoundData.test.ets) | 舍入大数据矩阵 | 6 | 遍历六张各 800 行的 0—3 位小数、负数和大数舍入表。 | 各表长度符合断言，舍入结果逐项等于固定预期。 |
| OHOS-FILE-045 | [NumericRoundMatrix.test.ets](entry/src/ohosTest/ets/test/NumericRoundMatrix.test.ets) | 舍入输入矩阵 | 8 | 按 0—4 位小数舍入代表值，检查负数、整数和大数。 | 各结果匹配固定预期，整数保持不变，指定负数舍入值正确。 |
| OHOS-FILE-046 | [NumericRoundSweep.test.ets](entry/src/ohosTest/ets/test/NumericRoundSweep.test.ets) | 舍入多输入扫描 | 8 | 扫描 0—4 位小数舍入、负数、精确整数及大数输入。 | 扫描结果逐项匹配固定预期，精确整数不变。 |
| OHOS-FILE-047 | [NumericThousandMatrix.test.ets](entry/src/ohosTest/ets/test/NumericThousandMatrix.test.ets) | 千分位格式矩阵 | 6 | 格式化零、短整数、长整数和负数，检查逗号数量。 | 整数每三位分组，短值不加逗号，负号保留；完整文本和逗号数量符合断言。 |
| OHOS-FILE-048 | [ParserMatrix.test.ets](entry/src/ohosTest/ets/test/ParserMatrix.test.ets) | 格式解析交叉矩阵 | 14 | 检查 IPv4、颜色、18 位证件格式、数字、字母、长度、邮箱和手机号，并执行跨类别、边界及首尾空白扫描。 | 布尔结果匹配固定表值；IPv4 拒绝越界和前导零，颜色接受指定宽度，证件仅检查源码定义的格式；长度边界包含端点，指定带首尾空白的格式输入被拒绝。 |
| OHOS-FILE-049 | [PermissionUtils.test.ets](entry/src/ohosTest/ets/test/PermissionUtils.test.ets) | 权限状态与稳定性 | 16 | 查询五项权限及未知名称，重复比较授权状态、声明差异、计数和摘要。 | UPDATE_FONT 为已授权，其余四项表中未声明权限及未知权限为未授权；授权数为 1，重复结果稳定，返回布尔值且查询不抛异常；不测试权限申请对话框。 |
| OHOS-FILE-050 | [PreferencesUtil.test.ets](entry/src/ohosTest/ets/test/PreferencesUtil.test.ets) | 键值存储往返、覆盖与隔离 | 19 | 获取上下文并清空两个测试存储；写读字符串、数字和布尔值，检查缺失键、覆盖、删除、清空、存储隔离和重复往返。 | 各类型及中文/空字符串读回一致，缺失键使用指定回退；覆盖保留最新值，删除和清空改变键存在状态；不同键和存储互不影响，清空后可再次写入。 |
| OHOS-FILE-051 | [RandomUtils.test.ets](entry/src/ohosTest/ets/test/RandomUtils.test.ets) | 随机数与生成数据形状 | 4 | 采样整数、浮点数、概率和数组选择，生成随机文本、带前缀 ID、颜色及安全字节，检查空池和零长度边界。 | 整数在指定闭区间，浮点在半开区间；概率 0/1 分别恒假/真，空池返回回退；文本字母表、ID 前缀与长度、六位颜色格式及字节长度符合断言，不检验统计均匀性或 ID 唯一率。 |
| OHOS-FILE-052 | [StringUtils.test.ets](entry/src/ohosTest/ets/test/StringUtils.test.ets) | 字符串工具基础契约 | 12 | 检查空值/空白、默认值、反转、首字母、命名转换、截断、填充、匹配计数、重复和跳过空项连接。 | 固定文本匹配预期，空值与空白区分正确；匹配不重叠，空搜索返回 0，非正重复次数返回空串，连接保持非空项顺序。 |
| OHOS-FILE-053 | [StringUtilsAdvanced.test.ets](entry/src/ohosTest/ets/test/StringUtilsAdvanced.test.ets) | 字符串边界与组合矩阵 | 17 | 遍历 null、undefined、空串和空白，检查中文反转、命名往返、截断/填充/重复长度以及组合输入。 | 文本和长度符合固定矩阵；空项与空白项按各函数契约处理，双重反转及命名往返满足源码断言。 |
| OHOS-FILE-054 | [TextCountMatrix.test.ets](entry/src/ohosTest/ets/test/TextCountMatrix.test.ets) | 文本计数与空值边界 | 4 | 比较子串计数、跳过空项连接、默认值及空白/空串判断。 | 匹配不重叠，空搜索返回 0；连接结果匹配预期，默认值仅替换空串，空白与空串的判断不同。 |
| OHOS-FILE-055 | [TextDataMatrix.test.ets](entry/src/ohosTest/ets/test/TextDataMatrix.test.ets) | 文本大数据矩阵 | 6 | 遍历六张各 600 行的 ASCII 反转、首字母大写、截断、前后填充和驼峰转换表。 | 各表长度符合断言，文本结果逐项等于固定预期。 |
| OHOS-FILE-056 | [TextNormalizeMatrix.test.ets](entry/src/ohosTest/ets/test/TextNormalizeMatrix.test.ets) | 空串与空白判断矩阵 | 3 | 输入空串、空格、制表符、换行、可见文本及带空白文本，检查空串、空白和默认值判断。 | `isEmpty` 仅将表中的空串判真，`isBlank` 接受纯空白；默认值不替换空白文本。 |
| OHOS-FILE-057 | [TextPaddingMatrix.test.ets](entry/src/ohosTest/ets/test/TextPaddingMatrix.test.ets) | 文本填充与重复矩阵 | 3 | 对短文本、等长文本和空串执行前后填充，检查正数、零及负数重复次数。 | 填充结果与固定值一致，等长文本保持原值；`repeat("ab", 3)` 为 `ababab`，零和负次数返回空串。 |
| OHOS-FILE-058 | [TextTransformMatrix.test.ets](entry/src/ohosTest/ets/test/TextTransformMatrix.test.ets) | 文本转换与截断矩阵 | 5 | 反转文本、转换首字母与 kebab/camel 命名，并比较短、长和边界文本截断。 | 各转换匹配固定文本；仅实际截断时追加后缀。 |
| OHOS-FILE-059 | [TextTransformSweep.test.ets](entry/src/ohosTest/ets/test/TextTransformSweep.test.ets) | 文本转换多输入扫描 | 4 | 扫描 ASCII 和基本多文种平面文本的反转、首字母大写及 kebab/camel 转换。 | 反转、首字母及分隔符处理逐项等于固定预期；不将该范围扩展为代理对或字素簇验证。 |
| OHOS-FILE-060 | [TextValidationSweep.test.ets](entry/src/ohosTest/ets/test/TextValidationSweep.test.ets) | 常见格式校验扫描 | 8 | 遍历合法与非法手机号、邮箱、IPv4 和十六进制颜色输入。 | 各布尔判定与固定预期一致，指定越界、错误宽度和畸形格式被拒绝。 |
| OHOS-FILE-061 | [TraceUtil.test.ets](entry/src/ohosTest/ets/test/TraceUtil.test.ets) | 性能打点返回值与异常契约 | 14 | 成对调用开始/结束，检查同步/异步包装返回值、嵌套、连续任务 ID、计数标记、空/长名称和抛错后的后续调用。 | 任务 ID 满足 0 至小于 999 的整数断言，包装返回值保持不变；同步抛错和异步拒绝传播到调用者，后续调用正常，标记调用完成；不验证性能分析工具展示的时间线内容。 |
| OHOS-FILE-062 | [ValidateUtils.test.ets](entry/src/ohosTest/ets/test/ValidateUtils.test.ets) | 格式校验基础契约 | 9 | 检查手机号、邮箱、IPv4、颜色、数字、ASCII 字母、18 位证件格式及长度边界。 | 合法和非法表值判定符合预期；IPv4 拒绝大于 255 和前导零，颜色接受 3/6/8 位，证件末位允许数字或大写 X；长度上下界包含端点。 |
| OHOS-FILE-063 | [ValidateUtilsAdvanced.test.ets](entry/src/ohosTest/ets/test/ValidateUtilsAdvanced.test.ets) | 格式校验边界与交叉矩阵 | 11 | 扫描手机号前缀、IPv4 八位组边界、颜色宽度、数字/字母、证件格式、共享输入和正常/零宽/反向长度范围。 | 各格式与长度判定逐项符合固定矩阵，指定非法前缀、前导零、错误字符和错误宽度被拒绝。 |
| OHOS-FILE-064 | [ValidationCharacterMatrix.test.ets](entry/src/ohosTest/ets/test/ValidationCharacterMatrix.test.ets) | 字符类别与长度矩阵 | 4 | 输入纯数字、ASCII 字母、混合文本、证件格式及端点长度。 | 数字和字母校验拒绝空串及混合字符；证件格式和末位字符符合断言，长度范围包含上下界。 |
| OHOS-FILE-065 | [ValidationDataMatrix.test.ets](entry/src/ohosTest/ets/test/ValidationDataMatrix.test.ets) | 格式校验大数据矩阵 | 6 | 遍历六张各 600 行的手机号、邮箱、IPv4、颜色、数字和证件格式表，混合合法与非法输入。 | 各表长度符合断言，布尔结果逐项等于固定预期。 |
| OHOS-FILE-066 | [ValidationMobileMatrix.test.ets](entry/src/ohosTest/ets/test/ValidationMobileMatrix.test.ets) | 手机号前缀与长度矩阵 | 3 | 遍历支持前缀、错误前缀、过短/过长输入及合法非法混合表。 | 支持的 11 位大陆手机号格式判真，指定前缀、长度或字符异常判假。 |
| OHOS-FILE-067 | [ValidationNetworkMatrix.test.ets](entry/src/ohosTest/ets/test/ValidationNetworkMatrix.test.ets) | 邮箱、IPv4 与颜色矩阵 | 3 | 遍历常见与畸形邮箱、IPv4 形状和八位组范围、颜色字符和宽度。 | 布尔结果匹配固定预期；IPv4 形状和范围均需符合表中规则，颜色仅接受带 `#` 的 3/6/8 位十六进制格式。 |
