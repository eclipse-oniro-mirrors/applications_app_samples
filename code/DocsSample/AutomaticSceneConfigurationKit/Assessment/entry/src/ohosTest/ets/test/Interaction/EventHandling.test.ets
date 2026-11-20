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
  ID_EXAM_TITLE,
  TYPE_BUTTON,
  TEXT_STATE_ACTIVE,
  TEXT_STATE_INACTIVE,
  TEXT_WHITELIST_EMPTY,
  TEXT_NO_EVENT,
  TEXT_REMOVE_BUTTON,
  KEY_DOWN,
  KEY_ENTER,
  KEY_BACK,
  KEY_TAB,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_PAGE_TRANSITION,
  DELAY_KEY_NAVIGATION,
  DELAY_TOUCH_EVENT,
  DELAY_AFTER_ACTION,
  serializedDelay,
  triggerSerializedKey,
  getDriver,
  launchAssessmentApp,
  findById,
  findComponentsByType,
  indexComponentCount,
  checkTextContent,
  containsTextFragment,
  waitForIndexPage,
  waitForExamPage,
  isComponentEnabled,
  clickComponent,
  typeBundleName,
  hideSoftKeyboard,
  addAllowedApp,
  allowedAppRowCount,
  removeFirstAllowedApp,
  clickIndexButton,
  isAlertDialogVisible,
  waitForAlertDialog,
  pressAndWait,
  measureActionMs,
  waitUntil
} from '../Shared/AssessmentDriver';
import { clickSerialized, inputTextSerialized, getTextSerialized, clickPointSerialized } from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// The event kinds that the sample reacts to. The click and the key activation reach the same
// onClick handler, the input change and the focus events are handled by the framework.
const EVENT_CLICK: string = 'click';
const EVENT_KEY: string = 'key';
const EVENT_TOUCH: string = 'touch';
const EVENT_CHANGE: string = 'change';
const EVENT_FOCUS: string = 'focus';

// The handlers of the sample. Every documented operation has its own handler, the whitelist
// handlers are bound to the identifier of the list item.
const HANDLER_ON_BEGIN: string = 'onBeginClick';
const HANDLER_ON_END: string = 'onEndClick';
const HANDLER_ON_QUERY_STATE: string = 'onQueryStateClick';
const HANDLER_ON_QUERY_CONFIG: string = 'onQueryConfigClick';
const HANDLER_ADD_APP: string = 'addAllowedApp';
const HANDLER_REMOVE_APP: string = 'removeAllowedApp';
const HANDLER_ASSESSMENT_EVENT: string = 'onAssessmentEvent';

// The identifier of the operation buttons mapped onto the handler that the sample binds.
const OPERATION_HANDLERS: string[] = [
  HANDLER_ON_BEGIN,
  HANDLER_ON_END,
  HANDLER_ON_QUERY_STATE,
  HANDLER_ON_QUERY_CONFIG
];

const OPERATION_IDS: string[] = [
  ID_BEGIN_BUTTON,
  ID_END_BUTTON,
  ID_QUERY_STATE_BUTTON,
  ID_QUERY_CONFIG_BUTTON
];

const OPERATION_LABELS: string[] = ['begin', 'end', 'isActive', 'getConfiguration'];

// The debounce window of the operation card. A tap that repeats inside the window is swallowed
// because the sample would otherwise issue the same service call twice.
const DEBOUNCE_WINDOW_MS: number = 300;

// The burst window of the whitelist input. A second add of the same value inside the window is
// rejected before the list is touched, which is the duplicate guard of the sample.
const DUPLICATE_WINDOW_MS: number = 500;

// Responsiveness budgets of the event audit.
const FAST_HANDLER_MS: number = 100;
const ACCEPTABLE_HANDLER_MS: number = 500;

// The toast that the sample shows when the service call throws carries the tag and the code.
const TOAST_PREFIX: string = '[Sample_Assessment] error code: ';
const TOAST_DURATION_MS: number = 2000;

// Error codes of the assessment service.
const CODE_OK: number = 0;
const CODE_USER_CANCEL: number = 1;
const CODE_TIMEOUT: number = 2;
const CODE_SYSTEM_ERROR: number = 3;
const CODE_ENV_ANOMALY: number = 4;

// The event types recorded in the event log.
const EVENT_TYPE_BEGIN: string = 'onBegin';
const EVENT_TYPE_INTERRUPTED: string = 'onInterrupted';
const EVENT_TYPE_END: string = 'onEnd';
const EVENT_TYPE_API_ERROR: string = 'onApiError';

// The bundle names used by the add and remove cases.
const BUNDLE_PRIMARY: string = 'com.samples.assessment';
const BUNDLE_SECONDARY: string = 'com.samples.dictionary';
const BUNDLE_EMPTY: string = '   ';

/**
 * The kind of an input event that reached a component.
 */
enum InputKind {
  CLICK = 0,
  KEY_ENTER = 1,
  KEY_SPACE = 2,
  TOUCH_DOWN = 3,
  TOUCH_UP = 4,
  LONG_PRESS = 5
}

/**
 * The delivery status of one event.
 */
enum DeliveryStatus {
  DELIVERED = 0,
  SWALLOWED_DISABLED = 1,
  SWALLOWED_DEBOUNCE = 2,
  SWALLOWED_EMPTY_INPUT = 3,
  SWALLOWED_DUPLICATE = 4,
  SWALLOWED_FULL_LIST = 5,
  FAILED_HANDLER = 6
}

/**
 * The verdict of the event responsiveness audit.
 */
enum EventVerdict {
  FAST = 0,
  ACCEPTABLE = 1,
  SLOW = 2
}

/**
 * One recorded event of the sample.
 */
class EventRecord {
  public seq: number = 0;
  public componentId: string = '';
  public kind: InputKind = InputKind.CLICK;
  public handler: string = '';
  public status: DeliveryStatus = DeliveryStatus.DELIVERED;
  public startMs: number = 0;
  public endMs: number = 0;
  public note: string = '';

  constructor(seq: number = 0, componentId: string = '', kind: InputKind = InputKind.CLICK,
    handler: string = '', status: DeliveryStatus = DeliveryStatus.DELIVERED, startMs: number = 0,
    endMs: number = 0, note: string = '') {
    this.seq = seq;
    this.componentId = componentId;
    this.kind = kind;
    this.handler = handler;
    this.status = status;
    this.startMs = startMs;
    this.endMs = endMs;
    this.note = note;
  }

  /**
   * Scenario: the handler duration of an event is measured.
   * Expectation: a negative duration is normalized to zero so that a clock jump cannot make the
   * audit report a negative latency.
   *
   * @returns the handler duration in milliseconds.
   */
  public durationMs(): number {
    return Math.max(0, this.endMs - this.startMs);
  }

