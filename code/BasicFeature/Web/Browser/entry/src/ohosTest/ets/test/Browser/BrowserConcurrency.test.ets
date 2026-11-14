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
  getDriver, runSerialized, startBrowserApp, serializedDelay, clickById, countById,
  waitForId, normalizeUrl, MAX_TAB_COUNT, TAB_LIMIT_MESSAGE, ID_ACTION_ADD,
  ID_CANCEL_TAB, ID_INPUT_URL, DELAY_TAB_OPERATION, TIMEOUT_TAB_SWITCH
} from '../Shared/BrowserTestKit';
import {
  MockBrowser, MockBrowserTab, MockWebController, MockLoadingStatus, MockClock
} from '../Shared/BrowserMock';

const TAG: string = 'BrowserConcurrencyTest';

/** Concurrency budgets are counted in operations, never in wall clock seconds. */
const CONCURRENT_TABS: number = 5;
const CONTROLLER_LANES: number = 4;
const LOADS_PER_LANE: number = 5;
const LONG_QUEUE_LENGTH: number = 24;
const STRESS_OPERATIONS: number = 48;
const TOLERANCE_ORDER_DRIFT: number = 0;

/** One scheduled unit of work on the shared single lane executor. */
interface LaneTask {
  id: number;
  lane: number;
  action: string;
  startedAt: number;
  finishedAt: number;
}

/** One progress callback sample tagged with the tab that produced it. */
interface ProgressSample {
  tabIndex: number;
  progress: number;
  seq: number;
}

/**
 * Mirror of BrowserTestKit.runSerialized.
 *
 * UiTest refuses two overlapping operations, so every helper chains its work
 * onto a single promise. The double below makes that guarantee observable: it
 * records arrival and completion ticks, flags any overlap and keeps the FIFO
 * order of the submitted intents. A regression of the chaining logic then
 * becomes a hard assertion instead of a sporadic device timeout.
 */
class SerialLaneQueue {
  private clock: MockClock = new MockClock(1000);
  private tasks: LaneTask[] = [];
  private order: string[] = [];
  private overlaps: number = 0;
  private peak: number = 0;
  private active: number = 0;
  private closed: boolean = false;
  private rejected: number = 0;

  request(lane: number, action: string, cost: number = 1): LaneTask {
    if (this.closed) {
      this.rejected += 1;
      throw new Error('queue is closed');
    }
    const duration: number = cost <= 0 ? 1 : cost;
    const task: LaneTask = {
      id: this.tasks.length,
      lane: lane,
      action: action,
      startedAt: this.clock.now(),
      finishedAt: this.clock.now() + duration
    };
    this.clock.advance(duration);
    this.tasks.push(task);
    return task;
  }

  /** Executes every pending task one after another on the single lane. */
  drain(): number {
    let executed: number = 0;
    for (let index = 0; index < this.tasks.length; index++) {
      const task: LaneTask = this.tasks[index];
      if (this.active > 0) {
        this.overlaps += 1;
      }
      this.active += 1;
      if (this.active > this.peak) {
        this.peak = this.active;
      }
      this.order.push(task.action);
      this.active -= 1;
      executed += 1;
    }
    return executed;
  }

  size(): number {
    return this.tasks.length;
  }

  executedOrder(): string[] {
    return this.order.slice(0);
  }

  overlapCount(): number {
    return this.overlaps;
  }

  peakConcurrency(): number {
    return this.peak;
  }

  rejectedCount(): number {
    return this.rejected;
  }

  driftBetween(firstIndex: number, secondIndex: number): number {
    if (firstIndex < 0 || secondIndex < 0 || firstIndex >= this.tasks.length ||
      secondIndex >= this.tasks.length) {
      return 0;
    }
    return this.tasks[secondIndex].startedAt - this.tasks[firstIndex].finishedAt;
  }

  totalCost(): number {
    if (this.tasks.length === 0) {
      return 0;
    }
    return this.tasks[this.tasks.length - 1].finishedAt - this.tasks[0].startedAt;
  }

  close(): void {
    this.closed = true;
  }

  isClosed(): boolean {
    return this.closed;
  }
}

/**
 * Fans navigation work out to several WebviewController doubles.
 *
 * Every tab owns its own controller. Loading four addresses "at the same time"
 * from the title bar therefore has to land on four different controllers, with
 * no url leaking from one lane into another. The double keeps the assignment
 * table and can prove that no cross talk happened.
 */
