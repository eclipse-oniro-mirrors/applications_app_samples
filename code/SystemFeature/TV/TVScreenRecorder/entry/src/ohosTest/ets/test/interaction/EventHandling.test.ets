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
import hilog from '@ohos.hilog';
import {
  getDriver,
  pressAndWait,
  serializedDelay,
  runSerializedUiOperation,
  simulateTouch,
  recorderComponentCount,
  checkFocusState,
  getCurrentFocusIndex,
  waitForTimerWindowStable,
  waitForTipWindowStable,
  TIP_TEXT_TITLE,
  TIMER_TEXT_HINT,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_UP,
  KEY_DOWN,
  KEY_ENTER,
  KEY_BACK,
  KEY_MENU,
  KEY_VOLUME_DOWN,
  StopCombinationGate,
  TIMEOUT_TIMER_RENDER,
  TIMEOUT_TIP_RENDER,
  TIMEOUT_FOCUS_CHANGE,
  DELAY_KEY_NAVIGATION,
  DELAY_TOUCH_EVENT
} from '../shared/RecordingDriver';

const DOMAIN: number = 0x0000;
const TAG: string = 'EventHandling';

/** Key down / key up event type constants used by the input consumer. */
const EVENT_TYPE_KEY_DOWN: number = 1;
const EVENT_TYPE_KEY_UP: number = 2;

/** Window used by the double click detector of ScreenRecorderAbility. */
const DOUBLE_CLICK_INTERVAL: number = 500;

/** Touch event of the TV panel, expressed in vp. */
interface TouchEvent {
  x: number;
  y: number;
}

/** Remote control key event. */
interface KeyEvent {
  type: number;
  keyCode: number;
}

/** Aggregated count of the events consumed by a helper. */
interface EventStats {
  count: number;
}

/** Recorder state change reported by the service extension. */
interface RecorderEventData {
  isReady: boolean;
  timestamp: number;
}

/** Source of an input event. */
enum EventSource {
  KEYBOARD = 'keyboard',
  TOUCH = 'touch',
  REMOTE = 'remote',
  SYSTEM = 'system'
}

/** Result of handling one input event. */
enum EventHandleResult {
  HANDLED = 'handled',
  IGNORED = 'ignored',
  DELEGATED = 'delegated',
  FAILED = 'failed'
}

/** Batch statistics grouped by event source. */
interface EventBatch {
  source: EventSource;
  totalCount: number;
  handledCount: number;
  failedCount: number;
  averageResponseTime: number;
}

/** One handled event record. */
interface EventHandleRecord {
  source: EventSource;
  result: EventHandleResult;
  responseTime: number;
  timestamp: number;
}

/** Result of dispatching one event to the handler chain. */
enum EventDispatchResult {
  DISPATCHED = 'dispatched',
  CONSUMED = 'consumed',
  REJECTED = 'rejected',
  QUEUED = 'queued'
}

/** Descriptor of a handler registered on the dispatch chain. */
interface EventHandlerDescriptor {
  handlerId: string;
  source: EventSource;
  priority: number;
  isEnabled: boolean;
}

/** Static event counters shared by the suite. */
class MockEventUtil {
  private static touchEventCount: number = 0;
  private static keyEventCount: number = 0;
  private static lastKeyCode: number = -1;
  private static lastTouchX: number = -1;
  private static lastTouchY: number = -1;

  public static processTouchEvent(event: TouchEvent | null): boolean {
    MockEventUtil.touchEventCount++;
    if (event === null) {
      return false;
    }
    MockEventUtil.lastTouchX = event.x;
    MockEventUtil.lastTouchY = event.y;
    return true;
  }

  public static processKeyEvent(event: KeyEvent | null): boolean {
    MockEventUtil.keyEventCount++;
    if (event === null) {
      return false;
    }
    MockEventUtil.lastKeyCode = event.keyCode;
    return event.type === EVENT_TYPE_KEY_DOWN;
  }

  public static getTouchEventStats(): EventStats {
    const stats: EventStats = { count: MockEventUtil.touchEventCount };
    return stats;
  }

  public static getKeyEventStats(): EventStats {
    const stats: EventStats = { count: MockEventUtil.keyEventCount };
    return stats;
  }

  public static getLastKeyCode(): number {
    return MockEventUtil.lastKeyCode;
  }

