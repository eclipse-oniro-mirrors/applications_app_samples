# PluginAndSkill 测试用例归档

## 测试工程结构

```
entry/src/ohosTest/
|---ets/
|   |---test/
|   |   |---List.test.ets                        // 测试套件注册入口（含 SUITE_MANIFEST）
|   |   |---Ability.test.ets                     // Ability 启动与页面元素测试（2 条用例）
|   |   |---SelfSkillQuery.test.ets              // 自有技能查询测试（15 条用例）
|   |   |---BundleSkillQuery.test.ets            // 应用技能查询测试（17 条用例）
|   |   |---AllSkillsQuery.test.ets              // 设备全部技能查询测试（8 条用例）
|   |   |---IndexAndNavigation.test.ets          // Index 页面与导航流程测试（10 条用例）
|   |   |---ResultFieldValidation.test.ets       // 查询结果字段级验证（20 条用例）
|   |   |---NavigationFlow.test.ets              // 多步导航路径与边界场景（10 条用例）
|   |   |---StateConsistency.test.ets            // 选择器与跨页面状态一致性（10 条用例）
|   |   |---ErrorHandling.test.ets               // 错误处理与恢复验证（10 条用例）
|   |   |---SkillExecution.test.ets              // 技能执行页面验证（10 条用例）
|   |   |---SkillCompareAndHistory.test.ets      // 技能对比与历史验证（10 条用例）
|   |   |---PluginCompareAndBatch.test.ets       // 批量技能操作验证（5 条用例）
|   |   |---AdvancedFeatureTest.test.ets         // 高级功能场景验证（10 条用例）
|   |   |---AssertionHelper.test.ets             // 断言工具类测试（68 条用例）
|   |   |---PerformanceTracker.test.ets          // 性能跟踪器测试（38 条用例）
|   |   |---TestDataProvider.test.ets            // 测试数据提供器测试（32 条用例）
|   |   |---TestMetricsCollector.test.ets        // 指标收集器测试（25 条用例）
|   |   |---TestDataGenerator.test.ets           // 测试数据生成器测试（25 条用例）
|   |   |---TestEnvironmentChecker.test.ets      // 环境检查器测试（25 条用例）
|   |   |---TestLogAnalyzer.test.ets             // 日志分析器测试（25 条用例）
|   |   |---TestReportGenerator.test.ets         // 报告生成器测试（25 条用例）
|   |   |---ConstantValidation.test.ets          // 常量配置验证测试（20 条用例）
|   |   |---SkillManagerHomeExtended.test.ets    // 技能管理页扩展测试（8 条用例）
|   |   |---SkillBatchExtended.test.ets          // 批量操作扩展测试（12 条用例）
|   |   |---SkillHistoryExtended.test.ets        // 历史记录扩展测试（12 条用例）
|   |   |---SkillCompareExtended.test.ets        // 技能对比扩展测试（10 条用例）
|   |---testkit/
|   |   |---SharedDriver.ets                     // UI 操作封装和 runCase 统一处理
|   |---testability/
|   |   |---TestAbility.ets                      // 测试 Ability 入口
|   |   |---pages/Index.ets                      // 测试页面
|   |---testrunner/
|       |---OpenHarmonyTestRunner.ts             // 测试运行器
|---module.json5                                 // 测试模块配置
|---resources/                                   // 测试资源
```

## SUITE_MANIFEST 套件管理

`List.test.ets` 采用 `SUITE_MANIFEST` 结构化管理全部测试套件：

| 套件名称 | 分类 | 对应文件 | 用例数 | 描述 |
|---|---|---|---:|---|
| PluginAndSkillAbilityTest | Ability | Ability.test.ets | 2 | 应用启动与首页元素完整性验证 |
| SelfSkillQueryTest | SkillQuery | SelfSkillQuery.test.ets | 15 | 自有技能查询：参数校验、成功、异常、Flag 验证 |
| BundleSkillQueryTest | SkillQuery | BundleSkillQuery.test.ets | 17 | 应用技能查询：参数校验、成功、异常、Flag 验证 |
| AllSkillsQueryTest | SkillQuery | AllSkillsQuery.test.ets | 8 | 设备全部技能查询：基础查询、Flag 验证 |
| IndexAndNavigationTest | Navigation | IndexAndNavigation.test.ets | 10 | Index 页面 UI、SkillManagerHome 导航、页面往返流程 |
| ResultFieldValidationTest | Validation | ResultFieldValidation.test.ets | 20 | 三个查询页面结果卡片字段级验证 |
| NavigationFlowTest | Navigation | NavigationFlow.test.ets | 10 | 多步导航路径、按钮状态、边界场景 |
| StateConsistencyTest | State | StateConsistency.test.ets | 10 | 选择器状态、结果卡片状态、跨页面状态隔离 |
| ErrorHandlingTest | Error | ErrorHandling.test.ets | 10 | 错误信息验证、空参数验证、错误恢复 |
| SkillExecutionTest | Execution | SkillExecution.test.ets | 10 | 技能执行页面：UI 验证、执行操作、选择器验证 |
| SkillCompareAndHistoryTest | Compare | SkillCompareAndHistory.test.ets | 10 | 技能对比与历史：对比操作、历史记录、筛选统计 |
| SkillBatchTest | Batch | PluginCompareAndBatch.test.ets | 5 | 批量技能操作：UI 验证、技能切换、执行操作 |
| AdvancedFeatureTest | Advanced | AdvancedFeatureTest.test.ets | 10 | 高级功能场景：对比组合、历史详情、批量选择、执行记录 |
| AssertionHelperTest | Util | AssertionHelper.test.ets | 68 | 断言工具类：各种断言方法、结果收集、统计报告、单例模式 |
| PerformanceTrackerTest | Util | PerformanceTracker.test.ets | 38 | 性能跟踪器：计时器、指标记录、分类过滤、统计汇总、报告生成 |
| TestDataProviderTest | Util | TestDataProvider.test.ets | 32 | 测试数据提供器：单例模式、参数工厂、用例生成、分类统计 |
| TestMetricsCollectorTest | Util | TestMetricsCollector.test.ets | 25 | 指标收集器：单例模式、记录/累加/淘汰、分类汇总、报告生成 |
| TestDataGeneratorTest | Util | TestDataGenerator.test.ets | 25 | 测试数据生成器：组合生成、边界用例、计数器、完整套件 |
| TestEnvironmentCheckerTest | Util | TestEnvironmentChecker.test.ets | 25 | 环境检查器：单例模式、常量校验、完整性检查、报告生成 |
| TestLogAnalyzerTest | Util | TestLogAnalyzer.test.ets | 25 | 日志分析器：级别过滤、标签搜索、用例识别、通过率统计 |
| TestReportGeneratorTest | Util | TestReportGenerator.test.ets | 25 | 报告生成器：条目管理、质量评分、套件分组、文本报告 |
| ConstantValidationTest | Util | ConstantValidation.test.ets | 20 | 常量配置验证：数组长度、默认值、索引范围、Flag 值、UI 常量 |
| SkillManagerHomeExtendedTest | Navigation | SkillManagerHomeExtended.test.ets | 8 | 技能管理页扩展：按钮完整性、导航往返、导航深度 |
| SkillBatchExtendedTest | Batch | SkillBatchExtended.test.ets | 12 | 批量操作扩展：单选执行、Summary 卡片、Record 字段、选择切换 |
| SkillHistoryExtendedTest | Compare | SkillHistoryExtended.test.ets | 12 | 历史记录扩展：统计准确性、记录字段、筛选交互、多次累积 |
| SkillCompareExtendedTest | Compare | SkillCompareExtended.test.ets | 10 | 技能对比扩展：相同/不同对比、不存在技能、选择器状态 |

提供以下管理工具函数：

- `countByCategory(category)` — 按分类统计套件数量
- `findSuite(name)` — 按名称查找套件
- `getSuiteNames()` — 获取全部套件名称
- `getTotalCaseCount()` — 获取用例总数
- `validateManifest()` — 验证套件清单完整性（名称唯一性 + 字段有效性）

## 用例表

### Ability.test.ets（2 条）

| 用例编号 | 用例名称 | 测试功能 | 预置条件 | 输入/操作 | 预期输出 |
|---|---|---|---|---|---|
| SUB_SKILLMANAGERHOME_ABILITY_0100 | testSkillManagerHome0001 | 校验技能入口按钮 | 应用已启动 | 检查 skillButton 是否存在 | skillButton 存在 |
| SUB_SKILLMANAGERHOME_ABILITY_0200 | testSkillManagerHome0002 | 校验技能管理页面元素 | 应用已启动 | 点击 skillButton 进入技能管理页，校验标题、描述和导航按钮 | 元素均存在 |

### SelfSkillQuery.test.ets（15 条）

#### 参数校验（3 条）

| 用例编号 | 用例名称 | 测试功能 | Module | Skill | 预期输出 |
|---|---|---|---|---|---|
| SUB_SELF_SKILL_0100 | testSelfSkillQuery0001 | 模块有值、技能名为空 | entry | 空 | 无结果 |
| SUB_SELF_SKILL_0200 | testSelfSkillQuery0002 | 模块为空、技能名有值 | 空 | skill-test | 无结果 |
| SUB_SELF_SKILL_0300 | testSelfSkillQuery0003 | 模块和技能名均为空 | 空 | 空 | 无结果 |

