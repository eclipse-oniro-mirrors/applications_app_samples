# ScanNapiInterfaceDemo 测试用例说明

## 简介

本文档提供扫描接口示例的自动化测试说明。用例位于 `entry/src/ohosTest/ets/test`，由 `List.test.ets` 统一注册，
共 46 个套件 / 2666 条用例，覆盖错误码映射、参数约束、状态机、参数 UI 模型、进度聚合、设备同步、
图片命名、单位换算、内存数据源、参数构造器、设备过滤、页面格式表、取值解析、会话记录与页面主流程。

## 环境要求

- DevEco Studio 与 OpenHarmony SDK：apiVersion 26
- 依赖：`@ohos/hypium` 1.0.18（见工程根目录 `oh-package.json5`）
- 设备：支持 `default` 或 `tablet` 类型的真机 / 模拟器

## 构建与运行

```bash
# 构建测试包
devecocli build --modules entry@ohosTest --auto-sign

# 安装测试包
hdc install entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap

# 执行全量用例：在 DevEco Studio 中选择 entry@ohosTest 运行配置执行，
# 测试参数清单：包名 -b com.example.scannapiinterfacedemo、模块名 -m entry_test、
# 运行器 -s unittest OpenHarmonyTestRunner、超时 -s timeout 60000
```

按套件筛选时追加 `-s class <套件名>`，按用例筛选时追加 `-s it <用例名>`。

## 用例表

| 测试功能 | 预置条件 | 输入 | 预期输出 | 是否自动 | 测试类型 |
|---|---|---|---|---|---|
| 扫描基础能力冒烟 | 测试包已安装 | 日志域/标签、状态机初值与标签键 | 域与标签固定、初始态为空闲、空闲态不可开始扫描 | 是 | 功能测试 |
| 扫描接口错误码映射 | 测试包已安装 | 错误码数值与错误对象 | 错误分类、可重试标记与提示文案与规则一致 | 是 | 功能测试 |
| 扫描参数约束判定 | 测试包已安装 | 约束类型 + 选项值 | 区间、数值列表、字符串列表的合法性判定正确 | 是 | 功能测试 |
| 扫描状态机迁移 | 测试包已安装 | 当前状态 + 事件 | 合法迁移返回目标状态，非法迁移保持原状态 | 是 | 功能测试 |
| 参数 UI 模型渲染数据 | 测试包已安装 | 参数对象（单位、约束、当前值） | 展示文案、单位后缀与选项摘要符合规则 | 是 | 功能测试 |
| 扫描进度聚合 | 测试包已安装 | 页面进度序列（0~120、负数） | 总页数、完成页数、百分比与结束标记正确 | 是 | 功能测试 |
| 扫描仪目录同步 | 测试包已安装 | 设备列表 + 同步事件（更新/删除） | 增删改结果、按模式计数与去重结果正确 | 是 | 功能测试 |
| 图片命名生成 | 测试包已安装 | 序号、格式、时间戳 | 名称形如 `scan_序号_年月日.格式`，非法输入回退默认值 | 是 | 功能测试 |
| 物理单位换算 | 测试包已安装 | 数值 + 物理单位 | 两位小数格式化、像素与毫米换算、非法 dpi 归零 | 是 | 功能测试 |
| 内存扫描仪数据源 | 测试包已安装 | 预置设备 + 增删改替换操作 | 容量上限 16、重复编号被拒、列表副本隔离 | 是 | 功能测试 |
| 扫描参数构造器 | 测试包已安装 | 类型映射、参数描述、设备构造、值补丁 | 约束类型映射、形状/结构描述与列表补丁符合规则 | 是 | 功能测试 |
| 扫描设备过滤 | 测试包已安装 | 设备列表 + 厂商/型号/模式/前缀 | 过滤、去重、排序、交集与摘要结果正确 | 是 | 功能测试 |
| 页面格式表 | 测试包已安装 | 页面/格式标识 | 像素尺寸、MIME、多页/灰度支持与描述一致 | 是 | 功能测试 |
| 选项取值解析 | 测试包已安装 | 数值/文本/布尔取值 | 类型转换、钳位、数值判定与比较符合规则 | 是 | 功能测试 |
| 扫描会话记录 | 测试包已安装 | 事件序列 + 追加/查询操作 | 容量上限 100、最早事件淘汰、副本隔离 | 是 | 功能测试 |
| 参数 UI × 约束组合 | 测试包已安装 | 参数类型 × 约束/单位组合 | 单位后缀、舍入、裁剪与列表映射正确 | 是 | 功能测试 |
| 状态机事件矩阵 | 测试包已安装 | 状态 × 事件序列 | 迁移、忙碌/终态判定与应用计数正确 | 是 | 功能测试 |
| 页面主流程 | 应用可正常启动 | 页面控件标识与点击操作 | 标题与 7 个按钮可定位，弹窗开合正常，布局不塌 | 是 | UI 测试 |

## 套件明细

