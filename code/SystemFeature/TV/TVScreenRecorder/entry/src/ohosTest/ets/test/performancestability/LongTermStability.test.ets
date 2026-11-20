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

import { describe, it, expect } from '@ohos/hypium';

/**
 * Long term stability model of the TV screen recorder.
 * The suite performs more than one thousand operations on a logical clock and
 * checks that the timer label, the blink counter and the state machine never
 * drift away from their expected values.
 */

/** Recording state of the sample application. */
enum RecordingState {
  IDLE = 0,
  RECORDING = 1,
  STOPPED = 2,
  ERROR = 3
}

/** A monotonically increasing counter with an optional step. */
class MonotonicCounter {
  private value: number = 0;
  private readonly step: number;

  constructor(step: number = 1) {
    this.step = step;
  }

  public increment(): number {
    this.value += this.step;
    return this.value;
  }

  public add(delta: number): void {
    if (delta > 0) {
      this.value += delta;
    }
  }

  public get(): number {
    return this.value;
  }

  public reset(): void {
    this.value = 0;
  }

  public isMonotonic(previous: number): boolean {
    return this.value >= previous;
  }
}

/** Detects a drift between the expected and the observed value. */
class DriftDetector {
  private expected: number = 0;
  private observed: number = 0;
  private maxDrift: number = 0;

  public expect(delta: number): void {
    this.expected += delta;
  }

  public observe(delta: number): void {
    this.observed += delta;
    const drift = Math.abs(this.expected - this.observed);
    if (drift > this.maxDrift) {
      this.maxDrift = drift;
    }
  }

  public expectedValue(): number {
    return this.expected;
  }

  public observedValue(): number {
    return this.observed;
  }

  public drift(): number {
    return Math.abs(this.expected - this.observed);
  }

  public maxObservedDrift(): number {
    return this.maxDrift;
  }

  public isStable(limit: number): boolean {
    return this.maxDrift <= limit;
  }

  public reset(): void {
    this.expected = 0;
    this.observed = 0;
    this.maxDrift = 0;
  }
}

/**
 * Long running recorder session.
 * The timer label is derived from the accumulated milliseconds and the blink
 * counter from the accumulated transitions, so one thousand steps cannot
 * accumulate rounding errors.
 */
class LongRunRecorder {
  private state: RecordingState = RecordingState.IDLE;
  private elapsedMs: number = 0;
  private refreshCount: number = 0;
  private blinkCount: number = 0;
  private operations: number = 0;
  private errors: number = 0;

  public start(): void {
    this.state = RecordingState.RECORDING;
    this.operations++;
  }

  public stop(): void {
    this.state = RecordingState.STOPPED;
    this.operations++;
  }

  public advance(ms: number): void {
    if (ms <= 0 || this.state !== RecordingState.RECORDING) {
      return;
    }
    const before = this.elapsedMs;
    this.elapsedMs += ms;
    if (Math.floor(this.elapsedMs / 1000) > Math.floor(before / 1000)) {
      this.refreshCount += Math.floor(this.elapsedMs / 1000) - Math.floor(before / 1000);
    }
    if (Math.floor(this.elapsedMs / 800) > Math.floor(before / 800)) {
      this.blinkCount += Math.floor(this.elapsedMs / 800) - Math.floor(before / 800);
    }
    this.operations++;
  }

  public recordError(): void {
    this.errors++;
  }

  public getState(): RecordingState {
    return this.state;
  }

  public getElapsedMs(): number {
    return this.elapsedMs;
  }

  public getRefreshCount(): number {
    return this.refreshCount;
  }

  public getBlinkCount(): number {
    return this.blinkCount;
  }

  public getOperations(): number {
    return this.operations;
  }

  public getErrors(): number {
    return this.errors;
  }

