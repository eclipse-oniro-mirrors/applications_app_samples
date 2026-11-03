# 插件与技能管理

## 简介

本示例演示如何使用 [@ohos.bundle.pluginBundleManager](https://gitee.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-ability-kit/js-apis-pluginBundleManager.md) 和 [@ohos.bundle.skillManager](https://gitee.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-ability-kit/js-apis-skillManager.md) 来管理本地插件和应用技能。

**功能特性：**

1. 使用 `pluginBundleManager` 安装和卸载本地插件（HSP 文件）。
2. 使用 `skillManager` 查询当前应用或其他应用注册的技能信息。
3. 使用 `scriptManager` 执行应用技能脚本。

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
|---List.test.ets                     // 测试套件注册入口（含 SUITE_MANIFEST）
|---Ability.test.ets                  // 应用启动与页面元素测试（2 条用例）
|---SelfSkillQuery.test.ets           // 自有技能查询测试（15 条用例）
|---BundleSkillQuery.test.ets         // 应用技能查询测试（17 条用例）
|---AllSkillsQuery.test.ets           // 设备全部技能查询测试（8 条用例）
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

- **技能执行**：应用技能定义在 `entry/skills/` 目录下，通过 [module.json5](entry/src/main/module.json5) 的 `skillProfiles` 注册，使用 `scriptManager.completeArkTSScriptInApp()` 执行。

- **文件选择**：插件页面使用 `DocumentViewPicker` 选择 HSP 文件，复制到 `context.cacheDir` 后将沙箱路径传递给 `installLocalPlugin()`。

## 测试

本工程包含 Instrument 测试套件（ohosTest），共 **42 条用例**，通过 `SUITE_MANIFEST` 结构化管理 **4 个测试套件**：

| 套件名称 | 测试文件 | 用例数 | 描述 |
|---|---|---:|---|
| PluginAndSkillAbilityTest | Ability.test.ets | 2 | 应用启动与首页元素完整性验证 |
| SelfSkillQueryTest | SelfSkillQuery.test.ets | 15 | 自有技能查询：参数校验、成功、异常、Flag 验证 |
| BundleSkillQueryTest | BundleSkillQuery.test.ets | 17 | 应用技能查询：参数校验、成功、异常、Flag 验证 |
| AllSkillsQueryTest | AllSkillsQuery.test.ets | 8 | 设备全部技能查询：基础查询、Flag 验证 |

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
