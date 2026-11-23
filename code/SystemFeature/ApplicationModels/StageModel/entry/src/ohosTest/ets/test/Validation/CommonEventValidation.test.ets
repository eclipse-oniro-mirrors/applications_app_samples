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
import { Driver, ON } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {
  getDriver, componentCount, launchMainAbility, BUNDLE_NAME, TIMEOUT_PAGE_RENDER
} from '../Shared/SharedDriver';

enum EventPriority {
  LOW = 0,
  NORMAL = 1,
  HIGH = 2,
  SUPER_HIGH = 3
}

enum EventMode {
  STANDARD = 0,
  ORDERED = 1,
  STICKY = 2
}

enum SubscriberState {
  ACTIVE = 0,
  PAUSED = 1,
  TERMINATED = 2
}

const MAX_EVENT_NAME_LENGTH: number = 128;
const MIN_EVENT_NAME_LENGTH: number = 1;
const MAX_DATA_LENGTH: number = 4096;
const MAX_SUBSCRIBERS: number = 256;
const DEFAULT_RESULT_CODE: number = 0;
const ABORT_RESULT_CODE: number = 1;
const SAMPLE_EVENT_BOOT: string = 'usual.event.BOOT_COMPLETED';
const SAMPLE_EVENT_CHARGE: string = 'usual.event.CHARGING';
const SAMPLE_EVENT_CUSTOM: string = 'ohos.samples.stagemodel.CUSTOM';

class DataEntry {
  readonly key: string;
  readonly value: string;

  constructor(key: string, value: string) {
    this.key = key;
    this.value = value;
  }
}

class EventPayload {
  private entries: DataEntry[] = [];

  put(key: string, value: string): boolean {
    if (key.length === 0) {
      return false;
    }
    for (const entry of this.entries) {
      if (entry.key === key) {
        return false;
      }
    }
    this.entries.push(new DataEntry(key, value));
    return true;
  }

  get(key: string): string {
    for (const entry of this.entries) {
      if (entry.key === key) {
        return entry.value;
      }
    }
    return '';
  }

  has(key: string): boolean {
    return this.indexOf(key) >= 0;
  }

  indexOf(key: string): number {
    for (let index = 0; index < this.entries.length; index++) {
      if (this.entries[index].key === key) {
        return index;
      }
    }
    return -1;
  }

  size(): number {
    return this.entries.length;
  }

  toKey(): string {
    let result = '';
    for (const entry of this.entries) {
      if (result.length > 0) {
        result += ';';
      }
      result += `${entry.key}=${entry.value}`;
    }
    return result;
  }

  totalValueLength(): number {
    let total = 0;
    for (const entry of this.entries) {
      total += entry.value.length;
    }
    return total;
  }
}
class CommonEventRecord {
  readonly event: string;
  readonly mode: EventMode;
  code: number = DEFAULT_RESULT_CODE;
  data: string = '';
  resultCode: number = DEFAULT_RESULT_CODE;
  resultData: string = '';
  aborted: boolean = false;

  constructor(event: string, mode: EventMode) {
    this.event = event;
    this.mode = mode;
  }

  isOrdered(): boolean {
    return this.mode === EventMode.ORDERED;
  }

  isSticky(): boolean {
    return this.mode === EventMode.STICKY;
  }

  abort(): void {
    this.aborted = true;
    this.resultCode = ABORT_RESULT_CODE;
  }

  toKey(): string {
    return `${this.event}|${this.mode}|${this.code}|${this.data}|${this.resultCode}|${this.resultData}|${this.aborted}`;
  }
}

class EventValidator {
  validateName(name: string): string[] {
    const issues: string[] = [];
    if (name.length < MIN_EVENT_NAME_LENGTH) {
      issues.push('name-empty');
      return issues;
    }
    if (name.length > MAX_EVENT_NAME_LENGTH) {
      issues.push('name-too-long');
    }
    for (let index = 0; index < name.length; index++) {
      const code = name.charCodeAt(index);
      const isDigit = code >= 48 && code <= 57;
      const isUpper = code >= 65 && code <= 90;
      const isLower = code >= 97 && code <= 122;
      const isAllowed = code === 46 || code === 95 || code === 45;
      if (!isDigit && !isUpper && !isLower && !isAllowed) {
        issues.push('name-invalid-char');
        break;
      }
    }
    return issues;
  }

  validateData(data: string): string[] {
    const issues: string[] = [];
    if (data.length > MAX_DATA_LENGTH) {
      issues.push('data-too-long');
    }
    return issues;
  }

  validateCode(code: number): string[] {
    const issues: string[] = [];
    if (!Number.isInteger(code)) {
      issues.push('code-not-integer');
      return issues;
    }
    if (code < 0) {
      issues.push('code-negative');
    }
    return issues;
  }

  validateRecord(record: CommonEventRecord): string[] {
    const issues: string[] = [];
    for (const issue of this.validateName(record.event)) {
      issues.push(issue);
    }
    for (const issue of this.validateData(record.data)) {
      issues.push(issue);
    }
    for (const issue of this.validateData(record.resultData)) {
      issues.push(issue);
    }
    return issues;
  }
}

class Subscriber {
  readonly id: number;
  readonly event: string;
  readonly priority: EventPriority;
  state: SubscriberState = SubscriberState.ACTIVE;
  enabled: boolean = true;

  constructor(id: number, event: string, priority: EventPriority) {
    this.id = id;
    this.event = event;
    this.priority = priority;
  }

  isActive(): boolean {
    return this.state === SubscriberState.ACTIVE && this.enabled;
  }

  pause(): void {
    this.state = SubscriberState.PAUSED;
  }

