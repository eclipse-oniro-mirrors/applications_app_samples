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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import TestLogger from '../Shared/TestLogger';
import {
  getDriver, startBrowserApp, serializedDelay, componentByIdExists, countById,
  TIMEOUT_PAGE_LOAD, TIMEOUT_COMPONENT, DELAY_TAB_OPERATION, DELAY_TOUCH_EVENT,
  ID_INPUT_URL, ID_ACTION_ADD, ID_NAV_BACK, PAD_HOME_PAGE,
  normalizeUrl, isValidAddress, progressVisibleAfter
} from '../Shared/BrowserTestKit';
import { MockClock } from '../Shared/BrowserMock';

const TAG: string = 'BrowserCommonEventUtilValidationTest';

/* ------------------------------------------------------------------ */
/* Event vocabulary of the browser common event bus.                  */
/* ------------------------------------------------------------------ */

const DEFAULT_PRIORITY: number = 0;
const HIGH_PRIORITY: number = 10;
const LOW_PRIORITY: number = -5;
const MAX_LISTENERS: number = 32;
const STRESS_PUBLISH_COUNT: number = 100;

enum BrowserEventType {
  PAGE_BEGIN = 0,
  PAGE_END = 1,
  PROGRESS_CHANGE = 2,
  TAB_ADD = 3,
  TAB_DELETE = 4,
  TAB_SELECT = 5,
  URL_SUBMIT = 6,
  BACK_PRESS = 7
}

enum EventValidation {
  OK = 0,
  UNKNOWN_TYPE = 1,
  EMPTY_URL = 2,
  INVALID_URL = 3,
  PROGRESS_RANGE = 4,
  INDEX_RANGE = 5
}

interface BrowserEvent {
  id: string;
  type: BrowserEventType;
  url: string;
  progress: number;
  index: number;
  timestamp: number;
  source: string;
}

interface EventRecord {
  sequence: number;
  event: BrowserEvent;
  handlerKey: string;
  handled: boolean;
}

interface Subscription {
  token: number;
  key: string;
  type: BrowserEventType;
  priority: number;
  once: boolean;
  enabled: boolean;
}

interface SubscribeResult {
  accepted: boolean;
  token: number;
  reason: string;
}

interface DispatchReport {
  delivered: number;
  failed: number;
  skipped: number;
  onceRemoved: number;
}

function eventName(type: BrowserEventType): string {
  if (type === BrowserEventType.PAGE_BEGIN) {
    return 'page-begin';
  }
  if (type === BrowserEventType.PAGE_END) {
    return 'page-end';
  }
  if (type === BrowserEventType.PROGRESS_CHANGE) {
    return 'progress-change';
  }
  if (type === BrowserEventType.TAB_ADD) {
    return 'tab-add';
  }
  if (type === BrowserEventType.TAB_DELETE) {
    return 'tab-delete';
  }
  if (type === BrowserEventType.TAB_SELECT) {
    return 'tab-select';
  }
  if (type === BrowserEventType.URL_SUBMIT) {
    return 'url-submit';
  }
  return 'back-press';
}

function validationName(result: EventValidation): string {
  if (result === EventValidation.OK) {
    return 'ok';
  }
  if (result === EventValidation.UNKNOWN_TYPE) {
    return 'unknown-type';
  }
  if (result === EventValidation.EMPTY_URL) {
    return 'empty-url';
  }
  if (result === EventValidation.INVALID_URL) {
    return 'invalid-url';
  }
  if (result === EventValidation.PROGRESS_RANGE) {
    return 'progress-range';
  }
  return 'index-range';
}

function makeEvent(type: BrowserEventType, url: string, progress: number, index: number,
  source: string, clock: MockClock): BrowserEvent {
  return {
    id: `${eventName(type)}-${clock.now()}`,
    type: type,
    url: url,
    progress: progress,
    index: index,
    timestamp: clock.now(),
    source: source
  };
}

/* ------------------------------------------------------------------ */
/* Payload validation.                                                */
/* ------------------------------------------------------------------ */

class EventPayloadValidator {
  static validateType(type: number): EventValidation {
    if (type < BrowserEventType.PAGE_BEGIN || type > BrowserEventType.BACK_PRESS) {
      return EventValidation.UNKNOWN_TYPE;
    }
    return EventValidation.OK;
  }

  static validate(event: BrowserEvent): EventValidation {
    const typeCheck: EventValidation = EventPayloadValidator.validateType(event.type);
    if (typeCheck !== EventValidation.OK) {
      return typeCheck;
    }
    if (event.type === BrowserEventType.PAGE_BEGIN || event.type === BrowserEventType.PAGE_END ||
      event.type === BrowserEventType.URL_SUBMIT) {
      if (event.url === null || event.url === undefined || event.url.length === 0) {
        return EventValidation.EMPTY_URL;
      }
      if (!isValidAddress(event.url) && !event.url.startsWith('file://') &&
        !event.url.startsWith('about:')) {
        return EventValidation.INVALID_URL;
      }
    }
    if (event.type === BrowserEventType.PROGRESS_CHANGE) {
      if (event.progress < 0 || event.progress > 100) {
        return EventValidation.PROGRESS_RANGE;
      }
    }
    if (event.type === BrowserEventType.TAB_SELECT || event.type === BrowserEventType.TAB_DELETE) {
      if (event.index < 0 || event.index > 10) {
        return EventValidation.INDEX_RANGE;
      }
    }
    return EventValidation.OK;
  }

  static clampProgress(progress: number): number {
    if (progress < 0) {
      return 0;
    }
    if (progress > 100) {
      return 100;
    }
    return progress;
  }

  static isPageEvent(type: BrowserEventType): boolean {
    return type === BrowserEventType.PAGE_BEGIN || type === BrowserEventType.PAGE_END;
  }

  static isTabEvent(type: BrowserEventType): boolean {
    return type === BrowserEventType.TAB_ADD || type === BrowserEventType.TAB_DELETE ||
      type === BrowserEventType.TAB_SELECT;
  }

  static describe(event: BrowserEvent): string {
    return `${eventName(event.type)}:${event.url}@${event.progress}`;
  }
}

/* ------------------------------------------------------------------ */
/* Handler registry with dedupe, priority and capacity.               */
/* ------------------------------------------------------------------ */

class HandlerRegistry {
  subscriptions: Subscription[] = [];
  nextToken: number = 1;
  maxListeners: number = MAX_LISTENERS;
  duplicates: number = 0;

  subscribe(key: string, type: BrowserEventType, priority: number,
    once: boolean): SubscribeResult {
    const existing: Subscription | null = this.findByKey(key, type);
    if (existing !== null) {
      this.duplicates += 1;
      return { accepted: false, token: existing.token, reason: 'duplicate' };
    }
    if (this.subscriptions.length >= this.maxListeners) {
      return { accepted: false, token: 0, reason: 'capacity' };
    }
    const token: number = this.nextToken;
    this.nextToken += 1;
    this.subscriptions.push({
      token: token,
      key: key,
      type: type,
      priority: priority,
      once: once,
      enabled: true
    });
    return { accepted: true, token: token, reason: 'ok' };
  }

  findByKey(key: string, type: BrowserEventType): Subscription | null {
    for (let index = 0; index < this.subscriptions.length; index++) {
      if (this.subscriptions[index].key === key && this.subscriptions[index].type === type) {
        return this.subscriptions[index];
      }
    }
    return null;
  }

  findByToken(token: number): Subscription | null {
    for (let index = 0; index < this.subscriptions.length; index++) {
      if (this.subscriptions[index].token === token) {
        return this.subscriptions[index];
      }
    }
    return null;
  }

  unsubscribe(token: number): boolean {
    for (let index = 0; index < this.subscriptions.length; index++) {
      if (this.subscriptions[index].token === token) {
        this.subscriptions.splice(index, 1);
        return true;
      }
    }
    return false;
  }

  unsubscribeByKey(key: string, type: BrowserEventType): boolean {
    const found: Subscription | null = this.findByKey(key, type);
    if (found === null) {
      return false;
    }
    return this.unsubscribe(found.token);
  }

  /** Priority descending, subscription order ascending for equal priority. */
  handlersFor(type: BrowserEventType): Subscription[] {
    const result: Subscription[] = [];
    for (let index = 0; index < this.subscriptions.length; index++) {
      const item: Subscription = this.subscriptions[index];
      if (item.type === type && item.enabled) {
        result.push(item);
      }
    }
    result.sort((left: Subscription, right: Subscription) => {
      if (left.priority !== right.priority) {
        return right.priority - left.priority;
      }
      return left.token - right.token;
    });
    return result;
  }