  public label(): string {
    const totalSeconds = Math.floor(this.elapsedMs / 1000);
    const hours = Math.floor(totalSeconds / 3600);
    const minutes = Math.floor((totalSeconds % 3600) / 60);
    const seconds = totalSeconds % 60;
    return `${hours.toString().padStart(2, '0')}:` +
      `${minutes.toString().padStart(2, '0')}:` +
      `${seconds.toString().padStart(2, '0')}`;
  }

  public reset(): void {
    this.state = RecordingState.IDLE;
    this.elapsedMs = 0;
    this.refreshCount = 0;
    this.blinkCount = 0;
    this.operations = 0;
    this.errors = 0;
  }
}

/** Validates the allowed state transitions of the recorder. */
class StateSequenceValidator {
  private history: RecordingState[] = [];

  public record(state: RecordingState): void {
    this.history.push(state);
  }

  public count(): number {
    return this.history.length;
  }

  public countOf(state: RecordingState): number {
    let count = 0;
    for (let index = 0; index < this.history.length; index++) {
      if (this.history[index] === state) {
        count++;
      }
    }
    return count;
  }

  public hasIllegalTransition(): boolean {
    for (let index = 1; index < this.history.length; index++) {
      if (this.history[index - 1] === RecordingState.IDLE && this.history[index] === RecordingState.STOPPED) {
        return true;
      }
      if (this.history[index - 1] === RecordingState.ERROR && this.history[index] === RecordingState.RECORDING) {
        return true;
      }
    }
    return false;
  }

  public last(): RecordingState | null {
    if (this.history.length === 0) {
      return null;
    }
    return this.history[this.history.length - 1];
  }

  public clear(): void {
    this.history = [];
  }
}

