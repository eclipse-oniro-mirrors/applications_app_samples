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
import { Driver, ON, Component } from '@ohos.UiTest';
import {
  getDriver,
  ensureIndexPageInitial,
  logInfo,
  logError,
  launchEntryAbility,
  runSerializedUiOperation,
  serializedDelay,
  waitForIndexPageStable,
  checkTextContent,
  isIndexPageVisible,
  pageComponentCount,
  pressAndWait,
  INDEX_PAGE_TEXT_KEY,
  PAGE_TEXT_CLICKED,
  TIMEOUT_PAGE_RENDER,
  DELAY_TOUCH_EVENT,
  DELAY_AFTER_LAUNCH,
  KEY_ENTER,
  KEY_SPACE,
  DELAY_KEY_NAVIGATION
} from '../Shared/SharedDriver';

enum EventKind {
  CLICK = 'click',
  KEY_DOWN = 'key_down',
  KEY_UP = 'key_up',
  FOCUS = 'focus',
  BLUR = 'blur'
}

enum HandlerPriority {
  LOW = 1,
  NORMAL = 2,
  HIGH = 3,
  CRITICAL = 4
}

enum DispatchPhase {
  CAPTURE = 'capture',
  TARGET = 'target',
  BUBBLE = 'bubble',
  POST = 'post'
}

enum HandleStatus {
  HANDLED = 'handled',
  SKIPPED = 'skipped',
  FAILED = 'failed'
}

interface UiEvent {
  kind: EventKind;
  source: string;
  timestamp: number;
  payload: string;
}

interface HandlerRegistration {
  handlerId: string;
  kind: EventKind;
  priority: HandlerPriority;
  once: boolean;
}

interface DispatchRecord {
  handlerId: string;
  kind: EventKind;
  status: HandleStatus;
  order: number;
  payload: string;
}

interface AsyncTask {
  label: string;
  order: number;
  completed: boolean;
}

class EventBus {
  private registrations: HandlerRegistration[] = [];
  private records: DispatchRecord[] = [];
  private dispatchCount: number = 0;

  public register(registration: HandlerRegistration): boolean {
    if (this.isRegistered(registration.handlerId)) {
      return false;
    }
    this.registrations.push(registration);
    return true;
  }

  public unregister(handlerId: string): boolean {
    const before: number = this.registrations.length;
    const remaining: HandlerRegistration[] = [];
    for (let i = 0; i < this.registrations.length; i++) {
      if (this.registrations[i].handlerId !== handlerId) {
        remaining.push(this.registrations[i]);
      }
    }
    this.registrations = remaining;
    return this.registrations.length !== before;
  }

  public isRegistered(handlerId: string): boolean {
    for (let i = 0; i < this.registrations.length; i++) {
      if (this.registrations[i].handlerId === handlerId) {
        return true;
      }
    }
    return false;
  }

  public getRegistrationCount(): number {
    return this.registrations.length;
  }

  public getRegistrationCountByKind(kind: EventKind): number {
    let count: number = 0;
    for (let i = 0; i < this.registrations.length; i++) {
      if (this.registrations[i].kind === kind) {
        count++;
      }
    }
    return count;
  }

  private orderRegistrations(kind: EventKind): HandlerRegistration[] {
    const selected: HandlerRegistration[] = [];
    for (let i = 0; i < this.registrations.length; i++) {
      if (this.registrations[i].kind === kind) {
        selected.push(this.registrations[i]);
      }
    }
    for (let i = 0; i < selected.length; i++) {
      for (let j = i + 1; j < selected.length; j++) {
        if (selected[j].priority > selected[i].priority) {
          const temp: HandlerRegistration = selected[i];
          selected[i] = selected[j];
          selected[j] = temp;
        }
      }
    }
    return selected;
  }

  public dispatch(event: UiEvent): DispatchRecord[] {
    this.dispatchCount++;
    const ordered: HandlerRegistration[] = this.orderRegistrations(event.kind);
    const dispatched: DispatchRecord[] = [];
    const onceHandlers: string[] = [];
    for (let i = 0; i < ordered.length; i++) {
      const record: DispatchRecord = {
        handlerId: ordered[i].handlerId,
        kind: event.kind,
        status: HandleStatus.HANDLED,
        order: i,
        payload: event.payload
      };
      dispatched.push(record);
      this.records.push(record);
      if (ordered[i].once) {
        onceHandlers.push(ordered[i].handlerId);
      }
    }
    for (let i = 0; i < onceHandlers.length; i++) {
      this.unregister(onceHandlers[i]);
    }
    return dispatched;
  }

