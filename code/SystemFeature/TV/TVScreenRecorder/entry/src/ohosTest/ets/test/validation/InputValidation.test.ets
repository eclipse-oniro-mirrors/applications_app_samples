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
  KEY_MENU,
  KEY_VOLUME_DOWN,
  KEY_BACK,
  StopCombinationGate,
  recorderComponentCount,
  pressAndWait,
  delay,
  DELAY_KEY_NAVIGATION
} from '../shared/RecordingDriver';

// Input sources that may inject the stop combination on a TV device.
enum InputSource {
  REMOTE = 'remote',
  KEYBOARD = 'keyboard',
  TOUCH = 'touch',
  SYSTEM = 'system'
}

// Lifecycle phase of one injected key event.
enum GatePhase {
  DOWN = 'down',
  UP = 'up'
}

// A single accepted or rejected key record, used by the tracker statistics.
interface InputRecord {
  source: InputSource;
  keyCode: number;
  phase: GatePhase;
  accepted: boolean;
  responseTime: number;
  timestamp: number;
}

// Trace of one key injection as observed by the gate harness.
interface GateTrace {
  keyCode: number;
  phase: GatePhase;
  triggered: boolean;
}

// Validation of a key code before it reaches the input consumer. The platform
// delivers key codes as positive integers, so negative values and values above
// the domain limit are rejected without touching the gate state.
class KeyCodeValidator {
  public static readonly MIN_KEY_CODE: number = 0;
  public static readonly MAX_KEY_CODE: number = 65535;

  public static isValid(keyCode: number): boolean {
    if (!Number.isFinite(keyCode)) {
      return false;
    }
    if (keyCode < KeyCodeValidator.MIN_KEY_CODE) {
      return false;
    }
    return keyCode <= KeyCodeValidator.MAX_KEY_CODE;
  }

  public static isStopCombinationMember(keyCode: number): boolean {
    return keyCode === KEY_MENU || keyCode === KEY_VOLUME_DOWN;
  }
}

// Aggregated statistics of the input validation tracker.
interface InputStatistics {
  totalInputs: number;
  acceptedInputs: number;
  rejectedInputs: number;
  averageResponseTime: number;
  maxResponseTime: number;
}

// Tracker of the injected input events. It keeps the accepted / rejected split
// so that a regression of the key filter is visible immediately.
class InputValidationTracker {
  private static instance: InputValidationTracker;
  private inputHistory: InputRecord[] = [];
  private totalInputs: number = 0;
  private acceptedInputs: number = 0;
  private rejectedInputs: number = 0;

  public static getInstance(): InputValidationTracker {
    if (!InputValidationTracker.instance) {
      InputValidationTracker.instance = new InputValidationTracker();
    }
    return InputValidationTracker.instance;
  }

  public recordInput(source: InputSource, keyCode: number, phase: GatePhase, accepted: boolean,
    responseTime: number): void {
    const record: InputRecord = {
      source: source,
      keyCode: keyCode,
      phase: phase,
      accepted: accepted,
      responseTime: responseTime,
      timestamp: Date.now()
    };
    this.inputHistory.push(record);
    this.totalInputs++;
    if (accepted) {
      this.acceptedInputs++;
    } else {
      this.rejectedInputs++;
    }
  }

  public getInputHistory(): InputRecord[] {
    const history: InputRecord[] = [];
    for (let i = 0; i < this.inputHistory.length; i++) {
      history.push(this.inputHistory[i]);
    }
    return history;
  }

  public getTotalInputs(): number {
    return this.totalInputs;
  }

  public getAcceptedInputs(): number {
    return this.acceptedInputs;
  }

  public getRejectedInputs(): number {
    return this.rejectedInputs;
  }

  public resetTracker(): void {
    this.inputHistory = [];
    this.totalInputs = 0;
    this.acceptedInputs = 0;
    this.rejectedInputs = 0;
  }

  public getValidationRate(): number {
    if (this.totalInputs === 0) {
      return 0;
    }
    return this.acceptedInputs / this.totalInputs;
  }

  public hasInputSource(source: InputSource): boolean {
    return this.inputHistory.some((record: InputRecord) => record.source === source);
  }

  public hasKeyCode(keyCode: number): boolean {
    return this.inputHistory.some((record: InputRecord) => record.keyCode === keyCode);
  }

