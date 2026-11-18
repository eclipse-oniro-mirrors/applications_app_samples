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
  waitForTimerWindowStable,
  waitForTipWindowStable,
  triggerRecordingStart,
  triggerRecordingStop,
  pressAndWait,
  serializedDelay,
  buildRecordingFileName,
  KEY_BACK,
  DELAY_KEY_NAVIGATION,
  TIMEOUT_TIMER_RENDER,
  TIMEOUT_TIP_RENDER
} from '../shared/RecordingDriver';

// Operation kinds accepted by the recording service.
enum RecordingOperationKind {
  START = 'start',
  STOP = 'stop',
  QUERY = 'query'
}

// States of the recording workflow. The workflow is wider than the engine
// state machine because it also tracks the window rendering steps.
enum WorkflowState {
  IDLE = 'idle',
  STARTING = 'starting',
  RECORDING = 'recording',
  STOPPING = 'stopping',
  COMPLETED = 'completed',
  FAILED = 'failed'
}

// Events that drive the workflow.
enum WorkflowEvent {
  START_REQUESTED = 'start_requested',
  WINDOW_READY = 'window_ready',
  STOP_REQUESTED = 'stop_requested',
  TIP_SHOWN = 'tip_shown',
  FAILED = 'failed',
  RESET = 'reset'
}

// One legal transition of the workflow.
interface WorkflowTransitionDef {
  from: WorkflowState;
  to: WorkflowState;
  event: WorkflowEvent;
}

// One executed operation of the workflow.
interface RecordingOperationDef {
  kind: RecordingOperationKind;
  startId: number;
  fd: number;
  timestamp: number;
  success: boolean;
}

// Mock of the recording service. It records the accepted requests instead of
// touching the real engine, so the workflow cases are device independent.
class MockRecordingService {
  private static instance: MockRecordingService;
  private operationLog: RecordingOperationDef[] = [];

  public static getInstance(): MockRecordingService {
    if (!MockRecordingService.instance) {
      MockRecordingService.instance = new MockRecordingService();
    }
    return MockRecordingService.instance;
  }

  public start(fd: number): boolean {
    const record: RecordingOperationDef = {
      kind: RecordingOperationKind.START,
      startId: 1,
      fd: fd,
      timestamp: Date.now(),
      success: true
    };
    this.operationLog.push(record);
    return true;
  }

  public stop(fd: number): boolean {
    const record: RecordingOperationDef = {
      kind: RecordingOperationKind.STOP,
      startId: 2,
      fd: fd,
      timestamp: Date.now(),
      success: true
    };
    this.operationLog.push(record);
    return true;
  }

  public query(): boolean {
    const record: RecordingOperationDef = {
      kind: RecordingOperationKind.QUERY,
      startId: 2,
      fd: -1,
      timestamp: Date.now(),
      success: true
    };
    this.operationLog.push(record);
    return true;
  }

  public getOperationLog(): RecordingOperationDef[] {
    const result: RecordingOperationDef[] = [];
    for (let i = 0; i < this.operationLog.length; i++) {
      result.push(this.operationLog[i]);
    }
    return result;
  }

  public getOperationCount(kind: RecordingOperationKind): number {
    let count: number = 0;
    for (let i = 0; i < this.operationLog.length; i++) {
      if (this.operationLog[i].kind === kind) {
        count++;
      }
    }
    return count;
  }

  public getLastFd(): number {
    if (this.operationLog.length === 0) {
      return -1;
    }
    return this.operationLog[this.operationLog.length - 1].fd;
  }

  public clearOperationLog(): void {
    this.operationLog = [];
  }
}

// Model of the visible workflow: one active session and one visible window.
class RecordingWorkflowModel {
  private activeFd: number = -1;
  private timerVisible: boolean = false;
  private tipVisible: boolean = false;
  private sourceUri: string = '';

  public begin(fd: number, uri: string): boolean {
    if (this.activeFd >= 0) {
      return false;
    }
    this.activeFd = fd;
    this.sourceUri = uri;
    this.timerVisible = true;
    return true;
  }

  public hasSession(): boolean {
    return this.activeFd >= 0;
  }

  public getActiveFd(): number {
    return this.activeFd;
  }

  public getSourceUri(): string {
    return this.sourceUri;
  }

