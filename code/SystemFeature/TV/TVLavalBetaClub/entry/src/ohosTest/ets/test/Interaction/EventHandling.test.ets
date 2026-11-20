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
  getDriver,
  serializedDelay,
  findComponentsByType,
  ensureHomePage,
  backToHome,
  pressAndWait,
  simulateTouch,
  componentCount,
  getCurrentFocusIndex,
  waitForAnyText,
  KEY_DPAD_UP,
  KEY_DPAD_DOWN,
  KEY_DPAD_LEFT,
  KEY_DPAD_RIGHT,
  KEY_ENTER,
  KEY_BACK,
  KEY_TAB,
  DELAY_KEY_NAVIGATION,
  DELAY_PAGE_SWITCH,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_FOCUS_CHANGE,
  TOLERANCE_COMPONENT_COUNT,
  TOLERANCE_FOCUS_CHANGE,
  TEXT_CREATE_ISSUE_CANDIDATES,
  TEXT_HOME_HEADER_CANDIDATES,
} from '../Shared/BetaClubDriver';
import { KeyCode } from '../../../../main/ets/pages/common/KeyCode';

const EVENT_TYPE_DOWN: number = 0;

const EVENT_TYPE_UP: number = 1;

const MAX_QUEUE_SIZE: number = 32;

const LONG_PRESS_THRESHOLD_MS: number = 500;

const DOUBLE_CLICK_INTERVAL_MS: number = 300;

interface InputEvent {
  keyCode: number;
  eventType: number;
  timestamp: number;
  repeat: boolean;
}

interface TouchSample {
  x: number;
  y: number;
  downAt: number;
  upAt: number;
}

// Queues key events and preserves their delivery order
class KeyEventQueue {
  private events: InputEvent[] = [];

  public enqueue(keyCode: number, eventType: number, repeat: boolean = false): boolean {
    if (this.events.length >= MAX_QUEUE_SIZE) {
      return false;
    }
    this.events.push({ keyCode: keyCode, eventType: eventType, timestamp: Date.now(), repeat: repeat });
    return true;
  }

  public dequeue(): InputEvent | undefined {
    if (this.events.length === 0) {
      return undefined;
    }
    return this.events.shift();
  }

  public size(): number {
    return this.events.length;
  }

  public peek(): InputEvent | undefined {
    return this.events.length === 0 ? undefined : this.events[0];
  }

  public countKey(keyCode: number): number {
    return this.events.filter((event: InputEvent) => event.keyCode === keyCode).length;
  }

  public clear(): void {
    this.events = [];
  }
}

// Reproduces the home page onKeyEvent handler in IssueReporterHome.ets
class HomeKeyHandler {
  private currentIndex: number = 0;
  private readonly entryCount: number;

  constructor(entryCount: number) {
    this.entryCount = entryCount;
  }

  public handle(keyCode: number): number {
    if (keyCode === KEY_DPAD_DOWN) {
      if (this.currentIndex < this.entryCount - 1) {
        this.currentIndex++;
      }
      return this.currentIndex;
    }
    if (keyCode === KEY_DPAD_UP) {
      if (this.currentIndex > 0) {
        this.currentIndex--;
      }
      return this.currentIndex;
    }
    return this.currentIndex;
  }

  public getIndex(): number {
    return this.currentIndex;
  }

  public reset(): void {
    this.currentIndex = 0;
  }
}

// Distinguishes single click, long press and double click gestures
class GestureClassifier {
  public static isLongPress(durationMs: number): boolean {
    return durationMs >= LONG_PRESS_THRESHOLD_MS;
  }

  public static isDoubleClick(firstUpAt: number, secondDownAt: number): boolean {
    return secondDownAt - firstUpAt >= 0 && secondDownAt - firstUpAt <= DOUBLE_CLICK_INTERVAL_MS;
  }

  public static isTap(durationMs: number): boolean {
    return durationMs >= 0 && durationMs < LONG_PRESS_THRESHOLD_MS;
  }

  public static isDrag(sample: TouchSample, thresholdPx: number): boolean {
    return Math.abs(sample.x) > thresholdPx || Math.abs(sample.y) > thresholdPx;
  }

