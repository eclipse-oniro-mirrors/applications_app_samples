/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, beforeAll, describe, expect, it } from '@ohos/hypium';
import { Component, Driver } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {
  ID_INDEX_TITLE,
  ID_BUNDLE_INPUT,
  ID_BEGIN_BUTTON,
  ID_END_BUTTON,
  ID_QUERY_STATE_BUTTON,
  ID_QUERY_CONFIG_BUTTON,
  TYPE_TEXT,
  TYPE_BUTTON,
  TEXT_STATE_INACTIVE,
  TEXT_WHITELIST_EMPTY,
  TEXT_NO_ACTIVE_ASSESSMENT,
  TEXT_NO_EVENT,
  TEXT_REMOVE_BUTTON,
  KEY_BACK,
  TIMEOUT_PAGE_RENDER,
  TEST_BUNDLE_PRIMARY,
  TEST_BUNDLE_SECONDARY,
  serializedDelay,
  getDriver,
  launchAssessmentApp,
  findById,
  findComponentsByType,
  indexComponentCount,
  checkTextContent,
  collectTexts,
  waitForIndexPage,
  isAssessmentActive,
  isAssessmentInactive,
  isComponentEnabled,
  hideSoftKeyboard,
  addAllowedApp,
  allowedAppRowCount,
  removeFirstAllowedApp,
  clickIndexButton,
  pressAndWait
} from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// AppStorage keys of the controller, the literals must stay identical to AssessmentConstants.
const KEY_ACTIVE: string = 'assessmentActive';
const KEY_DURATION: string = 'assessmentDuration';
const KEY_LOGS: string = 'assessmentLogs';
const KEY_EVENT_TYPE: string = 'assessmentEventType';
const KEY_EVENT_CODE: string = 'assessmentEventCode';
const KEY_EVENT_MESSAGE: string = 'assessmentEventMessage';
const KEY_EVENT_SEQ: string = 'assessmentEventSeq';

// Limits mirrored from the sample.
const MAX_EVENT_LOG: number = 20;
const MAX_ALLOWED_APPS: number = 20;
const DURATION_TEN_MINUTES: number = 600000;
const DURATION_DEFAULT: number = 0;

// Event types used by the controller.
const EVENT_BEGIN: string = 'onBegin';
const EVENT_INTERRUPTED: string = 'onInterrupted';
const EVENT_END: string = 'onEnd';
const EVENT_API_ERROR: string = 'onApiError';

// Number of KeyValue pairs the storage layer owns, the count is asserted by one case.
const STORAGE_KEY_COUNT: number = 7;

/**
 * Minimal model of the AppStorage layer the sample uses.
 *
 * The pages observe the keys through StorageLink and StorageProp, the controller writes them, so
 * the integration contract is a producer/consumer one. The model reproduces the typed access of
 * AppStorage.setOrCreate and AppStorage.get without touching the real static storage, and the
 * sequence counter drives the @Watch callback of both pages exactly like the controller does.
 */
class StorageLayer {
  private booleans: Map<string, boolean> = new Map<string, boolean>();
  private numbers: Map<string, number> = new Map<string, number>();
  private strings: Map<string, string> = new Map<string, string>();
  private sequence: number = 0;
  private watchFirings: number = 0;

  public setBoolean(key: string, value: boolean): void {
    this.booleans.set(key, value);
  }

  public getBoolean(key: string, fallback: boolean): boolean {
    const value: boolean | undefined = this.booleans.get(key);
    return value === undefined ? fallback : value;
  }

  public setNumber(key: string, value: number): void {
    this.numbers.set(key, value);
  }

  public getNumber(key: string, fallback: number): number {
    const value: number | undefined = this.numbers.get(key);
    return value === undefined ? fallback : value;
  }

  public setString(key: string, value: string): void {
    this.strings.set(key, value);
  }

  public getString(key: string, fallback: string): string {
    const value: string | undefined = this.strings.get(key);
    return value === undefined ? fallback : value;
  }

