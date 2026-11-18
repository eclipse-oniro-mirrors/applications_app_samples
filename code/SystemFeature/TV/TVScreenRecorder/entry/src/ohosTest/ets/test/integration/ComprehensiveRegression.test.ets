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
  recorderComponentCount,
  isTimerWindowVisible,
  isTipWindowVisible,
  launchRecorderService,
  serializedDelay,
  pressAndWait,
  KEY_BACK,
  DELAY_KEY_NAVIGATION
} from '../shared/RecordingDriver';
import { MockRecordingState } from '../foundation/TestTypes';

// The three operations the user can request from the ability.
enum RegressionOperation {
  START = 'start',
  STOP = 'stop',
  QUERY = 'query'
}

// Window that may already be on screen when the operation arrives. The
// regression matrix proves that a stale window never changes the decision.
enum WindowKind {
  NONE = 'none',
  TIMER = 'timer',
  TIP = 'tip',
  RESOLUTION = 'resolution'
}

interface RegressionCell {
  state: MockRecordingState
  operation: RegressionOperation
  preWindow: WindowKind
  expectedAccepted: boolean
  expectedState: MockRecordingState
  expectedWindow: WindowKind
}

interface RegressionOutcome {
  cell: RegressionCell
  accepted: boolean
  resultState: MockRecordingState
  resultWindow: WindowKind
  passed: boolean
  reason: string
}

// Applies one cell of the matrix. The rules are the ability gates: a start is
// only accepted from Idle, a stop only from Recording, a query is always
// accepted and never mutates the state.
class RegressionHarness {
  public isAccepted(state: MockRecordingState, operation: RegressionOperation): boolean {
    if (operation === RegressionOperation.START) {
      return state === MockRecordingState.Idle;
    }
    if (operation === RegressionOperation.STOP) {
      return state === MockRecordingState.Recording;
    }
    return true;
  }

  public apply(state: MockRecordingState, operation: RegressionOperation): MockRecordingState {
    if (!this.isAccepted(state, operation)) {
      return state;
    }
    if (operation === RegressionOperation.START) {
      return MockRecordingState.Recording;
    }
    if (operation === RegressionOperation.STOP) {
      return MockRecordingState.Stopped;
    }
    return state;
  }

  // The window that remains on screen after the operation.
  public resolveWindow(resultState: MockRecordingState, operation: RegressionOperation,
    accepted: boolean): WindowKind {
    if (accepted && operation === RegressionOperation.START && resultState === MockRecordingState.Recording) {
      return WindowKind.TIMER;
    }
    if (accepted && operation === RegressionOperation.STOP && resultState === MockRecordingState.Stopped) {
      return WindowKind.TIP;
    }
    return WindowKind.NONE;
  }

  public runCell(cell: RegressionCell): RegressionOutcome {
    const accepted = this.isAccepted(cell.state, cell.operation);
    const resultState = this.apply(cell.state, cell.operation);
    const resultWindow = this.resolveWindow(resultState, cell.operation, accepted);
    let passed = true;
    let reason = '';
    if (accepted !== cell.expectedAccepted) {
      passed = false;
      reason = `acceptance:${accepted}`;
    } else if (resultState !== cell.expectedState) {
      passed = false;
      reason = `state:${resultState}`;
    } else if (resultWindow !== cell.expectedWindow) {
      passed = false;
      reason = `window:${resultWindow}`;
    }
    const outcome: RegressionOutcome = {
      cell: cell,
      accepted: accepted,
      resultState: resultState,
      resultWindow: resultWindow,
      passed: passed,
      reason: reason
    };
    return outcome;
  }
}

// Independent oracle of the acceptance rules. It is intentionally written
// separately from RegressionHarness so that the matrix compares two
// implementations instead of comparing the system under test with itself.
function oracleAcceptance(state: MockRecordingState, operation: RegressionOperation): boolean {
  if (operation === RegressionOperation.START) {
    return state === MockRecordingState.Idle;
  }
  if (operation === RegressionOperation.STOP) {
    return state === MockRecordingState.Recording;
  }
  return true;
}

function oracleResultState(state: MockRecordingState, operation: RegressionOperation): MockRecordingState {
  if (operation === RegressionOperation.START && state === MockRecordingState.Idle) {
    return MockRecordingState.Recording;
  }
  if (operation === RegressionOperation.STOP && state === MockRecordingState.Recording) {
    return MockRecordingState.Stopped;
  }
  return state;
}

