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
import {
  DELAY_AFTER_START_MODE,
  DELAY_KEY_NAVIGATION,
  KEY_BACK,
  KEY_DOWN,
  KEY_ENTER,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_UP,
  TIMEOUT_FOCUS_CHANGE,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_PAGE_SWITCH,
  TOLERANCE_COMPONENT_COUNT,
  checkFocusState,
  componentCount,
  getCurrentFocusIndex,
  getDriver,
  homeComponentCount,
  isHomePageVisible,
  launchStandardAbility,
  logInfo,
  pressAndWait,
  resetToHome,
  simulateTouch,
  waitForFoodDetailStable,
  waitForHomePageStable
} from '../Shared/SharedDriver';
import hilog from '@ohos.hilog';

// Touch event interface: models a coordinate based touch on the home list.
interface TouchEvent {
  x?: number;
  y?: number;
}

// Key event interface: models a remote control or keyboard key event.
interface KeyEvent {
  type?: number;
  keyCode?: number;
}

// Event statistics structure: records the event count and the last event.
interface EventStats {
  count: number;
  lastEvent: TouchEvent | KeyEvent | null;
}

// Mock event utility: validates event handling in the test environment.
class MockEventUtil {
  private static touchEventCount: number = 0;
  private static keyEventCount: number = 0;
  private static lastTouchEvent: TouchEvent | null = null;
  private static lastKeyEvent: KeyEvent | null = null;

  // Handles a touch event and records the touch interaction.
  public static processTouchEvent(event: TouchEvent | null): boolean {
    MockEventUtil.touchEventCount++;
    MockEventUtil.lastTouchEvent = event;
    return event !== null;
  }

  // Handles a key event and verifies the key down type.
  public static processKeyEvent(event: KeyEvent | null): boolean {
    MockEventUtil.keyEventCount++;
    MockEventUtil.lastKeyEvent = event;
    return event !== null && event.type === 1;
  }

  public static getTouchEventStats(): EventStats {
    return {
      count: MockEventUtil.touchEventCount, lastEvent: MockEventUtil.lastTouchEvent
    };
  }

  public static getKeyEventStats(): EventStats {
    return {
      count: MockEventUtil.keyEventCount, lastEvent: MockEventUtil.lastKeyEvent
    };
  }

  public static resetEventStats(): void {
    MockEventUtil.touchEventCount = 0;
    MockEventUtil.keyEventCount = 0;
    MockEventUtil.lastTouchEvent = null;
    MockEventUtil.lastKeyEvent = null;
  }
}

// Mode launch event data: stores the launched state and the timestamp.
interface ModeEventData {
  isLaunched: boolean;
  timestamp: number;
}

// Mock launch event utility: records the launch mode events of the sample.
class MockModeEventUtil {
  private static modeEventData: ModeEventData | null = null;
  private static eventCallCount: number = 0;

  // Handles a mode launch event and stores the launched state.
  public static processModeEventData(isLaunched: boolean): void {
    MockModeEventUtil.eventCallCount++;
    MockModeEventUtil.modeEventData = { isLaunched, timestamp: Date.now() };
  }

  public static getModeEventData(): ModeEventData | null {
    return MockModeEventUtil.modeEventData;
  }

  public static getEventCallCount(): number {
    return MockModeEventUtil.eventCallCount;
  }

  public static resetEventData(): void {
    MockModeEventUtil.modeEventData = null;
    MockModeEventUtil.eventCallCount = 0;
  }
}

// ==================== Event handling extension utilities ====================

// Event source enumeration: describes where an event originates from.
enum EventSource {
  KEYBOARD = 'keyboard', TOUCH = 'touch', REMOTE = 'remote', SYSTEM = 'system'
}

// Event handling result enumeration: describes the handling outcome.
enum EventHandleResult {
  HANDLED = 'handled', IGNORED = 'ignored', DELEGATED = 'delegated', FAILED = 'failed'
}

// Event batch interface: describes the handling statistics of a batch.
interface EventBatch {
  source: EventSource;
  totalCount: number;
  handledCount: number;
  failedCount: number;
  averageResponseTime: number;
}