#### 成功场景（4 条）

| 用例编号 | 用例名称 | 测试功能 | Module | Skill | 预期输出 |
|---|---|---|---|---|---|
| SUB_SELF_SKILL_0400 | testSelfSkillQuery0004 | 查询技能 skill-test | entry | skill-test | 有结果，包含 skill-test |
| SUB_SELF_SKILL_0500 | testSelfSkillQuery0005 | 查询技能 skill-echo | entry | skill-echo | 有结果，包含 skill-echo |
| SUB_SELF_SKILL_0600 | testSelfSkillQuery0006 | 查询技能 skill-calculator | entry | skill-calculator | 有结果，包含 skill-calculator |
| SUB_SELF_SKILL_0700 | testSelfSkillQuery0007 | 查询技能 skill-validation | entry | skill-validation | 有结果，包含 skill-validation |

#### 全部查询（1 条）

| 用例编号 | 用例名称 | 测试功能 | Module | Skill | 预期输出 |
|---|---|---|---|---|---|
| SUB_SELF_SKILL_0800 | testSelfSkillQuery0008 | 模块和技能名均为空，查询全部 | 空 | 空 | 有结果，包含 skill-test |

#### 异常场景（2 条）

| 用例编号 | 用例名称 | 测试功能 | Module | Skill | 预期输出 |
|---|---|---|---|---|---|
| SUB_SELF_SKILL_0900 | testSelfSkillQuery0009 | 模块不存在 | nonexistent_module | skill-test | BusinessError |
| SUB_SELF_SKILL_1000 | testSelfSkillQuery0010 | 技能不存在 | entry | skill-nonexistent | BusinessError |

#### Flag 验证（5 条）

| 用例编号 | 用例名称 | 测试功能 | Flag | 验证字段 | 预期输出 |
|---|---|---|---|---|---|
| SUB_SELF_SKILL_1100 | testSelfSkillQuery0011 | Default flag 查询 | Default | description | description 为空（`-`） |
| SUB_SELF_SKILL_1200 | testSelfSkillQuery0012 | Description flag 查询 | + Description | description | description 有值 |
| SUB_SELF_SKILL_1300 | testSelfSkillQuery0013 | SrcEntries flag 查询 | + SrcEntries | srcEntries | srcEntries 有值 |
| SUB_SELF_SKILL_1400 | testSelfSkillQuery0014 | Permissions flag 查询 | + Permissions | permissions | permissions 有值 |
| SUB_SELF_SKILL_1500 | testSelfSkillQuery0015 | RequestPermissions flag 查询 | + RequestPermissions | requestPermissions | requestPermissions 有值 |

### BundleSkillQuery.test.ets（17 条）

#### 参数校验（4 条）

| 用例编号 | 用例名称 | 测试功能 | Bundle | Module | Skill | 预期输出 |
|---|---|---|---|---|---|---|
| SUB_BUNDLE_SKILL_0100 | testBundleSkillQuery0001 | 三项均为空 | 空 | 空 | 空 | 无结果 |
| SUB_BUNDLE_SKILL_0200 | testBundleSkillQuery0002 | Bundle 为空 | 空 | entry | skill-test | 无结果 |
| SUB_BUNDLE_SKILL_0300 | testBundleSkillQuery0003 | Module 为空 | BUNDLE_NAME | 空 | skill-test | 无结果 |
| SUB_BUNDLE_SKILL_0400 | testBundleSkillQuery0004 | Skill 为空 | BUNDLE_NAME | entry | 空 | 无结果 |

#### 成功场景（1 条）

| 用例编号 | 用例名称 | 测试功能 | Bundle | Module | Skill | 预期输出 |
|---|---|---|---|---|---|---|
| SUB_BUNDLE_SKILL_0500 | testBundleSkillQuery0005 | 三项均有效 | BUNDLE_NAME | entry | skill-test | 有结果，包含 skill-test |

#### 全部查询（2 条）

| 用例编号 | 用例名称 | 测试功能 | Bundle | 预期输出 |
|---|---|---|---|---|
| SUB_BUNDLE_SKILL_0600 | testBundleSkillQuery0006 | Bundle 有效，查询全部 | BUNDLE_NAME | 有结果 |
| SUB_BUNDLE_SKILL_0700 | testBundleSkillQuery0007 | Bundle 为空，查询全部 | 空 | 无结果 |

#### 异常场景（4 条）

| 用例编号 | 用例名称 | 测试功能 | Bundle | Module | Skill | 预期输出 |
|---|---|---|---|---|---|---|
| SUB_BUNDLE_SKILL_0800 | testBundleSkillQuery0008 | Bundle 不存在 | com.nonexistent.bundle | entry | skill-test | BusinessError |
| SUB_BUNDLE_SKILL_0900 | testBundleSkillQuery0009 | Module 不存在 | BUNDLE_NAME | nonexistent_module | skill-test | BusinessError |
| SUB_BUNDLE_SKILL_1000 | testBundleSkillQuery0010 | Skill 不存在 | BUNDLE_NAME | entry | skill-nonexistent | BusinessError |
| SUB_BUNDLE_SKILL_1100 | testBundleSkillQuery0011 | 全部查询 Bundle 不存在 | com.nonexistent.bundle | — | — | BusinessError |

#### Flag 验证（6 条）

| 用例编号 | 用例名称 | 测试功能 | Flag | 验证字段 | 预期输出 |
|---|---|---|---|---|---|
| SUB_BUNDLE_SKILL_1200 | testBundleSkillQuery0012 | Default flag 查询 | Default | srcEntries | srcEntries 为空（`-`） |
| SUB_BUNDLE_SKILL_1300 | testBundleSkillQuery0013 | SrcEntries flag 查询 | + SrcEntries | srcEntries | srcEntries 有值 |
| SUB_BUNDLE_SKILL_1400 | testBundleSkillQuery0014 | Description flag 查询 | + Description | description | description 有值 |
| SUB_BUNDLE_SKILL_1500 | testBundleSkillQuery0015 | Permissions flag 查询 | + Permissions | permissions | permissions 有值 |
| SUB_BUNDLE_SKILL_1600 | testBundleSkillQuery0016 | RequestPermissions flag 查询 | + RequestPermissions | requestPermissions | requestPermissions 有值 |
| SUB_BUNDLE_SKILL_1700 | testBundleSkillQuery0017 | All flags 查询 | All flags | 全部字段 | 4 个字段均有值 |

### AllSkillsQuery.test.ets（8 条）

#### 基础查询（2 条）

| 用例编号 | 用例名称 | 测试功能 | 预期输出 |
|---|---|---|---|
| SUB_ALL_SKILLS_0100 | testAllSkillsQuery0001 | 查询设备全部技能 | 有结果 |
| SUB_ALL_SKILLS_0200 | testAllSkillsQuery0002 | 查询设备全部技能，验证内容 | 有结果，包含 skill-test |

#### Flag 验证（6 条）

| 用例编号 | 用例名称 | 测试功能 | Flag | 验证字段 | 预期输出 |
|---|---|---|---|---|---|
| SUB_ALL_SKILLS_0300 | testAllSkillsQuery0003 | Default flag 查询 | Default | srcEntries | srcEntries 为空（`-`） |
| SUB_ALL_SKILLS_0400 | testAllSkillsQuery0004 | SrcEntries flag 查询 | + SrcEntries | srcEntries | srcEntries 有值 |
| SUB_ALL_SKILLS_0500 | testAllSkillsQuery0005 | Description flag 查询 | + Description | description | description 有值 |
| SUB_ALL_SKILLS_0600 | testAllSkillsQuery0006 | Permissions flag 查询 | + Permissions | permissions | permissions 有值 |
| SUB_ALL_SKILLS_0700 | testAllSkillsQuery0007 | RequestPermissions flag 查询 | + RequestPermissions | requestPermissions | requestPermissions 有值 |
| SUB_ALL_SKILLS_0800 | testAllSkillsQuery0008 | All flags 查询 | All flags | 全部字段 | 4 个字段均有值 |

### IndexAndNavigation.test.ets（10 条）

#### Index 页面 UI 验证（4 条）

| 用例编号 | 用例名称 | 测试功能 | 操作 | 预期输出 |
|---|---|---|---|---|
| SUB_INDEX_NAV_0100 | testIndexNavigation0001 | 首页标题和按钮存在 | 检查 EntryAbility_label 和 skillButton | 标题有内容，skillButton 存在 |
| SUB_INDEX_NAV_0200 | testIndexNavigation0002 | 首页描述文本存在 | 检查 home_description | 描述有内容 |
| SUB_INDEX_NAV_0300 | testIndexNavigation0003 | 导航到技能管理页 | 点击 skillButton 进入 SkillManagerHome | 标题和描述存在 |
| SUB_INDEX_NAV_0400 | testIndexNavigation0004 | 导航后返回首页 | 进入 SkillManagerHome 后 pressBack | skillButton 仍然存在 |

#### SkillManagerHome 导航验证（3 条）

