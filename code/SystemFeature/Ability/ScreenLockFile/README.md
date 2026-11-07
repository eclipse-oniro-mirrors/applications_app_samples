# ScreenLockFile

### Introduction

This sample uses the Stage model and ArkTS. It demonstrates the `acquireAccess`, `releaseAccess`, and `queryAppKeyState` APIs provided by [@ohos.ability.screenLockFileManager](https://gitee.com/openharmony/docs/blob/master/en/application-dev/reference/apis-ability-kit/js-apis-screenLockFileManager.md) to request, release, and query access to application sensitive data while the screen is locked.

After the application declares `ohos.permission.PROTECT_SCREEN_LOCK_DATA`, the system provides an EL5 high-security directory. Sensitive data cannot be read or written after its key is destroyed. A successful `acquireAccess` call increases the key reference count, while `releaseAccess` decreases it. The two APIs must be used in pairs.

### Preview

No device screenshots are currently available. No non-device mockups are provided.

### Instructions

1. Start ScreenLockFile and read the permission, key state, and API pairing requirements on the home page.
2. Tap **Query app key state**. The result area displays the name and value of `KEY_NOT_EXIST`, `KEY_RELEASED`, or `KEY_EXIST`.
3. When the key state is `KEY_EXIST`, tap **Acquire access**. The result area displays `ACCESS_GRANTED` or `ACCESS_DENIED`. The pairing status area updates the acquire count.
4. After a successful request, tap **Release access**. The result area displays `RELEASE_GRANTED` or `RELEASE_DENIED`. The pairing status area updates the release count and pending count.
5. Tap **Query all states** to view a summary of the current key state, acquire count, release count, and pending count in a single line.
6. The operation history area records the last 10 operations with timestamps. Tap **Clear history** to reset all counters and history.
7. If the system capability is unavailable, protection is not enabled, or the call order is invalid, the result area displays the actual `BusinessError` code and message.

### Project Structure

```
entry/src/main/ets/
|---entryability
|   |---EntryAbility.ets                       // Application entry ability
|---screenlockfile
|   |---pages
|       |---ScreenLockFileHome.ets             // API operations and result display
|---pages
|   |---Index.ets                              // Single entry page
entry/src/ohosTest/ets/test/
|---SharedDriver.ets                          // Shared UI operation helper
|---SharedDriverExt.ets                       // Extended shared driver utilities
|---TestConstants.ets                         // Test constants (DOMAIN, TAG)
|---TestHelper.ets                            // Test assertion helper
|---List.test.ets                             // SUITE_MANIFEST test suite entry (53 suites)
|---AbilityLifecycle.test.ets                 // [Phase 0] App startup and page elements (3)
|---ApiStates.test.ets                        // [Phase 0] API state machine and enums (6)
|---UiInteraction.test.ets                    // [Phase 0] Button interaction and display (7)
|---EdgeCases.test.ets                        // [Phase 0] Repeated calls and boundaries (7)
|---QueryAppKeyState.test.ets                 // [Phase 1] queryAppKeyState API (30)
|---AcquireAccess.test.ets                    // [Phase 1] acquireAccess API (30)
|---ReleaseAccess.test.ets                    // [Phase 1] releaseAccess API (30)
|---QueryAllStates.test.ets                   // [Phase 1] queryAllStates API (25)
|---EnumValues.test.ets                       // [Phase 1] Enum consistency (25)
|---ApiReturnType.test.ets                    // [Phase 1] Return type validation (20)
|---ApiSequence.test.ets                      // [Phase 1] Call sequence validation (20)
|---ApiIdempotency.test.ets                   // [Phase 1] Idempotency validation (25)
|---KeyStatusEnum.test.ets                    // [Phase 1] KeyStatus enum coverage (30)
|---AccessStatusEnum.test.ets                 // [Phase 1] AccessStatus enum coverage (25)
|---ReleaseStatusEnum.test.ets                // [Phase 1] ReleaseStatus enum coverage (25)
|---ConstantsValidation.test.ets              // [Phase 1] Constants consistency (20)
|---ButtonClick.test.ets                      // [Phase 2] Button click interaction (35)
|---ResultDisplay.test.ets                    // [Phase 2] Result content display (30)
|---PairingStatusDisplay.test.ets             // [Phase 2] Pairing count display (25)
|---HistoryList.test.ets                      // [Phase 2] History list feature (30)
|---PageLayout.test.ets                       // [Phase 2] Page layout validation (25)
|---ButtonStyle.test.ets                      // [Phase 2] Button style validation (20)
|---ScrollBehavior.test.ets                   // [Phase 2] Scroll container behavior (20)
|---CardStyle.test.ets                        // [Phase 2] Card style and corners (20)
|---FontHierarchy.test.ets                    // [Phase 2] Font hierarchy validation (15)
|---TextContent.test.ets                      // [Phase 2] Text content validation (10)
|---PageStructure.test.ets                    // [Phase 2] Page structure validation (25)
|---SectionLayout.test.ets                    // [Phase 2] Section layout and spacing (25)
|---ComponentSpacing.test.ets                 // [Phase 2] Component spacing alignment (25)
|---ResponsiveLayout.test.ets                 // [Phase 2] Responsive layout adaptation (20)
|---VisualConsistency.test.ets                // [Phase 2] Visual consistency check (25)
|---KeyStateTransition.test.ets               // [Phase 3] Key state transitions (30)
|---LifecycleState.test.ets                   // [Phase 3] Lifecycle state validation (25)
|---ForegroundBackground.test.ets             // [Phase 3] Foreground/background behavior (25)
|---StateConsistency.test.ets                 // [Phase 3] Cross-operation consistency (25)
|---PendingState.test.ets                     // [Phase 3] Pending state logic (20)
|---RestartRecovery.test.ets                  // [Phase 3] Restart recovery validation (25)
|---ApiErrorHandling.test.ets                 // [Phase 3] API error handling (30)
|---ErrorInfoValidation.test.ets              // [Phase 3] Error info fields (25)
|---ErrorRecovery.test.ets                    // [Phase 3] Error recovery rebuild (25)
|---ErrorUIImpact.test.ets                    // [Phase 3] Error impact on UI (25)
|---SequentialErrors.test.ets                 // [Phase 3] Sequential error handling (25)
|---ErrorBoundary.test.ets                    // [Phase 3] Error boundary extremes (25)
|---HistoryRecord.test.ets                    // [Phase 4] History record basics (30)
|---HistoryLimit.test.ets                     // [Phase 4] History size limit (25)
|---HistoryClear.test.ets                     // [Phase 4] History clear function (25)
|---HistoryMixedOps.test.ets                  // [Phase 4] Mixed operation history (25)
|---HistoryAfterRestart.test.ets              // [Phase 4] History after restart (25)
|---AcquireCount.test.ets                     // [Phase 4] Acquire count precision (30)
|---ReleaseCount.test.ets                     // [Phase 4] Release count precision (30)
|---PendingCount.test.ets                     // [Phase 4] Pending count logic (25)
|---PairingSymmetry.test.ets                  // [Phase 4] Pairing symmetry (25)
|---CounterOverflow.test.ets                  // [Phase 4] Counter overflow extremes (25)
```

### Implementation

* The feature APIs are called directly through `screenLockFileManager` from `@kit.AbilityKit`. [ScreenLockFileHome.ets](entry/src/main/ets/screenlockfile/pages/ScreenLockFileHome.ets) invokes `screenLockFileManager.acquireAccess()`, `screenLockFileManager.releaseAccess()`, and `screenLockFileManager.queryAppKeyState()`, converts each returned enum to its name and value, and displays the result on the page. It also tracks operation history (last 10 records with timestamps), maintain acquire/release pairing counters, and provides a combined "Query all states" view. Exceptions are handled as `BusinessError`, displayed on the page, and recorded with `hilog`.
* [Index.ets](entry/src/main/ets/pages/Index.ets) only hosts the feature component. The page uses a scrollable layout, a maximum content width, and localized resources for different window sizes.
* Test suites are organized by theme using `SUITE_MANIFEST` pattern in [List.test.ets](entry/src/ohosTest/ets/test/List.test.ets), covering 1218 test cases across 53 suites in 5 phases: Phase 0 basic validation (4 suites, 23 cases), Phase 1 API deep validation (12 suites, 305 cases), Phase 2 UI and layout validation (15 suites, 365 cases), Phase 3 state and error handling (12 suites, 305 cases), and Phase 4 history and counter validation (10 suites, 255 cases). Test infrastructure includes [SharedDriver.ets](entry/src/ohosTest/ets/test/SharedDriver.ets), [SharedDriverExt.ets](entry/src/ohosTest/ets/test/SharedDriverExt.ets), [TestConstants.ets](entry/src/ohosTest/ets/test/TestConstants.ets), and [TestHelper.ets](entry/src/ohosTest/ets/test/TestHelper.ets).

### Permissions

[ohos.permission.PROTECT_SCREEN_LOCK_DATA](https://gitee.com/openharmony/docs/blob/master/en/application-dev/security/AccessToken/permissions-for-all.md#ohospermissionprotect_screen_lock_data) is a `normal` permission granted through `system_grant`. It enables sensitive data protection under the lock screen.

### Dependencies

This sample does not depend on other samples or modules. All APIs are called directly from the system kit `@kit.AbilityKit`.

### Constraints

1. This sample targets Phones, Tablets, and PCs/2in1 devices running the standard system with `SystemCapability.Security.ScreenLockFileManager`. Device layout and functionality have not been verified.
2. This sample uses the Stage model and the OpenHarmony API version 26 SDK. `compileSdkVersion`, `targetSdkVersion`, and `compatibleSdkVersion` are all `26.0.0`, and the build model version is 6.1.0.
3. Use DevEco Studio and a build toolchain that support OpenHarmony API version 26.
4. `acquireAccess` and `releaseAccess` are available since API version 12. `queryAppKeyState` is available since API version 18. This project uses API 26 for all build settings.
5. Declare the required permission and enable sensitive data protection before calling the APIs. Error codes 801, 29300002, 29300003, 29300004, or 29300005 may be returned when protection is unavailable or the access state is invalid.

### Download

To download this project separately, run the following commands:

```
git init
git config core.sparsecheckout true
echo code/SystemFeature/Ability/ScreenLockFile/ > .git/info/sparse-checkout
git remote add origin https://gitee.com/openharmony/applications_app_samples.git
git pull origin master
```