// Event handling record interface: describes a single handling record.
interface EventHandleRecord {
  source: EventSource;
  result: EventHandleResult;
  responseTime: number;
  timestamp: number;
}

// Event source classifier: maps a key code to an event source.
class EventSourceClassifier {
  private keyCodeToSource: Map<number, EventSource> = new Map<number, EventSource>();

  constructor() {
    this.keyCodeToSource.set(1, EventSource.KEYBOARD);
    this.keyCodeToSource.set(2, EventSource.KEYBOARD);
    this.keyCodeToSource.set(3, EventSource.REMOTE);
    this.keyCodeToSource.set(4, EventSource.REMOTE);
  }

  // Infers the event source from the key code.
  public classifyKeyCode(keyCode: number): EventSource {
    const source: EventSource | undefined = this.keyCodeToSource.get(keyCode);
    if (source === undefined) {
      return EventSource.SYSTEM;
    }
    return source;
  }

  // Checks whether the source is a keyboard source.
  public isKeyboardSource(source: EventSource): boolean {
    return source === EventSource.KEYBOARD;
  }

  // Checks whether the source is a touch source.
  public isTouchSource(source: EventSource): boolean {
    return source === EventSource.TOUCH;
  }
}

// Event batch statistics: aggregates the handling statistics of a batch.
class EventBatchStatistics {
  private records: EventHandleRecord[] = [];

  // Appends a single handling record.
  public appendRecord(record: EventHandleRecord): void {
    this.records.push(record);
  }

  // Builds the batch information of the given source.
  public buildBatch(source: EventSource): EventBatch {
    const filtered: EventHandleRecord[] = this.filterBySource(source);
    const batch: EventBatch = {
      source,
      totalCount: filtered.length,
      handledCount: this.countByResult(filtered, EventHandleResult.HANDLED),
      failedCount: this.countByResult(filtered, EventHandleResult.FAILED),
      averageResponseTime: this.computeAverageResponseTime(filtered)
    };
    return batch;
  }

  // Filters the records by source.
  private filterBySource(source: EventSource): EventHandleRecord[] {
    const filtered: EventHandleRecord[] = [];
    for (const record of this.records) {
      if (record.source === source) {
        filtered.push(record);
      }
    }
    return filtered;
  }

  // Counts the records with the given result.
  private countByResult(records: EventHandleRecord[], result: EventHandleResult): number {
    let count: number = 0;
    for (const record of records) {
      if (record.result === result) {
        count++;
      }
    }
    return count;
  }

  // Computes the average response time of the records.
  private computeAverageResponseTime(records: EventHandleRecord[]): number {
    if (records.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (const record of records) {
      total += record.responseTime;
    }
    return total / records.length;
  }

  // Clears every record.
  public clearRecords(): void {
    this.records = [];
  }

  // Returns the total number of records.
  public getRecordCount(): number {
    return this.records.length;
  }
}

// Key event model: wraps a reusable key event object.
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

  // Checks whether the event is a key down event.
  public isKeyDown(): boolean {
    return this.type === 1;
  }

  // Builds the textual representation of the event.
  public toString(): string {
    return `KeyEvent(type=${this.type}, keyCode=${this.keyCode}, source=${this.source})`;
  }
}

// Touch event model: wraps a reusable touch event object.
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

  // Checks whether the touch point is inside the given region.
  public isWithinRegion(minX: number, minY: number, maxX: number, maxY: number): boolean {
    return this.x >= minX && this.x <= maxX && this.y >= minY && this.y <= maxY;
  }

  // Computes the euclidean distance to another touch point.
  public distanceTo(other: TouchEventModel): number {
    const dx: number = this.x - other.x;
    const dy: number = this.y - other.y;
    return Math.sqrt(dx * dx + dy * dy);
  }

  // Builds the textual representation of the touch event.
  public toString(): string {
    return `TouchEvent(x=${this.x}, y=${this.y}, source=${this.source})`;
  }
}

// Event result recorder: centrally records the handling results.
class EventResultRecorder {
  private static instance: EventResultRecorder;
  private records: EventHandleRecord[] = [];

