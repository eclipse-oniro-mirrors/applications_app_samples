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

import { describe, it, expect, beforeAll, beforeEach, afterEach } from '@ohos/hypium';

// State of the recording engine exposed by libentry.so.
enum RecState {
  Idle = 0,
  Recording = 1,
  Stopped = 2,
  Error = 3
}

// Operation kinds accepted by ScreenRecorderAbility.onRequest.
enum OperationKind {
  START = 'start',
  STOP = 'stop',
  QUERY = 'query'
}

// Result of one synchronous recording operation.
interface OperationResult {
  kind: OperationKind;
  success: boolean;
  code: number;
  state: RecState;
  message: string;
}

// Journal entry recorded for every operation, used to validate ordering.
interface JournalEntry {
  sequence: number;
  kind: OperationKind;
  state: RecState;
  code: number;
}

// Guard configuration aligned with SRManager and ScreenRecorderAbility.
class OperationGuard {
  public static readonly START_ID: number = 1;
  public static readonly START_OK: number = 0;
  public static readonly STOP_OK: number = 0;
  public static readonly INVALID_STATE: number = -1000;
  public static readonly FD_PREFIX: string = 'fd://';
  public static readonly FILE_PREFIX: string = 'REC';
  public static readonly FILE_SUFFIX: string = '.mp4';

  public static canStart(state: RecState): boolean {
    return state === RecState.Idle;
  }

  public static canStop(state: RecState): boolean {
    return state === RecState.Recording;
  }

  public static isTerminal(state: RecState): boolean {
    return state === RecState.Stopped || state === RecState.Error;
  }

  public static startIdOf(kind: OperationKind): number {
    return kind === OperationKind.START ? OperationGuard.START_ID : 2;
  }

  public static kindOfStartId(startId: number): OperationKind {
    return startId === OperationGuard.START_ID ? OperationKind.START : OperationKind.STOP;
  }
}

// Deterministic clock so that generated file names are reproducible.
class OperationClock {
  private currentMs: number;

  constructor(seed: number = 1700000000000) {
    this.currentMs = seed;
  }

  public now(): number {
    return this.currentMs;
  }

  public advance(ms: number): number {
    this.currentMs += ms;
    return this.currentMs;
  }

  public reset(seed: number = 1700000000000): void {
    this.currentMs = seed;
  }
}

// Model of the recording service. It mirrors the observable behavior of
// ScreenRecorderAbility: only one recording may run at a time, a start request
// allocates a photo asset and a file descriptor, and a stop request releases it.
class RecordingServiceModel {
  private state: RecState = RecState.Idle;
  private clock: OperationClock;
  private fd: number = -1;
  private fdCounter: number = 100;
  private fileName: string = '';
  private journal: JournalEntry[] = [];
  private sequence: number = 0;
  private stateHistory: RecState[] = [RecState.Idle];
  private startCalls: number = 0;
  private stopCalls: number = 0;
  private failNextStart: boolean = false;
  private failNextStop: boolean = false;

  constructor(clock: OperationClock) {
    this.clock = clock;
  }

  private pad(value: number, length: number): string {
    return value.toString().padStart(length, '0');
  }

  public buildFileName(): string {
    const date = new Date(this.clock.now());
    const stamp = `${date.getFullYear()}${this.pad(date.getMonth() + 1, 2)}${this.pad(date.getDate(), 2)}`;
    const time = `${this.pad(date.getHours(), 2)}${this.pad(date.getMinutes(), 2)}${this.pad(date.getSeconds(), 2)}`;
    return `${OperationGuard.FILE_PREFIX}_${stamp}_${time}${OperationGuard.FILE_SUFFIX}`;
  }

  private record(kind: OperationKind, state: RecState, code: number): void {
    this.sequence++;
    this.journal.push({ sequence: this.sequence, kind: kind, state: state, code: code });
  }

  private changeState(next: RecState): void {
    this.state = next;
    this.stateHistory.push(next);
  }

