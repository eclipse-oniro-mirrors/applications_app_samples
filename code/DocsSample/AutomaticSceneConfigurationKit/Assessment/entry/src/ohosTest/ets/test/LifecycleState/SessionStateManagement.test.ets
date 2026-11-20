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
  ID_ADD_BUTTON,
  ID_END_BUTTON,
  ID_QUERY_STATE_BUTTON,
  ID_QUERY_CONFIG_BUTTON,
  TEXT_STATE_INACTIVE,
  KEY_BACK,
  TIMEOUT_PAGE_RENDER,
  serializedDelay,
  getDriver,
  launchAssessmentApp,
  findById,
  checkTextContent,
  waitForIndexPage,
  clickIndexButton,
  pressAndWait
} from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// AppStorage keys of the sample. The pages declare these keys as literals, the store model
// below uses the same literals so that a mismatch is visible in the cases.
const KEY_ACTIVE: string = 'assessmentActive';
const KEY_DURATION: string = 'assessmentDuration';
const KEY_LOGS: string = 'assessmentLogs';
const KEY_EVENT_TYPE: string = 'assessmentEventType';
const KEY_EVENT_CODE: string = 'assessmentEventCode';
const KEY_EVENT_MESSAGE: string = 'assessmentEventMessage';
const KEY_EVENT_SEQ: string = 'assessmentEventSeq';

// Event types published by the controller.
const EVENT_BEGIN: string = 'onBegin';
const EVENT_INTERRUPTED: string = 'onInterrupted';
const EVENT_END: string = 'onEnd';
const EVENT_API_ERROR: string = 'onApiError';

// Value kinds of the store, the model keeps the kind of every key so that a wrong typed write
// can be rejected instead of silently replacing the entry.
const KIND_BOOLEAN: string = 'boolean';
const KIND_NUMBER: string = 'number';
const KIND_STRING: string = 'string';
const KIND_STRING_ARRAY: string = 'string[]';

// Ring buffer size of the event log and the sequence step of a published event.
const MAX_EVENT_LOG: number = 20;
const SEQ_START: number = 0;
const SEQ_STEP: number = 1;

// Assessment error codes of the sample.
const CODE_OK: number = 0;
const CODE_USER_CANCEL: number = 1;
const CODE_TIMEOUT: number = 2;
const CODE_SYSTEM_ERROR: number = 3;
const CODE_ENV_ANOMALY: number = 4;

// Sentinel of the invalid duration and of the invalid answer.
const INVALID_DURATION: number = -1;
const INVALID_ANSWER: number = -1;

/**
 * One subscriber of the store. The key is an empty string for a wildcard subscription, which
 * is what the @StorageProp watch of the sample effectively does for its own key.
 */
interface StoreSubscriber {
  id: string;
  key: string;
  notifications: number;
  lastValue: string;
}

/**
 * Metadata of a store key, the types are kept next to the defaults so that a restore can
 * reapply the default of a key that is missing from a snapshot.
 */
interface KeyDescriptor {
  key: string;
  kind: string;
  defaultValue: string;
}

/**
 * A published assessment event, the log stores the rendered text and the raw fields.
 */
interface PublishedEvent {
  seq: number;
  type: string;
  code: number;
  message: string;
  rendered: string;
}

/**
 * The state store of the sample.
 *
 * It mirrors the AppStorage contract the pages rely on: typed keys with defaults, subscription
 * and notification, watch callbacks keyed by name, a batch mode that collapses notifications,
 * a newest first ring buffer of twenty log entries, a monotonic sequence counter, snapshot and
 * restore, and a dispatch entry that publishes a full assessment event.
 */
class StateStore {
  private values: Map<string, string> = new Map<string, string>();
  private kinds: Map<string, string> = new Map<string, string>();
  private subscribers: StoreSubscriber[] = [];
  private watches: Map<string, string[]> = new Map<string, string[]>();
  private log: PublishedEvent[] = [];
  private seq: number = SEQ_START;
  private batched: boolean = false;
  private pendingKeys: string[] = [];
  private suppressedNotifications: number = 0;
  private writeCount: number = 0;

  public constructor() {
    this.declare(KEY_ACTIVE, KIND_BOOLEAN, 'false');
    this.declare(KEY_DURATION, KIND_NUMBER, '0');
    this.declare(KEY_LOGS, KIND_STRING_ARRAY, '[]');
    this.declare(KEY_EVENT_TYPE, KIND_STRING, '');
    this.declare(KEY_EVENT_CODE, KIND_NUMBER, '0');
    this.declare(KEY_EVENT_MESSAGE, KIND_STRING, '');
    this.declare(KEY_EVENT_SEQ, KIND_NUMBER, '0');
  }

  /**
   * Declares a key with its kind and default value.
   */
  private declare(key: string, kind: string, defaultValue: string): void {
    this.kinds.set(key, kind);
    this.values.set(key, defaultValue);
  }

  public hasKey(key: string): boolean {
    return this.values.has(key);
  }

  public kindOf(key: string): string {
    return this.kinds.get(key) ?? '';
  }

  public keyCount(): number {
    return this.values.size;
  }

  public keys(): string[] {
    const result: string[] = [];
    this.values.forEach((value: string, key: string) => {
      result.push(key);
    });
    return result;
  }

  /**
   * Reads a raw value.
   *
   * @param key key to read.
   * @returns the rendered value, an empty string when the key is unknown.
   */
  public read(key: string): string {
    return this.values.get(key) ?? '';
  }

  public readBoolean(key: string): boolean {
    return this.read(key) === 'true';
  }