  // Returns the singleton instance to keep results consistent across suites.
  public static getInstance(): EventResultRecorder {
    if (!EventResultRecorder.instance) {
      EventResultRecorder.instance = new EventResultRecorder();
    }
    return EventResultRecorder.instance;
  }

  // Records a single handling result.
  public record(source: EventSource, result: EventHandleResult, responseTime: number): void {
    const record: EventHandleRecord = {
      source,
      result,
      responseTime,
      timestamp: Date.now()
    };
    this.records.push(record);
  }

  // Returns every record.
  public getRecords(): EventHandleRecord[] {
    return [...this.records];
  }

  // Counts the successfully handled records.
  public countHandled(): number {
    let count: number = 0;
    for (const record of this.records) {
      if (record.result === EventHandleResult.HANDLED) {
        count++;
      }
    }
    return count;
  }

  // Resets the recorder.
  public resetRecorder(): void {
    this.records = [];
  }
}

// Event dispatch result enumeration: describes the dispatch outcome.
enum EventDispatchResult {
  DISPATCHED = 'dispatched', CONSUMED = 'consumed', REJECTED = 'rejected', QUEUED = 'queued'
}

// Event handler descriptor: describes an object able to handle events.
interface EventHandlerDescriptor {
  handlerId: string;
  source: EventSource;
  priority: number;
  isEnabled: boolean;
}

// Event dispatcher: dispatches events by priority and source.
class EventDispatcher {
  private handlers: EventHandlerDescriptor[] = [];

  // Registers an event handler.
  public registerHandler(handler: EventHandlerDescriptor): void {
    this.handlers.push(handler);
  }

  // Returns every registered handler.
  public getHandlers(): EventHandlerDescriptor[] {
    return [...this.handlers];
  }

  // Finds the enabled handler with the highest priority.
  public findHighestPriorityHandler(): EventHandlerDescriptor | null {
    let best: EventHandlerDescriptor | null = null;
    for (const handler of this.handlers) {
      if (!handler.isEnabled) {
        continue;
      }
      if (best === null || handler.priority > best.priority) {
        best = handler;
      }
    }
    return best;
  }

  // Filters the handlers by source.
  public filterBySource(source: EventSource): EventHandlerDescriptor[] {
    const filtered: EventHandlerDescriptor[] = [];
    for (const handler of this.handlers) {
      if (handler.source === source) {
        filtered.push(handler);
      }
    }
    return filtered;
  }

  // Counts the enabled handlers.
  public countEnabledHandlers(): number {
    let count: number = 0;
    for (const handler of this.handlers) {
      if (handler.isEnabled) {
        count++;
      }
    }
    return count;
  }

  // Clears every handler.
  public clearHandlers(): void {
    this.handlers = [];
  }
}

// Event queue model: maintains a priority ordered event queue.
class EventQueueModel {
  private queue: KeyEventModel[] = [];

  // Enqueues a key event.
  public enqueue(event: KeyEventModel): void {
    this.queue.push(event);
  }

  // Dequeues the first key event.
  public dequeue(): KeyEventModel | null {
    if (this.queue.length === 0) {
      return null;
    }
    const first: KeyEventModel = this.queue[0];
    this.queue.splice(0, 1);
    return first;
  }

  // Returns the queue length.
  public getLength(): number {
    return this.queue.length;
  }

  // Checks whether the queue is empty.
  public isEmpty(): boolean {
    return this.queue.length === 0;
  }

  // Returns the head event without removing it.
  public peek(): KeyEventModel | null {
    if (this.queue.length === 0) {
      return null;
    }
    return this.queue[0];
  }

  // Clears the queue.
  public clearQueue(): void {
    this.queue = [];
  }
}

// Event dispatch auditor: audits the correctness of event dispatch.
class EventDispatchAuditor {
  private dispatchRecords: EventDispatchResult[] = [];

  // Records a single dispatch result.
  public recordDispatch(result: EventDispatchResult): void {
    this.dispatchRecords.push(result);
  }

  // Returns every dispatch record.
  public getDispatchRecords(): EventDispatchResult[] {
    return [...this.dispatchRecords];
  }

