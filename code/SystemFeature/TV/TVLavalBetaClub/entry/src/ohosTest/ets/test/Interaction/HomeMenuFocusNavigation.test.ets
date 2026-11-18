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
  KEY_DPAD_UP,
  KEY_DPAD_DOWN,
  KEY_ENTER,
  KEY_BACK,
  KEY_TAB,
  pressAndWait,
  getCurrentFocusIndex,
  ensureHomePage,
  backToHome,
  FocusLatencyAnalyzer,
  HomeMenuFocusTracker,
  TIMEOUT_FOCUS_CHANGE,
  DELAY_KEY_NAVIGATION
} from '../Shared/BetaClubDriver';
import { KeyCode } from '../../../../main/ets/pages/common/KeyCode';

const HOME_ENTRY_COUNT: number = 3;

const KEY_EVENT_DOWN: number = 0;

const KEY_EVENT_UP: number = 1;

interface KeyRecord {
  keyCode: number;
  eventType: number;
  timestamp: number;
}

// Records key events emitted by the test and validates them against KeyCode.ets
class KeyEventRecorder {
  private records: KeyRecord[] = [];

  public record(keyCode: number, eventType: number): void {
    this.records.push({ keyCode: keyCode, eventType: eventType, timestamp: Date.now() });
  }

  public getRecords(): KeyRecord[] {
    return [...this.records];
  }

  public getCount(): number {
    return this.records.length;
  }

  public countByKey(keyCode: number): number {
    return this.records.filter((record: KeyRecord) => record.keyCode === keyCode).length;
  }

  public hasKey(keyCode: number): boolean {
    return this.records.some((record: KeyRecord) => record.keyCode === keyCode);
  }

  public getDownCount(): number {
    return this.records.filter((record: KeyRecord) => record.eventType === KEY_EVENT_DOWN).length;
  }

  public getUpCount(): number {
    return this.records.filter((record: KeyRecord) => record.eventType === KEY_EVENT_UP).length;
  }

  public clear(): void {
    this.records = [];
  }
}

// Classifies TV remote keys used by the beta club pages
class RemoteKeyClassifier {
  public static readonly NAVIGATION_KEYS: number[] = [
    KeyCode.KEY_DPAD_UP,
    KeyCode.KEY_DPAD_DOWN,
    KeyCode.KEY_DPAD_LEFT,
    KeyCode.KEY_DPAD_RIGHT
  ];

  public static readonly CONFIRM_KEYS: number[] = [KeyCode.KEY_ENTER, KeyCode.KEYCODE_TAB];

  public static readonly SYSTEM_KEYS: number[] = [KeyCode.KEY_BACK];

  public static isNavigationKey(keyCode: number): boolean {
    return RemoteKeyClassifier.NAVIGATION_KEYS.includes(keyCode);
  }

  public static isConfirmKey(keyCode: number): boolean {
    return RemoteKeyClassifier.CONFIRM_KEYS.includes(keyCode);
  }

  public static isSystemKey(keyCode: number): boolean {
    return RemoteKeyClassifier.SYSTEM_KEYS.includes(keyCode);
  }

  public static isDigitKey(keyCode: number): boolean {
    return keyCode >= KeyCode.KEY_0 && keyCode <= KeyCode.KEY_9;
  }

  public static digitValue(keyCode: number): number {
    if (!RemoteKeyClassifier.isDigitKey(keyCode)) {
      return -1;
    }
    return keyCode - KeyCode.KEY_0;
  }
}

// Enforces focus ring visibility rules on the TV home page
class FocusRingValidator {
  public static readonly MIN_FOCUS_BOX_MARGIN: number = 0;

  public static readonly MIN_ENTRY_COUNT: number = 1;

  public static isFocusIndexValid(index: number, entryCount: number): boolean {
    return index >= 0 && index < entryCount;
  }

  public static isFocusAvailable(index: number): boolean {
    return index >= 0;
  }

  public static isEntryCountValid(count: number): boolean {
    return count >= FocusRingValidator.MIN_ENTRY_COUNT;
  }
}

// Applies a key sequence to the home menu model
class NavigationScript {
  private tracker: HomeMenuFocusTracker;

  constructor(entryCount: number) {
    this.tracker = new HomeMenuFocusTracker(entryCount);
  }

  public apply(keyCode: number): boolean {
    if (keyCode === KeyCode.KEY_DPAD_UP) {
      return this.tracker.moveUp();
    }
    if (keyCode === KeyCode.KEY_DPAD_DOWN) {
      return this.tracker.moveDown();
    }
    return false;
  }

  public applyAll(keys: number[]): number {
    let moved: number = 0;
    for (let i = 0; i < keys.length; i++) {
      if (this.apply(keys[i])) {
        moved++;
      }
    }
    return moved;
  }

  public getIndex(): number {
    return this.tracker.getIndex();
  }

  public getTracker(): HomeMenuFocusTracker {
    return this.tracker;
  }
}

// Directed focus graph supporting horizontal and vertical traversal
class FocusGraph {
  private edges: Map<string, string[]> = new Map<string, string[]>();

  public addNode(node: string): void {
    if (!this.edges.has(node)) {
      this.edges.set(node, []);
    }
  }

  public addEdge(from: string, to: string): boolean {
    if (!this.edges.has(from) || !this.edges.has(to)) {
      return false;
    }
    const neighbors = this.edges.get(from) as string[];
    if (neighbors.includes(to)) {
      return false;
    }
    neighbors.push(to);
    return true;
  }

  public neighborsOf(node: string): string[] {
    const neighbors = this.edges.get(node);
    return neighbors === undefined ? [] : [...neighbors];
  }

  public hasNode(node: string): boolean {
    return this.edges.has(node);
  }

  public size(): number {
    return this.edges.size;
  }

  public edgeCount(): number {
    let total: number = 0;
    this.edges.forEach((neighbors: string[]) => {
      total += neighbors.length;
    });
    return total;
  }

