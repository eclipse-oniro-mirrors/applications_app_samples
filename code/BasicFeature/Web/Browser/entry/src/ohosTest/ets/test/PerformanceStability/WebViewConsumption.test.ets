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
  getDriver, startBrowserApp, serializedDelay, clickById, countById,
  ID_INPUT_URL, ID_NAV_REFRESH, ID_ACTION_SUBMIT, TIMEOUT_PAGE_LOAD, DELAY_TAB_OPERATION
} from '../Shared/BrowserTestKit';
import { MockClock, MockNetwork } from '../Shared/BrowserMock';

const TAG: string = 'BrowserWebViewConsumptionTest';

/* Power model of the Web container, expressed in milliwatts. */
const LOAD_CPU_MW: number = 1800;
const IDLE_CPU_MW: number = 220;
const SCREEN_MW: number = 900;
const RADIO_MWH_PER_KB: number = 0.00035;
const MILLIS_PER_HOUR: number = 3600000;
const FULL_PERCENT: number = 100;

/* Per sample consumption budgets and their tolerances. */
const CPU_BUDGET_PERCENT: number = 25;
const CPU_TOLERANCE_PERCENT: number = 3;
const MEMORY_BUDGET_MB: number = 220;
const MEMORY_TOLERANCE_MB: number = 12;
const NETWORK_BUDGET_KB: number = 1800;
const NETWORK_TOLERANCE_KB: number = 150;
const ENERGY_BUDGET_MWH: number = 3;
const ENERGY_TOLERANCE_MWH: number = 0.35;

/* Phase comparison and cumulative trend limits. */
const SAMPLES_PER_PHASE: number = 20;
const LOAD_ROUNDS: number = 8;
const IDLE_RATIO_LIMIT: number = 0.35;
const TREND_SLOPE_BUDGET_KB: number = 30;
const CACHE_SAVING_RATIO: number = 0.45;
const BATTERY_CAPACITY_MWH: number = 18000;
const DRAIN_BUDGET_PERCENT: number = 2;

const PHASE_IDLE: string = 'idle';
const PHASE_LOAD: string = 'load';
const VERDICT_PASS: string = 'PASS';
const VERDICT_FAIL: string = 'FAIL';

/** One consumption sample of the WebView container. */
interface ConsumptionSample {
  phase: string;
  cpuPercent: number;
  memoryMb: number;
  networkKb: number;
  elapsedMs: number;
}

/** One cumulative load point used by the trend analyser. */
interface LoadPoint {
  round: number;
  cumulativeKb: number;
  loadMs: number;
}

/**
 * Energy model of one WebView lifecycle window.
 *
 * The CPU term dominates: a page that keeps the compositor busy at thirty
 * percent for two seconds costs far more than the radio transfer itself. The
 * screen is a constant because the browser is foreground during the test.
 */
class EnergyModel {
  private cpuMw: number;
  private screenMw: number;

  constructor(cpuMw: number = LOAD_CPU_MW, screenMw: number = SCREEN_MW) {
    this.cpuMw = cpuMw < 0 ? 0 : cpuMw;
    this.screenMw = screenMw < 0 ? 0 : screenMw;
  }

  /** Static power of the screen during the whole window. */
  screenMwh(elapsedMs: number): number {
    const safeMs: number = elapsedMs < 0 ? 0 : elapsedMs;
    return (this.screenMw * safeMs) / MILLIS_PER_HOUR;
  }

  /** Dynamic CPU power, scaled by the sampled utilisation. */
  cpuMwh(cpuPercent: number, elapsedMs: number): number {
    const safeCpu: number = cpuPercent < 0 ? 0 : (cpuPercent > FULL_PERCENT ? FULL_PERCENT : cpuPercent);
    const safeMs: number = elapsedMs < 0 ? 0 : elapsedMs;
    return (this.cpuMw * (safeCpu / FULL_PERCENT) * safeMs) / MILLIS_PER_HOUR;
  }

  /** Radio energy of the transferred payload. */
  radioMwh(networkKb: number): number {
    const safeKb: number = networkKb < 0 ? 0 : networkKb;
    return safeKb * RADIO_MWH_PER_KB;
  }

  totalMwh(sample: ConsumptionSample): number {
    return this.cpuMwh(sample.cpuPercent, sample.elapsedMs) +
      this.screenMwh(sample.elapsedMs) + this.radioMwh(sample.networkKb);
  }

  idleMwh(elapsedMs: number): number {
    return this.cpuMwh(IDLE_CPU_MW / this.cpuMw * FULL_PERCENT, elapsedMs) + this.screenMwh(elapsedMs);
  }
}