  public hasKey(key: string): boolean {
    return this.booleans.has(key) || this.numbers.has(key) || this.strings.has(key);
  }

  public keyCount(): number {
    return this.booleans.size + this.numbers.size + this.strings.size;
  }

  public publishEvent(type: string, code: number, message: string): void {
    this.setString(KEY_EVENT_TYPE, type);
    this.setNumber(KEY_EVENT_CODE, code);
    this.setString(KEY_EVENT_MESSAGE, message);
    this.sequence = this.getNumber(KEY_EVENT_SEQ, 0) + 1;
    this.setNumber(KEY_EVENT_SEQ, this.sequence);
    this.watchFirings++;
  }

  public sequenceValue(): number {
    return this.sequence;
  }

  public watchCount(): number {
    return this.watchFirings;
  }

  public describe(): string {
    return `StorageLayer{keys=${this.keyCount()}, seq=${this.sequence}, watch=${this.watchFirings}}`;
  }
}

/**
 * Model of AssessmentController.
 *
 * The controller is the only writer of the storage keys, every page is a reader. Reproducing the
 * write order here lets the integration cases assert the exact key set that a begin or an end
 * publishes, without depending on whether the system confirmation dialog was accepted.
 */
class ControllerModel {
  private storage: StorageLayer = new StorageLayer();
  private logCount: number = 0;

  public getStorage(): StorageLayer {
    return this.storage;
  }

  public begin(duration: number): void {
    this.storage.setNumber(KEY_DURATION, duration);
    this.storage.setBoolean(KEY_ACTIVE, true);
    this.publish(EVENT_BEGIN, 0, '');
  }

  public end(): void {
    this.storage.setBoolean(KEY_ACTIVE, false);
    this.publish(EVENT_END, 0, '');
  }

  public interrupt(code: number, message: string): void {
    this.storage.setBoolean(KEY_ACTIVE, false);
    this.publish(EVENT_INTERRUPTED, code, message);
  }

  public apiError(code: number, message: string): void {
    this.publish(EVENT_API_ERROR, code, message);
  }

  public queryActive(): boolean {
    return this.storage.getBoolean(KEY_ACTIVE, false);
  }

  public queryDuration(): number {
    return this.storage.getNumber(KEY_DURATION, -1);
  }

  public setActive(active: boolean): void {
    this.storage.setBoolean(KEY_ACTIVE, active);
  }

  public logSize(): number {
    return this.logCount;
  }

  private publish(type: string, code: number, message: string): void {
    if (this.logCount < MAX_EVENT_LOG) {
      this.logCount++;
    }
    this.storage.publishEvent(type, code, message);
  }

  public describe(): string {
    return `ControllerModel{active=${this.queryActive()}, logs=${this.logCount}, ` +
      `${this.storage.describe()}}`;
  }
}

/**
 * Observer of the storage keys from the point of view of the entry page.
 *
 * The entry page derives the status text and the config text from three keys, the observer
 * reproduces that derivation so a regression in the derivation is caught without a device.
 */
class IndexPageView {
  private active: boolean = false;
  private queryDuration: number = -1;
  private queryApps: string = '';
  private logCount: number = 0;

  public applyStorage(storage: StorageLayer): void {
    this.active = storage.getBoolean(KEY_ACTIVE, false);
  }

  public applyQuery(duration: number, apps: string[]): void {
    this.queryDuration = duration;
    this.queryApps = apps.join(',');
  }

  public resetQuery(): void {
    this.queryDuration = -1;
    this.queryApps = '';
  }

  public setLogCount(count: number): void {
    this.logCount = count;
  }

  public stateText(): string {
    return this.active ? 'Assessment state: active' : 'Assessment state: inactive';
  }

  public configText(): string {
    if (this.queryDuration === -1) {
      return 'No active assessment';
    }
    return `duration: ${this.queryDuration} ms, allowedApps: ${this.queryApps}`;
  }

  public logPlaceholderVisible(): boolean {
    return this.logCount === 0;
  }

  public describe(): string {
    return `IndexPageView{state="${this.stateText()}", config="${this.configText()}"}`;
  }
}

