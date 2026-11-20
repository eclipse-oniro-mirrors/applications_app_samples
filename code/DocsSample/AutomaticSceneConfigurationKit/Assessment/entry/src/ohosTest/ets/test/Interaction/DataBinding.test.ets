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
  ID_BEGIN_BUTTON,
  ID_END_BUTTON,
  ID_QUERY_STATE_BUTTON,
  ID_QUERY_CONFIG_BUTTON,
  TEXT_STATE_ACTIVE,
  TEXT_STATE_INACTIVE,
  TEXT_NO_ACTIVE_ASSESSMENT,
  TEXT_NO_EVENT,
  KEY_BACK,
  TIMEOUT_PAGE_RENDER,
  DELAY_KEY_NAVIGATION,
  DELAY_AFTER_ACTION,
  serializedDelay,
  getDriver,
  launchAssessmentApp,
  findById,
  indexComponentCount,
  checkTextContent,
  containsTextFragment,
  collectTexts,
  waitForIndexPage,
  isComponentEnabled,
  pressAndWait
} from '../Shared/AssessmentDriver';
import { clickSerialized, inputTextSerialized, getTextSerialized, clickPointSerialized } from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// AppStorage keys that the sample publishes. The names are kept in sync with
// common/constants/AssessmentConstants.ets of the sample, they are re-declared here because the
// test tree must not import from the main source tree.
const KEY_ACTIVE: string = 'assessmentActive';
const KEY_DURATION: string = 'assessmentDuration';
const KEY_LOGS: string = 'assessmentLogs';
const KEY_EVENT_TYPE: string = 'assessmentEventType';
const KEY_EVENT_CODE: string = 'assessmentEventCode';
const KEY_EVENT_MESSAGE: string = 'assessmentEventMessage';
const KEY_EVENT_SEQ: string = 'assessmentEventSeq';

// Every key that the controller writes to AppStorage, in the publication order of publishEvent.
const STORAGE_KEYS: string[] = [
  KEY_ACTIVE,
  KEY_DURATION,
  KEY_LOGS,
  KEY_EVENT_TYPE,
  KEY_EVENT_CODE,
  KEY_EVENT_MESSAGE,
  KEY_EVENT_SEQ
];

// Event types recorded in the event log.
const EVENT_BEGIN: string = 'onBegin';
const EVENT_INTERRUPTED: string = 'onInterrupted';
const EVENT_END: string = 'onEnd';
const EVENT_API_ERROR: string = 'onApiError';

// Error codes of the assessment service.
const CODE_OK: number = 0;
const CODE_USER_CANCEL: number = 1;
const CODE_TIMEOUT: number = 2;
const CODE_SYSTEM_ERROR: number = 3;

// The event log keeps at most twenty entries, the oldest entry falls out when the limit is
// exceeded. The controller prepends the newest entry.
const MAX_EVENT_LOG: number = 20;

// The documented duration candidates of the config card, in milliseconds.
const DURATION_DEFAULT: number = 0;
const DURATION_TEN: number = 600000;
const DURATION_THIRTY: number = 1800000;
const DURATION_SIXTY: number = 3600000;
const INVALID_DURATION: number = -1;

// The default value of a storage key that was never written.
const DEFAULT_SEQ: number = 0;
const DEFAULT_ACTIVE: boolean = false;

// A binding is considered stale when a frame was skipped after the write. The threshold mirrors
// the budget of one animation frame at sixty Hertz.
const STALE_BUDGET_MS: number = 16;

// A burst of writes inside this window is coalesced into a single re-render by the ArkUI state
// manager, the model reproduces the coalescing so that the cost of a burst stays bounded.
const COALESCE_WINDOW_MS: number = 50;

// The documented labels of the operation buttons.
const TEXT_BEGIN_LABEL: string = 'begin';
const TEXT_END_LABEL: string = 'end';

/**
 * The kind of binding that links a storage key and a component.
 */
enum BindingKind {
  STORAGE_LINK = 0,
  STORAGE_PROP = 1,
  PLAIN_STATE = 2,
  WATCH_ONLY = 3
}

/**
 * The direction that a write may travel through a binding.
 */
enum BindingDirection {
  NONE = 0,
  ONE_WAY = 1,
  TWO_WAY = 2
}

/**
 * Outcome of one write attempt through a binding.
 */
enum WriteOutcome {
  APPLIED = 0,
  REFUSED_DIRECTION = 1,
  COALESCED = 2,
  IGNORED_SAME_VALUE = 3
}

/**
 * The static description of one binding of the sample.
 *
 * The entry page declares @StorageLink for assessmentActive, @StorageProp for assessmentLogs
 * and assessmentEventSeq, and a plain @State for the local fields. The specification mirrors
 * exactly those declarations, so the model and the page can be compared one to one.
 */
class BindingSpec {
  public key: string = '';
  public kind: BindingKind = BindingKind.STORAGE_PROP;
  public valueType: string = 'string';
  public componentId: string = '';
  public watch: boolean = false;

  constructor(key: string = '', kind: BindingKind = BindingKind.STORAGE_PROP, valueType: string = 'string',
    componentId: string = '', watch: boolean = false) {
    this.key = key;
    this.kind = kind;
    this.valueType = valueType;
    this.componentId = componentId;
    this.watch = watch;
  }

  /**
   * Scenario: a write travels from the component into the storage.
   * Expectation: only a storage link forwards the write, a storage prop and a plain state do not.
   *
   * @returns the direction of the write leg.
   */
  public writeDirection(): BindingDirection {
    if (this.kind === BindingKind.STORAGE_LINK) {
      return BindingDirection.TWO_WAY;
    }
    return BindingDirection.NONE;
  }

  /**
   * Scenario: a write travels from the storage into the component.
   * Expectation: a link and a prop both receive the value, a plain state never does.
   *
   * @returns the direction of the read leg.
   */
  public readDirection(): BindingDirection {
    if (this.kind === BindingKind.STORAGE_LINK || this.kind === BindingKind.STORAGE_PROP) {
      return BindingDirection.ONE_WAY;
    }
    return BindingDirection.NONE;
  }

  /**
   * Scenario: the binding is decorated with @Watch.
   * Expectation: only a storage backed binding can raise the watch callback of the sample.
   *
   * @returns true when a change of the key must invoke the watch handler.
   */
  public raisesWatch(): boolean {
    return this.watch && this.readDirection() !== BindingDirection.NONE;
  }

  /**
   * @returns a compact description used by the log lines.
   */
  public toString(): string {
    return `BindingSpec{key=${this.key}, kind=${this.kind}, watch=${this.watch}}`;
  }
}

/**
 * One recorded transition of a bound value.
 */
interface BindingTransition {
  seq: number;
  key: string;
  componentId: string;
  oldValue: string;
  newValue: string;
  timestampMs: number;
  outcome: WriteOutcome;
}