  public start(): OperationResult {
    this.startCalls++;
    if (!OperationGuard.canStart(this.state)) {
      const blocked: OperationResult = {
        kind: OperationKind.START,
        success: false,
        code: OperationGuard.INVALID_STATE,
        state: this.state,
        message: 'invalid-state'
      };
      this.record(OperationKind.START, this.state, blocked.code);
      return blocked;
    }
    if (this.failNextStart) {
      this.failNextStart = false;
      this.changeState(RecState.Error);
      const failed: OperationResult = {
        kind: OperationKind.START,
        success: false,
        code: -1,
        state: this.state,
        message: 'start-failed'
      };
      this.record(OperationKind.START, this.state, failed.code);
      return failed;
    }
    this.fd = this.fdCounter++;
    this.fileName = this.buildFileName();
    this.changeState(RecState.Recording);
    const ok: OperationResult = {
      kind: OperationKind.START,
      success: true,
      code: OperationGuard.START_OK,
      state: this.state,
      message: `${OperationGuard.FD_PREFIX}${this.fd}`
    };
    this.record(OperationKind.START, this.state, ok.code);
    return ok;
  }

  public stop(): OperationResult {
    this.stopCalls++;
    if (!OperationGuard.canStop(this.state)) {
      const blocked: OperationResult = {
        kind: OperationKind.STOP,
        success: false,
        code: OperationGuard.INVALID_STATE,
        state: this.state,
        message: 'invalid-state'
      };
      this.record(OperationKind.STOP, this.state, blocked.code);
      return blocked;
    }
    if (this.failNextStop) {
      this.failNextStop = false;
      this.changeState(RecState.Error);
      const failed: OperationResult = {
        kind: OperationKind.STOP,
        success: false,
        code: -2,
        state: this.state,
        message: 'stop-failed'
      };
      this.record(OperationKind.STOP, this.state, failed.code);
      return failed;
    }
    this.changeState(RecState.Stopped);
    const ok: OperationResult = {
      kind: OperationKind.STOP,
      success: true,
      code: OperationGuard.STOP_OK,
      state: this.state,
      message: this.fileName
    };
    this.record(OperationKind.STOP, this.state, ok.code);
    return ok;
  }

  public query(): OperationResult {
    const result: OperationResult = {
      kind: OperationKind.QUERY,
      success: true,
      code: 0,
      state: this.state,
      message: `${this.state}`
    };
    this.record(OperationKind.QUERY, this.state, result.code);
    return result;
  }

  public dispatch(startId: number): OperationResult {
    const kind = OperationGuard.kindOfStartId(startId);
    if (kind === OperationKind.START) {
      return this.start();
    }
    return this.stop();
  }

  public reset(): void {
    this.changeState(RecState.Idle);
  }

  public forceError(): void {
    this.changeState(RecState.Error);
  }

  public setFailNextStart(value: boolean): void {
    this.failNextStart = value;
  }

  public setFailNextStop(value: boolean): void {
    this.failNextStop = value;
  }

  public getState(): RecState {
    return this.state;
  }

  public getStateHistory(): RecState[] {
    return this.stateHistory.slice();
  }

  public getJournal(): JournalEntry[] {
    return this.journal.slice();
  }

  public getFd(): number {
    return this.fd;
  }

  public getFileName(): string {
    return this.fileName;
  }

  public getStartCalls(): number {
    return this.startCalls;
  }

  public getStopCalls(): number {
    return this.stopCalls;
  }
}

// One scenario of the operation regression matrix.
interface OperationScenario {
  name: string;
  preState: RecState;
  kind: OperationKind;
  failStart: boolean;
  failStop: boolean;
  expectedState: RecState;
  expectedSuccess: boolean;
}

class OperationScenarioEntity implements OperationScenario {
  name: string;
  preState: RecState;
  kind: OperationKind;
  failStart: boolean;
  failStop: boolean;
  expectedState: RecState;
  expectedSuccess: boolean;

  constructor(name: string, preState: RecState, kind: OperationKind, failStart: boolean, failStop: boolean,
    expectedState: RecState, expectedSuccess: boolean) {
    this.name = name;
    this.preState = preState;
    this.kind = kind;
    this.failStart = failStart;
    this.failStop = failStop;
    this.expectedState = expectedState;
    this.expectedSuccess = expectedSuccess;
  }
}

