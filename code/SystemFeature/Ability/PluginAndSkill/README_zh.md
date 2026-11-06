# 插件与技能管理

## 简介

本示例演示如何使用 [@ohos.bundle.pluginBundleManager](https://gitee.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-ability-kit/js-apis-pluginBundleManager.md) 和 [@ohos.bundle.skillManager](https://gitee.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-ability-kit/js-apis-skillManager.md) 来管理本地插件和应用技能。

**功能特性：**

1. 使用 `pluginBundleManager` 安装和卸载本地插件（HSP 文件）。
2. 使用 `skillManager` 查询当前应用或其余应用注册的技能信息。
3. 使用 `scriptManager` 执行应用技能脚本。
4. 对比两个技能的详细信息差异。
5. 查看技能执行历史记录，支持筛选和统计。
6. 批量选择并执行多个技能。

## 效果预览

| 插件管理页面 | 技能管理页面 |
|:---:|:---:|
| 选择 HSP 文件并安装/卸载插件 | 按包名、模块名和技能名查询技能 |

## 使用说明

1. 在首页点击 **Plugins** 进入插件管理页面。
2. 在插件管理页面：
   - 点击 **Select HSP** 通过 DocumentViewPicker 选择本地 HSP 文件。
   - 点击 **Install plugin** 安装选中的 HSP 文件为本地插件。
   - 点击 **Uninstall plugin** 卸载已安装的插件。
3. 返回首页，点击 **Skills** 进入技能管理页面。
4. 在技能管理页面：
   - 点击 **Query own skill** 进入自有技能查询页面，通过下拉菜单选择模块名和技能名，从 **查询标志位** 下拉菜单中选择 Flag 组合，点击 **Query own skill** 查询指定技能，或点击 **Query all own skills** 查询当前应用注册的全部技能。
   - 点击 **Query application skill** 进入应用技能查询页面，通过下拉菜单选择包名、模块名和技能名，从 **查询标志位** 下拉菜单中选择 Flag 组合，点击 **Query application skill** 查询指定技能，或点击 **Query application skills** 查询指定应用注册的全部技能。
   - 点击 **Query all device skills** 进入设备全部技能查询页面，从 **查询标志位** 下拉菜单中选择 Flag 组合，点击 **Query all device skills** 查询设备上可用的全部技能。
   - 点击 **Skill execution** 进入技能执行页面，选择模块和技能后点击 **Execute** 执行技能脚本，查看结果和执行历史。
   - 点击 **Skill compare** 进入技能对比页面，分别选择两个技能（模块 + 技能名），点击 **Compare** 查看字段级差异。
   - 点击 **Skill history** 进入执行历史页面，点击 **Query all** 查看历史记录，支持筛选和统计。
   - 点击 **Skill batch** 进入批量操作页面，通过开关或全选方式选择技能后点击 **Execute** 批量执行。

## 工程目录

```
entry/src/main/ets/
|---entryability/
|   |---EntryAbility.ets              // 入口 Ability
|---entrybackupability/
|   |---EntryBackupAbility.ets        // 备份 Ability
|---pages/
|   |---Index.ets                     // 首页导航
|---pluginandskill/pages/
|   |---PluginManagerHome.ets         // 插件管理页面
|   |---SkillManagerHome.ets          // 技能管理首页
|   |---SelfSkillQueryPage.ets        // 自有技能查询页面
|   |---BundleSkillQueryPage.ets      // 应用技能查询页面
|   |---AllSkillsQueryPage.ets        // 设备全部技能查询页面
|   |---SkillExecutionPage.ets        // 技能执行页面
|   |---SkillComparePage.ets          // 技能对比页面
|   |---SkillHistoryPage.ets          // 技能执行历史页面
|   |---SkillBatchPage.ets            // 批量技能操作页面
|---util/
|   |---Constant.ets                  // UI 常量
|   |---Logger.ets                    // 日志工具
|   |---AssertionHelper.ets           // 断言辅助工具
|   |---PerformanceTracker.ets        // 性能跟踪
|   |---TestDataGenerator.ets         // 测试数据生成
|   |---TestDataProvider.ets          // 测试数据提供
|   |---TestEnvironmentChecker.ets    // 环境检查
|   |---TestLogAnalyzer.ets           // 日志分析
|   |---TestMetricsCollector.ets      // 指标收集
|   |---TestReportGenerator.ets       // 报告生成
entry/skills/
|---skill-test/scripts/
|   |---TestSkill.ets                 // 测试技能脚本
|---skill-echo/scripts/
|   |---EchoSkill.ets                 // 回显技能脚本
|---skill-calculator/scripts/
|   |---CalculatorSkill.ets           // 计算技能脚本
|---skill-validation/scripts/
|   |---ValidationSkill.ets           // 校验技能脚本
entry/src/ohosTest/ets/test/
|---List.test.ets                        // 测试套件注册入口（含 SUITE_MANIFEST）
|---Ability.test.ets                     // 应用启动与页面元素测试（2 条用例）
|---SelfSkillQuery.test.ets              // 自有技能查询测试（15 条用例）
|---BundleSkillQuery.test.ets            // 应用技能查询测试（17 条用例）
|---AllSkillsQuery.test.ets              // 设备全部技能查询测试（8 条用例）
|---IndexAndNavigation.test.ets          // Index 页面与导航流程测试（10 条用例）
|---ResultFieldValidation.test.ets       // 查询结果字段级验证（20 条用例）
|---NavigationFlow.test.ets              // 多步导航路径与边界场景（10 条用例）
|---StateConsistency.test.ets            // 选择器与跨页面状态一致性（10 条用例）
|---ErrorHandling.test.ets               // 错误处理与恢复验证（10 条用例）
|---SkillExecution.test.ets              // 技能执行页面验证（10 条用例）
|---SkillCompareAndHistory.test.ets      // 技能对比与历史验证（10 条用例）
|---PluginCompareAndBatch.test.ets       // 批量技能操作验证（5 条用例）
|---AdvancedFeatureTest.test.ets         // 高级功能场景验证（10 条用例）
|---AssertionHelper.test.ets             // 断言工具类测试（68 条用例）
|---PerformanceTracker.test.ets          // 性能跟踪器测试（38 条用例）
|---TestDataProvider.test.ets            // 测试数据提供器测试（32 条用例）
|---TestMetricsCollector.test.ets        // 指标收集器测试（25 条用例）
|---TestDataGenerator.test.ets           // 测试数据生成器测试（25 条用例）
|---TestEnvironmentChecker.test.ets      // 环境检查器测试（25 条用例）
|---TestLogAnalyzer.test.ets             // 日志分析器测试（25 条用例）
|---TestReportGenerator.test.ets         // 报告生成器测试（25 条用例）
|---ConstantValidation.test.ets          // 常量配置验证测试（20 条用例）
|---SkillManagerHomeExtended.test.ets    // 技能管理页扩展测试（8 条用例）
|---SkillBatchExtended.test.ets          // 批量操作扩展测试（12 条用例）
|---SkillHistoryExtended.test.ets        // 历史记录扩展测试（12 条用例）
|---SkillCompareExtended.test.ets        // 技能对比扩展测试（10 条用例）
```

> **说明：** 完整的测试用例文档请参阅 [ohosTest.md](ohosTest.md)。

## 具体实现

- **插件管理**：使用 `pluginBundleManager` 相关接口：
  - `installLocalPlugin()`：从沙箱路径安装本地插件。
  - `uninstallLocalPlugin()`：按插件 ID 卸载本地插件。
  - `getAllLocalPluginInfoForSelf()`：查询当前应用已安装的全部本地插件。

- **技能管理**：使用 `skillManager` 相关接口：
  - `getSkillInfoForSelf()`：查询当前应用注册的指定技能。
  - `getSkillInfosForSelf()`：查询当前应用注册的全部技能。
  - `getSkillInfo()`：查询指定应用注册的指定技能。
  - `getSkillInfos()`：查询指定应用注册的全部技能。
  - `getAllSkillInfos()`：查询设备上可用的全部技能。

- **技能执行**：应用技能定义在 `entry/skills/` 目录下，通过 [module.json5](entry/src/main/module.json5) 的 `skillProfiles` 注册，使用 `scriptManager.completeArkTSScriptInApp()` 执行。执行页面支持模块/技能选择、结果展示和执行历史追踪。

- **技能对比**：对比页面支持选择两个技能（分别选择模块和技能名），对比其 `SkillInfo` 字段，展示总字段数、匹配数、差异数和匹配率。

- **技能历史**：历史页面查询并展示过去的技能执行记录，支持筛选（成功/失败）、统计和清除功能。

- **批量操作**：批量页面支持通过单独开关或全选方式选择多个技能，然后批量执行并展示结果，支持清除功能。

- **文件选择**：插件页面使用 `DocumentViewPicker` 选择 HSP 文件，复制到 `context.cacheDir` 后将沙箱路径传递给 `installLocalPlugin()`。

## 测试

本工程包含 Instrument 测试套件（ohosTest），共 **497 条用例**，通过 `SUITE_MANIFEST` 结构化管理 **26 个测试套件**：

| 套件名称 | 测试文件 | 用例数 | 描述 |
|---|---|---:|---|
| PluginAndSkillAbilityTest | Ability.test.ets | 2 | 应用启动与首页元素完整性验证 |
| SelfSkillQueryTest | SelfSkillQuery.test.ets | 15 | 自有技能查询：参数校验、成功、异常、Flag 验证 |
| BundleSkillQueryTest | BundleSkillQuery.test.ets | 17 | 应用技能查询：参数校验、成功、异常、Flag 验证 |
| AllSkillsQueryTest | AllSkillsQuery.test.ets | 8 | 设备全部技能查询：基础查询、Flag 验证 |
| IndexAndNavigationTest | IndexAndNavigation.test.ets | 10 | Index 页面 UI、SkillManagerHome 导航、页面往返流程 |
| ResultFieldValidationTest | ResultFieldValidation.test.ets | 20 | 三个查询页面结果卡片字段级验证 |
| NavigationFlowTest | NavigationFlow.test.ets | 10 | 多步导航路径、按钮状态、边界场景 |
| StateConsistencyTest | StateConsistency.test.ets | 10 | 选择器状态、结果卡片状态、跨页面状态隔离 |
| ErrorHandlingTest | ErrorHandling.test.ets | 10 | 错误信息验证、空参数验证、错误恢复 |
| SkillExecutionTest | SkillExecution.test.ets | 10 | 技能执行页面：UI 验证、执行操作、选择器验证 |
| SkillCompareAndHistoryTest | SkillCompareAndHistory.test.ets | 10 | 技能对比与历史：对比操作、历史记录、筛选统计 |
| SkillBatchTest | PluginCompareAndBatch.test.ets | 5 | 批量技能操作：UI 验证、技能切换、执行操作 |
| AdvancedFeatureTest | AdvancedFeatureTest.test.ets | 10 | 高级功能场景：对比组合、历史详情、批量选择、执行记录 |
| AssertionHelperTest | AssertionHelper.test.ets | 68 | 断言工具类：断言方法、结果收集、统计报告、单例模式 |
| PerformanceTrackerTest | PerformanceTracker.test.ets | 38 | 性能跟踪器：计时器、指标记录、分类过滤、统计汇总 |
| TestDataProviderTest | TestDataProvider.test.ets | 32 | 测试数据提供器：单例模式、参数工厂、用例生成、分类统计 |
| TestMetricsCollectorTest | TestMetricsCollector.test.ets | 25 | 指标收集器：单例模式、记录/累加/淘汰、分类汇总 |
| TestDataGeneratorTest | TestDataGenerator.test.ets | 25 | 测试数据生成器：组合生成、边界用例、计数器 |
| TestEnvironmentCheckerTest | TestEnvironmentChecker.test.ets | 25 | 环境检查器：单例模式、常量校验、完整性检查 |
| TestLogAnalyzerTest | TestLogAnalyzer.test.ets | 25 | 日志分析器：级别过滤、标签搜索、用例识别、通过率 |
| TestReportGeneratorTest | TestReportGenerator.test.ets | 25 | 报告生成器：条目管理、质量评分、套件分组 |
| ConstantValidationTest | ConstantValidation.test.ets | 20 | 常量配置验证：数组长度、默认值、索引范围、Flag 值 |
| SkillManagerHomeExtendedTest | SkillManagerHomeExtended.test.ets | 8 | 技能管理页扩展：按钮完整性、导航往返、导航深度 |
| SkillBatchExtendedTest | SkillBatchExtended.test.ets | 12 | 批量操作扩展：单选执行、Summary 卡片、Record 字段 |
| SkillHistoryExtendedTest | SkillHistoryExtended.test.ets | 12 | 历史记录扩展：统计准确性、记录字段、筛选交互 |
| SkillCompareExtendedTest | SkillCompareExtended.test.ets | 10 | 技能对比扩展：相同/不同对比、不存在技能、选择器状态 |

完整用例表、构建说明和执行指南请参阅 [ohosTest.md](ohosTest.md)。

## 相关权限

| 权限 | 说明 |
|---|---|
| `ohos.permission.kernel.SUPPORT_LOCAL_PLUGIN` | 安装和管理本地插件所需权限。 |
| `ohos.permission.MANAGE_SKILL_PRIVILEGE` | 管理技能特权所需权限。 |
| `ohos.permission.READ_WRITE_USER_FILE` | 读取用户选择的 HSP 文件所需权限。 |

**说明：** 这些权限为系统级权限或需要特定签名配置。

## 约束与限制

1. 本示例仅支持标准系统设备。
2. 本示例基于 Stage 模型，需要 API 26.0.0 SDK。
3. 本示例需要 DevEco Studio 6.0.0 或更高版本才能编译运行。
4. 安装本地插件需要设备在系统设置中开启"允许从外部来源安装插件"开关。
5. 本示例使用开源 SDK 版本 26.0.0。

## 下载

如需单独下载本工程，执行如下命令：

```shell
git init
git config core.sparseCheckout true
echo code/SystemFeature/Ability/PluginAndSkill/ > .git/info/sparse-checkout
git remote add origin https://gitee.com/openharmony/applications_app_samples.git
git pull origin master
```