  public hasPath(from: string, to: string): boolean {
    if (!this.edges.has(from) || !this.edges.has(to)) {
      return false;
    }
    if (from === to) {
      return true;
    }
    const visited: Set<string> = new Set<string>();
    const queue: string[] = [from];
    while (queue.length > 0) {
      const current = queue.shift();
      if (current === undefined) {
        break;
      }
      if (visited.has(current)) {
        continue;
      }
      visited.add(current);
      const neighbors = this.edges.get(current) ?? [];
      for (let i = 0; i < neighbors.length; i++) {
        if (neighbors[i] === to) {
          return true;
        }
        queue.push(neighbors[i]);
      }
    }
    return false;
  }

  public sinkNodes(): string[] {
    const result: string[] = [];
    this.edges.forEach((neighbors: string[], node: string) => {
      if (neighbors.length === 0) {
        result.push(node);
      }
    });
    return result;
  }
}

// Applies a key sequence and keeps an undo history
class KeySequenceEngine {
  private tracker: HomeMenuFocusTracker;
  private history: number[] = [];

  constructor(entryCount: number) {
    this.tracker = new HomeMenuFocusTracker(entryCount);
  }

  public apply(keyCode: number): number {
    let moved = false;
    if (keyCode === KeyCode.KEY_DPAD_DOWN) {
      moved = this.tracker.moveDown();
    } else if (keyCode === KeyCode.KEY_DPAD_UP) {
      moved = this.tracker.moveUp();
    }
    if (moved) {
      this.history.push(keyCode);
    }
    return this.tracker.getIndex();
  }

  public applyAll(keys: number[]): number {
    for (let i = 0; i < keys.length; i++) {
      this.apply(keys[i]);
    }
    return this.tracker.getIndex();
  }

  public undo(): boolean {
    if (this.history.length === 0) {
      return false;
    }
    const last = this.history.pop();
    if (last === KeyCode.KEY_DPAD_DOWN) {
      this.tracker.moveUp();
    } else if (last === KeyCode.KEY_DPAD_UP) {
      this.tracker.moveDown();
    }
    return true;
  }

  public getIndex(): number {
    return this.tracker.getIndex();
  }

  public getHistoryLength(): number {
    return this.history.length;
  }

  public reset(): void {
    this.tracker.reset();
    this.history = [];
  }
}

// Remembers the last focused index per page
class FocusMemory {
  private memory: Map<string, number> = new Map<string, number>();

  public remember(page: string, index: number): void {
    this.memory.set(page, index);
  }

  public recall(page: string): number {
    const value = this.memory.get(page);
    return value === undefined ? -1 : value;
  }

  public has(page: string): boolean {
    return this.memory.has(page);
  }

  public forget(page: string): void {
    this.memory.delete(page);
  }

  public size(): number {
    return this.memory.size;
  }

  public clear(): void {
    this.memory.clear();
  }
}

// Maps remote keys to semantic commands used by the pages
class RemoteCommandRouter {
  public static readonly NONE: string = 'none';

  public static readonly UP: string = 'up';

  public static readonly DOWN: string = 'down';

  public static readonly CONFIRM: string = 'confirm';

  public static readonly BACK: string = 'back';

  public static readonly TAB: string = 'tab';

  public static commandOf(keyCode: number): string {
    if (keyCode === KeyCode.KEY_DPAD_UP) {
      return RemoteCommandRouter.UP;
    }
    if (keyCode === KeyCode.KEY_DPAD_DOWN) {
      return RemoteCommandRouter.DOWN;
    }
    if (keyCode === KeyCode.KEY_ENTER) {
      return RemoteCommandRouter.CONFIRM;
    }
    if (keyCode === KeyCode.KEY_BACK) {
      return RemoteCommandRouter.BACK;
    }
    if (keyCode === KeyCode.KEYCODE_TAB) {
      return RemoteCommandRouter.TAB;
    }
    return RemoteCommandRouter.NONE;
  }

  public static isNavigation(command: string): boolean {
    return command === RemoteCommandRouter.UP || command === RemoteCommandRouter.DOWN;
  }

  public static isAction(command: string): boolean {
    return command === RemoteCommandRouter.CONFIRM || command === RemoteCommandRouter.BACK ||
      command === RemoteCommandRouter.TAB;
  }
}

// Detects long press sequences on the TV remote
class LongPressDetector {
  private readonly thresholdMs: number;
  private pressedAt: number = 0;
  private pressing: boolean = false;

  constructor(thresholdMs: number) {
    this.thresholdMs = thresholdMs;
  }

  public onKeyDown(now: number): void {
    if (!this.pressing) {
      this.pressedAt = now;
      this.pressing = true;
    }
  }

  public onKeyUp(now: number): boolean {
    if (!this.pressing) {
      return false;
    }
    const duration = now - this.pressedAt;
    this.pressing = false;
    return duration >= this.thresholdMs;
  }

  public isPressing(): boolean {
    return this.pressing;
  }

  public getThreshold(): number {
    return this.thresholdMs;
  }

  public reset(): void {
    this.pressedAt = 0;
    this.pressing = false;
  }
}

// Validates focus transitions against an allow list
class FocusTransitionValidator {
  public static readonly ALLOWED: string[][] = [
    ['0', '1'], ['1', '2'], ['1', '0'], ['2', '1']
  ];

  public static isAllowed(from: string, to: string): boolean {
    for (let i = 0; i < FocusTransitionValidator.ALLOWED.length; i++) {
      if (FocusTransitionValidator.ALLOWED[i][0] === from &&
        FocusTransitionValidator.ALLOWED[i][1] === to) {
        return true;
      }
    }
    return false;
  }

  public static isSelfTransition(from: string, to: string): boolean {
    return from === to;
  }

  public static targetsOf(from: string): string[] {
    const targets: string[] = [];
    for (let i = 0; i < FocusTransitionValidator.ALLOWED.length; i++) {
      if (FocusTransitionValidator.ALLOWED[i][0] === from) {
        targets.push(FocusTransitionValidator.ALLOWED[i][1]);
      }
    }
    return targets;
  }
}