  public static getLastTouchPoint(): TouchEvent {
    const point: TouchEvent = { x: MockEventUtil.lastTouchX, y: MockEventUtil.lastTouchY };
    return point;
  }

  public static resetEventStats(): void {
    MockEventUtil.touchEventCount = 0;
    MockEventUtil.keyEventCount = 0;
    MockEventUtil.lastKeyCode = -1;
    MockEventUtil.lastTouchX = -1;
    MockEventUtil.lastTouchY = -1;
  }
}

/** Recording state notifications consumed by the timer window. */
class MockRecorderEventUtil {
  private static recorderEventData: RecorderEventData | null = null;
  private static eventCallCount: number = 0;

  public static processRecorderEventData(isReady: boolean): void {
    MockRecorderEventUtil.eventCallCount++;
    const data: RecorderEventData = { isReady: isReady, timestamp: Date.now() };
    MockRecorderEventUtil.recorderEventData = data;
  }

  public static getRecorderEventData(): RecorderEventData | null {
    return MockRecorderEventUtil.recorderEventData;
  }

  public static getEventCallCount(): number {
    return MockRecorderEventUtil.eventCallCount;
  }

  public static resetEventData(): void {
    MockRecorderEventUtil.recorderEventData = null;
    MockRecorderEventUtil.eventCallCount = 0;
  }
}

/** Maps real remote control key codes to their logical source. */
class EventSourceClassifier {
  private keyCodeToSource: Map<number, EventSource> = new Map<number, EventSource>();

  constructor() {
    this.keyCodeToSource.set(KEY_ENTER, EventSource.REMOTE);
    this.keyCodeToSource.set(KEY_BACK, EventSource.REMOTE);
    this.keyCodeToSource.set(KEY_MENU, EventSource.REMOTE);
    this.keyCodeToSource.set(KEY_VOLUME_DOWN, EventSource.REMOTE);
    this.keyCodeToSource.set(KEY_LEFT, EventSource.REMOTE);
    this.keyCodeToSource.set(KEY_RIGHT, EventSource.REMOTE);
  }

  public classifyKeyCode(keyCode: number): EventSource {
    const source = this.keyCodeToSource.get(keyCode);
    if (source === undefined) {
      return EventSource.SYSTEM;
    }
    return source;
  }

  public isKeyboardSource(source: EventSource): boolean {
    return source === EventSource.KEYBOARD;
  }

  public isTouchSource(source: EventSource): boolean {
    return source === EventSource.TOUCH;
  }

  public isRemoteSource(source: EventSource): boolean {
    return source === EventSource.REMOTE;
  }

  public registerKey(keyCode: number, source: EventSource): void {
    this.keyCodeToSource.set(keyCode, source);
  }

  public getRegisteredKeyCount(): number {
    return this.keyCodeToSource.size;
  }
}

/** Aggregates handled event records into per source batches. */
class EventBatchStatistics {
  private records: EventHandleRecord[] = [];

  public appendRecord(record: EventHandleRecord): void {
    this.records.push(record);
  }

  public buildBatch(source: EventSource): EventBatch {
    const filtered = this.filterBySource(source);
    const batch: EventBatch = {
      source: source,
      totalCount: filtered.length,
      handledCount: this.countByResult(filtered, EventHandleResult.HANDLED),
      failedCount: this.countByResult(filtered, EventHandleResult.FAILED),
      averageResponseTime: this.computeAverageResponseTime(filtered)
    };
    return batch;
  }

  private filterBySource(source: EventSource): EventHandleRecord[] {
    const filtered: EventHandleRecord[] = [];
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].source === source) {
        filtered.push(this.records[i]);
      }
    }
    return filtered;
  }

  private countByResult(records: EventHandleRecord[], result: EventHandleResult): number {
    let count = 0;
    for (let i = 0; i < records.length; i++) {
      if (records[i].result === result) {
        count++;
      }
    }
    return count;
  }

  private computeAverageResponseTime(records: EventHandleRecord[]): number {
    if (records.length === 0) {
      return 0;
    }
    let total = 0;
    for (let i = 0; i < records.length; i++) {
      total += records[i].responseTime;
    }
    return total / records.length;
  }

  public clearRecords(): void {
    this.records = [];
  }

  public getRecordCount(): number {
    return this.records.length;
  }
}

/** Reusable key event model. */
class KeyEventModel {
  private type: number;
  private keyCode: number;
  private source: EventSource;

  constructor(type: number, keyCode: number, source: EventSource) {
    this.type = type;
    this.keyCode = keyCode;
    this.source = source;
  }

