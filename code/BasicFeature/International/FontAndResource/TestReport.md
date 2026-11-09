# 字体与资源管理测试报告

## 测试环境

| 项目 | 信息 |
| --- | --- |
| 设备型号 | 待填写 |
| 系统版本 | 待填写 |
| SDK 版本 | 26.0.0.38 |
| 应用包名 | com.samples.fontandresource |
| 测试类型 | ohosTest UI 自动化，本地单元测试 |

> 前置条件：entry 模块声明了 system_basic 权限 ohos.permission.UPDATE_FONT，安装测试包前需确认签名配置中包含对应 ACL，否则安装会报 9568289。

## UI 自动化用例

用例文件：[entry/src/ohosTest/ets/test/FontResource.test.ets](entry/src/ohosTest/ets/test/FontResource.test.ets)

| 序号 | 用例名称 | 测试场景 | 操作步骤 | 预期结果 | 测试结果 |
| --- | --- | --- | --- | --- | --- |
| 1 | FontAndResource_StartAbility_001 | 应用启动 | 启动应用并等待首页加载 | 主页面存在，标题文本非空 | 待执行 |
| 2 | FontAndResource_TabSwitch_001 | 页面切换 | 依次切换到资源管理页和字体管理页 | 两个页面均可正常展示 | 待执行 |
| 3 | FontAndResource_PrepareFont_001 | 字体文件准备 | 点击准备字体文件按钮并等待完成 | 状态显示已就绪，沙箱路径以 .ttf 结尾 | 待执行 |
| 4 | FontAndResource_PreviewToggle_001 | 字体预览 | 准备字体文件后打开自定义字体预览开关 | 开关处于选中状态 | 待执行 |
| 5 | FontAndResource_ConvertAll_001 | 批量资源转换 | 进入资源管理页点击批量转换 | 颜色资源出现转换详情 | 待执行 |
| 6 | FontAndResource_ConvertMedia_001 | 媒体资源转换 | 进入资源管理页点击转换图片 | 页面渲染出转换后的图片 | 待执行 |
| 7 | FontAndResource_TaskPool_001 | TaskPool 往返转换 | 点击 TaskPool 按钮并等待结果 | 往返路径显示 TaskPool | 待执行 |
| 8 | FontAndResource_Worker_001 | Worker 往返转换 | 点击 Worker 按钮并等待结果 | 往返路径显示 Worker | 待执行 |

## 本地单元测试

用例文件：[Library/src/test/LogTypes.test.ets](Library/src/test/LogTypes.test.ets)

| 序号 | 用例名称 | 测试场景 | 预期结果 | 测试结果 |
| --- | --- | --- | --- | --- |
| 1 | appendLog_NewestFirst_001 | 日志插入顺序 | 新日志位于列表首位 | 待执行 |
| 2 | appendLog_TrimToLimit_001 | 日志数量上限 | 列表长度不超过上限，保留最新记录 | 待执行 |
| 3 | nowTimeText_Format_001 | 时间文本格式 | 时间文本长度为 8 | 待执行 |

## 测试结论

历史 UI 用例与本地单元用例保持原状，扩充用例的静态验收见下一节。

## 2026-11-09 用例扩充验收

### 一、代码规模

统计口径：项目内 `.ets` / `.ts` 源码，排除 `build`、`.test`、`node_modules`、`oh_modules`、`.hvigor`、`.codegraph`。

| 指标 | 扩充前 | 扩充后 |
| --- | --- | --- |
| 项目有效代码行数 | 10,087 | **59,765** |
| ohosTest 测试文件数 | 11 | **68**（67 个套件 + `List.test.ets`） |
| ohosTest 代码行数 | 4,019 | **53,840** |
| `it()` 用例数 | 74 | **561** |

净增代码 49,678 行，其中新增测试套件 57 个；已超过 35,000 行目标 24,765 行。

### 二、新增套件范围

- **数值矩阵**：`NumericClampData`、`NumericRoundData`、`NumericFormatData`、`NumericClampMatrix`、`NumericRoundMatrix`、`NumericFileSizeMatrix`、`NumericDurationMatrix`、`NumericThousandMatrix`、`NumericParseMatrix`、`NumericAngleMatrix`、`NumericPercentMatrix`、`NumericRandomMatrix`、`NumericBoundaryMatrix`、`NumericClampSweep`、`NumericRoundSweep`、`NumericFormatSweep`、`NumericParseSweep`、`NumericMathSweep`。
- **日期/文本/校验矩阵**：`DateDataMatrix`、`DateFormatSweep`、`DateArithmeticSweep`、`DateArithmeticMatrix`、`DateFormattedMatrix`、`DateDurationMatrix`、`TextDataMatrix`、`TextNormalizeMatrix`、`TextTransformMatrix`、`TextPaddingMatrix`、`TextCountMatrix`、`TextTransformSweep`、`TextValidationSweep`、`ValidationDataMatrix`、`ValidationMobileMatrix`、`ValidationNetworkMatrix`、`ValidationCharacterMatrix`。
- **编码/摘要矩阵**：`EncodingDataMatrix`、`EncodingBase64Matrix`、`EncodingUrlMatrix`、`EncodingDigestMatrix`、`EncodingSweep`、`DigestDataMatrix`。
- **工具与设备**：`EncryptUtils`、`DeviceUtils`、`NetworkUtils`、`PermissionUtils`、`ClipboardUtil`、`PreferencesUtil`、`TraceUtil`、`Logger`。
- **既有套件扩充**：`NumberUtils`、`DateUtils`、`StringUtilsAdvanced`、`ValidateUtilsAdvanced`、`DisplayConversionMatrix` 等。

### 三、规范符合性（静态审计）

对 67 个套件执行脚本化审计，结果 **PROBLEM_FILES=0**：

- 六要素头注释齐全：`@tc.number`、`@tc.name`、`@tc.desc`（英文）、`@tc.size`、`@tc.type`、`@tc.level`。
- `@tc.number` 每文件从 `0100` 起按 `0100` 递增，全局 **561 个编号唯一**。
- `@tc.name`、`it()` 第一参数、用例内 `TAG` 三一致，全局 **561 个名称唯一**。
- `it` filter 与 `@tc.size` / `@tc.type` / `@tc.level` 逐条一致。
- 每条用例至少一处 `expect(...)` 断言；数据表用例在循环内逐行断言。
- 每条用例均以 `TAG + ' start'` / `TAG + ' end'` 日志包裹。
- 67 个套件全部注册进 `entry/src/ohosTest/ets/test/List.test.ets`（67 个 import + 67 个调用）。
- 新增文件不使用模板字符串、不声明 `any`、无类型强转。

### 四、执行说明

按任务要求**只修改、不构建**：未执行 `hvigor` 构建，未执行 `hdc` 安装与设备运行。以上结论均来自源码静态统计与脚本审计；真机执行结果需在具备签名与设备的环境下另行验证。