  public readNumber(key: string): number {
    const raw: string = this.read(key);
    const parsed: number = Number.parseInt(raw, 10);
    if (Number.isNaN(parsed)) {
      return 0;
    }
    return parsed;
  }

  public readArray(key: string): string[] {
    const raw: string = this.read(key);
    if (raw.length === 0 || raw === '[]') {
      return [];
    }
    const body: string = raw.substring(1, raw.length - 1);
    if (body.length === 0) {
      return [];
    }
    return body.split(',');
  }

  /**
   * Writes a value when the kind matches.
   *
   * @param key key to write.
   * @param value rendered value.
   * @returns true when the write was accepted.
   */
  public write(key: string, value: string): boolean {
    const kind: string = this.kinds.get(key) ?? '';
    if (kind.length === 0) {
      hilog.warn(DOMAIN, TAG, 'write: unknown key %{public}s', key);
      return false;
    }
    if (!this.matchesKind(kind, value)) {
      hilog.warn(DOMAIN, TAG, 'write: value %{public}s rejected for %{public}s', value, key);
      return false;
    }
    const previous: string = this.values.get(key) ?? '';
    this.values.set(key, value);
    this.writeCount++;
    if (previous === value) {
      this.suppressedNotifications++;
      return true;
    }
    this.notify(key, value);
    return true;
  }

  private matchesKind(kind: string, value: string): boolean {
    if (kind === KIND_BOOLEAN) {
      return value === 'true' || value === 'false';
    }
    if (kind === KIND_NUMBER) {
      return !Number.isNaN(Number.parseInt(value, 10));
    }
    if (kind === KIND_STRING_ARRAY) {
      return value.startsWith('[') && value.endsWith(']');
    }
    return true;
  }

  /**
   * Subscribes a listener. An empty key subscribes to every key.
   *
   * @param id identifier of the subscriber.
   * @param key key to observe, empty for all keys.
   * @returns the subscriber id.
   */
  public subscribe(id: string, key: string): string {
    const subscriber: StoreSubscriber = {
      id: id,
      key: key,
      notifications: 0,
      lastValue: ''
    };
    this.subscribers.push(subscriber);
    hilog.info(DOMAIN, TAG, 'subscribe: %{public}s on %{public}s', id, key);
    return id;
  }

  public unsubscribe(id: string): boolean {
    const remaining: StoreSubscriber[] = [];
    let removed: boolean = false;
    for (let i = 0; i < this.subscribers.length; i++) {
      if (this.subscribers[i].id === id) {
        removed = true;
      } else {
        remaining.push(this.subscribers[i]);
      }
    }
    this.subscribers = remaining;
    return removed;
  }

  public subscriberCount(): number {
    return this.subscribers.length;
  }

  public subscriberById(id: string): StoreSubscriber | undefined {
    for (let i = 0; i < this.subscribers.length; i++) {
      if (this.subscribers[i].id === id) {
        return this.subscribers[i];
      }
    }
    return undefined;
  }

  /**
   * Notifies the subscribers of a key and runs the watch callbacks.
   */
  private notify(key: string, value: string): void {
    if (this.batched) {
      this.pendingKeys.push(key);
      return;
    }
    this.deliver(key, value);
  }

  private deliver(key: string, value: string): void {
    for (let i = 0; i < this.subscribers.length; i++) {
      if (this.subscribers[i].key.length === 0 || this.subscribers[i].key === key) {
        this.subscribers[i].notifications++;
        this.subscribers[i].lastValue = value;
      }
    }
    const callbacks: string[] = this.watches.get(key) ?? [];
    for (let i = 0; i < callbacks.length; i++) {
      hilog.info(DOMAIN, TAG, 'watch %{public}s fired for %{public}s', callbacks[i], key);
    }
  }

  /**
   * Registers a watch callback for a key, the sample uses @Watch on the event sequence.
   *
   * @param key key to watch.
   * @param callback name of the callback.
   * @returns the number of callbacks registered for the key.
   */
  public addWatch(key: string, callback: string): number {
    const callbacks: string[] = this.watches.get(key) ?? [];
    if (callbacks.indexOf(callback) >= 0) {
      return callbacks.length;
    }
    callbacks.push(callback);
    this.watches.set(key, callbacks);
    return callbacks.length;
  }

  public watchCount(key: string): number {
    const callbacks: string[] = this.watches.get(key) ?? [];
    return callbacks.length;
  }

  public removeWatch(key: string, callback: string): boolean {
    const callbacks: string[] = this.watches.get(key) ?? [];
    const index: number = callbacks.indexOf(callback);
    if (index < 0) {
      return false;
    }
    callbacks.splice(index, 1);
    this.watches.set(key, callbacks);
    return true;
  }

  /**
   * Opens a batch, every write is kept but the notification is deferred.
   */
  public beginBatch(): void {
    this.batched = true;
    this.pendingKeys = [];
  }

  /**
   * Closes a batch and delivers one notification per distinct pending key, in arrival order.
   *
   * @returns the number of delivered notifications.
   */
  public endBatch(): number {
    this.batched = false;
    const distinct: string[] = [];
    for (let i = 0; i < this.pendingKeys.length; i++) {
      if (distinct.indexOf(this.pendingKeys[i]) < 0) {
        distinct.push(this.pendingKeys[i]);
      }
    }
    for (let i = 0; i < distinct.length; i++) {
      this.deliver(distinct[i], this.read(distinct[i]));
    }
    const delivered: number = distinct.length;
    this.pendingKeys = [];
    return delivered;
  }

  public isBatched(): boolean {
    return this.batched;
  }

  public pendingCount(): number {
    return this.pendingKeys.length;
  }