  enabledCount(): number {
    let count: number = 0;
    for (let index = 0; index < this.subscriptions.length; index++) {
      if (this.subscriptions[index].enabled) {
        count += 1;
      }
    }
    return count;
  }

  setEnabled(key: string, type: BrowserEventType, enabled: boolean): boolean {
    const found: Subscription | null = this.findByKey(key, type);
    if (found === null) {
      return false;
    }
    found.enabled = enabled;
    return true;
  }

  clear(): void {
    this.subscriptions = [];
    this.nextToken = 1;
    this.duplicates = 0;
  }
}

/* ------------------------------------------------------------------ */
/* Event journal keeps the observable dispatch order.                 */
/* ------------------------------------------------------------------ */

class EventJournal {
  records: EventRecord[] = [];
  private sequence: number = 0;

  record(event: BrowserEvent, handlerKey: string, handled: boolean): number {
    this.sequence += 1;
    this.records.push({
      sequence: this.sequence,
      event: event,
      handlerKey: handlerKey,
      handled: handled
    });
    return this.sequence;
  }

  size(): number {
    return this.records.length;
  }

  handlerKeys(): string[] {
    return this.records.map((record: EventRecord) => record.handlerKey);
  }

  eventIds(): string[] {
    return this.records.map((record: EventRecord) => record.event.id);
  }

  countType(type: BrowserEventType): number {
    let count: number = 0;
    for (let index = 0; index < this.records.length; index++) {
      if (this.records[index].event.type === type) {
        count += 1;
      }
    }
    return count;
  }

  failures(): number {
    let count: number = 0;
    for (let index = 0; index < this.records.length; index++) {
      if (!this.records[index].handled) {
        count += 1;
      }
    }
    return count;
  }

  clear(): void {
    this.records = [];
    this.sequence = 0;
  }
}

/* ------------------------------------------------------------------ */
/* Handler binding: registry metadata plus the callable itself.       */
/* ------------------------------------------------------------------ */

class HandlerBinding {
  key: string;
  type: BrowserEventType;
  handler: (event: BrowserEvent) => void;

  constructor(key: string, type: BrowserEventType, handler: (event: BrowserEvent) => void) {
    this.key = key;
    this.type = type;
    this.handler = handler;
  }
}

/* ------------------------------------------------------------------ */
/* Event bus with ordering, dedupe and exception isolation.           */
/* ------------------------------------------------------------------ */

class BrowserEventBus {
  registry: HandlerRegistry = new HandlerRegistry();
  journal: EventJournal = new EventJournal();
  bindings: HandlerBinding[] = [];
  clock: MockClock = new MockClock();
  dispatchCount: number = 0;
  handlerFailures: number = 0;
  rejectedEvents: number = 0;
  onceRemoved: number = 0;
  lastValidation: EventValidation = EventValidation.OK;
  lastEvent: BrowserEvent | null = null;
  private dispatching: boolean = false;
  private deferred: BrowserEvent[] = [];

  subscribe(key: string, type: BrowserEventType, handler: (event: BrowserEvent) => void,
    priority: number = DEFAULT_PRIORITY, once: boolean = false): SubscribeResult {
    const result: SubscribeResult = this.registry.subscribe(key, type, priority, once);
    if (!result.accepted) {
      return result;
    }
    this.bindings.push(new HandlerBinding(key, type, handler));
    return result;
  }

  unsubscribe(token: number): boolean {
    const found: Subscription | null = this.registry.findByToken(token);
    if (found === null) {
      return false;
    }
    this.registry.unsubscribe(token);
    this.removeBinding(found.key, found.type);
    return true;
  }

  unsubscribeByKey(key: string, type: BrowserEventType): boolean {
    const found: Subscription | null = this.registry.findByKey(key, type);
    if (found === null) {
      return false;
    }
    return this.unsubscribe(found.token);
  }

  private removeBinding(key: string, type: BrowserEventType): void {
    for (let index = 0; index < this.bindings.length; index++) {
      if (this.bindings[index].key === key && this.bindings[index].type === type) {
        this.bindings.splice(index, 1);
        return;
      }
    }
  }

  private findBinding(key: string, type: BrowserEventType): HandlerBinding | null {
    for (let index = 0; index < this.bindings.length; index++) {
      if (this.bindings[index].key === key && this.bindings[index].type === type) {
        return this.bindings[index];
      }
    }
    return null;
  }

  hasBinding(key: string, type: BrowserEventType): boolean {
    return this.findBinding(key, type) !== null;
  }

  publish(event: BrowserEvent): boolean {
    const check: EventValidation = EventPayloadValidator.validate(event);
    this.lastValidation = check;
    if (check !== EventValidation.OK) {
      this.rejectedEvents += 1;
      TestLogger.warn(TAG, `event rejected: ${validationName(check)}`);
      return false;
    }
    if (this.dispatching) {
      this.deferred.push(event);
      TestLogger.info(TAG, `event deferred during dispatch: ${eventName(event.type)}`);
      return true;
    }
    this.dispatching = true;
    this.dispatchOne(event);
    while (this.deferred.length > 0) {
      const queued: BrowserEvent = this.deferred.shift() as BrowserEvent;
      this.dispatchOne(queued);
    }
    this.dispatching = false;
    return true;
  }

  /** A single event delivery round in priority order. */
  dispatchOne(event: BrowserEvent): DispatchReport {
    const report: DispatchReport = { delivered: 0, failed: 0, skipped: 0, onceRemoved: 0 };
    this.lastEvent = event;
    this.dispatchCount += 1;
    const handlers: Subscription[] = this.registry.handlersFor(event.type);
    for (let index = 0; index < handlers.length; index++) {
      const item: Subscription = handlers[index];
      const binding: HandlerBinding | null = this.findBinding(item.key, item.type);
      if (binding === null) {
        report.skipped += 1;
        this.journal.record(event, item.key, false);
        continue;
      }
      try {
        binding.handler(event);
        report.delivered += 1;
        this.journal.record(event, item.key, true);
      } catch (error) {
        report.failed += 1;
        this.handlerFailures += 1;
        this.journal.record(event, item.key, false);
        TestLogger.exception(TAG, `handler ${item.key}`, error as Error);
      }
      if (item.once) {
        this.onceRemoved += 1;
        report.onceRemoved += 1;
        this.removeBinding(item.key, item.type);
        this.registry.unsubscribe(item.token);
      }
    }
    return report;
  }

  handlerCount(type: BrowserEventType): number {
    return this.registry.handlersFor(type).length;
  }

  reset(): void {
    this.registry.clear();
    this.journal.clear();
    this.bindings = [];
    this.dispatchCount = 0;
    this.handlerFailures = 0;
    this.rejectedEvents = 0;
    this.onceRemoved = 0;
    this.lastValidation = EventValidation.OK;
    this.lastEvent = null;
    this.deferred = [];
    this.dispatching = false;
    this.clock.reset();
  }
}

/* ------------------------------------------------------------------ */
/* Common event utility used by the title bar and the web component.  */
/* ------------------------------------------------------------------ */

class CommonEventUtil {
  static onPageBegin(bus: BrowserEventBus, url: string): boolean {
    const event: BrowserEvent = makeEvent(BrowserEventType.PAGE_BEGIN, url, 0, -1,
      'web-component', bus.clock);
    bus.clock.advance(1);
    return bus.publish(event);
  }

  static onPageEnd(bus: BrowserEventBus, url: string): boolean {
    const event: BrowserEvent = makeEvent(BrowserEventType.PAGE_END, url, 100, -1,
      'web-component', bus.clock);
    bus.clock.advance(1);
    return bus.publish(event);
  }

  static onProgressChange(bus: BrowserEventBus, progress: number): boolean {
    const event: BrowserEvent = makeEvent(BrowserEventType.PROGRESS_CHANGE, '', progress, -1,
      'web-component', bus.clock);
    bus.clock.advance(1);
    return bus.publish(event);
  }

  static onTabAdd(bus: BrowserEventBus, index: number): boolean {
    const event: BrowserEvent = makeEvent(BrowserEventType.TAB_ADD, '', 0, index,
      'title-bar', bus.clock);
    bus.clock.advance(1);
    return bus.publish(event);
  }

  static onTabDelete(bus: BrowserEventBus, index: number): boolean {
    const event: BrowserEvent = makeEvent(BrowserEventType.TAB_DELETE, '', 0, index,
      'title-bar', bus.clock);
    bus.clock.advance(1);
    return bus.publish(event);
  }