function buildScenarios(): OperationScenario[] {
  const scenarios: OperationScenario[] = [];
  scenarios.push(new OperationScenarioEntity('start-from-idle', RecState.Idle, OperationKind.START,
    false, false, RecState.Recording, true));
  scenarios.push(new OperationScenarioEntity('start-from-recording', RecState.Recording, OperationKind.START,
    false, false, RecState.Recording, false));
  scenarios.push(new OperationScenarioEntity('start-from-stopped', RecState.Stopped, OperationKind.START,
    false, false, RecState.Stopped, false));
  scenarios.push(new OperationScenarioEntity('start-from-error', RecState.Error, OperationKind.START,
    false, false, RecState.Error, false));
  scenarios.push(new OperationScenarioEntity('start-failure', RecState.Idle, OperationKind.START,
    true, false, RecState.Error, false));
  scenarios.push(new OperationScenarioEntity('stop-from-recording', RecState.Recording, OperationKind.STOP,
    false, false, RecState.Stopped, true));
  scenarios.push(new OperationScenarioEntity('stop-from-idle', RecState.Idle, OperationKind.STOP,
    false, false, RecState.Idle, false));
  scenarios.push(new OperationScenarioEntity('stop-from-stopped', RecState.Stopped, OperationKind.STOP,
    false, false, RecState.Stopped, false));
  scenarios.push(new OperationScenarioEntity('stop-failure', RecState.Recording, OperationKind.STOP,
    false, true, RecState.Error, false));
  return scenarios;
}

function prepareModel(scenario: OperationScenario): RecordingServiceModel {
  const clock = new OperationClock();
  const model = new RecordingServiceModel(clock);
  if (scenario.preState === RecState.Recording) {
    model.start();
  } else if (scenario.preState === RecState.Stopped) {
    model.start();
    model.stop();
  } else if (scenario.preState === RecState.Error) {
    model.forceError();
  }
  model.setFailNextStart(scenario.failStart);
  model.setFailNextStop(scenario.failStop);
  return model;
}