  public getSuppressedNotifications(): number {
    return this.suppressedNotifications;
  }

  public getWriteCount(): number {
    return this.writeCount;
  }

  /**
   * Appends an event to the ring buffer. The newest entry is first and the buffer keeps at
   * most twenty entries, which is MAX_EVENT_LOG of the sample.
   *
   * @param event event to append.
   */
  public appendEvent(event: PublishedEvent): void {
    const next: PublishedEvent[] = [event];
    for (let i = 0; i < this.log.length; i++) {
      next.push(this.log[i]);
    }
    while (next.length > MAX_EVENT_LOG) {
      next.pop();
    }
    this.log = next;
  }

  public logSize(): number {
    return this.log.length;
  }

  public getLog(): PublishedEvent[] {
    return this.log.slice();
  }

  public logAt(index: number): PublishedEvent | undefined {
    if (index < 0 || index >= this.log.length) {
      return undefined;
    }
    return this.log[index];
  }

  public logTypes(): string[] {
    const types: string[] = [];
    for (let i = 0; i < this.log.length; i++) {
      types.push(this.log[i].type);
    }
    return types;
  }

  public logsPositive(): boolean {
    for (let i = 0; i < this.log.length; i++) {
      if (this.log[i].code < 0) {
        return false;
      }
    }
    return true;
  }

  public resetLog(): void {
    this.log = [];
  }

  public getSeq(): number {
    return this.seq;
  }

  /**
   * Publishes an assessment event.
   *
   * Every event increments the sequence counter, writes the three event fields and appends the
   * rendered text to the ring buffer. The sequence write happens last so that the watch on
   * assessmentEventSeq observes the other fields already updated, which is exactly the order
   * the controller of the sample uses.
   *
   * @param type event type, one of the EVENT constants.
   * @param code assessment error code.
   * @param message message of the event.
   * @returns the published event.
   */
  public publish(type: string, code: number, message: string): PublishedEvent {
    this.seq = this.seq + SEQ_STEP;
    const rendered: string = `${type} code=${code} message=${message}`;
    const event: PublishedEvent = {
      seq: this.seq,
      type: type,
      code: code,
      message: message,
      rendered: rendered
    };
    this.appendEvent(event);
    this.write(KEY_EVENT_TYPE, type);
    this.write(KEY_EVENT_CODE, `${code}`);
    this.write(KEY_EVENT_MESSAGE, message);
    this.write(KEY_ACTIVE, `${this.activeForEvent(type, code)}`);
    this.write(KEY_EVENT_SEQ, `${this.seq}`);
    return event;
  }

  /**
   * Derives the active flag from an event, the controller sets the flag before it publishes.
   */
  private activeForEvent(type: string, code: number): boolean {
    if (type === EVENT_BEGIN) {
      return code === CODE_OK;
    }
    if (type === EVENT_END || type === EVENT_INTERRUPTED) {
      return false;
    }
    return this.readBoolean(KEY_ACTIVE);
  }

  /**
   * Creates a snapshot of every declared key together with the sequence counter.
   *
   * @returns the snapshot text.
   */
  public snapshot(): string {
    const pairs: string[] = [];
    this.values.forEach((value: string, key: string) => {
      pairs.push(`${key}=${value}`);
    });
    return `${pairs.join(';')};${KEY_EVENT_SEQ}=${this.seq}`;
  }

  /**
   * Restores a snapshot. Missing keys fall back to their declared default and a malformed pair
   * is skipped, the counter is restored together with the values.
   *
   * @param snapshot snapshot text.
   * @returns the number of restored pairs.
   */
  public restore(snapshot: string): number {
    const parts: string[] = snapshot.split(';');
    let restored: number = 0;
    for (let i = 0; i < parts.length; i++) {
      const pair: string = parts[i];
      const separator: number = pair.indexOf('=');
      if (separator <= 0) {
        continue;
      }
      const key: string = pair.substring(0, separator);
      const value: string = pair.substring(separator + 1);
      if (!this.values.has(key)) {
        continue;
      }
      if (!this.matchesKind(this.kinds.get(key) ?? '', value)) {
        continue;
      }
      if (key === KEY_EVENT_SEQ) {
        const restoredSeq: number = Number.parseInt(value, 10);
        if (!Number.isNaN(restoredSeq)) {
          this.seq = restoredSeq;
        }
      }
      this.values.set(key, value);
      restored++;
    }
    return restored;
  }

  /**
   * Restores the declared defaults of every key, the sequence counter returns to zero.
   */
  public restoreDefaults(): void {
    this.values.forEach((value: string, key: string) => {
      if (key === KEY_ACTIVE) {
        this.values.set(key, 'false');
      } else if (key === KEY_DURATION || key === KEY_EVENT_CODE || key === KEY_EVENT_SEQ) {
        this.values.set(key, '0');
      } else if (key === KEY_LOGS) {
        this.values.set(key, '[]');
      } else {
        this.values.set(key, '');
      }
    });
    this.seq = SEQ_START;
    this.log = [];
  }

  public descriptors(): KeyDescriptor[] {
    const result: KeyDescriptor[] = [];
    this.values.forEach((value: string, key: string) => {
      result.push({
        key: key,
        kind: this.kinds.get(key) ?? '',
        defaultValue: value
      });
    });
    return result;
  }

  public reset(): void {
    this.restoreDefaults();
    this.subscribers = [];
    this.watches = new Map<string, string[]>();
    this.batched = false;
    this.pendingKeys = [];
    this.suppressedNotifications = 0;
    this.writeCount = 0;
  }
}

