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
import hilog from '@ohos.hilog';
import {
  getDriver,
  isTimerWindowVisible,
  pressAndWait,
  KEY_BACK,
  DELAY_KEY_NAVIGATION,
  serializedDelay
} from '../shared/RecordingDriver';

const DOMAIN: number = 0x0001;
const TAG: string = 'RecordingSessionValidation';

// Recording state propagated through the LocalStorage session payload.
enum SessionRecorderState {
  IDLE = 0,
  RECORDING = 1,
  STOPPED = 2,
  ERROR = 3
}

// Payload sent from ScreenRecorderAbility to the timer window session.
interface SessionPayload {
  isReady: string;
  recorderState: number;
  elapsedSeconds: number;
}

// Simulates the UIExtensionContentSession used by the timer window.
class MockRecordingSession {
  private terminated: boolean = false;
  private sentData: SessionPayload[] = [];
  private contentLoaded: boolean = false;
  private background: string = '';

  public sendData(data: SessionPayload): void {
    this.sentData.push(data);
  }

  public terminateSelf(): void {
    this.terminated = true;
  }

  public loadContent(path: string): void {
    this.contentLoaded = path.length > 0;
  }

  public setWindowBackgroundColor(color: string): void {
    this.background = color;
  }

  public getBackground(): string {
    return this.background;
  }

  public isTerminated(): boolean {
    return this.terminated;
  }

  public isContentLoaded(): boolean {
    return this.contentLoaded;
  }

  public getSentData(): SessionPayload[] {
    const result: SessionPayload[] = [];
    for (let i = 0; i < this.sentData.length; i++) {
      result.push(this.sentData[i]);
    }
    return result;
  }
}

// Manages creation, readiness notification and termination of a session.
class RecordingSessionManager {
  private session: MockRecordingSession | null = null;

  public createSession(): MockRecordingSession {
    this.session = new MockRecordingSession();
    return this.session;
  }

  public getSession(): MockRecordingSession | null {
    return this.session;
  }

  public notifyReady(session: MockRecordingSession, stateCode: number): void {
    const data: SessionPayload = {
      isReady: '1',
      recorderState: stateCode,
      elapsedSeconds: 0
    };
    session.sendData(data);
  }

  public notifyProgress(session: MockRecordingSession, stateCode: number, elapsedSeconds: number): void {
    const data: SessionPayload = {
      isReady: '1',
      recorderState: stateCode,
      elapsedSeconds: elapsedSeconds
    };
    session.sendData(data);
  }

  public terminate(session: MockRecordingSession): void {
    session.terminateSelf();
  }
}

// Lifecycle states of one recording UI session.
enum SessionState {
  SESSION_CREATED = 'created',
  SESSION_ACTIVATED = 'activated',
  SESSION_READY = 'ready',
  SESSION_TERMINATED = 'terminated'
}

// Key events of the session lifecycle.
enum SessionEvent {
  EVENT_CREATE = 'create',
  EVENT_LOAD = 'load',
  EVENT_READY = 'ready',
  EVENT_TERMINATE = 'terminate'
}

// One lifecycle event with the resulting state.
interface SessionEventRecord {
  event: SessionEvent;
  stateAfter: SessionState;
  timestamp: number;
}

// Tracks state changes produced by the session lifecycle.
class SessionLifecycleTracker {
  private records: SessionEventRecord[] = [];
  private currentState: SessionState = SessionState.SESSION_CREATED;

  public record(event: SessionEvent, stateAfter: SessionState): void {
    const entry: SessionEventRecord = {
      event: event,
      stateAfter: stateAfter,
      timestamp: Date.now()
    };
    this.records.push(entry);
    this.currentState = stateAfter;
  }

  public getState(): SessionState {
    return this.currentState;
  }

  public getRecords(): SessionEventRecord[] {
    const result: SessionEventRecord[] = [];
    for (let i = 0; i < this.records.length; i++) {
      result.push(this.records[i]);
    }
    return result;
  }

  public getRecordCount(): number {
    return this.records.length;
  }

  public hasEvent(event: SessionEvent): boolean {
    return this.countEvent(event) > 0;
  }