  /**
   * Scenario: the event is classified by its handler latency.
   * Expectation: the fast budget is inclusive, the acceptable budget is inclusive and anything
   * beyond it is reported as slow.
   *
   * @returns the verdict of the audit.
   */
  public verdict(): EventVerdict {
    const duration: number = this.durationMs();
    if (duration <= FAST_HANDLER_MS) {
      return EventVerdict.FAST;
    }
    if (duration <= ACCEPTABLE_HANDLER_MS) {
      return EventVerdict.ACCEPTABLE;
    }
    return EventVerdict.SLOW;
  }

  /**
   * @returns true when the event reached its handler.
   */
  public wasDelivered(): boolean {
    return this.status === DeliveryStatus.DELIVERED;
  }

  /**
   * @returns a compact description used by the log lines.
   */
  public toString(): string {
    return `EventRecord{seq=${this.seq}, id=${this.componentId}, kind=${this.kind}, ` +
      `handler=${this.handler}, status=${this.status}, dur=${this.durationMs()}ms}`;
  }
}

/**
 * The event router of one page.
 *
 * The router holds the enabled state of every component and the debounce bookkeeping, which is
 * exactly the information that decides whether the sample forwards an event to its handler. The
 * UI cases compare the verdict of the router with the rendered page, the model cases drive the
 * router on its own.
 */
class EventRouter {
  private records: EventRecord[] = [];
  private sequence: number = 0;
  private enabledIds: string[] = [];
  private enabledFlags: boolean[] = [];
  private lastDeliveredMs: number[] = [];
  private handlers: string[] = [];
  private handlerIds: string[] = [];
  private debounceWindowMs: number = DEBOUNCE_WINDOW_MS;

  constructor() {
    for (let i = 0; i < OPERATION_IDS.length; i++) {
      this.enabledIds.push(OPERATION_IDS[i]);
      this.handlerIds.push(OPERATION_IDS[i]);
      this.handlers.push(OPERATION_HANDLERS[i]);
      this.enabledFlags.push(true);
      this.lastDeliveredMs.push(-1);
    }
  }

  /**
   * Scenario: the sample flips the enabled flag of a button.
   * Expectation: the flag is stored by identifier and an unknown identifier is registered with
   * the flag that the caller passes.
   *
   * @param componentId identifier of the component.
   * @param enabled new enabled state.
   */
  public setEnabled(componentId: string, enabled: boolean): void {
    const index: number = this.enabledIds.indexOf(componentId);
    if (index < 0) {
      this.enabledIds.push(componentId);
      this.handlers.push('');
      this.handlerIds.push(componentId);
      this.enabledFlags.push(enabled);
      this.lastDeliveredMs.push(-1);
      return;
    }
    this.enabledFlags[index] = enabled;
  }

  /**
   * @param componentId identifier of the component.
   * @returns the enabled state, true when the component was never registered.
   */
  public isEnabled(componentId: string): boolean {
    const index: number = this.enabledIds.indexOf(componentId);
    if (index < 0) {
      return true;
    }
    return this.enabledFlags[index];
  }

  /**
   * @param componentId identifier of the component.
   * @returns the handler name that the sample binds, an empty string when it is unknown.
   */
  public handlerOf(componentId: string): string {
    const index: number = this.handlerIds.indexOf(componentId);
    if (index < 0) {
      return '';
    }
    return this.handlers[index];
  }

  /**
   * Scenario: a click is delivered through the router.
   * Expectation: a disabled component swallows the click, a click inside the debounce window is
   * swallowed as a duplicate and an accepted click reaches the handler exactly once.
   *
   * @param componentId identifier of the component.
   * @param timestampMs time of the click.
   * @returns the delivery status.
   */
  public click(componentId: string, timestampMs: number): DeliveryStatus {
    if (!this.isEnabled(componentId)) {
      this.record(componentId, InputKind.CLICK, DeliveryStatus.SWALLOWED_DISABLED, timestampMs,
        timestampMs, 'disabled');
      return DeliveryStatus.SWALLOWED_DISABLED;
    }
    const index: number = this.enabledIds.indexOf(componentId);
    if (index >= 0 && this.lastDeliveredMs[index] >= 0 &&
      timestampMs - this.lastDeliveredMs[index] < this.debounceWindowMs) {
      this.record(componentId, InputKind.CLICK, DeliveryStatus.SWALLOWED_DEBOUNCE, timestampMs,
        timestampMs, 'debounced');
      return DeliveryStatus.SWALLOWED_DEBOUNCE;
    }
    this.record(componentId, InputKind.CLICK, DeliveryStatus.DELIVERED, timestampMs,
      timestampMs + FAST_HANDLER_MS, 'delivered');
    if (index >= 0) {
      this.lastDeliveredMs[index] = timestampMs;
    }
    return DeliveryStatus.DELIVERED;
  }

  /**
   * Scenario: the enter key is pressed on a focused component.
   * Expectation: the key reaches the onClick handler through the same path as a click, but it
   * is not debounced because a key repeat is a deliberate action.
   *
   * @param componentId identifier of the focused component.
   * @param timestampMs time of the key.
   * @returns the delivery status.
   */
  public pressEnter(componentId: string, timestampMs: number): DeliveryStatus {
    if (!this.isEnabled(componentId)) {
      this.record(componentId, InputKind.KEY_ENTER, DeliveryStatus.SWALLOWED_DISABLED, timestampMs,
        timestampMs, 'disabled');
      return DeliveryStatus.SWALLOWED_DISABLED;
    }
    this.record(componentId, InputKind.KEY_ENTER, DeliveryStatus.DELIVERED, timestampMs,
      timestampMs + FAST_HANDLER_MS, 'key activation');
    return DeliveryStatus.DELIVERED;
  }

  /**
   * Scenario: a touch sequence is delivered to a component.
   * Expectation: a touch down and up pair is forwarded exactly once, a disabled component
   * swallows both halves of the sequence.
   *
   * @param componentId identifier of the component.
   * @param timestampMs time of the touch.
   * @returns the delivery status.
   */
  public touch(componentId: string, timestampMs: number): DeliveryStatus {
    if (!this.isEnabled(componentId)) {
      this.record(componentId, InputKind.TOUCH_DOWN, DeliveryStatus.SWALLOWED_DISABLED, timestampMs,
        timestampMs, 'disabled');
      this.record(componentId, InputKind.TOUCH_UP, DeliveryStatus.SWALLOWED_DISABLED, timestampMs,
        timestampMs, 'disabled');
      return DeliveryStatus.SWALLOWED_DISABLED;
    }
    this.record(componentId, InputKind.TOUCH_DOWN, DeliveryStatus.DELIVERED, timestampMs,
      timestampMs, 'down');
    this.record(componentId, InputKind.TOUCH_UP, DeliveryStatus.DELIVERED, timestampMs,
      timestampMs + FAST_HANDLER_MS, 'up');
    return DeliveryStatus.DELIVERED;
  }