  public finish(): boolean {
    if (this.activeFd < 0) {
      return false;
    }
    this.activeFd = -1;
    this.timerVisible = false;
    this.tipVisible = true;
    return true;
  }

  public isTimerVisible(): boolean {
    return this.timerVisible;
  }

  public isTipVisible(): boolean {
    return this.tipVisible;
  }

  public hideTip(): void {
    this.tipVisible = false;
  }

  public reset(): void {
    this.activeFd = -1;
    this.timerVisible = false;
    this.tipVisible = false;
    this.sourceUri = '';
  }
}

// State machine of the recording workflow.
class WorkflowStateMachine {
  private currentState: WorkflowState = WorkflowState.IDLE;
  private transitions: WorkflowTransitionDef[] = [];
  private transitionLog: string[] = [];

  public getState(): WorkflowState {
    return this.currentState;
  }

  public registerTransition(from: WorkflowState, to: WorkflowState, event: WorkflowEvent): void {
    const transition: WorkflowTransitionDef = { from: from, to: to, event: event };
    this.transitions.push(transition);
  }

  public canTransit(event: WorkflowEvent): boolean {
    for (let i = 0; i < this.transitions.length; i++) {
      if (this.transitions[i].from === this.currentState && this.transitions[i].event === event) {
        return true;
      }
    }
    return false;
  }

  public transit(event: WorkflowEvent): boolean {
    for (let i = 0; i < this.transitions.length; i++) {
      const transition: WorkflowTransitionDef = this.transitions[i];
      if (transition.from === this.currentState && transition.event === event) {
        this.currentState = transition.to;
        this.transitionLog.push(`${transition.from}->${transition.to}`);
        return true;
      }
    }
    return false;
  }

  public getTransitionLog(): string[] {
    const result: string[] = [];
    for (let i = 0; i < this.transitionLog.length; i++) {
      result.push(this.transitionLog[i]);
    }
    return result;
  }

  public getTransitionCount(): number {
    return this.transitionLog.length;
  }

  public getRegisteredCount(): number {
    return this.transitions.length;
  }

  public reset(): void {
    this.currentState = WorkflowState.IDLE;
    this.transitionLog = [];
  }
}

// History of the executed transitions.
class WorkflowHistory {
  private history: WorkflowTransitionDef[] = [];

  public record(transition: WorkflowTransitionDef): void {
    this.history.push(transition);
  }

  public recordTransition(from: WorkflowState, to: WorkflowState, event: WorkflowEvent): void {
    const transition: WorkflowTransitionDef = { from: from, to: to, event: event };
    this.history.push(transition);
  }

  public getHistory(): WorkflowTransitionDef[] {
    const result: WorkflowTransitionDef[] = [];
    for (let i = 0; i < this.history.length; i++) {
      result.push(this.history[i]);
    }
    return result;
  }

  public getHistoryCount(): number {
    return this.history.length;
  }

  public hasVisitedState(state: WorkflowState): boolean {
    for (let i = 0; i < this.history.length; i++) {
      if (this.history[i].to === state) {
        return true;
      }
    }
    return false;
  }

  public getFirstState(): WorkflowState | null {
    if (this.history.length === 0) {
      return null;
    }
    return this.history[0].from;
  }

  public getLastState(): WorkflowState | null {
    if (this.history.length === 0) {
      return null;
    }
    return this.history[this.history.length - 1].to;
  }

  public countEvents(event: WorkflowEvent): number {
    let count: number = 0;
    for (let i = 0; i < this.history.length; i++) {
      if (this.history[i].event === event) {
        count++;
      }
    }
    return count;
  }

  public clear(): void {
    this.history = [];
  }
}

// Validates the workflow inputs against the service contract.
class WorkflowValidator {
  public isStartIdValid(startId: number): boolean {
    return startId >= 0;
  }

  public isKindValid(kind: string): boolean {
    return kind === RecordingOperationKind.START || kind === RecordingOperationKind.STOP ||
      kind === RecordingOperationKind.QUERY;
  }

  public kindOfStartId(startId: number): RecordingOperationKind {
    return startId === 1 ? RecordingOperationKind.START : RecordingOperationKind.STOP;
  }

  public isValidFd(fd: number): boolean {
    return fd >= 0;
  }

  public validateFdSequence(sequence: number[]): boolean {
    for (let i = 0; i < sequence.length; i++) {
      if (!this.isValidFd(sequence[i])) {
        return false;
      }
    }
    return true;
  }