/**
 * Fixed capacity buffer of consumption samples.
 *
 * Peak values are more interesting than averages when judging a WebView: a
 * single 300 MB spike during a heavy page is a real regression even when the
 * mean stays inside the budget.
 */
class SampleBuffer {
  private samples: ConsumptionSample[] = [];
  private capacity: number;

  constructor(capacity: number = 128) {
    this.capacity = capacity <= 0 ? 1 : capacity;
  }

  push(sample: ConsumptionSample): void {
    this.samples.push(sample);
    if (this.samples.length > this.capacity) {
      this.samples.shift();
    }
  }

  count(): number {
    return this.samples.length;
  }

  clear(): void {
    this.samples = [];
  }

  all(): ConsumptionSample[] {
    return this.samples.slice(0);
  }

  byPhase(phase: string): ConsumptionSample[] {
    return this.samples.filter((item: ConsumptionSample) => item.phase === phase);
  }

  meanCpu(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    let sum: number = 0;
    for (let index = 0; index < this.samples.length; index++) {
      sum += this.samples[index].cpuPercent;
    }
    return sum / this.samples.length;
  }

  meanCpuOfPhase(phase: string): number {
    const subset: ConsumptionSample[] = this.byPhase(phase);
    if (subset.length === 0) {
      return 0;
    }
    let sum: number = 0;
    for (let index = 0; index < subset.length; index++) {
      sum += subset[index].cpuPercent;
    }
    return sum / subset.length;
  }

  peakCpu(): number {
    let peak: number = 0;
    for (let index = 0; index < this.samples.length; index++) {
      if (this.samples[index].cpuPercent > peak) {
        peak = this.samples[index].cpuPercent;
      }
    }
    return peak;
  }

  peakMemory(): number {
    let peak: number = 0;
    for (let index = 0; index < this.samples.length; index++) {
      if (this.samples[index].memoryMb > peak) {
        peak = this.samples[index].memoryMb;
      }
    }
    return peak;
  }

  meanMemory(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    let sum: number = 0;
    for (let index = 0; index < this.samples.length; index++) {
      sum += this.samples[index].memoryMb;
    }
    return sum / this.samples.length;
  }

  totalNetworkKb(): number {
    let sum: number = 0;
    for (let index = 0; index < this.samples.length; index++) {
      sum += this.samples[index].networkKb;
    }
    return sum;
  }

  totalElapsedMs(): number {
    let sum: number = 0;
    for (let index = 0; index < this.samples.length; index++) {
      sum += this.samples[index].elapsedMs;
    }
    return sum;
  }
}
/**
 * Threshold policy of one consumption sample.
 *
 * Every limit carries an explicit tolerance so a single noisy sampling window
 * does not turn the suite red, while a systematic overshoot still fails on
 * every run.
 */
class ThresholdPolicy {
  cpuLimit: number = CPU_BUDGET_PERCENT + CPU_TOLERANCE_PERCENT;
  memoryLimit: number = MEMORY_BUDGET_MB + MEMORY_TOLERANCE_MB;
  networkLimit: number = NETWORK_BUDGET_KB + NETWORK_TOLERANCE_KB;
  energyLimit: number = ENERGY_BUDGET_MWH + ENERGY_TOLERANCE_MWH;

  violations(sample: ConsumptionSample, energyMwh: number): string[] {
    const result: string[] = [];
    if (sample.cpuPercent > this.cpuLimit) {
      result.push(`cpu ${sample.cpuPercent}% > ${this.cpuLimit}%`);
    }
    if (sample.memoryMb > this.memoryLimit) {
      result.push(`memory ${sample.memoryMb}MB > ${this.memoryLimit}MB`);
    }
    if (sample.networkKb > this.networkLimit) {
      result.push(`network ${sample.networkKb}KB > ${this.networkLimit}KB`);
    }
    if (energyMwh > this.energyLimit) {
      result.push(`energy ${energyMwh.toFixed(3)}mWh > ${this.energyLimit.toFixed(3)}mWh`);
    }
    return result;
  }

  isCompliant(sample: ConsumptionSample, energyMwh: number): boolean {
    return this.violations(sample, energyMwh).length === 0;
  }

  describe(): string {
    return `cpu<=${this.cpuLimit}% memory<=${this.memoryLimit}MB ` +
      `network<=${this.networkLimit}KB energy<=${this.energyLimit.toFixed(3)}mWh`;
  }
}

/**
 * Idle versus load profiler.
 *
 * The interesting number is the ratio, not the absolute consumption: phones
 * differ by an order of magnitude in absolute power, but an idle browser must
 * remain a small fraction of a loading one on every device.
 */
class PhaseProfiler {
  private buffer: SampleBuffer = new SampleBuffer(256);