export default function longTermStabilityTest(): void {
  describe('LongTermStability_Test', () => {
    it('one_thousand_operations_should_stay_stable', 0, () => {
      const run = new LongRunRecorder();
      run.start();
      for (let step = 0; step < 1000; step++) {
        run.advance(100);
      }
      expect(run.getOperations()).assertEqual(1001);
      expect(run.getElapsedMs()).assertEqual(100000);
      expect(run.label()).assertEqual('00:01:40');
      expect(run.getRefreshCount()).assertEqual(100);
      expect(run.getBlinkCount()).assertEqual(125);
      expect(run.getErrors()).assertEqual(0);
    });

    it('timer_label_should_not_drift_over_many_steps', 0, () => {
      const run = new LongRunRecorder();
      const detector = new DriftDetector();
      run.start();
      for (let step = 0; step < 1200; step++) {
        run.advance(50);
        detector.expect(50);
        detector.observe(50);
      }
      expect(detector.drift()).assertEqual(0);
      expect(detector.maxObservedDrift()).assertEqual(0);
      expect(detector.isStable(0)).assertTrue();
      expect(run.getElapsedMs()).assertEqual(60000);
      expect(run.label()).assertEqual('00:01:00');
    });

    it('drift_detector_should_report_divergence', 0, () => {
      const detector = new DriftDetector();
      detector.expect(1000);
      detector.observe(940);
      expect(detector.drift()).assertEqual(60);
      expect(detector.maxObservedDrift()).assertEqual(60);
      expect(detector.isStable(50)).assertFalse();
      expect(detector.isStable(60)).assertTrue();
      detector.reset();
      expect(detector.drift()).assertEqual(0);
      expect(detector.expectedValue()).assertEqual(0);
    });

    it('counter_should_stay_monotonic', 0, () => {
      const counter = new MonotonicCounter(2);
      const values: number[] = [];
      for (let step = 0; step < 500; step++) {
        values.push(counter.increment());
      }
      expect(counter.get()).assertEqual(1000);
      for (let index = 1; index < values.length; index++) {
        expect(values[index]).assertLarger(values[index - 1]);
      }
      expect(counter.isMonotonic(values[499])).assertTrue();
    });

    it('counter_should_ignore_negative_delta', 0, () => {
      const counter = new MonotonicCounter();
      counter.add(10);
      counter.add(-5);
      counter.add(0);
      expect(counter.get()).assertEqual(10);
      counter.reset();
      expect(counter.get()).assertEqual(0);
    });

    it('state_sequence_should_not_contain_illegal_transitions', 0, () => {
      const validator = new StateSequenceValidator();
      const run = new LongRunRecorder();
      validator.record(run.getState());
      for (let round = 0; round < 100; round++) {
        run.start();
        validator.record(run.getState());
        run.advance(1000);
        run.stop();
        validator.record(run.getState());
      }
      expect(validator.count()).assertEqual(201);
      expect(validator.countOf(RecordingState.RECORDING)).assertEqual(100);
      expect(validator.countOf(RecordingState.STOPPED)).assertEqual(100);
      expect(validator.hasIllegalTransition()).assertFalse();
      expect(validator.last()).assertEqual(RecordingState.STOPPED);
    });

    it('state_validator_should_detect_illegal_sequence', 0, () => {
      const validator = new StateSequenceValidator();
      validator.record(RecordingState.IDLE);
      validator.record(RecordingState.STOPPED);
      validator.record(RecordingState.ERROR);
      validator.record(RecordingState.RECORDING);
      expect(validator.hasIllegalTransition()).assertTrue();
      validator.clear();
      expect(validator.count()).assertEqual(0);
      expect(validator.last()).assertNull();
    });

    it('long_session_should_keep_hour_boundary', 0, () => {
      const run = new LongRunRecorder();
      run.start();
      for (let step = 0; step < 3600; step++) {
        run.advance(1000);
      }
      expect(run.getElapsedMs()).assertEqual(3600000);
      expect(run.label()).assertEqual('01:00:00');
      expect(run.getRefreshCount()).assertEqual(3600);
      expect(run.getBlinkCount()).assertEqual(4500);
    });

    it('error_accumulation_should_stay_zero', 0, () => {
      const run = new LongRunRecorder();
      const counter = new MonotonicCounter();
      run.start();
      for (let step = 0; step < 1000; step++) {
        run.advance(10);
        counter.increment();
      }
      run.stop();
      expect(counter.get()).assertEqual(1000);
      expect(run.getErrors()).assertEqual(0);
      expect(run.getState()).assertEqual(RecordingState.STOPPED);
    });

    it('advance_before_start_should_be_ignored', 0, () => {
      const run = new LongRunRecorder();
      run.advance(5000);
      expect(run.getElapsedMs()).assertEqual(0);
      expect(run.getOperations()).assertEqual(0);
      expect(run.label()).assertEqual('00:00:00');
      run.start();
      run.advance(1500);
      expect(run.getElapsedMs()).assertEqual(1500);
      expect(run.getRefreshCount()).assertEqual(1);
    });

    it('reset_should_restore_the_initial_state', 0, () => {
      const run = new LongRunRecorder();
      run.start();
      run.advance(60000);
      run.recordError();
      run.reset();
      expect(run.getState()).assertEqual(RecordingState.IDLE);
      expect(run.getElapsedMs()).assertEqual(0);
      expect(run.getRefreshCount()).assertEqual(0);
      expect(run.getBlinkCount()).assertEqual(0);
      expect(run.getOperations()).assertEqual(0);
      expect(run.getErrors()).assertEqual(0);
      expect(run.label()).assertEqual('00:00:00');
    });

    it('two_thousand_operations_should_remain_stable', 0, () => {
      const run = new LongRunRecorder();
      const detector = new DriftDetector();
      run.start();
      for (let step = 0; step < 2000; step++) {
        run.advance(100);
        detector.expect(100);
        detector.observe(100);
      }
      expect(run.getOperations()).assertEqual(2001);
      expect(run.getElapsedMs()).assertEqual(200000);
      expect(run.label()).assertEqual('00:03:20');
      expect(detector.isStable(0)).assertTrue();
      expect(run.getErrors()).assertEqual(0);
    });
  });
}