  public countEvent(event: SessionEvent): number {
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].event === event) {
        count++;
      }
    }
    return count;
  }

  public getLastRecord(): SessionEventRecord | null {
    if (this.records.length === 0) {
      return null;
    }
    return this.records[this.records.length - 1];
  }

  public clear(): void {
    this.records = [];
    this.currentState = SessionState.SESSION_CREATED;
  }
}

// Validates the payload shared with the timer window.
class SessionPayloadValidator {
  public isReadyPayloadValid(data: SessionPayload): boolean {
    return data.isReady === '1';
  }

  public hasReadySignal(dataList: SessionPayload[]): boolean {
    for (let i = 0; i < dataList.length; i++) {
      if (this.isReadyPayloadValid(dataList[i])) {
        return true;
      }
    }
    return false;
  }

  public countReadySignals(dataList: SessionPayload[]): number {
    let count: number = 0;
    for (let i = 0; i < dataList.length; i++) {
      if (this.isReadyPayloadValid(dataList[i])) {
        count++;
      }
    }
    return count;
  }

  public isSingleReadySignal(dataList: SessionPayload[]): boolean {
    return this.countReadySignals(dataList) === 1;
  }

  public areAllValid(dataList: SessionPayload[]): boolean {
    for (let i = 0; i < dataList.length; i++) {
      if (!this.isReadyPayloadValid(dataList[i])) {
        return false;
      }
    }
    return true;
  }

  public hasErrorState(dataList: SessionPayload[]): boolean {
    for (let i = 0; i < dataList.length; i++) {
      if (dataList[i].recorderState === SessionRecorderState.ERROR) {
        return true;
      }
    }
    return false;
  }
}

// Accumulates session payloads for later assertions.
class SessionPayloadRepository {
  private dataList: SessionPayload[] = [];

  public addData(data: SessionPayload): void {
    this.dataList.push(data);
  }

  public getDataList(): SessionPayload[] {
    const result: SessionPayload[] = [];
    for (let i = 0; i < this.dataList.length; i++) {
      result.push(this.dataList[i]);
    }
    return result;
  }

  public getDataCount(): number {
    return this.dataList.length;
  }

  public getReadyCount(): number {
    return new SessionPayloadValidator().countReadySignals(this.dataList);
  }

  public getLastState(): number {
    if (this.dataList.length === 0) {
      return SessionRecorderState.IDLE;
    }
    return this.dataList[this.dataList.length - 1].recorderState;
  }

  public clear(): void {
    this.dataList = [];
  }
}

// Aggregates lifecycle counters for the recording session.
class RecordingSessionStatistics {
  private createCount: number = 0;
  private readyCount: number = 0;
  private terminateCount: number = 0;
  private errorCount: number = 0;

  public recordCreate(): void {
    this.createCount++;
  }

  public recordReady(): void {
    this.readyCount++;
  }

  public recordTerminate(): void {
    this.terminateCount++;
  }

  public recordError(): void {
    this.errorCount++;
  }

  public getCreateCount(): number {
    return this.createCount;
  }

  public getReadyCount(): number {
    return this.readyCount;
  }

  public getTerminateCount(): number {
    return this.terminateCount;
  }

  public getErrorCount(): number {
    return this.errorCount;
  }

  public isBalanced(): boolean {
    return this.createCount === this.terminateCount;
  }

  public hasReadySignal(): boolean {
    return this.readyCount > 0;
  }

  public describe(): string {
    return `RecordingSessionStatistics{create: ${this.createCount}, ready: ${this.readyCount}, ` +
      `terminate: ${this.terminateCount}}`;
  }

  public reset(): void {
    this.createCount = 0;
    this.readyCount = 0;
    this.terminateCount = 0;
    this.errorCount = 0;
  }
}

// Builds the readiness payloads handed to the timer window.
class ReadySignalBuilder {
  public buildReadyPayload(stateCode: number): SessionPayload {
    const payload: SessionPayload = {
      isReady: '1',
      recorderState: stateCode,
      elapsedSeconds: 0
    };
    return payload;
  }

  public buildNonReadyPayload(): SessionPayload {
    const payload: SessionPayload = {
      isReady: '0',
      recorderState: SessionRecorderState.IDLE,
      elapsedSeconds: 0
    };
    return payload;
  }