  /**
   * Scenario: a whitelist entry is added from the input box.
   * Expectation: an empty value, a duplicate and a full list are all rejected before the list
   * is modified, every rejection carries its own status so that the case can localize it.
   *
   * @param value value of the input box.
   * @param existing current whitelist.
   * @param timestampMs time of the click on the add button.
   * @param maxEntries capacity of the whitelist.
   * @returns the delivery status.
   */
  public addAllowedApp(value: string, existing: string[], timestampMs: number, maxEntries: number): DeliveryStatus {
    const trimmed: string = value.trim();
    let status: DeliveryStatus = DeliveryStatus.DELIVERED;
    if (trimmed.length === 0) {
      status = DeliveryStatus.SWALLOWED_EMPTY_INPUT;
    } else if (existing.indexOf(trimmed) >= 0) {
      status = DeliveryStatus.SWALLOWED_DUPLICATE;
    } else if (existing.length >= maxEntries) {
      status = DeliveryStatus.SWALLOWED_FULL_LIST;
    }
    this.record(ID_ADD_BUTTON, InputKind.CLICK, status, timestampMs,
      timestampMs + FAST_HANDLER_MS, trimmed);
    return status;
  }

  /**
   * Scenario: a whitelist entry is removed.
   * Expectation: an identifier that is present is removed once, an absent identifier is
   * reported as a failure of the handler.
   *
   * @param value bundle name to remove.
   * @param existing current whitelist.
   * @param timestampMs time of the click on the remove button.
   * @returns the delivery status.
   */
  public removeAllowedApp(value: string, existing: string[], timestampMs: number): DeliveryStatus {
    const status: DeliveryStatus = existing.indexOf(value) >= 0 ? DeliveryStatus.DELIVERED :
      DeliveryStatus.FAILED_HANDLER;
    this.record('assessment_remove_button', InputKind.CLICK, status, timestampMs,
      timestampMs + FAST_HANDLER_MS, value);
    return status;
  }

  private record(componentId: string, kind: InputKind, status: DeliveryStatus, startMs: number,
    endMs: number, note: string): void {
    this.sequence++;
    this.records.push(new EventRecord(this.sequence, componentId, kind, this.handlerOf(componentId),
      status, startMs, endMs, note));
  }

  /**
   * @returns the number of recorded events.
   */
  public size(): number {
    return this.records.length;
  }

  /**
   * @returns the number of events that reached a handler.
   */
  public deliveredCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].wasDelivered()) {
        count++;
      }
    }
    return count;
  }

  /**
   * @returns the number of swallowed events.
   */
  public swallowedCount(): number {
    return this.records.length - this.deliveredCount();
  }

  /**
   * @param status delivery status to count.
   * @returns the number of records with the status.
   */
  public countOfStatus(status: DeliveryStatus): number {
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].status === status) {
        count++;
      }
    }
    return count;
  }

  /**
   * @param componentId identifier of the component.
   * @returns the number of delivered events of the component.
   */
  public deliveredOf(componentId: string): number {
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].componentId === componentId && this.records[i].wasDelivered()) {
        count++;
      }
    }
    return count;
  }

  /**
   * @param handler handler name.
   * @returns the number of delivered events that reached the handler.
   */
  public deliveredToHandler(handler: string): number {
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].handler === handler && this.records[i].wasDelivered()) {
        count++;
      }
    }
    return count;
  }

  /**
   * @returns the newest record, null when nothing was recorded.
   */
  public last(): EventRecord | null {
    if (this.records.length === 0) {
      return null;
    }
    return this.records[this.records.length - 1];
  }

  /**
   * @returns the number of records whose handler exceeded the acceptable budget.
   */
  public slowCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].verdict() === EventVerdict.SLOW) {
        count++;
      }
    }
    return count;
  }

  /**
   * Scenario: the sequence numbers of the router are audited.
   * Expectation: the numbers start at one and grow strictly, so the timeline of a case can be
   * reconstructed from the records alone.
   *
   * @returns true when the sequence is strictly increasing from one.
   */
  public isMonotonic(): boolean {
    if (this.records.length === 0) {
      return true;
    }
    if (this.records[0].seq !== 1) {
      return false;
    }
    for (let i = 1; i < this.records.length; i++) {
      if (this.records[i].seq !== this.records[i - 1].seq + 1) {
        return false;
      }
    }
    return true;
  }

  /**
   * @returns a copy of the records in delivery order.
   */
  public getRecords(): EventRecord[] {
    return this.records.slice();
  }

  /**
   * @param windowMs new debounce window.
   */
  public setDebounceWindow(windowMs: number): void {
    this.debounceWindowMs = windowMs > 0 ? windowMs : DEBOUNCE_WINDOW_MS;
  }

  /**
   * Clears every record and the debounce history.
   */
  public reset(): void {
    this.records = [];
    this.sequence = 0;
    for (let i = 0; i < this.lastDeliveredMs.length; i++) {
      this.lastDeliveredMs[i] = -1;
    }
  }

  /**
   * @returns a compact description used by the log lines.
   */
  public toString(): string {
    return `EventRouter{records=${this.records.length}, delivered=${this.deliveredCount()}, ` +
      `swallowed=${this.swallowedCount()}}`;
  }
}

/**
 * The whitelist of the config card with its duplicate and capacity rules.
 */
class WhitelistModel {
  private entries: string[] = [];
  private capacity: number;
  private rejectedEmpty: number = 0;
  private rejectedDuplicate: number = 0;
  private rejectedFull: number = 0;

  constructor(capacity: number) {
    this.capacity = capacity;
  }

  /**
   * Scenario: the add handler receives a raw input value.
   * Expectation: the value is trimmed, an empty value is rejected first, a duplicate second and
   * a full list last, which is the guard order of the sample.
   *
   * @param rawValue value of the input box.
   * @returns the status of the add attempt.
   */
  public add(rawValue: string): DeliveryStatus {
    const value: string = rawValue.trim();
    if (value.length === 0) {
      this.rejectedEmpty++;
      return DeliveryStatus.SWALLOWED_EMPTY_INPUT;
    }
    if (this.entries.indexOf(value) >= 0) {
      this.rejectedDuplicate++;
      return DeliveryStatus.SWALLOWED_DUPLICATE;
    }
    if (this.entries.length >= this.capacity) {
      this.rejectedFull++;
      return DeliveryStatus.SWALLOWED_FULL_LIST;
    }
    this.entries.push(value);
    return DeliveryStatus.DELIVERED;
  }

