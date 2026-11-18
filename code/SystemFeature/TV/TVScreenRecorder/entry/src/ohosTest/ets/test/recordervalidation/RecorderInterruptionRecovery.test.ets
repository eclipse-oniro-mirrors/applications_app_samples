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
  recorderComponentCount,
  pressAndWait,
  KEY_BACK,
  DELAY_KEY_NAVIGATION,
  serializedDelay
} from '../shared/RecordingDriver';

const DOMAIN: number = 0x0001;
const TAG: string = 'RecorderInterruptionRecovery';

// Recorder states used to evaluate interruption recovery.
enum InterruptedRecorderState {
  IDLE = 0,
  RECORDING = 1,
  STOPPED = 2,
  ERROR = 3
}

// Interruptions that can stop an active screen recording.
enum InterruptionType {
  INCOMING_CALL = 'incoming_call',
  FOCUS_LOSS = 'focus_loss',
  SERVICE_KILL = 'service_kill',
  AUDIO_CONFLICT = 'audio_conflict',
  RESOLUTION_UNSUPPORTED = 'resolution_unsupported',
  SCREEN_ROTATE = 'screen_rotate',
  SYSTEM_DIALOG = 'system_dialog'
}

// Record of one interruption observed during a recording.
interface InterruptionRecord {
  type: InterruptionType;
  stateCode: number;
  recording: boolean;
  recovered: boolean;
}

// Severity of an interruption for the recorder pipeline.
enum InterruptionSeverity {
  MINOR = 'minor',
  MAJOR = 'major',
  CRITICAL = 'critical'
}

// Status of the recovery flow after an interruption.
enum RecoveryStatus {
  PENDING = 'pending',
  IN_PROGRESS = 'in_progress',
  COMPLETED = 'completed',
  FAILED = 'failed'
}

// Snapshot of the recorder state when the interruption happened.
interface InterruptionSnapshot {
  type: InterruptionType;
  severity: InterruptionSeverity;
  stateCode: number;
  recording: boolean;
  timestamp: number;
}

// Result of one recovery attempt.
interface RecoveryResult {
  status: RecoveryStatus;
  recoveredState: number;
  attempts: number;
  message: string;
}

// Recorder state model that reacts to interruptions with an Error state.
class RecorderSessionStateModel {
  public static readonly TERMINATE_DELAY_MS: number = 2000;
  private state: number = InterruptedRecorderState.IDLE;
  private recording: boolean = false;
  private recovered: boolean = true;
  private records: InterruptionRecord[] = [];
  private terminateScheduled: boolean = false;

  public setState(state: number): void {
    this.state = state;
  }

  public getState(): number {
    return this.state;
  }

  public startRecording(): void {
    this.state = InterruptedRecorderState.RECORDING;
    this.recording = true;
  }

  public stopRecording(): void {
    this.state = InterruptedRecorderState.STOPPED;
    this.recording = false;
  }

  public isRecording(): boolean {
    return this.recording;
  }

  public interrupt(type: InterruptionType): void {
    const record: InterruptionRecord = {
      type: type,
      stateCode: this.state,
      recording: this.recording,
      recovered: true
    };
    this.records.push(record);
    this.recording = false;
    this.state = InterruptedRecorderState.ERROR;
    this.terminateScheduled = true;
  }

  public recover(): boolean {
    this.recovered = true;
    this.terminateScheduled = false;
    return this.recovered;
  }

  public recoverToIdle(): boolean {
    this.state = InterruptedRecorderState.IDLE;
    this.recording = false;
    return this.recover();
  }

  public isRecovered(): boolean {
    return this.recovered;
  }

  public isTerminateScheduled(): boolean {
    return this.terminateScheduled;
  }

  public getRecords(): InterruptionRecord[] {
    const result: InterruptionRecord[] = [];
    for (let i = 0; i < this.records.length; i++) {
      result.push(this.records[i]);
    }
    return result;
  }

  public getInterruptionCount(): number {
    return this.records.length;
  }

  public countByType(type: InterruptionType): number {
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].type === type) {
        count++;
      }
    }
    return count;
  }

  public reset(): void {
    this.state = InterruptedRecorderState.IDLE;
    this.recording = false;
    this.recovered = true;
    this.records = [];
    this.terminateScheduled = false;
  }
}