| 用例编号 | 用例名称 | 测试功能 | 操作 | 预期输出 |
|---|---|---|---|---|
| SUB_INDEX_NAV_0500 | testIndexNavigation0005 | 三个导航按钮存在 | 检查 self/bundle/all_skills_query_button | 三个按钮均存在 |
| SUB_INDEX_NAV_0600 | testIndexNavigation0006 | 进入自有技能查询页 | 导航到 SelfSkillQueryPage | 标题和查询按钮存在 |
| SUB_INDEX_NAV_0700 | testIndexNavigation0007 | 进入应用技能查询页 | 导航到 BundleSkillQueryPage | 标题和查询按钮存在 |

#### 页面往返验证（3 条）

| 用例编号 | 用例名称 | 测试功能 | 操作 | 预期输出 |
|---|---|---|---|---|
| SUB_INDEX_NAV_0800 | testIndexNavigation0008 | 进入设备全部技能查询页 | 导航到 AllSkillsQueryPage | 标题和查询按钮存在 |
| SUB_INDEX_NAV_0900 | testIndexNavigation0009 | 从查询页返回管理页 | SelfSkillQuery → pressBack | 技能管理页按钮存在 |
| SUB_INDEX_NAV_1000 | testIndexNavigation0010 | 连续导航并逐层返回 | Index → SkillManagerHome → SelfSkillQuery → back → back | 各层页面元素正确 |

### ResultFieldValidation.test.ets（20 条）

#### SelfSkillQuery 结果卡片字段验证（8 条）

| 用例编号 | 用例名称 | 测试功能 | 验证字段 | 预期输出 |
|---|---|---|---|---|
| SUB_RESULT_FIELD_0100 | testResultField0001 | 结果卡片显示 skillName | skill_result_name_0 | 值为 skill-test |
| SUB_RESULT_FIELD_0200 | testResultField0002 | 结果卡片显示 bundleName | skill_result_bundle_0_value | 值为 BUNDLE_NAME |
| SUB_RESULT_FIELD_0300 | testResultField0003 | 结果卡片显示 moduleName | skill_result_module_0_value | 值为 entry |
| SUB_RESULT_FIELD_0400 | testResultField0004 | 结果卡片显示 skillType | skill_result_type_0_value | 包含 0 |
| SUB_RESULT_FIELD_0500 | testResultField0005 | 结果卡片显示 skillPath | skill_result_path_0_value | 包含 skill |
| SUB_RESULT_FIELD_0600 | testResultField0006 | 结果卡片显示 abilityName | skill_result_ability_0_value | 有内容 |
| SUB_RESULT_FIELD_0700 | testResultField0007 | 结果卡片显示 versionCode | skill_result_version_code_0_value | 有内容 |
| SUB_RESULT_FIELD_0800 | testResultField0008 | Default flag 下扩展字段为空 | description / srcEntries | 均为 `-` |

#### BundleSkillQuery 结果卡片字段验证（6 条）

| 用例编号 | 用例名称 | 测试功能 | 验证字段 | 预期输出 |
|---|---|---|---|---|
| SUB_RESULT_FIELD_0900 | testResultField0009 | 结果卡片显示 skillName | skill_result_name_0 | 值为 skill-test |
| SUB_RESULT_FIELD_1000 | testResultField0010 | 结果卡片显示 bundleName | skill_result_bundle_0_value | 值为 BUNDLE_NAME |
| SUB_RESULT_FIELD_1100 | testResultField0011 | 结果卡片显示 moduleName | skill_result_module_0_value | 值为 entry |
| SUB_RESULT_FIELD_1200 | testResultField0012 | 结果卡片显示 skillPath | skill_result_path_0_value | 包含 skills |
| SUB_RESULT_FIELD_1300 | testResultField0013 | 结果卡片显示 versionCode | skill_result_version_code_0_value | 有内容 |
| SUB_RESULT_FIELD_1400 | testResultField0014 | Default flag 下 srcEntries 为空 | skill_result_src_entries_0_value | 值为 `-` |

#### AllSkillsQuery 结果卡片字段验证（6 条）

| 用例编号 | 用例名称 | 测试功能 | 验证字段 | 预期输出 |
|---|---|---|---|---|
| SUB_RESULT_FIELD_1500 | testResultField0015 | 结果卡片显示 skillName | skill_result_name_0 | 有内容 |
| SUB_RESULT_FIELD_1600 | testResultField0016 | 结果卡片显示 bundleName | skill_result_bundle_0_value | 包含 `.` |
| SUB_RESULT_FIELD_1700 | testResultField0017 | 结果卡片显示 moduleName | skill_result_module_0_value | 值为 entry |
| SUB_RESULT_FIELD_1800 | testResultField0018 | All flags 下 description 有值 | skill_result_description_0_value | 有内容 |
| SUB_RESULT_FIELD_1900 | testResultField0019 | All flags 下 srcEntries 有值 | skill_result_src_entries_0_value | 有内容 |
| SUB_RESULT_FIELD_2000 | testResultField0020 | All flags 下 permissions 有值 | permissions / requestPermissions | 均有内容 |

### NavigationFlow.test.ets（10 条）

#### 导航流程验证（3 条）

| 用例编号 | 用例名称 | 测试功能 | 操作 | 预期输出 |
|---|---|---|---|---|
| SUB_NAV_FLOW_0100 | testNavFlow0001 | 完整往返：Index → SelfSkillQuery → 返回 | 导航并逐层 pressBack | 各层页面元素正确 |
| SUB_NAV_FLOW_0200 | testNavFlow0002 | 完整往返：Index → BundleSkillQuery → 返回 | 导航并逐层 pressBack | 各层页面元素正确 |
| SUB_NAV_FLOW_0300 | testNavFlow0003 | 完整往返：Index → AllSkillsQuery → 返回 | 导航并逐层 pressBack | 各层页面元素正确 |

#### 按钮状态验证（3 条）

| 用例编号 | 用例名称 | 测试功能 | 页面 | 预期输出 |
|---|---|---|---|---|
| SUB_NAV_FLOW_0500 | testNavFlow0005 | 自有技能查询页按钮和选择器 | SelfSkillQueryPage | 查询按钮和选择器均存在 |
| SUB_NAV_FLOW_0600 | testNavFlow0006 | 应用技能查询页按钮和选择器 | BundleSkillQueryPage | 查询按钮和选择器均存在 |
| SUB_NAV_FLOW_0700 | testNavFlow0007 | 全部技能查询页按钮和选择器 | AllSkillsQueryPage | 查询按钮和 Flag 选择器存在 |

#### 边界场景（3 条）

| 用例编号 | 用例名称 | 测试功能 | 操作 | 预期输出 |
|---|---|---|---|---|
| SUB_NAV_FLOW_0800 | testNavFlow0008 | 切换参数后结果卡片更新 | 查询 skill-test → 切换为 skill-echo → 再查询 | 结果卡片显示 skill-echo |
| SUB_NAV_FLOW_0900 | testNavFlow0009 | Bundle 为空时查询无结果 | Bundle 选空，执行查询 | 显示无结果提示 |
| SUB_NAV_FLOW_1000 | testNavFlow0010 | 重复查询覆盖旧结果 | 连续两次查询同一技能 | 结果卡片显示最新查询结果 |

### StateConsistency.test.ets（10 条）

#### 选择器状态验证（4 条）

| 用例编号 | 用例名称 | 测试功能 | 页面 | 预期输出 |
|---|---|---|---|---|
| SUB_STATE_0100 | testStateConsistency0001 | 查询后选择器保留选中值 | SelfSkillQuery | module=entry，skill=skill-test |
| SUB_STATE_0200 | testStateConsistency0002 | 查询后选择器保留选中值 | BundleSkillQuery | bundle/module 值保留 |
| SUB_STATE_0300 | testStateConsistency0003 | Flag 选择器跨查询保留 | SelfSkillQuery | 两次查询后 Flag 均为 + Description |
| SUB_STATE_0400 | testStateConsistency0004 | Flag 选择器跨查询保留 | AllSkillsQuery | 两次查询后 Flag 均为 + SrcEntries |

#### 结果卡片状态验证（3 条）

| 用例编号 | 用例名称 | 测试功能 | 操作 | 预期输出 |
|---|---|---|---|---|
| SUB_STATE_0500 | testStateConsistency0005 | 清空参数后结果消失 | 查询后清空 module 再查询 | 显示无结果提示 |
| SUB_STATE_0600 | testStateConsistency0006 | 全部查询后单查询更新卡片 | query all → 选参数 → query single | 卡片显示 skill-echo |
| SUB_STATE_0700 | testStateConsistency0007 | 全部查询后单查询更新卡片 | query all → 选参数 → query single | 卡片显示 skill-calculator |

#### 跨页面状态隔离（3 条）

| 用例编号 | 用例名称 | 测试功能 | 页面 | 预期输出 |
|---|---|---|---|---|
| SUB_STATE_0800 | testStateConsistency0008 | 返回后重新进入状态重置 | SelfSkillQuery | 无结果提示，无结果卡片 |
| SUB_STATE_0900 | testStateConsistency0009 | 返回后重新进入状态重置 | BundleSkillQuery | 无结果提示，无结果卡片 |
| SUB_STATE_1000 | testStateConsistency0010 | 返回后重新进入状态重置 | AllSkillsQuery | 无结果提示，无结果卡片 |

### ErrorHandling.test.ets（10 条）

#### 错误信息验证（4 条）

