# SystemLoad Test Case Reference

## Default UI/Mock Cases

By default, `List.test.ets` registers `abilityTest()` after `systemLoadSdkTest()`, executing 12 real SDK cases and 8 UI/Mock cases in total. The real SDK suite runs first, before any page listeners are started, so that the unregister-all case is not affected by page state.

| Case ID | Preconditions | Test Steps | Expected Result | Result |
| --- | --- | --- | --- | --- |
| systemLoad_startAbility_0001 | The device or emulator is running normally | Launch `EntryAbility` | The SystemLoad home page is displayed | Pass |
| systemLoad_levelDisplay_0002 | The application has been launched | View the level card | The level name and numeric value match; the description and scheduling suggestion are non-empty | Pass |
| systemLoad_mockData_0003 | The SystemLoad home page is displayed | Tap **Mock Data** | Displays `MEDIUM`, Level 2, and indicates the mock data source | Pass |
| systemLoad_mockLevelCycle_0004 | The default mock level is `MEDIUM` | Tap **Next Level** 8 times consecutively | Cycles through all 8 levels and returns to `MEDIUM`; names and values match | Pass |
| systemLoad_mockPreviousLevel_0005 | The mock level is `MEDIUM` | Tap **Previous Level** | Displays `NORMAL` and Level 1 | Pass |
| systemLoad_refreshMockData_0006 | The mock level is `NORMAL` | Tap **Refresh** | Remains at `NORMAL`, Level 1 | Pass |
| systemLoad_mockListenerCleanup_0007 | Mock data mode is active | View the listener area | Neither the primary nor the secondary listener is registered; listener controls and callback records are present | Pass |
| systemLoad_localData_0008 | Mock data mode is active | Tap **Local Data** | Displays a valid local level, or explicitly falls back to mock data; listener state and data source are consistent | Pass |

## Real SDK Cases

The real SDK cases are registered by default and run only on devices that support `SystemCapability.ResourceSchedule.SystemLoad`. These cases invoke system APIs directly, without using mock data or callback injection.

| Case ID | Scenario | Valid Assertions | Result |
| --- | --- | --- | --- |
| systemLoad_getLevel_0001 | Query the current level | The return value belongs to the 8-level enum (0–7) | Pass |
| systemLoad_getLevel_0002 | Query 3 times consecutively while a listener is active | Each result is a valid enum value; equality between results is not asserted | Pass |
| systemLoad_on_0001 | Register a single listener | Registration and unregistration succeed; any received callback has a valid level | Pass |
| systemLoad_on_0002 | Register two different callbacks | Both callbacks register and unregister successfully; received callback levels are valid | Pass |
| systemLoad_on_0003 | Register the same callback repeatedly | Repeated registration is idempotent; unregistering once then unregistering again returns error code 401 | Pass |
| systemLoad_on_0004 | Pass an invalid callback object | Returns error code 401 | Pass |
| systemLoad_on_0005 | Register and unregister the same callback 3 times | All 3 iterations complete; received callback levels are valid | Pass |
| systemLoad_off_0001 | Unregister, then re-register the same callback | Unregistration and re-registration succeed; received callback levels are valid | Pass |
| systemLoad_off_0002 | Unregister a callback that was never registered | Returns error code 401 | Pass |
| systemLoad_off_0003 | Unregister the same callback repeatedly | The second unregistration returns error code 401 | Pass |
| systemLoad_off_0004 | Register two callbacks, then call `off()` with no parameters | When the parameterless `off()` returns 401, falls back to unregistering callbacks one by one; both callbacks can be re-registered and unregistered normally | Pass |
| systemLoad_off_0005 | Pass an invalid callback object to `off()` | Returns error code 401 | Pass |

For all real cases, `afterEach` cleans up only callbacks that are still in a registered state. Exceptions in positive cases cause the test to fail directly. Negative cases must catch the error and assert the exact error code; logs must not be used as a substitute for assertions.

## Manual Level-Transition Scenarios

Natural level transitions are not a default automation precondition. To verify actual `systemLoadChange` transitions, inject each of the 8 levels separately in a controlled lab environment with load and thermal-state injection capability, then check the page name, numeric value, description, scheduling suggestion, the two callback counts, and the most recent callback record.

- Registration and unregistration are covered by automated cases. Natural transition callbacks are not a default automation precondition; a callback's level is validated only when a callback is actually received.
- When verifying a single natural transition, inject only a safe, controllable adjacent level—it is not necessary to traverse the high-temperature or emergency states.
- Do not trigger `WARNING`, `EMERGENCY`, or `ESCAPE` by subjecting the device to extreme temperature conditions.

> API 26 emulator full execution result: all 20 cases passed (12 real SDK cases, 8 UI/Mock cases). For `systemLoad_off_0004`, when the parameterless `off()` returns 401, the implementation falls back to unregistering each callback individually for compatibility.