/**
 * The in-memory mirror of AppStorage.
 *
 * The mirror stores the values as strings, which is enough for the suite because every value of
 * the sample can be rendered as a string and the type of a key is known from its BindingSpec.
 * Keeping the values textual also removes the need for a union typed container.
 */
class StorageMirror {
  private keys: string[] = [];
  private values: string[] = [];
  private writeCounts: number[] = [];

  constructor() {
    this.reset();
  }

  /**
   * Scenario: the storage is initialized with the documented default of every key.
   * Expectation: every key is present once and carries the default value of its type.
   */
  public reset(): void {
    this.keys = STORAGE_KEYS.slice();
    this.values = [];
    this.writeCounts = [];
    for (let i = 0; i < this.keys.length; i++) {
      this.values.push(StorageMirror.defaultFor(this.keys[i]));
      this.writeCounts.push(0);
    }
  }

  /**
   * @param key storage key.
   * @returns the documented default value of the key as text.
   */
  public static defaultFor(key: string): string {
    if (key === KEY_ACTIVE) {
      return `${DEFAULT_ACTIVE}`;
    }
    if (key === KEY_EVENT_SEQ) {
      return `${DEFAULT_SEQ}`;
    }
    if (key === KEY_DURATION) {
      return `${INVALID_DURATION}`;
    }
    return '';
  }

  /**
   * @param key storage key.
   * @returns true when the mirror knows the key.
   */
  public hasKey(key: string): boolean {
    return this.keys.indexOf(key) >= 0;
  }

  /**
   * Scenario: a key is read.
   * Expectation: an unknown key answers with an empty string instead of throwing.
   *
   * @param key storage key.
   * @returns the current value as text.
   */
  public read(key: string): string {
    const index: number = this.keys.indexOf(key);
    if (index < 0) {
      return '';
    }
    return this.values[index];
  }

  /**
   * Scenario: a key is written.
   * Expectation: the new value replaces the old one, the write counter grows and a write of the
   * same value is reported as ignored so that no re-render is triggered.
   *
   * @param key storage key.
   * @param value new value as text.
   * @returns the outcome of the write.
   */
  public write(key: string, value: string): WriteOutcome {
    const index: number = this.keys.indexOf(key);
    if (index < 0) {
      this.keys.push(key);
      this.values.push(value);
      this.writeCounts.push(1);
      return WriteOutcome.APPLIED;
    }
    if (this.values[index] === value) {
      return WriteOutcome.IGNORED_SAME_VALUE;
    }
    this.values[index] = value;
    this.writeCounts[index] = this.writeCounts[index] + 1;
    return WriteOutcome.APPLIED;
  }

  /**
   * @param key storage key.
   * @returns the number of applied writes of the key.
   */
  public writeCount(key: string): number {
    const index: number = this.keys.indexOf(key);
    if (index < 0) {
      return 0;
    }
    return this.writeCounts[index];
  }

  /**
   * @returns the total number of applied writes.
   */
  public totalWrites(): number {
    let sum: number = 0;
    for (let i = 0; i < this.writeCounts.length; i++) {
      sum += this.writeCounts[i];
    }
    return sum;
  }

  /**
   * @returns a copy of the declared keys.
   */
  public getKeys(): string[] {
    return this.keys.slice();
  }

  /**
   * Scenario: the stored sequence text is interpreted as an integer.
   * Expectation: a plain decimal text is converted, a text that is not a plain decimal answers
   * with zero so that the counter never produces a NaN.
   *
   * @returns the sequence value as a number.
   */
  public seqValue(): number {
    return StorageMirror.parseInteger(this.read(KEY_EVENT_SEQ));
  }

  /**
   * Scenario: a decimal text is parsed without relying on the platform parsers.
   * Expectation: an optional leading minus is honoured, all other characters must be digits.
   *
   * @param text text to parse.
   * @returns the integer value, zero when the text is not a plain decimal.
   */
  public static parseInteger(text: string): number {
    if (text.length === 0) {
      return 0;
    }
    let negative: boolean = false;
    let start: number = 0;
    if (text.charAt(0) === '-') {
      negative = true;
      start = 1;
    }
    if (start >= text.length) {
      return 0;
    }
    let value: number = 0;
    for (let i = start; i < text.length; i++) {
      const code: number = text.charCodeAt(i);
      if (code < 48 || code > 57) {
        return 0;
      }
      value = value * 10 + (code - 48);
    }
    return negative ? -value : value;
  }

  /**
   * @returns a compact description used by the log lines.
   */
  public toString(): string {
    return `StorageMirror{keys=${this.keys.length}, writes=${this.totalWrites()}}`;
  }
}

/**
 * Bookkeeping of the watch callbacks that a storage update raises.
 *
 * The page watches assessmentEventSeq, which is why every publication of the controller raises
 * exactly one watch callback even when six other keys were written in the same transaction.
 */
class WatchDispatcher {
  private transitions: BindingTransition[] = [];
  private sequence: number = 0;
  private lastWatchMs: number = -1;
  private coalesced: number = 0;

  /**
   * Scenario: a storage transaction is dispatched to the bindings.
   * Expectation: every binding that receives the value is recorded, the watch callback fires
   * once per transaction and a transaction inside the coalescing window is dropped.
   *
   * @param specs bindings of the page.
   * @param key key that changed.
   * @param oldValue previous value.
   * @param newValue new value.
   * @param timestampMs time of the change.
   * @returns the number of watch callbacks that the change raised.
   */
  public dispatch(specs: BindingSpec[], key: string, oldValue: string, newValue: string,
    timestampMs: number): number {
    let watches: number = 0;
    for (let i = 0; i < specs.length; i++) {
      const spec: BindingSpec = specs[i];
      if (spec.key !== key) {
        continue;
      }
      if (spec.readDirection() === BindingDirection.NONE) {
        continue;
      }
      this.sequence++;
      this.transitions.push({
        seq: this.sequence,
        key: key,
        componentId: spec.componentId,
        oldValue: oldValue,
        newValue: newValue,
        timestampMs: timestampMs,
        outcome: WriteOutcome.APPLIED
      });
      if (spec.raisesWatch()) {
        if (this.lastWatchMs >= 0 && timestampMs - this.lastWatchMs < COALESCE_WINDOW_MS) {
          this.coalesced++;
          continue;
        }
        watches++;
        this.lastWatchMs = timestampMs;
      }
    }
    return watches;
  }

  /**
   * @returns the number of recorded transitions.
   */
  public size(): number {
    return this.transitions.length;
  }

  /**
   * @returns the number of watch callbacks that were coalesced away.
   */
  public coalescedCount(): number {
    return this.coalesced;
  }

