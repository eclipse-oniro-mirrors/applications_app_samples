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

import { describe, it, expect } from '@ohos/hypium';

const EVENT_PREFIX: string = 'com.samples.betaclub.';

const EVENT_ISSUE_SUBMITTED: string = 'com.samples.betaclub.ISSUE_SUBMITTED';

const EVENT_ISSUE_UPDATED: string = 'com.samples.betaclub.ISSUE_UPDATED';

const EVENT_LOG_COLLECTED: string = 'com.samples.betaclub.LOG_COLLECTED';

const MIN_EVENT_CODE: number = 0;

const MAX_EVENT_CODE: number = 999;

const MAX_EVENT_DATA: number = 4096;

const MAX_SUBSCRIBERS: number = 16;

interface CommonEvent {
  name: string;
  code: number;
  data: string;
  timestamp: number;
}

interface Subscription {
  id: string;
  eventName: string;
  received: number;
}

// Validates common event names and payloads
class CommonEventValidator {
  public static isNameValid(name: string): boolean {
    if (!name.startsWith(EVENT_PREFIX)) {
      return false;
    }
    const pattern: RegExp = new RegExp('^[a-z0-9.]+[A-Z_]+$');
    return pattern.test(name);
  }

  public static isKnownEvent(name: string): boolean {
    return name === EVENT_ISSUE_SUBMITTED || name === EVENT_ISSUE_UPDATED ||
      name === EVENT_LOG_COLLECTED;
  }

  public static isCodeValid(code: number): boolean {
    return code >= MIN_EVENT_CODE && code <= MAX_EVENT_CODE;
  }

  public static isDataValid(data: string): boolean {
    return data.length <= MAX_EVENT_DATA && data.indexOf('\r') < 0;
  }

  public static validate(event: CommonEvent): string[] {
    const issues: string[] = [];
    if (!CommonEventValidator.isNameValid(event.name)) {
      issues.push('name');
    }
    if (!CommonEventValidator.isCodeValid(event.code)) {
      issues.push('code');
    }
    if (!CommonEventValidator.isDataValid(event.data)) {
      issues.push('data');
    }
    if (event.timestamp < 0) {
      issues.push('timestamp');
    }
    return issues;
  }

  public static isValid(event: CommonEvent): boolean {
    return CommonEventValidator.validate(event).length === 0;
  }
}

// Subscribes handlers and delivers events in order
class CommonEventBus {
  private subscriptions: Map<string, Subscription> = new Map<string, Subscription>();
  private published: number = 0;
  private rejected: number = 0;

  public subscribe(id: string, eventName: string): boolean {
    if (id.length === 0 || !CommonEventValidator.isKnownEvent(eventName)) {
      return false;
    }
    if (this.subscriptions.has(id) || this.subscriptions.size >= MAX_SUBSCRIBERS) {
      return false;
    }
    this.subscriptions.set(id, { id: id, eventName: eventName, received: 0 });
    return true;
  }

  public unsubscribe(id: string): boolean {
    return this.subscriptions.delete(id);
  }

  public publish(event: CommonEvent): number {
    if (!CommonEventValidator.isValid(event)) {
      this.rejected++;
      return 0;
    }
    let delivered: number = 0;
    this.subscriptions.forEach((subscription: Subscription) => {
      if (subscription.eventName === event.name) {
        subscription.received++;
        delivered++;
      }
    });
    this.published++;
    return delivered;
  }

  public subscriberCount(): number {
    return this.subscriptions.size;
  }

  public receivedBy(id: string): number {
    const subscription = this.subscriptions.get(id);
    return subscription === undefined ? 0 : subscription.received;
  }

  public getPublished(): number {
    return this.published;
  }

  public getRejected(): number {
    return this.rejected;
  }

  public subscribersOf(eventName: string): string[] {
    const result: string[] = [];
    this.subscriptions.forEach((subscription: Subscription) => {
      if (subscription.eventName === eventName) {
        result.push(subscription.id);
      }
    });
    return result;
  }

  public reset(): void {
    this.subscriptions = new Map<string, Subscription>();
    this.published = 0;
    this.rejected = 0;
  }
}

// Keeps a bounded history of published events
class EventHistory {
  private events: CommonEvent[] = [];
  private readonly capacity: number;

  constructor(capacity: number) {
    this.capacity = capacity;
  }

  public record(event: CommonEvent): boolean {
    if (this.capacity <= 0) {
      return false;
    }
    if (this.events.length >= this.capacity) {
      this.events.shift();
    }
    this.events.push({
      name: event.name,
      code: event.code,
      data: event.data,
      timestamp: event.timestamp
    });
    return true;
  }

  public count(): number {
    return this.events.length;
  }