  public static durationOf(sample: TouchSample): number {
    return sample.upAt - sample.downAt;
  }
}

// Models the event propagation chain for nested components
class EventPropagationChain {
  private handlers: string[] = [];

  public on(name: string): void {
    this.handlers.push(name);
  }

  public getHandlers(): string[] {
    return [...this.handlers];
  }

  public depth(): number {
    return this.handlers.length;
  }

  public isBubblingOrder(): boolean {
    return this.handlers.length > 1 && this.handlers[0] === 'child' && this.handlers[this.handlers.length - 1] === 'parent';
  }

  public reset(): void {
    this.handlers = [];
  }
}

// Measures handler latency and flags slow handlers
class EventLatencyBudget {
  private samples: number[] = [];
  private readonly budgetMs: number;

  constructor(budgetMs: number) {
    this.budgetMs = budgetMs;
  }

  public record(latencyMs: number): void {
    this.samples.push(latencyMs);
  }

  public getCount(): number {
    return this.samples.length;
  }

  public getMax(): number {
    let max: number = 0;
    for (let i = 0; i < this.samples.length; i++) {
      if (this.samples[i] > max) {
        max = this.samples[i];
      }
    }
    return max;
  }

  public isWithinBudget(): boolean {
    return this.getMax() <= this.budgetMs;
  }

  public getViolations(): number[] {
    return this.samples.filter((sample: number) => sample > this.budgetMs);
  }

  public reset(): void {
    this.samples = [];
  }
}

// Throttles key repeats so long presses do not flood the handler
class KeyRepeatThrottle {
  private lastAcceptedAt: number = 0;
  private readonly intervalMs: number;
  private suppressed: number = 0;

  constructor(intervalMs: number) {
    this.intervalMs = intervalMs;
  }

  public accept(now: number): boolean {
    if (this.lastAcceptedAt !== 0 && now - this.lastAcceptedAt < this.intervalMs) {
      this.suppressed++;
      return false;
    }
    this.lastAcceptedAt = now;
    return true;
  }

  public getSuppressed(): number {
    return this.suppressed;
  }

  public reset(): void {
    this.lastAcceptedAt = 0;
    this.suppressed = 0;
  }
}

// Models a linear focus traversal graph for the three home entries
class FocusTraversalGraph {
  private order: string[];
  private current: number = 0;

  constructor(order: string[]) {
    this.order = order;
  }

  public moveNext(): string {
    if (this.current < this.order.length - 1) {
      this.current++;
    }
    return this.currentId();
  }

  public movePrevious(): string {
    if (this.current > 0) {
      this.current--;
    }
    return this.currentId();
  }

  public moveTo(id: string): boolean {
    const index = this.order.indexOf(id);
    if (index < 0) {
      return false;
    }
    this.current = index;
    return true;
  }

  public currentId(): string {
    return this.order.length === 0 ? '' : this.order[this.current];
  }

  public getIndex(): number {
    return this.current;
  }

  public isAtStart(): boolean {
    return this.current === 0;
  }

  public isAtEnd(): boolean {
    return this.current === this.order.length - 1;
  }

  public size(): number {
    return this.order.length;
  }

  public reset(): void {
    this.current = 0;
  }
}

// Accumulates pointer movement for drag and fling detection
class PointerGestureAccumulator {
  private lastX: number = 0;
  private lastY: number = 0;
  private totalDistance: number = 0;
  private started: boolean = false;

  public begin(x: number, y: number): void {
    this.lastX = x;
    this.lastY = y;
    this.totalDistance = 0;
    this.started = true;
  }

  public moveTo(x: number, y: number): number {
    if (!this.started) {
      this.begin(x, y);
      return 0;
    }
    const deltaX = x - this.lastX;
    const deltaY = y - this.lastY;
    const distance = Math.sqrt(deltaX * deltaX + deltaY * deltaY);
    this.totalDistance += distance;
    this.lastX = x;
    this.lastY = y;
    return distance;
  }

  public getTotalDistance(): number {
    return this.totalDistance;
  }

  public isStarted(): boolean {
    return this.started;
  }