| 套件（`-s class`） | 文件 | 用例数 |
|---|---|---|
| ScanFoundationTest | `Ability.test.ets` | 3 |
| ScanSmoke | `Scan.test.ets` | 3 |
| ScanErrorMapVolume01 / 02 / 03 / 04 / 05 | `ScanErrorMapVolume01~05.test.ets` | 450 |
| ScanErrorMapReal01 / ScanErrorMapAggregate | `ScanErrorMapReal01/02.test.ets` | 50 |
| ScanConstraintKind / ScanConstraintNumber / ScanConstraintText | `ScanConstraintVolume01~03.test.ets` | 270 |
| ScanConstraintReal | `ScanConstraintReal01.test.ets` | 40 |
| ScanStateTransition | `ScanStateVolume01.test.ets` | 90 |
| ScanStateReal | `ScanStateReal01.test.ets` | 30 |
| ScanOptionItem | `ScanOptionVolume01.test.ets` | 90 |
| ScanOptionModel | `ScanOptionReal01.test.ets` | 24 |
| ScanProgressSummary | `ScanProgressVolume01.test.ets` | 90 |
| ScanProgressAggregator | `ScanProgressReal01.test.ets` | 24 |
| ScanDirectoryMerge | `ScanDirectoryVolume01.test.ets` | 78 |
| ScannerDirectory | `ScanDirectoryReal01.test.ets` | 24 |
| ScanImageName | `ScanImageNamingVolume01.test.ets` | 90 |
| ScanImageNaming | `ScanImageNamingReal01.test.ets` | 24 |
| ScanUnitFormat | `ScanUnitFormatVolume01.test.ets` | 90 |
| ScanUnitFormatter | `ScanUnitFormatReal01.test.ets` | 24 |
| ScanMockSource | `ScanMockSourceVolume01.test.ets`、`ScanMockSourceReal01.test.ets`（同名套件） | 114 |
| ScanParamMap / ScanParamShape / ScanParamStruct | `ScanParamMap/Shape/StructVolume01.test.ets` | 270 |
| ScanParamBuilderReal | `ScanParamBuilderReal01.test.ets` | 12 |
| ScanFilterVolume | `ScanFilterVolume01.test.ets` | 90 |
| ScanFilterReal | `ScanFilterReal01.test.ets` | 6 |
| ScanFormatTable | `ScanFormatVolume01.test.ets` | 90 |
| ScanFormatReal | `ScanFormatReal01.test.ets` | 6 |
| ScanOptionParser | `ScanParserVolume01.test.ets` | 90 |
| ScanParserReal | `ScanParserReal01.test.ets` | 6 |
| ScanSessionRecord | `ScanSessionVolume01.test.ets` | 90 |
| ScanSessionReal | `ScanSessionReal01.test.ets` | 6 |
| ScanOptionMatrix | `ScanOptionMatrixVolume01.test.ets` | 90 |
| ScanOptionMatrixReal | `ScanOptionMatrixReal01.test.ets` | 6 |
| ScanStateMatrix | `ScanStateMatrixVolume01.test.ets` | 90 |
| ScanStateMatrixReal | `ScanStateMatrixReal01.test.ets` | 6 |
| ScanParamTopup | `ScanParamTopupVolume01.test.ets` | 90 |
| ScanOptionTopup | `ScanOptionTopupVolume01.test.ets` | 90 |
| ScanUiFlow | `ScanUiReal01.test.ets` | 20 |

合计：46 个测试套件，2666 条用例。

## 真机验证结果

- 设备：`d629034339413535311095d600002b00`（OpenHarmony 3.2 / 7.1.0.21，armeabi-v7a，4 GB 内存）
- 时间：2026-11-19
- 结论：全部 46 套件 2666 条用例真机通过（Failure 0 / Error 0 / Ignore 0）。
  前 28 套件 1628 条用例首轮即全过；新增 18 套件 1038 条用例首轮 1024 条通过、
  14 条失败（分布在 6 个套件），定位为 main 2 处语义缺陷与 4 处期望推导错误，
  修复后复跑 6 个失败套件全部通过，另抽查 `ScanOptionTopup`、`ScanFilter`、
  `ScanConstraintReal`、`ScanConstraintKind` 共 310 条确认无回归。

执行时需注意三点：

1. **分批执行**。该设备单进程可用的 ArkTS 主堆约 19 MB，一次跑完 1628 条会把主堆推到 90% 以上，
   触发 `THREAD_BLOCK_6S` 后进程被杀并报告 `App died`。按套件分批（每批一个独立进程）可稳定通过：

   ```bash
   # 测试参数同上（-b 包名 / -m 模块名 / -s unittest 运行器 / -s timeout 超时），
   # 追加 -s class <套件名> 仅执行该套件
   ```

2. **UI 套件需独占设备**。`ScanUiFlow` 通过 UiTest 查询控件，`Driver.create()` 需要独占 AAMS 连接；
   若设备上仍有其余项目的测试进程，会抛 `Can not connect to AAMS, RET_ERR_CONNECTION_EXIST`，
   导致 20 条用例全报错。执行前先通过 hdc 的 force-stop 能力停掉其余被测应用进程。
3. **判定看结果行**。`TestFinished-ResultCode: 0` 只表示进程正常结束，通过与否以 `OHOS_REPORT_RESULT` 行的 `Failure` / `Error` 计数为准。

## 说明

- 用例只访问 `entry/src/main/ets/scan/model` 下的可测纯逻辑模块与页面控件标识，不依赖真实扫描仪硬件。
- 页面主流程用例会在 `beforeAll` 中拉起 `EntryAbility`，执行前需保证应用可正常安装启动。