export default function recordingOperationsTest(): void {
  describe('RecordingOperations_Test', () => {
    let clock: OperationClock;
    let service: RecordingServiceModel;

    beforeAll(() => {
      clock = new OperationClock();
    });

    beforeEach(() => {
      clock.reset();
      service = new RecordingServiceModel(clock);
    });

    afterEach(() => {
      service = new RecordingServiceModel(clock);
    });

    it('start_operation_should_enter_recording_state', 0, () => {
      const result = service.start();
      expect(result.success).assertEqual(true);
      expect(result.kind).assertEqual(OperationKind.START);
      expect(result.code).assertEqual(0);
      expect(result.state).assertEqual(RecState.Recording);
      expect(service.getState()).assertEqual(RecState.Recording);
      expect(service.getStartCalls()).assertEqual(1);
    });

    it('start_operation_should_allocate_fd_and_url', 0, () => {
      const result = service.start();
      expect(service.getFd()).assertEqual(100);
      expect(result.message).assertEqual('fd://100');
      expect(result.message.startsWith('fd://')).assertEqual(true);
      expect(result.message.length).assertEqual(8);
    });

    it('start_operation_should_generate_recording_file_name', 0, () => {
      service.start();
      const name = service.getFileName();
      expect(name.startsWith('REC_')).assertEqual(true);
      expect(name.endsWith('.mp4')).assertEqual(true);
      expect(name.length).assertEqual(23);
      expect(name.indexOf('_')).assertEqual(3);
      expect(name.indexOf('_', 4)).assertEqual(12);
    });

    it('stop_operation_should_enter_stopped_state', 0, () => {
      service.start();
      const result = service.stop();
      expect(result.success).assertEqual(true);
      expect(result.kind).assertEqual(OperationKind.STOP);
      expect(result.code).assertEqual(0);
      expect(result.state).assertEqual(RecState.Stopped);
      expect(service.getState()).assertEqual(RecState.Stopped);
      expect(service.getStopCalls()).assertEqual(1);
    });

    it('stop_operation_should_return_persisted_file_name', 0, () => {
      service.start();
      const expected = service.getFileName();
      const result = service.stop();
      expect(result.message).assertEqual(expected);
      expect(result.message.endsWith('.mp4')).assertEqual(true);
    });

    it('duplicated_start_should_be_rejected', 0, () => {
      service.start();
      const second = service.start();
      expect(second.success).assertEqual(false);
      expect(second.code).assertEqual(-1000);
      expect(second.message).assertEqual('invalid-state');
      expect(service.getState()).assertEqual(RecState.Recording);
      expect(service.getStartCalls()).assertEqual(2);
    });

    it('stop_without_start_should_be_rejected', 0, () => {
      const result = service.stop();
      expect(result.success).assertEqual(false);
      expect(result.code).assertEqual(-1000);
      expect(service.getState()).assertEqual(RecState.Idle);
      expect(service.getStopCalls()).assertEqual(1);
    });

    it('start_failure_should_switch_to_error_state', 0, () => {
      service.setFailNextStart(true);
      const result = service.start();
      expect(result.success).assertEqual(false);
      expect(result.code).assertEqual(-1);
      expect(result.message).assertEqual('start-failed');
      expect(service.getState()).assertEqual(RecState.Error);
    });

    it('stop_failure_should_switch_to_error_state', 0, () => {
      service.start();
      service.setFailNextStop(true);
      const result = service.stop();
      expect(result.success).assertEqual(false);
      expect(result.code).assertEqual(-2);
      expect(result.message).assertEqual('stop-failed');
      expect(service.getState()).assertEqual(RecState.Error);
    });

    it('query_operation_should_not_change_state', 0, () => {
      service.start();
      const before = service.getState();
      const result = service.query();
      expect(result.success).assertEqual(true);
      expect(result.kind).assertEqual(OperationKind.QUERY);
      expect(result.state).assertEqual(before);
      expect(service.getState()).assertEqual(before);
    });

    it('dispatch_should_map_start_id_one_to_start', 0, () => {
      const result = service.dispatch(1);
      expect(result.kind).assertEqual(OperationKind.START);
      expect(result.success).assertEqual(true);
      expect(OperationGuard.startIdOf(OperationKind.START)).assertEqual(1);
      expect(OperationGuard.kindOfStartId(1)).assertEqual(OperationKind.START);
    });

    it('dispatch_should_map_other_start_ids_to_stop', 0, () => {
      service.start();
      const result = service.dispatch(2);
      expect(result.kind).assertEqual(OperationKind.STOP);
      expect(result.success).assertEqual(true);
      expect(OperationGuard.kindOfStartId(2)).assertEqual(OperationKind.STOP);
      expect(OperationGuard.kindOfStartId(9)).assertEqual(OperationKind.STOP);
      expect(OperationGuard.startIdOf(OperationKind.STOP)).assertEqual(2);
    });

    it('operation_journal_should_keep_monotonic_sequence', 0, () => {
      service.start();
      service.query();
      service.stop();
      const journal = service.getJournal();
      expect(journal.length).assertEqual(3);
      expect(journal[0].sequence).assertEqual(1);
      expect(journal[1].sequence).assertEqual(2);
      expect(journal[2].sequence).assertEqual(3);
      expect(journal[0].kind).assertEqual(OperationKind.START);
      expect(journal[1].kind).assertEqual(OperationKind.QUERY);
      expect(journal[2].kind).assertEqual(OperationKind.STOP);
    });

    it('operation_journal_should_record_failure_codes', 0, () => {
      service.stop();
      const journal = service.getJournal();
      expect(journal.length).assertEqual(1);
      expect(journal[0].code).assertEqual(-1000);
      expect(journal[0].state).assertEqual(RecState.Idle);
    });

    it('scenario_matrix_should_match_expected_state_and_result', 0, () => {
      const scenarios = buildScenarios();
      expect(scenarios.length).assertEqual(9);
      for (let i = 0; i < scenarios.length; i++) {
        const scenario = scenarios[i];
        const model = prepareModel(scenario);
        const result = scenario.kind === OperationKind.START ? model.start() : model.stop();
        expect(result.success).assertEqual(scenario.expectedSuccess);
        expect(model.getState()).assertEqual(scenario.expectedState);
      }
    });

    it('repeated_start_stop_cycles_should_keep_state_consistent', 0, () => {
      let cycles = 0;
      for (let i = 0; i < 5; i++) {
        const startResult = service.start();
        if (!startResult.success) {
          break;
        }
        service.reset();
        cycles++;
      }
      expect(cycles).assertEqual(5);
      expect(service.getStartCalls()).assertEqual(5);
    });

    it('state_history_should_capture_every_transition', 0, () => {
      service.start();
      service.stop();
      const history = service.getStateHistory();
      expect(history.length).assertEqual(3);
      expect(history[0]).assertEqual(RecState.Idle);
      expect(history[1]).assertEqual(RecState.Recording);
      expect(history[2]).assertEqual(RecState.Stopped);
    });

    it('fd_allocation_should_increase_monotonically', 0, () => {
      const first = service.start();
      expect(first.message).assertEqual('fd://100');
      service.reset();
      const second = service.start();
      expect(second.message).assertEqual('fd://101');
      service.reset();
      const third = service.start();
      expect(third.message).assertEqual('fd://102');
      expect(service.getFd()).assertEqual(102);
    });

    it('file_name_should_follow_clock_progression', 0, () => {
      service.start();
      const first = service.getFileName();
      service.reset();
      clock.advance(3600 * 1000);
      const second = service.start();
      expect(second.success).assertEqual(true);
      const name = service.getFileName();
      expect(name.startsWith('REC_')).assertEqual(true);
      expect(name.endsWith('.mp4')).assertEqual(true);
      expect(name === first).assertEqual(false);
      expect(name.substring(0, 4)).assertEqual(first.substring(0, 4));
    });

    it('invalid_transitions_should_not_pollute_state_history', 0, () => {
      service.stop();
      service.stop();
      const history = service.getStateHistory();
      expect(history.length).assertEqual(1);
      expect(history[0]).assertEqual(RecState.Idle);
      expect(service.getJournal().length).assertEqual(2);
    });

    it('reset_should_allow_restart_after_stop', 0, () => {
      service.start();
      service.stop();
      expect(service.getState()).assertEqual(RecState.Stopped);
      service.reset();
      expect(service.getState()).assertEqual(RecState.Idle);
      const restart = service.start();
      expect(restart.success).assertEqual(true);
      expect(restart.state).assertEqual(RecState.Recording);
    });

    it('terminal_state_predicate_should_be_complete', 0, () => {
      expect(OperationGuard.isTerminal(RecState.Stopped)).assertEqual(true);
      expect(OperationGuard.isTerminal(RecState.Error)).assertEqual(true);
      expect(OperationGuard.isTerminal(RecState.Idle)).assertEqual(false);
      expect(OperationGuard.isTerminal(RecState.Recording)).assertEqual(false);
    });

    it('start_after_error_should_be_rejected_until_reset', 0, () => {
      service.setFailNextStart(true);
      service.start();
      expect(service.getState()).assertEqual(RecState.Error);
      const blocked = service.start();
      expect(blocked.success).assertEqual(false);
      expect(blocked.code).assertEqual(-1000);
      service.reset();
      const recovered = service.start();
      expect(recovered.success).assertEqual(true);
      expect(recovered.state).assertEqual(RecState.Recording);
    });

    it('stop_from_error_state_should_be_rejected', 0, () => {
      service.forceError();
      const result = service.stop();
      expect(result.success).assertEqual(false);
      expect(result.code).assertEqual(-1000);
      expect(service.getState()).assertEqual(RecState.Error);
    });

    it('file_names_should_be_unique_across_seconds', 0, () => {
      const names: string[] = [];
      for (let i = 0; i < 6; i++) {
        service.start();
        names.push(service.getFileName());
        service.reset();
        clock.advance(1000);
      }
      expect(names.length).assertEqual(6);
      let unique = true;
      for (let i = 0; i < names.length; i++) {
        for (let j = i + 1; j < names.length; j++) {
          if (names[i] === names[j]) {
            unique = false;
          }
        }
      }
      expect(unique).assertEqual(true);
      expect(names[0].length).assertEqual(23);
      expect(names[5].length).assertEqual(23);
      expect(names[0].substring(0, 16)).assertEqual(names[5].substring(0, 16));
      expect(names[0].slice(-6) === names[5].slice(-6)).assertEqual(false);
    });

    it('operation_result_should_always_carry_state_and_kind', 0, () => {
      const results: OperationResult[] = [];
      results.push(service.start());
      results.push(service.query());
      results.push(service.stop());
      results.push(service.stop());
      expect(results.length).assertEqual(4);
      for (let i = 0; i < results.length; i++) {
        expect(results[i].kind.length > 0).assertEqual(true);
        expect(results[i].message.length > 0).assertEqual(true);
        expect(results[i].state >= RecState.Idle).assertEqual(true);
        expect(results[i].state <= RecState.Error).assertEqual(true);
      }
    });

    it('mixed_operation_stream_should_stay_ordered', 0, () => {
      service.start();
      service.query();
      service.start();
      service.stop();
      service.query();
      service.stop();
      const journal = service.getJournal();
      expect(journal.length).assertEqual(6);
      expect(journal[0].code).assertEqual(0);
      expect(journal[1].kind).assertEqual(OperationKind.QUERY);
      expect(journal[2].code).assertEqual(-1000);
      expect(journal[3].code).assertEqual(0);
      expect(journal[4].kind).assertEqual(OperationKind.QUERY);
      expect(journal[5].code).assertEqual(-1000);
      expect(service.getState()).assertEqual(RecState.Stopped);
    });
  });
}