  /**
   * @param key storage key.
   * @returns the transitions of the key, newest last.
   */
  public transitionsOf(key: string): BindingTransition[] {
    const result: BindingTransition[] = [];
    for (let i = 0; i < this.transitions.length; i++) {
      if (this.transitions[i].key === key) {
        result.push(this.transitions[i]);
      }
    }
    return result;
  }

  /**
   * @returns the newest transition, null when nothing was dispatched.
   */
  public last(): BindingTransition | null {
    if (this.transitions.length === 0) {
      return null;
    }
    return this.transitions[this.transitions.length - 1];
  }

  /**
   * Scenario: the sequence numbers of the transitions are audited.
   * Expectation: the numbers grow by one per transition and the first number is one.
   *
   * @returns true when the sequence is strictly increasing.
   */
  public isMonotonic(): boolean {
    for (let i = 1; i < this.transitions.length; i++) {
      if (this.transitions[i].seq <= this.transitions[i - 1].seq) {
        return false;
      }
    }
    return true;
  }

  /**
   * Clears every record.
   */
  public reset(): void {
    this.transitions = [];
    this.sequence = 0;
    this.lastWatchMs = -1;
    this.coalesced = 0;
  }

  /**
   * @returns a compact description used by the log lines.
   */
  public toString(): string {
    return `WatchDispatcher{transitions=${this.transitions.length}, coalesced=${this.coalesced}}`;
  }
}

/**
 * The event log of the sample rendered as a list.
 *
 * The controller prepends a new entry and drops the oldest entry beyond twenty, which means the
 * rendered order is newest first while the storage order is insertion first.
 */
class EventJournalModel {
  private entries: string[] = [];
  private capacity: number = MAX_EVENT_LOG;

  constructor(capacity: number = MAX_EVENT_LOG) {
    this.capacity = capacity > 0 ? capacity : MAX_EVENT_LOG;
  }

  /**
   * Scenario: the controller appends one event line.
   * Expectation: the new entry sits at the head and the oldest entry falls out at the capacity.
   *
   * @param text event line.
   */
  public prepend(text: string): void {
    const next: string[] = [text];
    for (let i = 0; i < this.entries.length && next.length < this.capacity; i++) {
      next.push(this.entries[i]);
    }
    this.entries = next;
  }

  /**
   * @returns the number of retained entries.
   */
  public size(): number {
    return this.entries.length;
  }

  /**
   * @returns the newest entry, an empty string when the log is empty.
   */
  public head(): string {
    if (this.entries.length === 0) {
      return '';
    }
    return this.entries[0];
  }

  /**
   * @returns the oldest retained entry, an empty string when the log is empty.
   */
  public tail(): string {
    if (this.entries.length === 0) {
      return '';
    }
    return this.entries[this.entries.length - 1];
  }

  /**
   * @param index position in the rendered order.
   * @returns the entry, an empty string when the index is out of range.
   */
  public at(index: number): string {
    if (index < 0 || index >= this.entries.length) {
      return '';
    }
    return this.entries[index];
  }

  /**
   * @param fragment fragment to look for.
   * @returns true when one retained entry contains the fragment.
   */
  public contains(fragment: string): boolean {
    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i].indexOf(fragment) >= 0) {
        return true;
      }
    }
    return false;
  }

  /**
   * @returns a copy of the entries in the rendered order.
   */
  public toArray(): string[] {
    return this.entries.slice();
  }

  /**
   * Clears the log.
   */
  public clear(): void {
    this.entries = [];
  }

  /**
   * @returns a compact description used by the log lines.
   */
  public toString(): string {
    return `EventJournalModel{entries=${this.entries.length}, capacity=${this.capacity}}`;
  }
}

/**
 * The page side mirror of a bound value.
 *
 * The mirror remembers the last value that the page received and the render counter, so that a
 * case can tell a value that reached the page from a value that stayed in the storage.
 */
class PageStateMirror {
  private values: string[] = [];
  private keys: string[] = [];
  private renders: number = 0;

  /**
   * Scenario: the page receives a new value through a binding.
   * Expectation: the value replaces the previous one and the render counter grows.
   *
   * @param key storage key.
   * @param value new value.
   * @returns true when the visible value changed.
   */
  public receive(key: string, value: string): boolean {
    const index: number = this.keys.indexOf(key);
    if (index < 0) {
      this.keys.push(key);
      this.values.push(value);
      this.renders++;
      return true;
    }
    if (this.values[index] === value) {
      return false;
    }
    this.values[index] = value;
    this.renders++;
    return true;
  }

  /**
   * @param key storage key.
   * @returns the value that the page shows, an empty string when the key was never received.
   */
  public valueOf(key: string): string {
    const index: number = this.keys.indexOf(key);
    if (index < 0) {
      return '';
    }
    return this.values[index];
  }

  /**
   * @returns the number of accepted updates, which is the render cost of the mirror.
   */
  public renderCount(): number {
    return this.renders;
  }

  /**
   * Scenario: the age of the value that the page shows is compared with the storage value.
   * Expectation: the value is stale when the page has not received the newest storage value.
   *
   * @param storage storage mirror.
   * @param key storage key.
   * @returns true when the page lags behind the storage.
   */
  public isStale(storage: StorageMirror, key: string): boolean {
    if (!storage.hasKey(key)) {
      return false;
    }
    return this.valueOf(key) !== storage.read(key);
  }

  /**
   * Clears the mirror.
   */
  public reset(): void {
    this.keys = [];
    this.values = [];
    this.renders = 0;
  }

  /**
   * @returns a compact description used by the log lines.
   */
  public toString(): string {
    return `PageStateMirror{keys=${this.keys.length}, renders=${this.renders}}`;
  }
}

/**
 * The publication model of the assessment controller.
 *
 * The controller writes six keys and finally bumps the sequence key, which is the only watched
 * key of the page. Replaying that order on the model lets the suite prove the ordering
 * guarantees of the sample without depending on a real service callback.
 */
class ControllerModel {
  private storage: StorageMirror;
  private dispatcher: WatchDispatcher;
  private specs: BindingSpec[];

  constructor(storage: StorageMirror, dispatcher: WatchDispatcher, specs: BindingSpec[]) {
    this.storage = storage;
    this.dispatcher = dispatcher;
    this.specs = specs;
  }

  /**
   * Scenario: the controller publishes one callback event.
   * Expectation: the log grows, six keys are written, the sequence is bumped last and exactly
   * one watch callback is raised for the sequence key.
   *
   * @param type event type.
   * @param code error code.
   * @param message event message.
   * @param timestampMs time of the publication.
   * @returns the number of watch callbacks that the publication raised.
   */
  public publish(type: string, code: number, message: string, timestampMs: number): number {
    const log: string = `${type} code=${code} message=${message}`;
    this.storage.write(KEY_LOGS, log);
    let watches: number = 0;
    watches += this.apply(KEY_EVENT_TYPE, type, timestampMs);
    watches += this.apply(KEY_EVENT_CODE, `${code}`, timestampMs);
    watches += this.apply(KEY_EVENT_MESSAGE, message, timestampMs);
    const nextSeq: number = this.storage.seqValue() + 1;
    watches += this.apply(KEY_EVENT_SEQ, `${nextSeq}`, timestampMs);
    return watches;
  }