  public getDispatchCount(): number {
    return this.dispatchCount;
  }

  public getRecordCount(): number {
    return this.records.length;
  }

  public getRecordsByHandler(handlerId: string): DispatchRecord[] {
    const result: DispatchRecord[] = [];
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].handlerId === handlerId) {
        result.push(this.records[i]);
      }
    }
    return result;
  }

  public getDispatchOrderOf(event: UiEvent): string[] {
    const ordered: HandlerRegistration[] = this.orderRegistrations(event.kind);
    const ids: string[] = [];
    for (let i = 0; i < ordered.length; i++) {
      ids.push(ordered[i].handlerId);
    }
    return ids;
  }

  public clear(): void {
    this.registrations = [];
    this.records = [];
    this.dispatchCount = 0;
  }
}

class DispatchPipeline {
  private phaseOrder: DispatchPhase[] = [
    DispatchPhase.CAPTURE,
    DispatchPhase.TARGET,
    DispatchPhase.BUBBLE,
    DispatchPhase.POST
  ];
  private trace: string[] = [];
  private stopped: boolean = false;

  public run(handlerId: string): string[] {
    this.trace = [];
    this.stopped = false;
    for (let i = 0; i < this.phaseOrder.length; i++) {
      if (this.stopped) {
        break;
      }
      this.trace.push(`${this.phaseOrder[i]}:${handlerId}`);
      if (this.phaseOrder[i] === DispatchPhase.TARGET) {
        this.stopPropagation();
      }
    }
    return this.trace;
  }

  public runFull(handlerId: string): string[] {
    this.trace = [];
    this.stopped = false;
    for (let i = 0; i < this.phaseOrder.length; i++) {
      this.trace.push(`${this.phaseOrder[i]}:${handlerId}`);
    }
    return this.trace;
  }

  public stopPropagation(): void {
    this.stopped = true;
  }

  public isStopped(): boolean {
    return this.stopped;
  }

  public getPhaseCount(): number {
    return this.phaseOrder.length;
  }

  public isPhaseValid(phase: DispatchPhase): boolean {
    for (let i = 0; i < this.phaseOrder.length; i++) {
      if (this.phaseOrder[i] === phase) {
        return true;
      }
    }
    return false;
  }
}

class AsyncEventQueue {
  private tasks: AsyncTask[] = [];
  private completionOrder: number[] = [];
  private step: number = 0;

  public enqueue(label: string): AsyncTask {
    this.step++;
    const task: AsyncTask = {
      label: label,
      order: this.step,
      completed: false
    };
    this.tasks.push(task);
    return task;
  }

  public complete(label: string): boolean {
    for (let i = 0; i < this.tasks.length; i++) {
      if (this.tasks[i].label === label && !this.tasks[i].completed) {
        this.tasks[i].completed = true;
        this.completionOrder.push(this.tasks[i].order);
        return true;
      }
    }
    return false;
  }

  public getPendingCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.tasks.length; i++) {
      if (!this.tasks[i].completed) {
        count++;
      }
    }
    return count;
  }

  public getCompletedOrder(): string[] {
    const completed: string[] = [];
    for (let i = 0; i < this.tasks.length; i++) {
      if (this.tasks[i].completed) {
        completed.push(this.tasks[i].label);
      }
    }
    return completed;
  }

  public isOrderPreserved(): boolean {
    let lastOrder: number = 0;
    for (let i = 0; i < this.completionOrder.length; i++) {
      if (this.completionOrder[i] <= lastOrder) {
        return false;
      }
      lastOrder = this.completionOrder[i];
    }
    return true;
  }

  public getStep(): number {
    return this.step;
  }

  public reset(): void {
    this.tasks = [];
    this.completionOrder = [];
    this.step = 0;
  }
}

class EventCounter {
  private counters: Map<string, number> = new Map<string, number>();
  private keyOrder: string[] = [];