  recordIdle(cpuPercent: number, memoryMb: number, networkKb: number, elapsedMs: number): void {
    this.buffer.push({
      phase: PHASE_IDLE, cpuPercent: cpuPercent, memoryMb: memoryMb,
      networkKb: networkKb, elapsedMs: elapsedMs
    });
  }

  recordLoad(cpuPercent: number, memoryMb: number, networkKb: number, elapsedMs: number): void {
    this.buffer.push({
      phase: PHASE_LOAD, cpuPercent: cpuPercent, memoryMb: memoryMb,
      networkKb: networkKb, elapsedMs: elapsedMs
    });
  }

  /** Fills a deterministic idle plateau and a deterministic load plateau. */
  seed(samples: number): number {
    for (let index = 0; index < samples; index++) {
      this.recordIdle(2 + (index % 2), 96 + (index % 3), 1, 500);
      this.recordLoad(22 + (index % 6), 150 + (index % 24), 420 + (index % 60), 500);
    }
    return this.buffer.count();
  }

  idleCpu(): number {
    return this.buffer.meanCpuOfPhase(PHASE_IDLE);
  }

  loadCpu(): number {
    return this.buffer.meanCpuOfPhase(PHASE_LOAD);
  }

  ratio(): number {
    const load: number = this.loadCpu();
    if (load <= 0) {
      return 0;
    }
    return this.idleCpu() / load;
  }

  idleIsCheaper(): boolean {
    return this.idleCpu() < this.loadCpu();
  }

  bufferRef(): SampleBuffer {
    return this.buffer;
  }

  clear(): void {
    this.buffer.clear();
  }
}

/**
 * Cumulative consumption trend over repeated loads.
 *
 * A healthy WebView reclaims its rendering cache after a load, so eight loads
 * of the same page should produce a roughly constant per round increment. A
 * rising slope means the container keeps accumulating native buffers.
 */
class TrendAnalyzer {
  private points: LoadPoint[] = [];
  private cached: boolean = false;

  constructor(cached: boolean = false) {
    this.cached = cached;
  }

  addLoad(round: number, incrementalKb: number, loadMs: number): LoadPoint {
    const safeKb: number = incrementalKb < 0 ? 0 : incrementalKb;
    const previous: number = this.points.length === 0
      ? 0 : this.points[this.points.length - 1].cumulativeKb;
    const point: LoadPoint = {
      round: round, cumulativeKb: previous + safeKb, loadMs: loadMs
    };
    this.points.push(point);
    return point;
  }

  count(): number {
    return this.points.length;
  }

  pointsRef(): LoadPoint[] {
    return this.points.slice(0);
  }

  lastCumulativeKb(): number {
    if (this.points.length === 0) {
      return 0;
    }
    return this.points[this.points.length - 1].cumulativeKb;
  }

  /** Least squares slope over the cumulative series, in KB per load. */
  slope(): number {
    const size: number = this.points.length;
    if (size < 2) {
      return 0;
    }
    let sumX: number = 0;
    let sumY: number = 0;
    let sumXy: number = 0;
    let sumXx: number = 0;
    for (let index = 0; index < size; index++) {
      const x: number = this.points[index].round;
      const y: number = this.points[index].cumulativeKb;
      sumX += x;
      sumY += y;
      sumXy += x * y;
      sumXx += x * x;
    }
    const divisor: number = size * sumXx - sumX * sumX;
    if (divisor === 0) {
      return 0;
    }
    return (size * sumXy - sumX * sumY) / divisor;
  }

  intercept(): number {
    const size: number = this.points.length;
    if (size === 0) {
      return 0;
    }
    let sumX: number = 0;
    let sumY: number = 0;
    for (let index = 0; index < size; index++) {
      sumX += this.points[index].round;
      sumY += this.points[index].cumulativeKb;
    }
    return (sumY - this.slope() * sumX) / size;
  }

  isGrowing(): boolean {
    return this.slope() > 0;
  }

  /** Extrapolates the cumulative series to a future round. */
  project(round: number): number {
    return this.intercept() + this.slope() * round;
  }

  withinSlopeBudget(budget: number = TREND_SLOPE_BUDGET_KB): boolean {
    return this.slope() <= budget;
  }

  perRoundAverage(): number {
    const size: number = this.points.length;
    if (size === 0) {
      return 0;
    }
    return this.lastCumulativeKb() / size;
  }

  isCached(): boolean {
    return this.cached;
  }

  clear(): void {
    this.points = [];
  }
}
/**
 * Battery ledger of a whole consumption scenario.
 *
 * Draining is expressed in percent of the battery capacity so the verdict is
 * comparable between a phone and a tablet without knowing their watt hours.
 */