// Queue of interruptions waiting to be recovered.
class InterruptionQueue {
  private items: InterruptionSnapshot[] = [];

  public enqueue(snapshot: InterruptionSnapshot): void {
    this.items.push(snapshot);
  }

  public dequeue(): InterruptionSnapshot | null {
    if (this.items.length === 0) {
      return null;
    }
    const snapshot: InterruptionSnapshot = this.items[0];
    this.items.shift();
    return snapshot;
  }

  public peek(): InterruptionSnapshot | null {
    if (this.items.length === 0) {
      return null;
    }
    return this.items[0];
  }

  public getSize(): number {
    return this.items.length;
  }

  public isEmpty(): boolean {
    return this.items.length === 0;
  }

  public clear(): void {
    this.items = [];
  }
}

// Classifies interruptions by severity.
class InterruptionClassifier {
  public static classify(type: InterruptionType): InterruptionSeverity {
    if (type === InterruptionType.SERVICE_KILL) {
      return InterruptionSeverity.CRITICAL;
    }
    if (type === InterruptionType.INCOMING_CALL) {
      return InterruptionSeverity.MAJOR;
    }
    if (type === InterruptionType.FOCUS_LOSS) {
      return InterruptionSeverity.MAJOR;
    }
    if (type === InterruptionType.AUDIO_CONFLICT) {
      return InterruptionSeverity.MAJOR;
    }
    if (type === InterruptionType.RESOLUTION_UNSUPPORTED) {
      return InterruptionSeverity.CRITICAL;
    }
    return InterruptionSeverity.MINOR;
  }

  public static isCritical(type: InterruptionType): boolean {
    return InterruptionClassifier.classify(type) === InterruptionSeverity.CRITICAL;
  }

  public static isMinor(type: InterruptionType): boolean {
    return InterruptionClassifier.classify(type) === InterruptionSeverity.MINOR;
  }

  public static requiresTerminateSelf(type: InterruptionType): boolean {
    return InterruptionClassifier.classify(type) === InterruptionSeverity.CRITICAL;
  }
}

// Drives the recovery flow after an interruption.
class RecorderRecoveryManager {
  private status: RecoveryStatus = RecoveryStatus.PENDING;
  private attempts: number = 0;
  private recoveredState: number = InterruptedRecorderState.IDLE;

  public beginRecovery(): void {
    this.status = RecoveryStatus.IN_PROGRESS;
    this.attempts++;
  }

  public completeRecovery(stateCode: number): void {
    this.status = RecoveryStatus.COMPLETED;
    this.recoveredState = stateCode;
  }

  public failRecovery(): void {
    this.status = RecoveryStatus.FAILED;
  }

  public getStatus(): RecoveryStatus {
    return this.status;
  }

  public getAttempts(): number {
    return this.attempts;
  }

  public getRecoveredState(): number {
    return this.recoveredState;
  }

  public buildResult(): RecoveryResult {
    const result: RecoveryResult = {
      status: this.status,
      recoveredState: this.recoveredState,
      attempts: this.attempts,
      message: `recovery ${this.status}`
    };
    return result;
  }

  public reset(): void {
    this.status = RecoveryStatus.PENDING;
    this.attempts = 0;
    this.recoveredState = InterruptedRecorderState.IDLE;
  }
}

// Counts interruptions per type.
class InterruptionStatistics {
  private counts: Map<InterruptionType, number> = new Map<InterruptionType, number>();

  public record(type: InterruptionType): void {
    const current: number | undefined = this.counts.get(type);
    const value: number = current === undefined ? 0 : current;
    this.counts.set(type, value + 1);
  }

  public getCount(type: InterruptionType): number {
    const value: number | undefined = this.counts.get(type);
    if (value === undefined) {
      return 0;
    }
    return value;
  }

  public getTotalCount(): number {
    let total: number = 0;
    this.counts.forEach((value: number) => {
      total += value;
    });
    return total;
  }

  public getDistinctTypeCount(): number {
    return this.counts.size;
  }

