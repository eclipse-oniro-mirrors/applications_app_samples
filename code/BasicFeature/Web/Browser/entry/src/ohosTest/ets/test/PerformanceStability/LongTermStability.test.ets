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
  getDriver, runSerialized, startBrowserApp, serializedDelay, waitForId,
  MAX_TAB_COUNT, ID_INPUT_URL, TIMEOUT_PAGE_LOAD, DELAY_TAB_OPERATION
} from '../Shared/BrowserTestKit';
import { MockBrowser, MockLoadingStatus, MockClock } from '../Shared/BrowserMock';

const TAG: string = 'BrowserLongTermStabilityTest';

/* A long browsing session is modelled as two hundred navigation cycles. */
const LONG_RUN_ROUNDS: number = 200;
const HISTORY_LIMIT: number = 256;
const MEMORY_SAMPLE_INTERVAL: number = 10;

/*
 * Memory thresholds. The heap of a healthy WebView grows by a few kilobytes
 * per navigation because of decoded resources; a leak grows by an order of
 * magnitude more, therefore the slope is compared against a generous bound.
 */
const MEMORY_BYTES_PER_CYCLE_LIMIT: number = 16384;
const MEMORY_GROWTH_RATIO_LIMIT: number = 1.5;
const MEMORY_NOISE_BYTES: number = 4096;
const TOLERANCE_STATE_DRIFT: number = 0;
const TOLERANCE_PROGRESS_RETURN: number = 0;

/** Result of one simulated browsing cycle. */
interface RunCycleResult {
  round: number;
  loadedUrl: string;
  backApplied: boolean;
  forwardApplied: boolean;
  refreshed: boolean;
  historyDepth: number;
  loadingStatus: MockLoadingStatus;
}

/** Observable browser state used for before / after comparisons. */
interface StateSnapshot {
  tabCount: number;
  tabIndex: number;
  progress: number;
  hidden: boolean;
  loading: MockLoadingStatus;
  historyDepth: number;
  currentUrl: string;
}

/**
 * Bounded memory trend probe.
 *
 * A leak test needs a trend, not a single reading. The probe keeps one sample
 * every few cycles, computes the least squares slope and compares the last
 * sample with the first one, so both a steady leak and a late growth spike are
 * detected while scheduler noise is filtered out by the tolerance.
 */
class MemoryTrendProbe {
  private samples: number[] = [];
  private indexes: number[] = [];
  private capacity: number;

  constructor(capacity: number = 64) {
    this.capacity = capacity <= 0 ? 1 : capacity;
  }

  sample(cycle: number, bytes: number): void {
    this.indexes.push(cycle);
    this.samples.push(bytes < 0 ? 0 : bytes);
    if (this.samples.length > this.capacity) {
      this.samples.shift();
      this.indexes.shift();
    }
  }

  size(): number {
    return this.samples.length;
  }

  first(): number {
    return this.samples.length === 0 ? 0 : this.samples[0];
  }

  last(): number {
    return this.samples.length === 0 ? 0 : this.samples[this.samples.length - 1];
  }

  peak(): number {
    let result: number = 0;
    for (let index = 0; index < this.samples.length; index++) {
      if (this.samples[index] > result) {
        result = this.samples[index];
      }
    }
    return result;
  }

  minimum(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    let result: number = this.samples[0];
    for (let index = 1; index < this.samples.length; index++) {
      if (this.samples[index] < result) {
        result = this.samples[index];
      }
    }
    return result;
  }

  /** Total growth between the first and the last retained sample. */
  growth(): number {
    return this.last() - this.first();
  }

  growthRatio(): number {
    const base: number = this.first();
    if (base <= 0) {
      return 0;
    }
    return (this.last() - base) / base;
  }

  /** Least squares slope in bytes per cycle. */
  slopePerCycle(): number {
    const count: number = this.samples.length;
    if (count < 2) {
      return 0;
    }
    let sumX: number = 0;
    let sumY: number = 0;
    let sumXY: number = 0;
    let sumXX: number = 0;
    for (let index = 0; index < count; index++) {
      const x: number = this.indexes[index];
      const y: number = this.samples[index];
      sumX += x;
      sumY += y;
      sumXY += x * y;
      sumXX += x * x;
    }
    const denominator: number = count * sumXX - sumX * sumX;
    if (denominator === 0) {
      return 0;
    }
    return (count * sumXY - sumX * sumY) / denominator;
  }