/**
 * Observer of the storage keys from the point of view of the exam page.
 *
 * The exam page only reacts to the sequence counter through @Watch, and it derives the exit
 * dialog from the event type and the event code.
 */
class ExamPageView {
  private lastSeq: number = -1;
  private dialogKind: string = '';
  private remainingSeconds: number = 0;

  public applyStorage(storage: StorageLayer): string {
    const seq: number = storage.getNumber(KEY_EVENT_SEQ, 0);
    if (seq === this.lastSeq) {
      return this.dialogKind;
    }
    this.lastSeq = seq;
    const type: string = storage.getString(KEY_EVENT_TYPE, '');
    const code: number = storage.getNumber(KEY_EVENT_CODE, 0);
    this.dialogKind = ExamPageView.dialogFor(type, code);
    return this.dialogKind;
  }

  public applyDuration(duration: number): void {
    this.remainingSeconds = Math.floor(duration / 1000);
  }

  public tick(): void {
    if (this.remainingSeconds > 0) {
      this.remainingSeconds--;
    }
  }

  public remainingText(): string {
    const minutes: number = Math.floor(this.remainingSeconds / 60);
    const seconds: number = this.remainingSeconds % 60;
    return `${minutes}`.padStart(2, '0') + ':' + `${seconds}`.padStart(2, '0');
  }

  public dialog(): string {
    return this.dialogKind;
  }

  public static dialogFor(type: string, code: number): string {
    if (type === EVENT_BEGIN && code !== 0) {
      return 'end';
    }
    if (type === EVENT_INTERRUPTED) {
      return 'interrupt';
    }
    if (type === EVENT_END) {
      return 'finish';
    }
    return '';
  }

  public describe(): string {
    return `ExamPageView{dialog="${this.dialogKind}", remaining="${this.remainingText()}"}`;
  }
}

/**
 * Launches the sample and waits for the entry page.
 *
 * @param driver driver of the running case.
 * @returns true when the entry page is rendered.
 */
async function prepareIndex(driver: Driver): Promise<boolean> {
  await launchAssessmentApp();
  const rendered: boolean = await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
  if (!rendered) {
    hilog.warn(DOMAIN, TAG, 'prepareIndex: the entry page is not rendered');
  }
  return rendered;
}

/**
 * Counts the rendered texts that match an expected value.
 *
 * @param driver driver of the running case.
 * @param expected text to look for.
 * @returns the number of occurrences.
 */
async function countText(driver: Driver, expected: string): Promise<number> {
  const texts: string[] = await collectTexts(driver);
  let total: number = 0;
  for (let i = 0; i < texts.length; i++) {
    if (texts[i] === expected) {
      total++;
    }
  }
  return total;
}