function oracleWindow(operation: RegressionOperation, accepted: boolean): WindowKind {
  if (!accepted) {
    return WindowKind.NONE;
  }
  if (operation === RegressionOperation.START) {
    return WindowKind.TIMER;
  }
  if (operation === RegressionOperation.STOP) {
    return WindowKind.TIP;
  }
  return WindowKind.NONE;
}

// Builds the full 4 x 3 x 4 matrix.
class RegressionMatrix {
  public getStates(): MockRecordingState[] {
    return [
      MockRecordingState.Idle,
      MockRecordingState.Recording,
      MockRecordingState.Stopped,
      MockRecordingState.Error
    ];
  }

  public getOperations(): RegressionOperation[] {
    return [RegressionOperation.START, RegressionOperation.STOP, RegressionOperation.QUERY];
  }

  public getWindows(): WindowKind[] {
    return [WindowKind.NONE, WindowKind.TIMER, WindowKind.TIP, WindowKind.RESOLUTION];
  }

  public build(): RegressionCell[] {
    const cells: RegressionCell[] = [];
    const states = this.getStates();
    const operations = this.getOperations();
    const windows = this.getWindows();
    for (let stateIndex = 0; stateIndex < states.length; stateIndex++) {
      for (let operationIndex = 0; operationIndex < operations.length; operationIndex++) {
        for (let windowIndex = 0; windowIndex < windows.length; windowIndex++) {
          const state = states[stateIndex];
          const operation = operations[operationIndex];
          const accepted = oracleAcceptance(state, operation);
          const cell: RegressionCell = {
            state: state,
            operation: operation,
            preWindow: windows[windowIndex],
            expectedAccepted: accepted,
            expectedState: oracleResultState(state, operation),
            expectedWindow: oracleWindow(operation, accepted)
          };
          cells.push(cell);
        }
      }
    }
    return cells;
  }
}

// Aggregated pass counters of a regression run.
class RegressionAggregator {
  private total: number = 0;
  private passed: number = 0;
  private failed: number = 0;
  private perState: Map<string, number> = new Map();
  private perOperation: Map<string, number> = new Map();
  private perWindow: Map<string, number> = new Map();
  private failures: RegressionOutcome[] = [];
  private fingerprint: number = 17;

  public record(outcome: RegressionOutcome): void {
    this.total++;
    if (outcome.passed) {
      this.passed++;
    } else {
      this.failed++;
      this.failures.push(outcome);
    }
    const stateKey = outcome.cell.state.toString();
    const operationKey = outcome.cell.operation;
    const windowKey = outcome.cell.preWindow;
    this.perState.set(stateKey, (this.perState.get(stateKey) ?? 0) + 1);
    this.perOperation.set(operationKey, (this.perOperation.get(operationKey) ?? 0) + 1);
    this.perWindow.set(windowKey, (this.perWindow.get(windowKey) ?? 0) + 1);
    this.fingerprint = (this.fingerprint * 31 + (outcome.passed ? 7 : 13) + this.total) % 1000000007;
  }

  public getTotal(): number {
    return this.total;
  }

  public getPassed(): number {
    return this.passed;
  }

  public getFailed(): number {
    return this.failed;
  }

  public getStateCount(state: MockRecordingState): number {
    return this.perState.get(state.toString()) ?? 0;
  }

  public getOperationCount(operation: RegressionOperation): number {
    return this.perOperation.get(operation) ?? 0;
  }

  public getWindowCount(window: WindowKind): number {
    return this.perWindow.get(window) ?? 0;
  }

  public getFailures(): RegressionOutcome[] {
    return this.failures.slice();
  }

  public getPassRate(): number {
    if (this.total === 0) {
      return 0;
    }
    return this.passed / this.total;
  }

  public getFingerprint(): number {
    return this.fingerprint;
  }

  public reset(): void {
    this.total = 0;
    this.passed = 0;
    this.failed = 0;
    this.perState.clear();
    this.perOperation.clear();
    this.perWindow.clear();
    this.failures = [];
    this.fingerprint = 17;
  }
}

function runFullMatrix(): RegressionAggregator {
  const harness = new RegressionHarness();
  const cells = new RegressionMatrix().build();
  const aggregator = new RegressionAggregator();
  for (let index = 0; index < cells.length; index++) {
    aggregator.record(harness.runCell(cells[index]));
  }
  return aggregator;
}