  /**
   * Scenario: the remove handler receives a bundle name.
   * Expectation: a present entry is removed and its position is closed, an absent entry leaves
   * the list untouched.
   *
   * @param value bundle name to remove.
   * @returns true when the entry was removed.
   */
  public remove(value: string): boolean {
    const index: number = this.entries.indexOf(value);
    if (index < 0) {
      return false;
    }
    this.entries.splice(index, 1);
    return true;
  }

  /**
   * @returns the number of retained entries.
   */
  public size(): number {
    return this.entries.length;
  }

  /**
   * @returns the declared capacity.
   */
  public getCapacity(): number {
    return this.capacity;
  }

  /**
   * @returns true when the list reached its capacity.
   */
  public isFull(): boolean {
    return this.entries.length >= this.capacity;
  }

  /**
   * @param value bundle name.
   * @returns true when the list contains the value.
   */
  public contains(value: string): boolean {
    return this.entries.indexOf(value) >= 0;
  }

  /**
   * @returns a copy of the entries in insertion order.
   */
  public toArray(): string[] {
    return this.entries.slice();
  }

  /**
   * @returns the number of rejected empty inputs.
   */
  public emptyRejections(): number {
    return this.rejectedEmpty;
  }

  /**
   * @returns the number of rejected duplicates.
   */
  public duplicateRejections(): number {
    return this.rejectedDuplicate;
  }

  /**
   * @returns the number of rejected full list attempts.
   */
  public fullRejections(): number {
    return this.rejectedFull;
  }

  /**
   * @returns the total number of rejected add attempts.
   */
  public totalRejections(): number {
    return this.rejectedEmpty + this.rejectedDuplicate + this.rejectedFull;
  }

  /**
   * @returns a compact description used by the log lines.
   */
  public toString(): string {
    return `WhitelistModel{entries=${this.entries.length}, capacity=${this.capacity}, ` +
      `rejected=${this.totalRejections()}}`;
  }
}

/**
 * The toast that the sample raises when a service call throws.
 *
 * The message is built from the sample tag and the error code, the duration is the constant of
 * the sample. The model keeps the raised toasts so that a case can assert the error path without
 * waiting for the platform toast.
 */
class ToastCenter {
  private messages: string[] = [];
  private durations: number[] = [];
  private failures: number = 0;

  /**
   * Scenario: a service call throws and the sample reports the code.
   * Expectation: the message follows the documented template and the duration is the declared
   * toast duration.
   *
   * @param code error code of the failure.
   * @returns the message that was raised.
   */
  public raise(code: number): string {
    const message: string = `${TOAST_PREFIX}${code}`;
    this.messages.push(message);
    this.durations.push(TOAST_DURATION_MS);
    return message;
  }

  /**
   * Scenario: the toast centre itself fails.
   * Expectation: the failure is counted and no message is appended, the caller must not depend
   * on a toast that never showed up.
   */
  public fail(): void {
    this.failures++;
  }

  /**
   * @returns the number of raised toasts.
   */
  public size(): number {
    return this.messages.length;
  }

  /**
   * @returns the newest message, an empty string when nothing was raised.
   */
  public last(): string {
    if (this.messages.length === 0) {
      return '';
    }
    return this.messages[this.messages.length - 1];
  }

  /**
   * @returns the number of recorded toast failures.
   */
  public failureCount(): number {
    return this.failures;
  }

  /**
   * @param index position of the toast.
   * @returns the duration of the toast, -1 when the index is out of range.
   */
  public durationAt(index: number): number {
    if (index < 0 || index >= this.durations.length) {
      return -1;
    }
    return this.durations[index];
  }

  /**
   * @param fragment fragment to look for.
   * @returns true when one message contains the fragment.
   */
  public contains(fragment: string): boolean {
    for (let i = 0; i < this.messages.length; i++) {
      if (this.messages[i].indexOf(fragment) >= 0) {
        return true;
      }
    }
    return false;
  }

  /**
   * Clears every toast.
   */
  public reset(): void {
    this.messages = [];
    this.durations = [];
    this.failures = 0;
  }

  /**
   * @returns a compact description used by the log lines.
   */
  public toString(): string {
    return `ToastCenter{messages=${this.messages.length}, failures=${this.failures}}`;
  }
}

/**
 * The error path of the API wrapper.
 *
 * The controller catches every exception of the service call and publishes an onApiError event,
 * which the entry page turns into a toast. The model reproduces both halves.
 */
class ApiErrorPath {
  /**
   * Scenario: the service call throws a business error.
   * Expectation: the error event is published with the code of the exception and the message is
   * kept verbatim, the sample never rethrows from a click handler.
   *
   * @param code error code of the exception.
   * @param message message of the exception.
   * @param toasts toast centre of the page.
   * @returns the recorded event line.
   */
  public static onThrow(code: number, message: string, toasts: ToastCenter): string {
    const line: string = `${EVENT_TYPE_API_ERROR} code=${code} message=${message}`;
    toasts.raise(code);
    return line;
  }

  /**
   * Scenario: the error code is mapped onto the reason text of the exam page.
   * Expectation: the four documented codes each produce their own reason text, every other code
   * falls back to the unknown reason.
   *
   * @param code error code.
   * @returns the reason text.
   */
  public static reasonOf(code: number): string {
    if (code === CODE_USER_CANCEL) {
      return 'The user canceled the assessment.';
    }
    if (code === CODE_TIMEOUT) {
      return 'The assessment timed out.';
    }
    if (code === CODE_SYSTEM_ERROR) {
      return 'A system error occurred.';
    }
    if (code === CODE_ENV_ANOMALY) {
      return 'An environment anomaly was detected.';
    }
    return 'The assessment exited.';
  }

  /**
   * Scenario: the entry page decides whether a begin event opens the exam page.
   * Expectation: only the OK code of the begin event pushes the exam page, an error code is
   * reported as a toast instead.
   *
   * @param type event type.
   * @param code error code.
   * @returns true when the exam page must be pushed.
   */
  public static shouldPushExam(type: string, code: number): boolean {
    return type === EVENT_TYPE_BEGIN && code === CODE_OK;
  }