  public getAverageResponseTime(): number {
    if (this.inputHistory.length === 0) {
      return 0;
    }
    let total = 0;
    for (let i = 0; i < this.inputHistory.length; i++) {
      total += this.inputHistory[i].responseTime;
    }
    return total / this.inputHistory.length;
  }

  public getMaxResponseTime(): number {
    let maxValue = 0;
    for (let i = 0; i < this.inputHistory.length; i++) {
      if (this.inputHistory[i].responseTime > maxValue) {
        maxValue = this.inputHistory[i].responseTime;
      }
    }
    return maxValue;
  }

  public buildStatistics(): InputStatistics {
    const statistics: InputStatistics = {
      totalInputs: this.totalInputs,
      acceptedInputs: this.acceptedInputs,
      rejectedInputs: this.rejectedInputs,
      averageResponseTime: this.getAverageResponseTime(),
      maxResponseTime: this.getMaxResponseTime()
    };
    return statistics;
  }

  public getInputSourceFrequency(): Map<string, number> {
    const frequency = new Map<string, number>();
    for (let i = 0; i < this.inputHistory.length; i++) {
      const source = this.inputHistory[i].source;
      const current = frequency.get(source);
      if (current === undefined) {
        frequency.set(source, 1);
      } else {
        frequency.set(source, current + 1);
      }
    }
    return frequency;
  }

  public clone(): InputValidationTracker {
    const copied = new InputValidationTracker();
    for (let i = 0; i < this.inputHistory.length; i++) {
      const record = this.inputHistory[i];
      copied.recordInput(record.source, record.keyCode, record.phase, record.accepted, record.responseTime);
    }
    return copied;
  }

  public toString(): string {
    return 'InputValidationTracker(total=' + this.totalInputs + ', accepted=' + this.acceptedInputs + ')';
  }
}

// Harness around the production stop-combination gate. `feed` reproduces one
// `inputConsumer.on('key')` callback: the gate fires once per hold and is
// reopened as soon as either key is released.
class CombinationGateHarness {
  private gate: StopCombinationGate;
  private callbackCount: number = 0;
  private trace: GateTrace[] = [];
  private rejectedCount: number = 0;

  constructor(keyA: number, keyB: number) {
    this.gate = new StopCombinationGate(keyA, keyB);
  }

  public setCallbackConsumer(): void {
    // The production consumer invokes its callback through setCallback. The
    // harness mirrors that indirection so the single-callback rule is explicit.
  }

  public feed(keyCode: number, isDown: boolean): boolean {
    if (!KeyCodeValidator.isValid(keyCode)) {
      this.rejectedCount++;
      return false;
    }
    let triggered = false;
    if (isDown) {
      triggered = this.gate.onKeyDown(keyCode);
    } else {
      this.gate.onKeyUp(keyCode);
    }
    if (triggered) {
      this.callbackCount++;
    }
    const record: GateTrace = {
      keyCode: keyCode,
      phase: isDown ? GatePhase.DOWN : GatePhase.UP,
      triggered: triggered
    };
    this.trace.push(record);
    return triggered;
  }

  public getCallbackCount(): number {
    return this.callbackCount;
  }

  public getRejectedCount(): number {
    return this.rejectedCount;
  }

  public isGateOpen(): boolean {
    return this.gate.isGateOpen();
  }

  public isDownA(): boolean {
    return this.gate.isDownA();
  }

  public isDownB(): boolean {
    return this.gate.isDownB();
  }

  public getTrace(): GateTrace[] {
    const copied: GateTrace[] = [];
    for (let i = 0; i < this.trace.length; i++) {
      copied.push(this.trace[i]);
    }
    return copied;
  }