class ControllerFanout {
  controllers: MockWebController[] = [];
  private assigned: string[] = [];
  private laneLoads: number[] = [];
  private crossTalkHits: number = 0;

  constructor(laneCount: number) {
    const lanes: number = laneCount <= 0 ? 1 : laneCount;
    for (let index = 0; index < lanes; index++) {
      this.controllers.push(new MockWebController());
      this.assigned.push('');
      this.laneLoads.push(0);
    }
  }

  laneCount(): number {
    return this.controllers.length;
  }

  /** Loads url on the lane selected in round robin order. */
  loadOnLane(lane: number, url: string): boolean {
    if (lane < 0 || lane >= this.controllers.length) {
      return false;
    }
    const accepted: boolean = this.controllers[lane].loadUrl(url);
    if (accepted) {
      this.assigned[lane] = url;
      this.laneLoads[lane] += 1;
    }
    return accepted;
  }

  /** Issues one load per lane, cycling through the supplied addresses. */
  broadcast(urls: string[]): number {
    let accepted: number = 0;
    for (let index = 0; index < urls.length; index++) {
      const lane: number = index % this.controllers.length;
      if (this.loadOnLane(lane, urls[index])) {
        accepted += 1;
      }
    }
    return accepted;
  }

  /** Number of controllers whose current url is not the one assigned to it. */
  crossTalk(): number {
    this.crossTalkHits = 0;
    for (let index = 0; index < this.controllers.length; index++) {
      const current: string = this.controllers[index].currentUrl;
      if (current.length > 0 && current !== this.assigned[index]) {
        this.crossTalkHits += 1;
      }
    }
    return this.crossTalkHits;
  }

  loadCounts(): number[] {
    return this.laneLoads.slice(0);
  }

  pendingUrls(): string[] {
    const result: string[] = [];
    for (let index = 0; index < this.controllers.length; index++) {
      result.push(this.controllers[index].getPendingUrl());
    }
    return result;
  }

  distinctCurrentUrls(): number {
    const seen: string[] = [];
    for (let index = 0; index < this.controllers.length; index++) {
      const current: string = this.controllers[index].currentUrl;
      if (current.length > 0 && seen.indexOf(current) < 0) {
        seen.push(current);
      }
    }
    return seen.length;
  }
}

/**
 * Records the Web lifecycle callbacks of several tabs.
 *
 * Tabs load independently, so the global callback stream is interleaved while
 * the per tab stream must stay strictly begin -> progress* -> end. Regressions
 * in the loadingStatus state machine show up as an ordered-flag violation.
 */
class CallbackRecorder {
  events: string[] = [];
  samples: ProgressSample[] = [];
  private perTab: Map<number, string[]> = new Map<number, string[]>();
  private lastProgress: Map<number, number> = new Map<number, number>();
  regressions: number = 0;
  unmatchedEnds: number = 0;

  onBegin(tabIndex: number): void {
    this.push(tabIndex, 'begin');
    this.lastProgress.set(tabIndex, -1);
  }

  onProgress(tabIndex: number, progress: number): void {
    this.push(tabIndex, 'progress');
    const previous: number = this.lastProgress.get(tabIndex) ?? -1;
    if (progress < previous) {
      this.regressions += 1;
    }
    this.lastProgress.set(tabIndex, progress);
    this.samples.push({ tabIndex: tabIndex, progress: progress, seq: this.samples.length });
  }

  onEnd(tabIndex: number): void {
    this.push(tabIndex, 'end');
  }

  private push(tabIndex: number, name: string): void {
    let list: string[] = this.perTab.get(tabIndex) ?? [];
    list.push(name);
    this.perTab.set(tabIndex, list);
    this.events.push(`${tabIndex}:${name}`);
  }

  eventsFor(tabIndex: number): string[] {
    return (this.perTab.get(tabIndex) ?? []).slice(0);
  }

  isOrdered(tabIndex: number): boolean {
    const list: string[] = this.eventsFor(tabIndex);
    if (list.length === 0) {
      return false;
    }
    if (list[0] !== 'begin' || list[list.length - 1] !== 'end') {
      return false;
    }
    let progressSeen: boolean = false;
    for (let index = 1; index < list.length - 1; index++) {
      if (list[index] !== 'progress') {
        return false;
      }
      progressSeen = true;
    }
    return progressSeen || list.length === 2;
  }