  /**
   * Scenario: the entry page decides whether an event is an API error.
   * Expectation: the onApiError type is the only type that is turned into a toast.
   *
   * @param type event type.
   * @returns true when the page must show a toast.
   */
  public static shouldToast(type: string): boolean {
    return type === EVENT_TYPE_API_ERROR;
  }
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

/**
 * Finds the add button and the whitelist input of the config card.
 *
 * @param driver driver of the running case.
 * @returns true when both components are present.
 */
async function canEditWhitelist(driver: Driver): Promise<boolean> {
  const add: Component | null = await findById(driver, ID_ADD_BUTTON);
  const input: Component | null = await findById(driver, ID_BUNDLE_INPUT);
  return add !== null && input !== null;
}

export default function eventHandlingTest() {
  describe('EventHandling_Test', () => {
    let driver: Driver;
    let router: EventRouter;
    let toasts: ToastCenter;

    beforeAll(async () => {
      driver = getDriver();
      router = new EventRouter();
      toasts = new ToastCenter();
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
      hilog.info(DOMAIN, TAG, 'EventHandling_Test beforeAll, %{public}d handlers',
        OPERATION_HANDLERS.length);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: two clicks on the same button inside the debounce window.
     * Expectation: the first click is delivered and the second one is swallowed as a debounce
     * duplicate, so the service is called once per intentional action.
     */
    it('Assessment_EventHandling_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_006, begin');
      router.reset();
      expect(router.click(ID_QUERY_CONFIG_BUTTON, 1000)).assertEqual(DeliveryStatus.DELIVERED);
      expect(router.click(ID_QUERY_CONFIG_BUTTON, 1000 + DEBOUNCE_WINDOW_MS - 1))
        .assertEqual(DeliveryStatus.SWALLOWED_DEBOUNCE);
      expect(router.deliveredOf(ID_QUERY_CONFIG_BUTTON)).assertEqual(1);
      expect(router.countOfStatus(DeliveryStatus.SWALLOWED_DEBOUNCE)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'EventHandling_006', router.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_006, end');
    });

    /**
     * Scenario: two clicks that are separated by the debounce window.
     * Expectation: the second click is outside the window and is delivered, the delivered count
     * of the button reaches two.
     */
    it('Assessment_EventHandling_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_007, begin');
      router.reset();
      expect(router.click(ID_QUERY_CONFIG_BUTTON, 2000)).assertEqual(DeliveryStatus.DELIVERED);
      expect(router.click(ID_QUERY_CONFIG_BUTTON, 2000 + DEBOUNCE_WINDOW_MS))
        .assertEqual(DeliveryStatus.DELIVERED);
      expect(router.deliveredOf(ID_QUERY_CONFIG_BUTTON)).assertEqual(2);
      expect(router.countOfStatus(DeliveryStatus.SWALLOWED_DEBOUNCE)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_007, end');
    });

    /**
     * Scenario: the debounce window is per component.
     * Expectation: a click on another button inside the window is delivered, the window is not
     * shared between the buttons.
     */
    it('Assessment_EventHandling_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_008, begin');
      router.reset();
      expect(router.click(ID_QUERY_STATE_BUTTON, 3000)).assertEqual(DeliveryStatus.DELIVERED);
      expect(router.click(ID_QUERY_CONFIG_BUTTON, 3010)).assertEqual(DeliveryStatus.DELIVERED);
      expect(router.deliveredCount()).assertEqual(2);
      expect(router.deliveredOf(ID_QUERY_STATE_BUTTON)).assertEqual(1);
      expect(router.deliveredOf(ID_QUERY_CONFIG_BUTTON)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_008, end');
    });

    /**
     * Scenario: the debounce window is configured explicitly.
     * Expectation: a wider window swallows a click that the default window would deliver.
     */
    it('Assessment_EventHandling_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_009, begin');
      const local: EventRouter = new EventRouter();
      local.setDebounceWindow(DEBOUNCE_WINDOW_MS * 4);
      expect(local.click(ID_QUERY_STATE_BUTTON, 100)).assertEqual(DeliveryStatus.DELIVERED);
      expect(local.click(ID_QUERY_STATE_BUTTON, 100 + DEBOUNCE_WINDOW_MS))
        .assertEqual(DeliveryStatus.SWALLOWED_DEBOUNCE);
      expect(local.deliveredOf(ID_QUERY_STATE_BUTTON)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_009, end');
    });

    /**
     * Scenario: the enter key activates a focused button.
     * Expectation: the key reaches the handler and is not debounced, two consecutive presses
     * inside the debounce window are both delivered.
     */
    it('Assessment_EventHandling_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_010, begin');
      router.reset();
      expect(router.pressEnter(ID_QUERY_STATE_BUTTON, 4000)).assertEqual(DeliveryStatus.DELIVERED);
      expect(router.pressEnter(ID_QUERY_STATE_BUTTON, 4010)).assertEqual(DeliveryStatus.DELIVERED);
      expect(router.deliveredOf(ID_QUERY_STATE_BUTTON)).assertEqual(2);
      expect(router.last() !== null).assertTrue();
      const last: EventRecord | null = router.last();
      if (last !== null) {
        expect(last.kind).assertEqual(InputKind.KEY_ENTER);
        expect(last.handler).assertEqual(HANDLER_ON_QUERY_STATE);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_010, end');
    });

