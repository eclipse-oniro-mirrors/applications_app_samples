# System Load

### Introduction

This sample uses [systemLoad in Basic Services Kit](https://gitcode.com/shicheny_01/docs/blob/master/zh-cn/application-dev/reference/apis-basic-services-kit/js-apis-resourceschedule-systemload.md) to demonstrate the system performance, power and thermal level. It covers `getLevel()`, listener registration, targeted unregistration and unregistering all callbacks.

The ArkTS Stage sample runs as a normal application without special permissions. Local API data is clearly separated from eight-level mock data, and the page provides listener state, callback counts, recent callback records and operation results.

### Preview

The home page displays the level name, numeric value, description and an application scheduling recommendation. Listener controls and callback records are shown below the level card. Capture a device screenshot after running the sample on a device.

### Usage

1. Launch the application to query the local system load and register the primary listener.
2. Select **Previous level** or **Next level** in mock mode to cycle through `LOW`, `NORMAL`, `MEDIUM`, `HIGH`, `OVERHEATED`, `WARNING`, `EMERGENCY` and `ESCAPE`.
3. In local mode, register a secondary listener to observe independent initial callbacks. Use the targeted unregister buttons or **Unregister all** to manage listener lifecycles.
4. Select **Local data** to query again. If the query fails, the page explicitly reports the failure and displays mock fallback data.
5. Leaving the page or moving it to the background unregisters page listeners. Returning to the foreground queries the level and registers the primary listener again.

### Project Structure

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
│           └── SystemLoadSdkTest.test.ets
└── library
    ├── Index.ets
    └── src/main/ets/systemload
        ├── feature/SystemLoadService.ets
        └── utils/Logger.ts
```

### Implementation

1. [SystemLoadService.ets](library/src/main/ets/systemload/feature/SystemLoadService.ets) directly wraps `getLevel()`, `on('systemLoadChange')`, targeted `off()` and `off()` without a callback. It preserves SDK errors so callers and XTS can verify the original API contract.
2. [SystemLoadPage.ets](entry/src/main/ets/systemload/SystemLoadPage.ets) maps all eight levels to localized descriptions and application recommendations. It guards duplicate UI operations, switches data sources, records two callbacks and cleans up listeners during lifecycle changes.
3. Request IDs prevent stale asynchronous query results from overwriting a newer user selection.
4. [Ability.test.ets](entry/src/ohosTest/ets/test/Ability.test.ets) provides eight repeatable UI/mock cases. [SystemLoadSdkTest.test.ets](entry/src/ohosTest/ets/test/SystemLoadSdk.test.ets) provides twelve real SDK cases with valid-level and exact error-code assertions.

### Tests

The default [List.test.ets](entry/src/ohosTest/ets/test/List.test.ets) registers twelve real SDK cases and eight UI/mock cases. It runs the real SDK suite first so page listeners cannot interfere with unregister-all coverage. Do not run the real suite on a system image without `SystemCapability.ResourceSchedule.SystemLoad`.

The real tests call system APIs directly and do not assume a fixed device level or equality between repeated queries. Listener cases verify real registration and unregistration. Because natural level transitions are not guaranteed, they do not require an initial callback but validate any callback received during the test. The unregister-all case falls back to targeted unregistration when the callback-free call returns 401, then verifies that both callbacks can register and unregister again. See [ohosTest.md](ohosTest.md) for the case inventory, execution results and manual level-transition scenarios.

### Permissions

No permissions are required by the systemLoad API.

### Dependencies

No other samples or third-party runtime dependencies are required.

### Constraints

1. The sample supports only the Stage model on standard-system emulators and devices.
2. systemLoad is available since API 12. The sample uses compileSdkVersion 26.1.0 and compatibleSdkVersion 26.0.0.
3. Use DevEco Studio with API 26.1.0 SDK support.
4. Local levels and change notifications depend on the device system. Mock levels and recommendations are demonstrations and never represent actual device load.
5. Natural level transitions require a controlled device or laboratory environment. Do not stress or overheat a device to force `WARNING`, `EMERGENCY` or `ESCAPE`.

### Download

To download only this project, run:

```text
git init
git config core.sparsecheckout true
echo code/BasicFeature/BackgroundTasks/SystemLoad/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/shicheny_01/applications_app_samples.git
git pull origin master
```