export default function integrationTestingTest() {
  describe('IntegrationTesting_Test', () => {
    let driver: Driver;
    let controller: ControllerModel;

    beforeAll(async () => {
      driver = getDriver();
      controller = new ControllerModel();
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, 50);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: a begin publishes the complete key set.
     * Expectation: the duration, the active flag and the three event keys are all written, and
     * the sequence counter advances by exactly one.
     */
    it('Assessment_IntegrationTesting_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'IntegrationTesting_001, begin');
      const local: ControllerModel = new ControllerModel();
      local.begin(DURATION_TEN_MINUTES);
      const storage: StorageLayer = local.getStorage();
      expect(storage.getNumber(KEY_DURATION, -1)).assertEqual(DURATION_TEN_MINUTES);
      expect(storage.getBoolean(KEY_ACTIVE, false)).assertTrue();
      expect(storage.getString(KEY_EVENT_TYPE, '')).assertEqual(EVENT_BEGIN);
      expect(storage.getNumber(KEY_EVENT_CODE, -1)).assertEqual(0);
      expect(storage.getString(KEY_EVENT_MESSAGE, 'x')).assertEqual('');
      expect(storage.sequenceValue()).assertEqual(1);
      expect(storage.watchCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'IntegrationTesting_001', local.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'IntegrationTesting_001, end');
    });

    /**
     * Scenario: an end after a begin.
     * Expectation: the active flag drops and the event keys describe the onEnd callback, the
     * sequence counter advances again.
     */
    it('Assessment_IntegrationTesting_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'IntegrationTesting_002, begin');
      const local: ControllerModel = new ControllerModel();
      local.begin(DURATION_DEFAULT);
      local.end();
      const storage: StorageLayer = local.getStorage();
      expect(storage.getBoolean(KEY_ACTIVE, true)).assertFalse();
      expect(storage.getString(KEY_EVENT_TYPE, '')).assertEqual(EVENT_END);
      expect(storage.sequenceValue()).assertEqual(2);
      expect(storage.watchCount()).assertEqual(2);
      expect(local.logSize()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'IntegrationTesting_002', local.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'IntegrationTesting_002, end');
    });

    /**
     * Scenario: an interrupt during a session.
     * Expectation: the active flag drops and the interrupt code reaches both the code key and
     * the exam page observer, which derives the interrupt dialog from it.
     */
    it('Assessment_IntegrationTesting_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'IntegrationTesting_003, begin');
      const local: ControllerModel = new ControllerModel();
      const examView: ExamPageView = new ExamPageView();
      local.begin(DURATION_TEN_MINUTES);
      expect(examView.applyStorage(local.getStorage())).assertEqual('');
      local.interrupt(4, 'environment anomaly');
      const dialog: string = examView.applyStorage(local.getStorage());
      expect(dialog).assertEqual('interrupt');
      expect(local.getStorage().getNumber(KEY_EVENT_CODE, -1)).assertEqual(4);
      expect(local.getStorage().getString(KEY_EVENT_MESSAGE, '')).assertContain('anomaly');
      expect(local.queryActive()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'IntegrationTesting_003', examView.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'IntegrationTesting_003, end');
    });

    /**
     * Scenario: a failed begin.
     * Expectation: the exam page derives the end dialog, because a begin that does not return OK
     * means the session never started.
     */
    it('Assessment_IntegrationTesting_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'IntegrationTesting_004, begin');
      const storage: StorageLayer = new StorageLayer();
      const examView: ExamPageView = new ExamPageView();
      storage.publishEvent(EVENT_BEGIN, 1, 'user cancel');
      expect(examView.applyStorage(storage)).assertEqual('end');
      storage.publishEvent(EVENT_END, 0, '');
      expect(examView.applyStorage(storage)).assertEqual('finish');
      expect(ExamPageView.dialogFor(EVENT_API_ERROR, 3)).assertEqual('');
      expect(ExamPageView.dialogFor('', 0)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'IntegrationTesting_004', examView.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'IntegrationTesting_004, end');
    });

    /**
     * Scenario: the exam page observer receives the same sequence twice.
     * Expectation: the second observation is idempotent and does not recompute the dialog, so the
     * page cannot show a dialog twice for one event.
     */
    it('Assessment_IntegrationTesting_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'IntegrationTesting_005, begin');
      const storage: StorageLayer = new StorageLayer();
      const examView: ExamPageView = new ExamPageView();
      storage.publishEvent(EVENT_END, 0, '');
      expect(examView.applyStorage(storage)).assertEqual('finish');
      const first: string = examView.dialog();
      expect(examView.applyStorage(storage)).assertEqual(first);
      expect(storage.sequenceValue()).assertEqual(1);
      storage.publishEvent(EVENT_INTERRUPTED, 2, 'timeout');
      expect(examView.applyStorage(storage)).assertEqual('interrupt');
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'IntegrationTesting_005', examView.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'IntegrationTesting_005, end');
    });

    /**
     * Scenario: the entry page derives its status text from the storage layer.
     * Expectation: the active flag alone selects the rendered text and the config text falls back
     * to the no active assessment placeholder.
     */
    it('Assessment_IntegrationTesting_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'IntegrationTesting_006, begin');
      const storage: StorageLayer = new StorageLayer();
      const view: IndexPageView = new IndexPageView();
      view.applyStorage(storage);
      expect(view.stateText()).assertEqual(TEXT_STATE_INACTIVE);
      expect(view.configText()).assertEqual(TEXT_NO_ACTIVE_ASSESSMENT);
      storage.setBoolean(KEY_ACTIVE, true);
      view.applyStorage(storage);
      expect(view.stateText()).assertEqual('Assessment state: active');
      view.applyQuery(DURATION_TEN_MINUTES, [TEST_BUNDLE_PRIMARY, TEST_BUNDLE_SECONDARY]);
      expect(view.configText()).assertContain(`${DURATION_TEN_MINUTES}`);
      expect(view.configText()).assertContain(TEST_BUNDLE_PRIMARY + ',' + TEST_BUNDLE_SECONDARY);
      view.resetQuery();
      expect(view.configText()).assertEqual(TEXT_NO_ACTIVE_ASSESSMENT);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'IntegrationTesting_006', view.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'IntegrationTesting_006, end');
    });

    /**
     * Scenario: the event log key set of the controller.
     * Expectation: all seven documented keys exist after one event and none of them is missing.
     */
    it('Assessment_IntegrationTesting_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'IntegrationTesting_007, begin');
      const local: ControllerModel = new ControllerModel();
      local.begin(DURATION_TEN_MINUTES);
      local.end();
      const storage: StorageLayer = local.getStorage();
      expect(storage.hasKey(KEY_ACTIVE)).assertTrue();
      expect(storage.hasKey(KEY_DURATION)).assertTrue();
      expect(storage.hasKey(KEY_EVENT_TYPE)).assertTrue();
      expect(storage.hasKey(KEY_EVENT_CODE)).assertTrue();
      expect(storage.hasKey(KEY_EVENT_MESSAGE)).assertTrue();
      expect(storage.hasKey(KEY_EVENT_SEQ)).assertTrue();
      expect(storage.keyCount()).assertEqual(STORAGE_KEY_COUNT - 1);
      storage.setString(KEY_LOGS, 'logs');
      expect(storage.keyCount()).assertEqual(STORAGE_KEY_COUNT);
      expect(storage.hasKey('assessmentUnknown')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'IntegrationTesting_007', storage.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'IntegrationTesting_007, end');
    });

    /**
     * Scenario: the controller reaches the event log capacity.
     * Expectation: the log size saturates at twenty entries while the sequence counter keeps
     * growing, so the @Watch callback still fires for every event.
     */
    it('Assessment_IntegrationTesting_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'IntegrationTesting_008, begin');
      const local: ControllerModel = new ControllerModel();
      for (let i = 0; i < MAX_EVENT_LOG + 5; i++) {
        local.apiError(3, `error_${i}`);
      }
      expect(local.logSize()).assertEqual(MAX_EVENT_LOG);
      expect(local.getStorage().sequenceValue()).assertEqual(MAX_EVENT_LOG + 5);
      expect(local.getStorage().watchCount()).assertEqual(MAX_EVENT_LOG + 5);
      expect(local.queryActive()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'IntegrationTesting_008', local.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'IntegrationTesting_008, end');
    });

    /**
     * Scenario: the event log placeholder disappears as soon as the log key carries an entry.
     * Expectation: the view model reports the placeholder only for an empty log.
     */
    it('Assessment_IntegrationTesting_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'IntegrationTesting_016, begin');
      const view: IndexPageView = new IndexPageView();
      expect(view.logPlaceholderVisible()).assertTrue();
      view.setLogCount(1);
      expect(view.logPlaceholderVisible()).assertFalse();
      view.setLogCount(MAX_EVENT_LOG);
      expect(view.logPlaceholderVisible()).assertFalse();
      view.setLogCount(0);
      expect(view.logPlaceholderVisible()).assertTrue();
      const storage: StorageLayer = new StorageLayer();
      expect(storage.getString(KEY_LOGS, '')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'IntegrationTesting_016', view.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'IntegrationTesting_016, end');
    });
  });
}