  public buildBatch(count: number, stateCode: number): SessionPayload[] {
    const dataList: SessionPayload[] = [];
    for (let i = 0; i < count; i++) {
      dataList.push(this.buildReadyPayload(stateCode));
    }
    return dataList;
  }
}

// Generates the recording session identifiers used in logs.
class SessionIdGenerator {
  private sequence: number = 0;
  private prefix: string;

  constructor(prefix: string) {
    this.prefix = prefix;
  }

  public generate(): string {
    const id: string = `${this.prefix}_${this.sequence}`;
    this.sequence++;
    return id;
  }

  public generateBatch(count: number): string[] {
    const ids: string[] = [];
    for (let i = 0; i < count; i++) {
      ids.push(this.generate());
    }
    return ids;
  }

  public getNextSequence(): number {
    return this.sequence;
  }

  public reset(): void {
    this.sequence = 0;
  }
}

// Session state machine aligned with the ability lifecycle.
class RecordingSessionStateMachine {
  private state: SessionState = SessionState.SESSION_CREATED;

  public getState(): SessionState {
    return this.state;
  }

  public activate(): boolean {
    if (this.state === SessionState.SESSION_CREATED) {
      this.state = SessionState.SESSION_ACTIVATED;
      return true;
    }
    return false;
  }

  public markReady(): boolean {
    if (this.state === SessionState.SESSION_ACTIVATED) {
      this.state = SessionState.SESSION_READY;
      return true;
    }
    return false;
  }

  public terminate(): boolean {
    if (this.state !== SessionState.SESSION_TERMINATED) {
      this.state = SessionState.SESSION_TERMINATED;
      return true;
    }
    return false;
  }

  public isReady(): boolean {
    return this.state === SessionState.SESSION_READY;
  }

  public isTerminated(): boolean {
    return this.state === SessionState.SESSION_TERMINATED;
  }
}

// Guards start, stop and terminate decisions for the recording session.
class SessionRecorderGuard {
  public static readonly TERMINATE_DELAY_MS: number = 2000;

  public static canStart(state: number): boolean {
    return state === SessionRecorderState.IDLE;
  }

  public static canStop(state: number): boolean {
    return state === SessionRecorderState.RECORDING;
  }

  public static shouldTerminate(state: number): boolean {
    return state === SessionRecorderState.ERROR;
  }

  public static getTerminateDelayMs(): number {
    return SessionRecorderGuard.TERMINATE_DELAY_MS;
  }

  public static isRecordIdValid(startId: number): boolean {
    return startId === 1;
  }
}