  static onTabSelect(bus: BrowserEventBus, index: number): boolean {
    const event: BrowserEvent = makeEvent(BrowserEventType.TAB_SELECT, '', 0, index,
      'title-bar', bus.clock);
    bus.clock.advance(1);
    return bus.publish(event);
  }

  static onUrlSubmit(bus: BrowserEventBus, rawAddress: string): boolean {
    const normalized: string = normalizeUrl(rawAddress);
    const event: BrowserEvent = makeEvent(BrowserEventType.URL_SUBMIT, normalized, 0, -1,
      'title-bar', bus.clock);
    bus.clock.advance(1);
    return bus.publish(event);
  }

  static onBackPress(bus: BrowserEventBus, consumed: boolean): boolean {
    const event: BrowserEvent = makeEvent(BrowserEventType.BACK_PRESS, '', consumed ? 1 : 0, -1,
      'page', bus.clock);
    bus.clock.advance(1);
    return bus.publish(event);
  }

  /** Registers the three page observers with one call. */
  static registerPageObservers(bus: BrowserEventBus, prefix: string,
    handler: (event: BrowserEvent) => void): number[] {
    const tokens: number[] = [];
    tokens.push(bus.subscribe(`${prefix}-begin`, BrowserEventType.PAGE_BEGIN, handler).token);
    tokens.push(bus.subscribe(`${prefix}-end`, BrowserEventType.PAGE_END, handler).token);
    tokens.push(bus.subscribe(`${prefix}-progress`, BrowserEventType.PROGRESS_CHANGE, handler).token);
    return tokens;
  }

  static unregisterAll(bus: BrowserEventBus, tokens: number[]): number {
    let removed: number = 0;
    for (let index = 0; index < tokens.length; index++) {
      if (bus.unsubscribe(tokens[index])) {
        removed += 1;
      }
    }
    return removed;
  }
}

/* ------------------------------------------------------------------ */
/* Statistics consumed by the event dashboard.                        */
/* ------------------------------------------------------------------ */

class EventStatistics {
  counts: number[] = [0, 0, 0, 0, 0, 0, 0, 0];
  total: number = 0;
  urlSamples: string[] = [];

  consume(event: BrowserEvent): void {
    const index: number = event.type as number;
    if (index >= 0 && index < this.counts.length) {
      this.counts[index] += 1;
    }
    this.total += 1;
    if (event.url.length > 0 && this.urlSamples.length < 16) {
      this.urlSamples.push(event.url);
    }
  }

  countOf(type: BrowserEventType): number {
    const index: number = type as number;
    if (index < 0 || index >= this.counts.length) {
      return 0;
    }
    return this.counts[index];
  }

  summary(): string {
    return `total=${this.total} page=${this.countOf(BrowserEventType.PAGE_BEGIN)}` +
      `/${this.countOf(BrowserEventType.PAGE_END)} progress=${this.countOf(BrowserEventType.PROGRESS_CHANGE)}`;
  }

  reset(): void {
    this.counts = [0, 0, 0, 0, 0, 0, 0, 0];
    this.total = 0;
    this.urlSamples = [];
  }
}

/* ------------------------------------------------------------------ */
/* Test suite.                                                        */
/* ------------------------------------------------------------------ */

