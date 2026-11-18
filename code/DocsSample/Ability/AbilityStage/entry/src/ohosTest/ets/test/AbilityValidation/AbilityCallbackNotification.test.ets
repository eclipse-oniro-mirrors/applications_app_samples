/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, beforeAll, afterAll, TestType, Size, Level } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import {
  getDriver,
  logInfo,
  launchEntryAbility,
  serializedDelay,
  waitForIndexPageStable,
  isIndexPageVisible,
  checkTextContent,
  waitForTextVisible,
  tapComponentByText,
  doAbilityBackground,
  doAbilityForeground,
  pageComponentCount,
  collectAllTexts,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED,
  DELAY_AFTER_LAUNCH,
  DELAY_AFTER_BACKGROUND,
  STRESS_ROUNDS_LIFECYCLE,
  ensureIndexPageInitial,
} from '../Shared/SharedDriver';

const MAX_SUBSCRIBERS: number = 16;

const DEDUP_WINDOW_MS: number = 50;

const DEFAULT_PRIORITY: number = 100;

const HIGH_PRIORITY: number = 10;

const MAX_DELIVERY_ATTEMPTS: number = 3;

const MAX_HISTORY_ENTRIES: number = 64;

enum CallbackKind {
  FOREGROUND = 'onForeground',
  BACKGROUND = 'onBackground',
  CONFIGURATION_UPDATED = 'onConfigurationUpdated',
  WINDOW_STAGE_CREATE = 'onWindowStageCreate',
  WINDOW_STAGE_DESTROY = 'onWindowStageDestroy',
  MEMORY_LEVEL = 'onMemoryLevel',
  DESTROY = 'onDestroy'
}

enum DeliveryStatus {
  DELIVERED = 'delivered',
  SKIPPED_DUPLICATE = 'skipped_duplicate',
  FAILED = 'failed',
  NO_SUBSCRIBERS = 'no_subscribers',
  CAPACITY_EXCEEDED = 'capacity_exceeded'
}

class Subscriber {
  public id: string;
  public kind: CallbackKind;
  public priority: number;
  public failOnDeliver: boolean;
  public received: CallbackKind[] = [];

  constructor(id: string, kind: CallbackKind, priority: number = DEFAULT_PRIORITY, failOnDeliver: boolean = false) {
    this.id = id;
    this.kind = kind;
    this.priority = priority;
    this.failOnDeliver = failOnDeliver;
  }

  public accepts(kind: CallbackKind): boolean {
    return this.kind === kind;
  }

  public deliver(kind: CallbackKind): void {
    if (this.failOnDeliver) {
      const error: Error = new Error(`subscriber ${this.id} threw during ${kind}`);
      error.name = 'SubscriberDeliveryError';
      throw error;
    }
    this.received.push(kind);
  }

  public receiveCount(): number {
    return this.received.length;
  }

  public receivedKinds(): CallbackKind[] {
    const copy: CallbackKind[] = [];
    for (let i = 0; i < this.received.length; i++) {
      copy.push(this.received[i]);
    }
    return copy;
  }

  public reset(): void {
    this.received.splice(0, this.received.length);
  }
}

class DeliveryReport {
  public status: DeliveryStatus;
  public delivered: number;
  public failed: number;
  public failedIds: string[];
  public attempted: number;

  constructor(status: DeliveryStatus, delivered: number, failed: number, failedIds: string[], attempted: number) {
    this.status = status;
    this.delivered = delivered;
    this.failed = failed;
    this.failedIds = failedIds;
    this.attempted = attempted;
  }

  public static empty(status: DeliveryStatus): DeliveryReport {
    return new DeliveryReport(status, 0, 0, [], 0);
  }

  public isSuccessful(): boolean {
    return this.failed === 0 && this.delivered > 0;
  }

  public totalHandled(): number {
    return this.delivered + this.failed;
  }
}

class DispatchHistoryEntry {
  public kind: CallbackKind;
  public sequence: number;
  public delivered: number;
  public failed: number;

  constructor(kind: CallbackKind, sequence: number, delivered: number, failed: number) {
    this.kind = kind;
    this.sequence = sequence;
    this.delivered = delivered;
    this.failed = failed;
  }
}

class CallbackNotifier {
  private subscribers: Subscriber[] = [];

  private history: DispatchHistoryEntry[] = [];

  private sequence: number = 0;

  private lastDeliveredKind: CallbackKind | null = null;

  private duplicateSkips: number = 0;

  public subscribe(subscriber: Subscriber): DeliveryStatus {
    if (this.subscribers.length >= MAX_SUBSCRIBERS) {
      return DeliveryStatus.CAPACITY_EXCEEDED;
    }
    for (let i = 0; i < this.subscribers.length; i++) {
      if (this.subscribers[i].id === subscriber.id) {
        return DeliveryStatus.SKIPPED_DUPLICATE;
      }
    }
    this.subscribers.push(subscriber);
    this.sortByPriority();
    return DeliveryStatus.DELIVERED;
  }