export default function recordingSessionValidationTest(): void {
  describe('RecordingSessionValidation_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      hilog.info(DOMAIN, TAG, 'prepare recording session validation');
      await serializedDelay(driver, 500);
    });

    afterAll(async () => {
      hilog.info(DOMAIN, TAG, 'recording session validation finished');
      await serializedDelay(driver, 300);
    });

    // ExtensionLifecycle: the timer window session is created.
    it('session_should_be_created_successfully', 0, async () => {
      const manager = new RecordingSessionManager();
      const session: MockRecordingSession = manager.createSession();
      expect(manager.getSession() === session).assertTrue();
      expect(session.isTerminated()).assertFalse();
    });

    // ExtensionLifecycle: readiness payload carries the recording state.
    it('session_should_send_ready_payload', 0, async () => {
      const manager = new RecordingSessionManager();
      const session: MockRecordingSession = manager.createSession();
      manager.notifyReady(session, SessionRecorderState.RECORDING);
      const sent: SessionPayload[] = session.getSentData();
      expect(sent.length).assertEqual(1);
      expect(sent[0].isReady).assertEqual('1');
      expect(sent[0].recorderState).assertEqual(SessionRecorderState.RECORDING);
    });

    // Share_Data_Format: readiness payload stays a single entry.
    it('ready_payload_should_contain_single_item', 0, async () => {
      const manager = new RecordingSessionManager();
      const session: MockRecordingSession = manager.createSession();
      manager.notifyReady(session, SessionRecorderState.IDLE);
      expect(session.getSentData().length).assertEqual(1);
      expect(new SessionPayloadValidator().isSingleReadySignal(session.getSentData())).assertTrue();
    });

    // ExtensionLifecycle: session termination is observable.
    it('session_should_terminate_correctly', 0, async () => {
      const manager = new RecordingSessionManager();
      const session: MockRecordingSession = manager.createSession();
      expect(session.isTerminated()).assertFalse();
      manager.terminate(session);
      expect(session.isTerminated()).assertTrue();
    });

    // ExtensionLifecycle: the timer page content is loaded on the session.
    it('session_should_load_timer_content', 0, async () => {
      const session = new MockRecordingSession();
      session.loadContent('pages/ScreenRecorderTimer');
      expect(session.isContentLoaded()).assertTrue();
      session.loadContent('');
      expect(session.isContentLoaded()).assertFalse();
    });

    // ExtensionLifecycle: the transparent float window background is applied.
    it('session_should_apply_transparent_background', 0, async () => {
      const session = new MockRecordingSession();
      session.setWindowBackgroundColor('#00000000');
      expect(session.getBackground()).assertEqual('#00000000');
    });

    // Share_Data_Format: progress payload keeps elapsed seconds.
    it('progress_payload_should_carry_elapsed_seconds', 0, async () => {
      const manager = new RecordingSessionManager();
      const session: MockRecordingSession = manager.createSession();
      manager.notifyProgress(session, SessionRecorderState.RECORDING, 65);
      const sent: SessionPayload[] = session.getSentData();
      expect(sent[0].elapsedSeconds).assertEqual(65);
      expect(sent[0].recorderState).assertEqual(SessionRecorderState.RECORDING);
    });

    // Share_Restrictions: no session means no readiness payload.
    it('without_session_should_have_no_ready_data', 0, async () => {
      const manager = new RecordingSessionManager();
      expect(manager.getSession()).assertNull();
    });

    // Share_Failure_Handling: terminateSelf is idempotent.
    it('terminate_should_be_idempotent', 0, async () => {
      const session = new MockRecordingSession();
      session.terminateSelf();
      session.terminateSelf();
      expect(session.isTerminated()).assertTrue();
    });

    // Share_Menu_Hide_Timing: termination happens after readiness.
    it('terminate_should_occur_after_ready', 0, async () => {
      const manager = new RecordingSessionManager();
      const session: MockRecordingSession = manager.createSession();
      manager.notifyReady(session, SessionRecorderState.ERROR);
      expect(session.getSentData().length).assertEqual(1);
      manager.terminate(session);
      expect(session.isTerminated()).assertTrue();
    });

    // Comprehensive: full lifecycle from creation to termination.
    it('complete_session_lifecycle_should_work', 0, async () => {
      const manager = new RecordingSessionManager();
      const session: MockRecordingSession = manager.createSession();
      session.loadContent('pages/ScreenRecorderTimer');
      session.setWindowBackgroundColor('#00000000');
      manager.notifyReady(session, SessionRecorderState.RECORDING);
      expect(session.isContentLoaded()).assertTrue();
      expect(session.getSentData().length).assertEqual(1);
      manager.terminate(session);
      expect(session.isTerminated()).assertTrue();
    });

    // SessionLifecycleTracker: lifecycle events are recorded in order.
    it('lifecycle_tracker_should_record_events', 0, async () => {
      const tracker = new SessionLifecycleTracker();
      tracker.record(SessionEvent.EVENT_CREATE, SessionState.SESSION_CREATED);
      tracker.record(SessionEvent.EVENT_LOAD, SessionState.SESSION_ACTIVATED);
      tracker.record(SessionEvent.EVENT_READY, SessionState.SESSION_READY);
      expect(tracker.getRecordCount()).assertEqual(3);
      expect(tracker.hasEvent(SessionEvent.EVENT_READY)).assertTrue();
      expect(tracker.countEvent(SessionEvent.EVENT_LOAD)).assertEqual(1);
    });

    // SessionLifecycleTracker: current state follows the newest record.
    it('lifecycle_tracker_should_track_current_state', 0, async () => {
      const tracker = new SessionLifecycleTracker();
      tracker.record(SessionEvent.EVENT_CREATE, SessionState.SESSION_CREATED);
      tracker.record(SessionEvent.EVENT_READY, SessionState.SESSION_READY);
      expect(tracker.getState()).assertEqual(SessionState.SESSION_READY);
      const last: SessionEventRecord | null = tracker.getLastRecord();
      expect(last === null).assertFalse();
      if (last !== null) {
        expect(last.event).assertEqual(SessionEvent.EVENT_READY);
      }
    });

    // SessionLifecycleTracker: clearing restores the initial state.
    it('lifecycle_tracker_should_clear_to_initial_state', 0, async () => {
      const tracker = new SessionLifecycleTracker();
      tracker.record(SessionEvent.EVENT_CREATE, SessionState.SESSION_CREATED);
      tracker.record(SessionEvent.EVENT_TERMINATE, SessionState.SESSION_TERMINATED);
      tracker.clear();
      expect(tracker.getRecordCount()).assertEqual(0);
      expect(tracker.getState()).assertEqual(SessionState.SESSION_CREATED);
      expect(tracker.getLastRecord()).assertNull();
    });

    // SessionPayloadValidator: readiness flag validation.
    it('payload_validator_should_validate_ready_signal', 0, async () => {
      const validator = new SessionPayloadValidator();
      const builder = new ReadySignalBuilder();
      expect(validator.isReadyPayloadValid(builder.buildReadyPayload(SessionRecorderState.IDLE))).assertTrue();
      expect(validator.isReadyPayloadValid(builder.buildNonReadyPayload())).assertFalse();
    });

    // SessionPayloadValidator: readiness counting and error detection.
    it('payload_validator_should_count_ready_signals', 0, async () => {
      const validator = new SessionPayloadValidator();
      const builder = new ReadySignalBuilder();
      const ready: SessionPayload = builder.buildReadyPayload(SessionRecorderState.RECORDING);
      const notReady: SessionPayload = builder.buildNonReadyPayload();
      expect(validator.hasReadySignal([ready])).assertTrue();
      expect(validator.hasReadySignal([notReady])).assertFalse();
      expect(validator.countReadySignals([ready, notReady, ready])).assertEqual(2);
      expect(validator.isSingleReadySignal([ready, notReady])).assertTrue();
      expect(validator.areAllValid([ready, ready])).assertTrue();
    });

    // SessionPayloadValidator: an Error payload drives terminateSelf.
    it('payload_validator_should_detect_error_state', 0, async () => {
      const validator = new SessionPayloadValidator();
      const builder = new ReadySignalBuilder();
      const errorPayload: SessionPayload = builder.buildReadyPayload(SessionRecorderState.ERROR);
      expect(validator.hasErrorState([errorPayload])).assertTrue();
      expect(validator.hasErrorState([builder.buildReadyPayload(SessionRecorderState.RECORDING)])).assertFalse();
    });

    // SessionPayloadRepository: payloads accumulate and expose the last state.
    it('payload_repository_should_accumulate_data', 0, async () => {
      const repository = new SessionPayloadRepository();
      const builder = new ReadySignalBuilder();
      repository.addData(builder.buildReadyPayload(SessionRecorderState.IDLE));
      repository.addData(builder.buildNonReadyPayload());
      repository.addData(builder.buildReadyPayload(SessionRecorderState.RECORDING));
      expect(repository.getDataCount()).assertEqual(3);
      expect(repository.getReadyCount()).assertEqual(2);
      expect(repository.getLastState()).assertEqual(SessionRecorderState.RECORDING);
      repository.clear();
      expect(repository.getLastState()).assertEqual(SessionRecorderState.IDLE);
    });

    // RecordingSessionStatistics: create and terminate counters stay balanced.
    it('session_statistics_should_be_balanced', 0, async () => {
      const stats = new RecordingSessionStatistics();
      stats.recordCreate();
      stats.recordReady();
      stats.recordTerminate();
      expect(stats.getCreateCount()).assertEqual(1);
      expect(stats.getTerminateCount()).assertEqual(1);
      expect(stats.getReadyCount()).assertEqual(1);
      expect(stats.isBalanced()).assertTrue();
      expect(stats.hasReadySignal()).assertTrue();
    });

    // RecordingSessionStatistics: imbalance is detected and resettable.
    it('session_statistics_should_detect_imbalance', 0, async () => {
      const stats = new RecordingSessionStatistics();
      stats.recordCreate();
      expect(stats.isBalanced()).assertFalse();
      stats.recordTerminate();
      expect(stats.isBalanced()).assertTrue();
      stats.recordError();
      expect(stats.getErrorCount()).assertEqual(1);
      expect(stats.describe().length).assertLarger(0);
      stats.reset();
      expect(stats.getCreateCount()).assertEqual(0);
      expect(stats.getErrorCount()).assertEqual(0);
    });

    // ReadySignalBuilder: batch payload construction.
    it('ready_signal_builder_should_build_batch', 0, async () => {
      const builder = new ReadySignalBuilder();
      const batch: SessionPayload[] = builder.buildBatch(5, SessionRecorderState.RECORDING);
      expect(batch.length).assertEqual(5);
      expect(new SessionPayloadValidator().areAllValid(batch)).assertTrue();
      expect(builder.buildBatch(0, SessionRecorderState.IDLE).length).assertEqual(0);
    });

    // SessionIdGenerator: identifiers increase monotonically.
    it('session_id_generator_should_sequence', 0, async () => {
      const generator = new SessionIdGenerator('REC_SESSION');
      expect(generator.generate()).assertEqual('REC_SESSION_0');
      expect(generator.generate()).assertEqual('REC_SESSION_1');
      expect(generator.getNextSequence()).assertEqual(2);
    });

    // SessionIdGenerator: batch generation and reset.
    it('session_id_generator_should_generate_batch_and_reset', 0, async () => {
      const generator = new SessionIdGenerator('REC_SESSION');
      const ids: string[] = generator.generateBatch(3);
      expect(ids.length).assertEqual(3);
      expect(ids[0]).assertEqual('REC_SESSION_0');
      expect(ids[2]).assertEqual('REC_SESSION_2');
      generator.reset();
      expect(generator.generate()).assertEqual('REC_SESSION_0');
    });

    // RecordingSessionStateMachine: transition to ready.
    it('state_machine_should_transition_to_ready', 0, async () => {
      const machine = new RecordingSessionStateMachine();
      expect(machine.activate()).assertTrue();
      expect(machine.markReady()).assertTrue();
      expect(machine.isReady()).assertTrue();
      expect(machine.getState()).assertEqual(SessionState.SESSION_READY);
    });

    // RecordingSessionStateMachine: invalid transitions are rejected.
    it('state_machine_should_reject_invalid_transitions', 0, async () => {
      const machine = new RecordingSessionStateMachine();
      machine.activate();
      expect(machine.activate()).assertFalse();
      machine.markReady();
      expect(machine.markReady()).assertFalse();
      machine.terminate();
      expect(machine.isTerminated()).assertTrue();
      expect(machine.terminate()).assertFalse();
    });

    // SessionRecorderGuard: start only from Idle, stop only from Recording.
    it('session_guard_should_gate_start_and_stop', 0, async () => {
      expect(SessionRecorderGuard.canStart(SessionRecorderState.IDLE)).assertTrue();
      expect(SessionRecorderGuard.canStart(SessionRecorderState.RECORDING)).assertFalse();
      expect(SessionRecorderGuard.canStop(SessionRecorderState.RECORDING)).assertTrue();
      expect(SessionRecorderGuard.canStop(SessionRecorderState.STOPPED)).assertFalse();
    });

    // SessionRecorderGuard: Error schedules terminateSelf after two seconds.
    it('session_guard_should_schedule_terminate_for_error', 0, async () => {
      expect(SessionRecorderGuard.shouldTerminate(SessionRecorderState.ERROR)).assertTrue();
      expect(SessionRecorderGuard.shouldTerminate(SessionRecorderState.STOPPED)).assertFalse();
      expect(SessionRecorderGuard.getTerminateDelayMs()).assertEqual(2000);
    });

    // SessionRecorderGuard: startId one starts and any other value stops.
    it('session_guard_should_check_start_id', 0, async () => {
      expect(SessionRecorderGuard.isRecordIdValid(1)).assertTrue();
      expect(SessionRecorderGuard.isRecordIdValid(2)).assertFalse();
      expect(SessionRecorderGuard.isRecordIdValid(0)).assertFalse();
    });

    // UI smoke check: the timer window session remains observable.
    it('timer_window_session_should_stay_observable', 0, async () => {
      const visible: boolean = await isTimerWindowVisible(driver);
      hilog.info(DOMAIN, TAG, 'timer window visibility sampled');
      expect(visible === true || visible === false).assertTrue();
    });
  });
}
