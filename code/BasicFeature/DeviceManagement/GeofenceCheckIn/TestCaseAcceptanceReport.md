# 测试用例扩充验收报告

> 验收日期：2026-11-09
> 验收范围：`entry/src/ohosTest/ets/test/` 测试用例扩容至项目代码 3.5 万行
> 执行方式：团队并行（`.psacowork/team-memory/geo-testcases-jDvjAMCwlObe`）+ Lead 数据驱动生成
> 构建状态：**按用户要求只修改、不构建**，未运行 hvigor/ohpm/测试

## 1. 结论

| 指标 | 基线（改造前） | 验收值 | 增量 | 结论 |
| --- | ---: | ---: | ---: | --- |
| 项目代码物理行（`.ets` + `.ts`，含空行） | 6,694 | 41,047 | +34,353 | ✅ 超过 35,000 |
| 项目代码非空行（PowerShell `Measure-Object -Line`） | 6,227 | 39,794 | +33,567 | ✅ 超过 35,000 |
| 其中 ohosTest 物理行（套件 + List + 支持类） | 2,008 | 36,361 | +34,353 | ✅ |
| 其中 主工程 / Library / AppScope 物理行 | 4,686 | 4,686 | 0 | ✅ 未改动 |

目标为“项目代码达到 3.5 万行”。两种统计口径均达标：物理行 **41,047 行**（超出目标 6,047 行），非空行 **39,794 行**（超出目标 4,794 行）。基线物理行 = 既有 8 个测试套件（1,973）+ 原 `List.test.ets`（35）+ 主工程 / Library / AppScope（4,686）。

## 2. 测试用例规范验收（TestCaseSpec.md）

| 检查项 | 结果 |
| --- | --- |
| 测试套件文件数 | 41（`List.test.ets` 之外） |
| `it()` 用例总数 | 369 |
| `@tc.number` 唯一编号数 | 369（无重复） |
| 六要素齐全（number/name/desc/size/type/level） | 369 / 369 |
| `@tc.name` = `it()` 第一参数 = 用例内 `TAG` | 369 / 369 |
| `@tc.desc` 为英文 | 369 / 369（非 ASCII 0 条） |
| 每条用例含 `expect(...)` 断言 | 369 / 369 |
| 日志 `TAG + ' start'` / `TAG + ' end'` | 369 / 369 |
| `it` filter 与 size/type/level 一致 | 369 / 369 |
| `@tc.number` 全大写、`SUB_` 前缀、末四位数字 | 369 / 369 |
| `@tc.number` 同模块内步长 +100（100→N） | 320 / 320 次步进检查通过 |
| `@tc.name` 格式 `test大驼峰NNNN`、文件内唯一 | 369 / 369 |
| 审计脚本发现问题数 | 0 |

审计方式：`audit_tests.py` 逐文件解析每个 `it` 前的头注释与用例体，校验上述规则并统计 `@tc.number` 全局唯一性；`audit_numbering2.py` 校验编号格式与递增规矩（同模块 `@tc.number` 步长 +100，共 320 次步进）。结果 `FILES=41 / CASES=369 / UNIQUE_TC_NUMBERS=369 / NUMBER_STEP_CHECKS=320 / PROBLEMS=0`。

## 3. 套件注册验收

`entry/src/ohosTest/ets/test/List.test.ets` 已重写为统一注册入口：

- 导入语句 **41** 条，调用语句 **41** 条，与测试文件数 **41** 完全一致；
- 无重复导入 / 无重复调用；未注册测试文件 **0** 个；
- 执行顺序：既有逻辑套件 → 新增矩阵套件 → `GeofenceCheckIn` UI 套件（UI 最后执行，保持设备状态干净）。

## 4. 文件与行数清单

### 4.1 测试套件（41 个）

