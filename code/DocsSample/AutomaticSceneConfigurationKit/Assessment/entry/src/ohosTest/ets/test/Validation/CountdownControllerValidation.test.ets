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

import { afterAll, beforeAll, describe, expect, it } from '@ohos/hypium';
import { Component, Driver } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {
  ID_INDEX_TITLE,
  ID_EXAM_TITLE,
  TIMEOUT_PAGE_TRANSITION,
  serializedDelay,
  getDriver,
  launchAssessmentApp,
  findById,
  checkTextContent,
  waitForIndexPage,
  waitForExamPage,
  pressAndWait
} from '../Shared/AssessmentDriver';
import { clickSerialized, inputTextSerialized, getTextSerialized, clickPointSerialized } from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// Candidate durations of AssessmentConfig.duration, they are the same values the sample
// publishes through AssessmentConstants.
const DURATION_DEFAULT: number = 0;
const DURATION_TEN_MINUTES: number = 600000;
const DURATION_THIRTY_MINUTES: number = 1800000;
const DURATION_SIXTY_MINUTES: number = 3600000;

const MILLIS_PER_SECOND: number = 1000;
const SECONDS_PER_MINUTE: number = 60;
const MILLIS_PER_MINUTE: number = 60000;
const COUNTDOWN_INTERVAL: number = 1000;
const TEXT_PAD_LENGTH: number = 2;

// The exam page switches the countdown text colour to the warning colour as soon as the
// remaining time drops to one minute.
const WARNING_THRESHOLD_SECONDS: number = 60;

/**
 * Lifecycle phases of the countdown engine.
 */
enum CountdownPhase {
  IDLE = 'idle',
  RUNNING = 'running',
  PAUSED = 'paused',
  FINISHED = 'finished'
}

/**
 * Visual format of a countdown value.
 */
enum CountdownFormat {
  MM_SS = 'mm_ss',
  HH_MM_SS = 'hh_mm_ss',
  SECONDS_ONLY = 'seconds_only'
}

/**
 * Severity of the countdown display, it mirrors the colour selection of the exam page.
 */
enum CountdownSeverity {
  NORMAL = 'normal',
  WARNING = 'warning',
  EXPIRED = 'expired'
}

/**
 * Immutable snapshot of the countdown engine.
 */
interface CountdownSnapshot {
  durationMs: number;
  remainingSeconds: number;
  elapsedSeconds: number;
  phase: CountdownPhase;
  severity: CountdownSeverity;
}

/**
 * One processed tick of the countdown.
 */
interface TickRecord {
  tickIndex: number;
  remainingSeconds: number;
  timestamp: number;
  processingMs: number;
}

/**
 * Aggregated tick timing metrics.
 */
interface CountdownMetrics {
  totalTicks: number;
  minTickMs: number;
  maxTickMs: number;
  averageTickMs: number;
}

/**
 * Result of one pause or resume request.
 */
interface TransitionResult {
  accepted: boolean;
  from: CountdownPhase;
  to: CountdownPhase;
  reason: string;
}

/**
 * Duration catalogue of the configuration card.
 */
class DurationCatalog {
  private candidates: number[] = [
    DURATION_DEFAULT,
    DURATION_TEN_MINUTES,
    DURATION_THIRTY_MINUTES,
    DURATION_SIXTY_MINUTES
  ];

  public getCandidates(): number[] {
    return this.candidates.slice();
  }

  public count(): number {
    return this.candidates.length;
  }

  public contains(duration: number): boolean {
    return this.candidates.indexOf(duration) >= 0;
  }

  public indexOf(duration: number): number {
    return this.candidates.indexOf(duration);
  }

  public candidateAt(index: number): number {
    if (index < 0 || index >= this.candidates.length) {
      return -1;
    }
    return this.candidates[index];
  }

  // The candidate list must stay strictly increasing, the configuration card relies on it.
  public isStrictlyIncreasing(): boolean {
    for (let i = 1; i < this.candidates.length; i++) {
      if (this.candidates[i] <= this.candidates[i - 1]) {
        return false;
      }
    }
    return true;
  }

  public minutesOf(duration: number): number {
    return duration / MILLIS_PER_MINUTE;
  }

  public secondsOf(duration: number): number {
    return duration / MILLIS_PER_SECOND;
  }
}

/**
 * Formatter of the remaining time, it reproduces formatRemaining of ExamPage.
 */
class CountdownFormatter {
  public format(durationMs: number): string {
    const totalSeconds: number = Math.floor(durationMs / MILLIS_PER_SECOND);
    return this.formatSeconds(totalSeconds);
  }

  public formatSeconds(totalSeconds: number): string {
    const safeSeconds: number = totalSeconds > 0 ? totalSeconds : 0;
    const minutes: number = Math.floor(safeSeconds / SECONDS_PER_MINUTE);
    const seconds: number = safeSeconds % SECONDS_PER_MINUTE;
    const minuteText: string = `${minutes}`.padStart(TEXT_PAD_LENGTH, '0');
    const secondText: string = `${seconds}`.padStart(TEXT_PAD_LENGTH, '0');
    return `${minuteText}:${secondText}`;
  }

  public formatWithStyle(totalSeconds: number, style: CountdownFormat): string {
    const safeSeconds: number = totalSeconds > 0 ? totalSeconds : 0;
    if (style === CountdownFormat.SECONDS_ONLY) {
      return `${safeSeconds}`.padStart(TEXT_PAD_LENGTH, '0');
    }
    if (style === CountdownFormat.HH_MM_SS) {
      const hours: number = Math.floor(safeSeconds / (SECONDS_PER_MINUTE * SECONDS_PER_MINUTE));
      const minutes: number = Math.floor(safeSeconds / SECONDS_PER_MINUTE) % SECONDS_PER_MINUTE;
      const seconds: number = safeSeconds % SECONDS_PER_MINUTE;
      const hourText: string = `${hours}`.padStart(TEXT_PAD_LENGTH, '0');
      const minuteText: string = `${minutes}`.padStart(TEXT_PAD_LENGTH, '0');
      const secondText: string = `${seconds}`.padStart(TEXT_PAD_LENGTH, '0');
      return `${hourText}:${minuteText}:${secondText}`;
    }
    return this.formatSeconds(safeSeconds);
  }

  // The formatter always emits a two digit minute field, so a value above 99 minutes keeps
  // growing instead of wrapping around.
  public minuteFieldWidth(totalSeconds: number): number {
    const minutes: number = Math.floor(totalSeconds / SECONDS_PER_MINUTE);
    return `${minutes}`.length;
  }

  public isWellFormed(text: string): boolean {
    if (text.length < 5) {
      return false;
    }
    const colonIndex: number = text.indexOf(':');
    if (colonIndex < TEXT_PAD_LENGTH) {
      return false;
    }
    if (colonIndex !== text.length - 3) {
      return false;
    }
    return true;
  }

  public severityOf(remainingSeconds: number): CountdownSeverity {
    if (remainingSeconds <= 0) {
      return CountdownSeverity.EXPIRED;
    }
    if (remainingSeconds <= WARNING_THRESHOLD_SECONDS) {
      return CountdownSeverity.WARNING;
    }
    return CountdownSeverity.NORMAL;
  }
}

/**
 * Countdown engine that mirrors the timer loop of ExamPage.
 *
 * The engine is fully synchronous: a tick is processed by an explicit call so that the
 * cases do not depend on real timers and finish deterministically on every device.
 */
class CountdownEngine {
  private durationMs: number;
  private remainingSeconds: number;
  private phase: CountdownPhase;
  private history: TickRecord[] = [];
  private tickCounter: number = 0;
  private observer: CountdownObserver | null = null;