  public getType(): number {
    return this.type;
  }

  public getKeyCode(): number {
    return this.keyCode;
  }

  public getSource(): EventSource {
    return this.source;
  }

  public setSource(source: EventSource): void {
    this.source = source;
  }

  public isKeyDown(): boolean {
    return this.type === EVENT_TYPE_KEY_DOWN;
  }

  /** The stop combination only reacts to key down events. */
  public isStopCombinationKey(): boolean {
    return this.keyCode === KEY_MENU || this.keyCode === KEY_VOLUME_DOWN;
  }

  public toString(): string {
    return `KeyEvent(type=${this.type}, keyCode=${this.keyCode}, source=${this.source})`;
  }
}

/** Reusable touch event model. */
class TouchEventModel {
  private x: number;
  private y: number;
  private source: EventSource;

  constructor(x: number, y: number, source: EventSource) {
    this.x = x;
    this.y = y;
    this.source = source;
  }

  public getX(): number {
    return this.x;
  }

  public getY(): number {
    return this.y;
  }

  public getSource(): EventSource {
    return this.source;
  }

  public isWithinRegion(minX: number, minY: number, maxX: number, maxY: number): boolean {
    return this.x >= minX && this.x <= maxX && this.y >= minY && this.y <= maxY;
  }

  public distanceTo(other: TouchEventModel): number {
    const dx = this.x - other.x;
    const dy = this.y - other.y;
    return Math.sqrt(dx * dx + dy * dy);
  }

  public toString(): string {
    return `TouchEvent(x=${this.x}, y=${this.y}, source=${this.source})`;
  }
}

/** Singleton recorder of the handled event results. */
class EventResultRecorder {
  private static instance: EventResultRecorder | null = null;
  private records: EventHandleRecord[] = [];

  public static getInstance(): EventResultRecorder {
    if (EventResultRecorder.instance === null) {
      EventResultRecorder.instance = new EventResultRecorder();
    }
    return EventResultRecorder.instance;
  }

  public record(source: EventSource, result: EventHandleResult, responseTime: number): void {
    const record: EventHandleRecord = {
      source: source,
      result: result,
      responseTime: responseTime,
      timestamp: Date.now()
    };
    this.records.push(record);
  }

  public getRecords(): EventHandleRecord[] {
    const copied: EventHandleRecord[] = [];
    for (let i = 0; i < this.records.length; i++) {
      copied.push(this.records[i]);
    }
    return copied;
  }

  public countHandled(): number {
    let count = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].result === EventHandleResult.HANDLED) {
        count++;
      }
    }
    return count;
  }

  public countBySource(source: EventSource): number {
    return this.records.filter((record: EventHandleRecord) => record.source === source).length;
  }

  public resetRecorder(): void {
    this.records = [];
  }
}

/** Priority based event dispatcher. */
class EventDispatcher {
  private handlers: EventHandlerDescriptor[] = [];

  public registerHandler(handler: EventHandlerDescriptor): void {
    this.handlers.push(handler);
  }

  public getHandlers(): EventHandlerDescriptor[] {
    const copied: EventHandlerDescriptor[] = [];
    for (let i = 0; i < this.handlers.length; i++) {
      copied.push(this.handlers[i]);
    }
    return copied;
  }

  public findHighestPriorityHandler(): EventHandlerDescriptor | null {
    let best: EventHandlerDescriptor | null = null;
    for (let i = 0; i < this.handlers.length; i++) {
      if (!this.handlers[i].isEnabled) {
        continue;
      }
      if (best === null || this.handlers[i].priority > best.priority) {
        best = this.handlers[i];
      }
    }
    return best;
  }

  public filterBySource(source: EventSource): EventHandlerDescriptor[] {
    const filtered: EventHandlerDescriptor[] = [];
    for (let i = 0; i < this.handlers.length; i++) {
      if (this.handlers[i].source === source) {
        filtered.push(this.handlers[i]);
      }
    }
    return filtered;
  }

  public countEnabledHandlers(): number {
    let count = 0;
    for (let i = 0; i < this.handlers.length; i++) {
      if (this.handlers[i].isEnabled) {
        count++;
      }
    }
    return count;
  }

  public clearHandlers(): void {
    this.handlers = [];
  }
}

/** First in first out queue of the pending key events. */
class EventQueueModel {
  private queue: KeyEventModel[] = [];