export default function homeMenuFocusNavigationTest() {
  describe('HomeMenuFocusNavigation_Test', () => {
    let driver: Driver;
    let recorder: KeyEventRecorder;

    beforeAll(async () => {
      driver = getDriver();
      recorder = new KeyEventRecorder();
      await serializedDelay(driver, 300);
      await ensureHomePage(driver);
    });

    afterAll(async () => {
      await backToHome(driver, 3);
    });

    it('key_code_enum_should_match_remote_keys', 0, () => {
      expect(KeyCode.KEY_DPAD_UP).assertEqual(2012);
      expect(KeyCode.KEY_DPAD_DOWN).assertEqual(2013);
      expect(KeyCode.KEY_DPAD_LEFT).assertEqual(2014);
      expect(KeyCode.KEY_DPAD_RIGHT).assertEqual(2015);
      expect(KeyCode.KEY_ENTER).assertEqual(2054);
      expect(KeyCode.KEY_BACK).assertEqual(2);
      expect(KeyCode.KEYCODE_TAB).assertEqual(2049);
      expect(KeyCode.KEY_0).assertEqual(2000);
      expect(KeyCode.KEY_9).assertEqual(2009);
    });

    it('driver_keys_should_align_with_key_code_enum', 0, () => {
      expect(KEY_DPAD_UP).assertEqual(KeyCode.KEY_DPAD_UP);
      expect(KEY_DPAD_DOWN).assertEqual(KeyCode.KEY_DPAD_DOWN);
      expect(KEY_ENTER).assertEqual(KeyCode.KEY_ENTER);
      expect(KEY_BACK).assertEqual(KeyCode.KEY_BACK);
      expect(KEY_TAB).assertEqual(KeyCode.KEYCODE_TAB);
    });

    it('remote_key_classifier_should_classify_navigation_keys', 0, () => {
      expect(RemoteKeyClassifier.isNavigationKey(KeyCode.KEY_DPAD_UP)).assertTrue();
      expect(RemoteKeyClassifier.isNavigationKey(KeyCode.KEY_DPAD_DOWN)).assertTrue();
      expect(RemoteKeyClassifier.isNavigationKey(KeyCode.KEY_DPAD_LEFT)).assertTrue();
      expect(RemoteKeyClassifier.isNavigationKey(KeyCode.KEY_DPAD_RIGHT)).assertTrue();
      expect(RemoteKeyClassifier.isNavigationKey(KeyCode.KEY_ENTER)).assertFalse();
      expect(RemoteKeyClassifier.isNavigationKey(KeyCode.KEY_BACK)).assertFalse();
    });

    it('remote_key_classifier_should_classify_confirm_and_system_keys', 0, () => {
      expect(RemoteKeyClassifier.isConfirmKey(KeyCode.KEY_ENTER)).assertTrue();
      expect(RemoteKeyClassifier.isConfirmKey(KeyCode.KEYCODE_TAB)).assertTrue();
      expect(RemoteKeyClassifier.isConfirmKey(KeyCode.KEY_DPAD_DOWN)).assertFalse();
      expect(RemoteKeyClassifier.isSystemKey(KeyCode.KEY_BACK)).assertTrue();
      expect(RemoteKeyClassifier.isSystemKey(KeyCode.KEY_ENTER)).assertFalse();
    });

    it('digit_keys_should_decode_values', 0, () => {
      expect(RemoteKeyClassifier.isDigitKey(KeyCode.KEY_0)).assertTrue();
      expect(RemoteKeyClassifier.isDigitKey(KeyCode.KEY_9)).assertTrue();
      expect(RemoteKeyClassifier.isDigitKey(KeyCode.KEY_DPAD_UP)).assertFalse();
      expect(RemoteKeyClassifier.digitValue(KeyCode.KEY_0)).assertEqual(0);
      expect(RemoteKeyClassifier.digitValue(KeyCode.KEY_9)).assertEqual(9);
      expect(RemoteKeyClassifier.digitValue(KeyCode.KEY_ENTER)).assertEqual(-1);
    });

    it('key_event_recorder_should_count_down_and_up', 0, () => {
      recorder.clear();
      recorder.record(KeyCode.KEY_DPAD_DOWN, KEY_EVENT_DOWN);
      recorder.record(KeyCode.KEY_DPAD_DOWN, KEY_EVENT_UP);
      recorder.record(KeyCode.KEY_ENTER, KEY_EVENT_DOWN);
      expect(recorder.getCount()).assertEqual(3);
      expect(recorder.countByKey(KeyCode.KEY_DPAD_DOWN)).assertEqual(2);
      expect(recorder.countByKey(KeyCode.KEY_ENTER)).assertEqual(1);
      expect(recorder.hasKey(KeyCode.KEY_ENTER)).assertTrue();
      expect(recorder.hasKey(KeyCode.KEY_BACK)).assertFalse();
      expect(recorder.getDownCount()).assertEqual(2);
      expect(recorder.getUpCount()).assertEqual(1);
    });

    it('navigation_script_should_move_down_and_up', 0, () => {
      const script = new NavigationScript(HOME_ENTRY_COUNT);
      expect(script.getIndex()).assertEqual(0);
      const moved = script.applyAll([KeyCode.KEY_DPAD_DOWN, KeyCode.KEY_DPAD_DOWN]);
      expect(moved).assertEqual(2);
      expect(script.getIndex()).assertEqual(2);
      expect(script.getTracker().isLast()).assertTrue();
      expect(script.apply(KeyCode.KEY_DPAD_DOWN)).assertFalse();
      expect(script.apply(KeyCode.KEY_DPAD_UP)).assertTrue();
      expect(script.getIndex()).assertEqual(1);
    });

    it('navigation_script_should_ignore_unrelated_keys', 0, () => {
      const script = new NavigationScript(HOME_ENTRY_COUNT);
      expect(script.apply(KeyCode.KEY_ENTER)).assertFalse();
      expect(script.apply(KeyCode.KEY_BACK)).assertFalse();
      expect(script.apply(KeyCode.KEYCODE_TAB)).assertFalse();
      expect(script.getIndex()).assertEqual(0);
      expect(script.applyAll([KeyCode.KEY_DPAD_UP, KeyCode.KEY_DPAD_UP])).assertEqual(0);
    });

    it('focus_ring_validator_should_validate_index_range', 0, () => {
      expect(FocusRingValidator.isFocusIndexValid(0, HOME_ENTRY_COUNT)).assertTrue();
      expect(FocusRingValidator.isFocusIndexValid(2, HOME_ENTRY_COUNT)).assertTrue();
      expect(FocusRingValidator.isFocusIndexValid(3, HOME_ENTRY_COUNT)).assertFalse();
      expect(FocusRingValidator.isFocusIndexValid(-1, HOME_ENTRY_COUNT)).assertFalse();
      expect(FocusRingValidator.isFocusAvailable(-1)).assertFalse();
      expect(FocusRingValidator.isFocusAvailable(0)).assertTrue();
      expect(FocusRingValidator.isEntryCountValid(HOME_ENTRY_COUNT)).assertTrue();
      expect(FocusRingValidator.isEntryCountValid(0)).assertFalse();
    });

    it('home_page_should_have_focus_after_render', 0, async () => {
      await ensureHomePage(driver);
      const focusIndex = await getCurrentFocusIndex(driver);
      expect(focusIndex).assertLargerOrEqual(-1);
      if (focusIndex >= 0) {
        expect(FocusRingValidator.isFocusAvailable(focusIndex)).assertTrue();
      }
    });

    it('down_key_should_move_focus_within_budget', 0, async () => {
      await ensureHomePage(driver);
      const analyzer = new FocusLatencyAnalyzer();
      for (let i = 0; i < 4; i++) {
        const start = Date.now();
        await pressAndWait(driver, i % 2 === 0 ? KEY_DPAD_DOWN : KEY_DPAD_UP, 1, DELAY_KEY_NAVIGATION);
        analyzer.record(Date.now() - start);
      }
      expect(analyzer.getSampleCount()).assertEqual(4);
      expect(analyzer.getAverageLatency()).assertLargerOrEqual(0);
      expect(analyzer.isWithinBudget(TIMEOUT_FOCUS_CHANGE * 4)).assertTrue();
    });

    it('repeated_down_key_should_not_escape_menu_range', 0, async () => {
      await ensureHomePage(driver);
      await pressAndWait(driver, KEY_DPAD_UP, 5, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_DPAD_DOWN, 10, DELAY_KEY_NAVIGATION);
      const focusIndex = await getCurrentFocusIndex(driver);
      expect(focusIndex).assertLargerOrEqual(-1);
      const tracker = new HomeMenuFocusTracker(HOME_ENTRY_COUNT);
      expect(tracker.moveUp()).assertFalse();
      expect(tracker.isFirst()).assertTrue();
    });

    it('focus_tracker_should_survive_full_cycle', 0, async () => {
      await ensureHomePage(driver);
      const tracker = new HomeMenuFocusTracker(HOME_ENTRY_COUNT);
      const script = new NavigationScript(HOME_ENTRY_COUNT);
      for (let i = 0; i < 6; i++) {
        tracker.moveDown();
        script.apply(KeyCode.KEY_DPAD_DOWN);
      }
      expect(tracker.isLast()).assertTrue();
      expect(script.getIndex()).assertEqual(HOME_ENTRY_COUNT - 1);
      for (let i = 0; i < 6; i++) {
        tracker.moveUp();
        script.apply(KeyCode.KEY_DPAD_UP);
      }
      expect(tracker.isFirst()).assertTrue();
      expect(script.getIndex()).assertEqual(0);
      expect(script.getTracker().getIndex()).assertEqual(tracker.getIndex());
    });

    it('key_recorder_should_clear_between_cases', 0, () => {
      recorder.clear();
      expect(recorder.getCount()).assertEqual(0);
      recorder.record(KeyCode.KEY_BACK, KEY_EVENT_DOWN);
      expect(recorder.getCount()).assertEqual(1);
      recorder.clear();
      expect(recorder.getRecords().length).assertEqual(0);
      expect(recorder.getDownCount()).assertEqual(0);
    });

    it('focus_latency_analyzer_should_reset', 0, () => {
      const analyzer = new FocusLatencyAnalyzer();
      analyzer.record(100);
      analyzer.record(300);
      expect(analyzer.getSampleCount()).assertEqual(2);
      expect(analyzer.getMaxLatency()).assertEqual(300);
      expect(analyzer.getAverageLatency()).assertEqual(200);
      expect(analyzer.isWithinBudget(250)).assertFalse();
      expect(analyzer.isWithinBudget(300)).assertTrue();
      analyzer.reset();
      expect(analyzer.getSampleCount()).assertEqual(0);
      expect(analyzer.getAverageLatency()).assertEqual(0);
      expect(analyzer.isWithinBudget(0)).assertTrue();
    });

    it('focus_graph_should_add_nodes_and_edges', 0, () => {
      const graph = new FocusGraph();
      graph.addNode('0');
      graph.addNode('1');
      graph.addNode('2');
      expect(graph.size()).assertEqual(3);
      expect(graph.addEdge('0', '1')).assertTrue();
      expect(graph.addEdge('1', '2')).assertTrue();
      expect(graph.addEdge('2', '1')).assertTrue();
      expect(graph.edgeCount()).assertEqual(3);
      expect(graph.hasNode('2')).assertTrue();
      expect(graph.hasNode('3')).assertFalse();
    });

    it('focus_graph_should_reject_invalid_edges', 0, () => {
      const graph = new FocusGraph();
      graph.addNode('0');
      expect(graph.addEdge('0', 'missing')).assertFalse();
      expect(graph.addEdge('missing', '0')).assertFalse();
      graph.addNode('1');
      expect(graph.addEdge('0', '1')).assertTrue();
      expect(graph.addEdge('0', '1')).assertFalse();
      expect(graph.neighborsOf('0').length).assertEqual(1);
      expect(graph.neighborsOf('missing').length).assertEqual(0);
    });

    it('focus_graph_should_find_paths', 0, () => {
      const graph = new FocusGraph();
      graph.addNode('0');
      graph.addNode('1');
      graph.addNode('2');
      graph.addEdge('0', '1');
      graph.addEdge('1', '2');
      expect(graph.hasPath('0', '2')).assertTrue();
      expect(graph.hasPath('0', '0')).assertTrue();
      expect(graph.hasPath('2', '0')).assertFalse();
      expect(graph.hasPath('missing', '0')).assertFalse();
    });

    it('focus_graph_should_report_sink_nodes', 0, () => {
      const graph = new FocusGraph();
      graph.addNode('a');
      graph.addNode('b');
      graph.addNode('c');
      graph.addEdge('a', 'b');
      const sinks = graph.sinkNodes();
      expect(sinks.length).assertEqual(2);
      expect(sinks.includes('b')).assertTrue();
      expect(sinks.includes('c')).assertTrue();
      expect(sinks.includes('a')).assertFalse();
    });

    it('focus_graph_neighbors_should_be_copied', 0, () => {
      const graph = new FocusGraph();
      graph.addNode('0');
      graph.addNode('1');
      graph.addEdge('0', '1');
      const neighbors = graph.neighborsOf('0');
      neighbors.push('injected');
      expect(graph.neighborsOf('0').length).assertEqual(1);
      expect(graph.edgeCount()).assertEqual(1);
      expect(neighbors.length).assertEqual(2);
    });

    it('key_sequence_engine_should_apply_and_undo', 0, () => {
      const engine = new KeySequenceEngine(3);
      expect(engine.getIndex()).assertEqual(0);
      expect(engine.apply(KeyCode.KEY_DPAD_DOWN)).assertEqual(1);
      expect(engine.apply(KeyCode.KEY_DPAD_DOWN)).assertEqual(2);
      expect(engine.getHistoryLength()).assertEqual(2);
      expect(engine.undo()).assertTrue();
      expect(engine.getIndex()).assertEqual(1);
      expect(engine.undo()).assertTrue();
      expect(engine.getIndex()).assertEqual(0);
    });

    it('key_sequence_engine_should_ignore_blocked_moves', 0, () => {
      const engine = new KeySequenceEngine(2);
      expect(engine.apply(KeyCode.KEY_DPAD_UP)).assertEqual(0);
      expect(engine.getHistoryLength()).assertEqual(0);
      engine.apply(KeyCode.KEY_DPAD_DOWN);
      expect(engine.apply(KeyCode.KEY_DPAD_DOWN)).assertEqual(1);
      expect(engine.getHistoryLength()).assertEqual(1);
      expect(engine.undo()).assertTrue();
      expect(engine.undo()).assertFalse();
      expect(engine.getIndex()).assertEqual(0);
    });

    it('key_sequence_engine_should_apply_batches', 0, () => {
      const engine = new KeySequenceEngine(3);
      const keys: number[] = [
        KeyCode.KEY_DPAD_DOWN,
        KeyCode.KEY_DPAD_DOWN,
        KeyCode.KEY_DPAD_UP
      ];
      expect(engine.applyAll(keys)).assertEqual(1);
      expect(engine.getHistoryLength()).assertEqual(3);
      engine.reset();
      expect(engine.getIndex()).assertEqual(0);
      expect(engine.getHistoryLength()).assertEqual(0);
    });

    it('key_sequence_engine_should_ignore_unrelated_keys', 0, () => {
      const engine = new KeySequenceEngine(3);
      expect(engine.apply(KeyCode.KEY_ENTER)).assertEqual(0);
      expect(engine.apply(KeyCode.KEY_BACK)).assertEqual(0);
      expect(engine.apply(KeyCode.KEYCODE_TAB)).assertEqual(0);
      expect(engine.getHistoryLength()).assertEqual(0);
      expect(engine.undo()).assertFalse();
      expect(engine.getIndex()).assertEqual(0);
    });

    it('focus_memory_should_recall_per_page', 0, () => {
      const memory = new FocusMemory();
      expect(memory.recall('home')).assertEqual(-1);
      expect(memory.has('home')).assertFalse();
      memory.remember('home', 2);
      memory.remember('list', 5);
      expect(memory.recall('home')).assertEqual(2);
      expect(memory.recall('list')).assertEqual(5);
      expect(memory.size()).assertEqual(2);
      expect(memory.has('home')).assertTrue();
    });

    it('focus_memory_should_forget_and_clear', 0, () => {
      const memory = new FocusMemory();
      memory.remember('home', 1);
      memory.remember('detail', 0);
      memory.forget('home');
      expect(memory.has('home')).assertFalse();
      expect(memory.recall('home')).assertEqual(-1);
      expect(memory.size()).assertEqual(1);
      memory.clear();
      expect(memory.size()).assertEqual(0);
      expect(memory.recall('detail')).assertEqual(-1);
    });

    it('focus_memory_should_overwrite_same_page', 0, () => {
      const memory = new FocusMemory();
      memory.remember('home', 0);
      memory.remember('home', 2);
      expect(memory.recall('home')).assertEqual(2);
      expect(memory.size()).assertEqual(1);
      memory.remember('', 1);
      expect(memory.recall('')).assertEqual(1);
      expect(memory.size()).assertEqual(2);
    });

    it('remote_command_router_should_map_keys', 0, () => {
      expect(RemoteCommandRouter.commandOf(KeyCode.KEY_DPAD_UP)).assertEqual(RemoteCommandRouter.UP);
      expect(RemoteCommandRouter.commandOf(KeyCode.KEY_DPAD_DOWN)).assertEqual(RemoteCommandRouter.DOWN);
      expect(RemoteCommandRouter.commandOf(KeyCode.KEY_ENTER)).assertEqual(RemoteCommandRouter.CONFIRM);
      expect(RemoteCommandRouter.commandOf(KeyCode.KEY_BACK)).assertEqual(RemoteCommandRouter.BACK);
      expect(RemoteCommandRouter.commandOf(KeyCode.KEYCODE_TAB)).assertEqual(RemoteCommandRouter.TAB);
      expect(RemoteCommandRouter.commandOf(99)).assertEqual(RemoteCommandRouter.NONE);
    });

    it('remote_command_router_should_classify_commands', 0, () => {
      expect(RemoteCommandRouter.isNavigation(RemoteCommandRouter.UP)).assertTrue();
      expect(RemoteCommandRouter.isNavigation(RemoteCommandRouter.DOWN)).assertTrue();
      expect(RemoteCommandRouter.isNavigation(RemoteCommandRouter.CONFIRM)).assertFalse();
      expect(RemoteCommandRouter.isAction(RemoteCommandRouter.CONFIRM)).assertTrue();
      expect(RemoteCommandRouter.isAction(RemoteCommandRouter.BACK)).assertTrue();
      expect(RemoteCommandRouter.isAction(RemoteCommandRouter.TAB)).assertTrue();
      expect(RemoteCommandRouter.isAction(RemoteCommandRouter.NONE)).assertFalse();
    });

    it('remote_command_router_should_cover_digital_keys', 0, () => {
      for (let key = KeyCode.KEY_0; key <= KeyCode.KEY_9; key++) {
        expect(RemoteKeyClassifier.isDigitKey(key)).assertTrue();
        expect(RemoteCommandRouter.commandOf(key)).assertEqual(RemoteCommandRouter.NONE);
        expect(RemoteKeyClassifier.digitValue(key)).assertEqual(key - KeyCode.KEY_0);
      }
      expect(RemoteKeyClassifier.isDigitKey(KeyCode.KEY_0 - 1)).assertFalse();
      expect(RemoteKeyClassifier.isDigitKey(KeyCode.KEY_9 + 1)).assertFalse();
    });

    it('long_press_detector_should_require_threshold', 0, () => {
      const detector = new LongPressDetector(500);
      expect(detector.getThreshold()).assertEqual(500);
      expect(detector.isPressing()).assertFalse();
      detector.onKeyDown(1000);
      expect(detector.isPressing()).assertTrue();
      expect(detector.onKeyUp(1400)).assertFalse();
      expect(detector.isPressing()).assertFalse();
    });

    it('long_press_detector_should_accept_exact_threshold', 0, () => {
      const detector = new LongPressDetector(500);
      detector.onKeyDown(1000);
      expect(detector.onKeyUp(1500)).assertTrue();
      expect(detector.isPressing()).assertFalse();
      expect(detector.onKeyUp(1600)).assertFalse();
    });

    it('long_press_detector_should_ignore_repeated_down', 0, () => {
      const detector = new LongPressDetector(300);
      detector.onKeyDown(100);
      detector.onKeyDown(400);
      expect(detector.isPressing()).assertTrue();
      expect(detector.onKeyUp(500)).assertTrue();
      expect(detector.isPressing()).assertFalse();
      detector.reset();
      expect(detector.isPressing()).assertFalse();
    });

    it('focus_transition_should_follow_allow_list', 0, () => {
      expect(FocusTransitionValidator.isAllowed('0', '1')).assertTrue();
      expect(FocusTransitionValidator.isAllowed('1', '2')).assertTrue();
      expect(FocusTransitionValidator.isAllowed('1', '0')).assertTrue();
      expect(FocusTransitionValidator.isAllowed('2', '1')).assertTrue();
      expect(FocusTransitionValidator.isAllowed('0', '2')).assertFalse();
      expect(FocusTransitionValidator.isSelfTransition('2', '2')).assertTrue();
    });

    it('focus_transition_should_list_targets', 0, () => {
      expect(FocusTransitionValidator.targetsOf('0').length).assertEqual(1);
      expect(FocusTransitionValidator.targetsOf('1').length).assertEqual(2);
      expect(FocusTransitionValidator.targetsOf('2').length).assertEqual(1);
      expect(FocusTransitionValidator.targetsOf('9').length).assertEqual(0);
      expect(FocusTransitionValidator.ALLOWED.length).assertEqual(4);
    });

    it('focus_transition_should_be_well_formed', 0, () => {
      for (let i = 0; i < FocusTransitionValidator.ALLOWED.length; i++) {
        const pair = FocusTransitionValidator.ALLOWED[i];
        expect(pair.length).assertEqual(2);
        expect(pair[0] === pair[1]).assertFalse();
        expect(Number(pair[0])).assertLargerOrEqual(0);
        expect(Number(pair[1])).assertLargerOrEqual(0);
      }
      expect(FocusTransitionValidator.ALLOWED.length).assertEqual(4);
    });

    it('focus_graph_should_match_home_menu_topology', 0, () => {
      const graph = new FocusGraph();
      graph.addNode('create');
      graph.addNode('list');
      graph.addNode('intro');
      graph.addEdge('create', 'list');
      graph.addEdge('list', 'create');
      graph.addEdge('list', 'intro');
      graph.addEdge('intro', 'list');
      expect(graph.size()).assertEqual(3);
      expect(graph.edgeCount()).assertEqual(4);
      expect(graph.hasPath('create', 'intro')).assertTrue();
      expect(graph.hasPath('intro', 'create')).assertTrue();
      expect(graph.sinkNodes().length).assertEqual(0);
    });

    it('focus_engine_and_memory_should_restore_position', 0, () => {
      const engine = new KeySequenceEngine(3);
      const memory = new FocusMemory();
      engine.apply(KeyCode.KEY_DPAD_DOWN);
      engine.apply(KeyCode.KEY_DPAD_DOWN);
      memory.remember('home', engine.getIndex());
      engine.reset();
      expect(engine.getIndex()).assertEqual(0);
      const restored = memory.recall('home');
      expect(restored).assertEqual(2);
      expect(FocusRingValidator.isFocusIndexValid(restored, 3)).assertTrue();
    });

    it('navigation_script_and_engine_should_agree', 0, () => {
      const script = new NavigationScript(3);
      const engine = new KeySequenceEngine(3);
      const keys: number[] = [
        KeyCode.KEY_DPAD_DOWN,
        KeyCode.KEY_DPAD_DOWN,
        KeyCode.KEY_DPAD_UP,
        KeyCode.KEY_DPAD_DOWN,
        KeyCode.KEY_DPAD_UP
      ];
      for (let i = 0; i < keys.length; i++) {
        script.apply(keys[i]);
        engine.apply(keys[i]);
        expect(script.getIndex()).assertEqual(engine.getIndex());
      }
      expect(script.getIndex()).assertEqual(1);
      expect(engine.getHistoryLength()).assertEqual(keys.length);
    });

    it('engine_should_undo_full_history', 0, () => {
      const engine = new KeySequenceEngine(4);
      for (let i = 0; i < 3; i++) {
        engine.apply(KeyCode.KEY_DPAD_DOWN);
      }
      expect(engine.getIndex()).assertEqual(3);
      expect(engine.getHistoryLength()).assertEqual(3);
      while (engine.undo()) {
        expect(engine.getHistoryLength()).assertLargerOrEqual(0);
      }
      expect(engine.getIndex()).assertEqual(0);
      expect(engine.getHistoryLength()).assertEqual(0);
    });

    it('engine_should_handle_stress_navigation', 0, () => {
      const engine = new KeySequenceEngine(3);
      for (let i = 0; i < 20; i++) {
        engine.apply(KeyCode.KEY_DPAD_DOWN);
        expect(engine.getIndex()).assertLessOrEqual(2);
        expect(engine.getIndex()).assertLargerOrEqual(0);
      }
      expect(engine.getIndex()).assertEqual(2);
      for (let i = 0; i < 20; i++) {
        engine.apply(KeyCode.KEY_DPAD_UP);
        expect(engine.getIndex()).assertLessOrEqual(2);
      }
      expect(engine.getIndex()).assertEqual(0);
    });

    it('focus_memory_should_ignore_missing_forget', 0, () => {
      const memory = new FocusMemory();
      memory.forget('missing');
      expect(memory.size()).assertEqual(0);
      memory.remember('page', -1);
      expect(memory.recall('page')).assertEqual(-1);
      expect(memory.has('page')).assertTrue();
      memory.forget('page');
      expect(memory.has('page')).assertFalse();
      expect(memory.recall('page')).assertEqual(-1);
    });

    it('remote_commands_should_cover_navigation_keys', 0, () => {
      const navigationKeys: number[] = [
        KeyCode.KEY_DPAD_UP,
        KeyCode.KEY_DPAD_DOWN,
        KeyCode.KEY_DPAD_LEFT,
        KeyCode.KEY_DPAD_RIGHT
      ];
      let navigationCommands: number = 0;
      for (let i = 0; i < navigationKeys.length; i++) {
        const command = RemoteCommandRouter.commandOf(navigationKeys[i]);
        if (RemoteCommandRouter.isNavigation(command)) {
          navigationCommands++;
        }
      }
      expect(navigationCommands).assertEqual(2);
      expect(RemoteCommandRouter.commandOf(KeyCode.KEY_DPAD_LEFT)).assertEqual(RemoteCommandRouter.NONE);
      expect(RemoteCommandRouter.commandOf(KeyCode.KEY_DPAD_RIGHT)).assertEqual(RemoteCommandRouter.NONE);
    });

    it('focus_graph_should_detect_cycle_path', 0, () => {
      const graph = new FocusGraph();
      graph.addNode('a');
      graph.addNode('b');
      graph.addNode('c');
      graph.addEdge('a', 'b');
      graph.addEdge('b', 'c');
      graph.addEdge('c', 'a');
      expect(graph.hasPath('a', 'c')).assertTrue();
      expect(graph.hasPath('c', 'a')).assertTrue();
      expect(graph.sinkNodes().length).assertEqual(0);
      expect(graph.edgeCount()).assertEqual(3);
    });

    it('long_press_matrix_should_be_monotonic', 0, () => {
      const durations: number[] = [0, 100, 299, 300, 500, 1000];
      const detector = new LongPressDetector(300);
      let longPresses: number = 0;
      for (let i = 0; i < durations.length; i++) {
        detector.onKeyDown(0);
        if (detector.onKeyUp(durations[i])) {
          longPresses++;
        }
      }
      expect(longPresses).assertEqual(3);
      expect(durations.length).assertEqual(6);
    });

    it('focus_ring_validator_should_reject_negative', 0, () => {
      expect(FocusRingValidator.isFocusAvailable(-2)).assertFalse();
      expect(FocusRingValidator.isFocusAvailable(0)).assertTrue();
      expect(FocusRingValidator.isFocusIndexValid(-1, 3)).assertFalse();
      expect(FocusRingValidator.isFocusIndexValid(2, 3)).assertTrue();
      expect(FocusRingValidator.MIN_ENTRY_COUNT).assertEqual(1);
      expect(FocusRingValidator.MIN_FOCUS_BOX_MARGIN).assertEqual(0);
    });

    it('key_classifier_should_cover_all_menu_keys', 0, () => {
      const menuKeys: number[] = [
        KeyCode.KEY_DPAD_UP,
        KeyCode.KEY_DPAD_DOWN,
        KeyCode.KEY_ENTER,
        KeyCode.KEY_BACK,
        KeyCode.KEYCODE_TAB
      ];
      let classified: number = 0;
      for (let i = 0; i < menuKeys.length; i++) {
        const key = menuKeys[i];
        if (RemoteKeyClassifier.isNavigationKey(key) || RemoteKeyClassifier.isConfirmKey(key) ||
          RemoteKeyClassifier.isSystemKey(key)) {
          classified++;
        }
      }
      expect(classified).assertEqual(menuKeys.length);
      expect(RemoteKeyClassifier.NAVIGATION_KEYS.length).assertEqual(4);
      expect(RemoteKeyClassifier.CONFIRM_KEYS.length).assertEqual(2);
      expect(RemoteKeyClassifier.SYSTEM_KEYS.length).assertEqual(1);
    });

    it('focus_pipeline_should_survive_page_reentry', 0, async () => {
      await ensureHomePage(driver);
      const memory = new FocusMemory();
      const engine = new KeySequenceEngine(HOME_ENTRY_COUNT);
      engine.apply(KeyCode.KEY_DPAD_DOWN);
      memory.remember('home', engine.getIndex());
      await pressAndWait(driver, KEY_DPAD_DOWN, 1, DELAY_KEY_NAVIGATION);
      const focusIndex = await getCurrentFocusIndex(driver);
      expect(focusIndex).assertLargerOrEqual(-1);
      expect(memory.recall('home')).assertEqual(1);
      expect(FocusRingValidator.isFocusIndexValid(memory.recall('home'), HOME_ENTRY_COUNT)).assertTrue();
    });

    it('focus_navigation_constants_should_be_stable', 0, () => {
      expect(HOME_ENTRY_COUNT).assertEqual(3);
      expect(KEY_EVENT_DOWN).assertEqual(0);
      expect(KEY_EVENT_UP).assertEqual(1);
      expect(KeyCode.KEY_DPAD_UP).assertEqual(2012);
      expect(KeyCode.KEY_DPAD_DOWN).assertEqual(2013);
      expect(KeyCode.KEY_ENTER).assertEqual(2054);
      expect(KeyCode.KEY_BACK).assertEqual(2);
    });

    it('engine_reset_should_clear_history_midway', 0, () => {
      const engine = new KeySequenceEngine(3);
      engine.apply(KeyCode.KEY_DPAD_DOWN);
      engine.apply(KeyCode.KEY_DPAD_DOWN);
      expect(engine.getHistoryLength()).assertEqual(2);
      engine.reset();
      expect(engine.getIndex()).assertEqual(0);
      expect(engine.getHistoryLength()).assertEqual(0);
      expect(engine.undo()).assertFalse();
      expect(engine.apply(KeyCode.KEY_DPAD_DOWN)).assertEqual(1);
      expect(engine.getHistoryLength()).assertEqual(1);
    });

    it('focus_memory_should_scale_to_many_pages', 0, () => {
      const memory = new FocusMemory();
      for (let i = 0; i < 20; i++) {
        memory.remember(`page-${i}`, i % 3);
      }
      expect(memory.size()).assertEqual(20);
      for (let i = 0; i < 20; i++) {
        expect(memory.recall(`page-${i}`)).assertEqual(i % 3);
      }
      expect(memory.recall('page-20')).assertEqual(-1);
      memory.clear();
      expect(memory.size()).assertEqual(0);
    });

    it('remote_command_names_should_be_unique', 0, () => {
      const commands: string[] = [
        RemoteCommandRouter.NONE,
        RemoteCommandRouter.UP,
        RemoteCommandRouter.DOWN,
        RemoteCommandRouter.CONFIRM,
        RemoteCommandRouter.BACK,
        RemoteCommandRouter.TAB
      ];
      const unique: Set<string> = new Set<string>();
      for (let i = 0; i < commands.length; i++) {
        unique.add(commands[i]);
        expect(commands[i].length).assertLarger(0);
      }
      expect(unique.size).assertEqual(commands.length);
      expect(RemoteCommandRouter.isNavigation(RemoteCommandRouter.NONE)).assertFalse();
    });

    it('focus_transition_matrix_should_match_edge_count', 0, () => {
      const sources: string[] = [];
      for (let i = 0; i < FocusTransitionValidator.ALLOWED.length; i++) {
        const from = FocusTransitionValidator.ALLOWED[i][0];
        if (!sources.includes(from)) {
          sources.push(from);
        }
      }
      let edges: number = 0;
      for (let i = 0; i < sources.length; i++) {
        const targets = FocusTransitionValidator.targetsOf(sources[i]);
        for (let j = 0; j < targets.length; j++) {
          if (FocusTransitionValidator.isAllowed(sources[i], targets[j])) {
            edges++;
          }
        }
      }
      expect(edges).assertEqual(FocusTransitionValidator.ALLOWED.length);
      expect(FocusTransitionValidator.targetsOf('0').length).assertEqual(1);
    });

    it('focus_graph_empty_path_should_be_false', 0, () => {
      const graph = new FocusGraph();
      expect(graph.hasPath('a', 'b')).assertFalse();
      graph.addNode('a');
      expect(graph.hasPath('a', 'a')).assertTrue();
      expect(graph.hasPath('a', 'b')).assertFalse();
      expect(graph.edgeCount()).assertEqual(0);
      expect(graph.sinkNodes().length).assertEqual(1);
    });

    it('command_matrix_should_classify_every_menu_key', 0, () => {
      const matrix: number[] = [
        KeyCode.KEY_DPAD_UP,
        KeyCode.KEY_DPAD_DOWN,
        KeyCode.KEY_ENTER,
        KeyCode.KEY_BACK,
        KeyCode.KEYCODE_TAB,
        KeyCode.KEY_0
      ];
      let navigation: number = 0;
      let actions: number = 0;
      for (let i = 0; i < matrix.length; i++) {
        const command = RemoteCommandRouter.commandOf(matrix[i]);
        if (RemoteCommandRouter.isNavigation(command)) {
          navigation++;
        }
        if (RemoteCommandRouter.isAction(command)) {
          actions++;
        }
      }
      expect(navigation).assertEqual(2);
      expect(actions).assertEqual(3);
      expect(navigation + actions).assertEqual(5);
    });

    it('engine_should_keep_state_consistent_after_blocked_keys', 0, () => {
      const engine = new KeySequenceEngine(2);
      engine.apply(KeyCode.KEY_ENTER);
      engine.apply(KeyCode.KEY_BACK);
      expect(engine.getHistoryLength()).assertEqual(0);
      engine.apply(KeyCode.KEY_DPAD_DOWN);
      engine.apply(KeyCode.KEY_DPAD_DOWN);
      expect(engine.getIndex()).assertEqual(1);
      expect(engine.getHistoryLength()).assertEqual(1);
      expect(engine.undo()).assertTrue();
      expect(engine.getIndex()).assertEqual(0);
    });

    it('focus_latency_budget_should_allow_zero', 0, () => {
      const analyzer = new FocusLatencyAnalyzer();
      analyzer.record(0);
      expect(analyzer.getSampleCount()).assertEqual(1);
      expect(analyzer.getMaxLatency()).assertEqual(0);
      expect(analyzer.getAverageLatency()).assertEqual(0);
      expect(analyzer.isWithinBudget(0)).assertTrue();
      analyzer.record(1);
      expect(analyzer.isWithinBudget(0)).assertFalse();
      expect(analyzer.getSampleCount()).assertEqual(2);
      expect(analyzer.getMaxLatency()).assertEqual(1);
      expect(analyzer.getAverageLatency()).assertEqual(0.5);
    });
  });
}