  public constructor(durationMs: number) {
    this.durationMs = durationMs;
    this.remainingSeconds = Math.floor(durationMs / MILLIS_PER_SECOND);
    this.phase = CountdownPhase.IDLE;
  }

  public attachObserver(observer: CountdownObserver): void {
    this.observer = observer;
  }

  public getDurationMs(): number {
    return this.durationMs;
  }

  public getRemainingSeconds(): number {
    return this.remainingSeconds;
  }

  public getPhase(): CountdownPhase {
    return this.phase;
  }

  public getTickCount(): number {
    return this.history.length;
  }

  public getHistory(): TickRecord[] {
    return this.history.slice();
  }

  // ExamPage only starts the timer when the configured duration is a real limit.
  public start(): boolean {
    if (this.phase === CountdownPhase.RUNNING) {
      return false;
    }
    if (this.remainingSeconds <= 0) {
      this.phase = CountdownPhase.FINISHED;
      return false;
    }
    this.phase = CountdownPhase.RUNNING;
    this.notify('start');
    return true;
  }

  public pause(): TransitionResult {
    return this.applyTransition(CountdownPhase.PAUSED, 'pause');
  }

  public resume(): TransitionResult {
    return this.applyTransition(CountdownPhase.RUNNING, 'resume');
  }

  private applyTransition(target: CountdownPhase, reason: string): TransitionResult {
    const from: CountdownPhase = this.phase;
    const accepted: boolean = this.canTransitionTo(target);
    if (accepted) {
      this.phase = target;
    }
    const result: TransitionResult = {
      accepted: accepted,
      from: from,
      to: accepted ? target : from,
      reason: accepted ? reason : `${reason} rejected`
    };
    return result;
  }

  public canTransitionTo(target: CountdownPhase): boolean {
    if (this.phase === target) {
      return false;
    }
    if (this.phase === CountdownPhase.FINISHED) {
      return false;
    }
    if (target === CountdownPhase.RUNNING) {
      return this.phase === CountdownPhase.IDLE || this.phase === CountdownPhase.PAUSED;
    }
    if (target === CountdownPhase.PAUSED) {
      return this.phase === CountdownPhase.RUNNING;
    }
    if (target === CountdownPhase.FINISHED) {
      return this.phase === CountdownPhase.RUNNING || this.phase === CountdownPhase.PAUSED;
    }
    if (target === CountdownPhase.IDLE) {
      return false;
    }
    return false;
  }

  // Processes one interval tick. The engine stops as soon as the value reaches zero, which
  // is exactly what stopCountdown does on the exam page.
  public tick(processingMs: number): boolean {
    if (this.phase !== CountdownPhase.RUNNING) {
      return false;
    }
    if (this.remainingSeconds <= 0) {
      this.phase = CountdownPhase.FINISHED;
      return false;
    }
    const measured: number = processingMs > 0 ? processingMs : 0;
    this.remainingSeconds -= 1;
    this.tickCounter += 1;
    const record: TickRecord = {
      tickIndex: this.tickCounter,
      remainingSeconds: this.remainingSeconds,
      timestamp: Date.now(),
      processingMs: measured
    };
    this.history.push(record);
    this.notify('tick');
    if (this.remainingSeconds <= 0) {
      this.phase = CountdownPhase.FINISHED;
      this.notify('finish');
    }
    return true;
  }

  public tickDown(count: number): number {
    let processed: number = 0;
    for (let i = 0; i < count; i++) {
      if (!this.tick(0)) {
        break;
      }
      processed++;
    }
    return processed;
  }

  public reset(): void {
    this.remainingSeconds = Math.floor(this.durationMs / MILLIS_PER_SECOND);
    this.history = [];
    this.tickCounter = 0;
    this.phase = CountdownPhase.IDLE;
    this.notify('reset');
  }

  public resetTo(durationMs: number): void {
    this.durationMs = durationMs;
    this.reset();
  }

  public isExpired(): boolean {
    return this.remainingSeconds <= 0;
  }

  public isRunning(): boolean {
    return this.phase === CountdownPhase.RUNNING;
  }

  public elapsedSeconds(): number {
    const total: number = Math.floor(this.durationMs / MILLIS_PER_SECOND);
    const elapsed: number = total - this.remainingSeconds;
    return elapsed > 0 ? elapsed : 0;
  }

  // Progress in percent, it is clamped so that a stale tick cannot produce a negative rate.
  public progressPercent(): number {
    const total: number = Math.floor(this.durationMs / MILLIS_PER_SECOND);
    if (total <= 0) {
      return 100;
    }
    const elapsed: number = total - this.remainingSeconds;
    if (elapsed <= 0) {
      return 0;
    }
    if (elapsed >= total) {
      return 100;
    }
    return (elapsed / total) * 100;
  }

  public remainingRatio(): number {
    const total: number = Math.floor(this.durationMs / MILLIS_PER_SECOND);
    if (total <= 0) {
      return 0;
    }
    const ratio: number = this.remainingSeconds / total;
    return ratio < 0 ? 0 : ratio;
  }

  public snapshot(): CountdownSnapshot {
    const formatter: CountdownFormatter = new CountdownFormatter();
    return {
      durationMs: this.durationMs,
      remainingSeconds: this.remainingSeconds,
      elapsedSeconds: this.elapsedSeconds(),
      phase: this.phase,
      severity: formatter.severityOf(this.remainingSeconds)
    };
  }

  public formatted(): string {
    const formatter: CountdownFormatter = new CountdownFormatter();
    return formatter.formatSeconds(this.remainingSeconds);
  }

  private notify(event: string): void {
    if (this.observer === null) {
      return;
    }
    this.observer.onEvent(event, this.snapshot());
  }
}

/**
 * Observer that records every engine event in order.
 */
class CountdownObserver {
  private events: string[] = [];
  private snapshots: CountdownSnapshot[] = [];

  public onEvent(event: string, snapshot: CountdownSnapshot): void {
    this.events.push(event);
    this.snapshots.push(snapshot);
  }

  public getEvents(): string[] {
    return this.events.slice();
  }

  public getSnapshots(): CountdownSnapshot[] {
    return this.snapshots.slice();
  }

  public countOf(event: string): number {
    let count: number = 0;
    for (let i = 0; i < this.events.length; i++) {
      if (this.events[i] === event) {
        count++;
      }
    }
    return count;
  }

  public lastEvent(): string {
    if (this.events.length === 0) {
      return '';
    }
    return this.events[this.events.length - 1];
  }

  public clear(): void {
    this.events = [];
    this.snapshots = [];
  }
}

/**
 * Timing calculator over the recorded ticks.
 */
class CountdownMetricsCalculator {
  private records: TickRecord[];

  public constructor(records: TickRecord[]) {
    this.records = records;
  }

  public totalTicks(): number {
    return this.records.length;
  }

  public minTickMs(): number {
    let min: number = Number.MAX_SAFE_INTEGER;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].processingMs < min) {
        min = this.records[i].processingMs;
      }
    }
    return min === Number.MAX_SAFE_INTEGER ? 0 : min;
  }

  public maxTickMs(): number {
    let max: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].processingMs > max) {
        max = this.records[i].processingMs;
      }
    }
    return max;
  }

  public averageTickMs(): number {
    if (this.records.length === 0) {
      return 0;
    }
    let sum: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      sum += this.records[i].processingMs;
    }
    return sum / this.records.length;
  }

  public aggregate(): CountdownMetrics {
    return {
      totalTicks: this.totalTicks(),
      minTickMs: this.minTickMs(),
      maxTickMs: this.maxTickMs(),
      averageTickMs: this.averageTickMs()
    };
  }

  // The remaining time must decrease by exactly one second per tick.
  public isMonotonic(): boolean {
    for (let i = 1; i < this.records.length; i++) {
      const delta: number = this.records[i - 1].remainingSeconds - this.records[i].remainingSeconds;
      if (delta !== 1) {
        return false;
      }
    }
    return true;
  }

  public isChronological(): boolean {
    for (let i = 1; i < this.records.length; i++) {
      if (this.records[i].timestamp < this.records[i - 1].timestamp) {
        return false;
      }
    }
    return true;
  }

  public tickIndicesContinuous(): boolean {
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].tickIndex !== i + 1) {
        return false;
      }
    }
    return true;
  }
}