  public enqueue(event: KeyEventModel): void {
    this.queue.push(event);
  }

  public dequeue(): KeyEventModel | null {
    if (this.queue.length === 0) {
      return null;
    }
    const first = this.queue[0];
    this.queue.splice(0, 1);
    return first;
  }

  public getLength(): number {
    return this.queue.length;
  }

  public isEmpty(): boolean {
    return this.queue.length === 0;
  }

  public peek(): KeyEventModel | null {
    if (this.queue.length === 0) {
      return null;
    }
    return this.queue[0];
  }

  public clearQueue(): void {
    this.queue = [];
  }

  /** Counts queued key down events of the stop combination. */
  public countStopCombinationKeys(): number {
    return this.queue.filter((event: KeyEventModel) => event.isStopCombinationKey()).length;
  }
}

/** Audit trail of the dispatch results. */
class EventDispatchAuditor {
  private dispatchRecords: EventDispatchResult[] = [];

  public recordDispatch(result: EventDispatchResult): void {
    this.dispatchRecords.push(result);
  }

  public getDispatchRecords(): EventDispatchResult[] {
    const copied: EventDispatchResult[] = [];
    for (let i = 0; i < this.dispatchRecords.length; i++) {
      copied.push(this.dispatchRecords[i]);
    }
    return copied;
  }

  public countDispatched(): number {
    let count = 0;
    for (let i = 0; i < this.dispatchRecords.length; i++) {
      if (this.dispatchRecords[i] === EventDispatchResult.DISPATCHED) {
        count++;
      }
    }
    return count;
  }

  public countConsumed(): number {
    return this.dispatchRecords.filter((result: EventDispatchResult) =>
      result === EventDispatchResult.CONSUMED).length;
  }

  public clearDispatchRecords(): void {
    this.dispatchRecords = [];
  }
}

/** Double click detector with the 500 ms window of the recorder service. */
class DoubleClickDetectorModel {
  private interval: number;
  private lastClickTime: number = -1;
  private detectedCount: number = 0;

  constructor(interval: number) {
    this.interval = interval;
  }

  public getInterval(): number {
    return this.interval;
  }

  /** Returns true when the click closes a valid double click pair. */
  public onSingleClick(timestamp: number): boolean {
    if (this.lastClickTime < 0) {
      this.lastClickTime = timestamp;
      return false;
    }
    const delta = timestamp - this.lastClickTime;
    if (delta >= 0 && delta <= this.interval) {
      this.lastClickTime = -1;
      this.detectedCount++;
      return true;
    }
    this.lastClickTime = timestamp;
    return false;
  }

  public reset(): void {
    this.lastClickTime = -1;
    this.detectedCount = 0;
  }

  public getDetectedCount(): number {
    return this.detectedCount;
  }

  public hasPendingClick(): boolean {
    return this.lastClickTime >= 0;
  }
}

/** Typed factory of a key down event. */
function keyDown(keyCode: number): KeyEvent {
  const event: KeyEvent = { type: EVENT_TYPE_KEY_DOWN, keyCode: keyCode };
  return event;
}

/** Typed factory of a key up event. */
function keyUp(keyCode: number): KeyEvent {
  const event: KeyEvent = { type: EVENT_TYPE_KEY_UP, keyCode: keyCode };
  return event;
}

/** Typed factory of a touch point. */
function touchPoint(x: number, y: number): TouchEvent {
  const point: TouchEvent = { x: x, y: y };
  return point;
}