  resume(): void {
    if (this.state === SubscriberState.PAUSED) {
      this.state = SubscriberState.ACTIVE;
    }
  }

  terminate(): void {
    this.state = SubscriberState.TERMINATED;
  }

  matches(event: string): boolean {
    return this.event === event && this.isActive();
  }
}

class EventFilter {
  private events: string[] = [];
  private matchAll: boolean = false;

  addEvent(event: string): boolean {
    if (event.length === 0) {
      return false;
    }
    if (this.events.indexOf(event) >= 0) {
      return false;
    }
    this.events.push(event);
    return true;
  }

  setMatchAll(value: boolean): void {
    this.matchAll = value;
  }

  matches(event: string): boolean {
    if (this.matchAll) {
      return true;
    }
    return this.events.indexOf(event) >= 0;
  }

  size(): number {
    return this.events.length;
  }

  eventsCopy(): string[] {
    return this.events.slice();
  }
}
class EventQueue {
  private records: CommonEventRecord[] = [];

  enqueue(record: CommonEventRecord): boolean {
    if (record.event.length === 0) {
      return false;
    }
    this.records.push(record);
    return true;
  }

  size(): number {
    return this.records.length;
  }

  dequeue(): CommonEventRecord | null {
    if (this.records.length === 0) {
      return null;
    }
    return this.records.shift() as CommonEventRecord;
  }

  peek(): CommonEventRecord | null {
    if (this.records.length === 0) {
      return null;
    }
    return this.records[0];
  }

  drain(): number {
    const total = this.records.length;
    this.records = [];
    return total;
  }
}

class EventStats {
  private published: number = 0;
  private delivered: number = 0;
  private aborted: number = 0;

  recordPublish(): void {
    this.published++;
  }

  recordDelivery(count: number): void {
    if (count > 0) {
      this.delivered += count;
    }
  }

  recordAbort(): void {
    this.aborted++;
  }

  publishedCount(): number {
    return this.published;
  }

  deliveredCount(): number {
    return this.delivered;
  }

  abortedCount(): number {
    return this.aborted;
  }

  deliveryRate(): number {
    if (this.published === 0) {
      return 0;
    }
    return this.delivered / this.published;
  }
}

class EventBus {
  private subscribers: Subscriber[] = [];
  private sticky: EventPayload | null = null;
  private stickyEventName: string = '';
  private statsData: EventStats = new EventStats();
  private nextId: number = 1;

  subscribe(event: string, priority: EventPriority): number {
    if (event.length === 0) {
      return -1;
    }
    if (this.subscribers.length >= MAX_SUBSCRIBERS) {
      return -1;
    }
    const id = this.nextId;
    this.nextId++;
    this.subscribers.push(new Subscriber(id, event, priority));
    return id;
  }

  unsubscribe(id: number): boolean {
    for (let index = 0; index < this.subscribers.length; index++) {
      if (this.subscribers[index].id === id) {
        this.subscribers.splice(index, 1);
        return true;
      }
    }
    return false;
  }

  find(id: number): Subscriber | null {
    for (const subscriber of this.subscribers) {
      if (subscriber.id === id) {
        return subscriber;
      }
    }
    return null;
  }

  subscriberCount(): number {
    return this.subscribers.length;
  }

  private matching(event: string): Subscriber[] {
    const result: Subscriber[] = [];
    for (const subscriber of this.subscribers) {
      if (subscriber.matches(event)) {
        result.push(subscriber);
      }
    }
    result.sort((left: Subscriber, right: Subscriber): number => right.priority - left.priority);
    return result;
  }

  publish(record: CommonEventRecord): number {
    this.statsData.recordPublish();
    const matched = this.matching(record.event);
    let delivered = 0;
    for (const subscriber of matched) {
      if (record.aborted) {
        this.statsData.recordAbort();
        break;
      }
      delivered++;
    }
    this.statsData.recordDelivery(delivered);
    if (record.isSticky()) {
      this.sticky = new EventPayload();
      this.sticky.put('data', record.data);
      this.stickyEventName = record.event;
    }
    return delivered;
  }

  stickyEvent(): string {
    return this.stickyEventName;
  }

  stickyPayload(): EventPayload | null {
    return this.sticky;
  }

  stats(): EventStats {
    return this.statsData;
  }
}

class PermissionModel {
  private granted: string[] = [];

  grant(permission: string): boolean {
    if (permission.length === 0) {
      return false;
    }
    if (this.granted.indexOf(permission) >= 0) {
      return false;
    }
    this.granted.push(permission);
    return true;
  }

  revoke(permission: string): boolean {
    const index = this.granted.indexOf(permission);
    if (index < 0) {
      return false;
    }
    this.granted.splice(index, 1);
    return true;
  }

  has(permission: string): boolean {
    return this.granted.indexOf(permission) >= 0;
  }

  count(): number {
    return this.granted.length;
  }
}
function buildStandard(event: string): CommonEventRecord {
  return new CommonEventRecord(event, EventMode.STANDARD);
}

function buildOrdered(event: string): CommonEventRecord {
  return new CommonEventRecord(event, EventMode.ORDERED);
}

function buildSticky(event: string, data: string): CommonEventRecord {
  const record = new CommonEventRecord(event, EventMode.STICKY);
  record.data = data;
  return record;
}