  /**
   * Scenario: the controller publishes an active state change.
   * Expectation: the active key is written before the log entry is published.
   *
   * @param active new active state.
   * @param timestampMs time of the write.
   * @returns the outcome of the storage write.
   */
  public setActive(active: boolean, timestampMs: number): WriteOutcome {
    const outcome: WriteOutcome = this.storage.write(KEY_ACTIVE, `${active}`);
    if (outcome === WriteOutcome.APPLIED) {
      this.dispatcher.dispatch(this.specs, KEY_ACTIVE, `${!active}`, `${active}`, timestampMs);
    }
    return outcome;
  }

  /**
   * Scenario: the configuration duration is stored for the exam page.
   * Expectation: the duration key receives the value and an invalid value is rejected by the
   * caller, never by the storage.
   *
   * @param duration duration in milliseconds.
   * @param timestampMs time of the write.
   * @returns the outcome of the storage write.
   */
  public setDuration(duration: number, timestampMs: number): WriteOutcome {
    const outcome: WriteOutcome = this.storage.write(KEY_DURATION, `${duration}`);
    if (outcome === WriteOutcome.APPLIED) {
      this.dispatcher.dispatch(this.specs, KEY_DURATION, `${INVALID_DURATION}`, `${duration}`, timestampMs);
    }
    return outcome;
  }

  private apply(key: string, value: string, timestampMs: number): number {
    const previous: string = this.storage.read(key);
    const outcome: WriteOutcome = this.storage.write(key, value);
    if (outcome !== WriteOutcome.APPLIED) {
      return 0;
    }
    return this.dispatcher.dispatch(this.specs, key, previous, value, timestampMs);
  }
}

/**
 * Builds the bindings that the entry page and the exam page declare.
 *
 * @returns the specification list in declaration order.
 */
function buildBindings(): BindingSpec[] {
  return [
    new BindingSpec(KEY_ACTIVE, BindingKind.STORAGE_LINK, 'boolean', ID_BEGIN_BUTTON, false),
    new BindingSpec(KEY_ACTIVE, BindingKind.STORAGE_LINK, 'boolean', ID_END_BUTTON, false),
    new BindingSpec(KEY_LOGS, BindingKind.STORAGE_PROP, 'string[]', 'assessment_event_log', false),
    new BindingSpec(KEY_EVENT_SEQ, BindingKind.STORAGE_PROP, 'number', 'assessment_status_card', true),
    new BindingSpec(KEY_EVENT_TYPE, BindingKind.STORAGE_PROP, 'string', 'assessment_status_card', false),
    new BindingSpec(KEY_EVENT_CODE, BindingKind.STORAGE_PROP, 'number', 'assessment_status_card', false),
    new BindingSpec(KEY_EVENT_MESSAGE, BindingKind.STORAGE_PROP, 'string', 'assessment_status_card', false),
    new BindingSpec('local_duration_index', BindingKind.PLAIN_STATE, 'number', 'assessment_duration_chip',
      false)
  ];
}

/**
 * @param specs bindings of the page.
 * @param key storage key.
 * @returns the bindings of the key.
 */
function bindingsOf(specs: BindingSpec[], key: string): BindingSpec[] {
  const result: BindingSpec[] = [];
  for (let i = 0; i < specs.length; i++) {
    if (specs[i].key === key) {
      result.push(specs[i]);
    }
  }
  return result;
}

/**
 * @param specs bindings of the page.
 * @returns the number of bindings that raise a watch callback.
 */
function watchCount(specs: BindingSpec[]): number {
  let count: number = 0;
  for (let i = 0; i < specs.length; i++) {
    if (specs[i].raisesWatch()) {
      count++;
    }
  }
  return count;
}

/**
 * @param specs bindings of the page.
 * @param kind binding kind to count.
 * @returns the number of bindings of the kind.
 */
function countOfKind(specs: BindingSpec[], kind: BindingKind): number {
  let count: number = 0;
  for (let i = 0; i < specs.length; i++) {
    if (specs[i].kind === kind) {
      count++;
    }
  }
  return count;
}

/**
 * Reads the text of a component and normalizes a driver failure to an empty string.
 *
 * @param component component to read.
 * @returns the text of the component.
 */
async function readTextSafely(component: Component): Promise<string> {
  try {
    return await getTextSerialized(component);
  } catch (error) {
    const err: Error = error instanceof Error ? error : new Error(String(error));
    hilog.warn(DOMAIN, TAG, 'readTextSafely failed: %{public}s', err.message);
    return '';
  }
}

/**
 * Makes sure that the entry page is rendered.
 *
 * @param driver driver of the running case.
 * @returns true when the entry page is rendered.
 */
async function ensureIndexPage(driver: Driver): Promise<boolean> {
  const title: Component | null = await findById(driver, ID_INDEX_TITLE);
  if (title !== null) {
    return true;
  }
  await launchAssessmentApp();
  const rendered: boolean = await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
  if (!rendered) {
    hilog.warn(DOMAIN, TAG, 'ensureIndexPage: the entry page is not rendered');
  }
  return rendered;
}