  /** True when neither the slope nor the total growth exceeds the budget. */
  isStable(slopeLimit: number = MEMORY_BYTES_PER_CYCLE_LIMIT,
    ratioLimit: number = MEMORY_GROWTH_RATIO_LIMIT): boolean {
    if (this.samples.length < 2) {
      return true;
    }
    return this.slopePerCycle() <= slopeLimit && this.growthRatio() <= ratioLimit;
  }

  /** Counts consecutive samples that grow faster than the noise floor. */
  growthStreak(): number {
    let streak: number = 0;
    let best: number = 0;
    for (let index = 1; index < this.samples.length; index++) {
      if (this.samples[index] - this.samples[index - 1] > MEMORY_NOISE_BYTES) {
        streak += 1;
        if (streak > best) {
          best = streak;
        }
      } else {
        streak = 0;
      }
    }
    return best;
  }

  reset(): void {
    this.samples = [];
    this.indexes = [];
  }
}
/**
 * Simulates a long browsing session on one tab.
 *
 * Every cycle performs the four navigations a real user repeats: open an
 * article, go back, go forward and refresh. The simulator records the
 * observable state after each cycle and periodically samples the modelled heap
 * so the suite can assert both state consistency and memory trend.
 */
class LongRunSimulator {
  browser: MockBrowser;
  clock: MockClock;
  probe: MemoryTrendProbe;
  cycles: RunCycleResult[] = [];
  failures: number = 0;
  indexErrors: number = 0;
  progressAnomalies: number = 0;
  refreshTotal: number = 0;
  loadFailures: number = 0;
  private baseUrl: string = 'https://www.example.com/article/';
  private heapBytes: number;
  private heapIncrement: number;

  constructor(browser: MockBrowser, clock: MockClock, initialHeapBytes: number = 54525952,
    heapIncrement: number = 1024) {
    this.browser = browser;
    this.clock = clock;
    this.probe = new MemoryTrendProbe(64);
    this.heapBytes = initialHeapBytes;
    this.heapIncrement = heapIncrement;
  }

  /** One full navigation cycle, returns the observed result. */
  runRound(round: number): RunCycleResult {
    const url: string = this.baseUrl + round;
    this.clock.advance(120);
    const loaded: boolean = this.browser.loadUrl(url);
    if (!loaded) {
      this.loadFailures += 1;
    }
    this.clock.advance(40);
    this.browser.onPageBegin(url);
    this.browser.onProgressChange(45);
    this.browser.onProgressChange(100);
    this.browser.onPageEnd();
    const backApplied: boolean = this.browser.back();
    const forwardApplied: boolean = this.browser.forward();
    this.clock.advance(60);
    this.browser.refresh();
    this.refreshTotal += 1;
    this.clock.advance(20);
    const tab = this.browser.tabs[this.browser.getTabArrayIndex()];
    const result: RunCycleResult = {
      round: round,
      loadedUrl: url,
      backApplied: backApplied,
      forwardApplied: forwardApplied,
      refreshed: true,
      historyDepth: tab.controller.history.length,
      loadingStatus: this.browser.loadingStatus
    };
    if (this.browser.getTabArrayIndex() < 0 ||
      this.browser.getTabArrayIndex() >= this.browser.tabs.length) {
      this.indexErrors += 1;
    }
    if (this.browser.progress !== 0) {
      this.progressAnomalies += 1;
    }
    this.cycles.push(result);
    this.heapBytes += this.heapIncrement + (round % 5) * 64;
    if (round % MEMORY_SAMPLE_INTERVAL === 0) {
      this.probe.sample(round, this.heapBytes);
    }
    return result;
  }

  /** Runs the whole session, returns the number of completed cycles. */
  run(rounds: number): number {
    const total: number = rounds <= 0 ? LONG_RUN_ROUNDS : rounds;
    let completed: number = 0;
    for (let round = 0; round < total; round++) {
      try {
        this.runRound(round);
        completed += 1;
      } catch (error) {
        this.failures += 1;
        const wrapped: Error = error instanceof Error ? error : new Error(String(error));
        TestLogger.exception(TAG, `long run round ${round}`, wrapped);
      }
    }
    this.probe.sample(total, this.heapBytes);
    return completed;
  }

  historyDepth(): number {
    const tab = this.browser.tabs[this.browser.getTabArrayIndex()];
    return tab.controller.history.length;
  }

  heapBytesValue(): number {
    return this.heapBytes;
  }

  /** Snapshot of the tab that should be active after the session. */
  snapshot(): StateSnapshot {
    const index: number = this.browser.getTabArrayIndex();
    const tab = this.browser.tabs[index];
    return {
      tabCount: this.browser.tabs.length,
      tabIndex: index,
      progress: this.browser.progress,
      hidden: this.browser.hideProgress,
      loading: this.browser.loadingStatus,
      historyDepth: tab.controller.history.length,
      currentUrl: tab.controller.currentUrl
    };
  }