| 用例编号 | 用例名称 | 测试功能 | 输入 | 预期输出 |
|---|---|---|---|---|
| SUB_ERROR_0100 | testErrorHandling0001 | 不存在模块的错误提示 | module=nonexistent_module | 结果包含 BusinessError |
| SUB_ERROR_0200 | testErrorHandling0002 | 不存在技能的错误提示 | skill=skill-nonexistent | 结果包含 BusinessError 和错误码 17700093 |
| SUB_ERROR_0300 | testErrorHandling0003 | 不存在 Bundle 的错误提示 | bundle=com.nonexistent.bundle | 结果包含 BusinessError |
| SUB_ERROR_0400 | testErrorHandling0004 | 不存在模块的错误提示（Bundle 查询） | module=nonexistent_module | 结果包含 BusinessError |

#### 空参数验证（3 条）

| 用例编号 | 用例名称 | 测试功能 | 页面 | 预期输出 |
|---|---|---|---|---|
| SUB_ERROR_0500 | testErrorHandling0005 | 全部参数为空时查询 | SelfSkillQuery | 显示无结果提示，无结果卡片 |
| SUB_ERROR_0600 | testErrorHandling0006 | 全部参数为空时查询 | BundleSkillQuery | 显示无结果提示 |
| SUB_ERROR_0700 | testErrorHandling0007 | Bundle 为空时全部查询 | BundleSkillQuery | 显示无结果提示 |

#### 错误恢复验证（3 条）

| 用例编号 | 用例名称 | 测试功能 | 操作 | 预期输出 |
|---|---|---|---|---|
| SUB_ERROR_0800 | testErrorHandling0008 | 修正参数后成功查询 | SelfSkillQuery: 错误参数 → 修正为 entry | 结果卡片显示 skill-test |
| SUB_ERROR_0900 | testErrorHandling0009 | 修正参数后成功查询 | BundleSkillQuery: 错误 bundle → 修正 | 结果卡片显示 skill-test |
| SUB_ERROR_1000 | testErrorHandling0010 | 错误结果格式验证 | 查询不存在模块 | 结果包含冒号分隔符，无结果提示存在 |

### SkillExecution.test.ets（10 条）

#### 技能执行页面 UI 验证（3 条）

| 用例编号 | 用例名称 | 测试功能 | 操作 | 预期输出 |
|---|---|---|---|---|
| SUB_SKILL_EXEC_0100 | testSkillExec0001 | 页面 UI 元素完整性 | 导航到 SkillExecutionPage | 标题、描述、选择器、按钮、结果区域均存在 |
| SUB_SKILL_EXEC_0200 | testSkillExec0002 | 初始状态提示 | 进入页面 | 结果文本有初始提示，无历史记录 |
| SUB_SKILL_EXEC_0300 | testSkillExec0003 | 导航往返验证 | 进入后 pressBack | 返回 SkillManagerHome，按钮存在 |

#### 技能执行操作验证（4 条）

| 用例编号 | 用例名称 | 测试功能 | 操作 | 预期输出 |
|---|---|---|---|---|
| SUB_SKILL_EXEC_0400 | testSkillExec0004 | 执行有效技能 | 选择 entry / skill-test → 执行 | 结果文本有内容 |
| SUB_SKILL_EXEC_0500 | testSkillExec0005 | 执行后历史记录 | 选择 entry / skill-echo → 执行 | execution_record_0 .exists() |
| SUB_SKILL_EXEC_0600 | testSkillExec0006 | 不存在模块的执行 | 选择 nonexistent_module → 执行 | 结果文本有内容 |
| SUB_SKILL_EXEC_0700 | testSkillExec0007 | 多次执行多条记录 | 执行 skill-test → 执行 skill-echo | record_0 和 record_1 均存在 |

#### 执行页面选择器验证（3 条）

| 用例编号 | 用例名称 | 测试功能 | 操作 | 预期输出 |
|---|---|---|---|---|
| SUB_SKILL_EXEC_0800 | testSkillExec0008 | 模块选择器默认值 | 进入页面 | 包含 entry |
| SUB_SKILL_EXEC_0900 | testSkillExec0009 | 技能选择器默认值 | 进入页面 | 包含 skill-test |
| SUB_SKILL_EXEC_1000 | testSkillExec0010 | 执行校验技能 | 选择 skill-validation → 执行 | 结果文本有内容 |

### SkillCompareAndHistory.test.ets（10 条）

#### 技能对比页面验证（5 条）

| 用例编号 | 用例名称 | 测试功能 | 操作 | 预期输出 |
|---|---|---|---|---|
| SUB_SCH_0100 | testSkillCompareAndHistory0001 | 对比页面 UI 元素完整性 | 导航到 SkillComparePage | 标题、描述、选择器、按钮均存在 |
| SUB_SCH_0200 | testSkillCompareAndHistory0002 | 对比不同技能 | skill-test vs skill-echo | 结果文本有内容 |
| SUB_SCH_0300 | testSkillCompareAndHistory0003 | 对比相同技能 | skill-test vs skill-test | 匹配率为 100% |
| SUB_SCH_0400 | testSkillCompareAndHistory0004 | 导航往返验证 | 进入后 pressBack | 返回 SkillManagerHome，按钮存在 |
| SUB_SCH_0500 | testSkillCompareAndHistory0005 | 对比摘要字段验证 | 对比后检查摘要区域 | total/same/diff/matchRate 均存在 |

#### 技能历史页面验证（5 条）

| 用例编号 | 用例名称 | 测试功能 | 操作 | 预期输出 |
|---|---|---|---|---|
| SUB_SCH_0600 | testSkillCompareAndHistory0006 | 历史页面 UI 元素完整性 | 导航到 SkillHistoryPage | 标题、描述、查询/清除按钮、筛选区域均存在 |
| SUB_SCH_0700 | testSkillCompareAndHistory0007 | 查询全部历史 | 点击查询按钮 | 结果文本有内容 |
| SUB_SCH_0800 | testSkillCompareAndHistory0008 | 统计信息更新 | 查询后检查统计 | history_total_count > 0 |
| SUB_SCH_0900 | testSkillCompareAndHistory0009 | 清除历史记录 | 查询 → 清除 | total_count=0，显示无记录提示 |
| SUB_SCH_1000 | testSkillCompareAndHistory0010 | 筛选开关可访问 | 检查筛选 UI | success/failed 开关和统计卡片存在 |

### PluginCompareAndBatch.test.ets（5 条）

#### 批量技能操作页面验证（5 条）

| 用例编号 | 用例名称 | 测试功能 | 操作 | 预期输出 |
|---|---|---|---|---|
| SUB_SKILL_BATCH_0100 | testSkillBatch0001 | 批量页面 UI 元素完整性 | 导航到 SkillBatchPage | 标题、描述、模块选择器、全选开关、执行/清除按钮均存在 |
| SUB_SKILL_BATCH_0200 | testSkillBatch0002 | 技能开关存在 | 进入页面 | batch_skill_toggle_0 ~ 4 均存在 |
| SUB_SKILL_BATCH_0300 | testSkillBatch0003 | 全选后批量执行 | 选择 entry → 全选 → 执行 | 结果文本有内容 |
| SUB_SKILL_BATCH_0400 | testSkillBatch0004 | 导航往返验证 | 进入后 pressBack | 返回 SkillManagerHome，按钮存在 |
| SUB_SKILL_BATCH_0500 | testSkillBatch0005 | 清除结果后状态 | 执行 → 清除 | 结果文本有内容（清除提示） |

### AdvancedFeatureTest.test.ets（10 条）

#### 技能对比高级场景（2 条）

| 用例编号 | 用例名称 | 测试功能 | 操作 | 预期输出 |
|---|---|---|---|---|
| SUB_ADV_0100 | testSkillCompareAdv0001 | 不同技能组合对比 | skill-echo vs skill-validation | 结果文本有内容 |
| SUB_ADV_0200 | testSkillCompareAdv0002 | 对比结果详情验证 | skill-echo vs skill-calculator | 结果文本有内容，对比标题和字段总数存在 |

#### 技能历史高级场景（2 条）

| 用例编号 | 用例名称 | 测试功能 | 操作 | 预期输出 |
|---|---|---|---|---|
| SUB_ADV_0300 | testSkillHistoryAdv0003 | 历史记录包信息 | 查询全部历史 | history_bundle_0 和 history_module_0 存在 |
| SUB_ADV_0400 | testSkillHistoryAdv0004 | 历史记录时间信息 | 查询全部历史 | history_time_0 和 history_duration_0 存在 |

#### 批量操作高级场景（2 条）

| 用例编号 | 用例名称 | 测试功能 | 操作 | 预期输出 |
|---|---|---|---|---|
| SUB_ADV_0500 | testSkillBatchAdv0005 | 单独选择技能（不使用全选） | 依次点击 toggle 0/1/2 | 三个开关均存在 |
| SUB_ADV_0600 | testSkillBatchAdv0006 | 全选后取消一个 | 全选 → 点击 toggle_0 | 开关存在，执行按钮存在 |

#### 执行历史高级场景（2 条）

| 用例编号 | 用例名称 | 测试功能 | 操作 | 预期输出 |
|---|---|---|---|---|
| SUB_ADV_0700 | testExecHistoryAdv0007 | 执行后记录卡片出现 | 执行 skill-test | execution_record_0 存在 |
| SUB_ADV_0800 | testExecHistoryAdv0008 | 多次执行多条记录 | 执行 skill-test → 执行 skill-echo | record_0 和 record_1 均存在 |

