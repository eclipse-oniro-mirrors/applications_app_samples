# Plugin and Skill Management

## Introduction

This sample demonstrates how to use [@ohos.bundle.pluginBundleManager](https://gitee.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-ability-kit/js-apis-pluginBundleManager.md) and [@ohos.bundle.skillManager](https://gitee.com/openharmony/docs/blob/master/zh-cn/application-dev/reference/apis-ability-kit/js-apis-skillManager.md) to manage local plugins and application skills.

**Features:**

1. Install and uninstall local plugins (HSP files) using `pluginBundleManager`.
2. Query skill information registered by the current application or other applications using `skillManager`.
3. Execute application skills using `scriptManager`.

## Preview

| Plugin Management Page | Skill Management Page |
|:---:|:---:|
| Select HSP file and install/uninstall plugins | Query skills by bundle name, module name, and skill name |

## Usage

1. On the home page, tap **Plugins** to enter the plugin management page.
2. On the plugin management page:
   - Tap **Select HSP** to choose a local HSP file using DocumentViewPicker.
   - Tap **Install plugin** to install the selected HSP as a local plugin.
   - Tap **Uninstall plugin** to remove an installed plugin.
3. Return to the home page and tap **Skills** to enter the skill management page.
4. On the skill management page:
   - Tap **Query own skill** to enter the own skill query page, where you can select module name and skill name using dropdown menus, select a query flag combination from the **Query flags** dropdown, then tap **Query own skill** to query a specific skill or **Query all own skills** to query all skills registered by the current application.
   - Tap **Query application skill** to enter the application skill query page, where you can select bundle name, module name, and skill name using dropdown menus, select a query flag combination from the **Query flags** dropdown, then tap **Query application skill** to query a specific skill or **Query application skills** to query all skills registered by a specified application.
   - Tap **Query all device skills** to enter the all skills query page, select a query flag combination from the **Query flags** dropdown, then tap **Query all device skills** to query all skills available on the device.

## Project Structure

```
entry/src/main/ets/
|---entryability/
|   |---EntryAbility.ets              // Entry ability
|---entrybackupability/
|   |---EntryBackupAbility.ets        // Backup ability
|---pages/
|   |---Index.ets                     // Home page with navigation
|---pluginandskill/pages/
|   |---PluginManagerHome.ets         // Plugin management page
|   |---SkillManagerHome.ets          // Skill management home page
|   |---SelfSkillQueryPage.ets        // Own skill query page
|   |---BundleSkillQueryPage.ets      // Application skill query page
|   |---AllSkillsQueryPage.ets        // All device skills query page
entry/skills/
|---skill-test/scripts/
|   |---TestSkill.ets                 // Test skill script
|---skill-echo/scripts/
|   |---EchoSkill.ets                 // Echo skill script
|---skill-calculator/scripts/
|   |---CalculatorSkill.ets           // Calculator skill script
|---skill-validation/scripts/
|   |---ValidationSkill.ets           // Validation skill script
entry/src/ohosTest/ets/test/
|---List.test.ets                     // Test suite entry (with SUITE_MANIFEST)
|---Ability.test.ets                  // App launch & page element tests (2 cases)
|---SelfSkillQuery.test.ets           // Own skill query tests (15 cases)
|---BundleSkillQuery.test.ets         // Application skill query tests (17 cases)
|---AllSkillsQuery.test.ets           // All device skills query tests (8 cases)
```

> **Note:** See [ohosTest.md](ohosTest.md) for detailed test case documentation.

## Implementation

- **Plugin management**: Uses `pluginBundleManager` APIs:
  - `installLocalPlugin()`: Installs a local plugin from a sandbox path.
  - `uninstallLocalPlugin()`: Uninstalls a local plugin by plugin ID.
  - `getAllLocalPluginInfoForSelf()`: Queries all installed local plugins.

- **Skill management**: Uses `skillManager` APIs:
  - `getSkillInfoForSelf()`: Queries a specific skill registered by the current application.
  - `getSkillInfosForSelf()`: Queries all skills registered by the current application.
  - `getSkillInfo()`: Queries a specific skill registered by a specified application.
  - `getSkillInfos()`: Queries all skills registered by a specified application.
  - `getAllSkillInfos()`: Queries all skills available on the device.

- **Skill execution**: Application skills are defined in `entry/skills/` and registered in [module.json5](entry/src/main/module.json5) via `skillProfiles`. Skills are executed using `scriptManager.completeArkTSScriptInApp()`.

- **File selection**: The plugin page uses `DocumentViewPicker` to select HSP files, copies them to `context.cacheDir`, and passes the sandbox path to `installLocalPlugin()`.

## Testing

This project includes an Instrument test suite (ohosTest) with **42 test cases** organized into **4 suites** via `SUITE_MANIFEST`:

| Suite | File | Cases | Description |
|---|---|---:|---|
| PluginAndSkillAbilityTest | Ability.test.ets | 2 | App launch and page element validation |
| SelfSkillQueryTest | SelfSkillQuery.test.ets | 15 | Own skill query: parameter validation, success, exception, flag verification |
| BundleSkillQueryTest | BundleSkillQuery.test.ets | 17 | Application skill query: parameter validation, success, exception, flag verification |
| AllSkillsQueryTest | AllSkillsQuery.test.ets | 8 | All device skills query: basic query, flag verification |

See [ohosTest.md](ohosTest.md) for the complete test case table, build instructions, and execution guide.

## Permissions

| Permission | Description |
|---|---|
| `ohos.permission.kernel.SUPPORT_LOCAL_PLUGIN` | Required to install and manage local plugins. |
| `ohos.permission.MANAGE_SKILL_PRIVILEGE` | Required to manage skill privileges. |
| `ohos.permission.READ_WRITE_USER_FILE` | Required to read HSP files selected by the user. |

**Note:** These permissions are system-granted or require specific signing configurations.

## Constraints

1. This sample only supports standard system devices.
2. This sample is based on the Stage model and requires API 26.0.0 SDK.
3. This sample requires DevEco Studio 6.0.0 or later to compile and run.
4. Local plugin installation requires the device to enable the "Install plugins from external sources" switch in system settings.
5. The sample uses open-source SDK version 26.0.0.

## Download

To download this sample separately, run the following commands:

```shell
git init
git config core.sparseCheckout true
echo code/SystemFeature/Ability/PluginAndSkill/ > .git/info/sparse-checkout
git remote add origin https://gitee.com/openharmony/applications_app_samples.git
git pull origin master
```