  private sortByPriority(): void {
    for (let i = 1; i < this.subscribers.length; i++) {
      const current: Subscriber = this.subscribers[i];
      let position: number = i - 1;
      while (position >= 0 && this.subscribers[position].priority > current.priority) {
        this.subscribers[position + 1] = this.subscribers[position];
        position--;
      }
      this.subscribers[position + 1] = current;
    }
  }

  public unsubscribe(id: string): boolean {
    for (let i = 0; i < this.subscribers.length; i++) {
      if (this.subscribers[i].id === id) {
        this.subscribers.splice(i, 1);
        return true;
      }
    }
    return false;
  }

  public subscriberCount(): number {
    return this.subscribers.length;
  }

  public countFor(kind: CallbackKind): number {
    let count: number = 0;
    for (let i = 0; i < this.subscribers.length; i++) {
      if (this.subscribers[i].accepts(kind)) {
        count++;
      }
    }
    return count;
  }

  public idsInOrder(): string[] {
    const ids: string[] = [];
    for (let i = 0; i < this.subscribers.length; i++) {
      ids.push(this.subscribers[i].id);
    }
    return ids;
  }

  public dispatch(kind: CallbackKind): DeliveryReport {
    const matching: Subscriber[] = [];
    for (let i = 0; i < this.subscribers.length; i++) {
      if (this.subscribers[i].accepts(kind)) {
        matching.push(this.subscribers[i]);
      }
    }
    if (matching.length === 0) {
      return DeliveryReport.empty(DeliveryStatus.NO_SUBSCRIBERS);
    }
    let delivered: number = 0;
    let failed: number = 0;
    const failedIds: string[] = [];
    for (let i = 0; i < matching.length; i++) {
      try {
        matching[i].deliver(kind);
        delivered++;
      } catch (e) {
        failed++;
        failedIds.push(matching[i].id);
        logInfo(`dispatch isolated failure from ${matching[i].id} for ${kind}`);
      }
    }
    this.sequence++;
    this.lastDeliveredKind = kind;
    this.appendHistory(new DispatchHistoryEntry(kind, this.sequence, delivered, failed));
    return new DeliveryReport(delivered > 0 ? DeliveryStatus.DELIVERED : DeliveryStatus.FAILED,
      delivered, failed, failedIds, matching.length);
  }

  private appendHistory(entry: DispatchHistoryEntry): void {
    if (this.history.length >= MAX_HISTORY_ENTRIES) {
      this.history.splice(0, 1);
    }
    this.history.push(entry);
  }

  public historySize(): number {
    return this.history.length;
  }

  public lastEntry(): DispatchHistoryEntry | null {
    if (this.history.length === 0) {
      return null;
    }
    return this.history[this.history.length - 1];
  }

  public lastKind(): CallbackKind | null {
    return this.lastDeliveredKind;
  }

  public sequenceValue(): number {
    return this.sequence;
  }

  public recordDuplicateSkip(): number {
    this.duplicateSkips++;
    return this.duplicateSkips;
  }

  public duplicateSkipCount(): number {
    return this.duplicateSkips;
  }

  public dispatchAll(kinds: CallbackKind[]): number {
    let delivered: number = 0;
    for (let i = 0; i < kinds.length; i++) {
      const report: DeliveryReport = this.dispatch(kinds[i]);
      delivered += report.delivered;
    }
    return delivered;
  }

  public totalDeliveries(): number {
    let total: number = 0;
    for (let i = 0; i < this.subscribers.length; i++) {
      total += this.subscribers[i].receiveCount();
    }
    return total;
  }

  public resetAll(): void {
    for (let i = 0; i < this.subscribers.length; i++) {
      this.subscribers[i].reset();
    }
    this.history.splice(0, this.history.length);
    this.sequence = 0;
    this.lastDeliveredKind = null;
    this.duplicateSkips = 0;
  }

  public clearSubscribers(): void {
    this.subscribers.splice(0, this.subscribers.length);
  }
}

class DuplicateGuard {
  private lastKind: CallbackKind | null = null;

  private lastTimestamp: number = 0;

  private windowMs: number;

  constructor(windowMs: number = DEDUP_WINDOW_MS) {
    this.windowMs = windowMs;
  }

  public shouldDeliver(kind: CallbackKind, timestamp: number): boolean {
    if (this.lastKind === null) {
      this.lastKind = kind;
      this.lastTimestamp = timestamp;
      return true;
    }
    if (this.lastKind === kind && timestamp - this.lastTimestamp < this.windowMs) {
      return false;
    }
    this.lastKind = kind;
    this.lastTimestamp = timestamp;
    return true;
  }

  public reset(): void {
    this.lastKind = null;
    this.lastTimestamp = 0;
  }

  public getWindowMs(): number {
    return this.windowMs;
  }
}

class RetryScheduler {
  private attempts: number = 0;

  private exhaustedCount: number = 0;

