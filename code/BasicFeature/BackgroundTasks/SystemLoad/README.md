# System Load

## Introduction

This sample demonstrates the system performance, power, and thermal level using the [systemLoad API in the Basic Services Kit](https://docs.openharmony.cn/pages/api-cn/arkui-ts/ts-basic-services-apis-systemload.md). It covers `getLevel()`, listener registration, targeted unregistration, and unregistering all callbacks.

The sample is written in ArkTS using the Stage model and runs as a normal application without requiring any special permissions. Local API data and eight-level mock data are kept clearly separate. The page displays listener state, callback counts, recent callback records, and operation results.

## Preview

The home page displays the level name, numeric value, description, and an application scheduling suggestion. Listener controls and callback records are shown below the level card. The appearance may vary depending on the device and system version.

## Usage

1. Launch the application to query the local system load and register the primary listener.
2. In mock mode, tap **Previous Level** or **Next Level** to cycle through `LOW`, `NORMAL`, `MEDIUM`, `HIGH`, `OVERHEATED`, `WARNING`, `EMERGENCY`, and `ESCAPE`.
3. In local-data mode, register a secondary listener to observe the independent initial callback of each. Use the targeted unregister buttons or **Unregister All** to manage listener lifecycles.
4. Tap **Local Data** to query again. If the query fails, the page reports the failure explicitly and displays mock fallback data.
5. Leaving the page or moving it to the background unregisters the page listeners. Returning to the foreground queries the level again and re-registers the primary listener.

## Project Structure

```text
SystemLoad
├── AppScope
├── entry
│   └── src
│       ├── main/ets
│       │   ├── entryability/EntryAbility.ets
│       │   ├── pages/Index.ets
│       │   └── systemload/SystemLoadPage.ets
│       └── ohosTest/ets/test
│           ├── Ability.test.ets
│           ├── AccessiblePerf.test.ets
│           ├── BoundaryExtensionPart1.test.ets
│           ├── BoundaryExtensionPart2.test.ets
│           ├── BoundaryExtensionPart3.test.ets
│           ├── BoundaryExtensionPart4.test.ets
│           ├── CallbackDataValidation.test.ets
│           ├── Comprehensive.test.ets
│           ├── ConcurrencySafety.test.ets
│           ├── Extended.test.ets
│           ├── I18nTheme.test.ets
│           ├── Level2Extended.test.ets
│           ├── Level3Extended.test.ets
│           ├── ListenerStateManagement.test.ets
│           ├── List.test.ets
│           ├── PerformanceSecurity.test.ets
│           ├── SkillCompletion.test.ets
│           ├── SystemLoadSdk.test.ets
│           ├── UIComponentState.test.ets
│           ├── UIInteraction.test.ets
│           └── Utils.test.ets
└── library
    ├── Index.ets
    └── src/main/ets/systemload
        ├── feature/SystemLoadService.ets
        └── utils/Logger.ts
```

## Implementation

1. [SystemLoadService.ets](library/src/main/ets/systemload/feature/SystemLoadService.ets) wraps `getLevel()`, `on('systemLoadChange')`, targeted `off()`, and parameterless `off()` directly, preserving the original SDK errors so that callers and XTS can verify the API contract.
2. [SystemLoadPage.ets](entry/src/main/ets/systemload/SystemLoadPage.ets) maps all eight levels to localized descriptions and application recommendations. It guards against duplicate UI operations, switches data sources, records two callbacks, and cleans up listeners during lifecycle changes.
3. A request ID prevents stale asynchronous query results from overwriting a newer user selection.
4. [Ability.test.ets](entry/src/ohosTest/ets/test/Ability.test.ets) provides twenty-one test cases for UI interactions and mock data. [SystemLoadSdk.test.ets](entry/src/ohosTest/ets/test/SystemLoadSdk.test.ets) provides twenty real SDK cases with valid-level and exact error-code assertions. [Utils.test.ets](entry/src/ohosTest/ets/test/Utils.test.ets) provides thirty-eight utility function test cases. [Extended.test.ets](entry/src/ohosTest/ets/test/Extended.test.ets) provides ten advanced test cases covering concurrency and edge cases. [SkillCompletion.test.ets](entry/src/ohosTest/ets/test/SkillCompletion.test.ets) provides twelve skill-based test cases covering lifecycle, error recovery, data consistency, and listener state management. [Level3Extended.test.ets](entry/src/ohosTest/ets/test/Level3Extended.test.ets) provides twenty-one Level 3 test cases covering concurrency, performance, stress testing, boundary values, page state, and UI state. [Level2Extended.test.ets](entry/src/ohosTest/ets/test/Level2Extended.test.ets) provides eight Level 2 test cases covering error handling and resource cleanup. [UIInteraction.test.ets](entry/src/ohosTest/ets/test/UIInteraction.test.ets) provides nine Level 3 test cases covering UI interaction and data source management. [Comprehensive.test.ets](entry/src/ohosTest/ets/test/Comprehensive.test.ets) provides fifty-two comprehensive test cases covering state machine, boundary values, empty data, duplicate operations, lifecycle, and data source switching. [PerformanceSecurity.test.ets](entry/src/ohosTest/ets/test/PerformanceSecurity.test.ets) provides eighteen test cases covering performance, stability, security, permissions, compatibility, and localization. [CallbackDataValidation.test.ets](entry/src/ohosTest/ets/test/CallbackDataValidation.test.ets) provides seven test cases covering callback data validation, page state synchronization, and request ID anti-duplication. [ListenerStateManagement.test.ets](entry/src/ohosTest/ets/test/ListenerStateManagement.test.ets) provides eight test cases covering listener subscription state, callback record management, and level mapping. [UIComponentState.test.ets](entry/src/ohosTest/ets/test/UIComponentState.test.ets) provides nine test cases covering UI component state, mock data cycling, and data source switching. [ConcurrencySafety.test.ets](entry/src/ohosTest/ets/test/ConcurrencySafety.test.ets) provides four test cases covering concurrent safety and exception recovery. [I18nTheme.test.ets](entry/src/ohosTest/ets/test/I18nTheme.test.ets) provides four test cases covering internationalization and theme adaptation. [AccessiblePerf.test.ets](entry/src/ohosTest/ets/test/AccessiblePerf.test.ets) provides five test cases covering accessible UI features and performance baselines. [BoundaryExtensionPart1-4.test.ets](entry/src/ohosTest/ets/test/BoundaryExtensionPart1.test.ets) provide four test cases covering boundary conditions and API extension coverage across four partitions.

## Tests

The default [List.test.ets](entry/src/ohosTest/ets/test/List.test.ets) registers 248 test cases across twenty test suites:
- **Real SDK Suite** (20 cases): Tests real system API calls with valid-level and exact error-code assertions
- **UI/Mock Suite** (25 cases): Tests UI interactions and mock data functionality
- **Utils Suite** (38 cases): Tests utility functions for string, date, validation, random, and device operations
- **Extended Suite** (10 cases): Tests advanced scenarios including concurrency and edge cases
- **Skill Completion Suite** (12 cases): Tests lifecycle management, error recovery, data consistency, and listener state
- **Level 3 Extended Suite** (21 cases): Tests concurrency, performance, stress testing, boundary values, page state, and UI state
- **Level 2 Extended Suite** (8 cases): Tests error handling and resource cleanup
- **UI Interaction Suite** (9 cases): Tests UI interaction and data source management
- **Comprehensive Suite** (52 cases): Tests state machine, boundary values, empty data, duplicate operations, lifecycle, and data source switching
- **Performance & Security Suite** (18 cases): Tests performance, stability, security, permissions, compatibility, and localization
- **Callback Data Validation Suite** (7 cases): Tests callback data validation, page state synchronization, and request ID anti-duplication
- **Listener State Management Suite** (8 cases): Tests listener subscription state, callback record management, and level mapping
- **UI Component State Suite** (9 cases): Tests UI component state, mock data cycling, and data source switching
- **Concurrency Safety Suite** (4 cases): Tests concurrent safety and exception recovery
- **I18n & Theme Suite** (4 cases): Tests internationalization and theme adaptation
- **Accessible & Performance Suite** (5 cases): Tests accessible UI features and performance baselines
- **Boundary Extension Part 1-4 Suites** (4 cases): Tests boundary conditions and API extension coverage across four partitions

The real SDK suite runs first so that page listeners cannot interfere with the unregister-all coverage. Do not run the real suite on a system that does not support `SystemCapability.ResourceSchedule.SystemLoad`.

The real tests call system APIs directly and make no assumptions about a fixed device level or equality between repeated queries. Listener cases verify real registration and unregistration. Because natural level transitions are not guaranteed, an initial callback is not required, but any callback received during the test is validated. For the unregister-all case, when the parameterless `off()` returns 401, the implementation falls back to unregistering each callback individually, then verifies that both callbacks can be re-registered and unregistered normally. See [ohosTest.md](ohosTest.md) for the case inventory, execution results, and manual level-transition scenarios.

## Permissions

The systemLoad API requires no permissions.

## Dependencies

No additional samples or third-party runtime dependencies are required.

## Constraints

1. The sample supports only the Stage model on standard-system emulators and devices.
2. systemLoad has been available since API 12. This sample uses compileSdkVersion 26.1.0 and compatibleSdkVersion 26.0.0.
3. Use DevEco Studio with API 26.1.0 SDK support.
4. Local levels and change notifications are provided by the device system. Mock levels and recommendations are for demonstration only and never represent the actual device load.
5. Natural level transitions require a controlled device or laboratory environment. Do not stress or overheat a device to force `WARNING`, `EMERGENCY`, or `ESCAPE`.

## Download

To download only this project, run:

```text
git init
git config core.sparsecheckout true
echo code/BasicFeature/BackgroundTasks/SystemLoad/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