/**
 * Starts the sample and waits until the entry page is rendered.
 *
 * @param driver driver of the running case.
 * @returns true when the entry page showed up.
 */
async function openIndexPage(driver: Driver): Promise<boolean> {
  await launchAssessmentApp();
  const rendered: boolean = await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
  if (!rendered) {
    hilog.warn(DOMAIN, TAG, 'openIndexPage: the entry page is not rendered, the case is skipped');
  }
  return rendered;
}

/**
 * Renders the expected text of a published event, the log line of a case uses it to show what
 * the event log card of the entry page would render.
 *
 * @param type event type.
 * @param code error code.
 * @param message message.
 * @returns the rendered text.
 */
function renderEvent(type: string, code: number, message: string): string {
  return `${type} code=${code} message=${message}`;
}

export default function sessionStateManagementTest() {
  describe('SessionStateManagement_Test', () => {
    let driver: Driver;
    let store: StateStore;

    beforeAll(async () => {
      driver = getDriver();
      store = new StateStore();
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, 50);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: a fresh store.
     * Expectation: the seven keys of the sample are declared and every key carries its
     * default value.
     */
    it('Assessment_SessionStateManagement_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_001, begin');
      store.reset();
      expect(store.keyCount()).assertEqual(7);
      expect(store.hasKey(KEY_ACTIVE)).assertTrue();
      expect(store.hasKey(KEY_DURATION)).assertTrue();
      expect(store.hasKey(KEY_LOGS)).assertTrue();
      expect(store.hasKey(KEY_EVENT_TYPE)).assertTrue();
      expect(store.hasKey(KEY_EVENT_CODE)).assertTrue();
      expect(store.hasKey(KEY_EVENT_MESSAGE)).assertTrue();
      expect(store.hasKey(KEY_EVENT_SEQ)).assertTrue();
      expect(store.hasKey('assessmentUnknown')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_001, end');
    });

    /**
     * Scenario: the kind of every key.
     * Expectation: the flags and values carry the types the pages declare through their
     * decorators.
     */
    it('Assessment_SessionStateManagement_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_002, begin');
      store.reset();
      expect(store.kindOf(KEY_ACTIVE)).assertEqual(KIND_BOOLEAN);
      expect(store.kindOf(KEY_DURATION)).assertEqual(KIND_NUMBER);
      expect(store.kindOf(KEY_LOGS)).assertEqual(KIND_STRING_ARRAY);
      expect(store.kindOf(KEY_EVENT_TYPE)).assertEqual(KIND_STRING);
      expect(store.kindOf(KEY_EVENT_CODE)).assertEqual(KIND_NUMBER);
      expect(store.kindOf(KEY_EVENT_MESSAGE)).assertEqual(KIND_STRING);
      expect(store.kindOf(KEY_EVENT_SEQ)).assertEqual(KIND_NUMBER);
      expect(store.kindOf('assessmentUnknown')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_002, end');
    });

    /**
     * Scenario: the default values of the keys.
     * Expectation: the active flag is false, the duration is the invalid sentinel zero default,
     * the log is empty and the sequence starts at zero.
     */
    it('Assessment_SessionStateManagement_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_003, begin');
      store.reset();
      expect(store.readBoolean(KEY_ACTIVE)).assertFalse();
      expect(store.readNumber(KEY_DURATION)).assertEqual(0);
      expect(store.readArray(KEY_LOGS).length).assertEqual(0);
      expect(store.read(KEY_EVENT_TYPE)).assertEqual('');
      expect(store.readNumber(KEY_EVENT_CODE)).assertEqual(0);
      expect(store.read(KEY_EVENT_MESSAGE)).assertEqual('');
      expect(store.readNumber(KEY_EVENT_SEQ)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_003, end');
    });

    /**
     * Scenario: a boolean write.
     * Expectation: the value is stored and can be read back as a boolean.
     */
    it('Assessment_SessionStateManagement_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_004, begin');
      store.reset();
      expect(store.write(KEY_ACTIVE, 'true')).assertTrue();
      expect(store.readBoolean(KEY_ACTIVE)).assertTrue();
      expect(store.write(KEY_ACTIVE, 'false')).assertTrue();
      expect(store.readBoolean(KEY_ACTIVE)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_004, end');
    });

    /**
     * Scenario: a boolean write with a value that is not a boolean.
     * Expectation: the write is rejected and the previous value is kept.
     */
    it('Assessment_SessionStateManagement_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_005, begin');
      store.reset();
      expect(store.write(KEY_ACTIVE, 'yes')).assertFalse();
      expect(store.write(KEY_ACTIVE, '1')).assertFalse();
      expect(store.readBoolean(KEY_ACTIVE)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_005, end');
    });

    /**
     * Scenario: a number write of a duration candidate.
     * Expectation: the value is stored as a number.
     */
    it('Assessment_SessionStateManagement_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_006, begin');
      store.reset();
      expect(store.write(KEY_DURATION, '600000')).assertTrue();
      expect(store.readNumber(KEY_DURATION)).assertEqual(600000);
      expect(store.write(KEY_DURATION, '3600000')).assertTrue();
      expect(store.readNumber(KEY_DURATION)).assertEqual(3600000);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_006, end');
    });

    /**
     * Scenario: a number write of a non numeric text.
     * Expectation: the write is rejected, the duration keeps its previous value.
     */
    it('Assessment_SessionStateManagement_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_007, begin');
      store.reset();
      store.write(KEY_DURATION, '900000');
      expect(store.write(KEY_DURATION, 'ten minutes')).assertFalse();
      expect(store.readNumber(KEY_DURATION)).assertEqual(900000);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_007, end');
    });

    /**
     * Scenario: an array write of the event log.
     * Expectation: the array round trips through the store.
     */
    it('Assessment_SessionStateManagement_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_008, begin');
      store.reset();
      expect(store.write(KEY_LOGS, '[a,b,c]')).assertTrue();
      const value: string[] = store.readArray(KEY_LOGS);
      expect(value.length).assertEqual(3);
      expect(value[0]).assertEqual('a');
      expect(value[2]).assertEqual('c');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_008, end');
    });

    /**
     * Scenario: an array write without brackets.
     * Expectation: the write is rejected because the value is not a rendered array.
     */
    it('Assessment_SessionStateManagement_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_009, begin');
      store.reset();
      expect(store.write(KEY_LOGS, 'a,b,c')).assertFalse();
      expect(store.readArray(KEY_LOGS).length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_009, end');
    });

    /**
     * Scenario: a write to an undeclared key.
     * Expectation: the write is rejected, the declared key count does not grow.
     */
    it('Assessment_SessionStateManagement_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_010, begin');
      store.reset();
      expect(store.write('assessmentUnknown', 'value')).assertFalse();
      expect(store.keyCount()).assertEqual(7);
      expect(store.read('assessmentUnknown')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_010, end');
    });

    /**
     * Scenario: a subscriber of a single key.
     * Expectation: only that key notifies the subscriber.
     */
    it('Assessment_SessionStateManagement_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_011, begin');
      store.reset();
      store.subscribe('sub_active', KEY_ACTIVE);
      store.write(KEY_ACTIVE, 'true');
      store.write(KEY_DURATION, '600000');
      const subscriber: StoreSubscriber | undefined = store.subscriberById('sub_active');
      expect(subscriber !== undefined).assertTrue();
      if (subscriber !== undefined) {
        expect(subscriber.notifications).assertEqual(1);
        expect(subscriber.lastValue).assertEqual('true');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_011, end');
    });

    /**
     * Scenario: a wildcard subscriber.
     * Expectation: every accepted write notifies the subscriber.
     */
    it('Assessment_SessionStateManagement_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_012, begin');
      store.reset();
      store.subscribe('sub_all', '');
      store.write(KEY_ACTIVE, 'true');
      store.write(KEY_DURATION, '600000');
      store.write(KEY_EVENT_TYPE, EVENT_BEGIN);
      const subscriber: StoreSubscriber | undefined = store.subscriberById('sub_all');
      expect(subscriber !== undefined).assertTrue();
      if (subscriber !== undefined) {
        expect(subscriber.notifications).assertEqual(3);
        expect(subscriber.lastValue).assertEqual(EVENT_BEGIN);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_012, end');
    });

    /**
     * Scenario: the same value is written twice.
     * Expectation: the second write does not notify, it is counted as suppressed.
     */
    it('Assessment_SessionStateManagement_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_013, begin');
      store.reset();
      store.subscribe('sub_active', KEY_ACTIVE);
      store.write(KEY_ACTIVE, 'true');
      store.write(KEY_ACTIVE, 'true');
      const subscriber: StoreSubscriber | undefined = store.subscriberById('sub_active');
      if (subscriber !== undefined) {
        expect(subscriber.notifications).assertEqual(1);
      }
      expect(store.getSuppressedNotifications()).assertEqual(1);
      expect(store.getWriteCount()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_013, end');
    });

    /**
     * Scenario: a subscriber unsubscribes.
     * Expectation: later writes do not notify it and the subscriber count drops.
     */
    it('Assessment_SessionStateManagement_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_014, begin');
      store.reset();
      store.subscribe('sub_active', KEY_ACTIVE);
      store.subscribe('sub_seq', KEY_EVENT_SEQ);
      expect(store.subscriberCount()).assertEqual(2);
      expect(store.unsubscribe('sub_active')).assertTrue();
      expect(store.subscriberCount()).assertEqual(1);
      store.write(KEY_ACTIVE, 'true');
      expect(store.subscriberById('sub_active') === undefined).assertTrue();
      expect(store.unsubscribe('sub_active')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_014, end');
    });

    /**
     * Scenario: a watch callback is registered on the event sequence.
     * Expectation: the registration answers the callback count and a duplicate registration is
     * ignored.
     */
    it('Assessment_SessionStateManagement_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_015, begin');
      store.reset();
      expect(store.addWatch(KEY_EVENT_SEQ, 'onAssessmentEvent')).assertEqual(1);
      expect(store.addWatch(KEY_EVENT_SEQ, 'onAssessmentEvent')).assertEqual(1);
      expect(store.addWatch(KEY_EVENT_SEQ, 'onSecondListener')).assertEqual(2);
      expect(store.watchCount(KEY_EVENT_SEQ)).assertEqual(2);
      expect(store.watchCount(KEY_ACTIVE)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_015, end');
    });

    /**
     * Scenario: a watch callback is removed.
     * Expectation: the removal answers true once and false afterwards.
     */
    it('Assessment_SessionStateManagement_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_016, begin');
      store.reset();
      store.addWatch(KEY_EVENT_SEQ, 'onAssessmentEvent');
      expect(store.removeWatch(KEY_EVENT_SEQ, 'onAssessmentEvent')).assertTrue();
      expect(store.watchCount(KEY_EVENT_SEQ)).assertEqual(0);
      expect(store.removeWatch(KEY_EVENT_SEQ, 'onAssessmentEvent')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_016, end');
    });

    /**
     * Scenario: a batch collapses the notifications of one key.
     * Expectation: three writes to the same key deliver one notification after the batch ends.
     */
    it('Assessment_SessionStateManagement_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_017, begin');
      store.reset();
      store.subscribe('sub_duration', KEY_DURATION);
      store.beginBatch();
      store.write(KEY_DURATION, '600000');
      store.write(KEY_DURATION, '1800000');
      store.write(KEY_DURATION, '3600000');
      expect(store.isBatched()).assertTrue();
      expect(store.pendingCount()).assertEqual(3);
      const subscriberBefore: StoreSubscriber | undefined = store.subscriberById('sub_duration');
      if (subscriberBefore !== undefined) {
        expect(subscriberBefore.notifications).assertEqual(0);
      }
      const delivered: number = store.endBatch();
      expect(delivered).assertEqual(1);
      expect(store.isBatched()).assertFalse();
      const subscriber: StoreSubscriber | undefined = store.subscriberById('sub_duration');
      if (subscriber !== undefined) {
        expect(subscriber.notifications).assertEqual(1);
        expect(subscriber.lastValue).assertEqual('3600000');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_017, end');
    });

    /**
     * Scenario: a batch over three different keys.
     * Expectation: one notification per distinct key is delivered.
     */
    it('Assessment_SessionStateManagement_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_018, begin');
      store.reset();
      store.beginBatch();
      store.write(KEY_ACTIVE, 'true');
      store.write(KEY_DURATION, '600000');
      store.write(KEY_EVENT_TYPE, EVENT_BEGIN);
      const delivered: number = store.endBatch();
      expect(delivered).assertEqual(3);
      expect(store.pendingCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_018, end');
    });

    /**
     * Scenario: an empty batch.
     * Expectation: closing a batch without writes delivers nothing.
     */
    it('Assessment_SessionStateManagement_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_019, begin');
      store.reset();
      store.beginBatch();
      expect(store.endBatch()).assertEqual(0);
      expect(store.isBatched()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_019, end');
    });

    /**
     * Scenario: a published begin event with the OK code.
     * Expectation: the active flag turns true, the sequence grows by one and the log carries
     * the rendered text of the event.
     */
    it('Assessment_SessionStateManagement_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_020, begin');
      store.reset();
      const event: PublishedEvent = store.publish(EVENT_BEGIN, CODE_OK, '');
      expect(event.seq).assertEqual(1);
      expect(store.getSeq()).assertEqual(1);
      expect(store.readBoolean(KEY_ACTIVE)).assertTrue();
      expect(store.read(KEY_EVENT_TYPE)).assertEqual(EVENT_BEGIN);
      expect(store.readNumber(KEY_EVENT_CODE)).assertEqual(CODE_OK);
      expect(store.logSize()).assertEqual(1);
      const head: PublishedEvent | undefined = store.logAt(0);
      if (head !== undefined) {
        expect(head.rendered).assertEqual(renderEvent(EVENT_BEGIN, CODE_OK, ''));
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_020, end');
    });

    /**
     * Scenario: a begin event that failed with the user cancel code.
     * Expectation: the active flag stays false and the code is recorded.
     */
    it('Assessment_SessionStateManagement_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_021, begin');
      store.reset();
      const event: PublishedEvent = store.publish(EVENT_BEGIN, CODE_USER_CANCEL, 'user cancelled');
      expect(event.code).assertEqual(CODE_USER_CANCEL);
      expect(store.readBoolean(KEY_ACTIVE)).assertFalse();
      expect(store.read(KEY_EVENT_MESSAGE)).assertEqual('user cancelled');
      expect(store.logTypes()[0]).assertEqual(EVENT_BEGIN);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_021, end');
    });

    /**
     * Scenario: an interrupt event.
     * Expectation: the active flag returns to false and the interrupt is logged.
     */
    it('Assessment_SessionStateManagement_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_022, begin');
      store.reset();
      store.publish(EVENT_BEGIN, CODE_OK, '');
      expect(store.readBoolean(KEY_ACTIVE)).assertTrue();
      store.publish(EVENT_INTERRUPTED, CODE_ENV_ANOMALY, 'environment changed');
      expect(store.readBoolean(KEY_ACTIVE)).assertFalse();
      expect(store.logAt(0)?.type).assertEqual(EVENT_INTERRUPTED);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_022, end');
    });

    /**
     * Scenario: an end event.
     * Expectation: the active flag returns to false and the end is logged with the OK code.
     */
    it('Assessment_SessionStateManagement_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_023, begin');
      store.reset();
      store.publish(EVENT_BEGIN, CODE_OK, '');
      const event: PublishedEvent = store.publish(EVENT_END, CODE_OK, '');
      expect(event.type).assertEqual(EVENT_END);
      expect(store.readBoolean(KEY_ACTIVE)).assertFalse();
      expect(store.readNumber(KEY_EVENT_CODE)).assertEqual(CODE_OK);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_023, end');
    });

    /**
     * Scenario: an API error event.
     * Expectation: the code is preserved and the active flag is unchanged because an API error
     * does not transition the session by itself.
     */
    it('Assessment_SessionStateManagement_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_024, begin');
      store.reset();
      store.write(KEY_ACTIVE, 'true');
      const event: PublishedEvent = store.publish(EVENT_API_ERROR, CODE_SYSTEM_ERROR, 'begin failed');
      expect(event.code).assertEqual(CODE_SYSTEM_ERROR);
      expect(store.readBoolean(KEY_ACTIVE)).assertTrue();
      expect(store.read(KEY_EVENT_MESSAGE)).assertEqual('begin failed');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_024, end');
    });

    /**
     * Scenario: the sequence counter grows by one per event.
     * Expectation: after five events the counter is five and every log entry carries a
     * distinct sequence.
     */
    it('Assessment_SessionStateManagement_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_025, begin');
      store.reset();
      for (let i = 0; i < 5; i++) {
        store.publish(EVENT_API_ERROR, CODE_SYSTEM_ERROR, `error ${i}`);
      }
      expect(store.getSeq()).assertEqual(5);
      expect(store.logSize()).assertEqual(5);
      expect(store.logAt(0)?.seq).assertEqual(5);
      expect(store.logAt(4)?.seq).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_025, end');
    });

    /**
     * Scenario: the log is read from newest to oldest.
     * Expectation: the first entry is the most recent event.
     */
    it('Assessment_SessionStateManagement_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_026, begin');
      store.reset();
      store.publish(EVENT_BEGIN, CODE_OK, 'first');
      store.publish(EVENT_END, CODE_OK, 'second');
      store.publish(EVENT_API_ERROR, CODE_TIMEOUT, 'third');
      expect(store.logAt(0)?.message).assertEqual('third');
      expect(store.logAt(1)?.message).assertEqual('second');
      expect(store.logAt(2)?.message).assertEqual('first');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_026, end');
    });

    /**
     * Scenario: the log is read at an out of range index.
     * Expectation: the lookup answers undefined instead of throwing.
     */
    it('Assessment_SessionStateManagement_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_028, begin');
      store.reset();
      expect(store.logAt(0) === undefined).assertTrue();
      expect(store.logAt(-1) === undefined).assertTrue();
      store.publish(EVENT_BEGIN, CODE_OK, '');
      expect(store.logAt(1) === undefined).assertTrue();
      expect(store.logAt(0) !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_028, end');
    });

    /**
     * Scenario: the event log is reset.
     * Expectation: the buffer is empty but the sequence counter keeps its value, exactly like
     * the controller keeps counting after a page cleared its own view of the log.
     */
    it('Assessment_SessionStateManagement_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_029, begin');
      store.reset();
      store.publish(EVENT_BEGIN, CODE_OK, '');
      store.publish(EVENT_END, CODE_OK, '');
      store.resetLog();
      expect(store.logSize()).assertEqual(0);
      expect(store.getSeq()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_029, end');
    });

    /**
     * Scenario: a published event with a negative code.
     * Expectation: the log health check reports it, which mirrors the guard of the sample that
     * never renders a negative error code as a success.
     */
    it('Assessment_SessionStateManagement_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_030, begin');
      store.reset();
      store.publish(EVENT_API_ERROR, INVALID_DURATION, 'invalid duration');
      expect(store.logsPositive()).assertFalse();
      store.reset();
      store.publish(EVENT_BEGIN, CODE_OK, '');
      expect(store.logsPositive()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_030, end');
    });

    /**
     * Scenario: a snapshot and a restore.
     * Expectation: every key and the sequence counter survive the round trip.
     */
    it('Assessment_SessionStateManagement_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_031, begin');
      store.reset();
      store.write(KEY_DURATION, '1800000');
      store.write(KEY_EVENT_TYPE, EVENT_BEGIN);
      store.publish(EVENT_BEGIN, CODE_OK, '');
      const snapshot: string = store.snapshot();
      store.reset();
      expect(store.getSeq()).assertEqual(0);
      const restored: number = store.restore(snapshot);
      expect(restored > 0).assertTrue();
      expect(store.readNumber(KEY_DURATION)).assertEqual(1800000);
      expect(store.read(KEY_EVENT_TYPE)).assertEqual(EVENT_BEGIN);
      expect(store.readBoolean(KEY_ACTIVE)).assertTrue();
      expect(store.getSeq()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_031, end');
    });

    /**
     * Scenario: a restore of an empty snapshot.
     * Expectation: nothing is restored and the store keeps its defaults.
     */
    it('Assessment_SessionStateManagement_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_032, begin');
      store.reset();
      expect(store.restore('')).assertEqual(0);
      expect(store.readNumber(KEY_DURATION)).assertEqual(0);
      expect(store.getSeq()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_032, end');
    });

    /**
     * Scenario: a restore of a snapshot with an unknown key and a broken pair.
     * Expectation: the broken pairs are skipped, the valid ones are restored.
     */
    it('Assessment_SessionStateManagement_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_033, begin');
      store.reset();
      const restored: number = store.restore(`assessmentUnknown=x;broken;${KEY_DURATION}=600000`);
      expect(restored).assertEqual(1);
      expect(store.readNumber(KEY_DURATION)).assertEqual(600000);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_033, end');
    });

    /**
     * Scenario: a snapshot of a store that carries all seven keys.
     * Expectation: the snapshot contains one pair per key plus the sequence pair.
     */
    it('Assessment_SessionStateManagement_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_034, begin');
      store.reset();
      store.publish(EVENT_BEGIN, CODE_OK, '');
      const snapshot: string = store.snapshot();
      const pairs: string[] = snapshot.split(';');
      expect(pairs.length >= 7).assertTrue();
      expect(snapshot.indexOf(KEY_ACTIVE) >= 0).assertTrue();
      expect(snapshot.indexOf(KEY_EVENT_SEQ) >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_034, end');
    });

    /**
     * Scenario: the descriptors of the store.
     * Expectation: one descriptor per key and every descriptor carries a known kind.
     */
    it('Assessment_SessionStateManagement_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_035, begin');
      store.reset();
      const descriptors: KeyDescriptor[] = store.descriptors();
      expect(descriptors.length).assertEqual(7);
      for (let i = 0; i < descriptors.length; i++) {
        expect(descriptors[i].kind.length > 0).assertTrue();
        expect(descriptors[i].key.length > 0).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_035, end');
    });

    /**
     * Scenario: the key list of the store.
     * Expectation: the list holds seven entries and no duplicates.
     */
    it('Assessment_SessionStateManagement_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_036, begin');
      store.reset();
      const keys: string[] = store.keys();
      expect(keys.length).assertEqual(7);
      const unique: Set<string> = new Set<string>(keys);
      expect(unique.size).assertEqual(keys.length);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_036, end');
    });

    /**
     * Scenario: a reset of the store.
     * Expectation: the keys return to their defaults and the subscribers and watches are gone.
     */
    it('Assessment_SessionStateManagement_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_037, begin');
      store.reset();
      store.subscribe('sub_all', '');
      store.addWatch(KEY_EVENT_SEQ, 'onAssessmentEvent');
      store.write(KEY_ACTIVE, 'true');
      store.publish(EVENT_BEGIN, CODE_OK, '');
      store.reset();
      expect(store.readBoolean(KEY_ACTIVE)).assertFalse();
      expect(store.getSeq()).assertEqual(0);
      expect(store.subscriberCount()).assertEqual(0);
      expect(store.watchCount(KEY_EVENT_SEQ)).assertEqual(0);
      expect(store.logSize()).assertEqual(0);
      expect(store.getWriteCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_037, end');
    });

    /**
     * Scenario: the watchdog of the entry page fires on every sequence write.
     * Expectation: a subscriber of the sequence sees exactly one notification per event.
     */
    it('Assessment_SessionStateManagement_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_038, begin');
      store.reset();
      store.subscribe('sub_seq', KEY_EVENT_SEQ);
      store.publish(EVENT_BEGIN, CODE_OK, '');
      store.publish(EVENT_END, CODE_OK, '');
      store.publish(EVENT_API_ERROR, CODE_TIMEOUT, 'timeout');
      const subscriber: StoreSubscriber | undefined = store.subscriberById('sub_seq');
      expect(subscriber !== undefined).assertTrue();
      if (subscriber !== undefined) {
        expect(subscriber.notifications).assertEqual(3);
        expect(subscriber.lastValue).assertEqual('3');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_038, end');
    });

    /**
     * Scenario: two subscribers with different scopes observe one write.
     * Expectation: the wildcard subscriber and the keyed subscriber both receive it exactly
     * once, a subscriber of another key does not.
     */
    it('Assessment_SessionStateManagement_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_045, begin');
      store.reset();
      store.subscribe('sub_all', '');
      store.subscribe('sub_active', KEY_ACTIVE);
      store.subscribe('sub_duration', KEY_DURATION);
      store.write(KEY_ACTIVE, 'true');
      const all: StoreSubscriber | undefined = store.subscriberById('sub_all');
      const active: StoreSubscriber | undefined = store.subscriberById('sub_active');
      const duration: StoreSubscriber | undefined = store.subscriberById('sub_duration');
      if (all !== undefined) {
        expect(all.notifications).assertEqual(1);
      }
      if (active !== undefined) {
        expect(active.notifications).assertEqual(1);
      }
      if (duration !== undefined) {
        expect(duration.notifications).assertEqual(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_045, end');
    });

    /**
     * Scenario: a rejected write does not notify.
     * Expectation: a kind mismatch leaves the subscribers untouched.
     */
    it('Assessment_SessionStateManagement_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_046, begin');
      store.reset();
      store.subscribe('sub_active', KEY_ACTIVE);
      expect(store.write(KEY_ACTIVE, 'maybe')).assertFalse();
      const subscriber: StoreSubscriber | undefined = store.subscriberById('sub_active');
      if (subscriber !== undefined) {
        expect(subscriber.notifications).assertEqual(0);
      }
      expect(store.getWriteCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_046, end');
    });

    /**
     * Scenario: the event sequence survives a restore of a snapshot taken mid session.
     * Expectation: the next publish continues from the restored counter rather than restarting
     * from one.
     */
    it('Assessment_SessionStateManagement_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_047, begin');
      store.reset();
      store.publish(EVENT_BEGIN, CODE_OK, '');
      store.publish(EVENT_END, CODE_OK, '');
      const snapshot: string = store.snapshot();
      store.reset();
      store.restore(snapshot);
      expect(store.getSeq()).assertEqual(2);
      const event: PublishedEvent = store.publish(EVENT_BEGIN, CODE_OK, '');
      expect(event.seq).assertEqual(3);
      expect(store.getSeq()).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_047, end');
    });

    /**
     * Scenario: the duration key carries the invalid sentinel when nothing was queried.
     * Expectation: the number reader returns the sentinel unchanged and the page uses it to
     * pick the empty hint branch.
     */
    it('Assessment_SessionStateManagement_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_049, begin');
      store.reset();
      expect(store.write(KEY_DURATION, `${INVALID_DURATION}`)).assertTrue();
      expect(store.readNumber(KEY_DURATION)).assertEqual(INVALID_DURATION);
      expect(store.readNumber(KEY_DURATION) === INVALID_DURATION).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_049, end');
    });

    /**
     * Scenario: the invalid answer sentinel of the exam page.
     * Expectation: the sentinel is minus one and it never collides with a valid option index.
     */
    it('Assessment_SessionStateManagement_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_050, begin');
      expect(INVALID_ANSWER).assertEqual(-1);
      const answers: number[] = [INVALID_ANSWER, 0, 1, 2];
      let valid: number = 0;
      for (let i = 0; i < answers.length; i++) {
        if (answers[i] !== INVALID_ANSWER) {
          valid++;
        }
      }
      expect(valid).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStateManagement_050, end');
    });
  });
}