  sampleCountFor(tabIndex: number): number {
    return this.samples.filter((sample: ProgressSample) => sample.tabIndex === tabIndex).length;
  }

  /** Ends recorded without a preceding begin, an abnormal lifecycle signal. */
  endWithoutBegin(tabIndex: number): number {
    const list: string[] = this.eventsFor(tabIndex);
    const ends: number = list.filter((name: string) => name === 'end').length;
    const begins: number = list.filter((name: string) => name === 'begin').length;
    this.unmatchedEnds = begins >= ends ? 0 : ends - begins;
    return this.unmatchedEnds;
  }

  reset(): void {
    this.events = [];
    this.samples = [];
    this.perTab = new Map<number, string[]>();
    this.lastProgress = new Map<number, number>();
    this.regressions = 0;
    this.unmatchedEnds = 0;
  }
}

/** Grows the tab strip up to the requested total and reports the additions. */
function seedTabs(model: MockBrowser, total: number): number {
  let added: number = 0;
  while (model.tabs.length < total) {
    if (model.addTab()) {
      added += 1;
    } else {
      break;
    }
  }
  return added;
}

/** Applies n add intents, returning one success flag per intent. */
function applyAddIntents(model: MockBrowser, requests: number): boolean[] {
  const results: boolean[] = [];
  for (let index = 0; index < requests; index++) {
    results.push(model.addTab());
  }
  return results;
}

/** Applies the given delete indexes in order, returning one flag per intent. */
function applyDeleteIntents(model: MockBrowser, indexes: number[]): boolean[] {
  const results: boolean[] = [];
  for (let index = 0; index < indexes.length; index++) {
    results.push(model.deleteTab(indexes[index]));
  }
  return results;
}

/** The key of the active tab, or -1 when the strip is empty. */
function activeKey(model: MockBrowser): number {
  const tab: MockBrowserTab | null = model.getCurrentTab();
  return tab === null ? -1 : tab.key;
}

/** True when keys are exactly 0..n-1 in order, the invariant of the strip. */
function keysAreContiguous(model: MockBrowser): boolean {
  const keys: number[] = model.getTabKeys();
  for (let index = 0; index < keys.length; index++) {
    if (keys[index] !== index) {
      return false;
    }
  }
  return true;
}

/** True when every tab key is unique. */
function keysAreUnique(model: MockBrowser): boolean {
  const keys: number[] = model.getTabKeys();
  return new Set<number>(keys).size === keys.length;
}