### SkillManagerHomeExtended.test.ets（8 条）

#### 按钮完整性验证（2 条）

| 用例编号 | 用例名称 | 测试功能 | 操作 | 预期输出 |
|---|---|---|---|---|
| SUB_SMH_EXT_0100 | testSkillManagerHomeButtons0001 | 全部导航按钮完整性 | 检查 8 个导航按钮 | self/bundle/all/exec/detail/compare/history/batch 按钮均存在 |
| SUB_SMH_EXT_0200 | testSkillManagerHomeButtons0002 | 按钮文本和可点击性 | 逐一检查按钮属性 | 各按钮文本有内容且可点击 |

#### 导航往返验证（5 条）

| 用例编号 | 用例名称 | 测试功能 | 操作 | 预期输出 |
|---|---|---|---|---|
| SUB_SMH_EXT_0300 | testNavRoundTrip0003 | 进入技能执行页并返回 | 导航到 SkillExecution → pressBack | 返回后首页按钮存在 |
| SUB_SMH_EXT_0400 | testNavRoundTrip0004 | 进入技能对比页并返回 | 导航到 SkillCompare → pressBack | 返回后首页按钮存在 |
| SUB_SMH_EXT_0500 | testNavRoundTrip0005 | 进入技能历史页并返回 | 导航到 SkillHistory → pressBack | 返回后首页按钮存在 |
| SUB_SMH_EXT_0600 | testNavRoundTrip0006 | 进入批量操作页并返回 | 导航到 SkillBatch → pressBack | 返回后首页按钮存在 |
| SUB_SMH_EXT_0700 | testNavRoundTrip0007 | 连续导航多个页面并返回 | 依次进入 3 个页面并返回 | 各层页面元素正确 |

#### 导航深度验证（1 条）

| 用例编号 | 用例名称 | 测试功能 | 操作 | 预期输出 |
|---|---|---|---|---|
| SUB_SMH_EXT_0800 | testNavDepth0008 | 多层导航栈深度验证 | Index → SkillManagerHome → SkillExecution → SkillCompare → 逐层返回 | 各层页面正确返回 |

### SkillBatchExtended.test.ets（12 条）

#### 单选执行验证（3 条）

| 用例编号 | 用例名称 | 测试功能 | 操作 | 预期输出 |
|---|---|---|---|---|
| SUB_BATCH_EXT_0100 | testBatchIndividualSelect0001 | 单独选择一个技能并执行 | 开启 toggle_0 → 执行 | 结果文本有内容 |
| SUB_BATCH_EXT_0200 | testBatchIndividualSelect0002 | 单独选择多个技能并执行 | 开启 toggle_0/2 → 执行 | 结果文本有内容 |
| SUB_BATCH_EXT_0300 | testBatchIndividualSelect0003 | 选择后取消再执行 | 开启 toggle_0 → 关闭 → 执行 | 结果文本显示无选择提示或空结果 |

#### Summary 卡片验证（3 条）

| 用例编号 | 用例名称 | 测试功能 | 操作 | 预期输出 |
|---|---|---|---|---|
| SUB_BATCH_EXT_0400 | testBatchSummaryCard0004 | 执行后 Summary 卡片出现 | 全选 → 执行 | batch_summary_total 存在且有值 |
| SUB_BATCH_EXT_0500 | testBatchSummaryCard0005 | Summary 卡片字段完整性 | 执行后检查摘要 | total/success/failed 字段均存在 |
| SUB_BATCH_EXT_0600 | testBatchSummaryCard0006 | 清除后 Summary 卡片更新 | 执行 → 清除 | Summary 数据归零或隐藏 |

#### Record 字段验证（3 条）

| 用例编号 | 用例名称 | 测试功能 | 操作 | 预期输出 |
|---|---|---|---|---|
| SUB_BATCH_EXT_0700 | testBatchRecordFields0007 | 执行记录卡片字段 | 执行单个技能 | record_0 包含 skill_name 和 result |
| SUB_BATCH_EXT_0800 | testBatchRecordFields0008 | 执行记录时间戳 | 执行后检查记录 | record 包含 timestamp 字段 |
| SUB_BATCH_EXT_0900 | testBatchRecordFields0009 | 多条执行记录 | 全选 → 执行 | record_0 ~ record_n 均存在 |

#### 选择切换验证（3 条）

| 用例编号 | 用例名称 | 测试功能 | 操作 | 预期输出 |
|---|---|---|---|---|
| SUB_BATCH_EXT_1000 | testBatchSelectToggle0010 | 全选/全不选切换 | 点击全选 → 点击全不选 | 所有开关状态正确切换 |
| SUB_BATCH_EXT_1100 | testBatchSelectToggle0011 | 模块切换后技能列表更新 | 切换模块选择器 | 技能开关列表更新 |
| SUB_BATCH_EXT_1200 | testBatchSelectToggle0012 | 快速连续切换开关 | 快速点击多个开关 | 各开关状态正确 |

### SkillHistoryExtended.test.ets（12 条）

#### 统计准确性验证（3 条）

| 用例编号 | 用例名称 | 测试功能 | 操作 | 预期输出 |
|---|---|---|---|---|
| SUB_HIST_EXT_0100 | testHistoryStats0001 | 查询后统计总数正确 | 执行技能 → 查询历史 | history_total_count 与实际记录数一致 |
| SUB_HIST_EXT_0200 | testHistoryStats0002 | 成功/失败统计准确 | 执行成功和失败的技能 → 查询 | success_count 和 failed_count 正确 |
| SUB_HIST_EXT_0300 | testHistoryStats0003 | 清除后统计归零 | 查询 → 清除 | total_count=0，success_count=0，failed_count=0 |

#### 记录字段验证（3 条）

| 用例编号 | 用例名称 | 测试功能 | 操作 | 预期输出 |
|---|---|---|---|---|
| SUB_HIST_EXT_0400 | testHistoryRecordFields0004 | 记录包含技能名 | 执行技能 → 查询 | history_skill_name_0 有值 |
| SUB_HIST_EXT_0500 | testHistoryRecordFields0005 | 记录包含执行结果 | 执行技能 → 查询 | history_result_0 有值 |
| SUB_HIST_EXT_0600 | testHistoryRecordFields0006 | 记录包含模块名 | 执行技能 → 查询 | history_module_0 有值 |

#### 筛选交互验证（3 条）

| 用例编号 | 用例名称 | 测试功能 | 操作 | 预期输出 |
|---|---|---|---|---|
| SUB_HIST_EXT_0700 | testHistoryFilter0007 | 成功筛选功能 | 执行成功和失败技能 → 筛选成功 | 仅显示成功记录 |
| SUB_HIST_EXT_0800 | testHistoryFilter0008 | 失败筛选功能 | 执行成功和失败技能 → 筛选失败 | 仅显示失败记录 |
| SUB_HIST_EXT_0900 | testHistoryFilter0009 | 取消筛选恢复全部 | 筛选 → 取消筛选 | 显示全部记录 |

#### 多次累积验证（3 条）

| 用例编号 | 用例名称 | 测试功能 | 操作 | 预期输出 |
|---|---|---|---|---|
| SUB_HIST_EXT_1000 | testHistoryAccumulate0010 | 多次执行后历史累积 | 执行 3 次技能 → 查询 | history 记录数 ≥ 3 |
| SUB_HIST_EXT_1100 | testHistoryAccumulate0011 | 清除后再执行重新记录 | 清除 → 执行 → 查询 | 仅有新记录 |
| SUB_HIST_EXT_1200 | testHistoryAccumulate0012 | 跨页面历史持久化 | 执行 → 返回 → 重新进入历史页 | 记录仍然存在 |

### SkillCompareExtended.test.ets（10 条）

#### 相同技能对比验证（2 条）

| 用例编号 | 用例名称 | 测试功能 | 操作 | 预期输出 |
|---|---|---|---|---|
| SUB_CMP_EXT_0100 | testCompareSameSkill0001 | 相同技能对比匹配率 | skill-test vs skill-test | matchRate = 100% |
| SUB_CMP_EXT_0200 | testCompareSameSkill0002 | 相同技能对比差异数 | skill-echo vs skill-echo | diff = 0 |

#### 不同技能对比验证（3 条）

| 用例编号 | 用例名称 | 测试功能 | 操作 | 预期输出 |
|---|---|---|---|---|
| SUB_CMP_EXT_0300 | testCompareDiffSkill0003 | 不同技能对比结果 | skill-test vs skill-echo | total > 0，diff > 0 |
| SUB_CMP_EXT_0400 | testCompareDiffSkill0004 | 不同技能组合对比 | skill-calculator vs skill-validation | 结果文本有内容 |
| SUB_CMP_EXT_0500 | testCompareDiffSkill0005 | 对比字段完整性 | 对比后检查详情 | 各字段对比结果均展示 |

#### 不存在技能验证（2 条）

| 用例编号 | 用例名称 | 测试功能 | 操作 | 预期输出 |
|---|---|---|---|---|
| SUB_CMP_EXT_0600 | testCompareNotFound0006 | 对比不存在的技能 | skill-nonexistent vs skill-test | 显示错误提示或空结果 |
| SUB_CMP_EXT_0700 | testCompareNotFound0007 | 两个技能均不存在 | skill-aaa vs skill-bbb | 显示错误提示 |