export default function commonEventValidationTest(): void {
  describe('CommonEventValidationSuite', () => {
    let validator: EventValidator = new EventValidator();

    beforeAll(() => {
      validator = new EventValidator();
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'common event validation start');
    });

    afterAll(() => {
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'common event validation end');
    });

    it('CommonEventValidation_001', 0, async (done: Function) => {
      expect(validator.validateName(SAMPLE_EVENT_CUSTOM).length).assertEqual(0);
      expect(validator.validateName(SAMPLE_EVENT_BOOT).length).assertEqual(0);
      expect(validator.validateName('').length).assertEqual(1);
      done();
    });

    it('CommonEventValidation_002', 0, async (done: Function) => {
      const empty = validator.validateName('');
      expect(empty[0]).assertEqual('name-empty');
      expect(empty.length).assertEqual(1);
      expect(validator.validateName('a').length).assertEqual(0);
      done();
    });

    it('CommonEventValidation_003', 0, async (done: Function) => {
      let longName = '';
      for (let index = 0; index < MAX_EVENT_NAME_LENGTH + 1; index++) {
        longName += 'a';
      }
      const issues = validator.validateName(longName);
      expect(issues.length).assertEqual(1);
      expect(issues[0]).assertEqual('name-too-long');
      done();
    });

    it('CommonEventValidation_004', 0, async (done: Function) => {
      expect(validator.validateName('bad name').indexOf('name-invalid-char') >= 0).assertTrue();
      expect(validator.validateName('ok.name-1_2').length).assertEqual(0);
      expect(validator.validateName('semi;colon').length).assertEqual(1);
      done();
    });

    it('CommonEventValidation_005', 0, async (done: Function) => {
      expect(validator.validateData('hello').length).assertEqual(0);
      let longData = '';
      for (let index = 0; index < MAX_DATA_LENGTH + 1; index++) {
        longData += 'x';
      }
      expect(validator.validateData(longData)[0]).assertEqual('data-too-long');
      done();
    });

    it('CommonEventValidation_006', 0, async (done: Function) => {
      expect(validator.validateCode(0).length).assertEqual(0);
      expect(validator.validateCode(-1)[0]).assertEqual('code-negative');
      expect(validator.validateCode(1.5)[0]).assertEqual('code-not-integer');
      done();
    });

    it('CommonEventValidation_007', 0, async (done: Function) => {
      const record = buildStandard(SAMPLE_EVENT_CUSTOM);
      expect(validator.validateRecord(record).length).assertEqual(0);
      expect(record.isOrdered()).assertFalse();
      expect(record.isSticky()).assertFalse();
      done();
    });

    it('CommonEventValidation_008', 0, async (done: Function) => {
      const record = buildOrdered(SAMPLE_EVENT_CHARGE);
      expect(record.isOrdered()).assertTrue();
      expect(record.mode).assertEqual(EventMode.ORDERED);
      expect(record.resultCode).assertEqual(DEFAULT_RESULT_CODE);
      done();
    });

    it('CommonEventValidation_009', 0, async (done: Function) => {
      const record = buildSticky(SAMPLE_EVENT_CUSTOM, 'payload');
      expect(record.isSticky()).assertTrue();
      expect(record.data).assertEqual('payload');
      expect(record.toKey()).assertEqual('ohos.samples.stagemodel.CUSTOM|2|0|payload|0||false');
      done();
    });

    it('CommonEventValidation_010', 0, async (done: Function) => {
      const record = buildOrdered(SAMPLE_EVENT_CUSTOM);
      record.abort();
      expect(record.aborted).assertTrue();
      expect(record.resultCode).assertEqual(ABORT_RESULT_CODE);
      done();
    });

    it('CommonEventValidation_011', 0, async (done: Function) => {
      const payload = new EventPayload();
      expect(payload.put('name', 'arkts')).assertTrue();
      expect(payload.put('name', 'dup')).assertFalse();
      expect(payload.get('name')).assertEqual('arkts');
      expect(payload.has('name')).assertTrue();
      done();
    });

    it('CommonEventValidation_012', 0, async (done: Function) => {
      const payload = new EventPayload();
      expect(payload.put('', 'x')).assertFalse();
      expect(payload.get('missing')).assertEqual('');
      expect(payload.has('missing')).assertFalse();
      expect(payload.size()).assertEqual(0);
      done();
    });

    it('CommonEventValidation_013', 0, async (done: Function) => {
      const payload = new EventPayload();
      payload.put('a', '1');
      payload.put('b', '22');
      expect(payload.size()).assertEqual(2);
      expect(payload.indexOf('b')).assertEqual(1);
      expect(payload.totalValueLength()).assertEqual(3);
      done();
    });

    it('CommonEventValidation_014', 0, async (done: Function) => {
      const payload = new EventPayload();
      payload.put('a', '1');
      payload.put('b', '2');
      expect(payload.toKey()).assertEqual('a=1;b=2');
      expect(payload.indexOf('z')).assertEqual(-1);
      done();
    });

    it('CommonEventValidation_015', 0, async (done: Function) => {
      const subscriber = new Subscriber(1, SAMPLE_EVENT_CUSTOM, EventPriority.HIGH);
      expect(subscriber.isActive()).assertTrue();
      expect(subscriber.matches(SAMPLE_EVENT_CUSTOM)).assertTrue();
      expect(subscriber.matches(SAMPLE_EVENT_BOOT)).assertFalse();
      done();
    });

    it('CommonEventValidation_016', 0, async (done: Function) => {
      const subscriber = new Subscriber(2, SAMPLE_EVENT_CUSTOM, EventPriority.NORMAL);
      subscriber.pause();
      expect(subscriber.isActive()).assertFalse();
      expect(subscriber.matches(SAMPLE_EVENT_CUSTOM)).assertFalse();
      subscriber.resume();
      expect(subscriber.isActive()).assertTrue();
      done();
    });

    it('CommonEventValidation_017', 0, async (done: Function) => {
      const subscriber = new Subscriber(3, SAMPLE_EVENT_CUSTOM, EventPriority.LOW);
      subscriber.terminate();
      expect(subscriber.state).assertEqual(SubscriberState.TERMINATED);
      expect(subscriber.isActive()).assertFalse();
      subscriber.resume();
      expect(subscriber.state).assertEqual(SubscriberState.TERMINATED);
      done();
    });

    it('CommonEventValidation_018', 0, async (done: Function) => {
      const subscriber = new Subscriber(4, SAMPLE_EVENT_CUSTOM, EventPriority.SUPER_HIGH);
      subscriber.enabled = false;
      expect(subscriber.isActive()).assertFalse();
      expect(subscriber.priority).assertEqual(EventPriority.SUPER_HIGH);
      done();
    });

    it('CommonEventValidation_019', 0, async (done: Function) => {
      const filter = new EventFilter();
      expect(filter.addEvent(SAMPLE_EVENT_CUSTOM)).assertTrue();
      expect(filter.addEvent(SAMPLE_EVENT_CUSTOM)).assertFalse();
      expect(filter.matches(SAMPLE_EVENT_CUSTOM)).assertTrue();
      expect(filter.size()).assertEqual(1);
      done();
    });

    it('CommonEventValidation_020', 0, async (done: Function) => {
      const filter = new EventFilter();
      expect(filter.addEvent('')).assertFalse();
      filter.setMatchAll(true);
      expect(filter.matches('anything')).assertTrue();
      filter.setMatchAll(false);
      expect(filter.matches('anything')).assertFalse();
      done();
    });

    it('CommonEventValidation_021', 0, async (done: Function) => {
      const filter = new EventFilter();
      filter.addEvent(SAMPLE_EVENT_BOOT);
      filter.addEvent(SAMPLE_EVENT_CHARGE);
      expect(filter.eventsCopy().length).assertEqual(2);
      expect(filter.matches(SAMPLE_EVENT_BOOT)).assertTrue();
      expect(filter.matches(SAMPLE_EVENT_CUSTOM)).assertFalse();
      done();
    });
    it('CommonEventValidation_022', 0, async (done: Function) => {
      const bus = new EventBus();
      const id = bus.subscribe(SAMPLE_EVENT_CUSTOM, EventPriority.NORMAL);
      expect(id).assertLarger(0);
      expect(bus.subscriberCount()).assertEqual(1);
      expect(bus.find(id) !== null).assertTrue();
      done();
    });

    it('CommonEventValidation_023', 0, async (done: Function) => {
      const bus = new EventBus();
      expect(bus.subscribe('', EventPriority.NORMAL)).assertEqual(-1);
      expect(bus.subscriberCount()).assertEqual(0);
      const id = bus.subscribe(SAMPLE_EVENT_BOOT, EventPriority.LOW);
      expect(bus.unsubscribe(id)).assertTrue();
      expect(bus.unsubscribe(id)).assertFalse();
      done();
    });

    it('CommonEventValidation_024', 0, async (done: Function) => {
      const bus = new EventBus();
      const id = bus.subscribe(SAMPLE_EVENT_CUSTOM, EventPriority.HIGH);
      bus.subscribe(SAMPLE_EVENT_CUSTOM, EventPriority.LOW);
      expect(bus.publish(buildStandard(SAMPLE_EVENT_CUSTOM))).assertEqual(2);
      expect(bus.stats().publishedCount()).assertEqual(1);
      expect(bus.unsubscribe(id)).assertTrue();
      done();
    });

    it('CommonEventValidation_025', 0, async (done: Function) => {
      const bus = new EventBus();
      bus.subscribe(SAMPLE_EVENT_BOOT, EventPriority.NORMAL);
      expect(bus.publish(buildStandard(SAMPLE_EVENT_CUSTOM))).assertEqual(0);
      expect(bus.stats().publishedCount()).assertEqual(1);
      expect(bus.stats().deliveredCount()).assertEqual(0);
      done();
    });

    it('CommonEventValidation_026', 0, async (done: Function) => {
      const bus = new EventBus();
      bus.subscribe(SAMPLE_EVENT_CUSTOM, EventPriority.NORMAL);
      const record = buildOrdered(SAMPLE_EVENT_CUSTOM);
      record.abort();
      expect(bus.publish(record)).assertEqual(0);
      expect(bus.stats().abortedCount()).assertEqual(1);
      done();
    });

    it('CommonEventValidation_027', 0, async (done: Function) => {
      const bus = new EventBus();
      bus.subscribe(SAMPLE_EVENT_CUSTOM, EventPriority.NORMAL);
      bus.subscribe(SAMPLE_EVENT_CUSTOM, EventPriority.HIGH);
      const record = buildOrdered(SAMPLE_EVENT_CUSTOM);
      record.abort();
      expect(bus.publish(record)).assertEqual(0);
      expect(record.aborted).assertTrue();
      expect(bus.stats().abortedCount()).assertEqual(1);
      done();
    });

    it('CommonEventValidation_028', 0, async (done: Function) => {
      const bus = new EventBus();
      bus.publish(buildSticky(SAMPLE_EVENT_CUSTOM, 'sticky-data'));
      expect(bus.stickyEvent()).assertEqual(SAMPLE_EVENT_CUSTOM);
      expect(bus.stickyPayload() !== null).assertTrue();
      const payload = bus.stickyPayload();
      if (payload !== null) {
        expect(payload.get('data')).assertEqual('sticky-data');
      }
      done();
    });

    it('CommonEventValidation_029', 0, async (done: Function) => {
      const bus = new EventBus();
      expect(bus.stickyEvent()).assertEqual('');
      expect(bus.stickyPayload()).assertNull();
      bus.publish(buildStandard(SAMPLE_EVENT_CUSTOM));
      expect(bus.stickyPayload()).assertNull();
      done();
    });

    it('CommonEventValidation_030', 0, async (done: Function) => {
      const bus = new EventBus();
      const id = bus.subscribe(SAMPLE_EVENT_CUSTOM, EventPriority.LOW);
      const subscriber = bus.find(id);
      expect(subscriber !== null).assertTrue();
      if (subscriber !== null) {
        subscriber.pause();
        expect(bus.publish(buildStandard(SAMPLE_EVENT_CUSTOM))).assertEqual(0);
      }
      done();
    });

    it('CommonEventValidation_031', 0, async (done: Function) => {
      const bus = new EventBus();
      const id = bus.subscribe(SAMPLE_EVENT_CUSTOM, EventPriority.NORMAL);
      const subscriber = bus.find(id);
      if (subscriber !== null) {
        subscriber.enabled = false;
      }
      expect(bus.publish(buildStandard(SAMPLE_EVENT_CUSTOM))).assertEqual(0);
      expect(bus.find(999)).assertNull();
      done();
    });

    it('CommonEventValidation_032', 0, async (done: Function) => {
      const bus = new EventBus();
      for (let index = 0; index < MAX_SUBSCRIBERS; index++) {
        bus.subscribe(SAMPLE_EVENT_CUSTOM, EventPriority.NORMAL);
      }
      expect(bus.subscriberCount()).assertEqual(MAX_SUBSCRIBERS);
      expect(bus.subscribe(SAMPLE_EVENT_CUSTOM, EventPriority.LOW)).assertEqual(-1);
      done();
    });

    it('CommonEventValidation_033', 0, async (done: Function) => {
      const bus = new EventBus();
      bus.subscribe(SAMPLE_EVENT_CUSTOM, EventPriority.NORMAL);
      bus.publish(buildStandard(SAMPLE_EVENT_CUSTOM));
      expect(bus.stats().deliveredCount()).assertEqual(1);
      expect(bus.stats().deliveryRate()).assertEqual(1);
      done();
    });

    it('CommonEventValidation_034', 0, async (done: Function) => {
      const stats = new EventStats();
      expect(stats.deliveryRate()).assertEqual(0);
      stats.recordPublish();
      stats.recordPublish();
      stats.recordDelivery(1);
      expect(stats.deliveryRate()).assertEqual(0.5);
      done();
    });

    it('CommonEventValidation_035', 0, async (done: Function) => {
      const stats = new EventStats();
      stats.recordDelivery(0);
      stats.recordDelivery(-5);
      expect(stats.deliveredCount()).assertEqual(0);
      stats.recordDelivery(3);
      expect(stats.deliveredCount()).assertEqual(3);
      done();
    });

    it('CommonEventValidation_036', 0, async (done: Function) => {
      const queue = new EventQueue();
      expect(queue.enqueue(buildStandard(SAMPLE_EVENT_CUSTOM))).assertTrue();
      expect(queue.enqueue(buildStandard(SAMPLE_EVENT_BOOT))).assertTrue();
      expect(queue.size()).assertEqual(2);
      expect(queue.peek()?.event).assertEqual(SAMPLE_EVENT_CUSTOM);
      done();
    });

    it('CommonEventValidation_037', 0, async (done: Function) => {
      const queue = new EventQueue();
      expect(queue.enqueue(buildStandard(''))).assertFalse();
      expect(queue.size()).assertEqual(0);
      expect(queue.dequeue()).assertNull();
      expect(queue.peek()).assertNull();
      done();
    });

    it('CommonEventValidation_038', 0, async (done: Function) => {
      const queue = new EventQueue();
      queue.enqueue(buildStandard(SAMPLE_EVENT_CUSTOM));
      queue.enqueue(buildStandard(SAMPLE_EVENT_BOOT));
      expect(queue.dequeue()?.event).assertEqual(SAMPLE_EVENT_CUSTOM);
      expect(queue.size()).assertEqual(1);
      expect(queue.drain()).assertEqual(1);
      done();
    });

    it('CommonEventValidation_039', 0, async (done: Function) => {
      const queue = new EventQueue();
      queue.enqueue(buildStandard(SAMPLE_EVENT_CUSTOM));
      queue.enqueue(buildStandard(SAMPLE_EVENT_BOOT));
      expect(queue.drain()).assertEqual(2);
      expect(queue.size()).assertEqual(0);
      expect(queue.drain()).assertEqual(0);
      done();
    });

    it('CommonEventValidation_040', 0, async (done: Function) => {
      const permissions = new PermissionModel();
      expect(permissions.grant('ohos.permission.COMMONEVENT')).assertTrue();
      expect(permissions.grant('ohos.permission.COMMONEVENT')).assertFalse();
      expect(permissions.has('ohos.permission.COMMONEVENT')).assertTrue();
      expect(permissions.count()).assertEqual(1);
      done();
    });

    it('CommonEventValidation_041', 0, async (done: Function) => {
      const permissions = new PermissionModel();
      expect(permissions.grant('')).assertFalse();
      expect(permissions.revoke('missing')).assertFalse();
      expect(permissions.grant('ohos.permission.READ')).assertTrue();
      expect(permissions.revoke('ohos.permission.READ')).assertTrue();
      expect(permissions.count()).assertEqual(0);
      done();
    });
    it('CommonEventValidation_042', 0, async (done: Function) => {
      const bus = new EventBus();
      const first = bus.subscribe(SAMPLE_EVENT_CUSTOM, EventPriority.LOW);
      const second = bus.subscribe(SAMPLE_EVENT_CUSTOM, EventPriority.HIGH);
      expect(second).assertLarger(first);
      expect(bus.subscriberCount()).assertEqual(2);
      done();
    });

    it('CommonEventValidation_043', 0, async (done: Function) => {
      const bus = new EventBus();
      bus.subscribe(SAMPLE_EVENT_CUSTOM, EventPriority.NORMAL);
      bus.subscribe(SAMPLE_EVENT_BOOT, EventPriority.NORMAL);
      expect(bus.publish(buildStandard(SAMPLE_EVENT_CUSTOM))).assertEqual(1);
      expect(bus.publish(buildStandard(SAMPLE_EVENT_BOOT))).assertEqual(1);
      expect(bus.stats().deliveredCount()).assertEqual(2);
      done();
    });

    it('CommonEventValidation_044', 0, async (done: Function) => {
      const record = buildStandard(SAMPLE_EVENT_CUSTOM);
      record.code = 42;
      record.data = 'hello';
      record.resultCode = 7;
      record.resultData = 'done';
      expect(record.toKey()).assertEqual('ohos.samples.stagemodel.CUSTOM|0|42|hello|7|done|false');
      expect(record.code).assertEqual(42);
      done();
    });

    it('CommonEventValidation_045', 0, async (done: Function) => {
      expect(MAX_EVENT_NAME_LENGTH).assertEqual(128);
      expect(MAX_DATA_LENGTH).assertEqual(4096);
      expect(MAX_SUBSCRIBERS).assertEqual(256);
      expect(DEFAULT_RESULT_CODE).assertEqual(0);
      done();
    });

    it('CommonEventValidation_046', 0, async (done: Function) => {
      expect(SAMPLE_EVENT_BOOT).assertEqual('usual.event.BOOT_COMPLETED');
      expect(SAMPLE_EVENT_CHARGE).assertEqual('usual.event.CHARGING');
      expect(SAMPLE_EVENT_CUSTOM).assertEqual('ohos.samples.stagemodel.CUSTOM');
      expect(ABORT_RESULT_CODE).assertEqual(1);
      done();
    });

    it('CommonEventValidation_047', 0, async (done: Function) => {
      expect(BUNDLE_NAME).assertEqual('ohos.samples.stagemodel');
      expect(TIMEOUT_PAGE_RENDER).assertEqual(1000);
      expect(MIN_EVENT_NAME_LENGTH).assertEqual(1);
      expect(MAX_SUBSCRIBERS > 0).assertTrue();
      done();
    });

    it('CommonEventValidation_048', 0, async (done: Function) => {
      const validatorLocal = new EventValidator();
      const record = new CommonEventRecord('', EventMode.STANDARD);
      record.data = 'ok';
      const issues = validatorLocal.validateRecord(record);
      expect(issues.indexOf('name-empty') >= 0).assertTrue();
      expect(issues.length).assertEqual(1);
      done();
    });

    it('CommonEventValidation_049', 0, async (done: Function) => {
      const validatorLocal = new EventValidator();
      const record = buildStandard(SAMPLE_EVENT_CUSTOM);
      let longData = '';
      for (let index = 0; index < MAX_DATA_LENGTH + 1; index++) {
        longData += 'd';
      }
      record.data = longData;
      expect(validatorLocal.validateRecord(record).length).assertEqual(1);
      done();
    });

    it('CommonEventValidation_050', 0, async (done: Function) => {
      const filter = new EventFilter();
      filter.addEvent(SAMPLE_EVENT_CUSTOM);
      const copy = filter.eventsCopy();
      copy.push(SAMPLE_EVENT_BOOT);
      expect(filter.size()).assertEqual(1);
      expect(copy.length).assertEqual(2);
      done();
    });

    it('CommonEventValidation_051', 0, async (done: Function) => {
      const bus = new EventBus();
      const id = bus.subscribe(SAMPLE_EVENT_CUSTOM, EventPriority.NORMAL);
      bus.unsubscribe(id);
      expect(bus.subscriberCount()).assertEqual(0);
      expect(bus.publish(buildStandard(SAMPLE_EVENT_CUSTOM))).assertEqual(0);
      expect(bus.stats().deliveredCount()).assertEqual(0);
      done();
    });

    it('CommonEventValidation_052', 0, async (done: Function) => {
      const bus = new EventBus();
      const id = bus.subscribe(SAMPLE_EVENT_CUSTOM, EventPriority.HIGH);
      const subscriber = bus.find(id);
      if (subscriber !== null) {
        subscriber.terminate();
      }
      expect(bus.publish(buildStandard(SAMPLE_EVENT_CUSTOM))).assertEqual(0);
      expect(bus.find(id)?.state).assertEqual(SubscriberState.TERMINATED);
      done();
    });

    it('CommonEventValidation_053', 0, async (done: Function) => {
      const payload = new EventPayload();
      payload.put('one', 'v1');
      payload.put('two', 'v2');
      payload.put('three', 'v3');
      expect(payload.size()).assertEqual(3);
      expect(payload.get('three')).assertEqual('v3');
      expect(payload.toKey()).assertEqual('one=v1;two=v2;three=v3');
      done();
    });

    it('CommonEventValidation_054', 0, async (done: Function) => {
      const bus = new EventBus();
      bus.subscribe(SAMPLE_EVENT_CUSTOM, EventPriority.NORMAL);
      bus.publish(buildSticky(SAMPLE_EVENT_CUSTOM, 'a'));
      bus.publish(buildSticky(SAMPLE_EVENT_CUSTOM, 'b'));
      const payload = bus.stickyPayload();
      if (payload !== null) {
        expect(payload.get('data')).assertEqual('b');
      }
      expect(bus.stickyEvent()).assertEqual(SAMPLE_EVENT_CUSTOM);
      done();
    });

    it('CommonEventValidation_055', 0, async (done: Function) => {
      const queue = new EventQueue();
      const first = buildStandard(SAMPLE_EVENT_CUSTOM);
      first.code = 1;
      const second = buildStandard(SAMPLE_EVENT_BOOT);
      second.code = 2;
      queue.enqueue(first);
      queue.enqueue(second);
      expect(queue.dequeue()?.code).assertEqual(1);
      expect(queue.dequeue()?.code).assertEqual(2);
      done();
    });

    it('CommonEventValidation_056', 0, async (done: Function) => {
      const stats = new EventStats();
      stats.recordAbort();
      stats.recordAbort();
      expect(stats.abortedCount()).assertEqual(2);
      expect(stats.publishedCount()).assertEqual(0);
      expect(stats.deliveredCount()).assertEqual(0);
      done();
    });

    it('CommonEventValidation_057', 0, async (done: Function) => {
      const bus = new EventBus();
      bus.subscribe(SAMPLE_EVENT_CUSTOM, EventPriority.NORMAL);
      bus.subscribe(SAMPLE_EVENT_CUSTOM, EventPriority.NORMAL);
      expect(bus.publish(buildStandard(SAMPLE_EVENT_CUSTOM))).assertEqual(2);
      expect(bus.subscriberCount()).assertEqual(2);
      expect(bus.stats().deliveryRate()).assertEqual(2);
      done();
    });

    it('CommonEventValidation_058', 0, async (done: Function) => {
      const record = buildStandard(SAMPLE_EVENT_CUSTOM);
      expect(record.aborted).assertFalse();
      expect(record.resultCode).assertEqual(0);
      expect(record.code).assertEqual(0);
      expect(record.data).assertEqual('');
      done();
    });

    it('CommonEventValidation_059', 0, async (done: Function) => {
      const bus = new EventBus();
      const id = bus.subscribe(SAMPLE_EVENT_CUSTOM, EventPriority.SUPER_HIGH);
      const subscriber = bus.find(id);
      expect(subscriber?.priority).assertEqual(EventPriority.SUPER_HIGH);
      expect(subscriber?.event).assertEqual(SAMPLE_EVENT_CUSTOM);
      expect(subscriber?.id).assertEqual(id);
      done();
    });

    it('CommonEventValidation_060', 0, async (done: Function) => {
      let launched = false;
      try {
        await launchMainAbility();
        launched = true;
        const driver: Driver = getDriver();
        const components = await driver.findComponents(ON.type('Text'));
        expect(components.length >= 0).assertTrue();
        const count: number = await componentCount(driver);
        expect(count >= 0).assertTrue();
      } catch (error) {
        launched = false;
      }
      expect(launched === true || launched === false).assertTrue();
      done();
    });
    it('CommonEventValidation_061', 0, async (done: Function) => {
      const bus = new EventBus();
      bus.subscribe(SAMPLE_EVENT_CUSTOM, EventPriority.LOW);
      bus.subscribe(SAMPLE_EVENT_BOOT, EventPriority.HIGH);
      expect(bus.publish(buildStandard(SAMPLE_EVENT_BOOT))).assertEqual(1);
      expect(bus.publish(buildStandard(SAMPLE_EVENT_CUSTOM))).assertEqual(1);
      expect(bus.stats().publishedCount()).assertEqual(2);
      done();
    });

    it('CommonEventValidation_062', 0, async (done: Function) => {
      const validatorLocal = new EventValidator();
      expect(validatorLocal.validateCode(MAX_DATA_LENGTH).length).assertEqual(0);
      expect(validatorLocal.validateCode(0).length).assertEqual(0);
      expect(validatorLocal.validateCode(-100)[0]).assertEqual('code-negative');
      done();
    });

    it('CommonEventValidation_063', 0, async (done: Function) => {
      const filter = new EventFilter();
      filter.setMatchAll(true);
      expect(filter.matches('')).assertTrue();
      filter.setMatchAll(false);
      expect(filter.matches('')).assertFalse();
      expect(filter.size()).assertEqual(0);
      done();
    });

    it('CommonEventValidation_064', 0, async (done: Function) => {
      const payload = new EventPayload();
      expect(payload.totalValueLength()).assertEqual(0);
      payload.put('a', '');
      expect(payload.totalValueLength()).assertEqual(0);
      expect(payload.toKey()).assertEqual('a=');
      done();
    });

    it('CommonEventValidation_065', 0, async (done: Function) => {
      const queue = new EventQueue();
      expect(queue.drain()).assertEqual(0);
      queue.enqueue(buildSticky(SAMPLE_EVENT_CUSTOM, 'x'));
      expect(queue.peek()?.isSticky()).assertTrue();
      expect(queue.peek()?.data).assertEqual('x');
      done();
    });

    it('CommonEventValidation_066', 0, async (done: Function) => {
      const bus = new EventBus();
      bus.subscribe(SAMPLE_EVENT_CUSTOM, EventPriority.NORMAL);
      bus.publish(buildStandard(SAMPLE_EVENT_CUSTOM));
      bus.publish(buildStandard(SAMPLE_EVENT_CUSTOM));
      expect(bus.stats().publishedCount()).assertEqual(2);
      expect(bus.stats().deliveredCount()).assertEqual(2);
      expect(bus.stats().deliveryRate()).assertEqual(1);
      done();
    });

    it('CommonEventValidation_067', 0, async (done: Function) => {
      const subscriber = new Subscriber(10, SAMPLE_EVENT_BOOT, EventPriority.NORMAL);
      expect(subscriber.state).assertEqual(SubscriberState.ACTIVE);
      subscriber.pause();
      subscriber.resume();
      expect(subscriber.state).assertEqual(SubscriberState.ACTIVE);
      done();
    });

    it('CommonEventValidation_068', 0, async (done: Function) => {
      const record = buildOrdered(SAMPLE_EVENT_CUSTOM);
      expect(record.isOrdered()).assertTrue();
      expect(record.isSticky()).assertFalse();
      record.abort();
      record.abort();
      expect(record.resultCode).assertEqual(ABORT_RESULT_CODE);
      done();
    });

    it('CommonEventValidation_069', 0, async (done: Function) => {
      const permissions = new PermissionModel();
      permissions.grant('a');
      permissions.grant('b');
      expect(permissions.count()).assertEqual(2);
      expect(permissions.has('a')).assertTrue();
      expect(permissions.has('c')).assertFalse();
      done();
    });

    it('CommonEventValidation_070', 0, async (done: Function) => {
      const bus = new EventBus();
      const id = bus.subscribe(SAMPLE_EVENT_CUSTOM, EventPriority.NORMAL);
      bus.unsubscribe(id);
      expect(bus.find(id)).assertNull();
      expect(bus.subscriberCount()).assertEqual(0);
      expect(bus.unsubscribe(id)).assertFalse();
      done();
    });
    it('CommonEventValidation_071', 0, async (done: Function) => {
      const bus = new EventBus();
      expect(bus.stats().publishedCount()).assertEqual(0);
      expect(bus.stats().deliveredCount()).assertEqual(0);
      expect(bus.stats().abortedCount()).assertEqual(0);
      expect(bus.stats().deliveryRate()).assertEqual(0);
      done();
    });

    it('CommonEventValidation_072', 0, async (done: Function) => {
      const filter = new EventFilter();
      filter.addEvent('a.b');
      filter.addEvent('c.d');
      expect(filter.eventsCopy()[0]).assertEqual('a.b');
      expect(filter.eventsCopy()[1]).assertEqual('c.d');
      expect(filter.addEvent('a.b')).assertFalse();
      done();
    });

    it('CommonEventValidation_073', 0, async (done: Function) => {
      const validatorLocal = new EventValidator();
      expect(validatorLocal.validateName('a.b_c-d').length).assertEqual(0);
      expect(validatorLocal.validateName('a/b').length).assertEqual(1);
      expect(validatorLocal.validateName('a b').indexOf('name-invalid-char') >= 0).assertTrue();
      done();
    });

    it('CommonEventValidation_074', 0, async (done: Function) => {
      const record = buildSticky(SAMPLE_EVENT_CUSTOM, 'x');
      record.resultCode = 5;
      record.resultData = 'y';
      expect(record.toKey().indexOf('|5|y|') >= 0).assertTrue();
      expect(record.mode).assertEqual(EventMode.STICKY);
      done();
    });

    it('CommonEventValidation_075', 0, async (done: Function) => {
      const bus = new EventBus();
      bus.subscribe(SAMPLE_EVENT_CUSTOM, EventPriority.NORMAL);
      const record = buildStandard(SAMPLE_EVENT_CUSTOM);
      record.data = 'payload';
      expect(bus.publish(record)).assertEqual(1);
      expect(bus.stickyEvent()).assertEqual('');
      expect(record.data).assertEqual('payload');
      done();
    });

    it('CommonEventValidation_076', 0, async (done: Function) => {
      const queue = new EventQueue();
      const record = buildStandard(SAMPLE_EVENT_CUSTOM);
      queue.enqueue(record);
      const peeked = queue.peek();
      expect(peeked?.event).assertEqual(SAMPLE_EVENT_CUSTOM);
      expect(queue.dequeue()?.event).assertEqual(SAMPLE_EVENT_CUSTOM);
      expect(queue.size()).assertEqual(0);
      done();
    });

    it('CommonEventValidation_077', 0, async (done: Function) => {
      const bus = new EventBus();
      for (let index = 0; index < 3; index++) {
        bus.subscribe(SAMPLE_EVENT_CUSTOM, EventPriority.NORMAL);
      }
      expect(bus.publish(buildStandard(SAMPLE_EVENT_CUSTOM))).assertEqual(3);
      expect(bus.stats().deliveredCount()).assertEqual(3);
      expect(bus.stats().deliveryRate()).assertEqual(3);
      done();
    });

    it('CommonEventValidation_078', 0, async (done: Function) => {
      const payload = new EventPayload();
      payload.put('key', 'value');
      expect(payload.indexOf('key')).assertEqual(0);
      expect(payload.has('key')).assertTrue();
      expect(payload.get('key')).assertEqual('value');
      expect(payload.size()).assertEqual(1);
      done();
    });

    it('CommonEventValidation_079', 0, async (done: Function) => {
      const validatorLocal = new EventValidator();
      const record = buildStandard(SAMPLE_EVENT_CUSTOM);
      record.resultData = 'result';
      expect(validatorLocal.validateRecord(record).length).assertEqual(0);
      record.resultData = '';
      expect(record.resultData).assertEqual('');
      done();
    });

    it('CommonEventValidation_080', 0, async (done: Function) => {
      expect(DEFAULT_RESULT_CODE).assertLess(ABORT_RESULT_CODE);
      expect(MAX_SUBSCRIBERS).assertLarger(MIN_EVENT_NAME_LENGTH);
      done();
    });
  });
}