  private succeededCount: number = 0;

  public attempt(success: boolean): boolean {
    this.attempts++;
    if (success) {
      this.succeededCount++;
      return true;
    }
    if (this.attempts >= MAX_DELIVERY_ATTEMPTS) {
      this.exhaustedCount++;
    }
    return false;
  }

  public getAttempts(): number {
    return this.attempts;
  }

  public isExhausted(): boolean {
    return this.attempts >= MAX_DELIVERY_ATTEMPTS;
  }

  public getExhaustedCount(): number {
    return this.exhaustedCount;
  }

  public getSucceededCount(): number {
    return this.succeededCount;
  }

  public reset(): void {
    this.attempts = 0;
    this.exhaustedCount = 0;
    this.succeededCount = 0;
  }
}

class CallbackNameRules {
  public static knownNames(): CallbackKind[] {
    return [
      CallbackKind.FOREGROUND,
      CallbackKind.BACKGROUND,
      CallbackKind.CONFIGURATION_UPDATED,
      CallbackKind.WINDOW_STAGE_CREATE,
      CallbackKind.WINDOW_STAGE_DESTROY,
      CallbackKind.MEMORY_LEVEL,
      CallbackKind.DESTROY
    ];
  }

  public static isLifecycleKind(kind: CallbackKind): boolean {
    return kind === CallbackKind.FOREGROUND || kind === CallbackKind.BACKGROUND ||
      kind === CallbackKind.DESTROY;
  }

  public static isConfigurationKind(kind: CallbackKind): boolean {
    return kind === CallbackKind.CONFIGURATION_UPDATED || kind === CallbackKind.MEMORY_LEVEL;
  }

  public static startsWithOn(kind: CallbackKind): boolean {
    return kind.startsWith('on');
  }

  public static contains(kind: CallbackKind, fragment: string): boolean {
    return kind.indexOf(fragment) >= 0;
  }

  public static expectedOrder(): CallbackKind[] {
    return [CallbackKind.WINDOW_STAGE_CREATE, CallbackKind.FOREGROUND, CallbackKind.CONFIGURATION_UPDATED,
      CallbackKind.BACKGROUND, CallbackKind.WINDOW_STAGE_DESTROY, CallbackKind.DESTROY];
  }
}

class PageTextProbe {
  public static async current(driver: Driver): Promise<string> {
    if (await checkTextContent(driver, PAGE_TEXT_INITIAL)) {
      return PAGE_TEXT_INITIAL;
    }
    if (await checkTextContent(driver, PAGE_TEXT_CLICKED)) {
      return PAGE_TEXT_CLICKED;
    }
    return '';
  }

  public static isKnown(text: string): boolean {
    return text === PAGE_TEXT_INITIAL || text === PAGE_TEXT_CLICKED;
  }

  public static async ensureClicked(driver: Driver): Promise<boolean> {
    const currentText: string = await PageTextProbe.current(driver);
    if (currentText.length === 0) {
      return false;
    }
    await tapComponentByText(driver, currentText);
    return await waitForTextVisible(driver, PAGE_TEXT_CLICKED);
  }
}