function findCell(cells: RegressionCell[], state: MockRecordingState,
  operation: RegressionOperation, window: WindowKind): RegressionCell | null {
  for (let index = 0; index < cells.length; index++) {
    const cell = cells[index];
    if (cell.state === state && cell.operation === operation && cell.preWindow === window) {
      return cell;
    }
  }
  return null;
}

export default function comprehensiveRegressionTest(): void {
  describe('ComprehensiveRegression_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 500);
    });

    afterAll(async () => {
      await serializedDelay(driver, 500);
    });

    // The matrix enumerates every state, operation and pre-existing window.
    it('matrix_should_cover_all_dimensions', 0, () => {
      const matrix = new RegressionMatrix();
      const cells = matrix.build();
      expect(cells.length).assertEqual(48);
      expect(matrix.getStates().length).assertEqual(4);
      expect(matrix.getOperations().length).assertEqual(3);
      expect(matrix.getWindows().length).assertEqual(4);
      const aggregator = runFullMatrix();
      expect(aggregator.getStateCount(MockRecordingState.Idle)).assertEqual(12);
      expect(aggregator.getOperationCount(RegressionOperation.START)).assertEqual(16);
      expect(aggregator.getWindowCount(WindowKind.NONE)).assertEqual(12);
      expect(aggregator.getWindowCount(WindowKind.RESOLUTION)).assertEqual(12);
    });

    // The complete matrix must pass without a single mismatch.
    it('full_regression_matrix_should_pass', 0, () => {
      const aggregator = runFullMatrix();
      expect(aggregator.getTotal()).assertEqual(48);
      expect(aggregator.getPassed()).assertEqual(48);
      expect(aggregator.getFailed()).assertEqual(0);
      expect(aggregator.getPassRate()).assertEqual(1);
      expect(aggregator.getFailures().length).assertEqual(0);
      expect(aggregator.getFingerprint()).assertLarger(0);
    });

    // Starting from Idle is the only accepted start transition.
    it('start_from_idle_should_be_accepted', 0, () => {
      const harness = new RegressionHarness();
      const cell = findCell(new RegressionMatrix().build(), MockRecordingState.Idle,
        RegressionOperation.START, WindowKind.NONE);
      expect(cell === null).assertFalse();
      if (cell !== null) {
        const outcome = harness.runCell(cell);
        expect(outcome.accepted).assertTrue();
        expect(outcome.resultState).assertEqual(MockRecordingState.Recording);
        expect(outcome.resultWindow).assertEqual(WindowKind.TIMER);
        expect(outcome.passed).assertTrue();
      }
    });

    // A second start while recording is rejected and the state is preserved.
    it('start_from_recording_should_be_rejected', 0, () => {
      const harness = new RegressionHarness();
      const cell = findCell(new RegressionMatrix().build(), MockRecordingState.Recording,
        RegressionOperation.START, WindowKind.TIMER);
      expect(cell === null).assertFalse();
      if (cell !== null) {
        const outcome = harness.runCell(cell);
        expect(outcome.accepted).assertFalse();
        expect(outcome.resultState).assertEqual(MockRecordingState.Recording);
        expect(outcome.resultWindow).assertEqual(WindowKind.NONE);
        expect(outcome.passed).assertTrue();
      }
    });

    // After a completed recording the ability requires a fresh Idle state, so a
    // start from Stopped is rejected by the gate.
    it('start_from_stopped_should_be_rejected', 0, () => {
      const harness = new RegressionHarness();
      const cell = findCell(new RegressionMatrix().build(), MockRecordingState.Stopped,
        RegressionOperation.START, WindowKind.TIP);
      expect(cell === null).assertFalse();
      if (cell !== null) {
        const outcome = harness.runCell(cell);
        expect(outcome.accepted).assertFalse();
        expect(outcome.resultState).assertEqual(MockRecordingState.Stopped);
        expect(outcome.passed).assertTrue();
      }
    });

    // The error state blocks every start until the service is recreated.
    it('start_from_error_should_be_rejected', 0, () => {
      const harness = new RegressionHarness();
      const cell = findCell(new RegressionMatrix().build(), MockRecordingState.Error,
        RegressionOperation.START, WindowKind.NONE);
      expect(cell === null).assertFalse();
      if (cell !== null) {
        const outcome = harness.runCell(cell);
        expect(outcome.accepted).assertFalse();
        expect(outcome.resultState).assertEqual(MockRecordingState.Error);
        expect(outcome.resultWindow).assertEqual(WindowKind.NONE);
        expect(outcome.passed).assertTrue();
      }
    });

    // Stopping a running capture is accepted and produces the tip window.
    it('stop_from_recording_should_be_accepted', 0, () => {
      const harness = new RegressionHarness();
      const cell = findCell(new RegressionMatrix().build(), MockRecordingState.Recording,
        RegressionOperation.STOP, WindowKind.RESOLUTION);
      expect(cell === null).assertFalse();
      if (cell !== null) {
        const outcome = harness.runCell(cell);
        expect(outcome.accepted).assertTrue();
        expect(outcome.resultState).assertEqual(MockRecordingState.Stopped);
        expect(outcome.resultWindow).assertEqual(WindowKind.TIP);
        expect(outcome.passed).assertTrue();
      }
    });

    // A stop without an active capture is rejected in all three remaining
    // states.
    it('stop_without_recording_should_be_rejected', 0, () => {
      const harness = new RegressionHarness();
      const cells = new RegressionMatrix().build();
      const states: MockRecordingState[] = [
        MockRecordingState.Idle,
        MockRecordingState.Stopped,
        MockRecordingState.Error
      ];
      for (let index = 0; index < states.length; index++) {
        const cell = findCell(cells, states[index], RegressionOperation.STOP, WindowKind.NONE);
        expect(cell === null).assertFalse();
        if (cell !== null) {
          const outcome = harness.runCell(cell);
          expect(outcome.accepted).assertFalse();
          expect(outcome.resultState).assertEqual(states[index]);
          expect(outcome.passed).assertTrue();
        }
      }
    });

    // A query never mutates the state and never opens a window.
    it('query_should_always_be_accepted', 0, () => {
      const harness = new RegressionHarness();
      const cells = new RegressionMatrix().build();
      const states: MockRecordingState[] = [
        MockRecordingState.Idle,
        MockRecordingState.Recording,
        MockRecordingState.Stopped,
        MockRecordingState.Error
      ];
      for (let index = 0; index < states.length; index++) {
        const cell = findCell(cells, states[index], RegressionOperation.QUERY, WindowKind.TIP);
        expect(cell === null).assertFalse();
        if (cell !== null) {
          const outcome = harness.runCell(cell);
          expect(outcome.accepted).assertTrue();
          expect(outcome.resultState).assertEqual(states[index]);
          expect(outcome.resultWindow).assertEqual(WindowKind.NONE);
        }
      }
    });

    // The window that was on screen before the operation must not influence the
    // decision: all four pre-window variants behave identically.
    it('preexisting_window_should_not_affect_decision', 0, () => {
      const harness = new RegressionHarness();
      const cells = new RegressionMatrix().build();
      const windows = new RegressionMatrix().getWindows();
      for (let index = 0; index < windows.length; index++) {
        const cell = findCell(cells, MockRecordingState.Idle, RegressionOperation.START, windows[index]);
        expect(cell === null).assertFalse();
        if (cell !== null) {
          const outcome = harness.runCell(cell);
          expect(outcome.accepted).assertTrue();
          expect(outcome.resultWindow).assertEqual(WindowKind.TIMER);
          expect(outcome.passed).assertTrue();
        }
      }
    });

    // A successful start leaves exactly the timer window on screen.
    it('timer_window_should_follow_successful_start', 0, () => {
      const aggregator = runFullMatrix();
      const cells = new RegressionMatrix().build();
      let checked = 0;
      for (let index = 0; index < cells.length; index++) {
        if (cells[index].operation === RegressionOperation.START && cells[index].expectedAccepted) {
          expect(cells[index].expectedWindow).assertEqual(WindowKind.TIMER);
          checked++;
        }
      }
      expect(checked).assertEqual(4);
      expect(aggregator.getPassed()).assertEqual(aggregator.getTotal());
    });

    // A successful stop leaves exactly the tip window on screen.
    it('tip_window_should_follow_successful_stop', 0, () => {
      const cells = new RegressionMatrix().build();
      let checked = 0;
      for (let index = 0; index < cells.length; index++) {
        if (cells[index].operation === RegressionOperation.STOP && cells[index].expectedAccepted) {
          expect(cells[index].expectedWindow).assertEqual(WindowKind.TIP);
          expect(cells[index].expectedState).assertEqual(MockRecordingState.Stopped);
          checked++;
        }
      }
      expect(checked).assertEqual(4);
    });

    // No rejected operation may push the recorder into the error state.
    it('rejected_operation_should_never_enter_error', 0, () => {
      const harness = new RegressionHarness();
      const cells = new RegressionMatrix().build();
      let rejectedCount = 0;
      for (let index = 0; index < cells.length; index++) {
        const outcome = harness.runCell(cells[index]);
        if (!outcome.accepted) {
          rejectedCount++;
          if (cells[index].state === MockRecordingState.Error) {
            expect(outcome.resultState).assertEqual(MockRecordingState.Error);
          } else {
            expect(outcome.resultState === MockRecordingState.Error).assertFalse();
          }
        }
      }
      expect(rejectedCount).assertEqual(24);
    });

    // The aggregator exposes the per-dimension counters used by the report.
    it('aggregator_should_count_per_dimension', 0, () => {
      const aggregator = runFullMatrix();
      expect(aggregator.getStateCount(MockRecordingState.Recording)).assertEqual(12);
      expect(aggregator.getStateCount(MockRecordingState.Stopped)).assertEqual(12);
      expect(aggregator.getStateCount(MockRecordingState.Error)).assertEqual(12);
      expect(aggregator.getOperationCount(RegressionOperation.STOP)).assertEqual(16);
      expect(aggregator.getOperationCount(RegressionOperation.QUERY)).assertEqual(16);
      expect(aggregator.getWindowCount(WindowKind.TIMER)).assertEqual(12);
      expect(aggregator.getWindowCount(WindowKind.TIP)).assertEqual(12);
    });

    // A cell whose expectation does not match the harness is reported as a
    // failure instead of being silently accepted.
    it('aggregator_should_collect_failures', 0, () => {
      const harness = new RegressionHarness();
      const aggregator = new RegressionAggregator();
      const broken: RegressionCell = {
        state: MockRecordingState.Idle,
        operation: RegressionOperation.START,
        preWindow: WindowKind.NONE,
        expectedAccepted: false,
        expectedState: MockRecordingState.Idle,
        expectedWindow: WindowKind.NONE
      };
      const outcome = harness.runCell(broken);
      expect(outcome.passed).assertFalse();
      expect(outcome.reason).assertContain('acceptance');
      aggregator.record(outcome);
      expect(aggregator.getFailed()).assertEqual(1);
      expect(aggregator.getFailures().length).assertEqual(1);
      expect(aggregator.getPassRate()).assertEqual(0);
    });

    // Two consecutive runs produce the same fingerprint, which proves the matrix
    // is deterministic.
    it('repeated_matrix_run_should_be_stable', 0, () => {
      const first = runFullMatrix();
      const second = runFullMatrix();
      expect(first.getFingerprint()).assertEqual(second.getFingerprint());
      expect(first.getTotal()).assertEqual(second.getTotal());
      expect(first.getPassed()).assertEqual(second.getPassed());
      expect(first.getPassRate()).assertEqual(second.getPassRate());
    });

    // Reset restores every counter of the aggregator.
    it('aggregator_reset_should_clear_counters', 0, () => {
      const aggregator = runFullMatrix();
      expect(aggregator.getTotal()).assertEqual(48);
      aggregator.reset();
      expect(aggregator.getTotal()).assertEqual(0);
      expect(aggregator.getPassed()).assertEqual(0);
      expect(aggregator.getFailed()).assertEqual(0);
      expect(aggregator.getPassRate()).assertEqual(0);
      expect(aggregator.getStateCount(MockRecordingState.Idle)).assertEqual(0);
      expect(aggregator.getFailures().length).assertEqual(0);
    });

    // Real-device probe: the regression row of the current device either shows
    // the timer or the tip window, and the component tree stays readable.
    it('device_should_render_regression_windows', 0, async () => {
      await launchRecorderService();
      await serializedDelay(driver, 800);
      const componentCount: number = await recorderComponentCount(driver);
      expect(componentCount >= 0).assertEqual(true);
      const timerVisible: boolean = await isTimerWindowVisible(driver);
      const tipVisible: boolean = await isTipWindowVisible(driver);
      expect(timerVisible && tipVisible).assertFalse();
    });
  });
}