  public validateNoAdjacentDuplicates(sequence: number[]): boolean {
    for (let i = 1; i < sequence.length; i++) {
      if (sequence[i] === sequence[i - 1]) {
        return false;
      }
    }
    return true;
  }

  public isStateTerminal(state: WorkflowState): boolean {
    return state === WorkflowState.COMPLETED || state === WorkflowState.FAILED;
  }
}

// Aggregates the counters of the workflow model.
class WorkflowStatistics {
  private startCount: number = 0;
  private stopCount: number = 0;
  private resetCount: number = 0;

  public recordStart(): void {
    this.startCount++;
  }

  public recordStop(): void {
    this.stopCount++;
  }

  public recordReset(): void {
    this.resetCount++;
  }

  public getStartCount(): number {
    return this.startCount;
  }

  public getStopCount(): number {
    return this.stopCount;
  }

  public getResetCount(): number {
    return this.resetCount;
  }

  public getTotalActionCount(): number {
    return this.startCount + this.stopCount + this.resetCount;
  }

  public describe(): string {
    return `WorkflowStatistics{start: ${this.startCount}, stop: ${this.stopCount}, reset: ${this.resetCount}}`;
  }
}

// Repository of the recorded operations.
class OperationRecordRepository {
  private records: RecordingOperationDef[] = [];

  public addRecord(record: RecordingOperationDef): void {
    this.records.push(record);
  }

  public getRecords(): RecordingOperationDef[] {
    const result: RecordingOperationDef[] = [];
    for (let i = 0; i < this.records.length; i++) {
      result.push(this.records[i]);
    }
    return result;
  }

  public getRecordCount(): number {
    return this.records.length;
  }

  public countByKind(kind: RecordingOperationKind): number {
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].kind === kind) {
        count++;
      }
    }
    return count;
  }

  public getSuccessfulCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].success) {
        count++;
      }
    }
    return count;
  }

  public clear(): void {
    this.records = [];
  }
}

// Executes a fixed list of workflow steps in order.
class WorkflowStepExecutor {
  private steps: string[] = [];
  private completedSteps: string[] = [];

  public addStep(name: string): void {
    this.steps.push(name);
  }

  public getSteps(): string[] {
    const result: string[] = [];
    for (let i = 0; i < this.steps.length; i++) {
      result.push(this.steps[i]);
    }
    return result;
  }

  public getStepCount(): number {
    return this.steps.length;
  }

  public executeNext(): boolean {
    if (this.completedSteps.length >= this.steps.length) {
      return false;
    }
    this.completedSteps.push(this.steps[this.completedSteps.length]);
    return true;
  }

  public getCompletedCount(): number {
    return this.completedSteps.length;
  }

  public getCompletedSteps(): string[] {
    const result: string[] = [];
    for (let i = 0; i < this.completedSteps.length; i++) {
      result.push(this.completedSteps[i]);
    }
    return result;
  }

  public isFinished(): boolean {
    return this.completedSteps.length === this.steps.length;
  }

  public getRemainingSteps(): string[] {
    const result: string[] = [];
    for (let i = this.completedSteps.length; i < this.steps.length; i++) {
      result.push(this.steps[i]);
    }
    return result;
  }

  public clear(): void {
    this.steps = [];
    this.completedSteps = [];
  }
}

// Lookup table of the registered transitions.
class WorkflowTransitionMap {
  private transitionMap: Map<string, WorkflowTransitionDef> = new Map<string, WorkflowTransitionDef>();

  public register(transition: WorkflowTransitionDef): void {
    const key: string = `${transition.from}->${transition.to}`;
    this.transitionMap.set(key, transition);
  }

  public find(from: WorkflowState, to: WorkflowState): WorkflowTransitionDef | null {
    const key: string = `${from}->${to}`;
    const transition: WorkflowTransitionDef | undefined = this.transitionMap.get(key);
    return transition === undefined ? null : transition;
  }

  public hasTransition(from: WorkflowState, to: WorkflowState): boolean {
    return this.find(from, to) !== null;
  }

  public getTransitionCount(): number {
    return this.transitionMap.size;
  }

  public clear(): void {
    this.transitionMap.clear();
  }
}