class BatteryLedger {
  private totalMwh: number = 0;
  private loads: number = 0;
  private budgetMwh: number;

  constructor(budgetMwh: number = ENERGY_BUDGET_MWH * LOAD_ROUNDS) {
    this.budgetMwh = budgetMwh < 0 ? 0 : budgetMwh;
  }

  charge(mwh: number): number {
    const safe: number = mwh < 0 ? 0 : mwh;
    this.totalMwh += safe;
    this.loads += 1;
    return this.totalMwh;
  }

  loadCount(): number {
    return this.loads;
  }

  total(): number {
    return this.totalMwh;
  }

  averagePerLoad(): number {
    if (this.loads === 0) {
      return 0;
    }
    return this.totalMwh / this.loads;
  }

  drainPercent(capacityMwh: number = BATTERY_CAPACITY_MWH): number {
    const safeCapacity: number = capacityMwh <= 0 ? BATTERY_CAPACITY_MWH : capacityMwh;
    return (this.totalMwh / safeCapacity) * FULL_PERCENT;
  }

  withinBudget(): boolean {
    return this.totalMwh <= this.budgetMwh;
  }

  reset(): void {
    this.totalMwh = 0;
    this.loads = 0;
  }
}

/** Joins the sampling, the policy and the energy model into one verdict. */
class ConsumptionReport {
  readonly label: string;
  private buffer: SampleBuffer;
  private policy: ThresholdPolicy;
  private model: EnergyModel;

  constructor(label: string, buffer: SampleBuffer, policy: ThresholdPolicy, model: EnergyModel) {
    this.label = label;
    this.buffer = buffer;
    this.policy = policy;
    this.model = model;
  }

  averageEnergyMwh(): number {
    const samples: ConsumptionSample[] = this.buffer.all();
    if (samples.length === 0) {
      return 0;
    }
    let sum: number = 0;
    for (let index = 0; index < samples.length; index++) {
      sum += this.model.totalMwh(samples[index]);
    }
    return sum / samples.length;
  }

  failingSamples(): number {
    const samples: ConsumptionSample[] = this.buffer.all();
    let counter: number = 0;
    for (let index = 0; index < samples.length; index++) {
      if (!this.policy.isCompliant(samples[index], this.model.totalMwh(samples[index]))) {
        counter += 1;
      }
    }
    return counter;
  }

  verdict(): string {
    if (this.buffer.count() === 0) {
      return VERDICT_FAIL;
    }
    return this.failingSamples() === 0 ? VERDICT_PASS : VERDICT_FAIL;
  }

  line(): string {
    return `${this.label} samples=${this.buffer.count()} avgEnergy=${this.averageEnergyMwh().toFixed(3)}mWh ` +
      `peakCpu=${this.buffer.peakCpu()}% peakMem=${this.buffer.peakMemory()}MB ` +
      `net=${this.buffer.totalNetworkKb()}KB verdict=${this.verdict()}`;
  }
}

