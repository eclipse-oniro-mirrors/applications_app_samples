# Publishing Custom Common Events Outside the Application

### Introduction

This sample is the companion application of [Subscribing to and Publishing Common Events](../CustomCommonEvent). It acts as a publisher outside the host application, demonstrates how to publish a custom common event from a page and a service widget, and shows the publish result. Main features:

1. After the home page starts, it subscribes to the custom common event `Acts_CommonEvent_Test` and shows the subscription state, the received count, the latest event data and source, and the received records in arrival order (20 records at most).
2. Tapping **Publish Event** on the home page publishes the custom common event as the page, with the event data `OutApp` and the publisher source `1002` carried by the `code` field.
3. After the service widget `publishCard` is added to the home screen, tapping the widget button publishes the custom common event from [FormExtensionAbility](https://gitcode.com/openharmony/docs/blob/master/en/application-dev/reference/apis-form-kit/js-apis-app-form-formExtensionAbility.md), with the event data `OutApp` and the publisher source `1001`, and the publish count shown on the widget increases.
4. The home page tells apart events published by the widget, by the page of this sample and by external applications based on the `code` field, and shows the source in the status area and the record list.

The sample uses [commonEventManager](https://gitcode.com/openharmony/docs/blob/master/en/application-dev/reference/apis-basic-services-kit/js-apis-commonEventManager.md) to subscribe to and publish common events, [formProvider](https://gitcode.com/openharmony/docs/blob/master/en/application-dev/reference/apis-form-kit/js-apis-app-form-formProvider.md) and [formBindingData](https://gitcode.com/openharmony/docs/blob/master/en/application-dev/reference/apis-form-kit/js-apis-app-form-formBindingData.md) to build and refresh the widget data, [preferences](https://gitcode.com/openharmony/docs/blob/master/en/application-dev/reference/apis-arkdata/js-apis-data-preferences.md) to keep the received records, and [hilog](https://gitcode.com/openharmony/docs/blob/master/en/application-dev/reference/apis-performance-analysis-kit/js-apis-hilog.md) to output logs.

### Preview

| Home page | Service widget |
|--------------------------------|--------------------------------|
| Shows the event name, publisher, widget name, required permission, subscription state, received count, latest data and source, and the received record list | Shows the widget title, publish count and publish button; tapping the button publishes the custom common event |

Usage:

1. Install the host application [CustomCommonEvent](../CustomCommonEvent) first, and add the service widget of this sample to the home screen.
2. Open the home page of this sample. The page subscribes to `Acts_CommonEvent_Test` automatically and the status text turns to subscribed.
3. Tap **Publish Event**. The received count increases by 1, the latest data becomes `OutApp`, the latest source becomes **Page**, and a new record is appended to the record list.
4. Tap the publish button on the widget. The event is published, the publish count of the widget increases, and the host application does not receive the event in the targeted subscription scenario.
5. Tap **Subscribe** / **Unsubscribe** to switch between the two states. No new event is recorded after the subscription is released.
6. Tap **Clear Records**. The received count returns to 0, the empty hint is shown again, and the record sequence restarts from 1.
7. Close and reopen the home page. The received records and the latest event data are restored from the preferences, so the records are not lost.

### Project Structure

```
entry/src/main/ets/
|---entryability
|   |---EntryAbility.ets                    // Home page entry, loads pages/Index
|---entryformability
|   |---EntryFormAbility.ets                // Widget lifecycle, publishes the event on click and refreshes the widget
|---feature
|   |---CommonEventPublisher.ets            // Publish data assembly, request validation and parameterized publish
|   |---EventRecordManager.ets              // Record validation, capacity eviction and formatting
|   |---EventRecordStore.ets                // Record serialization and preferences based persistence
|   |---FormEventService.ets                // Widget binding data, message parsing and publish entry
|   |---FormPublishCounter.ets              // Publish count of every widget
|   |---HomeStateModel.ets                  // Subscription, publish and record state of the home page
|   |---SubscriptionManager.ets             // Subscribe, unsubscribe and the subscribed state
|---pages
|   |---Index.ets                           // Home page, subscribes, publishes, clears and shows the records
|---util
|   |---Constants.ets                       // Event contract, source and status keys, layout values
|   |---Logger.ets                          // Log wrapper with a replaceable log sink
|---widget/pages
|   |---PublishCard.ets                     // Service widget page
entry/src/ohosTest/ets/
|---test
|   |---...                                 // 51 test suites, registered in List.test.ets
|   |---List.test.ets                       // Test registration entry
|---util
|   |---TestHelper.ets                      // Logging, polling and event collector of the tests
|---testability
|   |---TestAbility.ets                     // Test entry ability
|   |---pages/Index.ets                     // Test page
|---testrunner
|   |---OpenHarmonyTestRunner.ets           // Test runner
```

The test suites, the case inventory and the execution commands are described in [ohosTest.md](ohosTest.md).

### Implementation

* The event contract is centralized in [Constants.ets](entry/src/main/ets/util/Constants.ets). It defines the event name `Acts_CommonEvent_Test`, the event data `InApp` and `OutApp`, the bundle names of this sample and the host application, the widget name, and the publisher sources `EventSource.FORM` (1001) and `EventSource.PAGE` (1002). The page, the widget and the tests share the same contract. `SourceLabel` maps a source code to a resource key and `StatusLabel` maps a home page status to a resource key, so that the page keeps a static `$r('app.string.*')` mapping instead of building resource names at run time.

* Event publishing is wrapped in [CommonEventPublisher.ets](entry/src/main/ets/feature/CommonEventPublisher.ets):
    * `buildPublishData` puts the event data into `data` and the publisher source into `code` of `CommonEventPublishData`, instead of the loosely typed `parameters` field, so that the subscriber can tell the source easily.
    * `validatePublishRequest` rejects an empty event name, an event name that starts or ends with spaces, and event data longer than 64 KB.
    * `publishWithOptions` returns a rejected Promise when the request is invalid, and `publishWith` publishes the event assembled from `PublishOptions`.

* Received records are managed by [EventRecordManager.ets](entry/src/main/ets/feature/EventRecordManager.ets):
    * Every received event increments the sequence and keeps the event data, the source code, the source name and the received time.
    * The oldest record is dropped when the count exceeds the capacity, whose default value is 20.
    * `tryAdd` validates the event data and the source code and returns `AddResult` with the reason of a rejection, while `add` keeps the permissive behavior and never rejects an input.
    * `getRecords` returns a copy, so the page replaces its own state to refresh the list. An injectable `ClockProvider` supplies the received time.

* Records are persisted by [EventRecordStore.ets](entry/src/main/ets/feature/EventRecordStore.ets):
    * The records are serialized as a JSON array of `data` / `sourceCode` / `receivedTime` entries and kept in the preferences named `event_records`.
    * `deserialize` skips invalid JSON, `null` entries, entries with a wrong field type and entries rejected by the validators, then renumbers the sequence in arrival order.

* The home page state is kept by [HomeStateModel.ets](entry/src/main/ets/feature/HomeStateModel.ets):
    * `HomeStatus` covers ready, subscribed, subscribe failed, unsubscribed, publishing, publish success, publish failed, event received and cleared.
    * `publish` ignores a request while another publish is running, `handleEvent` rejects an invalid event, and `clear` resets the count, the latest data and the source.
    * `persist` and `restore` save the records through the injected store, and `snapshot` returns every value shown by the page in a stable field order.

* The subscription is kept by [SubscriptionManager.ets](entry/src/main/ets/feature/SubscriptionManager.ets). `start` creates the subscriber through an injectable `SubscriberFactory` and subscribes to the event, `stop` releases the subscriber, and both calls are ignored when the state does not match.

* Widget logic is wrapped in [FormEventService.ets](entry/src/main/ets/feature/FormEventService.ets), [FormPublishCounter.ets](entry/src/main/ets/feature/FormPublishCounter.ets) and [EntryFormAbility.ets](entry/src/main/ets/entryformability/EntryFormAbility.ets):
    * `onAddForm` returns the binding data with the initial publish count 0.
    * `onFormEvent` parses the widget message with `parseMessage`, publishes the event with the source `1001`, increments the count of that widget and refreshes the widget with `formProvider.updateForm`.
    * `parseMessage` falls back to `OutApp` and reports `empty-message`, `missing-data`, `non-string-data`, `empty-data` or `invalid-json` when the message is not usable.
    * `onRemoveForm` releases the count of the removed widget, and `onAcquireFormState` returns `formInfo.FormState.READY`.

* The home page [Index.ets](entry/src/main/ets/pages/Index.ets) subscribes in `aboutToAppear`, restores the persisted records, and saves the records and releases the subscription in `aboutToDisappear`:
    * The publish button is disabled while a publish is running, so repeated taps do not produce concurrent publishes.
    * Every text comes from `$r('app.string.*')` resources, which are provided in Chinese and English, and the colors are defined in both the `base` and the `dark` directories.

* The service widget [PublishCard.ets](entry/src/main/ets/widget/pages/PublishCard.ets) binds the publish count with `LocalStorage` and `@LocalStorageProp('publishCount')`, and sends a message to the provider with `postCardAction`.

### Permissions

[ohos.permission.REQUIRE_FORM](https://gitcode.com/openharmony/docs/blob/master/en/application-dev/security/AccessToken/permissions-for-system-apps.md#ohospermissionrequire_form)

[ohos.permission.GET_BUNDLE_INFO_PRIVILEGED](https://gitcode.com/openharmony/docs/blob/master/en/application-dev/security/AccessToken/permissions-for-system-apps.md#ohospermissionget_bundle_info_privileged)

### Dependencies

This sample runs together with [CustomCommonEvent](../CustomCommonEvent). The host application adds the service widget of this sample to the home screen and subscribes to the `Acts_CommonEvent_Test` event published by this sample.

### Constraints

1. This sample runs only on a standard system, and supports the phone and tablet devices.
2. This sample uses the Stage model and requires API 26 only. Both `compileSdkVersion` and `compatibleSdkVersion` are `26.0.0`.
3. This sample requires DevEco Studio or command-line-tools that ship the matching SDK 26.
4. `ohos.permission.REQUIRE_FORM` and `ohos.permission.GET_BUNDLE_INFO_PRIVILEGED` are system_basic permissions, which require a high level signature. For details, see [Configuring special permissions](https://gitcode.com/openharmony/docs/blob/master/en/application-dev/security/hapsigntool-overview.md).
5. The publish feature relies on the common event framework of the system, so the sample must run on a device that starts normally.

### Testing

The sample ships 51 automated test suites with 1,537 cases in `entry/src/ohosTest`, which cover the event contract, the record manager, the record store, the publisher, the widget service, the home page state model, the subscription manager and the home page UI. The cases are registered in [List.test.ets](entry/src/ohosTest/ets/test/List.test.ets) and described in [ohosTest.md](ohosTest.md).

Build and run the tests as follows:

```
devecocli build --modules entry@default entry@ohosTest --auto-sign
hdc install -r entry/build/default/outputs/default/entry-default-signed.hap
hdc install -r entry/build/default/outputs/ohosTest/entry-ohosTest-signed.hap
```

Then run the `entry@ohosTest` configuration in DevEco Studio; the bundle name, test module name, test runner path and timeout are listed in [ohosTest.md](ohosTest.md).

The full suite contains 1,537 cases, so it is executed in six batches with `-s class`, one process per batch, and the UI suites run in the last batch. The six batches ran 1,537 cases with 1,537 passes, 0 failures and 0 errors, and every batch reported `TestFinished-ResultCode: 0`.

### Download

If you want to download this project alone, run the following commands:

```
git init
git config core.sparsecheckout true
echo code/BasicFeature/Notification/CustomCommonEventRely/ > .git/info/sparse-checkout
git remote add origin https://gitcode.com/openharmony/applications_app_samples.git
git pull origin master
```
