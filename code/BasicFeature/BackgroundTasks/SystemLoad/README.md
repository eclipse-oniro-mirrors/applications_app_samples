# System Load

## Introduction

This sample demonstrates the system performance, power, and thermal level using the [systemLoad API in the Basic Services Kit](https://gitcode.com/shicheny_01/docs/blob/master/zh-cn/application-dev/reference/apis-basic-services-kit/js-apis-resourceschedule-systemload.md). It covers `getLevel()`, listener registration, targeted unregistration, and unregistering all callbacks.

The sample is written in ArkTS using the Stage model and runs as a normal application without requiring any special permissions. Local API data and eight-level mock data are kept clearly separate. The page displays listener state, callback counts, recent callback records, and operation results.

## Preview

The home page displays the level name, numeric value, description, and an application scheduling suggestion. Listener controls and callback records are shown below the level card. Run the sample on a real device to capture a screenshot.

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
│           ├── List.test.ets
│           └── SystemLoadSdk.test.ets
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
4. [Ability.test.ets](entry/src/ohosTest/ets/test/Ability.test.ets) provides eight reproducible UI/mock cases. [SystemLoadSdk.test.ets](entry/src/ohosTest/ets/test/SystemLoadSdk.test.ets) provides twelve real SDK cases with valid-level and exact error-code assertions.

## Tests

The default [List.test.ets](entry/src/ohosTest/ets/test/List.test.ets) registers twelve real SDK cases and eight UI/mock cases, running the real SDK suite first so that page listeners cannot interfere with the unregister-all coverage. Do not run the real suite on a system image that does not support `SystemCapability.ResourceSchedule.SystemLoad`.

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
git remote add origin https://gitcode.com/shicheny_01/applications_app_samples.git
git pull origin master
```