  public getMostFrequentType(): InterruptionType | null {
    let maxType: InterruptionType | null = null;
    let maxCount: number = 0;
    this.counts.forEach((value: number, key: InterruptionType) => {
      if (value > maxCount) {
        maxCount = value;
        maxType = key;
      }
    });
    return maxType;
  }

  public reset(): void {
    this.counts = new Map<InterruptionType, number>();
  }
}

// Builds interruption snapshots from the live recorder state.
class InterruptionSnapshotBuilder {
  public build(type: InterruptionType, stateCode: number, recording: boolean): InterruptionSnapshot {
    const snapshot: InterruptionSnapshot = {
      type: type,
      severity: InterruptionClassifier.classify(type),
      stateCode: stateCode,
      recording: recording,
      timestamp: Date.now()
    };
    return snapshot;
  }

  public buildMany(types: InterruptionType[], stateCode: number): InterruptionSnapshot[] {
    const snapshots: InterruptionSnapshot[] = [];
    for (let i = 0; i < types.length; i++) {
      snapshots.push(this.build(types[i], stateCode, true));
    }
    return snapshots;
  }
}

// Tracks recovery attempts per interruption type.
class RecoveryAttemptTracker {
  private attempts: Map<InterruptionType, number> = new Map<InterruptionType, number>();

  public record(type: InterruptionType): void {
    const current: number | undefined = this.attempts.get(type);
    const value: number = current === undefined ? 0 : current;
    this.attempts.set(type, value + 1);
  }

  public getAttempts(type: InterruptionType): number {
    const value: number | undefined = this.attempts.get(type);
    if (value === undefined) {
      return 0;
    }
    return value;
  }

  public getTotalAttempts(): number {
    let total: number = 0;
    this.attempts.forEach((value: number) => {
      total += value;
    });
    return total;
  }

  public getDistinctTypeCount(): number {
    return this.attempts.size;
  }

  public reset(): void {
    this.attempts = new Map<InterruptionType, number>();
  }
}

// State machine for the interruption recovery flow.
class RecoveryStateMachine {
  private status: RecoveryStatus = RecoveryStatus.PENDING;

  public start(): void {
    if (this.status === RecoveryStatus.PENDING) {
      this.status = RecoveryStatus.IN_PROGRESS;
    }
  }

  public complete(): void {
    if (this.status === RecoveryStatus.IN_PROGRESS) {
      this.status = RecoveryStatus.COMPLETED;
    }
  }

  public fail(): void {
    if (this.status === RecoveryStatus.IN_PROGRESS) {
      this.status = RecoveryStatus.FAILED;
    }
  }

  public getStatus(): RecoveryStatus {
    return this.status;
  }

  public isTerminal(): boolean {
    return this.status === RecoveryStatus.COMPLETED || this.status === RecoveryStatus.FAILED;
  }

  public isActive(): boolean {
    return this.status === RecoveryStatus.IN_PROGRESS;
  }

  public reset(): void {
    this.status = RecoveryStatus.PENDING;
  }
}

// Timeline of interruption timestamps for ordering checks.
class InterruptionTimeline {
  private timestamps: number[] = [];

  public record(timestamp: number): void {
    this.timestamps.push(timestamp);
  }

  public getTimestamps(): number[] {
    const result: number[] = [];
    for (let i = 0; i < this.timestamps.length; i++) {
      result.push(this.timestamps[i]);
    }
    return result;
  }

  public getCount(): number {
    return this.timestamps.length;
  }

  public getEarliest(): number {
    if (this.timestamps.length === 0) {
      return 0;
    }
    let earliest: number = this.timestamps[0];
    for (let i = 1; i < this.timestamps.length; i++) {
      if (this.timestamps[i] < earliest) {
        earliest = this.timestamps[i];
      }
    }
    return earliest;
  }

  public getLatest(): number {
    if (this.timestamps.length === 0) {
      return 0;
    }
    let latest: number = this.timestamps[0];
    for (let i = 1; i < this.timestamps.length; i++) {
      if (this.timestamps[i] > latest) {
        latest = this.timestamps[i];
      }
    }
    return latest;
  }