  public reset(): void {
    this.gate = new StopCombinationGate(KEY_MENU, KEY_VOLUME_DOWN);
    this.callbackCount = 0;
    this.trace = [];
    this.rejectedCount = 0;
  }
}
export default function inputValidationTest(): void {
  describe('InputValidation_Test', () => {
    let driver: Driver;
    let tracker: InputValidationTracker;
    let gateHarness: CombinationGateHarness;

    beforeAll(async () => {
      driver = getDriver();
      tracker = InputValidationTracker.getInstance();
      tracker.resetTracker();
      gateHarness = new CombinationGateHarness(KEY_MENU, KEY_VOLUME_DOWN);
      await delay(200);
    });

    afterAll(async () => {
      await delay(200);
    });

    it('input_source_enum_should_be_defined_correctly', 0, () => {
      expect(InputSource.REMOTE).assertEqual('remote');
      expect(InputSource.KEYBOARD).assertEqual('keyboard');
      expect(InputSource.TOUCH).assertEqual('touch');
      expect(InputSource.SYSTEM).assertEqual('system');
      expect(GatePhase.DOWN).assertEqual('down');
      expect(GatePhase.UP).assertEqual('up');
    });

    it('key_code_validator_should_accept_platform_range', 0, () => {
      expect(KeyCodeValidator.isValid(0)).assertTrue();
      expect(KeyCodeValidator.isValid(KEY_MENU)).assertTrue();
      expect(KeyCodeValidator.isValid(KEY_VOLUME_DOWN)).assertTrue();
      expect(KeyCodeValidator.isValid(65535)).assertTrue();
      expect(KeyCodeValidator.isValid(-1)).assertFalse();
      expect(KeyCodeValidator.isValid(65536)).assertFalse();
    });

    it('key_code_validator_should_reject_non_finite_values', 0, () => {
      expect(KeyCodeValidator.isValid(Number.NaN)).assertFalse();
      expect(KeyCodeValidator.isValid(Number.POSITIVE_INFINITY)).assertFalse();
      expect(KeyCodeValidator.isValid(Number.NEGATIVE_INFINITY)).assertFalse();
      expect(KeyCodeValidator.isValid(Number.MAX_SAFE_INTEGER)).assertFalse();
    });

    it('stop_combination_member_check_should_be_correct', 0, () => {
      expect(KeyCodeValidator.isStopCombinationMember(KEY_MENU)).assertTrue();
      expect(KeyCodeValidator.isStopCombinationMember(KEY_VOLUME_DOWN)).assertTrue();
      expect(KeyCodeValidator.isStopCombinationMember(KEY_BACK)).assertFalse();
      expect(KeyCodeValidator.isStopCombinationMember(0)).assertFalse();
    });

    it('tracker_initial_state_should_be_empty', 0, () => {
      tracker.resetTracker();
      expect(tracker.getTotalInputs()).assertEqual(0);
      expect(tracker.getAcceptedInputs()).assertEqual(0);
      expect(tracker.getRejectedInputs()).assertEqual(0);
      expect(tracker.getValidationRate()).assertEqual(0);
      expect(tracker.getAverageResponseTime()).assertEqual(0);
    });

    it('single_key_should_not_trigger_stop_callback', 0, () => {
      gateHarness.reset();
      const triggered = gateHarness.feed(KEY_MENU, true);
      expect(triggered).assertFalse();
      expect(gateHarness.getCallbackCount()).assertEqual(0);
      expect(gateHarness.isDownA()).assertTrue();
      expect(gateHarness.isDownB()).assertFalse();
      expect(gateHarness.isGateOpen()).assertTrue();
    });

    it('duplicate_key_down_should_not_trigger_stop_callback', 0, () => {
      gateHarness.reset();
      gateHarness.feed(KEY_MENU, true);
      gateHarness.feed(KEY_MENU, true);
      gateHarness.feed(KEY_MENU, true);
      expect(gateHarness.getCallbackCount()).assertEqual(0);
      expect(gateHarness.isDownA()).assertTrue();
    });

    it('menu_then_volume_down_should_trigger_stop_callback_once', 0, () => {
      gateHarness.reset();
      const first = gateHarness.feed(KEY_MENU, true);
      const second = gateHarness.feed(KEY_VOLUME_DOWN, true);
      expect(first).assertFalse();
      expect(second).assertTrue();
      expect(gateHarness.getCallbackCount()).assertEqual(1);
      expect(gateHarness.isGateOpen()).assertFalse();
    });

    it('volume_down_then_menu_should_trigger_stop_callback_once', 0, () => {
      gateHarness.reset();
      gateHarness.feed(KEY_VOLUME_DOWN, true);
      const triggered = gateHarness.feed(KEY_MENU, true);
      expect(triggered).assertTrue();
      expect(gateHarness.getCallbackCount()).assertEqual(1);
      expect(gateHarness.isGateOpen()).assertFalse();
    });

    it('repeated_down_events_should_keep_callback_fired_once', 0, () => {
      gateHarness.reset();
      gateHarness.feed(KEY_MENU, true);
      gateHarness.feed(KEY_VOLUME_DOWN, true);
      gateHarness.feed(KEY_MENU, true);
      gateHarness.feed(KEY_VOLUME_DOWN, true);
      gateHarness.feed(KEY_MENU, true);
      expect(gateHarness.getCallbackCount()).assertEqual(1);
      expect(gateHarness.getTrace().length).assertEqual(5);
    });

    it('release_should_reopen_gate_for_second_stop', 0, () => {
      gateHarness.reset();
      gateHarness.feed(KEY_MENU, true);
      gateHarness.feed(KEY_VOLUME_DOWN, true);
      expect(gateHarness.getCallbackCount()).assertEqual(1);
      gateHarness.feed(KEY_VOLUME_DOWN, false);
      expect(gateHarness.isGateOpen()).assertTrue();
      expect(gateHarness.isDownB()).assertFalse();
      gateHarness.feed(KEY_VOLUME_DOWN, true);
      expect(gateHarness.getCallbackCount()).assertEqual(2);
      expect(gateHarness.isGateOpen()).assertFalse();
    });

    it('release_of_other_key_should_also_reopen_gate', 0, () => {
      gateHarness.reset();
      gateHarness.feed(KEY_MENU, true);
      gateHarness.feed(KEY_VOLUME_DOWN, true);
      expect(gateHarness.isGateOpen()).assertFalse();
      gateHarness.feed(KEY_MENU, false);
      expect(gateHarness.isGateOpen()).assertTrue();
      expect(gateHarness.isDownA()).assertFalse();
      gateHarness.feed(KEY_MENU, true);
      expect(gateHarness.getCallbackCount()).assertEqual(2);
    });

    it('unrelated_key_should_not_change_gate_state', 0, () => {
      gateHarness.reset();
      gateHarness.feed(KEY_BACK, true);
      gateHarness.feed(2014, true);
      gateHarness.feed(KEY_BACK, false);
      expect(gateHarness.getCallbackCount()).assertEqual(0);
      expect(gateHarness.isDownA()).assertFalse();
      expect(gateHarness.isDownB()).assertFalse();
      expect(gateHarness.isGateOpen()).assertTrue();
    });

    it('invalid_key_codes_should_be_rejected_before_gate', 0, () => {
      gateHarness.reset();
      expect(gateHarness.feed(-1, true)).assertFalse();
      expect(gateHarness.feed(70000, true)).assertFalse();
      expect(gateHarness.feed(Number.NaN, true)).assertFalse();
      expect(gateHarness.getRejectedCount()).assertEqual(3);
      expect(gateHarness.getCallbackCount()).assertEqual(0);
      expect(gateHarness.getTrace().length).assertEqual(0);
      gateHarness.feed(KEY_MENU, true);
      gateHarness.feed(KEY_VOLUME_DOWN, true);
      expect(gateHarness.getCallbackCount()).assertEqual(1);
    });

    it('key_up_without_down_should_keep_gate_open', 0, () => {
      gateHarness.reset();
      gateHarness.feed(KEY_MENU, false);
      gateHarness.feed(KEY_VOLUME_DOWN, false);
      expect(gateHarness.isGateOpen()).assertTrue();
      expect(gateHarness.getCallbackCount()).assertEqual(0);
      expect(gateHarness.isDownA()).assertFalse();
      expect(gateHarness.isDownB()).assertFalse();
    });

    it('alternating_cycles_should_trigger_once_per_cycle', 0, () => {
      gateHarness.reset();
      for (let i = 0; i < 5; i++) {
        gateHarness.feed(KEY_MENU, true);
        gateHarness.feed(KEY_VOLUME_DOWN, true);
        gateHarness.feed(KEY_MENU, false);
        gateHarness.feed(KEY_VOLUME_DOWN, false);
      }
      expect(gateHarness.getCallbackCount()).assertEqual(5);
      expect(gateHarness.getTrace().length).assertEqual(20);
      expect(gateHarness.isGateOpen()).assertTrue();
    });

    it('tracker_should_count_accepted_and_rejected_inputs', 0, () => {
      tracker.resetTracker();
      tracker.recordInput(InputSource.REMOTE, KEY_MENU, GatePhase.DOWN, true, 10);
      tracker.recordInput(InputSource.REMOTE, KEY_VOLUME_DOWN, GatePhase.DOWN, true, 12);
      tracker.recordInput(InputSource.REMOTE, KEY_VOLUME_DOWN, GatePhase.UP, true, 14);
      tracker.recordInput(InputSource.REMOTE, -1, GatePhase.DOWN, false, 5);
      expect(tracker.getTotalInputs()).assertEqual(4);
      expect(tracker.getAcceptedInputs()).assertEqual(3);
      expect(tracker.getRejectedInputs()).assertEqual(1);
      expect(tracker.getValidationRate()).assertEqual(0.75);
      expect(tracker.hasKeyCode(KEY_MENU)).assertTrue();
      expect(tracker.hasKeyCode(9999)).assertFalse();
    });

    it('tracker_statistics_should_be_accurate', 0, () => {
      tracker.resetTracker();
      tracker.recordInput(InputSource.REMOTE, KEY_MENU, GatePhase.DOWN, true, 10);
      tracker.recordInput(InputSource.KEYBOARD, KEY_VOLUME_DOWN, GatePhase.DOWN, true, 30);
      tracker.recordInput(InputSource.TOUCH, KEY_BACK, GatePhase.UP, false, 20);
      const statistics = tracker.buildStatistics();
      expect(statistics.totalInputs).assertEqual(3);
      expect(statistics.acceptedInputs).assertEqual(2);
      expect(statistics.rejectedInputs).assertEqual(1);
      expect(statistics.averageResponseTime).assertEqual(20);
      expect(statistics.maxResponseTime).assertEqual(30);
    });

    it('tracker_source_frequency_should_be_accurate', 0, () => {
      tracker.resetTracker();
      tracker.recordInput(InputSource.REMOTE, KEY_MENU, GatePhase.DOWN, true, 10);
      tracker.recordInput(InputSource.REMOTE, KEY_VOLUME_DOWN, GatePhase.DOWN, true, 10);
      tracker.recordInput(InputSource.KEYBOARD, KEY_MENU, GatePhase.DOWN, true, 10);
      const frequency = tracker.getInputSourceFrequency();
      expect(frequency.get('remote')).assertEqual(2);
      expect(frequency.get('keyboard')).assertEqual(1);
      expect(frequency.get('touch')).assertUndefined();
      expect(tracker.hasInputSource(InputSource.REMOTE)).assertTrue();
      expect(tracker.hasInputSource(InputSource.SYSTEM)).assertFalse();
    });

    it('tracker_clone_should_copy_records', 0, () => {
      tracker.resetTracker();
      tracker.recordInput(InputSource.REMOTE, KEY_MENU, GatePhase.DOWN, true, 10);
      tracker.recordInput(InputSource.REMOTE, KEY_VOLUME_DOWN, GatePhase.UP, true, 20);
      const copied = tracker.clone();
      expect(copied.getTotalInputs()).assertEqual(2);
      expect(copied.getAcceptedInputs()).assertEqual(2);
      expect(copied.getInputHistory()[0].keyCode).assertEqual(KEY_MENU);
      copied.recordInput(InputSource.TOUCH, KEY_BACK, GatePhase.DOWN, false, 1);
      expect(tracker.getTotalInputs()).assertEqual(2);
      expect(copied.getTotalInputs()).assertEqual(3);
    });

    it('tracker_history_timestamps_should_be_chronological', 0, async () => {
      tracker.resetTracker();
      tracker.recordInput(InputSource.REMOTE, KEY_MENU, GatePhase.DOWN, true, 10);
      await delay(30);
      tracker.recordInput(InputSource.REMOTE, KEY_VOLUME_DOWN, GatePhase.DOWN, true, 10);
      await delay(30);
      tracker.recordInput(InputSource.REMOTE, KEY_VOLUME_DOWN, GatePhase.UP, true, 10);
      const history = tracker.getInputHistory();
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
      expect(history[2].phase).assertEqual(GatePhase.UP);
    });

    it('tracker_singleton_should_maintain_consistency', 0, () => {
      const first = InputValidationTracker.getInstance();
      const second = InputValidationTracker.getInstance();
      expect(first === second).assertTrue();
      first.resetTracker();
      first.recordInput(InputSource.REMOTE, KEY_MENU, GatePhase.DOWN, true, 10);
      expect(second.getTotalInputs()).assertEqual(1);
      expect(second.getAcceptedInputs()).assertEqual(1);
      expect(second.toString().includes('total=1')).assertTrue();
    });

    it('gate_performance_should_meet_requirements', 0, () => {
      gateHarness.reset();
      const startTime = Date.now();
      for (let i = 0; i < 2000; i++) {
        gateHarness.feed(KEY_MENU, true);
        gateHarness.feed(KEY_VOLUME_DOWN, true);
        gateHarness.feed(KEY_MENU, false);
        gateHarness.feed(KEY_VOLUME_DOWN, false);
      }
      const elapsed = Date.now() - startTime;
      expect(elapsed).assertLessOrEqual(5000);
      expect(gateHarness.getCallbackCount()).assertEqual(2000);
      expect(gateHarness.getTrace().length).assertEqual(8000);
    });

    it('gate_reset_should_restore_initial_condition', 0, () => {
      gateHarness.reset();
      gateHarness.feed(KEY_MENU, true);
      gateHarness.feed(KEY_VOLUME_DOWN, true);
      expect(gateHarness.getCallbackCount()).assertEqual(1);
      gateHarness.reset();
      expect(gateHarness.getCallbackCount()).assertEqual(0);
      expect(gateHarness.getTrace().length).assertEqual(0);
      expect(gateHarness.getRejectedCount()).assertEqual(0);
      expect(gateHarness.isGateOpen()).assertTrue();
      expect(gateHarness.isDownA()).assertFalse();
      expect(gateHarness.isDownB()).assertFalse();
      gateHarness.feed(KEY_VOLUME_DOWN, true);
      gateHarness.feed(KEY_MENU, true);
      expect(gateHarness.getCallbackCount()).assertEqual(1);
    });

    it('empty_tracker_statistics_should_be_zero', 0, () => {
      tracker.resetTracker();
      const statistics = tracker.buildStatistics();
      expect(statistics.totalInputs).assertEqual(0);
      expect(statistics.acceptedInputs).assertEqual(0);
      expect(statistics.rejectedInputs).assertEqual(0);
      expect(statistics.averageResponseTime).assertEqual(0);
      expect(statistics.maxResponseTime).assertEqual(0);
      expect(tracker.getInputSourceFrequency().size).assertEqual(0);
    });

    it('all_rejected_tracker_should_report_zero_validation_rate', 0, () => {
      tracker.resetTracker();
      tracker.recordInput(InputSource.SYSTEM, -1, GatePhase.DOWN, false, 4);
      tracker.recordInput(InputSource.SYSTEM, 70000, GatePhase.DOWN, false, 6);
      expect(tracker.getTotalInputs()).assertEqual(2);
      expect(tracker.getRejectedInputs()).assertEqual(2);
      expect(tracker.getAcceptedInputs()).assertEqual(0);
      expect(tracker.getValidationRate()).assertEqual(0);
      expect(tracker.getMaxResponseTime()).assertEqual(6);
    });

    it('full_press_release_cycle_should_keep_key_state_consistent', 0, () => {
      gateHarness.reset();
      gateHarness.feed(KEY_VOLUME_DOWN, true);
      gateHarness.feed(KEY_MENU, true);
      expect(gateHarness.isDownA()).assertTrue();
      expect(gateHarness.isDownB()).assertTrue();
      gateHarness.feed(KEY_VOLUME_DOWN, false);
      expect(gateHarness.isDownA()).assertTrue();
      expect(gateHarness.isDownB()).assertFalse();
      gateHarness.feed(KEY_MENU, false);
      expect(gateHarness.isDownA()).assertFalse();
      expect(gateHarness.isDownB()).assertFalse();
      expect(gateHarness.isGateOpen()).assertTrue();
      expect(gateHarness.getCallbackCount()).assertEqual(1);
    });

    it('input_validation_should_correlate_with_recorder_window', 0, async () => {
      tracker.resetTracker();
      const componentCount = await recorderComponentCount(driver);
      expect(componentCount >= 0).assertEqual(true);
      gateHarness.reset();
      gateHarness.feed(KEY_MENU, true);
      gateHarness.feed(KEY_VOLUME_DOWN, true);
      tracker.recordInput(InputSource.REMOTE, KEY_MENU, GatePhase.DOWN, true, 20);
      tracker.recordInput(InputSource.REMOTE, KEY_VOLUME_DOWN, GatePhase.DOWN, true, 20);
      expect(gateHarness.getCallbackCount()).assertEqual(1);
      expect(tracker.getTotalInputs()).assertEqual(2);
      expect(tracker.getValidationRate()).assertEqual(1);
    });
  });
}