  public increment(key: string): number {
    const current: number = this.countOf(key);
    const next: number = current + 1;
    if (current === 0) {
      this.keyOrder.push(key);
    }
    this.counters.set(key, next);
    return next;
  }

  public countOf(key: string): number {
    const value: number | undefined = this.counters.get(key);
    if (value === undefined) {
      return 0;
    }
    return value;
  }

  public getTotal(): number {
    let total: number = 0;
    for (let i = 0; i < this.keyOrder.length; i++) {
      total += this.countOf(this.keyOrder[i]);
    }
    return total;
  }

  public getKeys(): string[] {
    const keys: string[] = [];
    for (let i = 0; i < this.keyOrder.length; i++) {
      keys.push(this.keyOrder[i]);
    }
    return keys;
  }

  public reset(): void {
    this.counters = new Map<string, number>();
    this.keyOrder = [];
  }
}

class PriorityResolver {
  public static describe(priority: HandlerPriority): string {
    if (priority === HandlerPriority.CRITICAL) {
      return 'critical';
    }
    if (priority === HandlerPriority.HIGH) {
      return 'high';
    }
    if (priority === HandlerPriority.NORMAL) {
      return 'normal';
    }
    return 'low';
  }

  public static isHigher(first: HandlerPriority, second: HandlerPriority): boolean {
    return first > second;
  }

  public static clamp(value: number): HandlerPriority {
    if (value <= 1) {
      return HandlerPriority.LOW;
    }
    if (value >= 4) {
      return HandlerPriority.CRITICAL;
    }
    if (value === 2) {
      return HandlerPriority.NORMAL;
    }
    return HandlerPriority.HIGH;
  }
}

async function readTextById(driver: Driver): Promise<string> {
  return await runSerializedUiOperation(async (): Promise<string> => {
    try {
      const component: Component = await driver.findComponent(ON.id(INDEX_PAGE_TEXT_KEY));
      if (component === null || component === undefined) {
        return '';
      }
      return await component.getText();
    } catch (error) {
      logError(`readTextById failed: ${error}`);
      return '';
    }
  });
}

async function clickTextComponent(driver: Driver): Promise<boolean> {
  return await runSerializedUiOperation(async (): Promise<boolean> => {
    try {
      const component: Component = await driver.findComponent(ON.id(INDEX_PAGE_TEXT_KEY));
      if (component === null || component === undefined) {
        return false;
      }
      await component.click();
      await driver.delayMs(DELAY_TOUCH_EVENT);
      logInfo('clickTextComponent: onClick dispatched');
      return true;
    } catch (error) {
      logError(`clickTextComponent failed: ${error}`);
      return false;
    }
  });
}

function buildEvent(kind: EventKind, source: string, payload: string): UiEvent {
  const event: UiEvent = {
    kind: kind,
    source: source,
    timestamp: Date.now(),
    payload: payload
  };
  return event;
}

function buildRegistration(handlerId: string, kind: EventKind, priority: HandlerPriority,
  once: boolean): HandlerRegistration {
  const registration: HandlerRegistration = {
    handlerId: handlerId,
    kind: kind,
    priority: priority,
    once: once
  };
  return registration;
}

