# AppContinuation

## Overview

This OpenHarmony sample uses `continueManager` and `UIAbility` from `@kit.AbilityKit` to demonstrate registering/unregistering preparation listeners, normal continuation and quick-start continuation. It restores text selections, note drafts, reading positions and form steps, while showing synchronous acceptance, asynchronous results, window readiness, business-position receipts and durable commits separately.

A single entry module contains the listener client, platform adapters, business controller, payload protocols and scene pages. The application identity is `com.samples.appcontinuation`. The table below lists the complete module names behind the Kit exports and their API references.

| Kit | Complete module names and API references | Purpose |
|---|---|---|
| `@kit.AbilityKit` | [`@ohos.app.ability.continueManager`](https://docs.openharmony.cn/pages/v6.0/zh-cn/application-dev/reference/apis-ability-kit/js-apis-app-ability-continueManager.md): `on/off` | Register/unregister preparation listeners |
| `@kit.AbilityKit` | [`@ohos.app.ability.UIAbility`](https://gitee.com/openharmony/docs/blob/master/en/application-dev/reference/apis-ability-kit/js-apis-app-ability-uiAbility.md), [`@ohos.app.ability.AbilityConstant`](https://gitee.com/openharmony/docs/blob/master/en/application-dev/reference/apis-ability-kit/js-apis-app-ability-abilityConstant.md), [`@ohos.app.ability.wantConstant`](https://gitee.com/openharmony/docs/blob/master/en/application-dev/reference/apis-ability-kit/js-apis-app-ability-wantConstant.md) | Continuation lifecycle, launch reasons and parameters |
| `@kit.AbilityKit` | [`@ohos.abilityAccessCtrl`](https://gitee.com/openharmony/docs/blob/master/en/application-dev/reference/apis-ability-kit/js-apis-abilityAccessCtrl.md) | Check and explicitly request the distributed-data permission |
| `@kit.ArkData` | [`@ohos.data.preferences`](https://gitee.com/openharmony/docs/blob/master/en/application-dev/reference/apis-arkdata/js-apis-data-preferences.md) | Local text, scene workspaces and saved baselines |
| `@kit.BasicServicesKit` | [`@ohos.deviceInfo`](https://gitee.com/openharmony/docs/blob/master/en/application-dev/reference/apis-basic-services-kit/js-apis-device-info.md), [`@ohos.pasteboard`](https://gitee.com/openharmony/docs/blob/master/en/application-dev/reference/apis-basic-services-kit/js-apis-pasteboard.md), [`@ohos.base`](https://gitee.com/openharmony/docs/blob/master/en/application-dev/reference/apis-basic-services-kit/js-apis-base.md): `BusinessError` | Public environment information, user-requested copying and error handling |
| `@kit.ArkUI` | [`@ohos.window`](https://gitee.com/openharmony/docs/blob/master/en/application-dev/reference/apis-arkui/js-apis-window.md), [`@ohos.router`](https://gitee.com/openharmony/docs/blob/master/en/application-dev/reference/apis-arkui/js-apis-router.md), [`@ohos.arkui.UIContext`](https://gitee.com/openharmony/docs/blob/master/en/application-dev/reference/apis-arkui/js-apis-arkui-UIContext.md) | Windows, fixed scene routes and confirmation dialogs |
| `@kit.LocalizationKit` | [`@ohos.resourceManager`](https://gitee.com/openharmony/docs/blob/master/en/application-dev/reference/apis-localization-kit/js-apis-resource-manager.md) | Localized resource lookup |
| `@kit.PerformanceAnalysisKit` | [`@ohos.hilog`](https://gitee.com/openharmony/docs/blob/master/en/application-dev/reference/apis-performance-analysis-kit/js-apis-hilog.md) | Redacted logging |
| `@kit.CoreFileKit` | [`@ohos.application.BackupExtensionAbility`](https://gitee.com/openharmony/docs/blob/master/en/application-dev/reference/apis-core-file-kit/js-apis-application-backupExtensionAbility.md) | System backup-extension lifecycle |

## Preview

The workbench shows listener and continuation stages. The text, note, reading and form pages show editing content, save status and restored positions.

## How to use

### Run preparation

1. Download the project and open the sample root in DevEco Studio with SDK `26.0.0` support. Install the matching SDK/Hvigor toolchain and synchronize dependencies.
2. Configure your own debug signing materials, build and install the application, then launch it normally to reach the workbench. One device is sufficient for local editing, saving, history and backup.
3. Before a two-device run, install the same version on two compatible standard-system devices. Match the application identity and `continueType`, satisfy the system's networking, account or trust requirements, and check that the required continuation entry is available.
4. Use fictional data. Inspect the environment, request permission and register the preparation listener from the workbench.

### Local features

| Page or area | Steps | Observable behavior |
|---|---|---|
| Workbench | Explicitly inspect the environment and permission, register `on`, then unregister `off` when finished; open records/call details | Synchronous acceptance, asynchronous notifications, error codes and observation expiry appear separately; filter redacted facts/events and explicitly copy a summary if needed |
| Text | Enter fictional multiline/emoji text, select a range and save; save as a new document when a separate identity is needed | Text, selection, local document identity, revision and saved state update |
| Notes | Open notes, edit the title/body and save; edit again and discard, then inspect and restore a history entry | Drafts remain distinct from the saved baseline; discarding restores the baseline, and history restoration creates a new revision |
| Reading | Navigate chapters/paragraphs, add a bookmark, move elsewhere, return through the bookmark and save progress | Check the current chapter, paragraph and bookmarks; continuation carries the book identifier and position, not the book file |
| Forms | Enter a fictional name, format-valid number and address step by step; inspect validation, save a draft and confirm after completing required fields | Check the fields, step and local confirmation state; no server submission occurs |
| Protocol and scenario guide | Inspect field, readiness, conflict, retry and recovery rules | Shows learning-model inputs, rules and calculated results |

### Normal continuation (two devices)

1. **Prepare the source:** edit and save text, then record its text, selection, document identity and revision. For notes, reading or forms, open the corresponding page and record its selection, chapter/paragraph or form step.
2. **Prepare the target:** check that the same application version launches and review local unsaved content. For a first run, save local drafts, then try conflict choices separately.
3. **Initiate on the source:** select the target through the device's **normal system continuation entry** and observe system feedback and workbench records.
4. **Observe on the target:** check the received data, window and business position: text/selection for text and notes, chapter/paragraph for reading, and fields/step for forms.
5. **Confirm on the target:** choose to keep the local version or accept continuation when prompted. Inspect the final commit, identity and revision, then continue editing and save.
6. **Finish:** unregister the listener when appropriate and inspect completion notifications or timeout messages in the records.

### Quick-start continuation (two devices)

1. **Prepare both devices:** check that the system quick-start entry is available and use the same application identity and matching `continueType`. The `_ContinueQuickStart` suffix follows the platform convention.
2. **Prepare the source:** open text, notes, reading or forms, record the identity, revision and current position, then check permission and register the preparation listener as needed.
3. **Prepare the target:** try cold and warm starts separately and record local draft state.
4. **Initiate on the source:** select the target through the system's **quick-start continuation entry** and observe system feedback.
5. **Observe on the target:** inspect the launch reason, quick-start result, data, window and business-position receipt. These signals may arrive in different orders; the page shows the final commit result once they are ready.
6. **Handle the target outcome:** resolve conflicts when prompted, check the restored selection/paragraph/step, then continue editing and save. For failures or timeouts, inspect the current stage in call details.

### Local backup and restore

1. Expand the backup panel and generate a workspace copy. Read the privacy prompt and confirm before copying to the local clipboard. The on-screen preview is not the complete export.
2. Explicitly paste the **complete backup** into the import area, select notes, reading and/or forms, and inspect the preview and unsaved-content warning.
3. First cancel and check that business data and storage remain unchanged. Preview again and confirm, then inspect identities, revisions and history in the selected scope. Unselected scenes retain their current state and drafts.
4. Changes to input, scope or the workspace invalidate the previous preview token. On a write failure, the application retains the original state and attempts compensation. If durable state is uncertain, further writes are paused; export in-memory drafts before addressing the storage problem.

## Project structure

```text
AppScope/                              Application identity and display-name resources
entry/src/main/ets/
├── pages/Index.ets                     Only entry page
├── continuation/pages/                Six scene/detail pages with lifecycle forwarding
├── continuation/components/           Production note, reading and form views shared with UI harnesses
├── learning/                          Continuation client, ports, controller and text payload
│   ├── ContinueClient.ets              Registration, generations and result redaction
│   ├── LearningPorts.ets              Clock, storage, permission and native adapters
│   ├── scene/                         Notes, reading, forms, backup and page sessions
│   ├── payload/                       Fields, codec, validation, conflicts and merging
│   ├── document/                      Document and form learning models
│   ├── guide/                         Scenario catalog
│   ├── recovery/                      Recovery policies
│   ├── rules/                         Readiness model
│   └── session/                       Retry policies
├── common/                            Context-backed resources and English fallback
│   └── ContinuationText.ets            Client text interface and default values
├── components/                        Workbench and backup presentation
├── entryability/                      UIAbility lifecycle and content loading
└── entrybackupability/                System backup extension
entry/src/main/resources/              English base, zh_CN and route profiles
entry/src/ohosTest/                     Model, integration, Preferences and UI cases
```

## Implementation

| Module responsibility | Implementation and source |
|---|---|
| entry continuation client and platform adapters | [ContinueClient](<entry/src/main/ets/learning/ContinueClient.ets>) wraps `continueManager.on/off` and isolates listener/unregistration generations. [LearningPorts](<entry/src/main/ets/learning/LearningPorts.ets>) supplies replaceable platform boundaries; [ContinuationText](<entry/src/main/ets/common/ContinuationText.ets>) connects the existing localization adapter to client messages and English defaults |
| Lifecycle and continuation coordination | [EntryAbility](<entry/src/main/ets/entryability/EntryAbility.ets>) forwards launch reasons and window callbacks to one [LearningController](<entry/src/main/ets/learning/LearningController.ets>). The Controller validates candidates, handles conflicts, joins signals and gates commits. Fixed routes are used, with `SUPPORT_CONTINUE_PAGE_STACK_KEY=false` on the source rather than mixing automatic page-stack restoration |
| Business position and local workspace | [ScenePageSession](<entry/src/main/ets/learning/scene/ScenePageSession.ets>) correlates actual-position receipts with the current scene, document, revision and request. [SceneWorkbench](<entry/src/main/ets/learning/scene/SceneWorkbench.ets>) owns saved baselines, drafts and history |
| Backup preview and restore | [SceneWorkspaceBackupModel](<entry/src/main/ets/learning/scene/SceneWorkspaceBackupModel.ets>) separates preview from commit; [SceneWorkspaceBackup](<entry/src/main/ets/components/SceneWorkspaceBackup.ets>) handles scope selection and explicit confirmation |
| Learning protocols and localization | [PayloadValidator](<entry/src/main/ets/learning/payload/PayloadValidator.ets>) separates field/cross-field rules and errors/warnings. Learning payloads and production text/scene protocols are implemented separately. Static labels use `$r`; [LocaleStrings](<entry/src/main/ets/common/LocaleStrings.ets>) resolves dynamic strings using Context resources, with English fallback without Context |

## Permissions

The [module declaration](<entry/src/main/module.json5>) requests only [`ohos.permission.DISTRIBUTED_DATASYNC`](https://gitee.com/openharmony/docs/blob/master/en/application-dev/security/AccessToken/permissions-for-all.md), after an explicit user action. Before continuation, also establish device trust and check that the system entry is available.

## Dependencies

The application registers one production entry module and calls the OpenHarmony SDK directly, without another sample or a local feature-package dependency. The [entry package configuration](<entry/oh-package.json5>) has no local package dependency. ohosTest remains inside entry and uses `@ohos/hypium` and SDK UiTest interfaces.

## Privacy and data security

- Backups are **unencrypted** text and may contain notes, names, phone numbers, addresses and history. Copying requires confirmation and uses `LOCALDEVICE` sharing. Use fictional data and safeguard/remove copies. Normal startup does not automatically read the clipboard.
- Ordinary logs and diagnostic summaries exclude business bodies and sensitive device identifiers. Hilog uses domain `0xF811` and tag `[Sample_AppContinuation]`.
- The backup UiQa **input helper writes synthetic backup text to the system clipboard before pasting**, overwriting its contents without restoring them afterward. Run it in a dedicated test environment. Formal-scene UI smoke uses `Component.inputText`. See the [test guide](<ohosTest.md>).

## Requirements and constraints

1. Compile, target and compatible SDK versions are all `26.0.0`, with `runtimeOS=OpenHarmony` and device type `default`. Use DevEco Studio and a matching Hvigor toolchain supporting this SDK. Record exact execution versions with test results.
2. Configure your own debug signing materials. The project does not include personal certificates, private keys, passwords or device signing credentials.
3. The bundle, `continueType` and text/scene payload namespaces use `com.samples.appcontinuation`. Both devices need the same installation identity; each installation has its own local sandbox.
4. Normal and quick-start continuation are initiated through their respective system entries. The unregistration observation window is 8 seconds and business stage deadlines are 15 seconds. Native calls with unknown outcomes require manual review before further action.
5. Device classifications and policies in the scenario guide are teaching examples; device support depends on the actual system.
6. Form confirmation is local, and reading content is bundled. Workspace versions, storage keys, serialized enums, rule identifiers and widget IDs retain their respective business meaning.
7. Reopen the Ability after a system-language change to keep one session's language consistent.

## Testing

The [test guide](<ohosTest.md>) includes a six-column feature table, preparation, test layers, an execution-record template, 27 groups of scenario descriptions and an index of 441 numbered definitions grouped by test file. Record the application version, environment and actual results for each execution.

## Download

Run these five commands in a **new empty directory**. Use Git supporting `git sparse-checkout init --no-cone` and `git sparse-checkout set` (Git 2.25 or later; a currently maintained version is recommended), with access to GitCode. Then open `code/BasicFeature/Ability/AppContinuation/`.

```bash
git init
git sparse-checkout init --no-cone
git sparse-checkout set code/BasicFeature/Ability/AppContinuation/
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```

[中文说明](<README_zh.md>)