export default function browserWebViewConsumptionTest() {
  describe('browserWebViewConsumptionTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'webview consumption suite begin');
      TestLogger.resetSteps(TAG);
      await startBrowserApp();
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('Cons_Energy_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'Cons_Energy_001');
      TestLogger.step(TAG, 'compute the energy of one two second load');
      const model: EnergyModel = new EnergyModel();
      const sample: ConsumptionSample = {
        phase: PHASE_LOAD, cpuPercent: 25, memoryMb: 180, networkKb: 500, elapsedMs: 2000
      };
      const cpu: number = model.cpuMwh(25, 2000);
      const screen: number = model.screenMwh(2000);
      const radio: number = model.radioMwh(500);
      const total: number = model.totalMwh(sample);
      TestLogger.info(TAG, `cpu=${cpu.toFixed(3)} screen=${screen.toFixed(3)} radio=${radio.toFixed(3)} total=${total.toFixed(3)}`);
      expect(cpu.toFixed(3)).assertEqual('0.250');
      expect(screen.toFixed(3)).assertEqual('0.500');
      expect(radio.toFixed(3)).assertEqual('0.175');
      expect(total.toFixed(3)).assertEqual('0.925');
      expect(total).assertLarger(0);
      TestLogger.pass(TAG, 'Cons_Energy_001');
    });

    it('Cons_Energy_002', 0, async () => {
      TestLogger.caseBegin(TAG, 'Cons_Energy_002');
      TestLogger.step(TAG, 'compare an idle window with a loading window');
      const model: EnergyModel = new EnergyModel();
      const idle: number = model.idleMwh(2000);
      const loaded: number = model.totalMwh({
        phase: PHASE_LOAD, cpuPercent: 25, memoryMb: 180, networkKb: 500, elapsedMs: 2000
      });
      TestLogger.info(TAG, `idle=${idle.toFixed(3)} load=${loaded.toFixed(3)}`);
      expect(idle).assertLess(loaded);
      expect(idle).assertLarger(model.screenMwh(2000));
      expect(loaded - idle).assertLarger(0.2);
      expect(idle / loaded).assertLess(0.8);
      TestLogger.pass(TAG, 'Cons_Energy_002');
    });

    it('Cons_Energy_003', 0, async () => {
      TestLogger.caseBegin(TAG, 'Cons_Energy_003');
      TestLogger.step(TAG, 'verify radio energy scales with the payload');
      const model: EnergyModel = new EnergyModel();
      const small: number = model.radioMwh(200);
      const large: number = model.radioMwh(400);
      const zero: number = model.radioMwh(0);
      const negative: number = model.radioMwh(-10);
      TestLogger.info(TAG, `small=${small} large=${large} zero=${zero}`);
      expect(small.toFixed(3)).assertEqual('0.070');
      expect(large.toFixed(3)).assertEqual('0.140');
      expect(large).assertLarger(small);
      expect(zero).assertEqual(0);
      expect(negative).assertEqual(0);
      expect((large / small).toFixed(2)).assertEqual('2.00');
      TestLogger.pass(TAG, 'Cons_Energy_003');
    });

    it('Cons_Sample_004', 0, async () => {
      TestLogger.caseBegin(TAG, 'Cons_Sample_004');
      TestLogger.step(TAG, 'aggregate cpu and memory peaks in the buffer');
      const buffer: SampleBuffer = new SampleBuffer(16);
      buffer.push({ phase: PHASE_LOAD, cpuPercent: 18, memoryMb: 150, networkKb: 100, elapsedMs: 500 });
      buffer.push({ phase: PHASE_LOAD, cpuPercent: 31, memoryMb: 205, networkKb: 300, elapsedMs: 500 });
      buffer.push({ phase: PHASE_LOAD, cpuPercent: 24, memoryMb: 170, networkKb: 200, elapsedMs: 500 });
      TestLogger.info(TAG, `meanCpu=${buffer.meanCpu()} peakCpu=${buffer.peakCpu()} peakMem=${buffer.peakMemory()}`);
      expect(buffer.count()).assertEqual(3);
      expect(buffer.peakCpu()).assertEqual(31);
      expect(buffer.meanCpu().toFixed(2)).assertEqual('24.33');
      expect(buffer.peakMemory()).assertEqual(205);
      expect(buffer.meanMemory()).assertLarger(174);
      expect(buffer.meanMemory()).assertLess(176);
      TestLogger.pass(TAG, 'Cons_Sample_004');
    });

    it('Cons_Sample_005', 0, async () => {
      TestLogger.caseBegin(TAG, 'Cons_Sample_005');
      TestLogger.step(TAG, 'accumulate network and elapsed time across loads');
      const buffer: SampleBuffer = new SampleBuffer(32);
      for (let round = 0; round < LOAD_ROUNDS; round++) {
        buffer.push({
          phase: PHASE_LOAD, cpuPercent: 20 + round, memoryMb: 140 + round * 4,
          networkKb: 100 + round * 10, elapsedMs: 900 + round * 20
        });
      }
      TestLogger.info(TAG, `samples=${buffer.count()} net=${buffer.totalNetworkKb()} elapsed=${buffer.totalElapsedMs()}`);
      expect(buffer.count()).assertEqual(LOAD_ROUNDS);
      expect(buffer.totalNetworkKb()).assertEqual(800 + 10 * 28);
      expect(buffer.totalElapsedMs()).assertEqual(7200 + 20 * 28);
      expect(buffer.byPhase(PHASE_IDLE).length).assertEqual(0);
      expect(buffer.all().length).assertEqual(LOAD_ROUNDS);
      TestLogger.pass(TAG, 'Cons_Sample_005');
    });
    it('Cons_Sample_006', 0, async () => {
      TestLogger.caseBegin(TAG, 'Cons_Sample_006');
      TestLogger.step(TAG, 'separate idle and load phases and count page requests');
      const profiler: PhaseProfiler = new PhaseProfiler();
      const recorded: number = profiler.seed(SAMPLES_PER_PHASE);
      const network: MockNetwork = new MockNetwork();
      network.setLatency(30);
      for (let round = 0; round < 4; round++) {
        network.fetch('https://www.example.com/index.html');
        network.fetch('https://www.example.com/app.css');
        network.fetch('https://www.example.com/app.js');
      }
      const idleCount: number = profiler.bufferRef().byPhase(PHASE_IDLE).length;
      const loadCount: number = profiler.bufferRef().byPhase(PHASE_LOAD).length;
      TestLogger.info(TAG, `recorded=${recorded} idle=${idleCount} load=${loadCount} requests=${network.requestCount()}`);
      expect(recorded).assertEqual(SAMPLES_PER_PHASE * 2);
      expect(idleCount).assertEqual(SAMPLES_PER_PHASE);
      expect(loadCount).assertEqual(SAMPLES_PER_PHASE);
      expect(network.requestCount()).assertEqual(12);
      expect(network.online).assertTrue();
      TestLogger.pass(TAG, 'Cons_Sample_006');
    });

    it('Cons_Idle_007', 0, async () => {
      TestLogger.caseBegin(TAG, 'Cons_Idle_007');
      TestLogger.step(TAG, 'assert the idle cpu stays far below the loading cpu');
      const profiler: PhaseProfiler = new PhaseProfiler();
      profiler.seed(SAMPLES_PER_PHASE);
      const idle: number = profiler.idleCpu();
      const load: number = profiler.loadCpu();
      const ratio: number = profiler.ratio();
      TestLogger.info(TAG, `idle=${idle.toFixed(2)} load=${load.toFixed(2)} ratio=${ratio.toFixed(3)}`);
      expect(profiler.idleIsCheaper()).assertTrue();
      expect(idle).assertLess(load);
      expect(ratio).assertLess(IDLE_RATIO_LIMIT);
      expect(idle).assertLess(6);
      expect(load).assertLarger(20);
      expect(ratio).assertLarger(0);
      TestLogger.pass(TAG, 'Cons_Idle_007');
    });

    it('Cons_Load_008', 0, async () => {
      TestLogger.caseBegin(TAG, 'Cons_Load_008');
      TestLogger.step(TAG, 'verify a normal page load stays inside every budget');
      const model: EnergyModel = new EnergyModel();
      const policy: ThresholdPolicy = new ThresholdPolicy();
      const sample: ConsumptionSample = {
        phase: PHASE_LOAD, cpuPercent: 24, memoryMb: 186, networkKb: 940, elapsedMs: 2400
      };
      const energy: number = model.totalMwh(sample);
      const violations: string[] = policy.violations(sample, energy);
      TestLogger.info(TAG, `${policy.describe()} energy=${energy.toFixed(3)} violations=${violations.length}`);
      expect(violations.length).assertEqual(0);
      expect(policy.isCompliant(sample, energy)).assertTrue();
      expect(sample.cpuPercent).assertLess(policy.cpuLimit);
      expect(sample.memoryMb).assertLess(policy.memoryLimit);
      expect(sample.networkKb).assertLess(policy.networkLimit);
      expect(energy).assertLess(policy.energyLimit);
      TestLogger.pass(TAG, 'Cons_Load_008');
    });

    it('Cons_Trend_010', 0, async () => {
      TestLogger.caseBegin(TAG, 'Cons_Trend_010');
      TestLogger.step(TAG, 'accumulate eight cached loads and check monotonic growth');
      const trend: TrendAnalyzer = new TrendAnalyzer(true);
      const clock: MockClock = new MockClock();
      let previous: number = 0;
      let monotonic: boolean = true;
      for (let round = 0; round < LOAD_ROUNDS; round++) {
        clock.advance(1100);
        const point: LoadPoint = trend.addLoad(round, 24 + (round % 3), clock.now() - 1700000000000);
        if (point.cumulativeKb < previous) {
          monotonic = false;
        }
        previous = point.cumulativeKb;
      }
      TestLogger.info(TAG, `points=${trend.count()} last=${trend.lastCumulativeKb()}KB slope=${trend.slope().toFixed(2)}`);
      expect(trend.count()).assertEqual(LOAD_ROUNDS);
      expect(monotonic).assertTrue();
      expect(trend.isGrowing()).assertTrue();
      expect(trend.lastCumulativeKb()).assertLarger(180);
      expect(trend.pointsRef().length).assertEqual(LOAD_ROUNDS);
      expect(trend.isCached()).assertTrue();
      TestLogger.pass(TAG, 'Cons_Trend_010');
    });

    it('Cons_Trend_011', 0, async () => {
      TestLogger.caseBegin(TAG, 'Cons_Trend_011');
      TestLogger.step(TAG, 'keep the cached slope inside the trend budget');
      const trend: TrendAnalyzer = new TrendAnalyzer(true);
      for (let round = 0; round < LOAD_ROUNDS; round++) {
        trend.addLoad(round, 24 + (round % 3), 800 + round * 10);
      }
      const slope: number = trend.slope();
      TestLogger.info(TAG, `slope=${slope.toFixed(2)} budget=${TREND_SLOPE_BUDGET_KB} avg=${trend.perRoundAverage().toFixed(2)}`);
      expect(trend.withinSlopeBudget(TREND_SLOPE_BUDGET_KB)).assertTrue();
      expect(slope).assertLess(TREND_SLOPE_BUDGET_KB);
      expect(slope).assertLarger(20);
      expect(trend.intercept()).assertLarger(0);
      expect(trend.project(LOAD_ROUNDS)).assertLarger(trend.project(LOAD_ROUNDS - 1));
      TestLogger.pass(TAG, 'Cons_Trend_011');
    });

    it('Cons_Trend_012', 0, async () => {
      TestLogger.caseBegin(TAG, 'Cons_Trend_012');
      TestLogger.step(TAG, 'detect an uncached trend that grows every round');
      const trend: TrendAnalyzer = new TrendAnalyzer(false);
      for (let round = 0; round < LOAD_ROUNDS; round++) {
        trend.addLoad(round, 20 + round * 20, 900 + round * 40);
      }
      const slope: number = trend.slope();
      const projected: number = trend.project(LOAD_ROUNDS * 2);
      TestLogger.info(TAG, `slope=${slope.toFixed(2)} projected=${projected.toFixed(0)}KB`);
      expect(trend.withinSlopeBudget(TREND_SLOPE_BUDGET_KB)).assertFalse();
      expect(slope).assertLarger(TREND_SLOPE_BUDGET_KB);
      expect(projected).assertLarger(trend.project(LOAD_ROUNDS));
      expect(trend.isGrowing()).assertTrue();
      expect(trend.perRoundAverage()).assertLarger(0);
      TestLogger.pass(TAG, 'Cons_Trend_012');
    });
    it('Cons_Threshold_013', 0, async () => {
      TestLogger.caseBegin(TAG, 'Cons_Threshold_013');
      TestLogger.step(TAG, 'probe the inclusive boundary of every threshold');
      const model: EnergyModel = new EnergyModel();
      const policy: ThresholdPolicy = new ThresholdPolicy();
      const atLimit: ConsumptionSample = {
        phase: PHASE_LOAD, cpuPercent: policy.cpuLimit, memoryMb: policy.memoryLimit,
        networkKb: policy.networkLimit, elapsedMs: 500
      };
      const overLimit: ConsumptionSample = {
        phase: PHASE_LOAD, cpuPercent: policy.cpuLimit + 0.5, memoryMb: policy.memoryLimit + 0.5,
        networkKb: policy.networkLimit + 1, elapsedMs: 500
      };
      TestLogger.info(TAG, `cpuLimit=${policy.cpuLimit} memLimit=${policy.memoryLimit}`);
      expect(policy.isCompliant(atLimit, policy.energyLimit)).assertTrue();
      expect(policy.violations(atLimit, policy.energyLimit).length).assertEqual(0);
      expect(policy.isCompliant(overLimit, policy.energyLimit)).assertFalse();
      expect(policy.violations(overLimit, policy.energyLimit).length).assertEqual(3);
      expect(policy.cpuLimit).assertEqual(CPU_BUDGET_PERCENT + CPU_TOLERANCE_PERCENT);
      expect(policy.memoryLimit).assertEqual(MEMORY_BUDGET_MB + MEMORY_TOLERANCE_MB);
      expect(model.radioMwh(policy.networkLimit)).assertLarger(0);
      TestLogger.pass(TAG, 'Cons_Threshold_013');
    });

    it('Cons_Ledger_014', 0, async () => {
      TestLogger.caseBegin(TAG, 'Cons_Ledger_014');
      TestLogger.step(TAG, 'sum eight load windows into a battery ledger');
      const model: EnergyModel = new EnergyModel();
      const ledger: BatteryLedger = new BatteryLedger();
      for (let round = 0; round < LOAD_ROUNDS; round++) {
        ledger.charge(model.totalMwh({
          phase: PHASE_LOAD, cpuPercent: 24, memoryMb: 186, networkKb: 940, elapsedMs: 2400
        }));
      }
      const drain: number = ledger.drainPercent();
      TestLogger.info(TAG, `loads=${ledger.loadCount()} total=${ledger.total().toFixed(3)}mWh drain=${drain.toFixed(4)}%`);
      expect(ledger.loadCount()).assertEqual(LOAD_ROUNDS);
      expect(ledger.total()).assertLarger(ENERGY_BUDGET_MWH);
      expect(ledger.withinBudget()).assertTrue();
      expect(ledger.averagePerLoad()).assertLess(ENERGY_BUDGET_MWH);
      expect(drain).assertLess(DRAIN_BUDGET_PERCENT);
      expect(drain).assertLarger(0);
      ledger.reset();
      expect(ledger.total()).assertEqual(0);
      expect(ledger.loadCount()).assertEqual(0);
      TestLogger.pass(TAG, 'Cons_Ledger_014');
    });

    it('Cons_Report_015', 0, async () => {
      TestLogger.caseBegin(TAG, 'Cons_Report_015');
      TestLogger.step(TAG, 'render a consumption report before and after a heavy load');
      const model: EnergyModel = new EnergyModel();
      const policy: ThresholdPolicy = new ThresholdPolicy();
      const buffer: SampleBuffer = new SampleBuffer(32);
      for (let round = 0; round < 3; round++) {
        buffer.push({
          phase: PHASE_LOAD, cpuPercent: 20 + round, memoryMb: 150 + round * 10,
          networkKb: 300 + round * 20, elapsedMs: 1200
        });
      }
      const report: ConsumptionReport = new ConsumptionReport('normal-load', buffer, policy, model);
      const line: string = report.line();
      TestLogger.info(TAG, line);
      expect(report.failingSamples()).assertEqual(0);
      expect(report.verdict()).assertEqual(VERDICT_PASS);
      expect(line).assertContain('normal-load');
      expect(line).assertContain('verdict=');
      expect(report.averageEnergyMwh()).assertLarger(0);
      buffer.push({
        phase: PHASE_LOAD, cpuPercent: 88, memoryMb: 320,
        networkKb: 3200, elapsedMs: 6000
      });
      TestLogger.info(TAG, `after heavy push fail=${report.failingSamples()} verdict=${report.verdict()}`);
      expect(report.failingSamples()).assertEqual(1);
      expect(report.verdict()).assertEqual(VERDICT_FAIL);
      TestLogger.pass(TAG, 'Cons_Report_015');
    });

    it('Cons_UI_016', 0, async () => {
      TestLogger.caseBegin(TAG, 'Cons_UI_016');
      TestLogger.step(TAG, 'refresh three times and keep the container footprint stable');
      const before: number = await countById(driver, ID_INPUT_URL);
      for (let round = 0; round < 3; round++) {
        await clickById(driver, ID_NAV_REFRESH);
        await serializedDelay(driver, DELAY_TAB_OPERATION);
      }
      const after: number = await countById(driver, ID_INPUT_URL);
      const submitCount: number = await countById(driver, ID_ACTION_SUBMIT);
      const model: EnergyModel = new EnergyModel();
      const windowEnergy: number = model.totalMwh({
        phase: PHASE_LOAD, cpuPercent: 18, memoryMb: 150, networkKb: 300,
        elapsedMs: TIMEOUT_PAGE_LOAD
      });
      TestLogger.info(TAG, `input ${before} -> ${after}, submit=${submitCount} windowEnergy=${windowEnergy.toFixed(3)}mWh`);
      expect(before).assertLarger(0);
      expect(after).assertEqual(before);
      expect(submitCount).assertLarger(0);
      expect(windowEnergy).assertLess(ENERGY_BUDGET_MWH + ENERGY_TOLERANCE_MWH);
      expect(windowEnergy).assertLarger(0);
      TestLogger.pass(TAG, 'Cons_UI_016');
    });

    it('Cons_Reset_017', 0, async () => {
      TestLogger.caseBegin(TAG, 'Cons_Reset_017');
      TestLogger.step(TAG, 'reset every accumulator before the next scenario');
      const profiler: PhaseProfiler = new PhaseProfiler();
      profiler.seed(3);
      const trend: TrendAnalyzer = new TrendAnalyzer(true);
      trend.addLoad(0, 20, 800);
      trend.addLoad(1, 22, 820);
      const ledger: BatteryLedger = new BatteryLedger();
      ledger.charge(1.5);
      const buffer: SampleBuffer = new SampleBuffer(4);
      buffer.push({ phase: PHASE_LOAD, cpuPercent: 20, memoryMb: 140, networkKb: 100, elapsedMs: 400 });
      profiler.clear();
      trend.clear();
      ledger.reset();
      buffer.clear();
      TestLogger.info(TAG, `phaseSamples=${profiler.bufferRef().count()} trend=${trend.count()} ledger=${ledger.total()}`);
      expect(profiler.bufferRef().count()).assertEqual(0);
      expect(trend.count()).assertEqual(0);
      expect(trend.slope()).assertEqual(0);
      expect(trend.lastCumulativeKb()).assertEqual(0);
      expect(ledger.total()).assertEqual(0);
      expect(ledger.withinBudget()).assertTrue();
      expect(buffer.count()).assertEqual(0);
      expect(buffer.totalNetworkKb()).assertEqual(0);
      TestLogger.pass(TAG, 'Cons_Reset_017');
    });
  });
}