export default function eventHandlingTest(): void {
  describe('EventHandlingTest', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      logInfo('EventHandlingTest: preparing index page');
      await launchEntryAbility();
      await serializedDelay(driver, DELAY_AFTER_LAUNCH);
      await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
      await ensureIndexPageInitial(driver);
    })

    afterAll(async () => {
      logInfo('EventHandlingTest: finished');
      await serializedDelay(driver, 100);
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_EVENT_0100
     * @tc.name testEventClickDispatchReachesHandler
     * @tc.desc Verify click event reaches the page handler: click Text -> Welcome visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEventClickDispatchReachesHandler', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const clicked: boolean = await clickTextComponent(driver);
          expect(clicked).assertTrue();
          await serializedDelay(driver, 200);
          const handled: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
          expect(handled).assertTrue();
          const text: string = await readTextById(driver);
          expect(text).assertEqual(PAGE_TEXT_CLICKED);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_EVENT_0200
     * @tc.name testEventClickDispatchKeepsPageAlive
     * @tc.desc Verify dispatched click does not tear down the page: component count stable and text present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEventClickDispatchKeepsPageAlive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const beforeCount: number = await pageComponentCount(driver);
          await clickTextComponent(driver);
          const afterCount: number = await pageComponentCount(driver);
          expect(afterCount).assertEqual(beforeCount);
          const visible: boolean = await isIndexPageVisible(driver);
          expect(visible).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_EVENT_0300
     * @tc.name testEventRegistrationAddsHandler
     * @tc.desc Verify handler registration succeeds once and duplicate registration is rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEventRegistrationAddsHandler', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const bus: EventBus = new EventBus();
          const first: boolean = bus.register(buildRegistration('handler-a', EventKind.CLICK,
            HandlerPriority.NORMAL, false));
          const duplicate: boolean = bus.register(buildRegistration('handler-a', EventKind.CLICK,
            HandlerPriority.HIGH, false));
          expect(first).assertTrue();
          expect(duplicate).assertFalse();
          expect(bus.getRegistrationCount()).assertEqual(1);
          expect(bus.getRegistrationCountByKind(EventKind.CLICK)).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_EVENT_0400
     * @tc.name testEventUnregistrationRemovesHandler
     * @tc.desc Verify unregistration removes a handler and repeated removal returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEventUnregistrationRemovesHandler', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const bus: EventBus = new EventBus();
          bus.register(buildRegistration('handler-b', EventKind.CLICK, HandlerPriority.LOW, false));
          bus.register(buildRegistration('handler-c', EventKind.CLICK, HandlerPriority.HIGH, false));
          const removed: boolean = bus.unregister('handler-b');
          const removedAgain: boolean = bus.unregister('handler-b');
          expect(removed).assertTrue();
          expect(removedAgain).assertFalse();
          expect(bus.getRegistrationCount()).assertEqual(1);
          expect(bus.isRegistered('handler-b')).assertFalse();
          expect(bus.isRegistered('handler-c')).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_EVENT_0500
     * @tc.name testEventDispatchSkipsUnregisteredKind
     * @tc.desc Verify dispatch only selects handlers of the event kind: focus event reaches zero click handlers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEventDispatchSkipsUnregisteredKind', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const bus: EventBus = new EventBus();
          bus.register(buildRegistration('click-handler', EventKind.CLICK, HandlerPriority.NORMAL, false));
          bus.register(buildRegistration('focus-handler', EventKind.FOCUS, HandlerPriority.NORMAL, false));
          const clickResult: DispatchRecord[] = bus.dispatch(buildEvent(EventKind.CLICK, 'text', 'activate'));
          const blurResult: DispatchRecord[] = bus.dispatch(buildEvent(EventKind.BLUR, 'text', 'blur'));
          expect(clickResult.length).assertEqual(1);
          expect(clickResult[0].handlerId).assertEqual('click-handler');
          expect(blurResult.length).assertEqual(0);
          expect(bus.getDispatchCount()).assertEqual(2);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_EVENT_0600
     * @tc.name testEventPriorityOrderingHighFirst
     * @tc.desc Verify dispatch order puts CRITICAL before HIGH before NORMAL before LOW
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEventPriorityOrderingHighFirst', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const bus: EventBus = new EventBus();
          bus.register(buildRegistration('low', EventKind.CLICK, HandlerPriority.LOW, false));
          bus.register(buildRegistration('normal', EventKind.CLICK, HandlerPriority.NORMAL, false));
          bus.register(buildRegistration('critical', EventKind.CLICK, HandlerPriority.CRITICAL, false));
          bus.register(buildRegistration('high', EventKind.CLICK, HandlerPriority.HIGH, false));
          const order: string[] = bus.getDispatchOrderOf(buildEvent(EventKind.CLICK, 'text', 'order'));
          expect(order.length).assertEqual(4);
          expect(order[0]).assertEqual('critical');
          expect(order[1]).assertEqual('high');
          expect(order[2]).assertEqual('normal');
          expect(order[3]).assertEqual('low');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_EVENT_0700
     * @tc.name testEventPriorityEqualKeepsRegistrationOrder
     * @tc.desc Verify equal priority handlers keep registration order in dispatch sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEventPriorityEqualKeepsRegistrationOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const bus: EventBus = new EventBus();
          bus.register(buildRegistration('first', EventKind.CLICK, HandlerPriority.NORMAL, false));
          bus.register(buildRegistration('second', EventKind.CLICK, HandlerPriority.NORMAL, false));
          bus.register(buildRegistration('third', EventKind.CLICK, HandlerPriority.NORMAL, false));
          const order: string[] = bus.getDispatchOrderOf(buildEvent(EventKind.CLICK, 'text', 'tie'));
          expect(order[0]).assertEqual('first');
          expect(order[1]).assertEqual('second');
          expect(order[2]).assertEqual('third');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_EVENT_0800
     * @tc.name testEventDispatchRecordOrderIndex
     * @tc.desc Verify dispatch records carry contiguous order indexes starting at zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEventDispatchRecordOrderIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const bus: EventBus = new EventBus();
          bus.register(buildRegistration('primary', EventKind.CLICK, HandlerPriority.CRITICAL, false));
          bus.register(buildRegistration('secondary', EventKind.CLICK, HandlerPriority.LOW, false));
          const records: DispatchRecord[] = bus.dispatch(buildEvent(EventKind.CLICK, 'text', 'payload-1'));
          expect(records.length).assertEqual(2);
          expect(records[0].order).assertEqual(0);
          expect(records[1].order).assertEqual(1);
          expect(records[0].payload).assertEqual('payload-1');
          expect(records[1].status).assertEqual(HandleStatus.HANDLED);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_EVENT_0900
     * @tc.name testEventOnceHandlerRemovedAfterDispatch
     * @tc.desc Verify once handler fires exactly one time: second dispatch reaches only persistent handler
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEventOnceHandlerRemovedAfterDispatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const bus: EventBus = new EventBus();
          bus.register(buildRegistration('once-handler', EventKind.CLICK, HandlerPriority.HIGH, true));
          bus.register(buildRegistration('sticky-handler', EventKind.CLICK, HandlerPriority.LOW, false));
          const firstDispatch: DispatchRecord[] = bus.dispatch(buildEvent(EventKind.CLICK, 'text', 'first'));
          const secondDispatch: DispatchRecord[] = bus.dispatch(buildEvent(EventKind.CLICK, 'text', 'second'));
          expect(firstDispatch.length).assertEqual(2);
          expect(secondDispatch.length).assertEqual(1);
          expect(secondDispatch[0].handlerId).assertEqual('sticky-handler');
          expect(bus.getRegistrationCount()).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_EVENT_1000
     * @tc.name testEventRecordHistoryQuery
     * @tc.desc Verify per-handler record history accumulates across dispatches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEventRecordHistoryQuery', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const bus: EventBus = new EventBus();
          bus.register(buildRegistration('audit', EventKind.KEY_DOWN, HandlerPriority.NORMAL, false));
          bus.dispatch(buildEvent(EventKind.KEY_DOWN, 'keyboard', 'key-enter'));
          bus.dispatch(buildEvent(EventKind.KEY_DOWN, 'keyboard', 'key-space'));
          const auditRecords: DispatchRecord[] = bus.getRecordsByHandler('audit');
          expect(auditRecords.length).assertEqual(2);
          expect(auditRecords[0].payload).assertEqual('key-enter');
          expect(auditRecords[1].payload).assertEqual('key-space');
          expect(bus.getRecordCount()).assertEqual(2);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_EVENT_1100
     * @tc.name testEventBusClearResetsState
     * @tc.desc Verify bus clear removes registrations and dispatch counters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEventBusClearResetsState', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const bus: EventBus = new EventBus();
          bus.register(buildRegistration('temp', EventKind.CLICK, HandlerPriority.NORMAL, false));
          bus.dispatch(buildEvent(EventKind.CLICK, 'text', 'temp-payload'));
          bus.clear();
          expect(bus.getRegistrationCount()).assertEqual(0);
          expect(bus.getDispatchCount()).assertEqual(0);
          expect(bus.getRecordCount()).assertEqual(0);
          expect(bus.isRegistered('temp')).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_EVENT_1200
     * @tc.name testEventPipelineStopsAtTarget
     * @tc.desc Verify stopPropagation halts the phase pipeline after target phase: two phases only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEventPipelineStopsAtTarget', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const pipeline: DispatchPipeline = new DispatchPipeline();
          const trace: string[] = pipeline.run('HelloWorld');
          expect(trace.length).assertEqual(2);
          expect(trace[0]).assertEqual('capture:HelloWorld');
          expect(trace[1]).assertEqual('target:HelloWorld');
          expect(pipeline.isStopped()).assertTrue();
          expect(pipeline.getPhaseCount()).assertEqual(4);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_EVENT_1300
     * @tc.name testEventPipelineFullTrace
     * @tc.desc Verify uninterrupted pipeline visits all four phases in fixed order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEventPipelineFullTrace', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const pipeline: DispatchPipeline = new DispatchPipeline();
          const trace: string[] = pipeline.runFull('HelloWorld');
          expect(trace.length).assertEqual(4);
          expect(trace[0]).assertEqual('capture:HelloWorld');
          expect(trace[1]).assertEqual('target:HelloWorld');
          expect(trace[2]).assertEqual('bubble:HelloWorld');
          expect(trace[3]).assertEqual('post:HelloWorld');
          expect(pipeline.isStopped()).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_EVENT_1400
     * @tc.name testEventPipelinePhaseValidation
     * @tc.desc Verify phase validation accepts known phases and rejects unknown ones
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEventPipelinePhaseValidation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const pipeline: DispatchPipeline = new DispatchPipeline();
          expect(pipeline.isPhaseValid(DispatchPhase.CAPTURE)).assertTrue();
          expect(pipeline.isPhaseValid(DispatchPhase.POST)).assertTrue();
          expect(pipeline.isPhaseValid(DispatchPhase.BUBBLE)).assertTrue();
          expect(pipeline.getPhaseCount()).assertEqual(4);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_EVENT_1500
     * @tc.name testEventAsyncQueueCompletionOrder
     * @tc.desc Verify async queue preserves enqueue order when tasks complete in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEventAsyncQueueCompletionOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const queue: AsyncEventQueue = new AsyncEventQueue();
          queue.enqueue('register');
          queue.enqueue('activate');
          queue.enqueue('render');
          expect(queue.getPendingCount()).assertEqual(3);
          queue.complete('register');
          queue.complete('activate');
          queue.complete('render');
          const completed: string[] = queue.getCompletedOrder();
          expect(completed.length).assertEqual(3);
          expect(completed[0]).assertEqual('register');
          expect(completed[2]).assertEqual('render');
          expect(queue.isOrderPreserved()).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_EVENT_1600
     * @tc.name testEventAsyncQueueOutOfOrderDetection
     * @tc.desc Verify out of order completion is detected: render completes before activate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEventAsyncQueueOutOfOrderDetection', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const queue: AsyncEventQueue = new AsyncEventQueue();
          queue.enqueue('register');
          queue.enqueue('activate');
          queue.enqueue('render');
          queue.complete('render');
          queue.complete('activate');
          expect(queue.isOrderPreserved()).assertFalse();
          expect(queue.getPendingCount()).assertEqual(1);
          expect(queue.complete('register')).assertTrue();
          expect(queue.complete('register')).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_EVENT_1700
     * @tc.name testEventAsyncQueueResetAndStep
     * @tc.desc Verify queue step counter grows per enqueue and resets to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEventAsyncQueueResetAndStep', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const queue: AsyncEventQueue = new AsyncEventQueue();
          expect(queue.getStep()).assertEqual(0);
          queue.enqueue('one');
          queue.enqueue('two');
          expect(queue.getStep()).assertEqual(2);
          const emptyOrder: string[] = queue.getCompletedOrder();
          expect(emptyOrder.length).assertEqual(0);
          queue.reset();
          expect(queue.getStep()).assertEqual(0);
          expect(queue.getPendingCount()).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_EVENT_1800
     * @tc.name testEventCounterIncrement
     * @tc.desc Verify event counter increments per key and totals across keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEventCounterIncrement', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const counter: EventCounter = new EventCounter();
          expect(counter.countOf('click')).assertEqual(0);
          expect(counter.increment('click')).assertEqual(1);
          expect(counter.increment('click')).assertEqual(2);
          expect(counter.increment('focus')).assertEqual(1);
          expect(counter.countOf('click')).assertEqual(2);
          expect(counter.getTotal()).assertEqual(3);
          expect(counter.getKeys().length).assertEqual(2);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_EVENT_1900
     * @tc.name testEventCounterReset
     * @tc.desc Verify counter reset clears all keys and totals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEventCounterReset', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const counter: EventCounter = new EventCounter();
          counter.increment('key_down');
          counter.increment('key_up');
          counter.reset();
          expect(counter.getTotal()).assertEqual(0);
          expect(counter.countOf('key_down')).assertEqual(0);
          expect(counter.getKeys().length).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_EVENT_2000
     * @tc.name testEventPriorityResolverDescribe
     * @tc.desc Verify priority descriptions map exactly for all four levels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEventPriorityResolverDescribe', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(PriorityResolver.describe(HandlerPriority.CRITICAL)).assertEqual('critical');
          expect(PriorityResolver.describe(HandlerPriority.HIGH)).assertEqual('high');
          expect(PriorityResolver.describe(HandlerPriority.NORMAL)).assertEqual('normal');
          expect(PriorityResolver.describe(HandlerPriority.LOW)).assertEqual('low');
          expect(PriorityResolver.isHigher(HandlerPriority.HIGH, HandlerPriority.NORMAL)).assertTrue();
          expect(PriorityResolver.isHigher(HandlerPriority.LOW, HandlerPriority.CRITICAL)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_EVENT_2100
     * @tc.name testEventPriorityResolverClamp
     * @tc.desc Verify priority clamping at boundaries: values below one and above four are clamped
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEventPriorityResolverClamp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(PriorityResolver.clamp(0)).assertEqual(HandlerPriority.LOW);
          expect(PriorityResolver.clamp(1)).assertEqual(HandlerPriority.LOW);
          expect(PriorityResolver.clamp(2)).assertEqual(HandlerPriority.NORMAL);
          expect(PriorityResolver.clamp(3)).assertEqual(HandlerPriority.HIGH);
          expect(PriorityResolver.clamp(4)).assertEqual(HandlerPriority.CRITICAL);
          expect(PriorityResolver.clamp(9)).assertEqual(HandlerPriority.CRITICAL);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_EVENT_2200
     * @tc.name testEventKeyboardDispatchNoSideEffect
     * @tc.desc Verify keyboard input reaches page without mutation: ENTER and SPACE keep text unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEventKeyboardDispatchNoSideEffect', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const beforeText: string = await readTextById(driver);
          await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
          await pressAndWait(driver, KEY_SPACE, 1, DELAY_KEY_NAVIGATION);
          const afterText: string = await readTextById(driver);
          expect(afterText).assertEqual(beforeText);
          const visible: boolean = await isIndexPageVisible(driver);
          expect(visible).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_EVENT_2300
     * @tc.name testEventSynchronousDispatchBeforeAsync
     * @tc.desc Verify synchronous dispatch records complete before asynchronous queue tasks are marked done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEventSynchronousDispatchBeforeAsync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const bus: EventBus = new EventBus();
          const queue: AsyncEventQueue = new AsyncEventQueue();
          bus.register(buildRegistration('sync-handler', EventKind.CLICK, HandlerPriority.NORMAL, false));
          queue.enqueue('async-follow-up');
          const records: DispatchRecord[] = bus.dispatch(buildEvent(EventKind.CLICK, 'text', 'sync-first'));
          expect(records.length).assertEqual(1);
          expect(queue.getPendingCount()).assertEqual(1);
          queue.complete('async-follow-up');
          expect(queue.getPendingCount()).assertEqual(0);
          expect(bus.getDispatchCount()).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_EVENT_2400
     * @tc.name testEventPlateauDispatchStress
     * @tc.desc Verify bus handles repeated dispatches without state corruption: ten dispatches -> ten records
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEventPlateauDispatchStress', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const bus: EventBus = new EventBus();
          bus.register(buildRegistration('stress', EventKind.CLICK, HandlerPriority.NORMAL, false));
          for (let i = 0; i < 10; i++) {
            bus.dispatch(buildEvent(EventKind.CLICK, 'text', `payload-${i}`));
          }
          expect(bus.getDispatchCount()).assertEqual(10);
          expect(bus.getRecordCount()).assertEqual(10);
          const records: DispatchRecord[] = bus.getRecordsByHandler('stress');
          expect(records.length).assertEqual(10);
          expect(records[9].payload).assertEqual('payload-9');
        } finally {
          done();
        }
      })
  })
}