/**
 * Invariant checker of a countdown snapshot.
 */
class CountdownInvariants {
  public remainingWithinRange(snapshot: CountdownSnapshot): boolean {
    const totalSeconds: number = Math.floor(snapshot.durationMs / MILLIS_PER_SECOND);
    return snapshot.remainingSeconds >= 0 && snapshot.remainingSeconds <= totalSeconds;
  }

  public elapsedConsistent(snapshot: CountdownSnapshot): boolean {
    const totalSeconds: number = Math.floor(snapshot.durationMs / MILLIS_PER_SECOND);
    return snapshot.elapsedSeconds + snapshot.remainingSeconds === totalSeconds;
  }

  public finishedImpliesExpired(snapshot: CountdownSnapshot): boolean {
    if (snapshot.phase === CountdownPhase.FINISHED) {
      return snapshot.remainingSeconds === 0;
    }
    return true;
  }

  public severityMatches(snapshot: CountdownSnapshot): boolean {
    const formatter: CountdownFormatter = new CountdownFormatter();
    return formatter.severityOf(snapshot.remainingSeconds) === snapshot.severity;
  }

  public allHold(snapshot: CountdownSnapshot): boolean {
    return this.remainingWithinRange(snapshot) && this.elapsedConsistent(snapshot) &&
      this.finishedImpliesExpired(snapshot) && this.severityMatches(snapshot);
  }
}

/**
 * Builds tick records without touching a real timer, the cases use it for the metrics.
 */
class TickRecordBuilder {
  public static build(count: number, stepMs: number): TickRecord[] {
    const records: TickRecord[] = [];
    for (let i = 0; i < count; i++) {
      records.push({
        tickIndex: i + 1,
        remainingSeconds: 120 - i,
        timestamp: i * 1000,
        processingMs: stepMs
      });
    }
    return records;
  }

  public static buildWithTimings(timings: number[]): TickRecord[] {
    const records: TickRecord[] = [];
    for (let i = 0; i < timings.length; i++) {
      records.push({
        tickIndex: i + 1,
        remainingSeconds: 300 - i,
        timestamp: i * 1000,
        processingMs: timings[i]
      });
    }
    return records;
  }
}