  public latest(): CommonEvent | undefined {
    return this.events.length === 0 ? undefined : this.events[this.events.length - 1];
  }

  public countOf(name: string): number {
    return this.events.filter((event: CommonEvent) => event.name === name).length;
  }

  public names(): string[] {
    return this.events.map((event: CommonEvent) => event.name);
  }

  public clear(): void {
    this.events = [];
  }
}

export default function commonEventUtilValidationTest() {
  describe('CommonEventUtilValidation_Test', () => {

    it('validator_should_check_event_names', 0, () => {
      expect(CommonEventValidator.isNameValid(EVENT_ISSUE_SUBMITTED)).assertTrue();
      expect(CommonEventValidator.isNameValid(EVENT_ISSUE_UPDATED)).assertTrue();
      expect(CommonEventValidator.isNameValid('com.other.app.EVENT')).assertFalse();
      expect(CommonEventValidator.isNameValid('com.samples.betaclub.')).assertFalse();
      expect(CommonEventValidator.isNameValid('')).assertFalse();
    });

    it('validator_should_recognize_known_events', 0, () => {
      expect(CommonEventValidator.isKnownEvent(EVENT_ISSUE_SUBMITTED)).assertTrue();
      expect(CommonEventValidator.isKnownEvent(EVENT_ISSUE_UPDATED)).assertTrue();
      expect(CommonEventValidator.isKnownEvent(EVENT_LOG_COLLECTED)).assertTrue();
      expect(CommonEventValidator.isKnownEvent('com.samples.betaclub.UNKNOWN')).assertFalse();
      expect(CommonEventValidator.isKnownEvent('')).assertFalse();
    });

    it('validator_should_check_code_range', 0, () => {
      expect(CommonEventValidator.isCodeValid(0)).assertTrue();
      expect(CommonEventValidator.isCodeValid(999)).assertTrue();
      expect(CommonEventValidator.isCodeValid(-1)).assertFalse();
      expect(CommonEventValidator.isCodeValid(1000)).assertFalse();
    });

    it('validator_should_check_data_length', 0, () => {
      expect(CommonEventValidator.isDataValid('')).assertTrue();
      expect(CommonEventValidator.isDataValid('a'.repeat(MAX_EVENT_DATA))).assertTrue();
      expect(CommonEventValidator.isDataValid('a'.repeat(MAX_EVENT_DATA + 1))).assertFalse();
      expect(CommonEventValidator.isDataValid('carriage\rreturn')).assertFalse();
    });

    it('validator_should_report_each_issue', 0, () => {
      const event: CommonEvent = { name: 'bad', code: -1, data: '\r', timestamp: -1 };
      const issues = CommonEventValidator.validate(event);
      expect(issues.length).assertEqual(4);
      expect(issues.includes('name')).assertTrue();
      expect(issues.includes('code')).assertTrue();
      expect(issues.includes('data')).assertTrue();
      expect(issues.includes('timestamp')).assertTrue();
      expect(CommonEventValidator.isValid(event)).assertFalse();
    });

    it('validator_should_accept_valid_event', 0, () => {
      const event: CommonEvent = {
        name: EVENT_ISSUE_SUBMITTED, code: 200, data: 'ISSUE-1001', timestamp: 1000
      };
      expect(CommonEventValidator.validate(event).length).assertEqual(0);
      expect(CommonEventValidator.isValid(event)).assertTrue();
    });

    it('bus_should_subscribe_known_events', 0, () => {
      const bus = new CommonEventBus();
      expect(bus.subscribe('sub-1', EVENT_ISSUE_SUBMITTED)).assertTrue();
      expect(bus.subscribe('sub-1', EVENT_ISSUE_UPDATED)).assertFalse();
      expect(bus.subscribe('sub-2', 'unknown.event')).assertFalse();
      expect(bus.subscribe('', EVENT_ISSUE_UPDATED)).assertFalse();
      expect(bus.subscriberCount()).assertEqual(1);
      expect(bus.subscribersOf(EVENT_ISSUE_SUBMITTED).length).assertEqual(1);
    });

    it('bus_should_deliver_to_matching_subscribers', 0, () => {
      const bus = new CommonEventBus();
      bus.subscribe('sub-1', EVENT_ISSUE_SUBMITTED);
      bus.subscribe('sub-2', EVENT_ISSUE_SUBMITTED);
      bus.subscribe('sub-3', EVENT_ISSUE_UPDATED);
      const delivered = bus.publish({
        name: EVENT_ISSUE_SUBMITTED, code: 200, data: 'ISSUE-1', timestamp: 1000
      });
      expect(delivered).assertEqual(2);
      expect(bus.receivedBy('sub-1')).assertEqual(1);
      expect(bus.receivedBy('sub-2')).assertEqual(1);
      expect(bus.receivedBy('sub-3')).assertEqual(0);
      expect(bus.getPublished()).assertEqual(1);
    });

    it('bus_should_reject_invalid_events', 0, () => {
      const bus = new CommonEventBus();
      bus.subscribe('sub-1', EVENT_ISSUE_SUBMITTED);
      expect(bus.publish({ name: 'bad', code: 200, data: '', timestamp: 0 })).assertEqual(0);
      expect(bus.publish({ name: EVENT_ISSUE_SUBMITTED, code: -1, data: '', timestamp: 0 }))
        .assertEqual(0);
      expect(bus.getRejected()).assertEqual(2);
      expect(bus.getPublished()).assertEqual(0);
      expect(bus.receivedBy('sub-1')).assertEqual(0);
    });

    it('bus_should_unsubscribe', 0, () => {
      const bus = new CommonEventBus();
      bus.subscribe('sub-1', EVENT_ISSUE_SUBMITTED);
      expect(bus.unsubscribe('sub-1')).assertTrue();
      expect(bus.unsubscribe('sub-1')).assertFalse();
      expect(bus.subscriberCount()).assertEqual(0);
      expect(bus.publish({
        name: EVENT_ISSUE_SUBMITTED, code: 200, data: '', timestamp: 0
      })).assertEqual(0);
      bus.reset();
      expect(bus.getPublished()).assertEqual(0);
      expect(bus.getRejected()).assertEqual(0);
    });

    it('bus_should_limit_subscribers', 0, () => {
      const bus = new CommonEventBus();
      for (let i = 0; i < MAX_SUBSCRIBERS; i++) {
        expect(bus.subscribe(`sub-${i}`, EVENT_ISSUE_UPDATED)).assertTrue();
      }
      expect(bus.subscribe('overflow', EVENT_ISSUE_UPDATED)).assertFalse();
      expect(bus.subscriberCount()).assertEqual(MAX_SUBSCRIBERS);
      expect(bus.subscribersOf(EVENT_ISSUE_UPDATED).length).assertEqual(MAX_SUBSCRIBERS);
    });

    it('history_should_be_bounded', 0, () => {
      const history = new EventHistory(2);
      expect(history.record({
        name: EVENT_ISSUE_SUBMITTED, code: 200, data: 'a', timestamp: 1
      })).assertTrue();
      history.record({ name: EVENT_ISSUE_UPDATED, code: 200, data: 'b', timestamp: 2 });
      history.record({ name: EVENT_LOG_COLLECTED, code: 200, data: 'c', timestamp: 3 });
      expect(history.count()).assertEqual(2);
      expect((history.latest() as CommonEvent).name).assertEqual(EVENT_LOG_COLLECTED);
      expect(history.countOf(EVENT_ISSUE_SUBMITTED)).assertEqual(0);
      expect(history.names().length).assertEqual(2);
      history.clear();
      expect(history.count()).assertEqual(0);
    });

    it('history_should_ignore_zero_capacity', 0, () => {
      const history = new EventHistory(0);
      expect(history.record({
        name: EVENT_ISSUE_SUBMITTED, code: 200, data: '', timestamp: 1
      })).assertFalse();
      expect(history.count()).assertEqual(0);
      expect(history.latest() === undefined).assertTrue();
    });

    it('event_flow_should_publish_and_record', 0, () => {
      const bus = new CommonEventBus();
      const history = new EventHistory(5);
      bus.subscribe('ui', EVENT_ISSUE_SUBMITTED);
      const event: CommonEvent = {
        name: EVENT_ISSUE_SUBMITTED, code: 200, data: 'ISSUE-1001', timestamp: 1000
      };
      const delivered = bus.publish(event);
      if (delivered > 0) {
        history.record(event);
      }
      expect(delivered).assertEqual(1);
      expect(history.count()).assertEqual(1);
      expect(history.countOf(EVENT_ISSUE_SUBMITTED)).assertEqual(1);
      expect(bus.receivedBy('ui')).assertEqual(1);
      expect(CommonEventValidator.isValid(event)).assertTrue();
    });

    it('common_event_constants_should_be_stable', 0, () => {
      expect(EVENT_PREFIX).assertEqual('com.samples.betaclub.');
      expect(EVENT_ISSUE_SUBMITTED).assertEqual('com.samples.betaclub.ISSUE_SUBMITTED');
      expect(MIN_EVENT_CODE).assertEqual(0);
      expect(MAX_EVENT_CODE).assertEqual(999);
      expect(MAX_EVENT_DATA).assertEqual(4096);
      expect(MAX_SUBSCRIBERS).assertEqual(16);
    });
  });
}