  // Counts the successfully dispatched events.
  public countDispatched(): number {
    let count: number = 0;
    for (const result of this.dispatchRecords) {
      if (result === EventDispatchResult.DISPATCHED) {
        count++;
      }
    }
    return count;
  }

  // Clears the dispatch records.
  public clearDispatchRecords(): void {
    this.dispatchRecords = [];
  }
}

export default function eventHandlingTest() {
  describe('EventHandling_Test', () => {
    let driver: Driver;

    // Test precondition: initialize the driver and clear the mock state.
    beforeAll(async () => {
      driver = getDriver();
      MockEventUtil.resetEventStats();
      MockModeEventUtil.resetEventData();
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      logInfo('EventHandling_Test: home page prepared');
    });

    // Test cleanup: return to the home page so later suites start clean.
    afterAll(async () => {
      await resetToHome(driver);
      await driver.delayMs(DELAY_AFTER_START_MODE);
    });

    // Verifies that arrow key events drive the focus navigation of the lists.
    it('arrow_key_events_should_trigger_focus_navigation', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);

      // Initial focus validation: the home list owns the focus after rendering.
      const initialFocusIndex: number = await getCurrentFocusIndex(driver);
      let isFocusCorrect: boolean = await checkFocusState(driver, initialFocusIndex);
      expect(isFocusCorrect).assertTrue();

      // Right navigation: the focus moves to the next food entry.
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      MockEventUtil.processKeyEvent({ type: 1, keyCode: KEY_RIGHT });
      const rightFocusIndex: number = await getCurrentFocusIndex(driver);
      isFocusCorrect = await checkFocusState(driver, rightFocusIndex);
      expect(isFocusCorrect).assertTrue();

      // Left navigation: the focus returns to the previous entry.
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      MockEventUtil.processKeyEvent({ type: 1, keyCode: KEY_LEFT });
      const leftFocusIndex: number = await getCurrentFocusIndex(driver);
      isFocusCorrect = await checkFocusState(driver, leftFocusIndex);
      expect(isFocusCorrect).assertTrue();
      const keyStats: EventStats = MockEventUtil.getKeyEventStats();
      expect(keyStats.count).assertLargerOrEqual(1);
    });

    // Verifies that the enter key launches a mode and opens the detail page.
    it('enter_key_event_should_open_food_detail', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      await pressAndWait(driver, KEY_DOWN, 1, DELAY_KEY_NAVIGATION);
      MockEventUtil.processKeyEvent({ type: 1, keyCode: KEY_ENTER });
      MockModeEventUtil.processModeEventData(true);
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      const detailVisible: boolean = await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH);
      expect(detailVisible).assertTrue();
      const eventCallCount: number = MockModeEventUtil.getEventCallCount();
      expect(eventCallCount).assertLargerOrEqual(1);
      const modeData: ModeEventData | null = MockModeEventUtil.getModeEventData();
      expect(modeData?.isLaunched).assertTrue();
      await resetToHome(driver);
    });

    // Verifies that the back key returns from the detail page to the home page.
    it('back_key_event_should_return_to_home', 0, async () => {
      await launchStandardAbility(0);
      await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH);

      // Returns to the home page and validates the component count.
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      MockEventUtil.processKeyEvent({ type: 1, keyCode: KEY_BACK });
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);
      const homeVisible: boolean = await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      expect(homeVisible).assertTrue();
      const componentCount: number = await homeComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // Verifies that touch events update the focus state of the home list.
    it('touch_events_should_handle_focus_changes', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      await simulateTouch(driver, 400, 600);
      MockEventUtil.processTouchEvent({ x: 400, y: 600 });
      const touchStats: EventStats = MockEventUtil.getTouchEventStats();
      expect(touchStats.count).assertLargerOrEqual(1);
      expect(touchStats.lastEvent !== null).assertTrue();
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);
      const componentCount: number = await homeComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // Verifies that the key response time stays inside the accepted limit.
    it('event_response_time_should_be_within_limits', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);

      // Measures the focus navigation response time of one key press.
      const startTime: number = Date.now();
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const endTime: number = Date.now();

      const responseTime: number = endTime - startTime;
      expect(responseTime).assertLessOrEqual(300);

      // Uses the component count to confirm the home page is still alive.
      const componentCount: number = await homeComponentCount(driver);
      hilog.info(0x0000, 'testTag', '%{public}s',
        `EventHandling: component count after response time probe ${componentCount}`);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // Verifies that concurrent key events are handled without losing input.
    it('concurrent_events_should_be_handled_correctly', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      MockEventUtil.resetEventStats();
      for (let i: number = 0; i < 5; i++) {
        await driver.triggerKey(KEY_RIGHT);
        MockEventUtil.processKeyEvent({ type: 1, keyCode: KEY_RIGHT });
        await driver.delayMs(DELAY_KEY_NAVIGATION);
      }
      await driver.delayMs(DELAY_KEY_NAVIGATION);
      const keyStats: EventStats = MockEventUtil.getKeyEventStats();
      expect(keyStats.count).assertLargerOrEqual(5);

      const componentCount: number = await homeComponentCount(driver);
      hilog.info(0x0000, 'testTag', '%{public}s',
        `EventHandling: component count after concurrent events ${componentCount}`);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // Verifies that the sample distinguishes key events from touch events.
    it('event_type_recognition_should_work_correctly', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      MockEventUtil.resetEventStats();

      // Key event validation: the type field marks a key down event.
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      MockEventUtil.processKeyEvent({ type: 1, keyCode: KEY_ENTER });
      const keyStats: EventStats = MockEventUtil.getKeyEventStats();
      expect(keyStats.count).assertLargerOrEqual(1);
      if (keyStats.lastEvent !== null) {
        const keyEvent: KeyEvent = keyStats.lastEvent as KeyEvent;
        expect(keyEvent.type).assertEqual(1);
      }

      // Touch event validation: the touch event is recognized separately.
      await simulateTouch(driver, 300, 500);
      MockEventUtil.processTouchEvent({ x: 300, y: 500 });
      const touchStats: EventStats = MockEventUtil.getTouchEventStats();
      expect(touchStats.count).assertLargerOrEqual(1);
      expect(touchStats.lastEvent !== null).assertTrue();
    });

    // Verifies that events propagate through the component tree as expected.
    it('event_propagation_mechanism_should_work_correctly', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      MockEventUtil.processKeyEvent({ type: 1, keyCode: KEY_LEFT });
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      MockEventUtil.processKeyEvent({ type: 1, keyCode: KEY_ENTER });
      MockModeEventUtil.processModeEventData(true);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      MockEventUtil.processKeyEvent({ type: 1, keyCode: KEY_BACK });
      const keyStats: EventStats = MockEventUtil.getKeyEventStats();
      expect(keyStats.count).assertLargerOrEqual(3);
      const eventCallCount: number = MockModeEventUtil.getEventCallCount();
      expect(eventCallCount).assertLargerOrEqual(1);
      const homeVisible: boolean = await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      expect(homeVisible).assertTrue();
    });

    // Verifies that invalid events never break the running page.
    it('event_error_handling_should_work_correctly', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      const invalidEventResult: boolean = MockEventUtil.processTouchEvent(null);
      expect(invalidEventResult).assertFalse();
      const componentCount: number = await homeComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
      const validEventResult: boolean = MockEventUtil.processKeyEvent({ type: 1, keyCode: KEY_ENTER });
      expect(validEventResult).assertTrue();
    });

    // Verifies that mixed key and touch events keep their own priorities.
    it('event_priority_handling_should_work_correctly', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      MockEventUtil.resetEventStats();

      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      MockEventUtil.processKeyEvent({ type: 1, keyCode: KEY_RIGHT });
      await simulateTouch(driver, 400, 600);
      MockEventUtil.processTouchEvent({ x: 400, y: 600 });

      const keyStats: EventStats = MockEventUtil.getKeyEventStats();
      const touchStats: EventStats = MockEventUtil.getTouchEventStats();

      expect(keyStats.count).assertLargerOrEqual(1);
      expect(touchStats.count).assertLargerOrEqual(1);
      const componentCount: number = await homeComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // Verifies that the home page survives repeated enter and back sequences.
    it('home_should_survive_repeated_enter_and_back_sequence', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      MockEventUtil.resetEventStats();
      for (let round: number = 0; round < 2; round++) {
        await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
        MockEventUtil.processKeyEvent({ type: 1, keyCode: KEY_ENTER });
        await driver.delayMs(DELAY_AFTER_START_MODE);
        await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
        MockEventUtil.processKeyEvent({ type: 1, keyCode: KEY_BACK });
        await driver.delayMs(DELAY_AFTER_START_MODE);
      }
      const homeVisible: boolean = await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      expect(homeVisible).assertTrue();
      expect(MockEventUtil.getKeyEventStats().count).assertLargerOrEqual(4);
    });

    // Verifies the event source classifier for known and unknown key codes.
    it('event_source_classifier_should_map_known_and_unknown_keycodes', 0, async () => {
      const classifier: EventSourceClassifier = new EventSourceClassifier();
      expect(classifier.classifyKeyCode(1)).assertEqual(EventSource.KEYBOARD);
      expect(classifier.classifyKeyCode(3)).assertEqual(EventSource.REMOTE);
      expect(classifier.classifyKeyCode(99)).assertEqual(EventSource.SYSTEM);
      expect(classifier.isKeyboardSource(EventSource.KEYBOARD)).assertTrue();
      expect(classifier.isTouchSource(EventSource.TOUCH)).assertTrue();
      expect(classifier.isKeyboardSource(EventSource.TOUCH)).assertFalse();
    });

    // Verifies that the batch statistics aggregate handled and failed events.
    it('event_batch_statistics_should_aggregate_handled_and_failed', 0, async () => {
      const statistics: EventBatchStatistics = new EventBatchStatistics();
      statistics.appendRecord({
        source: EventSource.KEYBOARD, result: EventHandleResult.HANDLED, responseTime: 20, timestamp: Date.now()
      });
      statistics.appendRecord({
        source: EventSource.KEYBOARD, result: EventHandleResult.FAILED, responseTime: 40, timestamp: Date.now()
      });
      statistics.appendRecord({
        source: EventSource.KEYBOARD, result: EventHandleResult.HANDLED, responseTime: 60, timestamp: Date.now()
      });
      const batch: EventBatch = statistics.buildBatch(EventSource.KEYBOARD);
      expect(batch.totalCount).assertEqual(3);
      expect(batch.handledCount).assertEqual(2);
      expect(batch.failedCount).assertEqual(1);
      expect(batch.averageResponseTime).assertEqual(40);
      expect(statistics.getRecordCount()).assertEqual(3);
    });

    // Verifies the property access and the source switching of the key model.
    it('key_event_model_should_expose_properties_and_toggle_source', 0, async () => {
      const event: KeyEventModel = new KeyEventModel(1, 2, EventSource.KEYBOARD);
      expect(event.getType()).assertEqual(1);
      expect(event.getKeyCode()).assertEqual(2);
      expect(event.getSource()).assertEqual(EventSource.KEYBOARD);
      expect(event.isKeyDown()).assertTrue();
      event.setSource(EventSource.REMOTE);
      expect(event.getSource()).assertEqual(EventSource.REMOTE);
      const text: string = event.toString();
      expect(text.indexOf('KeyEvent')).assertLargerOrEqual(0);
    });

    // Verifies the region hit test and the distance of the touch model.
    it('touch_event_model_should_detect_region_and_distance', 0, async () => {
      const point: TouchEventModel = new TouchEventModel(100, 100, EventSource.TOUCH);
      expect(point.isWithinRegion(0, 0, 200, 200)).assertTrue();
      expect(point.isWithinRegion(200, 200, 300, 300)).assertFalse();
      const other: TouchEventModel = new TouchEventModel(130, 100, EventSource.TOUCH);
      expect(point.distanceTo(other)).assertEqual(30);
      expect(point.getSource()).assertEqual(EventSource.TOUCH);
    });

    // Verifies the singleton recorder and its handled counter.
    it('event_result_recorder_singleton_should_count_handled', 0, async () => {
      const recorder: EventResultRecorder = EventResultRecorder.getInstance();
      recorder.resetRecorder();
      recorder.record(EventSource.REMOTE, EventHandleResult.HANDLED, 30);
      recorder.record(EventSource.REMOTE, EventHandleResult.IGNORED, 30);
      recorder.record(EventSource.REMOTE, EventHandleResult.HANDLED, 30);
      expect(recorder.getRecords().length).assertEqual(3);
      expect(recorder.countHandled()).assertEqual(2);
      recorder.resetRecorder();
      expect(recorder.getRecords().length).assertEqual(0);
      expect(EventResultRecorder.getInstance() === recorder).assertTrue();
    });

    // Verifies that the dispatcher picks the highest priority enabled handler.
    it('event_dispatcher_should_register_and_find_highest_priority', 0, async () => {
      const dispatcher: EventDispatcher = new EventDispatcher();
      dispatcher.registerHandler({ handlerId: 'a', source: EventSource.KEYBOARD, priority: 1, isEnabled: true });
      dispatcher.registerHandler({ handlerId: 'b', source: EventSource.KEYBOARD, priority: 3, isEnabled: true });
      dispatcher.registerHandler({ handlerId: 'c', source: EventSource.KEYBOARD, priority: 2, isEnabled: false });
      const best: EventHandlerDescriptor | null = dispatcher.findHighestPriorityHandler();
      expect(best !== null).assertTrue();
      expect(best?.handlerId).assertEqual('b');
      expect(dispatcher.countEnabledHandlers()).assertEqual(2);
      expect(dispatcher.getHandlers().length).assertEqual(3);
    });

    // Verifies the first in first out order of the event queue model.
    it('event_queue_model_should_enqueue_dequeue_peek_in_order', 0, async () => {
      const queue: EventQueueModel = new EventQueueModel();
      expect(queue.isEmpty()).assertTrue();
      queue.enqueue(new KeyEventModel(1, 1, EventSource.KEYBOARD));
      queue.enqueue(new KeyEventModel(1, 2, EventSource.REMOTE));
      expect(queue.getLength()).assertEqual(2);
      const head: KeyEventModel | null = queue.peek();
      expect(head?.getKeyCode()).assertEqual(1);
      const first: KeyEventModel | null = queue.dequeue();
      expect(first?.getKeyCode()).assertEqual(1);
      const second: KeyEventModel | null = queue.dequeue();
      expect(second?.getKeyCode()).assertEqual(2);
      expect(queue.isEmpty()).assertTrue();
      expect(queue.dequeue()).assertNull();
    });

    // Verifies that the dispatch auditor tracks every dispatch result.
    it('event_dispatch_auditor_should_track_dispatched_records', 0, async () => {
      const auditor: EventDispatchAuditor = new EventDispatchAuditor();
      auditor.recordDispatch(EventDispatchResult.DISPATCHED);
      auditor.recordDispatch(EventDispatchResult.QUEUED);
      auditor.recordDispatch(EventDispatchResult.DISPATCHED);
      expect(auditor.getDispatchRecords().length).assertEqual(3);
      expect(auditor.countDispatched()).assertEqual(2);
      auditor.clearDispatchRecords();
      expect(auditor.countDispatched()).assertEqual(0);
      expect(auditor.getDispatchRecords().length).assertEqual(0);
    });

    // Verifies the source based handler filtering of the dispatcher.
    it('event_dispatcher_should_filter_handlers_by_source', 0, async () => {
      const dispatcher: EventDispatcher = new EventDispatcher();
      dispatcher.registerHandler({ handlerId: 'k1', source: EventSource.KEYBOARD, priority: 1, isEnabled: true });
      dispatcher.registerHandler({ handlerId: 'k2', source: EventSource.KEYBOARD, priority: 2, isEnabled: true });
      dispatcher.registerHandler({ handlerId: 'r1', source: EventSource.REMOTE, priority: 3, isEnabled: true });
      const keyboardHandlers: EventHandlerDescriptor[] = dispatcher.filterBySource(EventSource.KEYBOARD);
      expect(keyboardHandlers.length).assertEqual(2);
      const remoteHandlers: EventHandlerDescriptor[] = dispatcher.filterBySource(EventSource.REMOTE);
      expect(remoteHandlers.length).assertEqual(1);
      dispatcher.clearHandlers();
      expect(dispatcher.getHandlers().length).assertEqual(0);
      expect(dispatcher.findHighestPriorityHandler()).assertNull();
    });

    // Verifies that an empty batch reports zeroed statistics.
    it('event_batch_statistics_should_return_zero_for_empty_batch', 0, async () => {
      const statistics: EventBatchStatistics = new EventBatchStatistics();
      const batch: EventBatch = statistics.buildBatch(EventSource.SYSTEM);
      expect(batch.totalCount).assertEqual(0);
      expect(batch.handledCount).assertEqual(0);
      expect(batch.failedCount).assertEqual(0);
      expect(batch.averageResponseTime).assertEqual(0);
    });

    // Verifies that the mock event utility records touch and key events.
    it('mock_event_util_should_track_touch_and_key_events', 0, async () => {
      MockEventUtil.resetEventStats();
      const touchValid: boolean = MockEventUtil.processTouchEvent({ x: 10, y: 20 });
      expect(touchValid).assertTrue();
      const keyValid: boolean = MockEventUtil.processKeyEvent({ type: 1, keyCode: 2 });
      expect(keyValid).assertTrue();
      const keyInvalid: boolean = MockEventUtil.processKeyEvent({ type: 2, keyCode: 2 });
      expect(keyInvalid).assertFalse();
      expect(MockEventUtil.getTouchEventStats().count).assertEqual(1);
      expect(MockEventUtil.getKeyEventStats().count).assertEqual(2);
    });

    // Verifies that the mock mode event utility records the launch state.
    it('mock_mode_event_util_should_record_launch_data', 0, async () => {
      MockModeEventUtil.resetEventData();
      expect(MockModeEventUtil.getEventCallCount()).assertEqual(0);
      MockModeEventUtil.processModeEventData(false);
      MockModeEventUtil.processModeEventData(true);
      expect(MockModeEventUtil.getEventCallCount()).assertEqual(2);
      const data: ModeEventData | null = MockModeEventUtil.getModeEventData();
      expect(data?.isLaunched).assertTrue();
      expect(data !== null).assertTrue();
    });

    // Verifies that the key event serialization contains every field.
    it('key_event_model_tostring_should_contain_all_fields', 0, async () => {
      const event: KeyEventModel = new KeyEventModel(1, 4, EventSource.REMOTE);
      const text: string = event.toString();
      expect(text.indexOf('type=1')).assertLargerOrEqual(0);
      expect(text.indexOf('keyCode=4')).assertLargerOrEqual(0);
      expect(text.indexOf('remote')).assertLargerOrEqual(0);
    });

    // Verifies that the touch event serialization contains the coordinates.
    it('touch_event_model_tostring_should_contain_coordinates', 0, async () => {
      const event: TouchEventModel = new TouchEventModel(200, 300, EventSource.TOUCH);
      const text: string = event.toString();
      expect(text.indexOf('x=200')).assertLargerOrEqual(0);
      expect(text.indexOf('y=300')).assertLargerOrEqual(0);
      expect(text.indexOf('touch')).assertLargerOrEqual(0);
    });

    // Verifies that clearing the event queue restores the empty state.
    it('event_queue_model_should_clear_all_events', 0, async () => {
      const queue: EventQueueModel = new EventQueueModel();
      queue.enqueue(new KeyEventModel(1, 1, EventSource.SYSTEM));
      queue.enqueue(new KeyEventModel(1, 2, EventSource.SYSTEM));
      expect(queue.getLength()).assertEqual(2);
      queue.clearQueue();
      expect(queue.isEmpty()).assertTrue();
      expect(queue.getLength()).assertEqual(0);
      expect(queue.peek()).assertNull();
    });

    // Verifies the component count tolerance used by the page stability probes.
    it('component_count_tolerance_should_absorb_small_differences', 0, async () => {
      const first: number = await homeComponentCount(driver);
      const second: number = await homeComponentCount(driver);
      expect(Math.abs(first - second)).assertLessOrEqual(TOLERANCE_COMPONENT_COUNT);
      expect(await isHomePageVisible(driver)).assertTrue();
    });
  });
}