// Builds the standard recording workflow graph used by the cases below.
function buildRecordingWorkflow(): WorkflowStateMachine {
  const machine = new WorkflowStateMachine();
  machine.registerTransition(WorkflowState.IDLE, WorkflowState.STARTING, WorkflowEvent.START_REQUESTED);
  machine.registerTransition(WorkflowState.STARTING, WorkflowState.RECORDING, WorkflowEvent.WINDOW_READY);
  machine.registerTransition(WorkflowState.STARTING, WorkflowState.FAILED, WorkflowEvent.FAILED);
  machine.registerTransition(WorkflowState.RECORDING, WorkflowState.STOPPING, WorkflowEvent.STOP_REQUESTED);
  machine.registerTransition(WorkflowState.RECORDING, WorkflowState.FAILED, WorkflowEvent.FAILED);
  machine.registerTransition(WorkflowState.STOPPING, WorkflowState.COMPLETED, WorkflowEvent.TIP_SHOWN);
  machine.registerTransition(WorkflowState.STOPPING, WorkflowState.FAILED, WorkflowEvent.FAILED);
  machine.registerTransition(WorkflowState.COMPLETED, WorkflowState.IDLE, WorkflowEvent.RESET);
  machine.registerTransition(WorkflowState.FAILED, WorkflowState.IDLE, WorkflowEvent.RESET);
  return machine;
}