#### 选择器状态验证（3 条）

| 用例编号 | 用例名称 | 测试功能 | 操作 | 预期输出 |
|---|---|---|---|---|
| SUB_CMP_EXT_0800 | testCompareSelectors0008 | 对比后选择器保留值 | 对比后检查选择器 | 两个选择器值不变 |
| SUB_CMP_EXT_0900 | testCompareSelectors0009 | 切换选择器后重新对比 | 对比 → 切换技能 → 再对比 | 结果更新为新技能对比 |
| SUB_CMP_EXT_1000 | testCompareSelectors0010 | 导航返回后选择器重置 | 对比 → 返回 → 重新进入 | 选择器恢复默认值 |

### AssertionHelper.test.ets（68 条）

断言工具类测试覆盖以下方法组，每组包含正常/边界/异常场景验证：

| 用例编号范围 | 用例名称前缀 | 数量 | 测试功能 |
|---|---|---:|---|
| SUB_ASSERT_0100 ~ 0300 | testAssertEqual | 3 | assertEqual：相等/不等/类型差异 |
| SUB_ASSERT_0400 ~ 0500 | testAssertNotEqual | 2 | assertNotEqual：值不等/类型不等 |
| SUB_ASSERT_0600 ~ 0700 | testAssertTrue | 2 | assertTrue：真值/假值 |
| SUB_ASSERT_0800 ~ 0900 | testAssertFalse | 2 | assertFalse：假值/真值 |
| SUB_ASSERT_1000 ~ 1200 | testAssertContains | 3 | assertContains：包含/不包含/空串 |
| SUB_ASSERT_1300 ~ 1400 | testAssertNotContains | 2 | assertNotContains：不包含/部分匹配 |
| SUB_ASSERT_1500 ~ 1700 | testAssertGreaterThan | 3 | assertGreaterThan：大于/等于/小于 |
| SUB_ASSERT_1800 ~ 2000 | testAssertGreaterOrEqual | 3 | assertGreaterOrEqual：大于/等于/小于 |
| SUB_ASSERT_2100 ~ 2300 | testAssertLessThan | 3 | assertLessThan：小于/等于/大于 |
| SUB_ASSERT_2400 ~ 2600 | testAssertLessOrEqual | 3 | assertLessOrEqual：小于/等于/大于 |
| SUB_ASSERT_2700 ~ 2800 | testAssertNotEmpty | 2 | assertNotEmpty：非空串/空串 |
| SUB_ASSERT_2900 ~ 3000 | testAssertEmpty | 2 | assertEmpty：空串/非空串 |
| SUB_ASSERT_3100 ~ 3300 | testAssertNull | 3 | assertNull：null/undefined/非空 |
| SUB_ASSERT_3400 ~ 3600 | testAssertNotNull | 3 | assertNotNull：非空/null/undefined |
| SUB_ASSERT_3700 ~ 3900 | testAssertMatchesPattern | 3 | assertMatchesPattern：正则匹配/不匹配/空模式 |
| SUB_ASSERT_4000 ~ 4200 | testAssertStartsWith | 3 | assertStartsWith：前缀匹配/不匹配/空串 |
| SUB_ASSERT_4300 ~ 4500 | testAssertEndsWith | 3 | assertEndsWith：后缀匹配/不匹配/空串 |
| SUB_ASSERT_4600 ~ 4800 | testGetResults | 3 | getResults：获取结果列表/结果收集 |
| SUB_ASSERT_4900 ~ 5100 | testGetFailedResults | 3 | getFailedResults：获取失败结果/过滤 |
| SUB_ASSERT_5200 ~ 5400 | testSummarize | 3 | summarize：统计汇总/通过率计算 |
| SUB_ASSERT_5500 ~ 5600 | testGenerateReport | 2 | generateReport：生成报告/格式化 |
| SUB_ASSERT_5700 ~ 5800 | testClear | 2 | clear：清空结果/重置状态 |
| SUB_ASSERT_5900 ~ 6000 | testGetTotalCount | 2 | getTotalCount：总数统计 |
| SUB_ASSERT_6100 ~ 6200 | testGetPassCount | 2 | getPassCount：通过数统计 |
| SUB_ASSERT_6300 ~ 6400 | testGetFailCount | 2 | getFailCount：失败数统计 |
| SUB_ASSERT_6500 ~ 6700 | testGetPassRate | 3 | getPassRate：通过率计算/边界 |
| SUB_ASSERT_6800 | testGetInstance | 1 | getInstance：单例模式验证 |

### PerformanceTracker.test.ets（38 条）

性能跟踪器测试覆盖以下功能组：

| 用例编号范围 | 用例名称前缀 | 数量 | 测试功能 |
|---|---|---:|---|
| SUB_PERF_0100 ~ 0300 | testTimer | 3 | 计时器启动/停止/重置 |
| SUB_PERF_0400 ~ 0500 | testTimerCustom | 2 | 自定义标签计时器 |
| SUB_PERF_0600 ~ 0800 | testRecordMetric | 3 | 指标记录/更新/覆盖 |
| SUB_PERF_0900 ~ 1000 | testCapacity | 2 | 容量限制/淘汰策略 |
| SUB_PERF_1100 ~ 1300 | testGetMetrics | 3 | 指标获取/过滤/排序 |
| SUB_PERF_1400 ~ 1600 | testGetByCategory | 3 | 按分类过滤指标 |
| SUB_PERF_1700 ~ 1900 | testGetByName | 3 | 按名称查找指标 |
| SUB_PERF_2000 ~ 2200 | testGetFailed | 3 | 失败指标筛选/统计 |
| SUB_PERF_2300 ~ 2500 | testSummarize | 3 | 汇总统计/平均值/分布 |
| SUB_PERF_2600 ~ 2800 | testGenerateReport | 3 | 报告生成/格式化/输出 |
| SUB_PERF_2900 ~ 3000 | testClear | 2 | 清空指标/重置状态 |
| SUB_PERF_3100 ~ 3200 | testGetMetricCount | 2 | 指标计数统计 |
| SUB_PERF_3300 ~ 3400 | testGetActiveTimerCount | 2 | 活跃计时器计数 |
| SUB_PERF_3500 ~ 3600 | testSummarizePercentiles | 2 | 百分位统计/P50/P99 |
| SUB_PERF_3700 ~ 3800 | testSummarizeCategory | 2 | 分类汇总/跨分类统计 |

### TestDataProvider.test.ets（32 条）

测试数据提供器测试覆盖以下功能组：

| 用例编号范围 | 用例名称前缀 | 数量 | 测试功能 |
|---|---|---:|---|
| SUB_TDP_0100 ~ 0200 | testSingleton | 2 | 单例模式验证 |
| SUB_TDP_0300 ~ 0500 | testCreateParams | 3 | 参数工厂方法 |
| SUB_TDP_0600 ~ 0900 | testGenerateSkillQueryCases | 4 | 技能查询用例生成 |
| SUB_TDP_1000 ~ 1300 | testGenerateBundleQueryCases | 4 | 包查询用例生成 |
| SUB_TDP_1400 ~ 1700 | testGenerateFlagCombinations | 4 | Flag 组合生成 |
| SUB_TDP_1800 ~ 2000 | testGenerateErrorCases | 3 | 错误用例生成 |
| SUB_TDP_2100 ~ 2300 | testGetCaseByCategory | 3 | 按分类获取用例 |
| SUB_TDP_2400 ~ 2500 | testGetCaseCount | 2 | 用例计数统计 |
| SUB_TDP_2600 ~ 2800 | testGenerateErrorTestCases | 3 | 错误测试集生成 |
| SUB_TDP_2900 ~ 3000 | testGenerateAllTestCases | 2 | 全量用例生成 |
| SUB_TDP_3100 ~ 3200 | testGetTotalCaseCount | 2 | 总数统计/分类统计 |

### TestMetricsCollector.test.ets（25 条）

指标收集器测试覆盖以下功能组：

| 用例编号范围 | 用例名称前缀 | 数量 | 测试功能 |
|---|---|---:|---|
| SUB_MC_0100 ~ 0200 | testSingleton | 2 | 单例模式验证 |
| SUB_MC_0300 ~ 0400 | testRecordMetric | 2 | 指标记录/更新 |
| SUB_MC_0500 | testRecordMetricWithTags | 1 | 带标签指标记录 |
| SUB_MC_0600 ~ 0700 | testIncrementCounter | 2 | 计数器累加 |
| SUB_MC_0800 ~ 0900 | testGetLatestValue | 2 | 最新值获取 |
| SUB_MC_1000 | testGetDataPointsByCategory | 1 | 按分类获取数据点 |
| SUB_MC_1100 | testGetDataPointsByName | 1 | 按名称获取数据点 |
| SUB_MC_1200 ~ 1400 | testGetMetricSummary | 3 | 指标摘要/统计 |
| SUB_MC_1500 ~ 1600 | testGetCategorySummaries | 2 | 分类汇总 |
| SUB_MC_1700 | testGetAllMetricNames | 1 | 全部指标名称 |
| SUB_MC_1800 | testGetAllCategories | 1 | 全部分类列表 |
| SUB_MC_1900 | testGenerateSummaryReport | 1 | 摘要报告生成 |
| SUB_MC_2000 | testClear | 1 | 清空数据 |
| SUB_MC_2100 | testGetDataPointCount | 1 | 数据点计数 |
| SUB_MC_2200 ~ 2300 | testSetMaxDataPoints | 2 | 最大数据点设置/淘汰 |
| SUB_MC_2400 | testGetDataPointsCopy | 1 | 数据点副本 |
| SUB_MC_2500 | testGetMetricSummary | 1 | 边界统计验证 |