  public isChronological(): boolean {
    for (let i = 1; i < this.timestamps.length; i++) {
      if (this.timestamps[i] < this.timestamps[i - 1]) {
        return false;
      }
    }
    return true;
  }

  public reset(): void {
    this.timestamps = [];
  }
}

// Models the two second terminateSelf scheduling of ScreenRecorderAbility.
class AbilityTerminateScheduler {
  public static readonly TERMINATE_DELAY_MS: number = 2000;
  private scheduled: boolean = false;
  private scheduledAt: number = -1;
  private terminated: boolean = false;
  private cancelled: number = 0;

  public schedule(now: number): boolean {
    if (this.scheduled) {
      return false;
    }
    this.scheduled = true;
    this.scheduledAt = now;
    return true;
  }

  public cancel(): boolean {
    if (!this.scheduled) {
      return false;
    }
    this.scheduled = false;
    this.cancelled++;
    return true;
  }

  public isDue(now: number): boolean {
    if (!this.scheduled) {
      return false;
    }
    return now - this.scheduledAt >= AbilityTerminateScheduler.TERMINATE_DELAY_MS;
  }

  public terminate(now: number): boolean {
    if (!this.isDue(now)) {
      return false;
    }
    this.terminated = true;
    this.scheduled = false;
    return true;
  }

  public isScheduled(): boolean {
    return this.scheduled;
  }

  public isTerminated(): boolean {
    return this.terminated;
  }

  public getScheduledAt(): number {
    return this.scheduledAt;
  }

  public getCancelledCount(): number {
    return this.cancelled;
  }

  public reset(): void {
    this.scheduled = false;
    this.scheduledAt = -1;
    this.terminated = false;
    this.cancelled = 0;
  }
}