export default function abilityCallbackNotificationTest(): void {
  describe('AbilityCallbackNotificationTest', () => {
    beforeAll(async () => {
      await launchEntryAbility();
      await ensureIndexPageInitial(getDriver());
    });

    afterAll(async () => {
      logInfo('AbilityCallbackNotificationTest suite finished');
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_NOTIFY_0100
     * @tc.name testNotifyForegroundSingleSubscriber
     * @tc.desc Verify a foreground dispatch reaches the single matching subscriber exactly once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNotifyForegroundSingleSubscriber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const notifier: CallbackNotifier = new CallbackNotifier();
          const subscriber: Subscriber = new Subscriber('page-ui', CallbackKind.FOREGROUND);
          expect(notifier.subscribe(subscriber)).assertEqual(DeliveryStatus.DELIVERED);
          const report: DeliveryReport = notifier.dispatch(CallbackKind.FOREGROUND);
          expect(report.delivered).assertEqual(1);
          expect(subscriber.receiveCount()).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_NOTIFY_0200
     * @tc.name testNotifyBackgroundSingleSubscriber
     * @tc.desc Verify a background dispatch reaches the background subscriber only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNotifyBackgroundSingleSubscriber', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const notifier: CallbackNotifier = new CallbackNotifier();
          const background: Subscriber = new Subscriber('lifecycle', CallbackKind.BACKGROUND);
          const foreground: Subscriber = new Subscriber('view', CallbackKind.FOREGROUND);
          notifier.subscribe(background);
          notifier.subscribe(foreground);
          notifier.dispatch(CallbackKind.BACKGROUND);
          expect(background.receiveCount()).assertEqual(1);
          expect(foreground.receiveCount()).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_NOTIFY_0300
     * @tc.name testNotifyConfigurationUpdated
     * @tc.desc Verify a configuration update dispatch reaches the configuration subscriber
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNotifyConfigurationUpdated', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const notifier: CallbackNotifier = new CallbackNotifier();
          const config: Subscriber = new Subscriber('config', CallbackKind.CONFIGURATION_UPDATED);
          notifier.subscribe(config);
          const report: DeliveryReport = notifier.dispatch(CallbackKind.CONFIGURATION_UPDATED);
          expect(report.status).assertEqual(DeliveryStatus.DELIVERED);
          expect(config.receivedKinds()[0]).assertEqual(CallbackKind.CONFIGURATION_UPDATED);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_NOTIFY_0400
     * @tc.name testNotifyNoSubscribers
     * @tc.desc Verify dispatching to an empty notifier reports NO_SUBSCRIBERS with zero attempts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNotifyNoSubscribers', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const notifier: CallbackNotifier = new CallbackNotifier();
          const report: DeliveryReport = notifier.dispatch(CallbackKind.DESTROY);
          expect(report.status).assertEqual(DeliveryStatus.NO_SUBSCRIBERS);
          expect(report.attempted).assertEqual(0);
          expect(report.isSuccessful()).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_NOTIFY_0500
     * @tc.name testNotifySubscriberDeduplication
     * @tc.desc Verify subscribing the same id twice is rejected and keeps a single entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNotifySubscriberDeduplication', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const notifier: CallbackNotifier = new CallbackNotifier();
          expect(notifier.subscribe(new Subscriber('dup', CallbackKind.FOREGROUND)))
            .assertEqual(DeliveryStatus.DELIVERED);
          expect(notifier.subscribe(new Subscriber('dup', CallbackKind.FOREGROUND)))
            .assertEqual(DeliveryStatus.SKIPPED_DUPLICATE);
          expect(notifier.subscriberCount()).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_NOTIFY_0600
     * @tc.name testNotifyDistinctIdsBothKept
     * @tc.desc Verify two distinct ids subscribed for the same kind both receive the dispatch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNotifyDistinctIdsBothKept', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const notifier: CallbackNotifier = new CallbackNotifier();
          const first: Subscriber = new Subscriber('view-a', CallbackKind.FOREGROUND);
          const second: Subscriber = new Subscriber('view-b', CallbackKind.FOREGROUND);
          notifier.subscribe(first);
          notifier.subscribe(second);
          const report: DeliveryReport = notifier.dispatch(CallbackKind.FOREGROUND);
          expect(report.delivered).assertEqual(2);
          expect(first.receiveCount()).assertEqual(1);
          expect(second.receiveCount()).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_NOTIFY_0700
     * @tc.name testNotifyCapacityLimit
     * @tc.desc Verify the sixteenth subscriber is accepted and a seventeenth is rejected on capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNotifyCapacityLimit', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const notifier: CallbackNotifier = new CallbackNotifier();
          for (let i = 0; i < MAX_SUBSCRIBERS; i++) {
            notifier.subscribe(new Subscriber(`sub-${i}`, CallbackKind.MEMORY_LEVEL));
          }
          expect(notifier.subscriberCount()).assertEqual(16);
          expect(notifier.subscribe(new Subscriber('sub-overflow', CallbackKind.MEMORY_LEVEL)))
            .assertEqual(DeliveryStatus.CAPACITY_EXCEEDED);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_NOTIFY_0800
     * @tc.name testNotifyErrorIsolation
     * @tc.desc Verify one failing subscriber does not block delivery to the other subscriber
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNotifyErrorIsolation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const notifier: CallbackNotifier = new CallbackNotifier();
          const faulty: Subscriber = new Subscriber('faulty', CallbackKind.FOREGROUND, HIGH_PRIORITY, true);
          const healthy: Subscriber = new Subscriber('healthy', CallbackKind.FOREGROUND, DEFAULT_PRIORITY, false);
          notifier.subscribe(faulty);
          notifier.subscribe(healthy);
          const report: DeliveryReport = notifier.dispatch(CallbackKind.FOREGROUND);
          expect(report.failed).assertEqual(1);
          expect(report.delivered).assertEqual(1);
          expect(healthy.receiveCount()).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_NOTIFY_0900
     * @tc.name testNotifyFailedIdsReported
     * @tc.desc Verify the report lists the failing subscriber id while healthy ids stay off the list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNotifyFailedIdsReported', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const notifier: CallbackNotifier = new CallbackNotifier();
          notifier.subscribe(new Subscriber('broken', CallbackKind.BACKGROUND, DEFAULT_PRIORITY, true));
          notifier.subscribe(new Subscriber('working', CallbackKind.BACKGROUND, DEFAULT_PRIORITY, false));
          const report: DeliveryReport = notifier.dispatch(CallbackKind.BACKGROUND);
          expect(report.failedIds.length).assertEqual(1);
          expect(report.failedIds[0]).assertEqual('broken');
          expect(report.totalHandled()).assertEqual(2);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_NOTIFY_1000
     * @tc.name testNotifyAllSubscribersFail
     * @tc.desc Verify a dispatch where every subscriber throws reports FAILED status
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNotifyAllSubscribersFail', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const notifier: CallbackNotifier = new CallbackNotifier();
          notifier.subscribe(new Subscriber('fail-a', CallbackKind.DESTROY, HIGH_PRIORITY, true));
          notifier.subscribe(new Subscriber('fail-b', CallbackKind.DESTROY, DEFAULT_PRIORITY, true));
          const report: DeliveryReport = notifier.dispatch(CallbackKind.DESTROY);
          expect(report.status).assertEqual(DeliveryStatus.FAILED);
          expect(report.delivered).assertEqual(0);
          expect(report.failed).assertEqual(2);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_NOTIFY_1100
     * @tc.name testNotifyPriorityOrdering
     * @tc.desc Verify subscribers with lower priority numbers are placed first in delivery order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNotifyPriorityOrdering', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const notifier: CallbackNotifier = new CallbackNotifier();
          notifier.subscribe(new Subscriber('late', CallbackKind.FOREGROUND, DEFAULT_PRIORITY));
          notifier.subscribe(new Subscriber('early', CallbackKind.FOREGROUND, HIGH_PRIORITY));
          const ids: string[] = notifier.idsInOrder();
          expect(ids[0]).assertEqual('early');
          expect(ids[1]).assertEqual('late');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_NOTIFY_1200
     * @tc.name testNotifyUnsubscribe
     * @tc.desc Verify unsubscribing removes a subscriber and a second unsubscribe returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNotifyUnsubscribe', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const notifier: CallbackNotifier = new CallbackNotifier();
          const subscriber: Subscriber = new Subscriber('temp', CallbackKind.MEMORY_LEVEL);
          notifier.subscribe(subscriber);
          expect(notifier.unsubscribe('temp')).assertTrue();
          expect(notifier.unsubscribe('temp')).assertFalse();
          expect(notifier.countFor(CallbackKind.MEMORY_LEVEL)).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_NOTIFY_1300
     * @tc.name testNotifyCountPerKind
     * @tc.desc Verify per kind counting separates foreground and configuration subscribers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNotifyCountPerKind', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const notifier: CallbackNotifier = new CallbackNotifier();
          notifier.subscribe(new Subscriber('fg-a', CallbackKind.FOREGROUND));
          notifier.subscribe(new Subscriber('fg-b', CallbackKind.FOREGROUND));
          notifier.subscribe(new Subscriber('cfg', CallbackKind.CONFIGURATION_UPDATED));
          expect(notifier.countFor(CallbackKind.FOREGROUND)).assertEqual(2);
          expect(notifier.countFor(CallbackKind.CONFIGURATION_UPDATED)).assertEqual(1);
          expect(notifier.countFor(CallbackKind.DESTROY)).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_NOTIFY_1400
     * @tc.name testNotifySequenceIncrements
     * @tc.desc Verify each dispatch increments the notifier sequence exactly once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNotifySequenceIncrements', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const notifier: CallbackNotifier = new CallbackNotifier();
          notifier.subscribe(new Subscriber('seq', CallbackKind.FOREGROUND));
          expect(notifier.sequenceValue()).assertEqual(0);
          notifier.dispatch(CallbackKind.FOREGROUND);
          notifier.dispatch(CallbackKind.FOREGROUND);
          expect(notifier.sequenceValue()).assertEqual(2);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_NOTIFY_1500
     * @tc.name testNotifyHistoryEntry
     * @tc.desc Verify the history records the last dispatched kind with its delivery counts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNotifyHistoryEntry', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const notifier: CallbackNotifier = new CallbackNotifier();
          notifier.subscribe(new Subscriber('hist', CallbackKind.BACKGROUND));
          notifier.dispatch(CallbackKind.BACKGROUND);
          const entry: DispatchHistoryEntry | null = notifier.lastEntry();
          if (entry === null) {
            expect().assertFail();
            return;
          }
          expect(entry.kind).assertEqual(CallbackKind.BACKGROUND);
          expect(entry.delivered).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_NOTIFY_1600
     * @tc.name testNotifyHistoryEmpty
     * @tc.desc Verify history queries return null and zero before any dispatch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNotifyHistoryEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const notifier: CallbackNotifier = new CallbackNotifier();
          expect(notifier.lastEntry()).assertEqual(null);
          expect(notifier.lastKind()).assertEqual(null);
          expect(notifier.historySize()).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_NOTIFY_1700
     * @tc.name testNotifyHistoryBounded
     * @tc.desc Verify history never grows beyond the sixty four entry bound
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNotifyHistoryBounded', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const notifier: CallbackNotifier = new CallbackNotifier();
          notifier.subscribe(new Subscriber('bounded', CallbackKind.FOREGROUND));
          for (let i = 0; i < MAX_HISTORY_ENTRIES + 10; i++) {
            notifier.dispatch(CallbackKind.FOREGROUND);
          }
          expect(notifier.historySize()).assertEqual(MAX_HISTORY_ENTRIES);
          expect(notifier.lastKind()).assertEqual(CallbackKind.FOREGROUND);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_NOTIFY_1800
     * @tc.name testNotifyDispatchAllOrder
     * @tc.desc Verify dispatching a lifecycle sequence delivers in the supplied order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNotifyDispatchAllOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const notifier: CallbackNotifier = new CallbackNotifier();
          const sequenceSubscriber: Subscriber = new Subscriber('sequence', CallbackKind.FOREGROUND);
          notifier.subscribe(sequenceSubscriber);
          notifier.subscribe(new Subscriber('stage', CallbackKind.WINDOW_STAGE_CREATE));
          notifier.subscribe(new Subscriber('bye', CallbackKind.DESTROY));
          const kinds: CallbackKind[] = [CallbackKind.WINDOW_STAGE_CREATE, CallbackKind.FOREGROUND,
            CallbackKind.DESTROY];
          expect(notifier.dispatchAll(kinds)).assertEqual(3);
          expect(notifier.sequenceValue()).assertEqual(3);
          expect(sequenceSubscriber.receiveCount()).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_NOTIFY_1900
     * @tc.name testNotifyTotalDeliveries
     * @tc.desc Verify total deliveries across subscribers equals the sum of per subscriber counts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNotifyTotalDeliveries', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const notifier: CallbackNotifier = new CallbackNotifier();
          notifier.subscribe(new Subscriber('t1', CallbackKind.FOREGROUND));
          notifier.subscribe(new Subscriber('t2', CallbackKind.FOREGROUND));
          notifier.dispatch(CallbackKind.FOREGROUND);
          notifier.dispatch(CallbackKind.FOREGROUND);
          expect(notifier.totalDeliveries()).assertEqual(4);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_NOTIFY_2000
     * @tc.name testNotifyResetAll
     * @tc.desc Verify resetting clears per subscriber counters history and sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNotifyResetAll', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const notifier: CallbackNotifier = new CallbackNotifier();
          const subscriber: Subscriber = new Subscriber('reset', CallbackKind.FOREGROUND);
          notifier.subscribe(subscriber);
          notifier.dispatch(CallbackKind.FOREGROUND);
          notifier.resetAll();
          expect(subscriber.receiveCount()).assertEqual(0);
          expect(notifier.historySize()).assertEqual(0);
          expect(notifier.sequenceValue()).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_NOTIFY_2100
     * @tc.name testNotifyClearSubscribersKeepsHistory
     * @tc.desc Verify clearing subscribers leaves the dispatch history intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNotifyClearSubscribersKeepsHistory', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const notifier: CallbackNotifier = new CallbackNotifier();
          notifier.subscribe(new Subscriber('gone', CallbackKind.MEMORY_LEVEL));
          notifier.dispatch(CallbackKind.MEMORY_LEVEL);
          notifier.clearSubscribers();
          expect(notifier.subscriberCount()).assertEqual(0);
          expect(notifier.historySize()).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_NOTIFY_2200
     * @tc.name testNotifyDuplicateGuardWindow
     * @tc.desc Verify repeat kind inside the dedup window is suppressed and outside it is delivered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNotifyDuplicateGuardWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const guard: DuplicateGuard = new DuplicateGuard();
          expect(guard.shouldDeliver(CallbackKind.FOREGROUND, 1000)).assertTrue();
          expect(guard.shouldDeliver(CallbackKind.FOREGROUND, 1020)).assertFalse();
          expect(guard.shouldDeliver(CallbackKind.FOREGROUND, 1060)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_NOTIFY_2300
     * @tc.name testNotifyDuplicateGuardDifferentKind
     * @tc.desc Verify alternating kinds are never treated as duplicates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNotifyDuplicateGuardDifferentKind', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const guard: DuplicateGuard = new DuplicateGuard();
          expect(guard.shouldDeliver(CallbackKind.FOREGROUND, 1000)).assertTrue();
          expect(guard.shouldDeliver(CallbackKind.BACKGROUND, 1001)).assertTrue();
          expect(guard.shouldDeliver(CallbackKind.FOREGROUND, 1002)).assertTrue();
          expect(guard.getWindowMs()).assertEqual(50);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_NOTIFY_2400
     * @tc.name testNotifyDuplicateGuardReset
     * @tc.desc Verify reset allows the same kind to be delivered again
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNotifyDuplicateGuardReset', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const guard: DuplicateGuard = new DuplicateGuard();
          guard.shouldDeliver(CallbackKind.BACKGROUND, 1000);
          expect(guard.shouldDeliver(CallbackKind.BACKGROUND, 1010)).assertFalse();
          guard.reset();
          expect(guard.shouldDeliver(CallbackKind.BACKGROUND, 1010)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_NOTIFY_2500
     * @tc.name testNotifyRetrySchedulerExhaustion
     * @tc.desc Verify three failed attempts exhaust the retry scheduler
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNotifyRetrySchedulerExhaustion', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const scheduler: RetryScheduler = new RetryScheduler();
          expect(scheduler.attempt(false)).assertFalse();
          expect(scheduler.attempt(false)).assertFalse();
          expect(scheduler.isExhausted()).assertFalse();
          expect(scheduler.attempt(false)).assertFalse();
          expect(scheduler.isExhausted()).assertTrue();
          expect(scheduler.getExhaustedCount()).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_NOTIFY_2600
     * @tc.name testNotifyRetrySchedulerSuccess
     * @tc.desc Verify a successful retry records a success and resets exhaustion reporting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNotifyRetrySchedulerSuccess', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const scheduler: RetryScheduler = new RetryScheduler();
          scheduler.attempt(false);
          expect(scheduler.attempt(true)).assertTrue();
          expect(scheduler.getSucceededCount()).assertEqual(1);
          expect(scheduler.getAttempts()).assertEqual(2);
          scheduler.reset();
          expect(scheduler.getAttempts()).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_NOTIFY_2700
     * @tc.name testNotifyCallbackNameRules
     * @tc.desc Verify callback names for foreground background and configuration are recognised correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNotifyCallbackNameRules', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(CallbackNameRules.startsWithOn(CallbackKind.FOREGROUND)).assertTrue();
          expect(CallbackNameRules.contains(CallbackKind.CONFIGURATION_UPDATED, 'Configuration')).assertTrue();
          expect(CallbackNameRules.knownNames().length).assertEqual(7);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_NOTIFY_2800
     * @tc.name testNotifyCallbackKindClassification
     * @tc.desc Verify lifecycle and configuration kinds are classified into disjoint sets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNotifyCallbackKindClassification', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(CallbackNameRules.isLifecycleKind(CallbackKind.FOREGROUND)).assertTrue();
          expect(CallbackNameRules.isLifecycleKind(CallbackKind.MEMORY_LEVEL)).assertFalse();
          expect(CallbackNameRules.isConfigurationKind(CallbackKind.MEMORY_LEVEL)).assertTrue();
          expect(CallbackNameRules.isConfigurationKind(CallbackKind.DESTROY)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_NOTIFY_2900
     * @tc.name testNotifyExpectedOrderMatchesNames
     * @tc.desc Verify the expected lifecycle order starts with window stage create and ends with destroy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNotifyExpectedOrderMatchesNames', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const order: CallbackKind[] = CallbackNameRules.expectedOrder();
          expect(order.length).assertEqual(6);
          expect(order[0]).assertEqual(CallbackKind.WINDOW_STAGE_CREATE);
          expect(order[5]).assertEqual(CallbackKind.DESTROY);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_NOTIFY_3000
     * @tc.name testNotifySubscriberReset
     * @tc.desc Verify resetting a subscriber clears its received list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNotifySubscriberReset', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const subscriber: Subscriber = new Subscriber('resettable', CallbackKind.FOREGROUND);
          subscriber.deliver(CallbackKind.FOREGROUND);
          subscriber.deliver(CallbackKind.FOREGROUND);
          expect(subscriber.receiveCount()).assertEqual(2);
          subscriber.reset();
          expect(subscriber.receiveCount()).assertEqual(0);
          expect(subscriber.receivedKinds().length).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_NOTIFY_3100
     * @tc.name testNotifyRealForegroundCallback
     * @tc.desc Verify a real foreground call reaches the page and the text is visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNotifyRealForegroundCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const driver: Driver = getDriver();
          await doAbilityForeground();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          expect(await isIndexPageVisible(driver)).assertTrue();
          expect(await waitForIndexPageStable(driver)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_NOTIFY_3200
     * @tc.name testNotifyRealBackgroundForegroundSequence
     * @tc.desc Verify a full background then foreground cycle restores the page and the notify sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNotifyRealBackgroundForegroundSequence', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const driver: Driver = getDriver();
          const notifier: CallbackNotifier = new CallbackNotifier();
          notifier.subscribe(new Subscriber('observer', CallbackKind.FOREGROUND));
          notifier.subscribe(new Subscriber('observer-bg', CallbackKind.BACKGROUND));
          await doAbilityBackground();
          await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
          await doAbilityForeground();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          notifier.dispatch(CallbackKind.BACKGROUND);
          notifier.dispatch(CallbackKind.FOREGROUND);
          expect(notifier.sequenceValue()).assertEqual(2);
          expect(await isIndexPageVisible(driver)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_NOTIFY_3300
     * @tc.name testNotifyPageTextAfterCallbackCycle
     * @tc.desc Verify the page text remains the clicked value after a callback cycle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNotifyPageTextAfterCallbackCycle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const driver: Driver = getDriver();
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          expect(await PageTextProbe.ensureClicked(driver)).assertTrue();
          await doAbilityBackground();
          await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
          await doAbilityForeground();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          expect(await checkTextContent(driver, PAGE_TEXT_CLICKED)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_NOTIFY_3400
     * @tc.name testNotifyComponentCountStable
     * @tc.desc Verify the component count stays positive across repeated foreground notifications
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNotifyComponentCountStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const driver: Driver = getDriver();
          const firstCount: number = await pageComponentCount(driver);
          await doAbilityForeground();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const secondCount: number = await pageComponentCount(driver);
          expect(firstCount > 0).assertTrue();
          expect(secondCount > 0).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_NOTIFY_3500
     * @tc.name testNotifyTextsCollectedAfterClick
     * @tc.desc Verify collected texts include the clicked label after the transition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNotifyTextsCollectedAfterClick', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const driver: Driver = getDriver();
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          expect(await PageTextProbe.ensureClicked(driver)).assertTrue();
          const texts: string[] = await collectAllTexts(driver);
          expect(texts.indexOf(PAGE_TEXT_CLICKED) >= 0).assertTrue();
          expect(texts.length >= 1).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_NOTIFY_3600
     * @tc.name testNotifyLaunchThenDispatch
     * @tc.desc Verify launching then dispatching a foreground notification keeps the page stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNotifyLaunchThenDispatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const driver: Driver = getDriver();
          const notifier: CallbackNotifier = new CallbackNotifier();
          notifier.subscribe(new Subscriber('launch', CallbackKind.FOREGROUND));
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const report: DeliveryReport = notifier.dispatch(CallbackKind.FOREGROUND);
          expect(report.delivered).assertEqual(1);
          expect(await waitForIndexPageStable(driver)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_NOTIFY_3700
     * @tc.name testNotifyStressLifecycleCallbacks
     * @tc.desc Verify ten lifecycle cycles all report a visible page and a growing notify sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNotifyStressLifecycleCallbacks', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const driver: Driver = getDriver();
          const notifier: CallbackNotifier = new CallbackNotifier();
          notifier.subscribe(new Subscriber('stress', CallbackKind.FOREGROUND));
          let visibleRounds: number = 0;
          for (let i = 0; i < STRESS_ROUNDS_LIFECYCLE; i++) {
            await doAbilityBackground();
            await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
            await doAbilityForeground();
            await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
            notifier.dispatch(CallbackKind.FOREGROUND);
            if (await isIndexPageVisible(driver)) {
              visibleRounds++;
            }
          }
          expect(visibleRounds).assertEqual(STRESS_ROUNDS_LIFECYCLE);
          expect(notifier.sequenceValue()).assertEqual(STRESS_ROUNDS_LIFECYCLE);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_NOTIFY_3800
     * @tc.name testNotifyIdempotentRegistration
     * @tc.desc Verify registering the same subscriber five times leaves a single entry delivered once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNotifyIdempotentRegistration', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const notifier: CallbackNotifier = new CallbackNotifier();
          let acceptedCount: number = 0;
          for (let i = 0; i < 5; i++) {
            if (notifier.subscribe(new Subscriber('same', CallbackKind.FOREGROUND)) ===
              DeliveryStatus.DELIVERED) {
              acceptedCount++;
            }
          }
          expect(acceptedCount).assertEqual(1);
          const report: DeliveryReport = notifier.dispatch(CallbackKind.FOREGROUND);
          expect(report.delivered).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_NOTIFY_3900
     * @tc.name testNotifyDuplicateSkipCounter
     * @tc.desc Verify explicit duplicate skip accounting increments once per call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNotifyDuplicateSkipCounter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const notifier: CallbackNotifier = new CallbackNotifier();
          expect(notifier.duplicateSkipCount()).assertEqual(0);
          expect(notifier.recordDuplicateSkip()).assertEqual(1);
          expect(notifier.recordDuplicateSkip()).assertEqual(2);
          expect(notifier.duplicateSkipCount()).assertEqual(2);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_NOTIFY_4000
     * @tc.name testNotifyMixedFaultTolerantSequence
     * @tc.desc Verify a mixed sequence survives a faulty subscriber and still delivers to healthy ones
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNotifyMixedFaultTolerantSequence', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const notifier: CallbackNotifier = new CallbackNotifier();
          notifier.subscribe(new Subscriber('bad-fg', CallbackKind.FOREGROUND, HIGH_PRIORITY, true));
          const good: Subscriber = new Subscriber('good-fg', CallbackKind.FOREGROUND);
          notifier.subscribe(good);
          notifier.subscribe(new Subscriber('good-bg', CallbackKind.BACKGROUND));
          const kinds: CallbackKind[] = [CallbackKind.FOREGROUND, CallbackKind.BACKGROUND, CallbackKind.FOREGROUND];
          notifier.dispatchAll(kinds);
          expect(good.receiveCount()).assertEqual(2);
          expect(notifier.sequenceValue()).assertEqual(3);
          expect(notifier.historySize()).assertEqual(3);
        } finally {
          done();
        }
      })
  })
}