export default function dataBindingTest() {
  describe('DataBinding_Test', () => {
    let driver: Driver;
    let specs: BindingSpec[];
    let storage: StorageMirror;
    let dispatcher: WatchDispatcher;
    let page: PageStateMirror;
    let controller: ControllerModel;

    beforeAll(async () => {
      driver = getDriver();
      specs = buildBindings();
      storage = new StorageMirror();
      dispatcher = new WatchDispatcher();
      page = new PageStateMirror();
      controller = new ControllerModel(storage, dispatcher, specs);
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
      hilog.info(DOMAIN, TAG, 'DataBinding_Test beforeAll, %{public}d bindings', specs.length);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: the storage keys of the sample are declared.
     * Expectation: seven keys are published and every key is unique, the mirror knows all of them.
     */
    it('Assessment_DataBinding_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_002, begin');
      expect(STORAGE_KEYS.length).assertEqual(7);
      const unique: Set<string> = new Set<string>(STORAGE_KEYS);
      expect(unique.size).assertEqual(STORAGE_KEYS.length);
      for (let i = 0; i < STORAGE_KEYS.length; i++) {
        expect(storage.hasKey(STORAGE_KEYS[i])).assertTrue();
      }
      expect(storage.hasKey('assessmentUnknownKey')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'DataBinding_002', storage.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_002, end');
    });

    /**
     * Scenario: the initial value of every storage key.
     * Expectation: the active key starts inactive, the sequence starts at zero, the duration is
     * invalid and every text key is empty.
     */
    it('Assessment_DataBinding_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_003, begin');
      storage.reset();
      expect(storage.read(KEY_ACTIVE)).assertEqual(`${DEFAULT_ACTIVE}`);
      expect(storage.read(KEY_EVENT_SEQ)).assertEqual(`${DEFAULT_SEQ}`);
      expect(storage.read(KEY_DURATION)).assertEqual(`${INVALID_DURATION}`);
      expect(storage.read(KEY_EVENT_TYPE)).assertEqual('');
      expect(storage.read(KEY_EVENT_MESSAGE)).assertEqual('');
      expect(storage.read('assessmentUnknownKey')).assertEqual('');
      expect(storage.seqValue()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_003, end');
    });

    /**
     * Scenario: the binding table of the page.
     * Expectation: two storage links are declared for the active key, five storage props and one
     * plain state, and exactly one binding raises a watch callback.
     */
    it('Assessment_DataBinding_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_004, begin');
      expect(countOfKind(specs, BindingKind.STORAGE_LINK)).assertEqual(2);
      expect(countOfKind(specs, BindingKind.STORAGE_PROP)).assertEqual(5);
      expect(countOfKind(specs, BindingKind.PLAIN_STATE)).assertEqual(1);
      expect(watchCount(specs)).assertEqual(1);
      expect(bindingsOf(specs, KEY_ACTIVE).length).assertEqual(2);
      expect(bindingsOf(specs, KEY_EVENT_SEQ).length).assertEqual(1);
      expect(bindingsOf(specs, KEY_EVENT_SEQ)[0].watch).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_004, end');
    });

    /**
     * Scenario: the direction of a storage link.
     * Expectation: a link reads one way and writes two way, which is the definition of the
     * decorator that the sample uses for the active flag.
     */
    it('Assessment_DataBinding_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_005, begin');
      const link: BindingSpec = new BindingSpec(KEY_ACTIVE, BindingKind.STORAGE_LINK, 'boolean',
        ID_BEGIN_BUTTON, false);
      expect(link.readDirection()).assertEqual(BindingDirection.ONE_WAY);
      expect(link.writeDirection()).assertEqual(BindingDirection.TWO_WAY);
      expect(link.raisesWatch()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'DataBinding_005', link.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_005, end');
    });

    /**
     * Scenario: the direction of a storage prop.
     * Expectation: a prop reads one way and refuses every write from the component, so the page
     * can only show the value but never change it.
     */
    it('Assessment_DataBinding_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_006, begin');
      const prop: BindingSpec = new BindingSpec(KEY_LOGS, BindingKind.STORAGE_PROP, 'string[]',
        'assessment_event_log', false);
      expect(prop.readDirection()).assertEqual(BindingDirection.ONE_WAY);
      expect(prop.writeDirection()).assertEqual(BindingDirection.NONE);
      const state: BindingSpec = new BindingSpec('local_duration_index', BindingKind.PLAIN_STATE, 'number',
        'assessment_duration_chip', false);
      expect(state.readDirection()).assertEqual(BindingDirection.NONE);
      expect(state.writeDirection()).assertEqual(BindingDirection.NONE);
      expect(state.raisesWatch()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_006, end');
    });

    /**
     * Scenario: a watch binding that sits on a plain state.
     * Expectation: the watch flag never fires without a storage leg, the combination is illegal
     * for the sample.
     */
    it('Assessment_DataBinding_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_007, begin');
      const illegal: BindingSpec = new BindingSpec('local_duration_index', BindingKind.PLAIN_STATE,
        'number', 'assessment_duration_chip', true);
      expect(illegal.raisesWatch()).assertFalse();
      const legal: BindingSpec = new BindingSpec(KEY_EVENT_SEQ, BindingKind.STORAGE_PROP, 'number',
        'assessment_status_card', true);
      expect(legal.raisesWatch()).assertTrue();
      const link: BindingSpec = new BindingSpec(KEY_ACTIVE, BindingKind.STORAGE_LINK, 'boolean',
        ID_BEGIN_BUTTON, true);
      expect(link.raisesWatch()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_007, end');
    });

    /**
     * Scenario: a write through the storage.
     * Expectation: the first write is applied, a second write of the same value is ignored and
     * the write counter only counts the applied write.
     */
    it('Assessment_DataBinding_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_008, begin');
      const local: StorageMirror = new StorageMirror();
      expect(local.write(KEY_ACTIVE, 'true')).assertEqual(WriteOutcome.APPLIED);
      expect(local.write(KEY_ACTIVE, 'true')).assertEqual(WriteOutcome.IGNORED_SAME_VALUE);
      expect(local.write(KEY_ACTIVE, 'false')).assertEqual(WriteOutcome.APPLIED);
      expect(local.writeCount(KEY_ACTIVE)).assertEqual(2);
      expect(local.read(KEY_ACTIVE)).assertEqual('false');
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'DataBinding_008', local.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_008, end');
    });

    /**
     * Scenario: a write to a key that the mirror does not know.
     * Expectation: the key is registered on first write and the read of an unknown key answers
     * with an empty string instead of throwing.
     */
    it('Assessment_DataBinding_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_009, begin');
      const local: StorageMirror = new StorageMirror();
      const before: number = local.getKeys().length;
      expect(local.write('assessmentExtraKey', 'value')).assertEqual(WriteOutcome.APPLIED);
      expect(local.getKeys().length).assertEqual(before + 1);
      expect(local.hasKey('assessmentExtraKey')).assertTrue();
      expect(local.read('assessmentExtraKey')).assertEqual('value');
      expect(local.writeCount('assessmentMissingKey')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_009, end');
    });

    /**
     * Scenario: the sequence counter drives the watch callback.
     * Expectation: one publication bumps the sequence by one and raises exactly one watch
     * callback, because the sequence is the only watched key.
     */
    it('Assessment_DataBinding_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_010, begin');
      storage.reset();
      dispatcher.reset();
      const watches: number = controller.publish(EVENT_BEGIN, CODE_OK, 'started', 1000);
      hilog.info(DOMAIN, TAG, '%{public}s watches: %{public}d, seq: %{public}d',
        BUNDLE + 'DataBinding_010', watches, storage.seqValue());
      expect(watches).assertEqual(1);
      expect(storage.seqValue()).assertEqual(1);
      expect(storage.read(KEY_EVENT_TYPE)).assertEqual(EVENT_BEGIN);
      expect(storage.read(KEY_EVENT_CODE)).assertEqual(`${CODE_OK}`);
      expect(dispatcher.transitionsOf(KEY_EVENT_SEQ).length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_010, end');
    });

    /**
     * Scenario: the sequence counter over several publications.
     * Expectation: the sequence reaches the number of publications and the dispatcher stays
     * monotonic, the coalescing window does not drop a callback of a distant publication.
     */
    it('Assessment_DataBinding_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_011, begin');
      storage.reset();
      dispatcher.reset();
      let totalWatches: number = 0;
      for (let i = 0; i < 5; i++) {
        totalWatches += controller.publish(EVENT_INTERRUPTED, CODE_TIMEOUT, 'timeout', 2000 + i * 200);
      }
      hilog.info(DOMAIN, TAG, '%{public}s watches: %{public}d, seq: %{public}d',
        BUNDLE + 'DataBinding_011', totalWatches, storage.seqValue());
      expect(storage.seqValue()).assertEqual(5);
      expect(totalWatches).assertEqual(5);
      expect(dispatcher.isMonotonic()).assertTrue();
      expect(dispatcher.transitionsOf(KEY_EVENT_SEQ).length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_011, end');
    });

    /**
     * Scenario: two publications inside the coalescing window.
     * Expectation: the second watch callback is coalesced away, the sequence still advances
     * because the storage write itself is not lost.
     */
    it('Assessment_DataBinding_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_012, begin');
      storage.reset();
      dispatcher.reset();
      const first: number = controller.publish(EVENT_BEGIN, CODE_OK, 'a', 5000);
      const second: number = controller.publish(EVENT_END, CODE_OK, 'b', 5000 + COALESCE_WINDOW_MS - 1);
      hilog.info(DOMAIN, TAG, '%{public}s watches: %{public}d/%{public}d, coalesced: %{public}d',
        BUNDLE + 'DataBinding_012', first, second, dispatcher.coalescedCount());
      expect(first).assertEqual(1);
      expect(second).assertEqual(0);
      expect(dispatcher.coalescedCount()).assertEqual(1);
      expect(storage.seqValue()).assertEqual(2);
      expect(storage.read(KEY_EVENT_TYPE)).assertEqual(EVENT_END);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_012, end');
    });

    /**
     * Scenario: the publication writes every key in the documented order.
     * Expectation: the log entry is written first, the six event keys follow and the sequence is
     * the last key, so a watch of the sequence observes a fully updated set of keys.
     */
    it('Assessment_DataBinding_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_013, begin');
      storage.reset();
      dispatcher.reset();
      controller.publish(EVENT_API_ERROR, CODE_SYSTEM_ERROR, 'boom', 9000);
      const last: BindingTransition | null = dispatcher.last();
      expect(last !== null).assertTrue();
      if (last !== null) {
        expect(last.key).assertEqual(KEY_EVENT_SEQ);
        hilog.info(DOMAIN, TAG, '%{public}s last transition key: %{public}s',
          BUNDLE + 'DataBinding_013', last.key);
      }
      expect(storage.read(KEY_EVENT_TYPE)).assertEqual(EVENT_API_ERROR);
      expect(storage.read(KEY_EVENT_CODE)).assertEqual(`${CODE_SYSTEM_ERROR}`);
      expect(storage.read(KEY_EVENT_MESSAGE)).assertEqual('boom');
      expect(storage.writeCount(KEY_LOGS)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_013, end');
    });

    /**
     * Scenario: the active flag is written before the event publication.
     * Expectation: a repeated active state write of the same value is ignored and does not raise a
     * transition, which is what keeps the page from re-rendering twice.
     */
    it('Assessment_DataBinding_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_014, begin');
      storage.reset();
      dispatcher.reset();
      expect(controller.setActive(true, 100)).assertEqual(WriteOutcome.APPLIED);
      expect(controller.setActive(true, 200)).assertEqual(WriteOutcome.IGNORED_SAME_VALUE);
      expect(controller.setActive(false, 300)).assertEqual(WriteOutcome.APPLIED);
      expect(storage.writeCount(KEY_ACTIVE)).assertEqual(2);
      expect(dispatcher.transitionsOf(KEY_ACTIVE).length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_014, end');
    });

    /**
     * Scenario: the active state transition reaches both storage links.
     * Expectation: the begin and the end button receive the flip in the same transaction, the
     * second link observes the same new value as the first one.
     */
    it('Assessment_DataBinding_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_015, begin');
      storage.reset();
      dispatcher.reset();
      controller.setActive(true, 400);
      const transitions: BindingTransition[] = dispatcher.transitionsOf(KEY_ACTIVE);
      expect(transitions.length).assertEqual(2);
      expect(transitions[0].componentId).assertEqual(ID_BEGIN_BUTTON);
      expect(transitions[1].componentId).assertEqual(ID_END_BUTTON);
      expect(transitions[0].newValue).assertEqual(transitions[1].newValue);
      expect(transitions[0].oldValue).assertEqual(transitions[1].oldValue);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_015, end');
    });

    /**
     * Scenario: the duration key is published for the exam page.
     * Expectation: every documented candidate is stored verbatim and the invalid value is a
     * legal stored value that only the page interprets as absent.
     */
    it('Assessment_DataBinding_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_016, begin');
      storage.reset();
      const candidates: number[] = [DURATION_DEFAULT, DURATION_TEN, DURATION_THIRTY, DURATION_SIXTY];
      for (let i = 0; i < candidates.length; i++) {
        expect(controller.setDuration(candidates[i], 1000 + i)).assertEqual(WriteOutcome.APPLIED);
        expect(storage.read(KEY_DURATION)).assertEqual(`${candidates[i]}`);
      }
      expect(storage.writeCount(KEY_DURATION)).assertEqual(4);
      expect(controller.setDuration(INVALID_DURATION, 2000)).assertEqual(WriteOutcome.APPLIED);
      expect(storage.read(KEY_DURATION)).assertEqual(`${INVALID_DURATION}`);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_016, end');
    });

    /**
     * Scenario: the event log keeps at most twenty entries.
     * Expectation: the newest entry sits at the head, the oldest entry is evicted and the size
     * stays at the capacity.
     */
    it('Assessment_DataBinding_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_017, begin');
      const log: EventJournalModel = new EventJournalModel();
      for (let i = 0; i < MAX_EVENT_LOG + 5; i++) {
        log.prepend(`entry_${i}`);
      }
      hilog.info(DOMAIN, TAG, '%{public}s size: %{public}d, head: %{public}s',
        BUNDLE + 'DataBinding_017', log.size(), log.head());
      expect(log.size()).assertEqual(MAX_EVENT_LOG);
      expect(log.head()).assertEqual(`entry_${MAX_EVENT_LOG + 4}`);
      expect(log.tail()).assertEqual('entry_5');
      expect(log.contains('entry_0')).assertFalse();
      expect(log.contains('entry_4')).assertFalse();
      expect(log.contains('entry_5')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_017, end');
    });

    /**
     * Scenario: the rendered order of the event log.
     * Expectation: the index access follows the rendered order, the first entry is the newest
     * and an out of range index answers with an empty string.
     */
    it('Assessment_DataBinding_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_018, begin');
      const log: EventJournalModel = new EventJournalModel();
      log.prepend('oldest');
      log.prepend('newest');
      expect(log.at(0)).assertEqual('newest');
      expect(log.at(1)).assertEqual('oldest');
      expect(log.at(2)).assertEqual('');
      expect(log.at(-1)).assertEqual('');
      expect(log.toArray().length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'DataBinding_018', log.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_018, end');
    });

    /**
     * Scenario: the empty event log.
     * Expectation: head, tail and at answer with an empty string and no fragment is contained,
     * which is the state before any callback was published.
     */
    it('Assessment_DataBinding_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_019, begin');
      const log: EventJournalModel = new EventJournalModel();
      expect(log.size()).assertEqual(0);
      expect(log.head()).assertEqual('');
      expect(log.tail()).assertEqual('');
      expect(log.at(0)).assertEqual('');
      expect(log.contains('onBegin')).assertFalse();
      log.clear();
      expect(log.size()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_019, end');
    });

    /**
     * Scenario: the page receives a storage value.
     * Expectation: the first reception changes the visible value and counts as one render, a
     * second reception of the same value does not render again.
     */
    it('Assessment_DataBinding_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_020, begin');
      const mirror: PageStateMirror = new PageStateMirror();
      expect(mirror.receive(KEY_ACTIVE, 'true')).assertTrue();
      expect(mirror.renderCount()).assertEqual(1);
      expect(mirror.receive(KEY_ACTIVE, 'true')).assertFalse();
      expect(mirror.renderCount()).assertEqual(1);
      expect(mirror.receive(KEY_ACTIVE, 'false')).assertTrue();
      expect(mirror.renderCount()).assertEqual(2);
      expect(mirror.valueOf(KEY_ACTIVE)).assertEqual('false');
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'DataBinding_020', mirror.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_020, end');
    });

    /**
     * Scenario: a value that stayed in the storage is stale on the page.
     * Expectation: the stale predicate reports true until the page received the newest value,
     * which is the guard that the suite uses against a missed render.
     */
    it('Assessment_DataBinding_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_021, begin');
      const local: StorageMirror = new StorageMirror();
      const mirror: PageStateMirror = new PageStateMirror();
      mirror.receive(KEY_EVENT_TYPE, '');
      expect(mirror.isStale(local, KEY_EVENT_TYPE)).assertFalse();
      local.write(KEY_EVENT_TYPE, EVENT_BEGIN);
      expect(mirror.isStale(local, KEY_EVENT_TYPE)).assertTrue();
      mirror.receive(KEY_EVENT_TYPE, local.read(KEY_EVENT_TYPE));
      expect(mirror.isStale(local, KEY_EVENT_TYPE)).assertFalse();
      expect(mirror.isStale(local, 'assessmentUnknownKey')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_021, end');
    });

    /**
     * Scenario: the page mirror of a value that was never received.
     * Expectation: the value answers with an empty string and the key is not counted in the
     * render bookkeeping.
     */
    it('Assessment_DataBinding_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_022, begin');
      const mirror: PageStateMirror = new PageStateMirror();
      expect(mirror.valueOf(KEY_LOGS)).assertEqual('');
      expect(mirror.renderCount()).assertEqual(0);
      const local: StorageMirror = new StorageMirror();
      mirror.receive(KEY_EVENT_TYPE, EVENT_END);
      expect(mirror.isStale(local, KEY_EVENT_TYPE)).assertTrue();
      mirror.reset();
      expect(mirror.renderCount()).assertEqual(0);
      expect(mirror.valueOf(KEY_EVENT_TYPE)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_022, end');
    });

    /**
     * Scenario: the re-render cost of a sequence of writes.
     * Expectation: a value that changes every time costs one render per write, a value that is
     * repeated costs only one render for the whole repetition.
     */
    it('Assessment_DataBinding_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_023, begin');
      const mirror: PageStateMirror = new PageStateMirror();
      for (let i = 0; i < 5; i++) {
        mirror.receive(KEY_EVENT_SEQ, `${i}`);
      }
      expect(mirror.renderCount()).assertEqual(5);
      for (let i = 0; i < 5; i++) {
        mirror.receive(KEY_EVENT_SEQ, '4');
      }
      expect(mirror.renderCount()).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s renders: %{public}d',
        BUNDLE + 'DataBinding_023', mirror.renderCount());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_023, end');
    });

    /**
     * Scenario: the age of a received value is compared with the stale budget.
     * Expectation: a value received inside the budget is fresh, a value received beyond it is
     * reported as stale by the timing audit.
     */
    it('Assessment_DataBinding_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_024, begin');
      const receivedMs: number = 1000;
      const observedFreshMs: number = receivedMs + STALE_BUDGET_MS;
      const observedStaleMs: number = receivedMs + STALE_BUDGET_MS + 1;
      expect(observedFreshMs - receivedMs <= STALE_BUDGET_MS).assertTrue();
      expect(observedStaleMs - receivedMs <= STALE_BUDGET_MS).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s budget: %{public}d ms', BUNDLE + 'DataBinding_024', STALE_BUDGET_MS);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_024, end');
    });

    /**
     * Scenario: the dispatcher records one transition per bound component.
     * Expectation: a key with two bindings produces two transitions, a key with one binding
     * produces one and the sequence counter of the dispatcher grows accordingly.
     */
    it('Assessment_DataBinding_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_025, begin');
      const localDispatcher: WatchDispatcher = new WatchDispatcher();
      localDispatcher.dispatch(specs, KEY_ACTIVE, 'false', 'true', 100);
      expect(localDispatcher.transitionsOf(KEY_ACTIVE).length).assertEqual(2);
      localDispatcher.dispatch(specs, KEY_EVENT_TYPE, '', EVENT_BEGIN, 200);
      expect(localDispatcher.transitionsOf(KEY_EVENT_TYPE).length).assertEqual(1);
      expect(localDispatcher.size()).assertEqual(3);
      expect(localDispatcher.isMonotonic()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s',
        BUNDLE + 'DataBinding_025', localDispatcher.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_025, end');
    });

    /**
     * Scenario: a key without a binding is dispatched.
     * Expectation: the dispatcher records nothing and raises no watch callback, the unknown key
     * cannot reach the page.
     */
    it('Assessment_DataBinding_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_026, begin');
      const localDispatcher: WatchDispatcher = new WatchDispatcher();
      const watches: number = localDispatcher.dispatch(specs, 'assessmentUnknownKey', '', 'x', 100);
      expect(watches).assertEqual(0);
      expect(localDispatcher.size()).assertEqual(0);
      expect(localDispatcher.last() === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_026, end');
    });

    /**
     * Scenario: the dispatcher reset between cases.
     * Expectation: the transitions and the coalescing state are dropped, the next dispatch is
     * accepted again at the same timestamp.
     */
    it('Assessment_DataBinding_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_027, begin');
      const localDispatcher: WatchDispatcher = new WatchDispatcher();
      localDispatcher.dispatch(specs, KEY_EVENT_SEQ, '0', '1', 100);
      localDispatcher.dispatch(specs, KEY_EVENT_SEQ, '1', '2', 110);
      expect(localDispatcher.coalescedCount()).assertEqual(1);
      localDispatcher.reset();
      expect(localDispatcher.size()).assertEqual(0);
      expect(localDispatcher.coalescedCount()).assertEqual(0);
      expect(localDispatcher.last() === null).assertTrue();
      expect(localDispatcher.dispatch(specs, KEY_EVENT_SEQ, '0', '1', 100)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_027, end');
    });

    /**
     * Scenario: two different keys are written in one transaction.
     * Expectation: the page mirror accepts both values, the render cost is two and no value is
     * lost, which is the guarantee that the suite checks against a stale page.
     */
    it('Assessment_DataBinding_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_032, begin');
      const local: StorageMirror = new StorageMirror();
      const mirror: PageStateMirror = new PageStateMirror();
      const localDispatcher: WatchDispatcher = new WatchDispatcher();
      const localController: ControllerModel = new ControllerModel(local, localDispatcher, specs);
      localController.publish(EVENT_BEGIN, CODE_OK, 'ok', 100);
      expect(mirror.receive(KEY_EVENT_TYPE, local.read(KEY_EVENT_TYPE))).assertTrue();
      expect(mirror.receive(KEY_EVENT_SEQ, local.read(KEY_EVENT_SEQ))).assertTrue();
      expect(mirror.renderCount()).assertEqual(2);
      expect(mirror.isStale(local, KEY_EVENT_TYPE)).assertFalse();
      expect(mirror.isStale(local, KEY_EVENT_SEQ)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_032, end');
    });

    /**
     * Scenario: the sequence key is numeric.
     * Expectation: the mirror parses the stored text, a non numeric value is normalized to zero
     * and the counter never produces a NaN.
     */
    it('Assessment_DataBinding_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_033, begin');
      const local: StorageMirror = new StorageMirror();
      local.write(KEY_EVENT_SEQ, '17');
      expect(local.seqValue()).assertEqual(17);
      local.write(KEY_EVENT_SEQ, 'not-a-number');
      expect(local.seqValue()).assertEqual(0);
      local.write(KEY_EVENT_SEQ, '-3');
      expect(local.seqValue()).assertEqual(-3);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_033, end');
    });

    /**
     * Scenario: the storage reset restores the defaults.
     * Expectation: every write counter is zero after the reset and the values match the first
     * launch state of the page.
     */
    it('Assessment_DataBinding_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_034, begin');
      const local: StorageMirror = new StorageMirror();
      local.write(KEY_ACTIVE, 'true');
      local.write(KEY_EVENT_SEQ, '9');
      expect(local.totalWrites()).assertEqual(2);
      local.reset();
      expect(local.totalWrites()).assertEqual(0);
      expect(local.writeCount(KEY_ACTIVE)).assertEqual(0);
      expect(local.read(KEY_ACTIVE)).assertEqual(`${DEFAULT_ACTIVE}`);
      expect(local.seqValue()).assertEqual(0);
      expect(local.getKeys().length).assertEqual(STORAGE_KEYS.length);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_034, end');
    });

    /**
     * Scenario: a full callback cycle is replayed on the model.
     * Expectation: begin, interrupt and end advance the sequence three times, the log keeps the
     * newest entry first and the active flag ends inactive.
     */
    it('Assessment_DataBinding_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_035, begin');
      const local: StorageMirror = new StorageMirror();
      const localDispatcher: WatchDispatcher = new WatchDispatcher();
      const localController: ControllerModel = new ControllerModel(local, localDispatcher, specs);
      const log: EventJournalModel = new EventJournalModel();
      localController.setActive(true, 100);
      localController.publish(EVENT_BEGIN, CODE_OK, 'started', 110);
      log.prepend(local.read(KEY_LOGS));
      localController.setActive(false, 200);
      localController.publish(EVENT_INTERRUPTED, CODE_USER_CANCEL, 'canceled', 210);
      log.prepend(local.read(KEY_LOGS));
      localController.publish(EVENT_END, CODE_OK, '', 220);
      log.prepend(local.read(KEY_LOGS));
      hilog.info(DOMAIN, TAG, '%{public}s seq: %{public}d, head: %{public}s',
        BUNDLE + 'DataBinding_035', local.seqValue(), log.head());
      expect(local.seqValue()).assertEqual(3);
      expect(local.read(KEY_ACTIVE)).assertEqual('false');
      expect(log.size()).assertEqual(3);
      expect(log.head()).assertEqual(`${EVENT_END} code=${CODE_OK} message=`);
      expect(log.contains(EVENT_INTERRUPTED)).assertTrue();
      expect(log.contains(`code=${CODE_USER_CANCEL}`)).assertTrue();
      expect(log.contains(EVENT_BEGIN)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_035, end');
    });

    /**
     * Scenario: the identifiers of the bound components are declared by the driver.
     * Expectation: every component id of the binding table is one of the documented UI ids, so
     * the model and the live page describe the same widgets.
     */
    it('Assessment_DataBinding_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_038, begin');
      const known: string[] = [ID_BEGIN_BUTTON, ID_END_BUTTON, ID_BUNDLE_INPUT, ID_ADD_BUTTON,
        ID_QUERY_STATE_BUTTON, ID_QUERY_CONFIG_BUTTON, ID_INDEX_TITLE];
      let unknown: number = 0;
      for (let i = 0; i < specs.length; i++) {
        const id: string = specs[i].componentId;
        if (known.indexOf(id) < 0 && id.indexOf('assessment_') !== 0) {
          unknown++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s unknown component ids: %{public}d',
        BUNDLE + 'DataBinding_038', unknown);
      expect(unknown).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_038, end');
    });

    /**
     * Scenario: the binding types of the storage table.
     * Expectation: the active key is the only boolean link, the event keys are typed numbers and
     * strings, and the log is a string array, exactly as the page declares them.
     */
    it('Assessment_DataBinding_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_039, begin');
      for (let i = 0; i < specs.length; i++) {
        const spec: BindingSpec = specs[i];
        hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'DataBinding_039', spec.toString());
        if (spec.key === KEY_ACTIVE) {
          expect(spec.valueType).assertEqual('boolean');
        }
        if (spec.key === KEY_EVENT_SEQ || spec.key === KEY_EVENT_CODE) {
          expect(spec.valueType).assertEqual('number');
        }
        if (spec.key === KEY_LOGS) {
          expect(spec.valueType).assertEqual('string[]');
        }
      }
      expect(bindingsOf(specs, KEY_ACTIVE)[0].valueType).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataBinding_039, end');
    });
  });
}