export default function browserConcurrencyTest() {
  describe('browserConcurrencyTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'concurrency suite begin');
      TestLogger.resetSteps(TAG);
      await startBrowserApp();
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('Browser_Concurrency_Tab_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Concurrency_Tab_001');
      TestLogger.step(TAG, 'queue five add tab intents and replay them in order');
      const queue: SerialLaneQueue = new SerialLaneQueue();
      for (let index = 0; index < CONCURRENT_TABS; index++) {
        queue.request(index, `add tab ${index}`, 2);
      }
      expect(queue.size()).assertEqual(CONCURRENT_TABS);
      const executed: number = queue.drain();
      const order: string[] = queue.executedOrder();
      TestLogger.info(TAG, `executed=${executed} order=${order.join(' > ')}`);
      expect(executed).assertEqual(CONCURRENT_TABS);
      expect(order[0]).assertEqual('add tab 0');
      expect(order[CONCURRENT_TABS - 1]).assertEqual('add tab 4');
      expect(queue.overlapCount()).assertEqual(0);
      expect(queue.peakConcurrency()).assertEqual(1);
      expect(queue.driftBetween(0, 1)).assertEqual(TOLERANCE_ORDER_DRIFT);
      expect(queue.totalCost()).assertEqual(CONCURRENT_TABS * 2);
      TestLogger.pass(TAG, 'Browser_Concurrency_Tab_001');
    });

    it('Browser_Concurrency_Tab_002', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Concurrency_Tab_002');
      TestLogger.step(TAG, 'replay five queued adds onto the live tab model');
      const model: MockBrowser = new MockBrowser(1);
      const queue: SerialLaneQueue = new SerialLaneQueue();
      for (let index = 0; index < CONCURRENT_TABS; index++) {
        queue.request(index, 'add', 1);
      }
      queue.drain();
      const results: boolean[] = applyAddIntents(model, CONCURRENT_TABS);
      TestLogger.info(TAG, `tabs=${model.tabs.length} index=${model.getTabArrayIndex()}`);
      expect(results.length).assertEqual(CONCURRENT_TABS);
      expect(results[0]).assertTrue();
      expect(results[CONCURRENT_TABS - 1]).assertTrue();
      expect(model.tabs.length).assertEqual(1 + CONCURRENT_TABS);
      expect(model.getTabArrayIndex()).assertEqual(CONCURRENT_TABS);
      expect(activeKey(model)).assertEqual(CONCURRENT_TABS);
      expect(keysAreContiguous(model)).assertTrue();
      expect(keysAreUnique(model)).assertTrue();
      TestLogger.pass(TAG, 'Browser_Concurrency_Tab_002');
    });

    it('Browser_Concurrency_Tab_003', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Concurrency_Tab_003');
      TestLogger.step(TAG, 'saturate the strip and count the capacity rejections');
      const model: MockBrowser = new MockBrowser(1);
      seedTabs(model, MAX_TAB_COUNT - 1);
      expect(model.tabs.length).assertEqual(MAX_TAB_COUNT - 1);
      const results: boolean[] = applyAddIntents(model, 4);
      const accepted: number = results.filter((item: boolean) => item).length;
      const rejected: number = results.length - accepted;
      TestLogger.info(TAG, `accepted=${accepted} rejected=${rejected} tabs=${model.tabs.length}`);
      expect(accepted).assertEqual(2);
      expect(rejected).assertEqual(2);
      expect(model.tabs.length).assertEqual(MAX_TAB_COUNT + 1);
      expect(model.toasts.length).assertEqual(2);
      expect(model.toasts[0]).assertEqual(TAB_LIMIT_MESSAGE);
      expect(model.toasts[1]).assertEqual(TAB_LIMIT_MESSAGE);
      expect(model.getTabArrayIndex()).assertEqual(MAX_TAB_COUNT);
      TestLogger.pass(TAG, 'Browser_Concurrency_Tab_003');
    });

    it('Browser_Concurrency_Tab_004', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Concurrency_Tab_004');
      TestLogger.step(TAG, 'queue four deletes around the active middle tab');
      const model: MockBrowser = new MockBrowser(6);
      model.selectTab(3);
      const results: boolean[] = applyDeleteIntents(model, [1, 1, 0, 0]);
      const applied: number = results.filter((item: boolean) => item).length;
      const index: number = model.getTabArrayIndex();
      TestLogger.info(TAG, `applied=${applied} tabs=${model.tabs.length} index=${index} keys=${model.getTabKeys().join(',')}`);
      expect(applied).assertEqual(4);
      expect(model.tabs.length).assertEqual(2);
      expect(index >= 0 && index < model.tabs.length).assertTrue();
      expect(keysAreContiguous(model)).assertTrue();
      expect(keysAreUnique(model)).assertTrue();
      expect(model.getCurrentTab() !== null).assertTrue();
      expect(activeKey(model)).assertEqual(index);
      TestLogger.pass(TAG, 'Browser_Concurrency_Tab_004');
    });

    it('Browser_Concurrency_Tab_005', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Concurrency_Tab_005');
      TestLogger.step(TAG, 'reject the closing intent on the last remaining tab');
      const model: MockBrowser = new MockBrowser(1);
      const results: boolean[] = applyDeleteIntents(model, [0, 0, 2]);
      TestLogger.info(TAG, `results=${results.join(',')} tabs=${model.tabs.length}`);
      expect(results[0]).assertFalse();
      expect(results[1]).assertFalse();
      expect(results[2]).assertFalse();
      expect(model.tabs.length).assertEqual(1);
      expect(model.getTabArrayIndex()).assertEqual(0);
      expect(keysAreContiguous(model)).assertTrue();
      expect(model.getCurrentTab() !== null).assertTrue();
      TestLogger.pass(TAG, 'Browser_Concurrency_Tab_005');
    });

    it('Browser_Concurrency_Controller_006', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Concurrency_Controller_006');
      TestLogger.step(TAG, 'load two addresses through two independent controllers');
      const fanout: ControllerFanout = new ControllerFanout(2);
      const first: string = normalizeUrl('www.example.com/alpha');
      const second: string = normalizeUrl('www.example.com/beta');
      expect(fanout.loadOnLane(0, first)).assertTrue();
      expect(fanout.loadOnLane(1, second)).assertTrue();
      const pending: string[] = fanout.pendingUrls();
      TestLogger.info(TAG, `pending=${pending.join(' , ')} crossTalk=${fanout.crossTalk()}`);
      expect(pending.length).assertEqual(2);
      expect(pending[0]).assertEqual(first);
      expect(pending[1]).assertEqual(second);
      expect(pending[0] === pending[1]).assertFalse();
      expect(fanout.crossTalk()).assertEqual(0);
      expect(fanout.controllers[0].loadCount).assertEqual(1);
      expect(fanout.controllers[1].loadCount).assertEqual(1);
      expect(fanout.distinctCurrentUrls()).assertEqual(2);
      TestLogger.pass(TAG, 'Browser_Concurrency_Controller_006');
    });

    it('Browser_Concurrency_Controller_007', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Concurrency_Controller_007');
      TestLogger.step(TAG, 'broadcast twenty loads across four controller lanes');
      const fanout: ControllerFanout = new ControllerFanout(CONTROLLER_LANES);
      const urls: string[] = [];
      for (let lane = 0; lane < fanout.laneCount(); lane++) {
        for (let round = 0; round < LOADS_PER_LANE; round++) {
          urls.push(normalizeUrl(`www.example.com/lane/${lane}/round/${round}`));
        }
      }
      const accepted: number = fanout.broadcast(urls);
      const counts: number[] = fanout.loadCounts();
      TestLogger.info(TAG, `accepted=${accepted} perLane=${counts.join(',')} crossTalk=${fanout.crossTalk()}`);
      expect(accepted).assertEqual(urls.length);
      expect(urls.length).assertEqual(CONTROLLER_LANES * LOADS_PER_LANE);
      expect(counts.length).assertEqual(CONTROLLER_LANES);
      for (let lane = 0; lane < counts.length; lane++) {
        expect(counts[lane]).assertEqual(LOADS_PER_LANE);
      }
      expect(fanout.crossTalk()).assertEqual(0);
      expect(fanout.distinctCurrentUrls()).assertEqual(CONTROLLER_LANES);
      TestLogger.pass(TAG, 'Browser_Concurrency_Controller_007');
    });

    it('Browser_Concurrency_Controller_008', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Concurrency_Controller_008');
      TestLogger.step(TAG, 'repeat the same address four times on one controller');
      const fanout: ControllerFanout = new ControllerFanout(1);
      const url: string = normalizeUrl('www.example.com/same');
      expect(fanout.loadOnLane(0, url)).assertTrue();
      expect(fanout.loadOnLane(0, url)).assertTrue();
      expect(fanout.loadOnLane(0, normalizeUrl('www.example.com/other'))).assertTrue();
      expect(fanout.loadOnLane(0, url)).assertTrue();
      const controller: MockWebController = fanout.controllers[0];
      TestLogger.info(TAG, `loads=${controller.loadCount} history=${controller.history.length}`);
      expect(controller.loadCount).assertEqual(4);
      expect(controller.history.length).assertEqual(3);
      expect(controller.history[0]).assertEqual(url);
      expect(controller.history[1]).assertEqual(normalizeUrl('www.example.com/other'));
      expect(controller.historyIndex).assertEqual(2);
      expect(fanout.crossTalk()).assertEqual(0);
      TestLogger.pass(TAG, 'Browser_Concurrency_Controller_008');
    });

    it('Browser_Concurrency_Callback_009', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Concurrency_Callback_009');
      TestLogger.step(TAG, 'record a monotonic progress stream for one tab');
      const recorder: CallbackRecorder = new CallbackRecorder();
      const model: MockBrowser = new MockBrowser(1);
      const steps: number[] = [0, 15, 45, 80, 100];
      recorder.onBegin(0);
      model.onPageBegin(normalizeUrl('www.example.com/progress'));
      for (let index = 0; index < steps.length; index++) {
        recorder.onProgress(0, steps[index]);
        model.onProgressChange(steps[index]);
      }
      recorder.onEnd(0);
      model.onPageEnd();
      TestLogger.info(TAG, `regressions=${recorder.regressions} samples=${recorder.sampleCountFor(0)}`);
      expect(recorder.regressions).assertEqual(0);
      expect(recorder.sampleCountFor(0)).assertEqual(steps.length);
      expect(recorder.isOrdered(0)).assertTrue();
      expect(recorder.endWithoutBegin(0)).assertEqual(0);
      expect(model.hideProgress).assertTrue();
      expect(model.progress).assertEqual(0);
      expect(model.loadingStatus).assertEqual(MockLoadingStatus.END);
      TestLogger.pass(TAG, 'Browser_Concurrency_Callback_009');
    });

    it('Browser_Concurrency_Callback_010', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Concurrency_Callback_010');
      TestLogger.step(TAG, 'interleave the callbacks of two loading tabs');
      const recorder: CallbackRecorder = new CallbackRecorder();
      recorder.onBegin(0);
      recorder.onBegin(1);
      recorder.onProgress(0, 30);
      recorder.onProgress(1, 20);
      recorder.onProgress(0, 100);
      recorder.onProgress(1, 100);
      recorder.onEnd(0);
      recorder.onEnd(1);
      const tabZero: string[] = recorder.eventsFor(0);
      const tabOne: string[] = recorder.eventsFor(1);
      TestLogger.info(TAG, `tab0=${tabZero.join('>')} tab1=${tabOne.join('>')}`);
      expect(tabZero.length).assertEqual(4);
      expect(tabOne.length).assertEqual(4);
      expect(tabZero[0]).assertEqual('begin');
      expect(tabZero[3]).assertEqual('end');
      expect(tabOne[0]).assertEqual('begin');
      expect(tabOne[3]).assertEqual('end');
      expect(recorder.isOrdered(0)).assertTrue();
      expect(recorder.isOrdered(1)).assertTrue();
      expect(recorder.regressions).assertEqual(0);
      expect(recorder.events.length).assertEqual(8);
      expect(recorder.endWithoutBegin(0)).assertEqual(0);
      expect(recorder.endWithoutBegin(1)).assertEqual(0);
      TestLogger.pass(TAG, 'Browser_Concurrency_Callback_010');
    });

    it('Browser_Concurrency_Serial_011', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Concurrency_Serial_011');
      TestLogger.step(TAG, 'drain a queue longer than the tab strip');
      const queue: SerialLaneQueue = new SerialLaneQueue();
      for (let index = 0; index < LONG_QUEUE_LENGTH; index++) {
        queue.request(index % CONTROLLER_LANES, `operation ${index}`, 1);
      }
      const executed: number = queue.drain();
      const order: string[] = queue.executedOrder();
      TestLogger.info(TAG, `executed=${executed} peak=${queue.peakConcurrency()} overlaps=${queue.overlapCount()}`);
      expect(executed).assertEqual(LONG_QUEUE_LENGTH);
      expect(order.length).assertEqual(LONG_QUEUE_LENGTH);
      expect(order[0]).assertEqual('operation 0');
      expect(order[LONG_QUEUE_LENGTH - 1]).assertEqual('operation 23');
      expect(queue.peakConcurrency()).assertEqual(1);
      expect(queue.overlapCount()).assertEqual(0);
      expect(queue.totalCost()).assertEqual(LONG_QUEUE_LENGTH);
      expect(queue.rejectedCount()).assertEqual(0);
      TestLogger.pass(TAG, 'Browser_Concurrency_Serial_011');
    });

    it('Browser_Concurrency_Serial_012', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Concurrency_Serial_012');
      TestLogger.step(TAG, 'reject a submission once the queue is closed');
      const queue: SerialLaneQueue = new SerialLaneQueue();
      queue.request(0, 'last accepted', 2);
      queue.drain();
      queue.close();
      let message: string = '';
      try {
        queue.request(1, 'late operation', 1);
      } catch (error) {
        const wrapped: Error = error instanceof Error ? error : new Error(String(error));
        message = wrapped.message;
      }
      TestLogger.info(TAG, `closed=${queue.isClosed()} message=${message}`);
      expect(queue.isClosed()).assertTrue();
      expect(message).assertEqual('queue is closed');
      expect(queue.rejectedCount()).assertEqual(1);
      expect(queue.size()).assertEqual(1);
      expect(queue.overlapCount()).assertEqual(0);
      TestLogger.pass(TAG, 'Browser_Concurrency_Serial_012');
    });

    it('Browser_Concurrency_Mixed_013', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Concurrency_Mixed_013');
      TestLogger.step(TAG, 'interleave forty eight tab and navigation intents');
      const model: MockBrowser = new MockBrowser(3);
      const queue: SerialLaneQueue = new SerialLaneQueue();
      for (let round = 0; round < STRESS_OPERATIONS; round++) {
        const mode: number = round % 4;
        if (mode === 0) {
          const accepted: boolean = model.addTab();
          queue.request(0, `add ${round} ${accepted}`, 1);
        } else if (mode === 1) {
          const accepted: boolean = model.deleteTab(round % model.tabs.length);
          queue.request(1, `delete ${round} ${accepted}`, 1);
        } else if (mode === 2) {
          const accepted: boolean = model.loadUrl(`www.example.com/page/${round}`);
          queue.request(2, `load ${round} ${accepted}`, 2);
        } else {
          model.selectTab(round % model.tabs.length);
          queue.request(3, `select ${round}`, 1);
        }
      }
      const executed: number = queue.drain();
      const index: number = model.getTabArrayIndex();
      TestLogger.info(TAG, `executed=${executed} tabs=${model.tabs.length} index=${index}`);
      expect(executed).assertEqual(STRESS_OPERATIONS);
      expect(model.tabs.length).assertLarger(0);
      expect(model.tabs.length).assertLess(MAX_TAB_COUNT + 2);
      expect(index >= 0 && index < model.tabs.length).assertTrue();
      expect(keysAreContiguous(model)).assertTrue();
      expect(keysAreUnique(model)).assertTrue();
      expect(queue.peakConcurrency()).assertEqual(1);
      expect(queue.overlapCount()).assertEqual(0);
      expect(model.getCurrentTab() !== null).assertTrue();
      TestLogger.pass(TAG, 'Browser_Concurrency_Mixed_013');
    });

    it('Browser_Concurrency_UI_014', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Concurrency_UI_014');
      TestLogger.step(TAG, 'add two tabs through the real serialized UI helpers');
      const present: boolean = await waitForId(driver, ID_ACTION_ADD, TIMEOUT_TAB_SWITCH);
      expect(present).assertTrue();
      try {
        const firstClick: boolean = await clickById(driver, ID_ACTION_ADD);
        expect(firstClick).assertTrue();
        await serializedDelay(driver, DELAY_TAB_OPERATION);
        const secondClick: boolean = await clickById(driver, ID_ACTION_ADD);
        expect(secondClick).assertTrue();
        await serializedDelay(driver, DELAY_TAB_OPERATION);
        const closeButtons: number = await countById(driver, ID_CANCEL_TAB);
        const inputVisible: boolean = await waitForId(driver, ID_INPUT_URL, TIMEOUT_TAB_SWITCH);
        TestLogger.info(TAG, `closeButtons=${closeButtons} inputVisible=${inputVisible}`);
        expect(closeButtons).assertLarger(0);
        expect(inputVisible).assertTrue();
        expect(secondClick).assertEqual(firstClick);
      } finally {
        await serializedDelay(driver, DELAY_TAB_OPERATION);
        TestLogger.info(TAG, 'tab strip left in a stable state');
      }
      TestLogger.pass(TAG, 'Browser_Concurrency_UI_014');
    });

    it('Browser_Concurrency_UI_015', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Concurrency_UI_015');
      TestLogger.step(TAG, 'run three UI actions through the serialized wrapper');
      const order: string[] = [];
      try {
        await runSerialized<void>(async () => {
          await serializedDelay(driver, 10);
          order.push('first');
        });
        await runSerialized<void>(async () => {
          await serializedDelay(driver, 10);
          order.push('second');
        });
        await runSerialized<void>(async () => {
          await serializedDelay(driver, 10);
          order.push('third');
        });
        const clock: MockClock = new MockClock(1000);
        clock.advance(DELAY_TAB_OPERATION * 3);
        TestLogger.info(TAG, `order=${order.join(',')} budget=${clock.now() - 1000}`);
        expect(order.length).assertEqual(3);
        expect(order[0]).assertEqual('first');
        expect(order[1]).assertEqual('second');
        expect(order[2]).assertEqual('third');
        expect(clock.now() - 1000).assertEqual(DELAY_TAB_OPERATION * 3);
      } finally {
        TestLogger.info(TAG, 'serialized UI wrapper finished');
      }
      TestLogger.pass(TAG, 'Browser_Concurrency_UI_015');
    });
  });
}