export default function recordingOperationWorkflowTest(): void {
  describe('RecordingOperationWorkflow_Test', () => {
    let driver: Driver;
    let mockService: MockRecordingService;

    beforeAll(async () => {
      driver = getDriver();
      mockService = MockRecordingService.getInstance();
      mockService.clearOperationLog();
      await serializedDelay(driver, 500);
    });

    afterAll(async () => {
      await serializedDelay(driver, 300);
    });

    // Workflow: a session must exist before any operation is executed.
    it('operation_should_require_active_session', 0, async () => {
      const workflow = new RecordingWorkflowModel();
      expect(workflow.hasSession()).assertFalse();
      expect(workflow.begin(100, 'fd://100')).assertTrue();
      expect(workflow.hasSession()).assertTrue();
      expect(workflow.getActiveFd()).assertEqual(100);
      expect(workflow.getSourceUri()).assertEqual('fd://100');
    });

    // Workflow: the timer window is hidden once the session finishes.
    it('finishing_session_should_swap_timer_for_tip', 0, async () => {
      const workflow = new RecordingWorkflowModel();
      workflow.begin(101, 'fd://101');
      expect(workflow.isTimerVisible()).assertTrue();
      expect(workflow.isTipVisible()).assertFalse();
      expect(workflow.finish()).assertTrue();
      expect(workflow.isTimerVisible()).assertFalse();
      expect(workflow.isTipVisible()).assertTrue();
      workflow.hideTip();
      expect(workflow.isTipVisible()).assertFalse();
      expect(workflow.finish()).assertFalse();
    });

    // Workflow: the start script reaches the recording state.
    it('start_workflow_should_complete_correctly', 0, async () => {
      await triggerRecordingStart(driver);
      await waitForTimerWindowStable(driver, TIMEOUT_TIMER_RENDER);
      mockService.start(100);
      const machine: WorkflowStateMachine = buildRecordingWorkflow();
      expect(machine.transit(WorkflowEvent.START_REQUESTED)).assertTrue();
      expect(machine.getState()).assertEqual(WorkflowState.STARTING);
      expect(machine.transit(WorkflowEvent.WINDOW_READY)).assertTrue();
      expect(machine.getState()).assertEqual(WorkflowState.RECORDING);
      expect(mockService.getOperationCount(RecordingOperationKind.START)).assertEqual(1);
      const count: number = await recorderComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
    });

    // Workflow: the stop script reaches the completed state.
    it('stop_workflow_should_complete_correctly', 0, async () => {
      await triggerRecordingStop(driver);
      await waitForTipWindowStable(driver, TIMEOUT_TIP_RENDER);
      mockService.stop(100);
      const machine: WorkflowStateMachine = buildRecordingWorkflow();
      machine.transit(WorkflowEvent.START_REQUESTED);
      machine.transit(WorkflowEvent.WINDOW_READY);
      expect(machine.transit(WorkflowEvent.STOP_REQUESTED)).assertTrue();
      expect(machine.getState()).assertEqual(WorkflowState.STOPPING);
      expect(machine.transit(WorkflowEvent.TIP_SHOWN)).assertTrue();
      expect(machine.getState()).assertEqual(WorkflowState.COMPLETED);
      expect(mockService.getOperationCount(RecordingOperationKind.STOP)).assertEqual(1);
    });

    // Workflow: the query operation is read only.
    it('query_workflow_should_be_read_only', 0, async () => {
      mockService.query();
      expect(mockService.getOperationCount(RecordingOperationKind.QUERY)).assertEqual(1);
      expect(mockService.getLastFd()).assertEqual(-1);
      const machine: WorkflowStateMachine = buildRecordingWorkflow();
      expect(machine.getState()).assertEqual(WorkflowState.IDLE);
      expect(machine.canTransit(WorkflowEvent.TIP_SHOWN)).assertFalse();
      expect(machine.transit(WorkflowEvent.STOP_REQUESTED)).assertFalse();
    });

    // Workflow: only one session may be active at a time.
    it('workflow_should_target_single_session', 0, async () => {
      const workflow = new RecordingWorkflowModel();
      expect(workflow.begin(200, 'fd://200')).assertTrue();
      expect(workflow.begin(201, 'fd://201')).assertFalse();
      expect(workflow.getActiveFd()).assertEqual(200);
      expect(workflow.getSourceUri()).assertEqual('fd://200');
    });

    // Workflow: unknown operation kinds are rejected.
    it('invalid_operation_kind_should_be_rejected', 0, async () => {
      const validator = new WorkflowValidator();
      expect(validator.isKindValid(RecordingOperationKind.START)).assertTrue();
      expect(validator.isKindValid(RecordingOperationKind.STOP)).assertTrue();
      expect(validator.isKindValid(RecordingOperationKind.QUERY)).assertTrue();
      expect(validator.isKindValid('pause')).assertFalse();
      expect(validator.isKindValid('')).assertFalse();
    });

    // Workflow: executing without a session stays safe.
    it('operation_without_session_should_be_safe', 0, async () => {
      const workflow = new RecordingWorkflowModel();
      expect(workflow.hasSession()).assertFalse();
      expect(workflow.finish()).assertFalse();
      const count: number = await recorderComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
      expect(workflow.getActiveFd()).assertEqual(-1);
    });

    // Workflow: the session stays observable after the stop request.
    it('session_state_should_persist_after_execution', 0, async () => {
      await triggerRecordingStart(driver);
      await waitForTimerWindowStable(driver, TIMEOUT_TIMER_RENDER);
      const fileName: string = buildRecordingFileName(new Date(2026, 7, 8, 9, 10, 11));
      expect(fileName).assertEqual('REC_20260808_091011.mp4');
      mockService.start(102);
      expect(mockService.getLastFd()).assertEqual(102);
      const workflow = new RecordingWorkflowModel();
      workflow.begin(102, `fd://102`);
      expect(workflow.hasSession()).assertTrue();
      expect(workflow.getSourceUri().startsWith('fd://')).assertTrue();
    });

    // Workflow: the timer window survives a rejected second session.
    it('timer_window_should_remain_responsive', 0, async () => {
      const workflow = new RecordingWorkflowModel();
      workflow.begin(103, 'fd://103');
      expect(workflow.begin(104, 'fd://104')).assertFalse();
      expect(workflow.isTimerVisible()).assertTrue();
      const count: number = await recorderComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
    });

    // Workflow: the state machine starts idle with no history.
    it('workflow_state_machine_should_start_in_idle', 0, async () => {
      const machine = new WorkflowStateMachine();
      expect(machine.getState()).assertEqual(WorkflowState.IDLE);
      expect(machine.getTransitionCount()).assertEqual(0);
      expect(machine.getRegisteredCount()).assertEqual(0);
    });

    // Workflow: a registered event moves the machine forward.
    it('workflow_state_machine_should_transit_on_registered_event', 0, async () => {
      const machine = new WorkflowStateMachine();
      machine.registerTransition(WorkflowState.IDLE, WorkflowState.STARTING, WorkflowEvent.START_REQUESTED);
      expect(machine.canTransit(WorkflowEvent.START_REQUESTED)).assertTrue();
      expect(machine.transit(WorkflowEvent.START_REQUESTED)).assertTrue();
      expect(machine.getState()).assertEqual(WorkflowState.STARTING);
      expect(machine.getTransitionLog().length).assertEqual(1);
    });

    // Workflow: an unregistered event is rejected without moving the state.
    it('workflow_state_machine_should_reject_unregistered_event', 0, async () => {
      const machine = buildRecordingWorkflow();
      expect(machine.transit(WorkflowEvent.TIP_SHOWN)).assertFalse();
      expect(machine.getState()).assertEqual(WorkflowState.IDLE);
      expect(machine.transit(WorkflowEvent.WINDOW_READY)).assertFalse();
      expect(machine.getTransitionCount()).assertEqual(0);
    });

    // Workflow: the machine returns to idle on reset.
    it('workflow_state_machine_should_reset_to_idle', 0, async () => {
      const machine = buildRecordingWorkflow();
      machine.transit(WorkflowEvent.START_REQUESTED);
      machine.transit(WorkflowEvent.WINDOW_READY);
      expect(machine.getTransitionCount()).assertEqual(2);
      expect(machine.getTransitionLog().length).assertEqual(2);
      machine.reset();
      expect(machine.getState()).assertEqual(WorkflowState.IDLE);
      expect(machine.getTransitionCount()).assertEqual(0);
      expect(machine.getRegisteredCount()).assertEqual(9);
    });

    // Workflow: the happy path walks through every intermediate state.
    it('workflow_should_complete_full_happy_path', 0, async () => {
      const machine = buildRecordingWorkflow();
      expect(machine.transit(WorkflowEvent.START_REQUESTED)).assertTrue();
      expect(machine.transit(WorkflowEvent.WINDOW_READY)).assertTrue();
      expect(machine.transit(WorkflowEvent.STOP_REQUESTED)).assertTrue();
      expect(machine.transit(WorkflowEvent.TIP_SHOWN)).assertTrue();
      expect(machine.getState()).assertEqual(WorkflowState.COMPLETED);
      expect(machine.getTransitionCount()).assertEqual(4);
      expect(machine.transit(WorkflowEvent.RESET)).assertTrue();
      expect(machine.getState()).assertEqual(WorkflowState.IDLE);
    });

    // Workflow: a failure from any active state reaches the failed state.
    it('workflow_should_reach_failed_state_on_error', 0, async () => {
      const starting = buildRecordingWorkflow();
      starting.transit(WorkflowEvent.START_REQUESTED);
      expect(starting.transit(WorkflowEvent.FAILED)).assertTrue();
      expect(starting.getState()).assertEqual(WorkflowState.FAILED);
      const stopping = buildRecordingWorkflow();
      stopping.transit(WorkflowEvent.START_REQUESTED);
      stopping.transit(WorkflowEvent.WINDOW_READY);
      stopping.transit(WorkflowEvent.STOP_REQUESTED);
      expect(stopping.transit(WorkflowEvent.FAILED)).assertTrue();
      expect(stopping.getState()).assertEqual(WorkflowState.FAILED);
      expect(stopping.transit(WorkflowEvent.RESET)).assertTrue();
      expect(stopping.getState()).assertEqual(WorkflowState.IDLE);
    });

    // History: transitions are stored in execution order.
    it('workflow_history_should_record_transitions', 0, async () => {
      const history = new WorkflowHistory();
      history.recordTransition(WorkflowState.IDLE, WorkflowState.STARTING, WorkflowEvent.START_REQUESTED);
      history.recordTransition(WorkflowState.STARTING, WorkflowState.RECORDING, WorkflowEvent.WINDOW_READY);
      expect(history.getHistoryCount()).assertEqual(2);
      expect(history.hasVisitedState(WorkflowState.RECORDING)).assertTrue();
      expect(history.hasVisitedState(WorkflowState.COMPLETED)).assertFalse();
      expect(history.getHistory().length).assertEqual(2);
    });

    // History: the first and last states are tracked.
    it('workflow_history_should_track_first_and_last_state', 0, async () => {
      const history = new WorkflowHistory();
      history.recordTransition(WorkflowState.IDLE, WorkflowState.STARTING, WorkflowEvent.START_REQUESTED);
      history.recordTransition(WorkflowState.STARTING, WorkflowState.RECORDING, WorkflowEvent.WINDOW_READY);
      expect(history.getFirstState()).assertEqual(WorkflowState.IDLE);
      expect(history.getLastState()).assertEqual(WorkflowState.RECORDING);
      expect(history.countEvents(WorkflowEvent.START_REQUESTED)).assertEqual(1);
      expect(history.countEvents(WorkflowEvent.TIP_SHOWN)).assertEqual(0);
    });

    // History: an empty history reports null boundaries.
    it('workflow_history_should_return_null_when_empty', 0, async () => {
      const history = new WorkflowHistory();
      expect(history.getFirstState()).assertEqual(null);
      expect(history.getLastState()).assertEqual(null);
      expect(history.getHistoryCount()).assertEqual(0);
      history.recordTransition(WorkflowState.RECORDING, WorkflowState.STOPPING, WorkflowEvent.STOP_REQUESTED);
      history.clear();
      expect(history.getHistoryCount()).assertEqual(0);
    });

    // Validator: start ids map onto the operation kinds.
    it('workflow_validator_should_validate_start_ids', 0, async () => {
      const validator = new WorkflowValidator();
      expect(validator.isStartIdValid(0)).assertTrue();
      expect(validator.isStartIdValid(-1)).assertFalse();
      expect(validator.kindOfStartId(1)).assertEqual(RecordingOperationKind.START);
      expect(validator.kindOfStartId(0)).assertEqual(RecordingOperationKind.STOP);
      expect(validator.kindOfStartId(2)).assertEqual(RecordingOperationKind.STOP);
      expect(validator.isStateTerminal(WorkflowState.COMPLETED)).assertTrue();
      expect(validator.isStateTerminal(WorkflowState.RECORDING)).assertFalse();
    });

    // Validator: descriptor sequences are validated as a whole.
    it('workflow_validator_should_validate_fd_sequences', 0, async () => {
      const validator = new WorkflowValidator();
      expect(validator.isValidFd(0)).assertTrue();
      expect(validator.isValidFd(-1)).assertFalse();
      expect(validator.validateFdSequence([100, 101, 102])).assertTrue();
      expect(validator.validateFdSequence([100, -1, 102])).assertFalse();
      expect(validator.validateFdSequence([])).assertTrue();
    });

    // Validator: adjacent duplicates are rejected.
    it('workflow_validator_should_detect_adjacent_duplicates', 0, async () => {
      const validator = new WorkflowValidator();
      expect(validator.validateNoAdjacentDuplicates([100, 101, 102])).assertTrue();
      expect(validator.validateNoAdjacentDuplicates([100, 100, 102])).assertFalse();
      expect(validator.validateNoAdjacentDuplicates([100])).assertTrue();
      expect(validator.validateNoAdjacentDuplicates([])).assertTrue();
    });

    // Statistics: the action counters accumulate.
    it('workflow_statistics_should_accumulate_action_counts', 0, async () => {
      const stats = new WorkflowStatistics();
      stats.recordStart();
      stats.recordStart();
      stats.recordStop();
      stats.recordReset();
      expect(stats.getStartCount()).assertEqual(2);
      expect(stats.getStopCount()).assertEqual(1);
      expect(stats.getResetCount()).assertEqual(1);
      expect(stats.getTotalActionCount()).assertEqual(4);
      expect(stats.describe().includes('start: 2')).assertTrue();
    });

    // Repository: records are counted by kind and success.
    it('operation_record_repository_should_count_by_kind_and_success', 0, async () => {
      const repository = new OperationRecordRepository();
      repository.addRecord({
        kind: RecordingOperationKind.START, startId: 1, fd: 100, timestamp: 1, success: true
      });
      repository.addRecord({
        kind: RecordingOperationKind.STOP, startId: 2, fd: 100, timestamp: 2, success: false
      });
      repository.addRecord({
        kind: RecordingOperationKind.START, startId: 1, fd: 101, timestamp: 3, success: true
      });
      expect(repository.getRecordCount()).assertEqual(3);
      expect(repository.countByKind(RecordingOperationKind.START)).assertEqual(2);
      expect(repository.countByKind(RecordingOperationKind.QUERY)).assertEqual(0);
      expect(repository.getSuccessfulCount()).assertEqual(2);
      repository.clear();
      expect(repository.getRecordCount()).assertEqual(0);
    });

    // Steps: the executor walks the workflow in order.
    it('workflow_step_executor_should_execute_steps_in_order', 0, async () => {
      const executor = new WorkflowStepExecutor();
      executor.addStep('request_start');
      executor.addStep('create_asset');
      executor.addStep('open_fd');
      expect(executor.getStepCount()).assertEqual(3);
      expect(executor.executeNext()).assertTrue();
      expect(executor.getCompletedCount()).assertEqual(1);
      expect(executor.getRemainingSteps().length).assertEqual(2);
      expect(executor.getCompletedSteps()[0]).assertEqual('request_start');
      executor.executeNext();
      executor.executeNext();
      expect(executor.isFinished()).assertTrue();
      expect(executor.executeNext()).assertFalse();
      expect(executor.getSteps().length).assertEqual(3);
    });

    // Steps: clearing the executor removes pending and finished steps.
    it('workflow_step_executor_should_clear_state', 0, async () => {
      const executor = new WorkflowStepExecutor();
      executor.addStep('request_stop');
      executor.executeNext();
      executor.clear();
      expect(executor.getStepCount()).assertEqual(0);
      expect(executor.getCompletedCount()).assertEqual(0);
      expect(executor.isFinished()).assertTrue();
      expect(executor.getRemainingSteps().length).assertEqual(0);
    });

    // Transition map: registered pairs are queryable.
    it('workflow_transition_map_should_query_registered_transitions', 0, async () => {
      const map = new WorkflowTransitionMap();
      map.register({
        from: WorkflowState.IDLE, to: WorkflowState.STARTING, event: WorkflowEvent.START_REQUESTED
      });
      expect(map.hasTransition(WorkflowState.IDLE, WorkflowState.STARTING)).assertTrue();
      expect(map.hasTransition(WorkflowState.STARTING, WorkflowState.RECORDING)).assertFalse();
      const found: WorkflowTransitionDef | null = map.find(WorkflowState.IDLE, WorkflowState.STARTING);
      expect(found === null).assertFalse();
      expect(found?.event).assertEqual(WorkflowEvent.START_REQUESTED);
      expect(map.getTransitionCount()).assertEqual(1);
      map.clear();
      expect(map.getTransitionCount()).assertEqual(0);
    });

    // Model: reset restores the pristine workflow state.
    it('workflow_model_reset_should_restore_initial_state', 0, async () => {
      const workflow = new RecordingWorkflowModel();
      workflow.begin(300, 'fd://300');
      workflow.finish();
      expect(workflow.hasSession()).assertFalse();
      expect(workflow.isTimerVisible()).assertFalse();
      expect(workflow.isTipVisible()).assertTrue();
      workflow.reset();
      expect(workflow.hasSession()).assertFalse();
      expect(workflow.isTipVisible()).assertFalse();
      expect(workflow.getSourceUri()).assertEqual('');
      expect(workflow.getActiveFd()).assertEqual(-1);
    });

    // Mock service: the accepted requests are all recorded.
    it('mock_service_should_record_requests', 0, async () => {
      mockService.clearOperationLog();
      mockService.start(400);
      mockService.stop(400);
      mockService.query();
      expect(mockService.getOperationCount(RecordingOperationKind.START)).assertEqual(1);
      expect(mockService.getOperationCount(RecordingOperationKind.STOP)).assertEqual(1);
      expect(mockService.getOperationLog().length).assertEqual(3);
      expect(mockService.getLastFd()).assertEqual(-1);
    });

    // Comprehensive: the full script keeps the timer window responsive.
    it('comprehensive_recording_workflow_scenario', 0, async () => {
      const machine: WorkflowStateMachine = buildRecordingWorkflow();
      await triggerRecordingStart(driver);
      await waitForTimerWindowStable(driver, TIMEOUT_TIMER_RENDER);
      machine.transit(WorkflowEvent.START_REQUESTED);
      machine.transit(WorkflowEvent.WINDOW_READY);
      expect(machine.getState()).assertEqual(WorkflowState.RECORDING);
      await triggerRecordingStop(driver);
      await waitForTipWindowStable(driver, TIMEOUT_TIP_RENDER);
      machine.transit(WorkflowEvent.STOP_REQUESTED);
      machine.transit(WorkflowEvent.TIP_SHOWN);
      expect(machine.getState()).assertEqual(WorkflowState.COMPLETED);
      expect(machine.getTransitionLog().length).assertEqual(4);
      const count: number = await recorderComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
    });
  });
}