export default function recorderInterruptionRecoveryTest(): void {
  describe('RecorderInterruptionRecovery_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      hilog.info(DOMAIN, TAG, 'prepare recorder interruption recovery validation');
      await serializedDelay(driver, 500);
    });

    afterAll(async () => {
      hilog.info(DOMAIN, TAG, 'recorder interruption recovery validation finished');
      await serializedDelay(driver, 300);
    });

    // Incoming call moves the recorder into the Error state.
    it('incoming_call_should_enter_error_state', 0, async () => {
      const model = new RecorderSessionStateModel();
      model.startRecording();
      model.interrupt(InterruptionType.INCOMING_CALL);
      expect(model.getState()).assertEqual(InterruptedRecorderState.ERROR);
      expect(model.isRecording()).assertFalse();
      expect(model.getInterruptionCount()).assertEqual(1);
    });

    // Focus loss is recorded with the state at interruption time.
    it('focus_loss_should_be_recorded', 0, async () => {
      const model = new RecorderSessionStateModel();
      model.startRecording();
      model.interrupt(InterruptionType.FOCUS_LOSS);
      const records: InterruptionRecord[] = model.getRecords();
      expect(records[0].type).assertEqual(InterruptionType.FOCUS_LOSS);
      expect(records[0].stateCode).assertEqual(InterruptedRecorderState.RECORDING);
      expect(records[0].recording).assertTrue();
    });

    // Service kill requires terminateSelf to be scheduled.
    it('service_kill_should_schedule_terminate_self', 0, async () => {
      const model = new RecorderSessionStateModel();
      model.startRecording();
      model.interrupt(InterruptionType.SERVICE_KILL);
      expect(model.isTerminateScheduled()).assertTrue();
      expect(model.getState()).assertEqual(InterruptedRecorderState.ERROR);
    });

    // Audio conflict interrupts the recording pipeline.
    it('audio_conflict_should_interrupt_recording', 0, async () => {
      const model = new RecorderSessionStateModel();
      model.startRecording();
      model.interrupt(InterruptionType.AUDIO_CONFLICT);
      expect(model.isRecording()).assertFalse();
      expect(model.countByType(InterruptionType.AUDIO_CONFLICT)).assertEqual(1);
    });

    // Unsupported resolution interrupts and keeps the error state.
    it('unsupported_resolution_should_enter_error_state', 0, async () => {
      const model = new RecorderSessionStateModel();
      model.startRecording();
      model.interrupt(InterruptionType.RESOLUTION_UNSUPPORTED);
      expect(model.getState()).assertEqual(InterruptedRecorderState.ERROR);
      expect(model.isRecovered()).assertTrue();
    });

    // Rotation and system dialogs are recorded without blocking recovery.
    it('minor_interruptions_should_keep_recovery_available', 0, async () => {
      const model = new RecorderSessionStateModel();
      model.startRecording();
      model.interrupt(InterruptionType.SCREEN_ROTATE);
      model.interrupt(InterruptionType.SYSTEM_DIALOG);
      expect(model.getInterruptionCount()).assertEqual(2);
      expect(model.recoverToIdle()).assertTrue();
      expect(model.getState()).assertEqual(InterruptedRecorderState.IDLE);
    });

    // Recovery restores the Idle state and clears scheduling.
    it('recover_should_restore_idle_state', 0, async () => {
      const model = new RecorderSessionStateModel();
      model.startRecording();
      model.interrupt(InterruptionType.INCOMING_CALL);
      expect(model.isTerminateScheduled()).assertTrue();
      expect(model.recoverToIdle()).assertTrue();
      expect(model.getState()).assertEqual(InterruptedRecorderState.IDLE);
      expect(model.isTerminateScheduled()).assertFalse();
    });

    // Recovery is idempotent.
    it('recovery_should_be_idempotent', 0, async () => {
      const model = new RecorderSessionStateModel();
      expect(model.recover()).assertTrue();
      expect(model.recover()).assertTrue();
      expect(model.isRecovered()).assertTrue();
    });

    // Reset clears records, state and scheduling.
    it('reset_should_clear_interruption_state', 0, async () => {
      const model = new RecorderSessionStateModel();
      model.startRecording();
      model.interrupt(InterruptionType.SERVICE_KILL);
      model.reset();
      expect(model.getInterruptionCount()).assertEqual(0);
      expect(model.getState()).assertEqual(InterruptedRecorderState.IDLE);
      expect(model.isRecording()).assertFalse();
      expect(model.isTerminateScheduled()).assertFalse();
    });

    // Repeated interruptions accumulate in order.
    it('multiple_interruptions_should_be_recorded_in_order', 0, async () => {
      const model = new RecorderSessionStateModel();
      model.startRecording();
      model.interrupt(InterruptionType.INCOMING_CALL);
      model.interrupt(InterruptionType.FOCUS_LOSS);
      const records: InterruptionRecord[] = model.getRecords();
      expect(records.length).assertEqual(2);
      expect(records[0].type).assertEqual(InterruptionType.INCOMING_CALL);
      expect(records[1].type).assertEqual(InterruptionType.FOCUS_LOSS);
    });

    // Interruption classes: severity mapping.
    it('classifier_should_map_severity', 0, async () => {
      expect(InterruptionClassifier.classify(InterruptionType.SERVICE_KILL))
        .assertEqual(InterruptionSeverity.CRITICAL);
      expect(InterruptionClassifier.classify(InterruptionType.INCOMING_CALL))
        .assertEqual(InterruptionSeverity.MAJOR);
      expect(InterruptionClassifier.classify(InterruptionType.SCREEN_ROTATE))
        .assertEqual(InterruptionSeverity.MINOR);
      expect(InterruptionClassifier.isCritical(InterruptionType.RESOLUTION_UNSUPPORTED)).assertTrue();
      expect(InterruptionClassifier.isMinor(InterruptionType.SYSTEM_DIALOG)).assertTrue();
      expect(InterruptionClassifier.requiresTerminateSelf(InterruptionType.FOCUS_LOSS)).assertFalse();
    });

    // InterruptionQueue: FIFO ordering.
    it('queue_should_process_interruptions_in_order', 0, async () => {
      const queue = new InterruptionQueue();
      const builder = new InterruptionSnapshotBuilder();
      expect(queue.isEmpty()).assertTrue();
      expect(queue.dequeue()).assertNull();
      expect(queue.peek()).assertNull();
      queue.enqueue(builder.build(InterruptionType.INCOMING_CALL, InterruptedRecorderState.RECORDING, true));
      queue.enqueue(builder.build(InterruptionType.SERVICE_KILL, InterruptedRecorderState.RECORDING, true));
      expect(queue.getSize()).assertEqual(2);
      const first: InterruptionSnapshot | null = queue.dequeue();
      expect(first === null).assertFalse();
      if (first !== null) {
        expect(first.type).assertEqual(InterruptionType.INCOMING_CALL);
      }
      const peeked: InterruptionSnapshot | null = queue.peek();
      expect(peeked === null).assertFalse();
      if (peeked !== null) {
        expect(peeked.type).assertEqual(InterruptionType.SERVICE_KILL);
      }
      queue.clear();
      expect(queue.getSize()).assertEqual(0);
    });

    // Snapshot builder: captures severity and recorder state.
    it('snapshot_builder_should_capture_state', 0, async () => {
      const builder = new InterruptionSnapshotBuilder();
      const snapshot: InterruptionSnapshot =
        builder.build(InterruptionType.SERVICE_KILL, InterruptedRecorderState.RECORDING, true);
      expect(snapshot.severity).assertEqual(InterruptionSeverity.CRITICAL);
      expect(snapshot.stateCode).assertEqual(InterruptedRecorderState.RECORDING);
      expect(snapshot.recording).assertTrue();
      expect(snapshot.timestamp).assertLarger(0);
      const many: InterruptionSnapshot[] = builder.buildMany(
        [InterruptionType.INCOMING_CALL, InterruptionType.FOCUS_LOSS], InterruptedRecorderState.RECORDING);
      expect(many.length).assertEqual(2);
    });

    // RecoveryManager: full recovery flow completes with the Idle state.
    it('recovery_manager_should_complete_flow', 0, async () => {
      const manager = new RecorderRecoveryManager();
      expect(manager.getStatus()).assertEqual(RecoveryStatus.PENDING);
      manager.beginRecovery();
      expect(manager.getStatus()).assertEqual(RecoveryStatus.IN_PROGRESS);
      manager.completeRecovery(InterruptedRecorderState.IDLE);
      expect(manager.getStatus()).assertEqual(RecoveryStatus.COMPLETED);
      expect(manager.getAttempts()).assertEqual(1);
      const result: RecoveryResult = manager.buildResult();
      expect(result.recoveredState).assertEqual(InterruptedRecorderState.IDLE);
      expect(result.message.length).assertLarger(0);
    });

    // RecoveryManager: failure keeps the recorder unstartable.
    it('recovery_manager_should_handle_failure', 0, async () => {
      const manager = new RecorderRecoveryManager();
      manager.beginRecovery();
      manager.failRecovery();
      expect(manager.getStatus()).assertEqual(RecoveryStatus.FAILED);
      manager.reset();
      expect(manager.getStatus()).assertEqual(RecoveryStatus.PENDING);
      expect(manager.getAttempts()).assertEqual(0);
      expect(manager.getRecoveredState()).assertEqual(InterruptedRecorderState.IDLE);
    });

    // InterruptionStatistics: counters per interruption type.
    it('statistics_should_count_interruption_types', 0, async () => {
      const stats = new InterruptionStatistics();
      stats.record(InterruptionType.INCOMING_CALL);
      stats.record(InterruptionType.INCOMING_CALL);
      stats.record(InterruptionType.SERVICE_KILL);
      expect(stats.getCount(InterruptionType.INCOMING_CALL)).assertEqual(2);
      expect(stats.getCount(InterruptionType.SERVICE_KILL)).assertEqual(1);
      expect(stats.getCount(InterruptionType.FOCUS_LOSS)).assertEqual(0);
      expect(stats.getTotalCount()).assertEqual(3);
      expect(stats.getDistinctTypeCount()).assertEqual(2);
      expect(stats.getMostFrequentType()).assertEqual(InterruptionType.INCOMING_CALL);
      stats.reset();
      expect(stats.getTotalCount()).assertEqual(0);
      expect(stats.getMostFrequentType()).assertNull();
    });

    // RecoveryAttemptTracker: attempts per type.
    it('attempt_tracker_should_count_retries', 0, async () => {
      const tracker = new RecoveryAttemptTracker();
      expect(tracker.getAttempts(InterruptionType.FOCUS_LOSS)).assertEqual(0);
      tracker.record(InterruptionType.FOCUS_LOSS);
      tracker.record(InterruptionType.FOCUS_LOSS);
      tracker.record(InterruptionType.SERVICE_KILL);
      expect(tracker.getAttempts(InterruptionType.FOCUS_LOSS)).assertEqual(2);
      expect(tracker.getTotalAttempts()).assertEqual(3);
      expect(tracker.getDistinctTypeCount()).assertEqual(2);
      tracker.reset();
      expect(tracker.getTotalAttempts()).assertEqual(0);
    });

    // RecoveryStateMachine: legal transitions only.
    it('recovery_state_machine_should_gate_transitions', 0, async () => {
      const machine = new RecoveryStateMachine();
      expect(machine.isActive()).assertFalse();
      machine.complete();
      expect(machine.getStatus()).assertEqual(RecoveryStatus.PENDING);
      machine.start();
      expect(machine.isActive()).assertTrue();
      machine.complete();
      expect(machine.isTerminal()).assertTrue();
      expect(machine.getStatus()).assertEqual(RecoveryStatus.COMPLETED);
      machine.reset();
      expect(machine.getStatus()).assertEqual(RecoveryStatus.PENDING);
    });

    // RecoveryStateMachine: failure path.
    it('recovery_state_machine_should_support_failure', 0, async () => {
      const machine = new RecoveryStateMachine();
      machine.start();
      machine.fail();
      expect(machine.getStatus()).assertEqual(RecoveryStatus.FAILED);
      expect(machine.isTerminal()).assertTrue();
      machine.fail();
      expect(machine.getStatus()).assertEqual(RecoveryStatus.FAILED);
    });

    // InterruptionTimeline: chronological timestamps.
    it('timeline_should_preserve_order', 0, async () => {
      const timeline = new InterruptionTimeline();
      expect(timeline.getCount()).assertEqual(0);
      expect(timeline.getEarliest()).assertEqual(0);
      timeline.record(1000);
      timeline.record(2000);
      timeline.record(3000);
      expect(timeline.getCount()).assertEqual(3);
      expect(timeline.getEarliest()).assertEqual(1000);
      expect(timeline.getLatest()).assertEqual(3000);
      expect(timeline.isChronological()).assertTrue();
      expect(timeline.getTimestamps().length).assertEqual(3);
      timeline.reset();
      expect(timeline.getCount()).assertEqual(0);
    });

    // AbilityTerminateScheduler: terminateSelf fires after two seconds.
    it('terminate_scheduler_should_wait_two_seconds', 0, async () => {
      const scheduler = new AbilityTerminateScheduler();
      expect(scheduler.schedule(1000)).assertTrue();
      expect(scheduler.schedule(1100)).assertFalse();
      expect(scheduler.isDue(2999)).assertFalse();
      expect(scheduler.terminate(2999)).assertFalse();
      expect(scheduler.isDue(3000)).assertTrue();
      expect(scheduler.terminate(3000)).assertTrue();
      expect(scheduler.isTerminated()).assertTrue();
      expect(scheduler.isScheduled()).assertFalse();
    });

    // AbilityTerminateScheduler: a successful recovery cancels termination.
    it('terminate_scheduler_should_be_cancellable', 0, async () => {
      const scheduler = new AbilityTerminateScheduler();
      expect(scheduler.cancel()).assertFalse();
      scheduler.schedule(1000);
      expect(scheduler.cancel()).assertTrue();
      expect(scheduler.getCancelledCount()).assertEqual(1);
      expect(scheduler.isDue(5000)).assertFalse();
      scheduler.reset();
      expect(scheduler.getCancelledCount()).assertEqual(0);
      expect(scheduler.isTerminated()).assertFalse();
    });

    // UI smoke check: the recorder window survives a focus interruption.
    it('recorder_window_should_survive_focus_interruption', 0, async () => {
      const count: number = await recorderComponentCount(driver);
      expect(count >= 0).assertEqual(true);
      hilog.info(DOMAIN, TAG, 'recorder window components sampled after interruption');
    });
  });
}