# PluginAndSkill 测试用例归档

## 测试工程结构

```
entry/src/ohosTest/
|---ets/
|   |---test/
|   |   |---List.test.ets                  // 测试套件注册入口（含 SUITE_MANIFEST）
|   |   |---Ability.test.ets               // Ability 启动与页面元素测试（2 条用例）
|   |   |---SelfSkillQuery.test.ets        // 自有技能查询测试（15 条用例）
|   |   |---BundleSkillQuery.test.ets      // 应用技能查询测试（17 条用例）
|   |   |---AllSkillsQuery.test.ets        // 设备全部技能查询测试（8 条用例）
|   |   |---SkillManager.test.ets          // [旧文件，待删除]
|   |---testkit/
|   |   |---SharedDriver.ets               // UI 操作封装和 runCase 统一处理
|   |---testability/
|   |   |---TestAbility.ets                // 测试 Ability 入口
|   |   |---pages/Index.ets                // 测试页面
|   |---testrunner/
|       |---OpenHarmonyTestRunner.ts       // 测试运行器
|---module.json5                           // 测试模块配置
|---resources/                             // 测试资源
```

## SUITE_MANIFEST 套件管理

`List.test.ets` 采用 `SUITE_MANIFEST` 结构化管理全部测试套件：

| 套件名称 | 分类 | 对应文件 | 用例数 | 描述 |
|---|---|---|---:|---|
| PluginAndSkillAbilityTest | Ability | Ability.test.ets | 2 | 应用启动与首页元素完整性验证 |
| SelfSkillQueryTest | SkillQuery | SelfSkillQuery.test.ets | 15 | 自有技能查询：参数校验、成功、异常、Flag 验证 |
| BundleSkillQueryTest | SkillQuery | BundleSkillQuery.test.ets | 17 | 应用技能查询：参数校验、成功、异常、Flag 验证 |
| AllSkillsQueryTest | SkillQuery | AllSkillsQuery.test.ets | 8 | 设备全部技能查询：基础查询、Flag 验证 |

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
| SUB_SKILLMANAGERHOME_ABILITY_0200 | testSkillManagerHome0002 | 校验技能管理页面元素 | 应用已启动 | 点击 skillButton 进入技能管理页，校验标题、描述和 3 个导航按钮 | 5 个元素均存在 |

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

#### Flag 验证（6 条）

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
- `scrollToId()`：滚动到指定 ID 的组件
- `pressBack()`：返回上一页并等待 UI 空闲
- `runCase()`：统一处理用例开始/结束日志、异常捕获和 `done()` 回调

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

- `tc.number`：从 `0100` 开始，步长 `100`，前缀按文件区分（`SUB_SELF_SKILL_` / `SUB_BUNDLE_SKILL_` / `SUB_ALL_SKILLS_`）
- `tc.name`：从 `0001` 开始连续编号，前缀按文件区分（`testSelfSkillQuery` / `testBundleSkillQuery` / `testAllSkillsQuery`）
- `it()` 名称、`runCase()` 名称、`assertTextExists()` 参数均与 `tc.name` 完全一致

### 日志规范

- DOMAIN：`0xF811`
- TAG：`[Sample_PluginAndSkill]`
- 每条用例开始和结束打印包含用例名的日志
- 每条断言前打印用例名和预期参数

### 测试覆盖

- 2 条 Ability 页面测试：验证应用入口按钮和技能管理页面的 UI 元素完整性
- 15 条自有技能查询测试：
  - 3 条参数校验（空参数组合）
  - 4 条成功场景（覆盖 4 个不同技能）
  - 1 条全部查询
  - 2 条异常场景（不存在的模块/技能）
  - 5 条 Flag 验证（Default + 4 个单独 Flag）
- 17 条应用技能查询测试：
  - 4 条参数校验（空参数组合）
  - 1 条成功场景
  - 2 条全部查询（有效/无效 Bundle）
  - 4 条异常场景（不存在的 Bundle/Module/Skill + 全部查询不存在 Bundle）
  - 6 条 Flag 验证（Default + 4 个单独 Flag + All flags）
- 8 条设备全部技能查询测试：
  - 2 条基础查询
  - 6 条 Flag 验证（Default + 4 个单独 Flag + All flags）

## 执行说明

真机执行时需要：
1. 连接 OpenHarmony 设备
2. 安装测试 HAP：`hdc install entry-ohosTest-signed.hap`
3. 启动测试：`hdc shell aa start -d 0 -a TestAbility -b com.samples.pluginandskill`
4. 查看日志：`hdc shell hilog | grep "Sample_PluginAndSkill"`