### TestDataGenerator.test.ets（25 条）

测试数据生成器测试覆盖以下功能组：

| 用例编号范围 | 用例名称前缀 | 数量 | 测试功能 |
|---|---|---:|---|
| SUB_TDG_0100 | testResetCounter | 1 | 计数器重置 |
| SUB_TDG_0200 | testGetTotalGeneratedCount | 1 | 总生成计数 |
| SUB_TDG_0300 ~ 0500 | testGenerateSingleSkillQuery | 3 | 单技能查询数据生成 |
| SUB_TDG_0600 ~ 0700 | testGenerateAllModuleCombinations | 2 | 模块组合数据生成 |
| SUB_TDG_0800 ~ 0900 | testGenerateAllBundleCombinations | 2 | 包组合数据生成 |
| SUB_TDG_1000 ~ 1100 | testGenerateAllFlagCombinations | 2 | Flag 组合数据生成 |
| SUB_TDG_1200 ~ 1300 | testGenerateAllSkillCombinations | 2 | 技能组合数据生成 |
| SUB_TDG_1400 ~ 1500 | testGenerateEmptyParamCases | 2 | 空参数用例生成 |
| SUB_TDG_1600 ~ 1700 | testGenerateBoundaryCases | 2 | 边界用例生成 |
| SUB_TDG_1800 ~ 2100 | testGenerateFullCombinationSuite | 4 | 完整组合套件生成 |
| SUB_TDG_2200 | testGenerateSingleSkillQueryExpectedError | 1 | 预期错误查询数据 |
| SUB_TDG_2300 | testCounterAccumulation | 1 | 计数器累加验证 |
| SUB_TDG_2400 | testGenerateEmptyParamCasesAllEmpty | 1 | 全空参数用例 |
| SUB_TDG_2500 | testGenerateAllModuleCombinationsNonexistent | 1 | 不存在模块组合 |

### TestEnvironmentChecker.test.ets（25 条）

环境检查器测试覆盖以下功能组：

| 用例编号范围 | 用例名称前缀 | 数量 | 测试功能 |
|---|---|---:|---|
| SUB_ECC_0100 ~ 0200 | testSingleton | 2 | 单例模式验证 |
| SUB_ECC_0300 ~ 0500 | testCheckConstantsConfiguration | 3 | 常量配置检查 |
| SUB_ECC_0600 ~ 0700 | testCheckDefaultValuesExist | 2 | 默认值存在性检查 |
| SUB_ECC_0800 ~ 0900 | testCheckDataIntegrity | 2 | 数据完整性检查 |
| SUB_ECC_1000 ~ 1200 | testRunAllChecks | 3 | 全量检查执行 |
| SUB_ECC_1300 ~ 1500 | testGetSummary | 3 | 摘要信息获取 |
| SUB_ECC_1600 | testGetResultsCopy | 1 | 结果副本获取 |
| SUB_ECC_1700 | testGetFailedResults | 1 | 失败结果筛选 |
| SUB_ECC_1800 ~ 2000 | testGenerateCheckReport | 3 | 检查报告生成 |
| SUB_ECC_2100 | testClear | 1 | 清空检查结果 |
| SUB_ECC_2200 | testGetResultCount | 1 | 结果计数 |
| SUB_ECC_2300 | testCheckResultTimestamp | 1 | 时间戳验证 |
| SUB_ECC_2400 | testCheckResultSeverity | 1 | 严重级别验证 |
| SUB_ECC_2500 | testRunAllChecksSummaryConsistency | 1 | 全量检查与摘要一致性 |

### TestLogAnalyzer.test.ets（25 条）

日志分析器测试覆盖以下功能组：

| 用例编号范围 | 用例名称前缀 | 数量 | 测试功能 |
|---|---|---:|---|
| SUB_TLA_0100 | testConstructorDefault | 1 | 默认构造函数 |
| SUB_TLA_0200 | testConstructorCustomMax | 1 | 自定义最大值构造 |
| SUB_TLA_0300 ~ 0400 | testAddEntry | 2 | 添加日志条目 |
| SUB_TLA_0500 | testLogDebug | 1 | Debug 级别日志 |
| SUB_TLA_0600 | testLogInfo | 1 | Info 级别日志 |
| SUB_TLA_0700 | testLogWarn | 1 | Warn 级别日志 |
| SUB_TLA_0800 | testLogError | 1 | Error 级别日志 |
| SUB_TLA_0900 ~ 1000 | testGetEntriesByLevel | 2 | 按级别筛选日志 |
| SUB_TLA_1100 | testGetEntriesByTag | 1 | 按标签筛选日志 |
| SUB_TLA_1200 ~ 1300 | testSearchEntries | 2 | 搜索日志条目 |
| SUB_TLA_1400 ~ 1600 | testAnalyze | 3 | 日志分析 |
| SUB_TLA_1700 ~ 1800 | testAnalyzeTestCaseResults | 2 | 用例结果分析 |
| SUB_TLA_1900 ~ 2000 | testGetTestPassRate | 2 | 通过率计算 |
| SUB_TLA_2100 | testClear | 1 | 清空日志 |
| SUB_TLA_2200 | testCounts | 1 | 计数统计 |
| SUB_TLA_2300 | testGetEntriesByTimeRange | 1 | 按时间范围筛选 |
| SUB_TLA_2400 ~ 2500 | testGenerateReport | 2 | 报告生成 |

### TestReportGenerator.test.ets（25 条）

报告生成器测试覆盖以下功能组：

| 用例编号范围 | 用例名称前缀 | 数量 | 测试功能 |
|---|---|---:|---|
| SUB_TRG_0100 | testSetReportTitle | 1 | 设置报告标题 |
| SUB_TRG_0200 ~ 0400 | testAddEntry | 3 | 添加报告条目 |
| SUB_TRG_0500 ~ 0600 | testAddPassedEntry | 2 | 添加通过条目 |
| SUB_TRG_0700 ~ 0800 | testAddFailedEntry | 2 | 添加失败条目 |
| SUB_TRG_0900 ~ 1100 | testGenerateReport | 3 | 报告生成 |
| SUB_TRG_1200 ~ 1400 | testQualityScore | 3 | 质量评分计算 |
| SUB_TRG_1500 ~ 1600 | testGenerateReportSuiteSections | 2 | 套件章节生成 |
| SUB_TRG_1700 ~ 1900 | testGenerateTextReport | 3 | 文本报告生成 |
| SUB_TRG_2000 | testClear | 1 | 清空报告 |
| SUB_TRG_2100 | testGetEntryCount | 1 | 条目计数 |
| SUB_TRG_2200 | testTotalDuration | 1 | 总耗时统计 |
| SUB_TRG_2300 | testCaseEntriesCopy | 1 | 条目副本获取 |
| SUB_TRG_2400 | testAssertionDensity | 1 | 断言密度计算 |
| SUB_TRG_2500 | testGeneratedAtFormatted | 1 | 生成时间格式化 |

### ConstantValidation.test.ets（20 条）

#### 数组长度验证（5 条）

| 用例编号 | 用例名称 | 测试功能 | 操作 | 预期输出 |
|---|---|---|---|---|
| SUB_CVT_0100 | testArrayLengths0001 | 模块数组长度 | 检查 MODULE_LIST 长度 | 长度 > 0 |
| SUB_CVT_0200 | testArrayLengths0002 | 技能数组长度 | 检查 SKILL_LIST 长度 | 长度 > 0 |
| SUB_CVT_0300 | testArrayLengths0003 | Bundle 数组长度 | 检查 BUNDLE_LIST 长度 | 长度 > 0 |
| SUB_CVT_0400 | testArrayLengths0004 | Flag 数组长度 | 检查 FLAG_OPTIONS 长度 | 长度 = 6 |
| SUB_CVT_0500 | testArrayLengths0005 | 数组一致性验证 | 模块/技能/Bundle 数组对应 | 长度匹配 |

#### 默认值验证（3 条）

| 用例编号 | 用例名称 | 测试功能 | 操作 | 预期输出 |
|---|---|---|---|---|
| SUB_CVT_0600 | testDefaultValues0006 | 默认模块值 | 检查 DEFAULT_MODULE | 值为 entry |
| SUB_CVT_0700 | testDefaultValues0007 | 默认技能值 | 检查 DEFAULT_SKILL | 值为 skill-test |
| SUB_CVT_0800 | testDefaultValues0008 | 默认 Bundle 值 | 检查 DEFAULT_BUNDLE | 值为 BUNDLE_NAME |

#### 索引范围验证（3 条）

| 用例编号 | 用例名称 | 测试功能 | 操作 | 预期输出 |
|---|---|---|---|---|
| SUB_CVT_0900 | testIndexBounds0009 | 模块索引有效 | 遍历 MODULE_LIST 索引 | 无越界 |
| SUB_CVT_1000 | testIndexBounds0010 | 技能索引有效 | 遍历 SKILL_LIST 索引 | 无越界 |
| SUB_CVT_1100 | testIndexBounds0011 | Flag 索引有效 | 遍历 FLAG_OPTIONS 索引 | 无越界 |