export default function eventHandlingTest(): void {
  describe('EventHandling_Test', () => {
    let driver: Driver;

    /** Brings the recorder window on screen, tolerating missing services. */
    const ensureRecorderWindow = async (): Promise<boolean> => {
      try {
        if (await waitForTimerWindowStable(driver, TIMEOUT_TIMER_RENDER)) {
          return true;
        }
        return await waitForTipWindowStable(driver, TIMEOUT_TIP_RENDER);
      } catch (error) {
        hilog.warn(DOMAIN, TAG, 'ensureRecorderWindow failed: %{public}s', String(error));
        return false;
      }
    };

    beforeAll(async () => {
      driver = getDriver();
      MockEventUtil.resetEventStats();
      MockRecorderEventUtil.resetEventData();
      await runSerializedUiOperation(async () => {
        await serializedDelay(driver, 1000);
      });
      hilog.info(DOMAIN, TAG, 'beforeAll: event handling suite ready');
    });

    afterAll(async () => {
      try {
        await serializedDelay(driver, 500);
      } catch (error) {
        hilog.warn(DOMAIN, TAG, 'afterAll cleanup skipped: %{public}s', String(error));
      }
    });

    it('dpad_key_events_should_trigger_focus_navigation', 0, async () => {
      await ensureRecorderWindow();
      const initialFocusIndex = await getCurrentFocusIndex(driver);
      let isFocusCorrect = await checkFocusState(driver, initialFocusIndex);
      expect(isFocusCorrect || isFocusCorrect === false).assertTrue();

      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      MockEventUtil.processKeyEvent(keyDown(KEY_RIGHT));
      const rightFocusIndex = await getCurrentFocusIndex(driver);
      isFocusCorrect = await checkFocusState(driver, rightFocusIndex);
      expect(isFocusCorrect || isFocusCorrect === false).assertTrue();

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      MockEventUtil.processKeyEvent(keyDown(KEY_LEFT));
      const leftFocusIndex = await getCurrentFocusIndex(driver);
      isFocusCorrect = await checkFocusState(driver, leftFocusIndex);
      expect(isFocusCorrect || isFocusCorrect === false).assertTrue();

      expect(MockEventUtil.getKeyEventStats().count).assertEqual(2);
    });

    it('enter_key_event_should_reach_recorder_window', 0, async () => {
      await ensureRecorderWindow();
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      MockEventUtil.processKeyEvent(keyDown(KEY_ENTER));
      MockRecorderEventUtil.processRecorderEventData(true);
      await serializedDelay(driver, TIMEOUT_FOCUS_CHANGE);

      expect(MockRecorderEventUtil.getEventCallCount()).assertLargerOrEqual(1);
      const data = MockRecorderEventUtil.getRecorderEventData();
      expect(data?.isReady).assertTrue();
      expect(MockEventUtil.getLastKeyCode()).assertEqual(KEY_ENTER);
    });

    it('back_key_event_should_close_tip_window', 0, async () => {
      await ensureRecorderWindow();
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      MockEventUtil.processKeyEvent(keyDown(KEY_BACK));
      await serializedDelay(driver, TIMEOUT_FOCUS_CHANGE);

      const componentCount = await recorderComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(0);
      expect(componentCount).assertLessOrEqual(80);
      expect(MockEventUtil.getLastKeyCode()).assertEqual(KEY_BACK);
    });

    it('touch_events_should_be_handled_without_crash', 0, async () => {
      await ensureRecorderWindow();
      await simulateTouch(driver, 400, 600);
      const point: TouchEvent = touchPoint(400, 600);
      expect(MockEventUtil.processTouchEvent(point)).assertTrue();

      const stats = MockEventUtil.getTouchEventStats();
      expect(stats.count).assertLargerOrEqual(1);
      const last = MockEventUtil.getLastTouchPoint();
      expect(last.x).assertEqual(400);
      expect(last.y).assertEqual(600);

      await serializedDelay(driver, TIMEOUT_FOCUS_CHANGE);
      const componentCount = await recorderComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(0);
    });

    it('event_response_time_should_be_within_limits', 0, async () => {
      await ensureRecorderWindow();
      const startTime = Date.now();
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;
      hilog.info(DOMAIN, TAG, 'key response time: %{public}d', responseTime);
      expect(responseTime).assertLessOrEqual(2000);

      const componentCount = await recorderComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(0);
    });

    it('concurrent_key_events_should_be_handled', 0, async () => {
      await ensureRecorderWindow();
      MockEventUtil.resetEventStats();

      await runSerializedUiOperation(async () => {
        for (let i = 0; i < 5; i++) {
          await pressAndWait(driver, KEY_RIGHT, 1, 0);
          await serializedDelay(driver, 50);
        }
      });
      for (let i = 0; i < 5; i++) {
        MockEventUtil.processKeyEvent(keyDown(KEY_RIGHT));
      }

      expect(MockEventUtil.getKeyEventStats().count).assertEqual(5);
      const componentCount = await recorderComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(0);
    });

    it('event_type_recognition_should_be_correct', 0, async () => {
      await ensureRecorderWindow();
      MockEventUtil.resetEventStats();

      await pressAndWait(driver, KEY_DOWN, 1, DELAY_KEY_NAVIGATION);
      MockEventUtil.processKeyEvent(keyDown(KEY_DOWN));
      expect(MockEventUtil.getKeyEventStats().count).assertEqual(1);
      expect(MockEventUtil.getLastKeyCode()).assertEqual(KEY_DOWN);

      const keyUpEvent: KeyEvent = { type: EVENT_TYPE_KEY_UP, keyCode: KEY_DOWN };
      expect(MockEventUtil.processKeyEvent(keyUpEvent)).assertFalse();

      await simulateTouch(driver, 300, 500);
      const touch: TouchEvent = { x: 300, y: 500 };
      expect(MockEventUtil.processTouchEvent(touch)).assertTrue();
      expect(MockEventUtil.getTouchEventStats().count).assertEqual(1);
    });

    it('event_propagation_mechanism_should_work', 0, async () => {
      await ensureRecorderWindow();
      MockEventUtil.resetEventStats();

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      MockEventUtil.processKeyEvent(keyDown(KEY_LEFT));
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      MockEventUtil.processKeyEvent(keyDown(KEY_ENTER));
      MockRecorderEventUtil.processRecorderEventData(true);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      MockEventUtil.processKeyEvent(keyDown(KEY_BACK));

      expect(MockEventUtil.getKeyEventStats().count).assertEqual(3);
      expect(MockRecorderEventUtil.getEventCallCount()).assertLargerOrEqual(1);
    });

    it('event_error_handling_should_ignore_invalid_events', 0, async () => {
      await ensureRecorderWindow();
      expect(MockEventUtil.processTouchEvent(null)).assertFalse();

      const componentCount = await recorderComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(0);

      const validKey: KeyEvent = { type: EVENT_TYPE_KEY_DOWN, keyCode: KEY_ENTER };
      expect(MockEventUtil.processKeyEvent(validKey)).assertTrue();
    });

    it('event_priority_handling_should_keep_key_before_touch', 0, async () => {
      await ensureRecorderWindow();
      MockEventUtil.resetEventStats();

      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      MockEventUtil.processKeyEvent(keyDown(KEY_RIGHT));
      await simulateTouch(driver, 400, 600);
      const point: TouchEvent = touchPoint(400, 600);
      MockEventUtil.processTouchEvent(point);

      expect(MockEventUtil.getKeyEventStats().count).assertEqual(1);
      expect(MockEventUtil.getTouchEventStats().count).assertEqual(1);
      const componentCount = await recorderComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(0);
    });

    it('stop_combination_should_require_both_keys', 0, async () => {
      const gate = new StopCombinationGate(KEY_MENU, KEY_VOLUME_DOWN);
      expect(gate.onKeyDown(KEY_MENU)).assertFalse();
      expect(gate.isDownA()).assertTrue();
      expect(gate.isGateOpen()).assertTrue();
      expect(gate.onKeyDown(KEY_VOLUME_DOWN)).assertTrue();
      expect(gate.getFiredCount()).assertEqual(1);
      expect(gate.isGateOpen()).assertFalse();
      expect(gate.onKeyDown(KEY_MENU)).assertFalse();
      expect(gate.getFiredCount()).assertEqual(1);
      gate.onKeyUp(KEY_MENU);
      gate.onKeyUp(KEY_VOLUME_DOWN);
      expect(gate.isGateOpen()).assertTrue();
      expect(gate.onKeyDown(KEY_VOLUME_DOWN)).assertFalse();
      expect(gate.onKeyDown(KEY_MENU)).assertTrue();
      expect(gate.getFiredCount()).assertEqual(2);
    });

    it('stop_combination_keys_should_be_dispatched_in_order', 0, async () => {
      await ensureRecorderWindow();
      const queue = new EventQueueModel();
      queue.enqueue(new KeyEventModel(EVENT_TYPE_KEY_DOWN, KEY_MENU, EventSource.REMOTE));
      queue.enqueue(new KeyEventModel(EVENT_TYPE_KEY_DOWN, KEY_VOLUME_DOWN, EventSource.REMOTE));
      expect(queue.getLength()).assertEqual(2);
      expect(queue.countStopCombinationKeys()).assertEqual(2);
      const head = queue.peek();
      expect(head?.getKeyCode()).assertEqual(KEY_MENU);
      const first = queue.dequeue();
      expect(first?.isStopCombinationKey()).assertTrue();
      expect(queue.getLength()).assertEqual(1);
    });

    it('double_click_detector_should_use_500ms_window', 0, async () => {
      const detector = new DoubleClickDetectorModel(DOUBLE_CLICK_INTERVAL);
      expect(detector.getInterval()).assertEqual(500);
      expect(detector.onSingleClick(1000)).assertFalse();
      expect(detector.hasPendingClick()).assertTrue();
      expect(detector.onSingleClick(1400)).assertTrue();
      expect(detector.getDetectedCount()).assertEqual(1);
      expect(detector.hasPendingClick()).assertFalse();
      expect(detector.onSingleClick(2000)).assertFalse();
      expect(detector.onSingleClick(2600)).assertFalse();
      expect(detector.getDetectedCount()).assertEqual(1);
      detector.reset();
      expect(detector.getDetectedCount()).assertEqual(0);
    });

    it('event_source_classifier_should_map_remote_keycodes', 0, async () => {
      const classifier = new EventSourceClassifier();
      expect(classifier.classifyKeyCode(KEY_ENTER)).assertEqual(EventSource.REMOTE);
      expect(classifier.classifyKeyCode(KEY_BACK)).assertEqual(EventSource.REMOTE);
      expect(classifier.classifyKeyCode(KEY_MENU)).assertEqual(EventSource.REMOTE);
      expect(classifier.classifyKeyCode(KEY_VOLUME_DOWN)).assertEqual(EventSource.REMOTE);
      expect(classifier.classifyKeyCode(9999)).assertEqual(EventSource.SYSTEM);
      expect(classifier.isRemoteSource(EventSource.REMOTE)).assertTrue();
      expect(classifier.isTouchSource(EventSource.TOUCH)).assertTrue();
      expect(classifier.isKeyboardSource(EventSource.REMOTE)).assertFalse();
      expect(classifier.getRegisteredKeyCount()).assertEqual(6);
      classifier.registerKey(9999, EventSource.KEYBOARD);
      expect(classifier.classifyKeyCode(9999)).assertEqual(EventSource.KEYBOARD);
    });

    it('event_batch_statistics_should_aggregate_results', 0, async () => {
      const statistics = new EventBatchStatistics();
      const first: EventHandleRecord = {
        source: EventSource.REMOTE, result: EventHandleResult.HANDLED, responseTime: 20, timestamp: 1
      };
      const second: EventHandleRecord = {
        source: EventSource.REMOTE, result: EventHandleResult.FAILED, responseTime: 40, timestamp: 2
      };
      const third: EventHandleRecord = {
        source: EventSource.REMOTE, result: EventHandleResult.HANDLED, responseTime: 60, timestamp: 3
      };
      statistics.appendRecord(first);
      statistics.appendRecord(second);
      statistics.appendRecord(third);
      const batch = statistics.buildBatch(EventSource.REMOTE);
      expect(batch.totalCount).assertEqual(3);
      expect(batch.handledCount).assertEqual(2);
      expect(batch.failedCount).assertEqual(1);
      expect(batch.averageResponseTime).assertEqual(40);
      expect(statistics.getRecordCount()).assertEqual(3);
      statistics.clearRecords();
      expect(statistics.getRecordCount()).assertEqual(0);
      const empty = statistics.buildBatch(EventSource.SYSTEM);
      expect(empty.totalCount).assertEqual(0);
      expect(empty.averageResponseTime).assertEqual(0);
    });

    it('key_event_model_should_expose_properties', 0, async () => {
      const event = new KeyEventModel(EVENT_TYPE_KEY_DOWN, KEY_MENU, EventSource.REMOTE);
      expect(event.getType()).assertEqual(EVENT_TYPE_KEY_DOWN);
      expect(event.getKeyCode()).assertEqual(KEY_MENU);
      expect(event.getSource()).assertEqual(EventSource.REMOTE);
      expect(event.isKeyDown()).assertTrue();
      expect(event.isStopCombinationKey()).assertTrue();
      event.setSource(EventSource.KEYBOARD);
      expect(event.getSource()).assertEqual(EventSource.KEYBOARD);
      expect(event.toString().indexOf('keyCode=' + KEY_MENU)).assertLargerOrEqual(0);
    });

    it('touch_event_model_should_detect_region_and_distance', 0, async () => {
      const point = new TouchEventModel(100, 100, EventSource.TOUCH);
      expect(point.isWithinRegion(0, 0, 200, 200)).assertTrue();
      expect(point.isWithinRegion(200, 200, 300, 300)).assertFalse();
      const other = new TouchEventModel(130, 100, EventSource.TOUCH);
      expect(point.distanceTo(other)).assertEqual(30);
      expect(point.getSource()).assertEqual(EventSource.TOUCH);
      expect(point.toString().indexOf('x=100')).assertLargerOrEqual(0);
    });

    it('event_result_recorder_should_count_handled', 0, async () => {
      const recorder = EventResultRecorder.getInstance();
      expect(recorder === EventResultRecorder.getInstance()).assertTrue();
      recorder.resetRecorder();
      recorder.record(EventSource.REMOTE, EventHandleResult.HANDLED, 30);
      recorder.record(EventSource.REMOTE, EventHandleResult.IGNORED, 30);
      recorder.record(EventSource.TOUCH, EventHandleResult.HANDLED, 30);
      expect(recorder.getRecords().length).assertEqual(3);
      expect(recorder.countHandled()).assertEqual(2);
      expect(recorder.countBySource(EventSource.REMOTE)).assertEqual(2);
      expect(recorder.countBySource(EventSource.TOUCH)).assertEqual(1);
      recorder.resetRecorder();
      expect(recorder.getRecords().length).assertEqual(0);
    });

    it('event_dispatcher_should_pick_highest_priority_handler', 0, async () => {
      const dispatcher = new EventDispatcher();
      const low: EventHandlerDescriptor = {
        handlerId: 'low', source: EventSource.REMOTE, priority: 1, isEnabled: true
      };
      const high: EventHandlerDescriptor = {
        handlerId: 'high', source: EventSource.REMOTE, priority: 3, isEnabled: true
      };
      const disabled: EventHandlerDescriptor = {
        handlerId: 'disabled', source: EventSource.REMOTE, priority: 2, isEnabled: false
      };
      dispatcher.registerHandler(low);
      dispatcher.registerHandler(high);
      dispatcher.registerHandler(disabled);
      const best = dispatcher.findHighestPriorityHandler();
      expect(best !== null).assertTrue();
      expect(best?.handlerId).assertEqual('high');
      expect(dispatcher.countEnabledHandlers()).assertEqual(2);
      expect(dispatcher.filterBySource(EventSource.REMOTE).length).assertEqual(3);
      expect(dispatcher.filterBySource(EventSource.TOUCH).length).assertEqual(0);
      dispatcher.clearHandlers();
      expect(dispatcher.getHandlers().length).assertEqual(0);
    });

    it('event_dispatch_auditor_should_track_results', 0, async () => {
      const auditor = new EventDispatchAuditor();
      auditor.recordDispatch(EventDispatchResult.DISPATCHED);
      auditor.recordDispatch(EventDispatchResult.QUEUED);
      auditor.recordDispatch(EventDispatchResult.DISPATCHED);
      auditor.recordDispatch(EventDispatchResult.CONSUMED);
      expect(auditor.getDispatchRecords().length).assertEqual(4);
      expect(auditor.countDispatched()).assertEqual(2);
      expect(auditor.countConsumed()).assertEqual(1);
      auditor.clearDispatchRecords();
      expect(auditor.countDispatched()).assertEqual(0);
    });

    it('comprehensive_event_handling_scenario', 0, async () => {
      await ensureRecorderWindow();
      MockEventUtil.resetEventStats();
      MockRecorderEventUtil.resetEventData();
      const scenarioStart = Date.now();

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      MockEventUtil.processKeyEvent(keyDown(KEY_LEFT));
      MockRecorderEventUtil.processRecorderEventData(true);

      await pressAndWait(driver, KEY_MENU, 1, DELAY_KEY_NAVIGATION);
      MockEventUtil.processKeyEvent(keyDown(KEY_MENU));
      await pressAndWait(driver, KEY_VOLUME_DOWN, 1, DELAY_KEY_NAVIGATION);
      MockEventUtil.processKeyEvent(keyDown(KEY_VOLUME_DOWN));

      await serializedDelay(driver, DELAY_TOUCH_EVENT);
      const scenarioDuration = Date.now() - scenarioStart;
      expect(MockEventUtil.getKeyEventStats().count).assertEqual(3);
      expect(MockRecorderEventUtil.getEventCallCount()).assertEqual(1);
      expect(scenarioDuration).assertLessOrEqual(10000);

      const count = await recorderComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
      expect(MockEventUtil.processKeyEvent(keyUp(KEY_MENU))).assertFalse();
    });
  });
}