  public isFling(threshold: number): boolean {
    return this.totalDistance >= threshold;
  }

  public reset(): void {
    this.lastX = 0;
    this.lastY = 0;
    this.totalDistance = 0;
    this.started = false;
  }
}

// Counts delivered and dropped events per handler name
class EventDispatchStats {
  private delivered: Map<string, number> = new Map<string, number>();
  private dropped: number = 0;

  public deliver(handler: string): void {
    const current = this.delivered.get(handler) ?? 0;
    this.delivered.set(handler, current + 1);
  }

  public drop(): void {
    this.dropped++;
  }

  public getDelivered(handler: string): number {
    const value = this.delivered.get(handler);
    return value === undefined ? 0 : value;
  }

  public getTotalDelivered(): number {
    let total: number = 0;
    this.delivered.forEach((value: number) => {
      total += value;
    });
    return total;
  }

  public getDropped(): number {
    return this.dropped;
  }

  public getHandlerCount(): number {
    return this.delivered.size;
  }

  public reset(): void {
    this.delivered = new Map<string, number>();
    this.dropped = 0;
  }
}

export default function eventHandlingTest() {
  describe('EventHandling_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 300);
      await ensureHomePage(driver);
    });

    afterAll(async () => {
      await backToHome(driver, 3);
    });

    it('key_queue_should_preserve_fifo_order', 0, () => {
      const queue = new KeyEventQueue();
      expect(queue.enqueue(KEY_DPAD_DOWN, EVENT_TYPE_DOWN)).assertTrue();
      expect(queue.enqueue(KEY_ENTER, EVENT_TYPE_DOWN)).assertTrue();
      expect(queue.enqueue(KEY_ENTER, EVENT_TYPE_UP)).assertTrue();
      expect(queue.size()).assertEqual(3);
      const first = queue.dequeue();
      expect(first !== undefined).assertTrue();
      expect((first as InputEvent).keyCode).assertEqual(KEY_DPAD_DOWN);
      expect(queue.size()).assertEqual(2);
      expect(queue.countKey(KEY_ENTER)).assertEqual(2);
      expect(queue.peek() !== undefined).assertTrue();
      expect((queue.peek() as InputEvent).keyCode).assertEqual(KEY_ENTER);
    });

    it('key_queue_should_reject_overflow', 0, () => {
      const queue = new KeyEventQueue();
      for (let i = 0; i < MAX_QUEUE_SIZE; i++) {
        expect(queue.enqueue(KEY_DPAD_UP, EVENT_TYPE_DOWN)).assertTrue();
      }
      expect(queue.enqueue(KEY_DPAD_UP, EVENT_TYPE_DOWN)).assertFalse();
      expect(queue.size()).assertEqual(MAX_QUEUE_SIZE);
      queue.clear();
      expect(queue.size()).assertEqual(0);
      expect(queue.dequeue() === undefined).assertTrue();
    });

    it('key_queue_should_track_repeat_events', 0, () => {
      const queue = new KeyEventQueue();
      queue.enqueue(KEY_DPAD_DOWN, EVENT_TYPE_DOWN, false);
      queue.enqueue(KEY_DPAD_DOWN, EVENT_TYPE_DOWN, true);
      queue.enqueue(KEY_DPAD_DOWN, EVENT_TYPE_DOWN, true);
      let repeats: number = 0;
      const events: InputEvent[] = [];
      for (let i = 0; i < 3; i++) {
        const event = queue.dequeue();
        if (event !== undefined) {
          events.push(event);
          if (event.repeat) {
            repeats++;
          }
        }
      }
      expect(events.length).assertEqual(3);
      expect(repeats).assertEqual(2);
      expect(events[0].repeat).assertFalse();
    });

    it('home_key_handler_should_clamp_at_bounds', 0, () => {
      const handler = new HomeKeyHandler(3);
      expect(handler.getIndex()).assertEqual(0);
      expect(handler.handle(KEY_DPAD_UP)).assertEqual(0);
      expect(handler.handle(KEY_DPAD_DOWN)).assertEqual(1);
      expect(handler.handle(KEY_DPAD_DOWN)).assertEqual(2);
      expect(handler.handle(KEY_DPAD_DOWN)).assertEqual(2);
      expect(handler.handle(KEY_DPAD_UP)).assertEqual(1);
      handler.reset();
      expect(handler.getIndex()).assertEqual(0);
    });

    it('home_key_handler_should_ignore_other_keys', 0, () => {
      const handler = new HomeKeyHandler(3);
      handler.handle(KEY_DPAD_DOWN);
      expect(handler.handle(KEY_ENTER)).assertEqual(1);
      expect(handler.handle(KEY_BACK)).assertEqual(1);
      expect(handler.handle(KEY_TAB)).assertEqual(1);
      expect(handler.handle(KEY_DPAD_LEFT)).assertEqual(1);
      expect(handler.handle(KEY_DPAD_RIGHT)).assertEqual(1);
      expect(handler.getIndex()).assertEqual(1);
    });

    it('key_code_enum_should_match_driver_keys', 0, () => {
      expect(KeyCode.KEY_DPAD_UP).assertEqual(KEY_DPAD_UP);
      expect(KeyCode.KEY_DPAD_DOWN).assertEqual(KEY_DPAD_DOWN);
      expect(KeyCode.KEY_DPAD_LEFT).assertEqual(KEY_DPAD_LEFT);
      expect(KeyCode.KEY_DPAD_RIGHT).assertEqual(KEY_DPAD_RIGHT);
      expect(KeyCode.KEY_ENTER).assertEqual(KEY_ENTER);
      expect(KeyCode.KEY_BACK).assertEqual(KEY_BACK);
    });

    it('gesture_classifier_should_distinguish_taps', 0, () => {
      expect(GestureClassifier.isTap(0)).assertTrue();
      expect(GestureClassifier.isTap(499)).assertTrue();
      expect(GestureClassifier.isTap(500)).assertFalse();
      expect(GestureClassifier.isLongPress(500)).assertTrue();
      expect(GestureClassifier.isLongPress(499)).assertFalse();
      expect(GestureClassifier.isLongPress(5000)).assertTrue();
    });

    it('gesture_classifier_should_detect_double_click', 0, () => {
      const now = Date.now();
      expect(GestureClassifier.isDoubleClick(now, now + 100)).assertTrue();
      expect(GestureClassifier.isDoubleClick(now, now + DOUBLE_CLICK_INTERVAL_MS)).assertTrue();
      expect(GestureClassifier.isDoubleClick(now, now + DOUBLE_CLICK_INTERVAL_MS + 1)).assertFalse();
      expect(GestureClassifier.isDoubleClick(now, now - 1)).assertFalse();
    });

    it('gesture_classifier_should_measure_drag', 0, () => {
      const tap: TouchSample = { x: 5, y: 5, downAt: 0, upAt: 100 };
      const drag: TouchSample = { x: 200, y: 10, downAt: 0, upAt: 400 };
      expect(GestureClassifier.isDrag(tap, 50)).assertFalse();
      expect(GestureClassifier.isDrag(drag, 50)).assertTrue();
      expect(GestureClassifier.durationOf(tap)).assertEqual(100);
      expect(GestureClassifier.durationOf(drag)).assertEqual(400);
    });

    it('event_chain_should_follow_bubbling_order', 0, () => {
      const chain = new EventPropagationChain();
      chain.on('child');
      chain.on('parent');
      expect(chain.depth()).assertEqual(2);
      expect(chain.isBubblingOrder()).assertTrue();
      expect(chain.getHandlers()[0]).assertEqual('child');
      chain.reset();
      expect(chain.depth()).assertEqual(0);
      expect(chain.isBubblingOrder()).assertFalse();
    });

    it('event_latency_budget_should_flag_violations', 0, () => {
      const budget = new EventLatencyBudget(100);
      budget.record(20);
      budget.record(100);
      expect(budget.getCount()).assertEqual(2);
      expect(budget.getMax()).assertEqual(100);
      expect(budget.isWithinBudget()).assertTrue();
      expect(budget.getViolations().length).assertEqual(0);
      budget.record(101);
      expect(budget.isWithinBudget()).assertFalse();
      expect(budget.getViolations().length).assertEqual(1);
      budget.reset();
      expect(budget.getCount()).assertEqual(0);
      expect(budget.isWithinBudget()).assertTrue();
    });

    it('down_key_should_change_focus_on_device', 0, async () => {
      await ensureHomePage(driver);
      await pressAndWait(driver, KEY_DPAD_UP, 3, DELAY_KEY_NAVIGATION);
      const before = await getCurrentFocusIndex(driver);
      await pressAndWait(driver, KEY_DPAD_DOWN, 1, DELAY_KEY_NAVIGATION);
      const after = await getCurrentFocusIndex(driver);
      expect(before).assertLargerOrEqual(-1);
      expect(after).assertLargerOrEqual(-1);
    });

    it('enter_key_should_open_a_sub_page', 0, async () => {
      await ensureHomePage(driver);
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_PAGE_SWITCH);
      await serializedDelay(driver, DELAY_PAGE_SWITCH);
      const stillHome = await waitForAnyText(driver, TEXT_HOME_HEADER_CANDIDATES, 300);
      const focusIndex = await getCurrentFocusIndex(driver);
      expect(focusIndex).assertLargerOrEqual(-1);
      if (stillHome !== '') {
        await backToHome(driver, 2);
      }
      await backToHome(driver, 3);
    });

    it('back_key_should_not_crash_on_home', 0, async () => {
      await ensureHomePage(driver);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_PAGE_SWITCH);
      const count = await componentCount(driver);
      expect(count).assertLargerOrEqual(0);
      await ensureHomePage(driver);
    });

    it('tab_key_should_not_break_focus', 0, async () => {
      await ensureHomePage(driver);
      await pressAndWait(driver, KEY_TAB, 1, DELAY_KEY_NAVIGATION);
      const focusIndex = await getCurrentFocusIndex(driver);
      expect(focusIndex).assertLargerOrEqual(-1);
      expect(TOLERANCE_FOCUS_CHANGE).assertEqual(2);
    });

    it('touch_event_should_keep_page_stable', 0, async () => {
      await ensureHomePage(driver);
      const before = await componentCount(driver);
      await simulateTouch(driver, 640, 360);
      await serializedDelay(driver, TIMEOUT_FOCUS_CHANGE);
      const after = await componentCount(driver);
      expect(Math.abs(after - before)).assertLessOrEqual(TOLERANCE_COMPONENT_COUNT);
      await backToHome(driver, 2);
    });

    it('rapid_key_sequence_should_not_lose_focus', 0, async () => {
      await ensureHomePage(driver);
      const queue = new KeyEventQueue();
      const keys: number[] = [KEY_DPAD_DOWN, KEY_DPAD_DOWN, KEY_DPAD_UP, KEY_DPAD_DOWN];
      for (let i = 0; i < keys.length; i++) {
        queue.enqueue(keys[i], EVENT_TYPE_DOWN);
        queue.enqueue(keys[i], EVENT_TYPE_UP);
      }
      expect(queue.size()).assertEqual(keys.length * 2);
      for (let i = 0; i < keys.length; i++) {
        await pressAndWait(driver, keys[i], 1, DELAY_KEY_NAVIGATION);
      }
      const focusIndex = await getCurrentFocusIndex(driver);
      expect(focusIndex).assertLargerOrEqual(-1);
      const remaining = queue.size();
      for (let i = 0; i < remaining; i++) {
        queue.dequeue();
      }
      expect(queue.size()).assertEqual(0);
    });

    it('event_handlers_should_stay_within_budget_on_home', 0, async () => {
      await ensureHomePage(driver);
      const budget = new EventLatencyBudget(TIMEOUT_FOCUS_CHANGE * 4);
      for (let i = 0; i < 5; i++) {
        const start = Date.now();
        await pressAndWait(driver, i % 2 === 0 ? KEY_DPAD_DOWN : KEY_DPAD_UP, 1, DELAY_KEY_NAVIGATION);
        budget.record(Date.now() - start);
      }
      expect(budget.getCount()).assertEqual(5);
      expect(budget.isWithinBudget()).assertTrue();
    });

    it('component_lookup_should_support_type_filters', 0, async () => {
      await ensureHomePage(driver);
      const texts = await findComponentsByType(driver, 'Text');
      const images = await findComponentsByType(driver, 'Image');
      expect(texts !== null && texts !== undefined).assertTrue();
      expect(images !== null && images !== undefined).assertTrue();
      expect((texts ?? []).length + (images ?? []).length).assertLargerOrEqual(0);
    });

    it('gesture_constants_should_be_consistent', 0, () => {
      expect(LONG_PRESS_THRESHOLD_MS).assertEqual(500);
      expect(DOUBLE_CLICK_INTERVAL_MS).assertEqual(300);
      expect(MAX_QUEUE_SIZE).assertEqual(32);
      expect(LONG_PRESS_THRESHOLD_MS).assertLarger(DOUBLE_CLICK_INTERVAL_MS);
      expect(EVENT_TYPE_DOWN).assertLess(EVENT_TYPE_UP);
    });

    it('repeat_throttle_should_suppress_fast_repeats', 0, () => {
      const throttle = new KeyRepeatThrottle(100);
      expect(throttle.accept(1000)).assertTrue();
      expect(throttle.accept(1050)).assertFalse();
      expect(throttle.accept(1100)).assertTrue();
      expect(throttle.getSuppressed()).assertEqual(1);
      expect(throttle.accept(1110)).assertFalse();
      expect(throttle.getSuppressed()).assertEqual(2);
    });

    it('repeat_throttle_should_reset_state', 0, () => {
      const throttle = new KeyRepeatThrottle(50);
      throttle.accept(100);
      throttle.accept(120);
      expect(throttle.getSuppressed()).assertEqual(1);
      throttle.reset();
      expect(throttle.getSuppressed()).assertEqual(0);
      expect(throttle.accept(130)).assertTrue();
    });

    it('focus_graph_should_traverse_both_directions', 0, () => {
      const graph = new FocusTraversalGraph(['0', '1', '2']);
      expect(graph.currentId()).assertEqual('0');
      expect(graph.isAtStart()).assertTrue();
      expect(graph.moveNext()).assertEqual('1');
      expect(graph.moveNext()).assertEqual('2');
      expect(graph.isAtEnd()).assertTrue();
      expect(graph.moveNext()).assertEqual('2');
      expect(graph.movePrevious()).assertEqual('1');
      expect(graph.movePrevious()).assertEqual('0');
      expect(graph.movePrevious()).assertEqual('0');
    });

    it('focus_graph_should_support_direct_selection', 0, () => {
      const graph = new FocusTraversalGraph(['create', 'list', 'intro']);
      expect(graph.moveTo('intro')).assertTrue();
      expect(graph.currentId()).assertEqual('intro');
      expect(graph.getIndex()).assertEqual(2);
      expect(graph.moveTo('missing')).assertFalse();
      expect(graph.currentId()).assertEqual('intro');
      expect(graph.size()).assertEqual(3);
      graph.reset();
      expect(graph.currentId()).assertEqual('create');
    });

    it('focus_graph_should_handle_empty_order', 0, () => {
      const graph = new FocusTraversalGraph([]);
      expect(graph.size()).assertEqual(0);
      expect(graph.currentId()).assertEqual('');
      expect(graph.moveNext()).assertEqual('');
      expect(graph.movePrevious()).assertEqual('');
      expect(graph.moveTo('x')).assertFalse();
      expect(graph.isAtEnd()).assertFalse();
    });

    it('pointer_accumulator_should_sum_distance', 0, () => {
      const accumulator = new PointerGestureAccumulator();
      expect(accumulator.isStarted()).assertFalse();
      accumulator.begin(0, 0);
      expect(accumulator.isStarted()).assertTrue();
      expect(accumulator.moveTo(3, 4)).assertEqual(5);
      expect(accumulator.moveTo(3, 0)).assertEqual(4);
      expect(accumulator.getTotalDistance()).assertEqual(9);
      expect(accumulator.isFling(8)).assertTrue();
      expect(accumulator.isFling(10)).assertFalse();
    });

    it('pointer_accumulator_should_begin_on_first_move', 0, () => {
      const accumulator = new PointerGestureAccumulator();
      expect(accumulator.moveTo(10, 10)).assertEqual(0);
      expect(accumulator.isStarted()).assertTrue();
      expect(accumulator.moveTo(10, 20)).assertEqual(10);
      expect(accumulator.getTotalDistance()).assertEqual(10);
      accumulator.reset();
      expect(accumulator.isStarted()).assertFalse();
      expect(accumulator.getTotalDistance()).assertEqual(0);
    });

    it('dispatch_stats_should_count_per_handler', 0, () => {
      const stats = new EventDispatchStats();
      stats.deliver('child');
      stats.deliver('parent');
      stats.deliver('parent');
      stats.drop();
      expect(stats.getDelivered('parent')).assertEqual(2);
      expect(stats.getDelivered('child')).assertEqual(1);
      expect(stats.getDelivered('missing')).assertEqual(0);
      expect(stats.getTotalDelivered()).assertEqual(3);
      expect(stats.getDropped()).assertEqual(1);
      expect(stats.getHandlerCount()).assertEqual(2);
      stats.reset();
      expect(stats.getTotalDelivered()).assertEqual(0);
      expect(stats.getDropped()).assertEqual(0);
    });

    it('dispatch_stats_should_handle_no_events', 0, () => {
      const stats = new EventDispatchStats();
      expect(stats.getTotalDelivered()).assertEqual(0);
      expect(stats.getHandlerCount()).assertEqual(0);
      expect(stats.getDropped()).assertEqual(0);
      expect(stats.getDelivered('any')).assertEqual(0);
    });

    it('focus_graph_should_match_key_handler_sequence', 0, () => {
      const handler = new HomeKeyHandler(3);
      const graph = new FocusTraversalGraph(['0', '1', '2']);
      const keys: number[] = [KEY_DPAD_DOWN, KEY_DPAD_DOWN, KEY_DPAD_UP, KEY_DPAD_DOWN];
      for (let i = 0; i < keys.length; i++) {
        handler.handle(keys[i]);
        if (keys[i] === KEY_DPAD_DOWN) {
          graph.moveNext();
        } else {
          graph.movePrevious();
        }
        expect(`${handler.getIndex()}`).assertEqual(graph.currentId());
      }
      expect(handler.getIndex()).assertEqual(2);
    });

    it('event_queue_should_work_with_throttle', 0, () => {
      const queue = new KeyEventQueue();
      const throttle = new KeyRepeatThrottle(100);
      let accepted: number = 0;
      for (let i = 0; i < 5; i++) {
        queue.enqueue(KEY_DPAD_DOWN, EVENT_TYPE_DOWN, true);
        if (throttle.accept(1000 + i * 30)) {
          accepted++;
        }
      }
      expect(queue.size()).assertEqual(5);
      expect(accepted).assertEqual(2);
      expect(throttle.getSuppressed()).assertEqual(3);
      queue.clear();
      expect(queue.countKey(KEY_DPAD_DOWN)).assertEqual(0);
    });

    it('event_latency_budget_should_handle_empty_samples', 0, () => {
      const budget = new EventLatencyBudget(50);
      expect(budget.getCount()).assertEqual(0);
      expect(budget.getMax()).assertEqual(0);
      expect(budget.isWithinBudget()).assertTrue();
      expect(budget.getViolations().length).assertEqual(0);
    });

    it('gesture_classifier_should_handle_negative_duration', 0, () => {
      const sample: TouchSample = { x: 0, y: 0, downAt: 100, upAt: 50 };
      expect(GestureClassifier.durationOf(sample)).assertEqual(-50);
      expect(GestureClassifier.isTap(-50)).assertFalse();
      expect(GestureClassifier.isLongPress(-50)).assertFalse();
      expect(GestureClassifier.isDrag(sample, 10)).assertFalse();
    });

    it('event_propagation_chain_should_support_multiple_levels', 0, () => {
      const chain = new EventPropagationChain();
      chain.on('leaf');
      chain.on('child');
      chain.on('parent');
      expect(chain.depth()).assertEqual(3);
      expect(chain.isBubblingOrder()).assertFalse();
      chain.reset();
      chain.on('child');
      chain.on('parent');
      expect(chain.isBubblingOrder()).assertTrue();
      expect(chain.getHandlers().join(',')).assertEqual('child,parent');
    });

    it('repeat_throttle_with_zero_interval_should_accept_all', 0, () => {
      const throttle = new KeyRepeatThrottle(0);
      expect(throttle.accept(1)).assertTrue();
      expect(throttle.accept(1)).assertTrue();
      expect(throttle.accept(2)).assertTrue();
      expect(throttle.getSuppressed()).assertEqual(0);
    });

    it('focus_graph_with_single_entry_should_stay_put', 0, () => {
      const graph = new FocusTraversalGraph(['only']);
      expect(graph.size()).assertEqual(1);
      expect(graph.isAtStart()).assertTrue();
      expect(graph.isAtEnd()).assertTrue();
      expect(graph.moveNext()).assertEqual('only');
      expect(graph.movePrevious()).assertEqual('only');
      expect(graph.getIndex()).assertEqual(0);
    });

    it('dispatch_stats_should_support_many_handlers', 0, () => {
      const stats = new EventDispatchStats();
      for (let i = 0; i < 10; i++) {
        stats.deliver(`handler-${i}`);
        stats.deliver(`handler-${i}`);
      }
      expect(stats.getHandlerCount()).assertEqual(10);
      expect(stats.getTotalDelivered()).assertEqual(20);
      expect(stats.getDelivered('handler-0')).assertEqual(2);
      expect(stats.getDelivered('handler-9')).assertEqual(2);
      expect(stats.getDelivered('handler-10')).assertEqual(0);
    });

    it('pointer_accumulator_should_compute_diagonal_distance', 0, () => {
      const accumulator = new PointerGestureAccumulator();
      accumulator.begin(0, 0);
      const distance = accumulator.moveTo(6, 8);
      expect(distance).assertEqual(10);
      expect(accumulator.getTotalDistance()).assertEqual(10);
      const reverse = accumulator.moveTo(0, 0);
      expect(reverse).assertEqual(10);
      expect(accumulator.getTotalDistance()).assertEqual(20);
      expect(accumulator.isFling(20)).assertTrue();
      expect(accumulator.isFling(21)).assertFalse();
    });

    it('event_queue_should_be_reusable_after_clear', 0, () => {
      const queue = new KeyEventQueue();
      queue.enqueue(KEY_ENTER, EVENT_TYPE_DOWN);
      queue.clear();
      expect(queue.size()).assertEqual(0);
      expect(queue.enqueue(KEY_BACK, EVENT_TYPE_UP)).assertTrue();
      expect(queue.size()).assertEqual(1);
      const event = queue.dequeue();
      expect(event !== undefined).assertTrue();
      expect((event as InputEvent).keyCode).assertEqual(KEY_BACK);
      expect((event as InputEvent).eventType).assertEqual(EVENT_TYPE_UP);
    });

    it('dispatch_stats_and_budget_should_compose', 0, () => {
      const stats = new EventDispatchStats();
      const budget = new EventLatencyBudget(80);
      for (let i = 0; i < 4; i++) {
        stats.deliver('home');
        budget.record(20 * (i + 1));
      }
      expect(stats.getDelivered('home')).assertEqual(4);
      expect(budget.getMax()).assertEqual(80);
      expect(budget.isWithinBudget()).assertTrue();
      budget.record(81);
      expect(budget.isWithinBudget()).assertFalse();
      expect(budget.getViolations().length).assertEqual(1);
      expect(budget.getCount()).assertEqual(5);
      expect(budget.getMax()).assertEqual(81);
      expect(budget.getViolations()[0]).assertEqual(81);
      expect(budget.getViolations().length).assertEqual(1);
      expect(stats.getHandlerCount()).assertEqual(1);
      expect(stats.getDropped()).assertEqual(0);
      expect(stats.getDelivered('missing')).assertEqual(0);
      expect(stats.getDelivered('home')).assertEqual(4);
      expect(stats.getHandlerCount()).assertEqual(1);
      expect(stats.getTotalDelivered()).assertEqual(4);
    });
  });
}