#### Flag 值验证（3 条）

| 用例编号 | 用例名称 | 测试功能 | 操作 | 预期输出 |
|---|---|---|---|---|
| SUB_CVT_1200 | testFlagValues0012 | Flag 值非零 | 检查各 Flag 值 | 均 > 0 |
| SUB_CVT_1300 | testFlagValues0013 | Flag 值唯一性 | 检查 Flag 值不重复 | 全部唯一 |
| SUB_CVT_1400 | testFlagValues0014 | Flag 组合有效 | 检查组合 Flag | 组合值正确 |

#### UI 常量验证（3 条）

| 用例编号 | 用例名称 | 测试功能 | 操作 | 预期输出 |
|---|---|---|---|---|
| SUB_CVT_1500 | testUIConstants0015 | 字体大小有效 | 检查 FONT_SIZE 常量 | 值 > 0 |
| SUB_CVT_1600 | testUIConstants0016 | 间距值有效 | 检查 PADDING/MARGIN 常量 | 值 ≥ 0 |
| SUB_CVT_1700 | testUIConstants0017 | 颜色值有效 | 检查 COLOR 常量 | 格式正确 |

#### 字符串常量验证（3 条）

| 用例编号 | 用例名称 | 测试功能 | 操作 | 预期输出 |
|---|---|---|---|---|
| SUB_CVT_1800 | testStringConstants0018 | TAG 常量非空 | 检查 TAG 值 | 有内容 |
| SUB_CVT_1900 | testStringConstants0019 | 页面标题非空 | 检查 PAGE_TITLE 值 | 有内容 |
| SUB_CVT_2000 | testStringConstants0020 | 按钮文本非空 | 检查 BUTTON_TEXT 值 | 有内容 |

## 构建验证

- 构建目标：`entry@ohosTest`
- 构建命令：`hvigorw.bat --mode module -p module=entry@ohosTest -p product=default assembleHap --no-daemon`
- 测试产物：`entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap`
- 包内模块名：`entry_test`
- 包内测试入口：`OpenHarmonyTestRunner`，`ets/testrunner/OpenHarmonyTestRunner`

## 用例设计说明

### SUITE_MANIFEST 结构化管理

`List.test.ets` 采用 `SUITE_MANIFEST` 模式对全部测试套件进行结构化管理：

- 定义 `SuiteManifest` 接口，包含 `name`、`category`、`description`、`caseCount`、`factory` 五个字段
- 所有套件以清单形式注册，启动时自动验证名称唯一性和字段有效性
- 提供 `countByCategory()`、`findSuite()`、`getSuiteNames()`、`getTotalCaseCount()` 等管理工具函数
- 启动时通过 `hilog` 打印套件清单，便于调试和审计

### SharedDriver 封装

测试工程采用 `testkit/SharedDriver.ets` 集中封装 UI 操作：

- `startApp()`：启动应用并等待 UI 空闲
- `clickId()` / `clickText()`：按 ID 或文本查找并点击组件
- `waitId()` / `waitText()`：等待指定 ID 或文本的组件出现
- `selectValue()`：通过 Select 下拉选择器设置值，空字符串自动映射到 "Not set (empty value)" 选项
- `existsId()`：检查指定 ID 的组件是否存在
- `textOfId()`：获取指定 ID 组件的文本内容
- `assertTextExists()`：滚动查找并断言文本存在
- `assertIdText()`：断言指定 ID 组件的文本内容
- `scrollToId()` / `scrollToTop()`：滚动到指定 ID 的组件或回到顶部
- `pressBack()`：返回上一页并等待 UI 空闲
- `resetToIndex()`：重置到首页
- `runCase()`：统一处理用例开始/结束日志、异常捕获和 `done()` 回调
- 导航辅助函数：`navigateToSkillManagerHome()`、`navigateToSelfSkillQuery()`、`navigateToBundleSkillQuery()`、`navigateToAllSkillsQuery()`、`navigateToSkillExecution()`、`navigateToSkillCompare()`、`navigateToSkillHistory()`、`navigateToSkillBatch()`

### Flag 选择器

三个查询页面均新增 Flag Select 下拉选择器，提供 6 种 `SkillInfoFlag` 组合：

| 选项 | Flag 组合 | 说明 |
|---|---|---|
| All flags | DEFAULT \| DESCRIPTION \| SRC_ENTRIES \| PERMISSIONS \| REQUEST_PERMISSIONS | 返回全部字段 |
| Default | GET_SKILL_INFO_DEFAULT | 仅返回基本信息，扩展字段为空 |
| + Description | DEFAULT \| WITH_DESCRIPTION | 返回描述信息 |
| + SrcEntries | DEFAULT \| WITH_SRC_ENTRIES | 返回源入口信息 |
| + Permissions | DEFAULT \| WITH_PERMISSIONS | 返回权限信息 |
| + RequestPermissions | DEFAULT \| WITH_REQUEST_PERMISSIONS | 返回申请权限信息 |

### 编号规范

每个测试文件独立编号：

- `tc.number`：从 `0100` 开始，步长 `100`，前缀按文件区分
- `tc.name`：从 `0001` 开始连续编号，前缀按文件区分
- `it()` 名称、`runCase()` 名称、`assertTextExists()` 参数均与 `tc.name` 完全一致

编号前缀清单：

| 前缀 | 测试文件 |
|---|---|
| SUB_SKILLMANAGERHOME_ABILITY_ | Ability.test.ets |
| SUB_SELF_SKILL_ | SelfSkillQuery.test.ets |
| SUB_BUNDLE_SKILL_ | BundleSkillQuery.test.ets |
| SUB_ALL_SKILLS_ | AllSkillsQuery.test.ets |
| SUB_INDEX_NAV_ | IndexAndNavigation.test.ets |
| SUB_RESULT_FIELD_ | ResultFieldValidation.test.ets |
| SUB_NAV_FLOW_ | NavigationFlow.test.ets |
| SUB_STATE_ | StateConsistency.test.ets |
| SUB_ERROR_ | ErrorHandling.test.ets |
| SUB_SKILL_EXEC_ | SkillExecution.test.ets |
| SUB_SCH_ | SkillCompareAndHistory.test.ets |
| SUB_SKILL_BATCH_ | PluginCompareAndBatch.test.ets |
| SUB_ADV_ | AdvancedFeatureTest.test.ets |
| SUB_SMH_EXT_ | SkillManagerHomeExtended.test.ets |
| SUB_BATCH_EXT_ | SkillBatchExtended.test.ets |
| SUB_HIST_EXT_ | SkillHistoryExtended.test.ets |
| SUB_CMP_EXT_ | SkillCompareExtended.test.ets |
| SUB_ASSERT_ | AssertionHelper.test.ets |
| SUB_PERF_ | PerformanceTracker.test.ets |
| SUB_TDP_ | TestDataProvider.test.ets |
| SUB_MC_ | TestMetricsCollector.test.ets |
| SUB_TDG_ | TestDataGenerator.test.ets |
| SUB_ECC_ | TestEnvironmentChecker.test.ets |
| SUB_TLA_ | TestLogAnalyzer.test.ets |
| SUB_TRG_ | TestReportGenerator.test.ets |
| SUB_CVT_ | ConstantValidation.test.ets |

### 日志规范

- DOMAIN：`0xF811`
- TAG：`[Sample_PluginAndSkill]`
- 每条用例开始和结束打印包含用例名的日志
- 每条断言前打印用例名和预期参数

### 测试覆盖

- **Ability（2 条）**：验证应用入口按钮和技能管理页面的 UI 元素完整性
- **SkillQuery（40 条）**：
  - 15 条自有技能查询（参数校验/成功/异常/Flag 验证）
  - 17 条应用技能查询（参数校验/成功/异常/Flag 验证）
  - 8 条设备全部技能查询（基础查询/Flag 验证）
- **Navigation（28 条）**：
  - 10 条 Index 页面与导航流程
  - 10 条多步导航路径与边界场景
  - 8 条技能管理页扩展导航
- **Validation（20 条）**：三个查询页面结果卡片字段级验证
- **State（10 条）**：选择器状态、结果卡片状态、跨页面状态隔离
- **Error（10 条）**：错误信息验证、空参数验证、错误恢复
- **Execution（10 条）**：技能执行页面 UI、执行操作、选择器验证
- **Compare（32 条）**：
  - 10 条技能对比与历史基础验证
  - 12 条历史记录扩展验证
  - 10 条技能对比扩展验证
- **Batch（17 条）**：
  - 5 条批量技能操作基础验证
  - 12 条批量操作扩展验证
- **Advanced（10 条）**：对比组合、历史详情、批量选择、执行记录
- **Util（346 条）**：
  - 68 条断言工具类测试
  - 38 条性能跟踪器测试
  - 32 条测试数据提供器测试
  - 25 条指标收集器测试
  - 25 条测试数据生成器测试
  - 25 条环境检查器测试
  - 25 条日志分析器测试
  - 25 条报告生成器测试
  - 20 条常量配置验证
- **26 个测试套件，共 497 条测试用例**