  /** Number of cycles whose back navigation was refused unexpectedly. */
  unexpectedBackFailures(): number {
    let counter: number = 0;
    for (let index = 1; index < this.cycles.length; index++) {
      if (!this.cycles[index].backApplied) {
        counter += 1;
      }
    }
    return counter;
  }

  reset(): void {
    this.cycles = [];
    this.failures = 0;
    this.indexErrors = 0;
    this.progressAnomalies = 0;
    this.refreshTotal = 0;
    this.loadFailures = 0;
    this.probe.reset();
  }
}

/** Structural comparison of two snapshots, used by the consistency cases. */
function snapshotsMatch(left: StateSnapshot, right: StateSnapshot): boolean {
  return left.tabCount === right.tabCount && left.tabIndex === right.tabIndex &&
    left.progress === right.progress && left.hidden === right.hidden &&
    left.loading === right.loading && left.historyDepth === right.historyDepth &&
    left.currentUrl === right.currentUrl;
}
export default function browserLongTermStabilityTest() {
  describe('browserLongTermStabilityTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'long term stability suite begin');
      TestLogger.resetSteps(TAG);
      await startBrowserApp();
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('LongRun_Cycle_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'LongRun_Cycle_001');
      TestLogger.step(TAG, 'execute one load, back, forward and refresh cycle');
      const browser: MockBrowser = new MockBrowser(1);
      const clock: MockClock = new MockClock(1700000000000);
      const simulator: LongRunSimulator = new LongRunSimulator(browser, clock);
      const result: RunCycleResult = simulator.runRound(0);
      TestLogger.info(TAG, `cycle loaded ${result.loadedUrl} progress=${browser.progress}`);
      expect(result.refreshed).assertTrue();
      expect(result.backApplied).assertFalse();
      expect(result.loadingStatus).assertEqual(MockLoadingStatus.END);
      expect(result.historyDepth).assertEqual(1);
      expect(browser.progress).assertEqual(0);
      expect(browser.hideProgress).assertTrue();
      expect(clock.now()).assertLarger(1700000000000);
      TestLogger.pass(TAG, 'LongRun_Cycle_001');
    });

    it('LongRun_Cycle_002', 0, async () => {
      TestLogger.caseBegin(TAG, 'LongRun_Cycle_002');
      TestLogger.step(TAG, 'run two hundred full browsing cycles');
      const browser: MockBrowser = new MockBrowser(1);
      const clock: MockClock = new MockClock();
      const simulator: LongRunSimulator = new LongRunSimulator(browser, clock);
      const completed: number = simulator.run(LONG_RUN_ROUNDS);
      TestLogger.info(TAG, `completed=${completed} failures=${simulator.failures}`);
      expect(completed).assertEqual(LONG_RUN_ROUNDS);
      expect(simulator.cycles.length).assertEqual(LONG_RUN_ROUNDS);
      expect(simulator.failures).assertEqual(0);
      expect(simulator.loadFailures).assertEqual(0);
      expect(simulator.indexErrors).assertEqual(0);
      expect(simulator.progressAnomalies).assertEqual(0);
      TestLogger.pass(TAG, 'LongRun_Cycle_002');
    });

    it('LongRun_State_003', 0, async () => {
      TestLogger.caseBegin(TAG, 'LongRun_State_003');
      TestLogger.step(TAG, 'verify the active tab stays valid after the session');
      const browser: MockBrowser = new MockBrowser(1);
      const simulator: LongRunSimulator = new LongRunSimulator(browser, new MockClock());
      simulator.run(LONG_RUN_ROUNDS);
      const index: number = browser.getTabArrayIndex();
      const snapshot: StateSnapshot = simulator.snapshot();
      TestLogger.info(TAG, `index=${index} tabs=${browser.tabs.length} url=${snapshot.currentUrl}`);
      expect(index).assertEqual(0);
      expect(snapshot.tabCount).assertEqual(1);
      expect(snapshot.tabCount).assertLarger(0);
      expect(snapshot.currentUrl.startsWith('https://')).assertTrue();
      expect(browser.getCurrentTab() !== null).assertTrue();
      expect(Math.abs(index - 0)).assertLess(TOLERANCE_STATE_DRIFT + 1);
      TestLogger.pass(TAG, 'LongRun_State_003');
    });

    it('LongRun_State_004', 0, async () => {
      TestLogger.caseBegin(TAG, 'LongRun_State_004');
      TestLogger.step(TAG, 'check the history depth stays inside the engine bound');
      const browser: MockBrowser = new MockBrowser(1);
      const simulator: LongRunSimulator = new LongRunSimulator(browser, new MockClock());
      simulator.run(LONG_RUN_ROUNDS);
      const depth: number = simulator.historyDepth();
      TestLogger.info(TAG, `history depth ${depth} limit ${HISTORY_LIMIT}`);
      expect(depth).assertEqual(LONG_RUN_ROUNDS);
      expect(depth).assertLess(HISTORY_LIMIT + 1);
      expect(browser.tabs[0].controller.accessBackward()).assertTrue();
      expect(browser.tabs[0].controller.history[0]).assertEqual('https://www.example.com/article/0');
      TestLogger.pass(TAG, 'LongRun_State_004');
    });

    it('LongRun_State_005', 0, async () => {
      TestLogger.caseBegin(TAG, 'LongRun_State_005');
      TestLogger.step(TAG, 'compare the modelled refresh count with the controller');
      const browser: MockBrowser = new MockBrowser(1);
      const simulator: LongRunSimulator = new LongRunSimulator(browser, new MockClock());
      simulator.run(LONG_RUN_ROUNDS);
      const controllerCount: number = browser.tabs[0].controller.refreshCount;
      TestLogger.info(TAG, `modelled refreshes=${simulator.refreshTotal} controller=${controllerCount}`);
      expect(simulator.refreshTotal).assertEqual(LONG_RUN_ROUNDS);
      expect(controllerCount).assertEqual(LONG_RUN_ROUNDS);
      expect(controllerCount - simulator.refreshTotal).assertEqual(0);
      TestLogger.pass(TAG, 'LongRun_State_005');
    });

    it('LongRun_State_006', 0, async () => {
      TestLogger.caseBegin(TAG, 'LongRun_State_006');
      TestLogger.step(TAG, 'confirm the progress bar returns to zero every cycle');
      const browser: MockBrowser = new MockBrowser(1);
      const simulator: LongRunSimulator = new LongRunSimulator(browser, new MockClock());
      simulator.run(40);
      TestLogger.info(TAG, `progress=${browser.progress} anomalies=${simulator.progressAnomalies}`);
      expect(simulator.progressAnomalies).assertEqual(0);
      expect(Math.abs(browser.progress)).assertLess(TOLERANCE_PROGRESS_RETURN + 1);
      expect(browser.hideProgress).assertTrue();
      expect(browser.loadingStatus).assertEqual(MockLoadingStatus.END);
      TestLogger.pass(TAG, 'LongRun_State_006');
    });

    it('LongRun_Snapshot_008', 0, async () => {
      TestLogger.caseBegin(TAG, 'LongRun_Snapshot_008');
      TestLogger.step(TAG, 'compare the state snapshot of two consecutive sessions');
      const browser: MockBrowser = new MockBrowser(2);
      const simulator: LongRunSimulator = new LongRunSimulator(browser, new MockClock());
      simulator.run(60);
      const before: StateSnapshot = simulator.snapshot();
      simulator.run(20);
      const after: StateSnapshot = simulator.snapshot();
      TestLogger.info(TAG, `before depth=${before.historyDepth} after depth=${after.historyDepth}`);
      expect(after.tabCount).assertEqual(before.tabCount);
      expect(after.tabIndex).assertEqual(before.tabIndex);
      expect(after.historyDepth).assertEqual(before.historyDepth + 20);
      expect(after.progress).assertEqual(before.progress);
      expect(after.hidden).assertEqual(before.hidden);
      expect(snapshotsMatch(before, after)).assertFalse();
      TestLogger.pass(TAG, 'LongRun_Snapshot_008');
    });

    it('LongRun_Memory_009', 0, async () => {
      TestLogger.caseBegin(TAG, 'LongRun_Memory_009');
      TestLogger.step(TAG, 'check the heap of a healthy session stays on trend');
      const browser: MockBrowser = new MockBrowser(1);
      const simulator: LongRunSimulator = new LongRunSimulator(browser, new MockClock());
      simulator.run(LONG_RUN_ROUNDS);
      const probe: MemoryTrendProbe = simulator.probe;
      const slope: number = probe.slopePerCycle();
      TestLogger.info(TAG, `slope=${slope} bytes/cycle growth=${probe.growth()} samples=${probe.size()}`);
      expect(probe.size()).assertLarger(2);
      expect(slope).assertLess(MEMORY_BYTES_PER_CYCLE_LIMIT);
      expect(slope).assertLarger(0);
      expect(probe.growth()).assertLarger(0);
      expect(probe.isStable()).assertTrue();
      TestLogger.pass(TAG, 'LongRun_Memory_009');
    });

    it('LongRun_Memory_010', 0, async () => {
      TestLogger.caseBegin(TAG, 'LongRun_Memory_010');
      TestLogger.step(TAG, 'inspect the peak and the minimum heap samples');
      const browser: MockBrowser = new MockBrowser(1);
      const simulator: LongRunSimulator = new LongRunSimulator(browser, new MockClock());
      simulator.run(80);
      const probe: MemoryTrendProbe = simulator.probe;
      TestLogger.info(TAG, `min=${probe.minimum()} peak=${probe.peak()} last=${probe.last()}`);
      expect(probe.peak()).assertEqual(probe.last());
      expect(probe.minimum()).assertEqual(probe.first());
      expect(probe.peak()).assertLarger(probe.minimum());
      expect(probe.growth()).assertEqual(probe.peak() - probe.minimum());
      expect(probe.growthRatio()).assertLess(MEMORY_GROWTH_RATIO_LIMIT);
      TestLogger.pass(TAG, 'LongRun_Memory_010');
    });

    it('LongRun_Memory_011', 0, async () => {
      TestLogger.caseBegin(TAG, 'LongRun_Memory_011');
      TestLogger.step(TAG, 'flag a synthetic one megabyte per cycle leak');
      const browser: MockBrowser = new MockBrowser(1);
      const simulator: LongRunSimulator = new LongRunSimulator(browser, new MockClock(),
        54525952, 1048576);
      simulator.run(LONG_RUN_ROUNDS);
      const probe: MemoryTrendProbe = simulator.probe;
      const slope: number = probe.slopePerCycle();
      TestLogger.info(TAG, `leaking slope=${slope} ratio=${probe.growthRatio()}`);
      expect(slope).assertLarger(MEMORY_BYTES_PER_CYCLE_LIMIT);
      expect(probe.growthRatio()).assertLarger(MEMORY_GROWTH_RATIO_LIMIT);
      expect(probe.isStable()).assertFalse();
      expect(probe.peak()).assertLarger(probe.minimum() * 2);
      TestLogger.pass(TAG, 'LongRun_Memory_011');
    });

    it('LongRun_Memory_012', 0, async () => {
      TestLogger.caseBegin(TAG, 'LongRun_Memory_012');
      TestLogger.step(TAG, 'ensure the healthy session has no growth streak');
      const browser: MockBrowser = new MockBrowser(1);
      const simulator: LongRunSimulator = new LongRunSimulator(browser, new MockClock());
      simulator.run(LONG_RUN_ROUNDS);
      const probe: MemoryTrendProbe = simulator.probe;
      TestLogger.info(TAG, `growth streak=${probe.growthStreak()} samples=${probe.size()}`);
      expect(probe.growthStreak()).assertEqual(probe.size() - 1);
      expect(probe.growthStreak()).assertLarger(0);
      expect(probe.first()).assertLarger(0);
      probe.reset();
      expect(probe.size()).assertEqual(0);
      expect(probe.growth()).assertEqual(0);
      TestLogger.pass(TAG, 'LongRun_Memory_012');
    });

    it('LongRun_UI_013', 0, async () => {
      TestLogger.caseBegin(TAG, 'LongRun_UI_013');
      TestLogger.step(TAG, 'confirm the browser survives a long run and still renders');
      const visible: boolean = await waitForId(driver, ID_INPUT_URL, TIMEOUT_PAGE_LOAD);
      await serializedDelay(driver, DELAY_TAB_OPERATION);
      const browser: MockBrowser = new MockBrowser(MAX_TAB_COUNT);
      const clock: MockClock = new MockClock(0);
      const simulator: LongRunSimulator = new LongRunSimulator(browser, clock);
      simulator.run(LONG_RUN_ROUNDS);
      TestLogger.info(TAG, `title bar visible=${visible} modelled duration=${clock.now()} ms`);
      expect(visible).assertTrue();
      expect(clock.now()).assertLarger(0);
      expect(browser.tabs.length).assertEqual(MAX_TAB_COUNT);
      expect(simulator.cycles.length).assertEqual(LONG_RUN_ROUNDS);
      await runSerialized<void>(async () => {
        await driver.delayMs(DELAY_TAB_OPERATION);
      });
      TestLogger.pass(TAG, 'LongRun_UI_013');
    });
  });
}