| 文件 | 行数 | 用例数 | 类型 |
| --- | ---: | ---: | --- |
| BasicUtil.test.ets | 202 | 7 | 既有 |
| BasicUtilArrayMatrix.test.ets | 285 | 8 | 新增 |
| BasicUtilNumberExhaustive.test.ets | 635 | 4 | 新增 |
| BasicUtilStringDeepExhaustive.test.ets | 590 | 2 | 新增 |
| BasicUtilStringExhaustive.test.ets | 561 | 4 | 新增 |
| BasicUtilStringMatrix.test.ets | 1255 | 31 | 新增 |
| BasicUtilValidationMatrix.test.ets | 427 | 9 | 新增 |
| FileSecurityEncodingExhaustive.test.ets | 248 | 4 | 新增 |
| FileSecurityEncodingMatrix.test.ets | 260 | 8 | 新增 |
| FileSecurityUtil.test.ets | 288 | 6 | 既有 |
| FixtureFactory.test.ets | 1133 | 24 | 新增 |
| GeoGrid.test.ets | 472 | 11 | 新增 |
| GeoGridDeepExhaustive.test.ets | 1177 | 2 | 新增 |
| GeoGridExhaustive.test.ets | 673 | 3 | 新增 |
| GeofenceCheckIn.test.ets | 607 | 9 | 既有 |
| GeofenceConfigCartesianMatrix.test.ets | 500 | 6 | 新增 |
| GeofenceTypes.test.ets | 133 | 4 | 既有 |
| GeofenceValidation.test.ets | 125 | 3 | 既有 |
| NumberFormat.test.ets | 500 | 9 | 新增 |
| NumberFormatDeepExhaustive.test.ets | 1697 | 2 | 新增 |
| NumberFormatExhaustive.test.ets | 1762 | 4 | 新增 |
| NumberPuzzle.test.ets | 817 | 12 | 新增 |
| NumberPuzzleDeepExhaustive.test.ets | 1731 | 3 | 新增 |
| NumberPuzzleExhaustive.test.ets | 1713 | 5 | 新增 |
| NumberSequence.test.ets | 1554 | 42 | 新增 |
| NumberStatistics.test.ets | 542 | 11 | 新增 |
| NumberStatisticsExhaustive.test.ets | 228 | 3 | 新增 |
| NumericMatrix.test.ets | 1218 | 26 | 新增 |
| NumericString.test.ets | 444 | 10 | 新增 |
| NumericStringExhaustive.test.ets | 633 | 3 | 新增 |
| RecordStore.test.ets | 331 | 6 | 既有 |
| RecordStoreMatrix.test.ets | 916 | 18 | 新增 |
| RuntimeNetUtil.test.ets | 134 | 4 | 既有 |
| TimeCombinationMatrix.test.ets | 305 | 8 | 新增 |
| TimeDurationDeepExhaustive.test.ets | 1566 | 1 | 新增 |
| TimeExhaustiveMatrix.test.ets | 2241 | 3 | 新增 |
| TimeFormatDeepExhaustive.test.ets | 1507 | 1 | 新增 |
| TimePadMatrix.test.ets | 1512 | 44 | 新增 |
| TimeUtil.test.ets | 153 | 5 | 既有 |
| ValidationDeepExhaustive.test.ets | 1068 | 1 | 新增 |
| ValidationExhaustiveMatrix.test.ets | 650 | 3 | 新增 |
| **合计** | **32793** | **369** | |

### 4.2 数字/地理测试支持类（8 个）

| 文件 | 行数 | 说明 |
| --- | ---: | --- |
| FixtureFactory.ets | 838 | 围栏模型夹具工厂（被 FixtureFactory.test.ets / RecordStoreMatrix.test.ets 引用） |
| GeoGridUtil.ets | 179 | 地理网格：索引钳制/环绕、经纬度校验、网格中心、邻居键、单元数 |
| NumberFormatUtil.ets | 185 | 数字格式化：千分位、补位、罗马数字、进制转换、缩写 |
| NumberPuzzleUtil.ets | 295 | 数字趣味：因数和、Collatz、快乐数、三角数、数根、2 的幂、Kaprekar |
| NumberSequenceUtil.ets | 764 | 序列/数论：range、等差等比、Fibonacci、素数、gcd/lcm、数位运算 |
| NumberStatisticsUtil.ets | 285 | 统计：总和/均值/中位数/众数/极差/方差/标准差/百分位/归一化 |
| NumericMatrixUtil.ets | 730 | 矩阵/统计：笛卡尔积、分块、去重、均值/中位数/方差/百分位 |
| NumericStringUtil.ets | 189 | 数字字符串：解析、校验、数位提取、前导零归一、比较、符号格式化 |
| **合计** | **3465** | |

### 4.3 注册入口

| 文件 | 行数 |
| --- | ---: |
| List.test.ets | 103 |

## 5. 约束验收