export default function browserCommonEventUtilValidationTest() {
  describe('browserCommonEventUtilValidationTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'common event util validation suite begin');
      TestLogger.resetSteps(TAG);
      await startBrowserApp();
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    /* -------------------------------------------------------------- */
    /* Subscription lifecycle.                                        */
    /* -------------------------------------------------------------- */

    it('CommonEvent_Subscribe_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'CommonEvent_Subscribe_001');
      TestLogger.step(TAG, 'a fresh bus accepts the first subscription with a token');
      const bus: BrowserEventBus = new BrowserEventBus();
      const result: SubscribeResult = bus.subscribe('observer-a', BrowserEventType.PAGE_BEGIN,
        (event: BrowserEvent) => { bus.journal.record(event, 'observer-a', true); });
      TestLogger.info(TAG, `subscription accepted=${result.accepted} token=${result.token}`);
      expect(result.accepted).assertTrue();
      expect(result.token).assertEqual(1);
      expect(result.reason).assertEqual('ok');
      expect(bus.registry.subscriptions.length).assertEqual(1);
      expect(bus.bindings.length).assertEqual(1);
      TestLogger.pass(TAG, 'CommonEvent_Subscribe_001');
    });

    it('CommonEvent_Subscribe_002', 0, async () => {
      TestLogger.caseBegin(TAG, 'CommonEvent_Subscribe_002');
      TestLogger.step(TAG, 'the same key and type are deduplicated');
      const bus: BrowserEventBus = new BrowserEventBus();
      const first: SubscribeResult = bus.subscribe('observer-b', BrowserEventType.PAGE_END,
        (event: BrowserEvent) => { bus.journal.record(event, 'observer-b', true); });
      const second: SubscribeResult = bus.subscribe('observer-b', BrowserEventType.PAGE_END,
        (event: BrowserEvent) => { bus.journal.record(event, 'observer-b', true); });
      TestLogger.info(TAG, `duplicate reason=${second.reason} token=${second.token}`);
      expect(first.accepted).assertTrue();
      expect(second.accepted).assertFalse();
      expect(second.reason).assertEqual('duplicate');
      expect(second.token).assertEqual(first.token);
      expect(bus.registry.duplicates).assertEqual(1);
      expect(bus.registry.subscriptions.length).assertEqual(1);
      TestLogger.pass(TAG, 'CommonEvent_Subscribe_002');
    });

    it('CommonEvent_Subscribe_003', 0, async () => {
      TestLogger.caseBegin(TAG, 'CommonEvent_Subscribe_003');
      TestLogger.step(TAG, 'different types of the same key are independent');
      const bus: BrowserEventBus = new BrowserEventBus();
      const begin: SubscribeResult = bus.subscribe('page-observer', BrowserEventType.PAGE_BEGIN,
        (event: BrowserEvent) => { bus.journal.record(event, 'page-observer', true); });
      const end: SubscribeResult = bus.subscribe('page-observer', BrowserEventType.PAGE_END,
        (event: BrowserEvent) => { bus.journal.record(event, 'page-observer', true); });
      TestLogger.info(TAG, `tokens begin=${begin.token} end=${end.token}`);
      expect(begin.accepted).assertTrue();
      expect(end.accepted).assertTrue();
      expect(end.token).assertEqual(begin.token + 1);
      expect(bus.registry.subscriptions.length).assertEqual(2);
      expect(bus.hasBinding('page-observer', BrowserEventType.PAGE_BEGIN)).assertTrue();
      expect(bus.hasBinding('page-observer', BrowserEventType.PROGRESS_CHANGE)).assertFalse();
      TestLogger.pass(TAG, 'CommonEvent_Subscribe_003');
    });

    it('CommonEvent_Unsubscribe_004', 0, async () => {
      TestLogger.caseBegin(TAG, 'CommonEvent_Unsubscribe_004');
      TestLogger.step(TAG, 'unsubscribe by token removes both metadata and binding');
      const bus: BrowserEventBus = new BrowserEventBus();
      const result: SubscribeResult = bus.subscribe('observer-c', BrowserEventType.TAB_ADD,
        (event: BrowserEvent) => { bus.journal.record(event, 'observer-c', true); });
      expect(bus.unsubscribe(result.token)).assertTrue();
      TestLogger.info(TAG, `removed token=${result.token} remaining=${bus.registry.subscriptions.length}`);
      expect(bus.registry.subscriptions.length).assertEqual(0);
      expect(bus.bindings.length).assertEqual(0);
      expect(bus.unsubscribe(result.token)).assertFalse();
      expect(bus.hasBinding('observer-c', BrowserEventType.TAB_ADD)).assertFalse();
      TestLogger.pass(TAG, 'CommonEvent_Unsubscribe_004');
    });

    it('CommonEvent_Unsubscribe_005', 0, async () => {
      TestLogger.caseBegin(TAG, 'CommonEvent_Unsubscribe_005');
      TestLogger.step(TAG, 'unsubscribe by key targets exactly one type');
      const bus: BrowserEventBus = new BrowserEventBus();
      bus.subscribe('observer-d', BrowserEventType.TAB_ADD,
        (event: BrowserEvent) => { bus.journal.record(event, 'observer-d', true); });
      bus.subscribe('observer-d', BrowserEventType.TAB_DELETE,
        (event: BrowserEvent) => { bus.journal.record(event, 'observer-d', true); });
      expect(bus.unsubscribeByKey('observer-d', BrowserEventType.TAB_ADD)).assertTrue();
      expect(bus.unsubscribeByKey('observer-d', BrowserEventType.TAB_ADD)).assertFalse();
      TestLogger.info(TAG, `remaining subscriptions=${bus.registry.subscriptions.length}`);
      expect(bus.registry.subscriptions.length).assertEqual(1);
      expect(bus.hasBinding('observer-d', BrowserEventType.TAB_DELETE)).assertTrue();
      TestLogger.pass(TAG, 'CommonEvent_Unsubscribe_005');
    });

    it('CommonEvent_Dispatch_007', 0, async () => {
      TestLogger.caseBegin(TAG, 'CommonEvent_Dispatch_007');
      TestLogger.step(TAG, 'an invalid page begin payload never reaches a handler');
      const bus: BrowserEventBus = new BrowserEventBus();
      let received: number = 0;
      bus.subscribe('dispatch-b', BrowserEventType.PAGE_BEGIN, (event: BrowserEvent) => {
        received += 1;
      });
      const published: boolean = bus.publish(makeEvent(BrowserEventType.PAGE_BEGIN, '',
        0, -1, 'test', bus.clock));
      TestLogger.info(TAG, `empty url published=${published} validation=${validationName(bus.lastValidation)}`);
      expect(published).assertFalse();
      expect(received).assertEqual(0);
      expect(bus.lastValidation).assertEqual(EventValidation.EMPTY_URL);
      expect(bus.rejectedEvents).assertEqual(1);
      TestLogger.pass(TAG, 'CommonEvent_Dispatch_007');
    });

    it('CommonEvent_Dispatch_008', 0, async () => {
      TestLogger.caseBegin(TAG, 'CommonEvent_Dispatch_008');
      TestLogger.step(TAG, 'a malformed page url is rejected by the payload validator');
      const bus: BrowserEventBus = new BrowserEventBus();
      let received: number = 0;
      bus.subscribe('dispatch-c', BrowserEventType.PAGE_END, (event: BrowserEvent) => {
        received += 1;
      });
      const published: boolean = bus.publish(makeEvent(BrowserEventType.PAGE_END,
        'https://nodot', 100, -1, 'test', bus.clock));
      TestLogger.info(TAG, `bad shape validation=${validationName(bus.lastValidation)}`);
      expect(published).assertFalse();
      expect(received).assertEqual(0);
      expect(bus.lastValidation).assertEqual(EventValidation.INVALID_URL);
      expect(bus.rejectedEvents).assertEqual(1);
      TestLogger.pass(TAG, 'CommonEvent_Dispatch_008');
    });

    it('CommonEvent_Progress_009', 0, async () => {
      TestLogger.caseBegin(TAG, 'CommonEvent_Progress_009');
      TestLogger.step(TAG, 'progress events accept the closed range zero to one hundred');
      const bus: BrowserEventBus = new BrowserEventBus();
      const seen: number[] = [];
      bus.subscribe('progress-a', BrowserEventType.PROGRESS_CHANGE, (event: BrowserEvent) => {
        seen.push(event.progress);
      });
      expect(CommonEventUtil.onProgressChange(bus, 0)).assertTrue();
      expect(CommonEventUtil.onProgressChange(bus, 50)).assertTrue();
      expect(CommonEventUtil.onProgressChange(bus, 100)).assertTrue();
      TestLogger.info(TAG, `progress seen=${seen.join(',')}`);
      expect(seen.length).assertEqual(3);
      expect(seen[0]).assertEqual(0);
      expect(seen[2]).assertEqual(100);
      expect(progressVisibleAfter(100)).assertFalse();
      TestLogger.pass(TAG, 'CommonEvent_Progress_009');
    });

    it('CommonEvent_Progress_010', 0, async () => {
      TestLogger.caseBegin(TAG, 'CommonEvent_Progress_010');
      TestLogger.step(TAG, 'progress minus one and one hundred one are rejected');
      const bus: BrowserEventBus = new BrowserEventBus();
      let received: number = 0;
      bus.subscribe('progress-b', BrowserEventType.PROGRESS_CHANGE, (event: BrowserEvent) => {
        received += 1;
      });
      expect(CommonEventUtil.onProgressChange(bus, -1)).assertFalse();
      expect(bus.lastValidation).assertEqual(EventValidation.PROGRESS_RANGE);
      expect(CommonEventUtil.onProgressChange(bus, 101)).assertFalse();
      TestLogger.info(TAG, `rejected=${bus.rejectedEvents} received=${received}`);
      expect(bus.rejectedEvents).assertEqual(2);
      expect(received).assertEqual(0);
      expect(bus.dispatchCount).assertEqual(0);
      expect(EventPayloadValidator.clampProgress(-1)).assertEqual(0);
      expect(EventPayloadValidator.clampProgress(101)).assertEqual(100);
      TestLogger.pass(TAG, 'CommonEvent_Progress_010');
    });

    it('CommonEvent_Progress_011', 0, async () => {
      TestLogger.caseBegin(TAG, 'CommonEvent_Progress_011');
      TestLogger.step(TAG, 'page end carries progress one hundred and a valid url');
      const bus: BrowserEventBus = new BrowserEventBus();
      let lastUrl: string = '';
      let lastProgress: number = -1;
      bus.subscribe('progress-c', BrowserEventType.PAGE_END, (event: BrowserEvent) => {
        lastUrl = event.url;
        lastProgress = event.progress;
      });
      expect(CommonEventUtil.onPageEnd(bus, 'https://example.com/done')).assertTrue();
      TestLogger.info(TAG, `page end url=${lastUrl} progress=${lastProgress}`);
      expect(lastUrl).assertEqual('https://example.com/done');
      expect(lastProgress).assertEqual(100);
      expect(bus.journal.countType(BrowserEventType.PAGE_END)).assertEqual(1);
      TestLogger.pass(TAG, 'CommonEvent_Progress_011');
    });

    it('CommonEvent_Progress_012', 0, async () => {
      TestLogger.caseBegin(TAG, 'CommonEvent_Progress_012');
      TestLogger.step(TAG, 'page begin resets the progress and keeps the source');
      const bus: BrowserEventBus = new BrowserEventBus();
      let source: string = '';
      let beginProgress: number = -1;
      bus.subscribe('progress-d', BrowserEventType.PAGE_BEGIN, (event: BrowserEvent) => {
        source = event.source;
        beginProgress = event.progress;
      });
      CommonEventUtil.onPageBegin(bus, PAD_HOME_PAGE);
      TestLogger.info(TAG, `page begin source=${source} progress=${beginProgress}`);
      expect(source).assertEqual('web-component');
      expect(beginProgress).assertEqual(0);
      expect(EventPayloadValidator.isPageEvent(BrowserEventType.PAGE_BEGIN)).assertTrue();
      expect(EventPayloadValidator.isPageEvent(BrowserEventType.TAB_ADD)).assertFalse();
      TestLogger.pass(TAG, 'CommonEvent_Progress_012');
    });

    it('CommonEvent_Tab_013', 0, async () => {
      TestLogger.caseBegin(TAG, 'CommonEvent_Tab_013');
      TestLogger.step(TAG, 'tab add delete and select wrappers publish their own type');
      const bus: BrowserEventBus = new BrowserEventBus();
      const events: string[] = [];
      const handler = (event: BrowserEvent): void => {
        events.push(`${eventName(event.type)}#${event.index}`);
      };
      bus.subscribe('tab-add', BrowserEventType.TAB_ADD, handler);
      bus.subscribe('tab-delete', BrowserEventType.TAB_DELETE, handler);
      bus.subscribe('tab-select', BrowserEventType.TAB_SELECT, handler);
      expect(CommonEventUtil.onTabAdd(bus, 0)).assertTrue();
      expect(CommonEventUtil.onTabDelete(bus, 2)).assertTrue();
      expect(CommonEventUtil.onTabSelect(bus, 5)).assertTrue();
      TestLogger.info(TAG, `tab events=${events.join(',')}`);
      expect(events.length).assertEqual(3);
      expect(events[0]).assertEqual('tab-add#0');
      expect(events[1]).assertEqual('tab-delete#2');
      expect(events[2]).assertEqual('tab-select#5');
      TestLogger.pass(TAG, 'CommonEvent_Tab_013');
    });

    it('CommonEvent_Tab_014', 0, async () => {
      TestLogger.caseBegin(TAG, 'CommonEvent_Tab_014');
      TestLogger.step(TAG, 'a tab index above ten is rejected for select and delete');
      const bus: BrowserEventBus = new BrowserEventBus();
      let received: number = 0;
      bus.subscribe('tab-guard', BrowserEventType.TAB_SELECT, (event: BrowserEvent) => {
        received += 1;
      });
      expect(CommonEventUtil.onTabSelect(bus, 11)).assertFalse();
      expect(bus.lastValidation).assertEqual(EventValidation.INDEX_RANGE);
      expect(CommonEventUtil.onTabDelete(bus, -1)).assertFalse();
      TestLogger.info(TAG, `tab index rejections=${bus.rejectedEvents}`);
      expect(bus.rejectedEvents).assertEqual(2);
      expect(received).assertEqual(0);
      expect(EventPayloadValidator.isTabEvent(BrowserEventType.TAB_SELECT)).assertTrue();
      TestLogger.pass(TAG, 'CommonEvent_Tab_014');
    });

    it('CommonEvent_UrlSubmit_015', 0, async () => {
      TestLogger.caseBegin(TAG, 'CommonEvent_UrlSubmit_015');
      TestLogger.step(TAG, 'url submit normalizes a bare host before publishing');
      const bus: BrowserEventBus = new BrowserEventBus();
      let normalized: string = '';
      bus.subscribe('submit-a', BrowserEventType.URL_SUBMIT, (event: BrowserEvent) => {
        normalized = event.url;
      });
      expect(CommonEventUtil.onUrlSubmit(bus, 'example.com/path')).assertTrue();
      TestLogger.info(TAG, `normalized url=${normalized}`);
      expect(normalized).assertEqual('https://example.com/path');
      expect(normalized.startsWith('https://')).assertTrue();
      TestLogger.pass(TAG, 'CommonEvent_UrlSubmit_015');
    });

    it('CommonEvent_UrlSubmit_016', 0, async () => {
      TestLogger.caseBegin(TAG, 'CommonEvent_UrlSubmit_016');
      TestLogger.step(TAG, 'an empty submission normalizes to a rejected https address');
      const bus: BrowserEventBus = new BrowserEventBus();
      let received: number = 0;
      bus.subscribe('submit-b', BrowserEventType.URL_SUBMIT, (event: BrowserEvent) => {
        received += 1;
      });
      const published: boolean = CommonEventUtil.onUrlSubmit(bus, '');
      TestLogger.info(TAG, `empty submit published=${published}`);
      expect(published).assertFalse();
      expect(received).assertEqual(0);
      expect(normalizeUrl('')).assertEqual('https://');
      expect(bus.lastValidation).assertEqual(EventValidation.INVALID_URL);
      TestLogger.pass(TAG, 'CommonEvent_UrlSubmit_016');
    });

    it('CommonEvent_Order_017', 0, async () => {
      TestLogger.caseBegin(TAG, 'CommonEvent_Order_017');
      TestLogger.step(TAG, 'handlers run by descending priority regardless of insertion');
      const bus: BrowserEventBus = new BrowserEventBus();
      const order: string[] = [];
      bus.subscribe('low', BrowserEventType.PAGE_BEGIN, (event: BrowserEvent) => {
        order.push('low');
      }, LOW_PRIORITY);
      bus.subscribe('high', BrowserEventType.PAGE_BEGIN, (event: BrowserEvent) => {
        order.push('high');
      }, HIGH_PRIORITY);
      bus.subscribe('normal', BrowserEventType.PAGE_BEGIN, (event: BrowserEvent) => {
        order.push('normal');
      }, DEFAULT_PRIORITY);
      CommonEventUtil.onPageBegin(bus, 'https://example.com');
      TestLogger.info(TAG, `priority order=${order.join('>')}`);
      expect(order.length).assertEqual(3);
      expect(order[0]).assertEqual('high');
      expect(order[1]).assertEqual('normal');
      expect(order[2]).assertEqual('low');
      TestLogger.pass(TAG, 'CommonEvent_Order_017');
    });

    it('CommonEvent_Order_018', 0, async () => {
      TestLogger.caseBegin(TAG, 'CommonEvent_Order_018');
      TestLogger.step(TAG, 'equal priority keeps the subscription order');
      const bus: BrowserEventBus = new BrowserEventBus();
      const order: string[] = [];
      bus.subscribe('first', BrowserEventType.PAGE_END, (event: BrowserEvent) => {
        order.push('first');
      });
      bus.subscribe('second', BrowserEventType.PAGE_END, (event: BrowserEvent) => {
        order.push('second');
      });
      bus.subscribe('third', BrowserEventType.PAGE_END, (event: BrowserEvent) => {
        order.push('third');
      });
      CommonEventUtil.onPageEnd(bus, 'https://example.com');
      TestLogger.info(TAG, `subscription order=${order.join('>')}`);
      expect(order[0]).assertEqual('first');
      expect(order[1]).assertEqual('second');
      expect(order[2]).assertEqual('third');
      expect(bus.journal.handlerKeys().join(',')).assertEqual('first,second,third');
      TestLogger.pass(TAG, 'CommonEvent_Order_018');
    });

    it('CommonEvent_Once_019', 0, async () => {
      TestLogger.caseBegin(TAG, 'CommonEvent_Once_019');
      TestLogger.step(TAG, 'a once subscription is removed after its first delivery');
      const bus: BrowserEventBus = new BrowserEventBus();
      let received: number = 0;
      bus.subscribe('once-a', BrowserEventType.PAGE_BEGIN, (event: BrowserEvent) => {
        received += 1;
      }, DEFAULT_PRIORITY, true);
      expect(CommonEventUtil.onPageBegin(bus, 'https://example.com')).assertTrue();
      expect(CommonEventUtil.onPageBegin(bus, 'https://example.com/next')).assertTrue();
      TestLogger.info(TAG, `once received=${received} removed=${bus.onceRemoved}`);
      expect(received).assertEqual(1);
      expect(bus.onceRemoved).assertEqual(1);
      expect(bus.registry.subscriptions.length).assertEqual(0);
      expect(bus.hasBinding('once-a', BrowserEventType.PAGE_BEGIN)).assertFalse();
      TestLogger.pass(TAG, 'CommonEvent_Once_019');
    });

    it('CommonEvent_Once_020', 0, async () => {
      TestLogger.caseBegin(TAG, 'CommonEvent_Once_020');
      TestLogger.step(TAG, 'a once subscription coexists with a persistent one');
      const bus: BrowserEventBus = new BrowserEventBus();
      let onceCount: number = 0;
      let persistentCount: number = 0;
      bus.subscribe('once-b', BrowserEventType.TAB_SELECT, (event: BrowserEvent) => {
        onceCount += 1;
      }, DEFAULT_PRIORITY, true);
      bus.subscribe('persistent-b', BrowserEventType.TAB_SELECT, (event: BrowserEvent) => {
        persistentCount += 1;
      });
      CommonEventUtil.onTabSelect(bus, 1);
      CommonEventUtil.onTabSelect(bus, 2);
      TestLogger.info(TAG, `once=${onceCount} persistent=${persistentCount}`);
      expect(onceCount).assertEqual(1);
      expect(persistentCount).assertEqual(2);
      expect(bus.handlerCount(BrowserEventType.TAB_SELECT)).assertEqual(1);
      TestLogger.pass(TAG, 'CommonEvent_Once_020');
    });

    it('CommonEvent_Isolation_021', 0, async () => {
      TestLogger.caseBegin(TAG, 'CommonEvent_Isolation_021');
      TestLogger.step(TAG, 'a throwing handler does not stop the remaining handlers');
      const bus: BrowserEventBus = new BrowserEventBus();
      const order: string[] = [];
      bus.subscribe('bad', BrowserEventType.PAGE_BEGIN, (event: BrowserEvent) => {
        order.push('bad');
        throw new Error('handler exploded');
      }, HIGH_PRIORITY);
      bus.subscribe('good', BrowserEventType.PAGE_BEGIN, (event: BrowserEvent) => {
        order.push('good');
      });
      const published: boolean = CommonEventUtil.onPageBegin(bus, 'https://example.com');
      TestLogger.info(TAG, `isolation order=${order.join('>')} failures=${bus.handlerFailures}`);
      expect(published).assertTrue();
      expect(order.length).assertEqual(2);
      expect(order[0]).assertEqual('bad');
      expect(order[1]).assertEqual('good');
      expect(bus.handlerFailures).assertEqual(1);
      expect(bus.journal.failures()).assertEqual(1);
      expect(bus.journal.size()).assertEqual(2);
      TestLogger.pass(TAG, 'CommonEvent_Isolation_021');
    });

    it('CommonEvent_Isolation_022', 0, async () => {
      TestLogger.caseBegin(TAG, 'CommonEvent_Isolation_022');
      TestLogger.step(TAG, 'all handlers failing still leaves the bus usable');
      const bus: BrowserEventBus = new BrowserEventBus();
      const failing = (event: BrowserEvent): void => {
        throw new Error('always fails');
      };
      bus.subscribe('fail-a', BrowserEventType.PAGE_END, failing);
      bus.subscribe('fail-b', BrowserEventType.PAGE_END, failing);
      const report: DispatchReport = bus.dispatchOne(makeEvent(BrowserEventType.PAGE_END,
        'https://example.com', 100, -1, 'test', bus.clock));
      TestLogger.info(TAG, `delivered=${report.delivered} failed=${report.failed}`);
      expect(report.delivered).assertEqual(0);
      expect(report.failed).assertEqual(2);
      expect(bus.handlerFailures).assertEqual(2);
      expect(bus.registry.subscriptions.length).assertEqual(2);
      expect(CommonEventUtil.onPageEnd(bus, 'https://example.com')).assertTrue();
      TestLogger.pass(TAG, 'CommonEvent_Isolation_022');
    });

    it('CommonEvent_Enabled_023', 0, async () => {
      TestLogger.caseBegin(TAG, 'CommonEvent_Enabled_023');
      TestLogger.step(TAG, 'a disabled subscription is skipped until it is enabled again');
      const bus: BrowserEventBus = new BrowserEventBus();
      let received: number = 0;
      const result: SubscribeResult = bus.subscribe('toggle-a', BrowserEventType.TAB_ADD,
        (event: BrowserEvent) => { received += 1; });
      expect(bus.registry.setEnabled('toggle-a', BrowserEventType.TAB_ADD, false)).assertTrue();
      expect(CommonEventUtil.onTabAdd(bus, 1)).assertTrue();
      TestLogger.info(TAG, `disabled received=${received} enabled=${bus.registry.enabledCount()}`);
      expect(received).assertEqual(0);
      expect(bus.registry.enabledCount()).assertEqual(0);
      expect(bus.registry.setEnabled('toggle-a', BrowserEventType.TAB_ADD, true)).assertTrue();
      CommonEventUtil.onTabAdd(bus, 2);
      expect(received).assertEqual(1);
      expect(result.accepted).assertTrue();
      TestLogger.pass(TAG, 'CommonEvent_Enabled_023');
    });

    it('CommonEvent_Capacity_024', 0, async () => {
      TestLogger.caseBegin(TAG, 'CommonEvent_Capacity_024');
      TestLogger.step(TAG, 'the registry enforces the listener ceiling');
      const bus: BrowserEventBus = new BrowserEventBus();
      bus.registry.maxListeners = 3;
      const handler = (event: BrowserEvent): void => { };
      expect(bus.subscribe('cap-1', BrowserEventType.PAGE_BEGIN, handler).accepted).assertTrue();
      expect(bus.subscribe('cap-2', BrowserEventType.PAGE_BEGIN, handler).accepted).assertTrue();
      expect(bus.subscribe('cap-3', BrowserEventType.PAGE_BEGIN, handler).accepted).assertTrue();
      const overflow: SubscribeResult = bus.subscribe('cap-4', BrowserEventType.PAGE_BEGIN, handler);
      TestLogger.info(TAG, `overflow accepted=${overflow.accepted} reason=${overflow.reason}`);
      expect(overflow.accepted).assertFalse();
      expect(overflow.reason).assertEqual('capacity');
      expect(bus.registry.subscriptions.length).assertEqual(3);
      expect(bus.bindings.length).assertEqual(3);
      TestLogger.pass(TAG, 'CommonEvent_Capacity_024');
    });

    it('CommonEvent_Observer_025', 0, async () => {
      TestLogger.caseBegin(TAG, 'CommonEvent_Observer_025');
      TestLogger.step(TAG, 'the page observer helper registers and removes three subscriptions');
      const bus: BrowserEventBus = new BrowserEventBus();
      let pageEvents: number = 0;
      const tokens: number[] = CommonEventUtil.registerPageObservers(bus, 'observer-block',
        (event: BrowserEvent) => { pageEvents += 1; });
      TestLogger.info(TAG, `observer tokens=${tokens.join(',')}`);
      expect(tokens.length).assertEqual(3);
      expect(tokens[0]).assertEqual(1);
      expect(tokens[2]).assertEqual(3);
      expect(bus.registry.subscriptions.length).assertEqual(3);
      CommonEventUtil.onPageBegin(bus, 'https://example.com');
      CommonEventUtil.onProgressChange(bus, 40);
      CommonEventUtil.onPageEnd(bus, 'https://example.com');
      expect(pageEvents).assertEqual(3);
      const removed: number = CommonEventUtil.unregisterAll(bus, tokens);
      expect(removed).assertEqual(3);
      expect(bus.registry.subscriptions.length).assertEqual(0);
      TestLogger.pass(TAG, 'CommonEvent_Observer_025');
    });

    it('CommonEvent_Reentrant_026', 0, async () => {
      TestLogger.caseBegin(TAG, 'CommonEvent_Reentrant_026');
      TestLogger.step(TAG, 'an event published inside a handler is deferred to the next round');
      const bus: BrowserEventBus = new BrowserEventBus();
      const order: string[] = [];
      bus.subscribe('outer', BrowserEventType.PAGE_BEGIN, (event: BrowserEvent) => {
        order.push('outer-1');
        CommonEventUtil.onPageEnd(bus, 'https://example.com');
        order.push('outer-2');
      });
      bus.subscribe('inner', BrowserEventType.PAGE_END, (event: BrowserEvent) => {
        order.push('inner');
      });
      CommonEventUtil.onPageBegin(bus, 'https://example.com');
      TestLogger.info(TAG, `reentrant order=${order.join('>')}`);
      expect(order.length).assertEqual(3);
      expect(order[0]).assertEqual('outer-1');
      expect(order[1]).assertEqual('outer-2');
      expect(order[2]).assertEqual('inner');
      expect(bus.dispatchCount).assertEqual(2);
      TestLogger.pass(TAG, 'CommonEvent_Reentrant_026');
    });

    it('CommonEvent_Reentrant_027', 0, async () => {
      TestLogger.caseBegin(TAG, 'CommonEvent_Reentrant_027');
      TestLogger.step(TAG, 'unsubscribing during dispatch does not corrupt the handler list');
      const bus: BrowserEventBus = new BrowserEventBus();
      const order: string[] = [];
      let tokenToRemove: number = 0;
      const firstResult: SubscribeResult = bus.subscribe('self-remove', BrowserEventType.PAGE_BEGIN,
        (event: BrowserEvent) => {
          order.push('self');
          bus.unsubscribe(tokenToRemove);
        }, HIGH_PRIORITY);
      tokenToRemove = firstResult.token;
      bus.subscribe('survivor', BrowserEventType.PAGE_BEGIN, (event: BrowserEvent) => {
        order.push('survivor');
      });
      CommonEventUtil.onPageBegin(bus, 'https://example.com');
      TestLogger.info(TAG, `reentrant unsubscribe order=${order.join('>')} left=${bus.registry.subscriptions.length}`);
      expect(order.length).assertEqual(2);
      expect(order[1]).assertEqual('survivor');
      expect(bus.registry.subscriptions.length).assertEqual(1);
      expect(bus.hasBinding('survivor', BrowserEventType.PAGE_BEGIN)).assertTrue();
      TestLogger.pass(TAG, 'CommonEvent_Reentrant_027');
    });

    it('CommonEvent_Journal_028', 0, async () => {
      TestLogger.caseBegin(TAG, 'CommonEvent_Journal_028');
      TestLogger.step(TAG, 'the journal preserves dispatch sequence across event types');
      const bus: BrowserEventBus = new BrowserEventBus();
      const handler = (event: BrowserEvent): void => { };
      bus.subscribe('journal-a', BrowserEventType.PAGE_BEGIN, handler);
      bus.subscribe('journal-b', BrowserEventType.PROGRESS_CHANGE, handler);
      CommonEventUtil.onPageBegin(bus, 'https://example.com');
      CommonEventUtil.onProgressChange(bus, 30);
      CommonEventUtil.onProgressChange(bus, 70);
      TestLogger.info(TAG, `journal records=${bus.journal.size()} keys=${bus.journal.handlerKeys().join(',')}`);
      expect(bus.journal.size()).assertEqual(3);
      expect(bus.journal.countType(BrowserEventType.PAGE_BEGIN)).assertEqual(1);
      expect(bus.journal.countType(BrowserEventType.PROGRESS_CHANGE)).assertEqual(2);
      expect(bus.journal.records[0].sequence).assertEqual(1);
      expect(bus.journal.records[2].sequence).assertEqual(3);
      TestLogger.pass(TAG, 'CommonEvent_Journal_028');
    });

    it('CommonEvent_Journal_029', 0, async () => {
      TestLogger.caseBegin(TAG, 'CommonEvent_Journal_029');
      TestLogger.step(TAG, 'event statistics aggregate every consumed type');
      const bus: BrowserEventBus = new BrowserEventBus();
      const statistics: EventStatistics = new EventStatistics();
      bus.subscribe('stats-a', BrowserEventType.PAGE_BEGIN, (event: BrowserEvent) => {
        statistics.consume(event);
      });
      bus.subscribe('stats-b', BrowserEventType.PAGE_END, (event: BrowserEvent) => {
        statistics.consume(event);
      });
      bus.subscribe('stats-c', BrowserEventType.PROGRESS_CHANGE, (event: BrowserEvent) => {
        statistics.consume(event);
      });
      CommonEventUtil.onPageBegin(bus, 'https://example.com');
      CommonEventUtil.onProgressChange(bus, 45);
      CommonEventUtil.onPageEnd(bus, 'https://example.com');
      TestLogger.info(TAG, `statistics summary=${statistics.summary()}`);
      expect(statistics.total).assertEqual(3);
      expect(statistics.countOf(BrowserEventType.PAGE_BEGIN)).assertEqual(1);
      expect(statistics.countOf(BrowserEventType.PROGRESS_CHANGE)).assertEqual(1);
      expect(statistics.urlSamples.length).assertEqual(2);
      statistics.reset();
      expect(statistics.total).assertEqual(0);
      TestLogger.pass(TAG, 'CommonEvent_Journal_029');
    });

    it('CommonEvent_BackPress_030', 0, async () => {
      TestLogger.caseBegin(TAG, 'CommonEvent_BackPress_030');
      TestLogger.step(TAG, 'back press publishes the consumed flag as a progress surrogate');
      const bus: BrowserEventBus = new BrowserEventBus();
      const consumedFlags: number[] = [];
      bus.subscribe('back-a', BrowserEventType.BACK_PRESS, (event: BrowserEvent) => {
        consumedFlags.push(event.progress);
      });
      expect(CommonEventUtil.onBackPress(bus, true)).assertTrue();
      expect(CommonEventUtil.onBackPress(bus, false)).assertTrue();
      TestLogger.info(TAG, `back flags=${consumedFlags.join(',')}`);
      expect(consumedFlags[0]).assertEqual(1);
      expect(consumedFlags[1]).assertEqual(0);
      expect(bus.journal.countType(BrowserEventType.BACK_PRESS)).assertEqual(2);
      TestLogger.pass(TAG, 'CommonEvent_BackPress_030');
    });

    it('CommonEvent_UrlSubmit_031', 0, async () => {
      TestLogger.caseBegin(TAG, 'CommonEvent_UrlSubmit_031');
      TestLogger.step(TAG, 'about and file urls bypass host shape validation');
      const bus: BrowserEventBus = new BrowserEventBus();
      const urls: string[] = [];
      bus.subscribe('special-url', BrowserEventType.URL_SUBMIT, (event: BrowserEvent) => {
        urls.push(event.url);
      });
      expect(CommonEventUtil.onUrlSubmit(bus, 'about:blank')).assertTrue();
      expect(CommonEventUtil.onUrlSubmit(bus, 'file:///data/index.html')).assertTrue();
      TestLogger.info(TAG, `special urls=${urls.join(',')}`);
      expect(urls.length).assertEqual(2);
      expect(urls[0]).assertEqual('about:blank');
      expect(urls[1].startsWith('file://')).assertTrue();
      TestLogger.pass(TAG, 'CommonEvent_UrlSubmit_031');
    });

    it('CommonEvent_Describe_032', 0, async () => {
      TestLogger.caseBegin(TAG, 'CommonEvent_Describe_032');
      TestLogger.step(TAG, 'payload description exposes type url and progress');
      const bus: BrowserEventBus = new BrowserEventBus();
      const event: BrowserEvent = makeEvent(BrowserEventType.PAGE_BEGIN,
        'https://example.com/describe', 12, -1, 'test', bus.clock);
      const text: string = EventPayloadValidator.describe(event);
      TestLogger.info(TAG, `describe=${text}`);
      expect(text.startsWith('page-begin')).assertTrue();
      expect(text.indexOf('https://example.com/describe')).assertLarger(-1);
      expect(text.indexOf('@12')).assertLarger(-1);
      expect(event.id.startsWith('page-begin-')).assertTrue();
      TestLogger.pass(TAG, 'CommonEvent_Describe_032');
    });

    it('CommonEvent_Type_033', 0, async () => {
      TestLogger.caseBegin(TAG, 'CommonEvent_Type_033');
      TestLogger.step(TAG, 'an unknown numeric type fails validation before dispatch');
      const bus: BrowserEventBus = new BrowserEventBus();
      let received: number = 0;
      bus.subscribe('type-a', BrowserEventType.PAGE_BEGIN, (event: BrowserEvent) => {
        received += 1;
      });
      const bogus: BrowserEvent = makeEvent(BrowserEventType.PAGE_BEGIN, 'https://example.com',
        0, -1, 'test', bus.clock);
      bogus.type = 99 as BrowserEventType;
      const published: boolean = bus.publish(bogus);
      TestLogger.info(TAG, `bogus type published=${published} validation=${validationName(bus.lastValidation)}`);
      expect(published).assertFalse();
      expect(bus.lastValidation).assertEqual(EventValidation.UNKNOWN_TYPE);
      expect(received).assertEqual(0);
      expect(EventPayloadValidator.validateType(99)).assertEqual(EventValidation.UNKNOWN_TYPE);
      TestLogger.pass(TAG, 'CommonEvent_Type_033');
    });

    it('CommonEvent_Stress_034', 0, async () => {
      TestLogger.caseBegin(TAG, 'CommonEvent_Stress_034');
      TestLogger.step(TAG, 'one hundred progress events keep counts and order stable');
      const bus: BrowserEventBus = new BrowserEventBus();
      let received: number = 0;
      const progressSeen: number[] = [];
      bus.subscribe('stress-a', BrowserEventType.PROGRESS_CHANGE, (event: BrowserEvent) => {
        received += 1;
        progressSeen.push(event.progress);
      });
      for (let index = 0; index < STRESS_PUBLISH_COUNT; index++) {
        CommonEventUtil.onProgressChange(bus, index % 101);
      }
      TestLogger.info(TAG, `stress received=${received} dispatches=${bus.dispatchCount}`);
      expect(received).assertEqual(STRESS_PUBLISH_COUNT);
      expect(bus.dispatchCount).assertEqual(STRESS_PUBLISH_COUNT);
      expect(bus.journal.size()).assertEqual(STRESS_PUBLISH_COUNT);
      expect(progressSeen[0]).assertEqual(0);
      expect(progressSeen[99]).assertEqual(99);
      expect(bus.handlerFailures).assertEqual(0);
      TestLogger.pass(TAG, 'CommonEvent_Stress_034');
    });

    it('CommonEvent_Timestamp_035', 0, async () => {
      TestLogger.caseBegin(TAG, 'CommonEvent_Timestamp_035');
      TestLogger.step(TAG, 'event timestamps are strictly increasing through the mock clock');
      const bus: BrowserEventBus = new BrowserEventBus();
      const timestamps: number[] = [];
      bus.subscribe('time-a', BrowserEventType.PAGE_BEGIN, (event: BrowserEvent) => {
        timestamps.push(event.timestamp);
      });
      CommonEventUtil.onPageBegin(bus, 'https://example.com/1');
      CommonEventUtil.onPageBegin(bus, 'https://example.com/2');
      CommonEventUtil.onPageBegin(bus, 'https://example.com/3');
      TestLogger.info(TAG, `timestamps=${timestamps.join(',')}`);
      expect(timestamps.length).assertEqual(3);
      expect(timestamps[1] > timestamps[0]).assertTrue();
      expect(timestamps[2] > timestamps[1]).assertTrue();
      expect(bus.clock.now()).assertEqual(timestamps[2] + 1);
      TestLogger.pass(TAG, 'CommonEvent_Timestamp_035');
    });

    it('CommonEvent_Token_036', 0, async () => {
      TestLogger.caseBegin(TAG, 'CommonEvent_Token_036');
      TestLogger.step(TAG, 'tokens keep increasing and are never reused after unsubscribe');
      const bus: BrowserEventBus = new BrowserEventBus();
      const handler = (event: BrowserEvent): void => { };
      const first: SubscribeResult = bus.subscribe('token-a', BrowserEventType.PAGE_BEGIN, handler);
      bus.unsubscribe(first.token);
      const second: SubscribeResult = bus.subscribe('token-b', BrowserEventType.PAGE_BEGIN, handler);
      const third: SubscribeResult = bus.subscribe('token-c', BrowserEventType.PAGE_BEGIN, handler);
      TestLogger.info(TAG, `tokens=${first.token},${second.token},${third.token}`);
      expect(second.token).assertEqual(first.token + 1);
      expect(third.token).assertEqual(second.token + 1);
      expect(bus.registry.findByToken(first.token) === null).assertTrue();
      expect(bus.registry.findByToken(third.token) === null).assertFalse();
      TestLogger.pass(TAG, 'CommonEvent_Token_036');
    });

    it('CommonEvent_EventId_037', 0, async () => {
      TestLogger.caseBegin(TAG, 'CommonEvent_EventId_037');
      TestLogger.step(TAG, 'event ids stay unique across rapid publications');
      const bus: BrowserEventBus = new BrowserEventBus();
      const ids: string[] = [];
      bus.subscribe('ids-a', BrowserEventType.PROGRESS_CHANGE, (event: BrowserEvent) => {
        ids.push(event.id);
      });
      for (let index = 0; index < 5; index++) {
        CommonEventUtil.onProgressChange(bus, index * 20);
      }
      TestLogger.info(TAG, `event ids=${ids.join(',')}`);
      expect(ids.length).assertEqual(5);
      const unique: number = ids.filter((value: string, index: number) =>
        ids.indexOf(value) === index).length;
      expect(unique).assertEqual(5);
      TestLogger.pass(TAG, 'CommonEvent_EventId_037');
    });

    it('CommonEvent_Reset_038', 0, async () => {
      TestLogger.caseBegin(TAG, 'CommonEvent_Reset_038');
      TestLogger.step(TAG, 'reset clears handlers journal counters and deferred queue');
      const bus: BrowserEventBus = new BrowserEventBus();
      bus.subscribe('reset-a', BrowserEventType.PAGE_BEGIN, (event: BrowserEvent) => {
        throw new Error('pre reset failure');
      });
      CommonEventUtil.onPageBegin(bus, 'https://example.com');
      expect(bus.handlerFailures).assertEqual(1);
      bus.reset();
      TestLogger.info(TAG, `after reset handlers=${bus.bindings.length} journal=${bus.journal.size()}`);
      expect(bus.bindings.length).assertEqual(0);
      expect(bus.registry.subscriptions.length).assertEqual(0);
      expect(bus.journal.size()).assertEqual(0);
      expect(bus.dispatchCount).assertEqual(0);
      expect(bus.handlerFailures).assertEqual(0);
      expect(bus.rejectedEvents).assertEqual(0);
      expect(bus.lastEvent === null).assertTrue();
      TestLogger.pass(TAG, 'CommonEvent_Reset_038');
    });

    it('CommonEvent_MixedOrder_039', 0, async () => {
      TestLogger.caseBegin(TAG, 'CommonEvent_MixedOrder_039');
      TestLogger.step(TAG, 'mixed types keep independent priority queues');
      const bus: BrowserEventBus = new BrowserEventBus();
      const order: string[] = [];
      bus.subscribe('page-high', BrowserEventType.PAGE_BEGIN, (event: BrowserEvent) => {
        order.push('page-high');
      }, HIGH_PRIORITY);
      bus.subscribe('page-low', BrowserEventType.PAGE_BEGIN, (event: BrowserEvent) => {
        order.push('page-low');
      }, LOW_PRIORITY);
      bus.subscribe('progress-only', BrowserEventType.PROGRESS_CHANGE, (event: BrowserEvent) => {
        order.push('progress-only');
      });
      CommonEventUtil.onPageBegin(bus, 'https://example.com');
      CommonEventUtil.onProgressChange(bus, 10);
      TestLogger.info(TAG, `mixed order=${order.join('>')}`);
      expect(order.length).assertEqual(3);
      expect(order[0]).assertEqual('page-high');
      expect(order[1]).assertEqual('page-low');
      expect(order[2]).assertEqual('progress-only');
      TestLogger.pass(TAG, 'CommonEvent_MixedOrder_039');
    });

    it('CommonEvent_UI_040', 0, async () => {
      TestLogger.caseBegin(TAG, 'CommonEvent_UI_040');
      TestLogger.step(TAG, 'the page observer sees a ui driven page begin event');
      const bus: BrowserEventBus = new BrowserEventBus();
      const events: string[] = [];
      CommonEventUtil.registerPageObservers(bus, 'ui-block', (event: BrowserEvent) => {
        events.push(eventName(event.type));
      });
      const exists: boolean = await componentByIdExists(driver, ID_INPUT_URL);
      await serializedDelay(driver, DELAY_TOUCH_EVENT);
      CommonEventUtil.onPageBegin(bus, 'https://example.com');
      CommonEventUtil.onProgressChange(bus, 50);
      TestLogger.info(TAG, `ui event count=${events.length} input exists=${exists}`);
      expect(exists).assertTrue();
      expect(events.length).assertEqual(2);
      expect(events[0]).assertEqual('page-begin');
      expect(events[1]).assertEqual('progress-change');
      TestLogger.pass(TAG, 'CommonEvent_UI_040');
    });

    it('CommonEvent_UI_041', 0, async () => {
      TestLogger.caseBegin(TAG, 'CommonEvent_UI_041');
      TestLogger.step(TAG, 'a tab add and select cycle emits two ordered tab events');
      const bus: BrowserEventBus = new BrowserEventBus();
      const tabEvents: string[] = [];
      bus.subscribe('ui-tab-add', BrowserEventType.TAB_ADD, (event: BrowserEvent) => {
        tabEvents.push(`add:${event.index}`);
      });
      bus.subscribe('ui-tab-select', BrowserEventType.TAB_SELECT, (event: BrowserEvent) => {
        tabEvents.push(`select:${event.index}`);
      });
      const addExists: boolean = await componentByIdExists(driver, ID_ACTION_ADD);
      await serializedDelay(driver, DELAY_TAB_OPERATION);
      CommonEventUtil.onTabAdd(bus, 1);
      CommonEventUtil.onTabSelect(bus, 1);
      TestLogger.info(TAG, `ui tab events=${tabEvents.join(',')} add exists=${addExists}`);
      expect(addExists).assertTrue();
      expect(tabEvents[0]).assertEqual('add:1');
      expect(tabEvents[1]).assertEqual('select:1');
      expect(bus.journal.countType(BrowserEventType.TAB_ADD)).assertEqual(1);
      expect(bus.journal.countType(BrowserEventType.TAB_SELECT)).assertEqual(1);
      TestLogger.pass(TAG, 'CommonEvent_UI_041');
    });

    it('CommonEvent_UI_042', 0, async () => {
      TestLogger.caseBegin(TAG, 'CommonEvent_UI_042');
      TestLogger.step(TAG, 'back navigation button remains observable while events dispatch');
      const bus: BrowserEventBus = new BrowserEventBus();
      let backCount: number = 0;
      bus.subscribe('ui-back', BrowserEventType.BACK_PRESS, (event: BrowserEvent) => {
        backCount += 1;
      });
      const navigationCount: number = await countById(driver, ID_NAV_BACK);
      await serializedDelay(driver, DELAY_TOUCH_EVENT);
      CommonEventUtil.onBackPress(bus, navigationCount > 0);
      TestLogger.info(TAG, `nav components=${navigationCount} back events=${backCount}`);
      expect(navigationCount).assertLarger(0);
      expect(backCount).assertEqual(1);
      expect(bus.journal.size()).assertEqual(1);
      expect(TIMEOUT_PAGE_LOAD > TIMEOUT_COMPONENT).assertTrue();
      TestLogger.pass(TAG, 'CommonEvent_UI_042');
    });

  });
}