export default function countdownControllerValidationTest() {
  describe('CountdownControllerValidation_Test', () => {
    let driver: Driver;
    let catalog: DurationCatalog;
    let formatter: CountdownFormatter;
    let invariants: CountdownInvariants;

    beforeAll(async () => {
      driver = getDriver();
      catalog = new DurationCatalog();
      formatter = new CountdownFormatter();
      invariants = new CountdownInvariants();
      await serializedDelay(driver, 1000);
    });

    afterAll(async () => {
      await pressAndWait(driver, 2, 2, 50);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: the duration catalogue matches AssessmentConstants.
     * Expectation: four candidates, default zero, then ten, thirty and sixty minutes.
     */
    it('Assessment_CountdownDurationCatalog_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownDurationCatalog_001, begin');
      const candidates: number[] = catalog.getCandidates();
      expect(candidates.length).assertEqual(4);
      expect(catalog.count()).assertEqual(4);
      expect(candidates[0]).assertEqual(0);
      expect(candidates[1]).assertEqual(600000);
      expect(candidates[2]).assertEqual(1800000);
      expect(candidates[3]).assertEqual(3600000);
      expect(catalog.isStrictlyIncreasing()).assertTrue();
      expect(catalog.contains(DURATION_THIRTY_MINUTES)).assertTrue();
      expect(catalog.contains(12345)).assertFalse();
      expect(catalog.indexOf(DURATION_SIXTY_MINUTES)).assertEqual(3);
      expect(catalog.indexOf(42)).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownDurationCatalog_001, end');
    });

    /**
     * Scenario: index based access of the catalogue.
     * Expectation: out of range indices answer the invalid sentinel instead of throwing.
     */
    it('Assessment_CountdownCatalogIndexAccess_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownCatalogIndexAccess_002, begin');
      expect(catalog.candidateAt(0)).assertEqual(DURATION_DEFAULT);
      expect(catalog.candidateAt(1)).assertEqual(DURATION_TEN_MINUTES);
      expect(catalog.candidateAt(2)).assertEqual(DURATION_THIRTY_MINUTES);
      expect(catalog.candidateAt(3)).assertEqual(DURATION_SIXTY_MINUTES);
      expect(catalog.candidateAt(4)).assertEqual(-1);
      expect(catalog.candidateAt(-1)).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownCatalogIndexAccess_002, end');
    });

    /**
     * Scenario: duration to minute and second conversion.
     * Expectation: the catalogue converts every candidate with the documented factors.
     */
    it('Assessment_CountdownDurationConversion_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownDurationConversion_003, begin');
      expect(catalog.minutesOf(DURATION_TEN_MINUTES)).assertEqual(10);
      expect(catalog.minutesOf(DURATION_THIRTY_MINUTES)).assertEqual(30);
      expect(catalog.minutesOf(DURATION_SIXTY_MINUTES)).assertEqual(60);
      expect(catalog.secondsOf(DURATION_TEN_MINUTES)).assertEqual(600);
      expect(catalog.secondsOf(DURATION_DEFAULT)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownDurationConversion_003, end');
    });

    /**
     * Scenario: engine initialization for the default duration.
     * Expectation: zero remaining seconds, idle phase, expired and not running.
     */
    it('Assessment_CountdownEngineDefaultDuration_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownEngineDefaultDuration_004, begin');
      const engine: CountdownEngine = new CountdownEngine(DURATION_DEFAULT);
      expect(engine.getDurationMs()).assertEqual(0);
      expect(engine.getRemainingSeconds()).assertEqual(0);
      expect(engine.getPhase()).assertEqual(CountdownPhase.IDLE);
      expect(engine.isExpired()).assertTrue();
      expect(engine.isRunning()).assertFalse();
      expect(engine.getTickCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownEngineDefaultDuration_004, end');
    });

    /**
     * Scenario: remainingSeconds is floor(duration / 1000).
     * Expectation: the ten minute candidate yields exactly 600 seconds.
     */
    it('Assessment_CountdownRemainingSecondsInit_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownRemainingSecondsInit_005, begin');
      const ten: CountdownEngine = new CountdownEngine(DURATION_TEN_MINUTES);
      const thirty: CountdownEngine = new CountdownEngine(DURATION_THIRTY_MINUTES);
      const sixty: CountdownEngine = new CountdownEngine(DURATION_SIXTY_MINUTES);
      expect(ten.getRemainingSeconds()).assertEqual(600);
      expect(thirty.getRemainingSeconds()).assertEqual(1800);
      expect(sixty.getRemainingSeconds()).assertEqual(3600);
      expect(new CountdownEngine(1500).getRemainingSeconds()).assertEqual(1);
      expect(new CountdownEngine(999).getRemainingSeconds()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownRemainingSecondsInit_005, end');
    });

    /**
     * Scenario: a zero duration engine never enters the running phase.
     * Expectation: start refuses and leaves the engine finished.
     */
    it('Assessment_CountdownZeroDurationNeverRuns_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownZeroDurationNeverRuns_006, begin');
      const engine: CountdownEngine = new CountdownEngine(DURATION_DEFAULT);
      const started: boolean = engine.start();
      expect(started).assertFalse();
      expect(engine.getPhase()).assertEqual(CountdownPhase.FINISHED);
      expect(engine.tick(1)).assertFalse();
      expect(engine.getTickCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownZeroDurationNeverRuns_006, end');
    });

    /**
     * Scenario: start a countdown that carries a real duration.
     * Expectation: the phase becomes running and the observer receives the start event.
     */
    it('Assessment_CountdownStartTransition_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownStartTransition_007, begin');
      const engine: CountdownEngine = new CountdownEngine(DURATION_TEN_MINUTES);
      const observer: CountdownObserver = new CountdownObserver();
      engine.attachObserver(observer);
      const started: boolean = engine.start();
      expect(started).assertTrue();
      expect(engine.getPhase()).assertEqual(CountdownPhase.RUNNING);
      expect(engine.isRunning()).assertTrue();
      expect(observer.countOf('start')).assertEqual(1);
      expect(observer.lastEvent()).assertEqual('start');
      expect(engine.start()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownStartTransition_007, end');
    });

    /**
     * Scenario: a single tick decrements the remaining seconds by one.
     * Expectation: 600 becomes 599 and one history entry is recorded.
     */
    it('Assessment_CountdownSingleTick_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownSingleTick_008, begin');
      const engine: CountdownEngine = new CountdownEngine(DURATION_TEN_MINUTES);
      engine.start();
      const processed: boolean = engine.tick(3);
      expect(processed).assertTrue();
      expect(engine.getRemainingSeconds()).assertEqual(599);
      expect(engine.getTickCount()).assertEqual(1);
      const history: TickRecord[] = engine.getHistory();
      expect(history[0].tickIndex).assertEqual(1);
      expect(history[0].remainingSeconds).assertEqual(599);
      expect(history[0].processingMs).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownSingleTick_008, end');
    });

    /**
     * Scenario: a tick is ignored while the engine is idle.
     * Expectation: no remaining time is consumed and no history entry is created.
     */
    it('Assessment_CountdownTickIgnoredWhenIdle_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownTickIgnoredWhenIdle_009, begin');
      const engine: CountdownEngine = new CountdownEngine(DURATION_TEN_MINUTES);
      const processed: boolean = engine.tick(1);
      expect(processed).assertFalse();
      expect(engine.getRemainingSeconds()).assertEqual(600);
      expect(engine.getTickCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownTickIgnoredWhenIdle_009, end');
    });

    /**
     * Scenario: the countdown stops exactly at zero.
     * Expectation: after 600 ticks the phase is finished and a further tick is rejected.
     */
    it('Assessment_CountdownStopsAtZero_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownStopsAtZero_010, begin');
      const engine: CountdownEngine = new CountdownEngine(DURATION_TEN_MINUTES);
      engine.start();
      const processed: number = engine.tickDown(600);
      expect(processed).assertEqual(600);
      expect(engine.getRemainingSeconds()).assertEqual(0);
      expect(engine.isExpired()).assertTrue();
      expect(engine.getPhase()).assertEqual(CountdownPhase.FINISHED);
      expect(engine.tick(1)).assertFalse();
      expect(engine.getTickCount()).assertEqual(600);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownStopsAtZero_010, end');
    });

    /**
     * Scenario: the tick loop never dips below zero.
     * Expectation: over requesting ticks still leaves the value at zero.
     */
    it('Assessment_CountdownNeverNegative_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownNeverNegative_011, begin');
      const engine: CountdownEngine = new CountdownEngine(3000);
      engine.start();
      engine.tickDown(10);
      expect(engine.getRemainingSeconds()).assertEqual(0);
      expect(engine.getRemainingSeconds() >= 0).assertTrue();
      expect(engine.getTickCount()).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownNeverNegative_011, end');
    });

    /**
     * Scenario: pause and resume of a running countdown.
     * Expectation: the transition is accepted both ways and the value is preserved.
     */
    it('Assessment_CountdownPauseResume_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownPauseResume_012, begin');
      const engine: CountdownEngine = new CountdownEngine(DURATION_TEN_MINUTES);
      engine.start();
      engine.tickDown(5);
      const paused: TransitionResult = engine.pause();
      expect(paused.accepted).assertTrue();
      expect(paused.from).assertEqual(CountdownPhase.RUNNING);
      expect(paused.to).assertEqual(CountdownPhase.PAUSED);
      expect(paused.reason).assertEqual('pause');
      expect(engine.getRemainingSeconds()).assertEqual(595);
      const resumed: TransitionResult = engine.resume();
      expect(resumed.accepted).assertTrue();
      expect(resumed.to).assertEqual(CountdownPhase.RUNNING);
      expect(engine.getPhase()).assertEqual(CountdownPhase.RUNNING);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownPauseResume_012, end');
    });

    /**
     * Scenario: ticks are ignored while paused.
     * Expectation: the remaining value stays untouched until the countdown resumes.
     */
    it('Assessment_CountdownTickIgnoredWhenPaused_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownTickIgnoredWhenPaused_013, begin');
      const engine: CountdownEngine = new CountdownEngine(DURATION_TEN_MINUTES);
      engine.start();
      engine.pause();
      expect(engine.tick(1)).assertFalse();
      expect(engine.getRemainingSeconds()).assertEqual(600);
      expect(engine.getTickCount()).assertEqual(0);
      engine.resume();
      expect(engine.tick(1)).assertTrue();
      expect(engine.getRemainingSeconds()).assertEqual(599);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownTickIgnoredWhenPaused_013, end');
    });

    /**
     * Scenario: pausing an idle engine.
     * Expectation: the transition is rejected and the phase is not modified.
     */
    it('Assessment_CountdownPauseRejectedWhenIdle_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownPauseRejectedWhenIdle_014, begin');
      const engine: CountdownEngine = new CountdownEngine(DURATION_TEN_MINUTES);
      const result: TransitionResult = engine.pause();
      expect(result.accepted).assertFalse();
      expect(result.from).assertEqual(CountdownPhase.IDLE);
      expect(result.to).assertEqual(CountdownPhase.IDLE);
      expect(result.reason).assertEqual('pause rejected');
      expect(engine.getPhase()).assertEqual(CountdownPhase.IDLE);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownPauseRejectedWhenIdle_014, end');
    });

    /**
     * Scenario: resuming a finished countdown.
     * Expectation: the transition is rejected, a finished countdown is terminal.
     */
    it('Assessment_CountdownResumeRejectedWhenFinished_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownResumeRejectedWhenFinished_015, begin');
      const engine: CountdownEngine = new CountdownEngine(2000);
      engine.start();
      engine.tickDown(5);
      expect(engine.getPhase()).assertEqual(CountdownPhase.FINISHED);
      const result: TransitionResult = engine.resume();
      expect(result.accepted).assertFalse();
      expect(result.to).assertEqual(CountdownPhase.FINISHED);
      expect(engine.canTransitionTo(CountdownPhase.RUNNING)).assertFalse();
      expect(engine.canTransitionTo(CountdownPhase.IDLE)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownResumeRejectedWhenFinished_015, end');
    });

    /**
     * Scenario: the transition guard table of the engine.
     * Expectation: only idle/paused may enter running, only running may pause.
     */
    it('Assessment_CountdownTransitionGuards_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownTransitionGuards_016, begin');
      const engine: CountdownEngine = new CountdownEngine(DURATION_TEN_MINUTES);
      expect(engine.canTransitionTo(CountdownPhase.RUNNING)).assertTrue();
      expect(engine.canTransitionTo(CountdownPhase.PAUSED)).assertFalse();
      expect(engine.canTransitionTo(CountdownPhase.FINISHED)).assertFalse();
      engine.start();
      expect(engine.canTransitionTo(CountdownPhase.PAUSED)).assertTrue();
      expect(engine.canTransitionTo(CountdownPhase.RUNNING)).assertFalse();
      expect(engine.canTransitionTo(CountdownPhase.FINISHED)).assertTrue();
      engine.pause();
      expect(engine.canTransitionTo(CountdownPhase.RUNNING)).assertTrue();
      expect(engine.canTransitionTo(CountdownPhase.PAUSED)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownTransitionGuards_016, end');
    });

    /**
     * Scenario: reset restores the initial state and clears the history.
     * Expectation: the engine returns to idle with the original duration.
     */
    it('Assessment_CountdownResetRestoresState_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownResetRestoresState_017, begin');
      const engine: CountdownEngine = new CountdownEngine(DURATION_THIRTY_MINUTES);
      const observer: CountdownObserver = new CountdownObserver();
      engine.attachObserver(observer);
      engine.start();
      engine.tickDown(120);
      expect(engine.getRemainingSeconds()).assertEqual(1680);
      engine.reset();
      expect(engine.getRemainingSeconds()).assertEqual(1800);
      expect(engine.getPhase()).assertEqual(CountdownPhase.IDLE);
      expect(engine.getTickCount()).assertEqual(0);
      expect(observer.countOf('reset')).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownResetRestoresState_017, end');
    });

    /**
     * Scenario: reset to a new duration.
     * Expectation: the engine adopts the new duration and recomputes the seconds.
     */
    it('Assessment_CountdownResetToNewDuration_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownResetToNewDuration_018, begin');
      const engine: CountdownEngine = new CountdownEngine(DURATION_TEN_MINUTES);
      engine.start();
      engine.tickDown(30);
      engine.resetTo(DURATION_SIXTY_MINUTES);
      expect(engine.getDurationMs()).assertEqual(3600000);
      expect(engine.getRemainingSeconds()).assertEqual(3600);
      expect(engine.getPhase()).assertEqual(CountdownPhase.IDLE);
      expect(engine.start()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownResetToNewDuration_018, end');
    });

    /**
     * Scenario: elapsed seconds and progress percent of a fresh engine.
     * Expectation: nothing elapsed, zero percent, ratio one.
     */
    it('Assessment_CountdownProgressAtStart_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownProgressAtStart_019, begin');
      const engine: CountdownEngine = new CountdownEngine(DURATION_TEN_MINUTES);
      expect(engine.elapsedSeconds()).assertEqual(0);
      expect(engine.progressPercent()).assertEqual(0);
      expect(engine.remainingRatio()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownProgressAtStart_019, end');
    });

    /**
     * Scenario: progress after a quarter of the countdown.
     * Expectation: the percentage follows the elapsed seconds exactly.
     */
    it('Assessment_CountdownProgressQuarter_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownProgressQuarter_020, begin');
      const engine: CountdownEngine = new CountdownEngine(4000);
      engine.start();
      engine.tick(0);
      expect(engine.elapsedSeconds()).assertEqual(1);
      expect(engine.progressPercent()).assertEqual(25);
      expect(engine.remainingRatio()).assertEqual(0.75);
      engine.tick(0);
      expect(engine.progressPercent()).assertEqual(50);
      expect(engine.remainingRatio()).assertEqual(0.5);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownProgressQuarter_020, end');
    });

    /**
     * Scenario: progress of an expired countdown.
     * Expectation: the percentage is clamped to one hundred.
     */
    it('Assessment_CountdownProgressExpired_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownProgressExpired_021, begin');
      const engine: CountdownEngine = new CountdownEngine(3000);
      engine.start();
      engine.tickDown(10);
      expect(engine.progressPercent()).assertEqual(100);
      expect(engine.remainingRatio()).assertEqual(0);
      expect(engine.elapsedSeconds()).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownProgressExpired_021, end');
    });

    /**
     * Scenario: progress of the zero duration candidate.
     * Expectation: a zero duration is treated as fully elapsed.
     */
    it('Assessment_CountdownProgressZeroDuration_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownProgressZeroDuration_022, begin');
      const engine: CountdownEngine = new CountdownEngine(DURATION_DEFAULT);
      expect(engine.progressPercent()).assertEqual(100);
      expect(engine.remainingRatio()).assertEqual(0);
      expect(engine.elapsedSeconds()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownProgressZeroDuration_022, end');
    });

    /**
     * Scenario: MM:SS formatting of the documented values.
     * Expectation: padStart produces the same text as formatRemaining of ExamPage.
     */
    it('Assessment_CountdownFormatMMSS_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownFormatMMSS_023, begin');
      expect(formatter.formatSeconds(600)).assertEqual('10:00');
      expect(formatter.formatSeconds(59)).assertEqual('00:59');
      expect(formatter.formatSeconds(60)).assertEqual('01:00');
      expect(formatter.formatSeconds(1)).assertEqual('00:01');
      expect(formatter.formatSeconds(0)).assertEqual('00:00');
      expect(formatter.formatSeconds(3599)).assertEqual('59:59');
      expect(formatter.formatSeconds(3600)).assertEqual('60:00');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownFormatMMSS_023, end');
    });

    /**
     * Scenario: formatting above ninety nine minutes.
     * Expectation: the minute field keeps growing instead of wrapping.
     */
    it('Assessment_CountdownFormatAboveNinetyNine_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownFormatAboveNinetyNine_024, begin');
      expect(formatter.formatSeconds(6000)).assertEqual('100:00');
      expect(formatter.formatSeconds(7200)).assertEqual('120:00');
      expect(formatter.minuteFieldWidth(6000)).assertEqual(3);
      expect(formatter.minuteFieldWidth(5999)).assertEqual(2);
      expect(formatter.formatSeconds(6030)).assertEqual('100:30');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownFormatAboveNinetyNine_024, end');
    });

    /**
     * Scenario: negative input to the formatter.
     * Expectation: a negative value is clamped to zero and never produces a negative field.
     */
    it('Assessment_CountdownFormatNegativeClamped_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownFormatNegativeClamped_025, begin');
      expect(formatter.formatSeconds(-1)).assertEqual('00:00');
      expect(formatter.formatSeconds(-3600)).assertEqual('00:00');
      expect(formatter.format(-5000)).assertEqual('00:00');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownFormatNegativeClamped_025, end');
    });

    /**
     * Scenario: formatting from a millisecond duration.
     * Expectation: the formatter floors the milliseconds before it splits the fields.
     */
    it('Assessment_CountdownFormatFromMilliseconds_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownFormatFromMilliseconds_026, begin');
      expect(formatter.format(600000)).assertEqual('10:00');
      expect(formatter.format(1800000)).assertEqual('30:00');
      expect(formatter.format(3600000)).assertEqual('60:00');
      expect(formatter.format(1999)).assertEqual('00:01');
      expect(formatter.format(0)).assertEqual('00:00');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownFormatFromMilliseconds_026, end');
    });

    /**
     * Scenario: the alternative format styles of the formatter.
     * Expectation: seconds only and hour scale styles stay consistent with MM:SS.
     */
    it('Assessment_CountdownFormatStyles_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownFormatStyles_027, begin');
      expect(formatter.formatWithStyle(65, CountdownFormat.MM_SS)).assertEqual('01:05');
      expect(formatter.formatWithStyle(65, CountdownFormat.SECONDS_ONLY)).assertEqual('65');
      expect(formatter.formatWithStyle(5, CountdownFormat.SECONDS_ONLY)).assertEqual('05');
      expect(formatter.formatWithStyle(3661, CountdownFormat.HH_MM_SS)).assertEqual('01:01:01');
      expect(formatter.formatWithStyle(3600, CountdownFormat.HH_MM_SS)).assertEqual('01:00:00');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownFormatStyles_027, end');
    });

    /**
     * Scenario: well formed check of the emitted text.
     * Expectation: the MM:SS output passes and malformed strings are rejected.
     */
    it('Assessment_CountdownFormatWellFormed_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownFormatWellFormed_028, begin');
      expect(formatter.isWellFormed(formatter.formatSeconds(600))).assertTrue();
      expect(formatter.isWellFormed(formatter.formatSeconds(0))).assertTrue();
      expect(formatter.isWellFormed('')).assertFalse();
      expect(formatter.isWellFormed('10-00')).assertFalse();
      expect(formatter.isWellFormed('1:0')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownFormatWellFormed_028, end');
    });

    /**
     * Scenario: severity classification of the remaining time.
     * Expectation: one minute and below is the warning colour of the exam page.
     */
    it('Assessment_CountdownSeverityThreshold_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownSeverityThreshold_029, begin');
      expect(formatter.severityOf(0)).assertEqual(CountdownSeverity.EXPIRED);
      expect(formatter.severityOf(-5)).assertEqual(CountdownSeverity.EXPIRED);
      expect(formatter.severityOf(1)).assertEqual(CountdownSeverity.WARNING);
      expect(formatter.severityOf(60)).assertEqual(CountdownSeverity.WARNING);
      expect(formatter.severityOf(61)).assertEqual(CountdownSeverity.NORMAL);
      expect(formatter.severityOf(3600)).assertEqual(CountdownSeverity.NORMAL);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownSeverityThreshold_029, end');
    });

    /**
     * Scenario: the severity of a live engine as it approaches zero.
     * Expectation: the snapshot severity flips to warning exactly at one minute.
     */
    it('Assessment_CountdownEngineSeverityFlip_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownEngineSeverityFlip_030, begin');
      const engine: CountdownEngine = new CountdownEngine(62000);
      engine.start();
      expect(engine.snapshot().severity).assertEqual(CountdownSeverity.NORMAL);
      engine.tickDown(1);
      expect(engine.snapshot().severity).assertEqual(CountdownSeverity.NORMAL);
      engine.tickDown(1);
      expect(engine.snapshot().severity).assertEqual(CountdownSeverity.WARNING);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownEngineSeverityFlip_030, end');
    });

    /**
     * Scenario: the formatted text of the running engine.
     * Expectation: formatted() follows the remaining seconds of the engine.
     */
    it('Assessment_CountdownEngineFormattedText_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownEngineFormattedText_031, begin');
      const engine: CountdownEngine = new CountdownEngine(DURATION_TEN_MINUTES);
      expect(engine.formatted()).assertEqual('10:00');
      engine.start();
      engine.tickDown(1);
      expect(engine.formatted()).assertEqual('09:59');
      engine.tickDown(59);
      expect(engine.formatted()).assertEqual('09:00');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownEngineFormattedText_031, end');
    });

    /**
     * Scenario: the tick history keeps the processed values in order.
     * Expectation: the records are monotonic, chronological and continuously indexed.
     */
    it('Assessment_CountdownHistoryIntegrity_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownHistoryIntegrity_032, begin');
      const engine: CountdownEngine = new CountdownEngine(DURATION_TEN_MINUTES);
      engine.start();
      engine.tickDown(25);
      const calculator: CountdownMetricsCalculator = new CountdownMetricsCalculator(engine.getHistory());
      expect(calculator.totalTicks()).assertEqual(25);
      expect(calculator.isMonotonic()).assertTrue();
      expect(calculator.isChronological()).assertTrue();
      expect(calculator.tickIndicesContinuous()).assertTrue();
      const history: TickRecord[] = engine.getHistory();
      expect(history[0].remainingSeconds).assertEqual(599);
      expect(history[24].remainingSeconds).assertEqual(575);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownHistoryIntegrity_032, end');
    });

    /**
     * Scenario: the history getter returns an independent copy.
     * Expectation: mutating the copy does not affect the engine.
     */
    it('Assessment_CountdownHistoryDefensiveCopy_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownHistoryDefensiveCopy_033, begin');
      const engine: CountdownEngine = new CountdownEngine(DURATION_TEN_MINUTES);
      engine.start();
      engine.tickDown(3);
      const copy: TickRecord[] = engine.getHistory();
      copy.push({
        tickIndex: 99,
        remainingSeconds: 0,
        timestamp: 0,
        processingMs: 0
      });
      expect(engine.getTickCount()).assertEqual(3);
      expect(engine.getHistory().length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownHistoryDefensiveCopy_033, end');
    });

    /**
     * Scenario: the metrics calculator over a constant tick timing.
     * Expectation: min, max and average are all equal.
     */
    it('Assessment_CountdownMetricsConstant_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownMetricsConstant_034, begin');
      const records: TickRecord[] = TickRecordBuilder.build(10, 4);
      const calculator: CountdownMetricsCalculator = new CountdownMetricsCalculator(records);
      const metrics: CountdownMetrics = calculator.aggregate();
      expect(metrics.totalTicks).assertEqual(10);
      expect(metrics.minTickMs).assertEqual(4);
      expect(metrics.maxTickMs).assertEqual(4);
      expect(metrics.averageTickMs).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownMetricsConstant_034, end');
    });

    /**
     * Scenario: the metrics calculator over varying tick timings.
     * Expectation: the extremes and the average follow the supplied values.
     */
    it('Assessment_CountdownMetricsVarying_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownMetricsVarying_035, begin');
      const records: TickRecord[] = TickRecordBuilder.buildWithTimings([2, 8, 4, 6]);
      const calculator: CountdownMetricsCalculator = new CountdownMetricsCalculator(records);
      expect(calculator.minTickMs()).assertEqual(2);
      expect(calculator.maxTickMs()).assertEqual(8);
      expect(calculator.averageTickMs()).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownMetricsVarying_035, end');
    });

    /**
     * Scenario: the metrics calculator over an empty history.
     * Expectation: every aggregate answers zero instead of throwing.
     */
    it('Assessment_CountdownMetricsEmpty_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownMetricsEmpty_036, begin');
      const calculator: CountdownMetricsCalculator = new CountdownMetricsCalculator([]);
      expect(calculator.totalTicks()).assertEqual(0);
      expect(calculator.minTickMs()).assertEqual(0);
      expect(calculator.maxTickMs()).assertEqual(0);
      expect(calculator.averageTickMs()).assertEqual(0);
      expect(calculator.isMonotonic()).assertTrue();
      expect(calculator.isChronological()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownMetricsEmpty_036, end');
    });

    /**
     * Scenario: the metrics calculator over a single tick.
     * Expectation: all three timing values collapse to the single measurement.
     */
    it('Assessment_CountdownMetricsSingle_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownMetricsSingle_037, begin');
      const calculator: CountdownMetricsCalculator =
        new CountdownMetricsCalculator(TickRecordBuilder.buildWithTimings([12]));
      expect(calculator.totalTicks()).assertEqual(1);
      expect(calculator.minTickMs()).assertEqual(12);
      expect(calculator.maxTickMs()).assertEqual(12);
      expect(calculator.averageTickMs()).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownMetricsSingle_037, end');
    });

    /**
     * Scenario: a non monotonic history is detected.
     * Expectation: the checker rejects a record whose gap is not exactly one second.
     */
    it('Assessment_CountdownMetricsDetectsGap_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownMetricsDetectsGap_038, begin');
      const records: TickRecord[] = [
        { tickIndex: 1, remainingSeconds: 100, timestamp: 0, processingMs: 1 },
        { tickIndex: 2, remainingSeconds: 98, timestamp: 1, processingMs: 1 }
      ];
      const calculator: CountdownMetricsCalculator = new CountdownMetricsCalculator(records);
      expect(calculator.isMonotonic()).assertFalse();
      expect(calculator.tickIndicesContinuous()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownMetricsDetectsGap_038, end');
    });

    /**
     * Scenario: the observer records the full lifecycle of a short countdown.
     * Expectation: one start, one tick per second and one finish event at the end.
     */
    it('Assessment_CountdownObserverLifecycle_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownObserverLifecycle_039, begin');
      const engine: CountdownEngine = new CountdownEngine(3000);
      const observer: CountdownObserver = new CountdownObserver();
      engine.attachObserver(observer);
      engine.start();
      engine.tickDown(3);
      expect(observer.countOf('start')).assertEqual(1);
      expect(observer.countOf('tick')).assertEqual(3);
      expect(observer.countOf('finish')).assertEqual(1);
      expect(observer.lastEvent()).assertEqual('finish');
      expect(observer.getEvents().length).assertEqual(5);
      const snapshots: CountdownSnapshot[] = observer.getSnapshots();
      expect(snapshots[snapshots.length - 1].remainingSeconds).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownObserverLifecycle_039, end');
    });

    /**
     * Scenario: clearing the observer.
     * Expectation: the recorded events and snapshots are both dropped.
     */
    it('Assessment_CountdownObserverClear_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownObserverClear_040, begin');
      const engine: CountdownEngine = new CountdownEngine(DURATION_TEN_MINUTES);
      const observer: CountdownObserver = new CountdownObserver();
      engine.attachObserver(observer);
      engine.start();
      engine.tickDown(2);
      expect(observer.getEvents().length).assertEqual(3);
      observer.clear();
      expect(observer.getEvents().length).assertEqual(0);
      expect(observer.getSnapshots().length).assertEqual(0);
      expect(observer.lastEvent()).assertEqual('');
      expect(observer.countOf('tick')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownObserverClear_040, end');
    });

    /**
     * Scenario: the engine runs without an observer attached.
     * Expectation: ticks still work and no exception is raised.
     */
    it('Assessment_CountdownWithoutObserver_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownWithoutObserver_041, begin');
      const engine: CountdownEngine = new CountdownEngine(DURATION_TEN_MINUTES);
      expect(engine.start()).assertTrue();
      expect(engine.tick(1)).assertTrue();
      expect(engine.getRemainingSeconds()).assertEqual(599);
      expect(engine.tickDown(9)).assertEqual(9);
      expect(engine.getRemainingSeconds()).assertEqual(590);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownWithoutObserver_041, end');
    });

    /**
     * Scenario: the invariants of a fresh snapshot.
     * Expectation: the remaining range, the elapsed sum and the severity all hold.
     */
    it('Assessment_CountdownInvariantFreshSnapshot_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownInvariantFreshSnapshot_042, begin');
      const engine: CountdownEngine = new CountdownEngine(DURATION_THIRTY_MINUTES);
      const snapshot: CountdownSnapshot = engine.snapshot();
      expect(invariants.remainingWithinRange(snapshot)).assertTrue();
      expect(invariants.elapsedConsistent(snapshot)).assertTrue();
      expect(invariants.finishedImpliesExpired(snapshot)).assertTrue();
      expect(invariants.severityMatches(snapshot)).assertTrue();
      expect(invariants.allHold(snapshot)).assertTrue();
      expect(snapshot.elapsedSeconds).assertEqual(0);
      expect(snapshot.remainingSeconds).assertEqual(1800);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownInvariantFreshSnapshot_042, end');
    });

    /**
     * Scenario: the invariants of a partially elapsed snapshot.
     * Expectation: elapsed plus remaining equals the duration after every tick batch.
     */
    it('Assessment_CountdownInvariantPartialSnapshot_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownInvariantPartialSnapshot_043, begin');
      const engine: CountdownEngine = new CountdownEngine(DURATION_TEN_MINUTES);
      engine.start();
      for (let i = 0; i < 10; i++) {
        engine.tickDown(30);
        expect(invariants.allHold(engine.snapshot())).assertTrue();
      }
      const snapshot: CountdownSnapshot = engine.snapshot();
      expect(snapshot.remainingSeconds).assertEqual(300);
      expect(snapshot.elapsedSeconds).assertEqual(300);
      expect(snapshot.phase).assertEqual(CountdownPhase.RUNNING);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownInvariantPartialSnapshot_043, end');
    });

    /**
     * Scenario: the invariants of a finished snapshot.
     * Expectation: a finished snapshot always reports zero remaining seconds.
     */
    it('Assessment_CountdownInvariantFinishedSnapshot_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownInvariantFinishedSnapshot_044, begin');
      const engine: CountdownEngine = new CountdownEngine(5000);
      engine.start();
      engine.tickDown(10);
      const snapshot: CountdownSnapshot = engine.snapshot();
      expect(snapshot.phase).assertEqual(CountdownPhase.FINISHED);
      expect(snapshot.remainingSeconds).assertEqual(0);
      expect(snapshot.severity).assertEqual(CountdownSeverity.EXPIRED);
      expect(invariants.finishedImpliesExpired(snapshot)).assertTrue();
      expect(invariants.allHold(snapshot)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownInvariantFinishedSnapshot_044, end');
    });

    /**
     * Scenario: a synthetic snapshot that violates the range invariant.
     * Expectation: the checker flags the offending snapshot.
     */
    it('Assessment_CountdownInvariantRejectsOutOfRange_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownInvariantRejectsOutOfRange_045, begin');
      const snapshot: CountdownSnapshot = {
        durationMs: 60000,
        remainingSeconds: 120,
        elapsedSeconds: 0,
        phase: CountdownPhase.RUNNING,
        severity: CountdownSeverity.NORMAL
      };
      expect(invariants.remainingWithinRange(snapshot)).assertFalse();
      expect(invariants.elapsedConsistent(snapshot)).assertFalse();
      expect(invariants.allHold(snapshot)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownInvariantRejectsOutOfRange_045, end');
    });

    /**
     * Scenario: a synthetic finished snapshot that is not expired.
     * Expectation: the finished implies expired invariant fails.
     */
    it('Assessment_CountdownInvariantRejectsFinishedNotExpired_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownInvariantRejectsFinishedNotExpired_046, begin');
      const snapshot: CountdownSnapshot = {
        durationMs: 60000,
        remainingSeconds: 30,
        elapsedSeconds: 30,
        phase: CountdownPhase.FINISHED,
        severity: CountdownSeverity.WARNING
      };
      expect(invariants.finishedImpliesExpired(snapshot)).assertFalse();
      expect(invariants.remainingWithinRange(snapshot)).assertTrue();
      expect(invariants.elapsedConsistent(snapshot)).assertTrue();
      expect(invariants.allHold(snapshot)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownInvariantRejectsFinishedNotExpired_046, end');
    });

    /**
     * Scenario: the six minute duration of the largest candidate.
     * Expectation: three thousand six hundred ticks are needed to drain it.
     */
    it('Assessment_CountdownSixtyMinuteDrain_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownSixtyMinuteDrain_047, begin');
      const engine: CountdownEngine = new CountdownEngine(DURATION_SIXTY_MINUTES);
      engine.start();
      expect(engine.getRemainingSeconds()).assertEqual(3600);
      const processed: number = engine.tickDown(3600);
      expect(processed).assertEqual(3600);
      expect(engine.formatted()).assertEqual('00:00');
      expect(engine.getPhase()).assertEqual(CountdownPhase.FINISHED);
      const calculator: CountdownMetricsCalculator = new CountdownMetricsCalculator(engine.getHistory());
      expect(calculator.totalTicks()).assertEqual(3600);
      expect(calculator.isMonotonic()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownSixtyMinuteDrain_047, end');
    });

    /**
     * Scenario: repeated pause and resume at the warning boundary.
     * Expectation: the remaining value is conserved across the transitions.
     */
    it('Assessment_CountdownPauseResumeCycle_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownPauseResumeCycle_048, begin');
      const engine: CountdownEngine = new CountdownEngine(65000);
      engine.start();
      for (let i = 0; i < 5; i++) {
        engine.tickDown(1);
        expect(engine.pause().accepted).assertTrue();
        expect(engine.resume().accepted).assertTrue();
      }
      expect(engine.getRemainingSeconds()).assertEqual(60);
      expect(engine.snapshot().severity).assertEqual(CountdownSeverity.WARNING);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownPauseResumeCycle_048, end');
    });

    /**
     * Scenario: the metrics of a synthetic paused window.
     * Expectation: the tick count only covers the processed seconds, not the pause.
     */
    it('Assessment_CountdownPauseSkipsTicks_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownPauseSkipsTicks_049, begin');
      const engine: CountdownEngine = new CountdownEngine(DURATION_TEN_MINUTES);
      engine.start();
      engine.tickDown(10);
      engine.pause();
      for (let i = 0; i < 5; i++) {
        expect(engine.tick(1)).assertFalse();
      }
      engine.resume();
      engine.tickDown(5);
      expect(engine.getTickCount()).assertEqual(15);
      expect(engine.getRemainingSeconds()).assertEqual(585);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownPauseSkipsTicks_049, end');
    });

    /**
     * Scenario: the processing time measurement of a tick.
     * Expectation: a negative measurement is stored as zero.
     */
    it('Assessment_CountdownTickNegativeTimingClamped_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownTickNegativeTimingClamped_050, begin');
      const engine: CountdownEngine = new CountdownEngine(DURATION_TEN_MINUTES);
      engine.start();
      engine.tick(-20);
      const history: TickRecord[] = engine.getHistory();
      expect(history[0].processingMs).assertEqual(0);
      const calculator: CountdownMetricsCalculator = new CountdownMetricsCalculator(history);
      expect(calculator.minTickMs()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownTickNegativeTimingClamped_050, end');
    });

    /**
     * Scenario: an end to end countdown scenario.
     * Expectation: a thirty minute countdown passes through running, paused, resumed and
     * finished with consistent metrics and invariants.
     */
    it('Assessment_CountdownComprehensiveScenario_052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownComprehensiveScenario_052, begin');
      const engine: CountdownEngine = new CountdownEngine(DURATION_THIRTY_MINUTES);
      const observer: CountdownObserver = new CountdownObserver();
      engine.attachObserver(observer);
      expect(engine.start()).assertTrue();
      expect(engine.tickDown(600)).assertEqual(600);
      expect(engine.formatted()).assertEqual('20:00');
      const progress: number = engine.progressPercent();
      expect(Math.abs(progress - 100 / 3) < 0.001).assertTrue();
      expect(engine.pause().accepted).assertTrue();
      expect(engine.resume().accepted).assertTrue();
      expect(engine.tickDown(1200)).assertEqual(1200);
      expect(engine.formatted()).assertEqual('00:00');
      expect(engine.snapshot().severity).assertEqual(CountdownSeverity.EXPIRED);
      const calculator: CountdownMetricsCalculator = new CountdownMetricsCalculator(engine.getHistory());
      expect(calculator.totalTicks()).assertEqual(1800);
      expect(calculator.isMonotonic()).assertTrue();
      expect(observer.countOf('finish')).assertEqual(1);
      expect(invariants.allHold(engine.snapshot())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownComprehensiveScenario_052, end');
    });

    /**
     * Scenario: the transition result carries the rejection reason.
     * Expectation: a rejected transition names the attempted reason with a suffix.
     */
    it('Assessment_CountdownTransitionReason_053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownTransitionReason_053, begin');
      const engine: CountdownEngine = new CountdownEngine(DURATION_TEN_MINUTES);
      const first: TransitionResult = engine.resume();
      expect(first.accepted).assertTrue();
      expect(first.reason).assertEqual('resume');
      const second: TransitionResult = engine.resume();
      expect(second.accepted).assertFalse();
      expect(second.reason).assertEqual('resume rejected');
      const third: TransitionResult = engine.pause();
      expect(third.accepted).assertTrue();
      const fourth: TransitionResult = engine.pause();
      expect(fourth.accepted).assertFalse();
      expect(fourth.reason).assertEqual('pause rejected');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownTransitionReason_053, end');
    });

    /**
     * Scenario: the countdown of an idle engine reports the configured duration only.
     * Expectation: the snapshot duration equals the constructor argument.
     */
    it('Assessment_CountdownSnapshotDuration_054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownSnapshotDuration_054, begin');
      const engine: CountdownEngine = new CountdownEngine(DURATION_THIRTY_MINUTES);
      const snapshot: CountdownSnapshot = engine.snapshot();
      expect(snapshot.durationMs).assertEqual(1800000);
      expect(snapshot.phase).assertEqual(CountdownPhase.IDLE);
      expect(snapshot.severity).assertEqual(CountdownSeverity.NORMAL);
      expect(snapshot.remainingSeconds).assertEqual(1800);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownSnapshotDuration_054, end');
    });

    /**
     * Scenario: the countdown pauses when the exam page leaves the foreground.
     * Expectation: the engine mirrors the sample behaviour, where the timer is stopped in
     * aboutToDisappear and the remaining value is preserved in the snapshot.
     */
    it('Assessment_CountdownPauseOnBackground_058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownPauseOnBackground_058, begin');
      const engine: CountdownEngine = new CountdownEngine(DURATION_TEN_MINUTES);
      engine.start();
      engine.tickDown(45);
      const snapshot: CountdownSnapshot = engine.snapshot();
      engine.pause();
      const pausedSnapshot: CountdownSnapshot = engine.snapshot();
      expect(pausedSnapshot.remainingSeconds).assertEqual(snapshot.remainingSeconds);
      expect(pausedSnapshot.elapsedSeconds).assertEqual(snapshot.elapsedSeconds);
      expect(pausedSnapshot.phase).assertEqual(CountdownPhase.PAUSED);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownPauseOnBackground_058, end');
    });

    /**
     * Scenario: the countdown restarts from zero after a new assessment session.
     * Expectation: reset and start reproduce a clean initial countdown.
     */
    it('Assessment_CountdownRestartAfterSession_059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownRestartAfterSession_059, begin');
      const engine: CountdownEngine = new CountdownEngine(DURATION_THIRTY_MINUTES);
      engine.start();
      engine.tickDown(500);
      engine.reset();
      expect(engine.getPhase()).assertEqual(CountdownPhase.IDLE);
      expect(engine.getRemainingSeconds()).assertEqual(1800);
      expect(engine.start()).assertTrue();
      expect(engine.formatted()).assertEqual('30:00');
      expect(engine.getTickCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownRestartAfterSession_059, end');
    });

    /**
     * Scenario: the formatter and the engine agree on every documented checkpoint.
     * Expectation: the formatted text of the engine equals the formatter output.
     */
    it('Assessment_CountdownFormatterEngineAgreement_060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownFormatterEngineAgreement_060, begin');
      const engine: CountdownEngine = new CountdownEngine(DURATION_TEN_MINUTES);
      engine.start();
      const checkpoints: number[] = [1, 59, 60, 120, 599];
      let consumed: number = 0;
      for (let i = 0; i < checkpoints.length; i++) {
        const target: number = checkpoints[i];
        while (consumed < target) {
          engine.tick(1);
          consumed++;
        }
        expect(engine.formatted()).assertEqual(formatter.formatSeconds(600 - target));
      }
      expect(engine.getRemainingSeconds()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountdownFormatterEngineAgreement_060, end');
    });
  });
}