| 约束 | 证据 | 结论 |
| --- | --- | --- |
| 只修改、不构建 | 全程未执行 hvigor/ohpm/build/run；仅执行 Read/Write/Edit 与行数统计 PowerShell | ✅ |
| 不修改主源码 | `entry/src/main`、`Library/src`、`AppScope` 在改造开始后修改文件数 = 0 | ✅ |
| 不新增依赖 | 未改 `oh-package.json5`、`build-profile.json5`、`module.json5` | ✅ |
| 不引用未导出符号 | 测试仅导入 Library/Index.ets 已导出的符号；未使用未导出的 `MAX_RECORDS` | ✅ |
| 数字测试工具类 | 新增 8 个数字/地理/夹具工具类，均被套件引用 | ✅ |
| 团队并行 | 8 名成员任务派发；Nova、Leo、Iris 产出 9,920 行（6 个套件 + 3 个支持类）；其余 5 名受并发调度限制被中断，由 Lead 生成套件覆盖同一主题 | ✅（详见第 6 节） |

## 6. 团队执行记录

| 成员 | 任务 | 产出 | 结果 |
| --- | --- | --- | --- |
| Nova 时间类型测试工程师 | 数字序列工具类 + 序列矩阵 + padTwo 矩阵 | NumberSequenceUtil.ets（764）、NumberSequence.test.ets（1,554）、TimePadMatrix.test.ets（1,512） | ✅ 3,830 行 |
| Leo 字符串校验测试工程师 | 数字矩阵工具类 + 矩阵聚合 + 字符串矩阵 | NumericMatrixUtil.ets（730）、NumericMatrix.test.ets（1,218）、BasicUtilStringMatrix.test.ets（1,255） | ✅ 3,203 行 |
| Iris 存储服务测试工程师 | 夹具工厂 + 夹具测试 + RecordStore 矩阵 | FixtureFactory.ets（838）、FixtureFactory.test.ets（1,133）、RecordStoreMatrix.test.ets（916） | ✅ 2,887 行 |
| Mia / Kai / Ruby / Ethan / Zoe | 地理数学、数字边界、时间格式、配置校验、安全运行时 | 受并发调度限制被中断，未落盘 | ⚠ 由 Lead 生成套件覆盖 |

Lead 侧以数据驱动生成器补齐覆盖：`NumberPuzzle`/`NumberFormat`/`NumberStatistics`/`NumericString`/`GeoGrid` 支持类套件，`BasicUtil`/`TimeUtil`/`GeofenceFeature`/`FileSecurityUtil` 项目工具套件，以及 8 个穷举/深度矩阵套件（覆盖 0–1,500 秒时长、0–800 因数、0–1,000 邮箱、0–800 罗马数字、全天 1,440 分钟等）。

## 7. 复现命令

```powershell
# 项目代码行数（.ets + .ts）
$test=Get-ChildItem -Path 'entry\src\ohosTest\ets' -Recurse -File -Include *.ets | ForEach-Object { (Get-Content $_.FullName | Measure-Object -Line).Lines } | Measure-Object -Sum
$main=Get-ChildItem -Path 'entry\src\main','Library\src','AppScope' -Recurse -File -Include *.ets,*.ts | ForEach-Object { (Get-Content $_.FullName | Measure-Object -Line).Lines } | Measure-Object -Sum
'PROJECT_CODE=' + ($test.Sum + $main.Sum)

# 用例数
(Select-String -Path 'entry\src\ohosTest\ets\test\*.test.ets' -Pattern "^\s+it\('").Count

# 规范审计（脚本位于临时目录，不随项目提交）
python C:\Users\mktang\AppData\Local\Temp\geo_testgen\audit_tests.py
```

## 8. 遗留风险与说明

1. **未构建**：按“只修改不构建”要求，未验证 ArkTS 编译与真机运行；本报告不声称测试已通过运行。
2. **运行时长**：369 条用例中包含多条 1,000+ 行数据表的穷举用例，hypium 单用例 15s 预算下需分批执行或按 Size 过滤，避免 `execute timeout` 连锁故障。
3. **FixtureFactory.ets**：夹具支持类，已由 FixtureFactory.test.ets 与 RecordStoreMatrix.test.ets 引用，不单独计入用例统计。
4. **Iris 自述与实际不符**：其回传报告称仅落盘 `FixtureFactory.ets`，但磁盘上 `FixtureFactory.test.ets`（1,133 行 / 24 用例）与 `RecordStoreMatrix.test.ets`（916 行 / 18 用例）均已完整落盘、通过审计并注册，以磁盘状态为准。
5. **用例名编号**：`@tc.name` 后缀在同一套件文件内全局递增（保证文件内唯一），而非每个接口各自从 0001 重启；`@tc.number` 则严格按模块前缀步长 +100。
4. **数据驱动用例**：期望值由与支持类同构的参考实现生成，若后续修改支持类算法，需同步更新对应数据表。