    /**
     * Scenario: the enter key on a disabled button.
     * Expectation: the key is swallowed with the disabled status and the handler is not called.
     */
    it('Assessment_EventHandling_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_011, begin');
      const local: EventRouter = new EventRouter();
      local.setEnabled(ID_END_BUTTON, false);
      expect(local.pressEnter(ID_END_BUTTON, 100)).assertEqual(DeliveryStatus.SWALLOWED_DISABLED);
      expect(local.deliveredToHandler(HANDLER_ON_END)).assertEqual(0);
      expect(local.swallowedCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'EventHandling_011',
        local.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_011, end');
    });

    /**
     * Scenario: a touch sequence reaches an enabled component.
     * Expectation: both halves are recorded, the up half carries the handler latency and the
     * delivered count of the component is two.
     */
    it('Assessment_EventHandling_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_012, begin');
      const local: EventRouter = new EventRouter();
      expect(local.touch(ID_QUERY_CONFIG_BUTTON, 100)).assertEqual(DeliveryStatus.DELIVERED);
      expect(local.size()).assertEqual(2);
      expect(local.deliveredOf(ID_QUERY_CONFIG_BUTTON)).assertEqual(2);
      expect(local.countOfStatus(DeliveryStatus.SWALLOWED_DISABLED)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'EventHandling_012',
        local.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_012, end');
    });

    /**
     * Scenario: a touch sequence reaches a disabled component.
     * Expectation: both halves are swallowed with the disabled status and nothing reaches the
     * handler.
     */
    it('Assessment_EventHandling_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_013, begin');
      const local: EventRouter = new EventRouter();
      local.setEnabled(ID_END_BUTTON, false);
      expect(local.touch(ID_END_BUTTON, 100)).assertEqual(DeliveryStatus.SWALLOWED_DISABLED);
      expect(local.size()).assertEqual(2);
      expect(local.deliveredCount()).assertEqual(0);
      expect(local.swallowedCount()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_013, end');
    });

    /**
     * Scenario: the handler names of the operation buttons.
     * Expectation: every button maps onto its own handler and the mapping is injective, which is
     * what the router records for the timeline.
     */
    it('Assessment_EventHandling_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_014, begin');
      const seen: Set<string> = new Set<string>();
      for (let i = 0; i < OPERATION_IDS.length; i++) {
        const handler: string = router.handlerOf(OPERATION_IDS[i]);
        hilog.info(DOMAIN, TAG, '%{public}s %{public}s -> %{public}s',
          BUNDLE + 'EventHandling_014', OPERATION_IDS[i], handler);
        expect(handler).assertEqual(OPERATION_HANDLERS[i]);
        seen.add(handler);
      }
      expect(seen.size).assertEqual(OPERATION_HANDLERS.length);
      expect(router.handlerOf('assessment_unknown')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_014, end');
    });

    /**
     * Scenario: the add handler rejects an empty input.
     * Expectation: the empty value is rejected before the list is touched and an existing
     * entry is reported as the last rejection.
     */
    it('Assessment_EventHandling_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_015, begin');
      const list: WhitelistModel = new WhitelistModel(20);
      expect(list.add(BUNDLE_EMPTY)).assertEqual(DeliveryStatus.SWALLOWED_EMPTY_INPUT);
      expect(list.add('')).assertEqual(DeliveryStatus.SWALLOWED_EMPTY_INPUT);
      expect(list.size()).assertEqual(0);
      expect(list.emptyRejections()).assertEqual(2);
      expect(list.add(BUNDLE_PRIMARY)).assertEqual(DeliveryStatus.DELIVERED);
      expect(list.size()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'EventHandling_015', list.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_015, end');
    });

    /**
     * Scenario: the add handler rejects a duplicate.
     * Expectation: the duplicate is reported separately from the empty rejection and the list
     * keeps a single entry.
     */
    it('Assessment_EventHandling_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_016, begin');
      const list: WhitelistModel = new WhitelistModel(20);
      expect(list.add(BUNDLE_PRIMARY)).assertEqual(DeliveryStatus.DELIVERED);
      expect(list.add(BUNDLE_PRIMARY)).assertEqual(DeliveryStatus.SWALLOWED_DUPLICATE);
      expect(list.add(`  ${BUNDLE_PRIMARY}  `)).assertEqual(DeliveryStatus.SWALLOWED_DUPLICATE);
      expect(list.size()).assertEqual(1);
      expect(list.duplicateRejections()).assertEqual(2);
      expect(list.emptyRejections()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'EventHandling_016',
        list.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_016, end');
    });

    /**
     * Scenario: the remove handler closes the gap of a removed entry.
     * Expectation: the removed entry disappears and the following entries keep their relative
     * order.
     */
    it('Assessment_EventHandling_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_018, begin');
      const list: WhitelistModel = new WhitelistModel(20);
      list.add(BUNDLE_PRIMARY);
      list.add(BUNDLE_SECONDARY);
      list.add('com.samples.reader');
      expect(list.remove(BUNDLE_SECONDARY)).assertTrue();
      expect(list.size()).assertEqual(2);
      expect(list.contains(BUNDLE_SECONDARY)).assertFalse();
      expect(list.toArray()[0]).assertEqual(BUNDLE_PRIMARY);
      expect(list.toArray()[1]).assertEqual('com.samples.reader');
      expect(list.remove(BUNDLE_SECONDARY)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_018, end');
    });

    /**
     * Scenario: the remove handler of an absent entry.
     * Expectation: the router reports a handler failure and the list stays untouched.
     */
    it('Assessment_EventHandling_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_019, begin');
      const local: EventRouter = new EventRouter();
      expect(local.removeAllowedApp(BUNDLE_SECONDARY, [BUNDLE_PRIMARY], 100))
        .assertEqual(DeliveryStatus.FAILED_HANDLER);
      expect(local.deliveredCount()).assertEqual(0);
      expect(local.countOfStatus(DeliveryStatus.FAILED_HANDLER)).assertEqual(1);
      expect(local.removeAllowedApp(BUNDLE_PRIMARY, [BUNDLE_PRIMARY], 200))
        .assertEqual(DeliveryStatus.DELIVERED);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'EventHandling_019', local.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_019, end');
    });

    /**
     * Scenario: the API error path of the controller.
     * Expectation: a thrown error is turned into an onApiError line and a toast that carries
     * the code of the exception.
     */
    it('Assessment_EventHandling_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_024, begin');
      toasts.reset();
      const line: string = ApiErrorPath.onThrow(CODE_SYSTEM_ERROR, 'internal failure', toasts);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'EventHandling_024', line);
      expect(line).assertEqual(`${EVENT_TYPE_API_ERROR} code=${CODE_SYSTEM_ERROR} message=internal failure`);
      expect(toasts.size()).assertEqual(1);
      expect(toasts.last()).assertEqual(`${TOAST_PREFIX}${CODE_SYSTEM_ERROR}`);
      expect(toasts.durationAt(0)).assertEqual(TOAST_DURATION_MS);
      expect(toasts.contains('3')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_024, end');
    });

    /**
     * Scenario: every documented error code produces its own toast.
     * Expectation: four failures raise four toasts and the messages never collide.
     */
    it('Assessment_EventHandling_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_025, begin');
      const local: ToastCenter = new ToastCenter();
      ApiErrorPath.onThrow(CODE_USER_CANCEL, 'canceled', local);
      ApiErrorPath.onThrow(CODE_TIMEOUT, 'timeout', local);
      ApiErrorPath.onThrow(CODE_SYSTEM_ERROR, 'system', local);
      ApiErrorPath.onThrow(CODE_ENV_ANOMALY, 'anomaly', local);
      expect(local.size()).assertEqual(4);
      const unique: Set<string> = new Set<string>();
      for (let i = 0; i < local.size(); i++) {
        unique.add(local.durationAt(i) === TOAST_DURATION_MS ? `d${i}` : `x${i}`);
      }
      expect(unique.size).assertEqual(4);
      expect(local.contains(`${CODE_ENV_ANOMALY}`)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'EventHandling_025', local.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_025, end');
    });

    /**
     * Scenario: the toast centre rejects a toast.
     * Expectation: the failure is counted and the message list stays empty, a failing toast
     * must not be mistaken for a delivered one.
     */
    it('Assessment_EventHandling_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_026, begin');
      const local: ToastCenter = new ToastCenter();
      local.fail();
      expect(local.size()).assertEqual(0);
      expect(local.failureCount()).assertEqual(1);
      expect(local.last()).assertEqual('');
      expect(local.durationAt(0)).assertEqual(-1);
      local.reset();
      expect(local.failureCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_026, end');
    });

    /**
     * Scenario: the event type is mapped onto the page reaction.
     * Expectation: only the begin event with the OK code pushes the exam page and only the
     * onApiError type raises a toast.
     */
    it('Assessment_EventHandling_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_027, begin');
      expect(ApiErrorPath.shouldPushExam(EVENT_TYPE_BEGIN, CODE_OK)).assertTrue();
      expect(ApiErrorPath.shouldPushExam(EVENT_TYPE_BEGIN, CODE_USER_CANCEL)).assertFalse();
      expect(ApiErrorPath.shouldPushExam(EVENT_TYPE_END, CODE_OK)).assertFalse();
      expect(ApiErrorPath.shouldToast(EVENT_TYPE_API_ERROR)).assertTrue();
      expect(ApiErrorPath.shouldToast(EVENT_TYPE_INTERRUPTED)).assertFalse();
      expect(ApiErrorPath.shouldToast(EVENT_TYPE_END)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_027, end');
    });

    /**
     * Scenario: the reason text of every error code.
     * Expectation: the four documented codes produce their own sentence and an unknown code
     * falls back to the generic reason.
     */
    it('Assessment_EventHandling_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_028, begin');
      expect(ApiErrorPath.reasonOf(CODE_USER_CANCEL)).assertEqual('The user canceled the assessment.');
      expect(ApiErrorPath.reasonOf(CODE_TIMEOUT)).assertEqual('The assessment timed out.');
      expect(ApiErrorPath.reasonOf(CODE_SYSTEM_ERROR)).assertEqual('A system error occurred.');
      expect(ApiErrorPath.reasonOf(CODE_ENV_ANOMALY))
        .assertEqual('An environment anomaly was detected.');
      expect(ApiErrorPath.reasonOf(99)).assertEqual('The assessment exited.');
      expect(ApiErrorPath.reasonOf(CODE_OK)).assertEqual('The assessment exited.');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_028, end');
    });

    /**
     * Scenario: the responsiveness verdict of a handler.
     * Expectation: a hundred millisecond handler is fast, five hundred is acceptable and one
     * millisecond beyond that is reported as slow.
     */
    it('Assessment_EventHandling_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_029, begin');
      const fast: EventRecord = new EventRecord(1, ID_QUERY_STATE_BUTTON, InputKind.CLICK,
        HANDLER_ON_QUERY_STATE, DeliveryStatus.DELIVERED, 0, FAST_HANDLER_MS, 'fast');
      const acceptable: EventRecord = new EventRecord(2, ID_QUERY_STATE_BUTTON, InputKind.CLICK,
        HANDLER_ON_QUERY_STATE, DeliveryStatus.DELIVERED, 0, ACCEPTABLE_HANDLER_MS, 'ok');
      const slow: EventRecord = new EventRecord(3, ID_QUERY_STATE_BUTTON, InputKind.CLICK,
        HANDLER_ON_QUERY_STATE, DeliveryStatus.DELIVERED, 0, ACCEPTABLE_HANDLER_MS + 1, 'slow');
      expect(fast.verdict()).assertEqual(EventVerdict.FAST);
      expect(acceptable.verdict()).assertEqual(EventVerdict.ACCEPTABLE);
      expect(slow.verdict()).assertEqual(EventVerdict.SLOW);
      expect(fast.durationMs()).assertEqual(FAST_HANDLER_MS);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'EventHandling_029', fast.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_029, end');
    });

    /**
     * Scenario: a record with an inverted time window.
     * Expectation: the duration is clamped to zero, so a clock jump is never reported as a
     * negative latency.
     */
    it('Assessment_EventHandling_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_030, begin');
      const inverted: EventRecord = new EventRecord(1, ID_BEGIN_BUTTON, InputKind.CLICK,
        HANDLER_ON_BEGIN, DeliveryStatus.DELIVERED, 500, 100, 'clock jump');
      expect(inverted.durationMs()).assertEqual(0);
      expect(inverted.verdict()).assertEqual(EventVerdict.FAST);
      expect(inverted.wasDelivered()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_030, end');
    });

    /**
     * Scenario: the router reports the slow handlers of a session.
     * Expectation: the slow counter only counts delivered events beyond the acceptable budget.
     */
    it('Assessment_EventHandling_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_031, begin');
      const local: EventRouter = new EventRouter();
      local.click(ID_QUERY_STATE_BUTTON, 100);
      local.click(ID_QUERY_CONFIG_BUTTON, 200);
      expect(local.slowCount()).assertEqual(0);
      expect(local.deliveredCount()).assertEqual(2);
      expect(local.last() !== null).assertTrue();
      const last: EventRecord | null = local.last();
      if (last !== null) {
        expect(last.wasDelivered()).assertTrue();
        expect(last.handler).assertEqual(HANDLER_ON_QUERY_CONFIG);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_031, end');
    });

    /**
     * Scenario: the router records the handler name of every delivered event.
     * Expectation: the delivered events of a button all carry the handler of that button and
     * the handler counters stay independent.
     */
    it('Assessment_EventHandling_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_032, begin');
      const local: EventRouter = new EventRouter();
      local.click(ID_QUERY_STATE_BUTTON, 100);
      local.click(ID_QUERY_CONFIG_BUTTON, 200);
      local.click(ID_QUERY_STATE_BUTTON, 1000);
      expect(local.deliveredToHandler(HANDLER_ON_QUERY_STATE)).assertEqual(2);
      expect(local.deliveredToHandler(HANDLER_ON_QUERY_CONFIG)).assertEqual(1);
      expect(local.deliveredToHandler(HANDLER_ON_BEGIN)).assertEqual(0);
      expect(local.isMonotonic()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'EventHandling_032', local.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_032, end');
    });

    /**
     * Scenario: the router reset between cases.
     * Expectation: the records and the debounce history are dropped, the same timestamp is
     * accepted again and the sequence restarts at one.
     */
    it('Assessment_EventHandling_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_033, begin');
      const local: EventRouter = new EventRouter();
      local.click(ID_QUERY_STATE_BUTTON, 100);
      local.click(ID_QUERY_STATE_BUTTON, 110);
      expect(local.countOfStatus(DeliveryStatus.SWALLOWED_DEBOUNCE)).assertEqual(1);
      local.reset();
      expect(local.size()).assertEqual(0);
      expect(local.deliveredCount()).assertEqual(0);
      expect(local.click(ID_QUERY_STATE_BUTTON, 100)).assertEqual(DeliveryStatus.DELIVERED);
      expect(local.last() !== null).assertTrue();
      const last: EventRecord | null = local.last();
      if (last !== null) {
        expect(last.seq).assertEqual(1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_033, end');
    });

    /**
     * Scenario: the disable and enable cycle of a modelled button.
     * Expectation: the router refuses the click while the button is disabled and accepts it
     * after the enable, the transition does not reset the debounce history of the button.
     */
    it('Assessment_EventHandling_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_046, begin');
      const local: EventRouter = new EventRouter();
      expect(local.click(ID_BEGIN_BUTTON, 100)).assertEqual(DeliveryStatus.DELIVERED);
      local.setEnabled(ID_BEGIN_BUTTON, false);
      expect(local.click(ID_BEGIN_BUTTON, 200)).assertEqual(DeliveryStatus.SWALLOWED_DISABLED);
      local.setEnabled(ID_BEGIN_BUTTON, true);
      expect(local.click(ID_BEGIN_BUTTON, 300)).assertEqual(DeliveryStatus.SWALLOWED_DEBOUNCE);
      expect(local.click(ID_BEGIN_BUTTON, 1000)).assertEqual(DeliveryStatus.DELIVERED);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'EventHandling_046', local.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_046, end');
    });

    /**
     * Scenario: an unknown component is registered by the router on first use.
     * Expectation: the component is enabled by default and the delivery is accepted, the router
     * never drops an event because of a missing registration.
     */
    it('Assessment_EventHandling_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_047, begin');
      const local: EventRouter = new EventRouter();
      expect(local.isEnabled('assessment_extra_button')).assertTrue();
      expect(local.click('assessment_extra_button', 100)).assertEqual(DeliveryStatus.DELIVERED);
      local.setEnabled('assessment_extra_button', false);
      expect(local.isEnabled('assessment_extra_button')).assertFalse();
      expect(local.click('assessment_extra_button', 200)).assertEqual(DeliveryStatus.SWALLOWED_DISABLED);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_047, end');
    });

    /**
     * Scenario: a full interaction session is replayed on the router.
     * Expectation: the delivered events all carry a handler, the swallowed events never do and
     * the timeline stays monotonic, which is the invariant the suite audits.
     */
    it('Assessment_EventHandling_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_048, begin');
      const local: EventRouter = new EventRouter();
      local.setEnabled(ID_END_BUTTON, false);
      local.click(ID_QUERY_STATE_BUTTON, 100);
      local.click(ID_QUERY_STATE_BUTTON, 110);
      local.click(ID_END_BUTTON, 120);
      local.pressEnter(ID_QUERY_CONFIG_BUTTON, 130);
      local.touch(ID_BEGIN_BUTTON, 140);
      const records: EventRecord[] = local.getRecords();
      let deliveredWithoutHandler: number = 0;
      let swallowedWithHandler: number = 0;
      for (let i = 0; i < records.length; i++) {
        if (records[i].wasDelivered() && records[i].handler.length === 0) {
          deliveredWithoutHandler++;
        }
        if (!records[i].wasDelivered() && records[i].handler.length > 0 &&
          records[i].status !== DeliveryStatus.SWALLOWED_DEBOUNCE &&
          records[i].status !== DeliveryStatus.SWALLOWED_DISABLED) {
          swallowedWithHandler++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s records: %{public}d, delivered: %{public}d',
        BUNDLE + 'EventHandling_048', local.size(), local.deliveredCount());
      expect(local.isMonotonic()).assertTrue();
      expect(deliveredWithoutHandler).assertEqual(0);
      expect(swallowedWithHandler).assertEqual(0);
      expect(local.countOfStatus(DeliveryStatus.SWALLOWED_DEBOUNCE)).assertEqual(1);
      expect(local.countOfStatus(DeliveryStatus.SWALLOWED_DISABLED)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_048, end');
    });

    /**
     * Scenario: the handler inventory of the sample is complete.
     * Expectation: the four operation handlers and the three whitelist and event handlers are
     * all distinct, and every event kind of the page is covered by at least one handler.
     */
    it('Assessment_EventHandling_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_050, begin');
      const handlers: string[] = [HANDLER_ON_BEGIN, HANDLER_ON_END, HANDLER_ON_QUERY_STATE,
        HANDLER_ON_QUERY_CONFIG, HANDLER_ADD_APP, HANDLER_REMOVE_APP, HANDLER_ASSESSMENT_EVENT];
      const unique: Set<string> = new Set<string>(handlers);
      expect(handlers.length).assertEqual(7);
      expect(unique.size).assertEqual(handlers.length);
      const kinds: string[] = [EVENT_CLICK, EVENT_KEY, EVENT_TOUCH, EVENT_CHANGE, EVENT_FOCUS];
      const uniqueKinds: Set<string> = new Set<string>(kinds);
      expect(uniqueKinds.size).assertEqual(kinds.length);
      expect(kinds.indexOf(EVENT_CLICK)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s handlers: %{public}d, kinds: %{public}d',
        BUNDLE + 'EventHandling_050', handlers.length, kinds.length);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_050, end');
    });

    /**
     * Scenario: the duplicate guard window of the whitelist input.
     * Expectation: the window is shorter than the debounce window of the operation card, so a
     * duplicated add is rejected before the operation debounce would matter.
     */
    it('Assessment_EventHandling_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_051, begin');
      expect(DUPLICATE_WINDOW_MS > 0).assertTrue();
      expect(DUPLICATE_WINDOW_MS > DEBOUNCE_WINDOW_MS).assertTrue();
      const list: WhitelistModel = new WhitelistModel(20);
      expect(list.add(BUNDLE_PRIMARY)).assertEqual(DeliveryStatus.DELIVERED);
      expect(list.add(BUNDLE_PRIMARY)).assertEqual(DeliveryStatus.SWALLOWED_DUPLICATE);
      expect(list.totalRejections()).assertEqual(1);
      expect(list.toArray().length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s window: %{public}d ms', BUNDLE + 'EventHandling_051',
        DUPLICATE_WINDOW_MS);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_051, end');
    });

    /**
     * Scenario: the router description is complete.
     * Expectation: the description carries the record count, the delivered count and the
     * swallowed count.
     */
    it('Assessment_EventHandling_052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_052, begin');
      const local: EventRouter = new EventRouter();
      local.setEnabled(ID_END_BUTTON, false);
      local.click(ID_QUERY_STATE_BUTTON, 100);
      local.click(ID_END_BUTTON, 200);
      const text: string = local.toString();
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'EventHandling_052', text);
      expect(text.indexOf('records=2') >= 0).assertTrue();
      expect(text.indexOf('delivered=1') >= 0).assertTrue();
      expect(text.indexOf('swallowed=1') >= 0).assertTrue();
      expect(local.getRecords().length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventHandling_052, end');
    });
  });
}

/**
 * Finds a rendered button by its label.
 *
 * @param driver driver of the running case.
 * @param label label to look for.
 * @returns the button, or null when it cannot be found.
 */
async function findButtonByText(driver: Driver, label: string): Promise<Component | null> {
  const buttons: Component[] = await findComponentsByType(driver, TYPE_BUTTON);
  for (let i = 0; i < buttons.length; i++) {
    try {
      const text: string = await getTextSerialized(buttons[i]);
      if (text === label) {
        return buttons[i];
      }
    } catch (error) {
      // Skip the component that dropped out of the tree.
    }
  }
  return null;
}
