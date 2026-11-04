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
import { Driver } from '../Shared/MiracastDriver';
import { Log } from 'library';
import {
  getDriver,
  KEY_BACK,
  pressAndWait,
  DELAY_KEY_NAVIGATION,
  DELAY_AFTER_SESSION_OP,
  serializedDelay
} from '../Shared/MiracastDriver';

const TAG: string = 'MiracastInterruptionSuite';

// 投屏会话被打断的原因
enum InterruptionType {
  DISCONNECT = 'disconnect', BACK_KEY = 'back_key', APP_BACKGROUND = 'app_background',
  REBOOT = 'reboot', SERVICE_DIE = 'service_die', SCREEN_LOST = 'screen_lost'
}

// 打断的严重程度：决定是否允许自动恢复
enum InterruptionSeverity {
  MINOR = 'minor', MAJOR = 'major', CRITICAL = 'critical'
}

// 恢复状态机：未开始、进行中、已恢复、失败
enum RecoveryStatus {
  NONE = 'none', IN_PROGRESS = 'in_progress', RECOVERED = 'recovered', FAILED = 'failed'
}

// 会话状态：与 CastSession 生命周期对齐
enum CastSessionPhase {
  IDLE = 'idle', PLAYING = 'playing', PAUSED = 'paused', INTERRUPTED = 'interrupted', TERMINATED = 'terminated'
}

// 打断记录
interface InterruptionRecord {
  type: InterruptionType;
  deviceId: string;
  at: number;
  severity: InterruptionSeverity;
}

// 恢复结果
interface RecoveryResult {
  type: InterruptionType;
  status: RecoveryStatus;
  attempts: number;
  elapsedMs: number;
}

// 会话状态模型：被打断前后的状态迁移
class CastSessionStateModel {
  private phase: CastSessionPhase = CastSessionPhase.IDLE;
  private deviceId: string = '';
  private interruptedType: InterruptionType | null = null;

  public start(deviceId: string): boolean {
    if (this.phase === CastSessionPhase.PLAYING) {
      return false;
    }
    this.phase = CastSessionPhase.PLAYING;
    this.deviceId = deviceId;
    return true;
  }

  public pause(): boolean {
    if (this.phase !== CastSessionPhase.PLAYING) {
      return false;
    }
    this.phase = CastSessionPhase.PAUSED;
    return true;
  }

  public resume(): boolean {
    if (this.phase !== CastSessionPhase.PAUSED) {
      return false;
    }
    this.phase = CastSessionPhase.PLAYING;
    return true;
  }

  public interrupt(type: InterruptionType): boolean {
    if (this.phase !== CastSessionPhase.PLAYING && this.phase !== CastSessionPhase.PAUSED) {
      return false;
    }
    this.phase = CastSessionPhase.INTERRUPTED;
    this.interruptedType = type;
    return true;
  }

  public recover(): boolean {
    if (this.phase !== CastSessionPhase.INTERRUPTED) {
      return false;
    }
    this.phase = CastSessionPhase.PLAYING;
    this.interruptedType = null;
    return true;
  }

  public terminate(): void {
    this.phase = CastSessionPhase.TERMINATED;
    this.interruptedType = null;
  }

  public getPhase(): CastSessionPhase { return this.phase; }

  public getDeviceId(): string { return this.deviceId; }

  public getInterruptedType(): InterruptionType | null { return this.interruptedType; }

  public isPlaying(): boolean { return this.phase === CastSessionPhase.PLAYING; }

  public isInterrupted(): boolean { return this.phase === CastSessionPhase.INTERRUPTED; }

  public reset(): void {
    this.phase = CastSessionPhase.IDLE;
    this.deviceId = '';
    this.interruptedType = null;
  }
}

// 打断分类器：根据打断原因给出严重程度与恢复策略
class InterruptionClassifier {
  public classify(type: InterruptionType): InterruptionSeverity {
    if (type === InterruptionType.REBOOT || type === InterruptionType.SERVICE_DIE) {
      return InterruptionSeverity.CRITICAL;
    }
    if (type === InterruptionType.DISCONNECT || type === InterruptionType.SCREEN_LOST) {
      return InterruptionSeverity.MAJOR;
    }
    return InterruptionSeverity.MINOR;
  }

  public isRecoverable(type: InterruptionType): boolean {
    return type !== InterruptionType.REBOOT;
  }

  public requiresFullRestart(type: InterruptionType): boolean {
    return type === InterruptionType.REBOOT || type === InterruptionType.SERVICE_DIE;
  }

  public isUserInitiated(type: InterruptionType): boolean {
    return type === InterruptionType.BACK_KEY || type === InterruptionType.APP_BACKGROUND;
  }

  public shouldKeepScreen(type: InterruptionType): boolean {
    return type === InterruptionType.BACK_KEY || type === InterruptionType.APP_BACKGROUND;
  }
}

// 打断队列：多次打断按到达顺序处理，同一原因只保留一次
class InterruptionQueue {
  private items: InterruptionRecord[] = [];
  private dedupHits: number = 0;

  public enqueue(record: InterruptionRecord): boolean {
    for (let i = 0; i < this.items.length; i++) {
      if (this.items[i].type === record.type) {
        this.dedupHits++;
        return false;
      }
    }
    this.items.push(record);
    return true;
  }

  public dequeue(): InterruptionRecord | null {
    if (this.items.length === 0) {
      return null;
    }
    const first = this.items.shift();
    return first === undefined ? null : first;
  }

  public size(): number { return this.items.length; }

  public peekType(): InterruptionType | null {
    if (this.items.length === 0) {
      return null;
    }
    return this.items[0].type;
  }

  public getDedupHits(): number { return this.dedupHits; }

  public drain(): InterruptionRecord[] {
    const drained = [...this.items];
    this.items = [];
    return drained;
  }

  public clear(): void {
    this.items = [];
    this.dedupHits = 0;
  }
}

// 恢复尝试跟踪器：记录次数与退避延迟
class RecoveryAttemptTracker {
  private attempts: number = 0;
  private lastDelayMs: number = 0;
  private readonly baseDelayMs: number;
  private readonly maxAttempts: number;

  constructor(baseDelayMs: number = 400, maxAttempts: number = 3) {
    this.baseDelayMs = baseDelayMs;
    this.maxAttempts = maxAttempts;
  }

  public recordAttempt(): number {
    this.attempts++;
    this.lastDelayMs = this.baseDelayMs * this.attempts;
    return this.lastDelayMs;
  }

  public getAttempts(): number { return this.attempts; }

  public getLastDelayMs(): number { return this.lastDelayMs; }

  public getMaxAttempts(): number { return this.maxAttempts; }

  public isExhausted(): boolean { return this.attempts >= this.maxAttempts; }

  public reset(): void {
    this.attempts = 0;
    this.lastDelayMs = 0;
  }
}

// 恢复管理器：驱动一次打断的恢复过程并产出 RecoveryResult
class RecoveryManager {
  private status: RecoveryStatus = RecoveryStatus.NONE;
  private tracker: RecoveryAttemptTracker;
  private startedAt: number = 0;
  private classifier: InterruptionClassifier = new InterruptionClassifier();

  constructor(tracker: RecoveryAttemptTracker) {
    this.tracker = tracker;
  }

  public begin(type: InterruptionType, now: number): boolean {
    if (!this.classifier.isRecoverable(type)) {
      this.status = RecoveryStatus.FAILED;
      return false;
    }
    if (this.status === RecoveryStatus.IN_PROGRESS) {
      return false;
    }
    this.status = RecoveryStatus.IN_PROGRESS;
    this.startedAt = now;
    return true;
  }

  public attempt(now: number): number {
    if (this.status !== RecoveryStatus.IN_PROGRESS) {
      return -1;
    }
    if (this.tracker.isExhausted()) {
      this.status = RecoveryStatus.FAILED;
      return -1;
    }
    return this.tracker.recordAttempt();
  }

  public succeed(): boolean {
    if (this.status !== RecoveryStatus.IN_PROGRESS) {
      return false;
    }
    this.status = RecoveryStatus.RECOVERED;
    return true;
  }

  public fail(): void {
    this.status = RecoveryStatus.FAILED;
  }

  public getStatus(): RecoveryStatus { return this.status; }

  public isRecovered(): boolean { return this.status === RecoveryStatus.RECOVERED; }

  public isFailed(): boolean { return this.status === RecoveryStatus.FAILED; }

  public buildResult(type: InterruptionType, now: number): RecoveryResult {
    const elapsed = this.startedAt === 0 ? 0 : now - this.startedAt;
    const result: RecoveryResult = {
      type: type,
      status: this.status,
      attempts: this.tracker.getAttempts(),
      elapsedMs: elapsed > 0 ? elapsed : 0
    };
    return result;
  }

  public reset(): void {
    this.status = RecoveryStatus.NONE;
    this.startedAt = 0;
    this.tracker.reset();
  }
}

// 恢复状态机：限定恢复过程中允许的状态迁移
class RecoveryStateMachine {
  private status: RecoveryStatus = RecoveryStatus.NONE;

  public getStatus(): RecoveryStatus { return this.status; }

  public transitionTo(next: RecoveryStatus): boolean {
    if (this.status === next) {
      return false;
    }
    if (this.status === RecoveryStatus.RECOVERED || this.status === RecoveryStatus.FAILED) {
      return next === RecoveryStatus.NONE;
    }
    if (this.status === RecoveryStatus.NONE) {
      return next === RecoveryStatus.IN_PROGRESS;
    }
    if (this.status === RecoveryStatus.IN_PROGRESS) {
      return next === RecoveryStatus.RECOVERED || next === RecoveryStatus.FAILED;
    }
    return false;
  }

  public canRetry(): boolean { return this.status === RecoveryStatus.IN_PROGRESS || this.status === RecoveryStatus.FAILED; }

  public isTerminal(): boolean { return this.status === RecoveryStatus.RECOVERED || this.status === RecoveryStatus.FAILED; }

  public reset(): void {
    this.status = RecoveryStatus.NONE;
  }
}

// 打断时间线：记录打断与恢复的时间点，计算最长停顿
class InterruptionTimeline {
  private events: string[] = [];
  private times: number[] = [];

  public add(label: string, at: number): void {
    this.events.push(label);
    this.times.push(at);
  }

  public getEventCount(): number { return this.events.length; }

  public getLabels(): string[] { return [...this.events]; }

  public isMonotonic(): boolean {
    for (let i = 1; i < this.times.length; i++) {
      if (this.times[i] < this.times[i - 1]) {
        return false;
      }
    }
    return true;
  }

  public getLongestGap(): number {
    let longest: number = 0;
    for (let i = 1; i < this.times.length; i++) {
      const gap = this.times[i] - this.times[i - 1];
      if (gap > longest) {
        longest = gap;
      }
    }
    return longest;
  }

  public getTotalSpan(): number {
    if (this.times.length < 2) {
      return 0;
    }
    return this.times[this.times.length - 1] - this.times[0];
  }
}

// 打断统计器：统计各原因次数与恢复成功率
class InterruptionStatistics {
  public countBySeverity(records: InterruptionRecord[], severity: InterruptionSeverity): number {
    return records.filter((item: InterruptionRecord): boolean => item.severity === severity).length;
  }

  public getRecoveryRate(results: RecoveryResult[]): number {
    if (results.length === 0) {
      return 0;
    }
    const recovered = results.filter((item: RecoveryResult): boolean =>
      item.status === RecoveryStatus.RECOVERED).length;
    return recovered / results.length;
  }

  public getAverageAttempts(results: RecoveryResult[]): number {
    if (results.length === 0) {
      return 0;
    }
    let sum: number = 0;
    results.forEach((item: RecoveryResult): void => {
      sum += item.attempts;
    });
    return sum / results.length;
  }

  public getCriticalCount(records: InterruptionRecord[]): number {
    return records.filter((item: InterruptionRecord): boolean =>
      item.severity === InterruptionSeverity.CRITICAL).length;
  }
}

// 快照构建器：把打断现场固化为可断言的快照
class InterruptionSnapshotBuilder {
  public build(model: CastSessionStateModel, type: InterruptionType, at: number): RecoveryResult {
    const attempts: number = model.isInterrupted() ? 1 : 0;
    const result: RecoveryResult = {
      type: type,
      status: RecoveryStatus.IN_PROGRESS,
      attempts: attempts,
      elapsedMs: at
    };
    return result;
  }

  public isSnapshotConsistent(model: CastSessionStateModel, result: RecoveryResult): boolean {
    if (model.isInterrupted()) {
      return result.status === RecoveryStatus.IN_PROGRESS;
    }
    return result.status !== RecoveryStatus.IN_PROGRESS;
  }
}

export default function miracastInterruptionRecoverySuite(): void {
  describe('MiracastInterruptionRecovery_Suite', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      Log.info(TAG, 'interruption suite started');
      await serializedDelay(driver, DELAY_AFTER_SESSION_OP);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
      Log.info(TAG, 'interruption suite finished');
    });

    // ===== 会话状态迁移 =====
    it('session_should_start_from_idle', 0, async () => {
      const model = new CastSessionStateModel();
      expect(model.getPhase()).assertEqual(CastSessionPhase.IDLE);
      expect(model.start('dev-0001')).assertTrue();
      expect(model.getPhase()).assertEqual(CastSessionPhase.PLAYING);
      expect(model.getDeviceId()).assertEqual('dev-0001');
    });

    it('session_pause_requires_playing', 0, async () => {
      const model = new CastSessionStateModel();
      expect(model.pause()).assertFalse();
      model.start('dev-0001');
      expect(model.pause()).assertTrue();
      expect(model.getPhase()).assertEqual(CastSessionPhase.PAUSED);
      expect(model.resume()).assertTrue();
      expect(model.getPhase()).assertEqual(CastSessionPhase.PLAYING);
    });

    it('disconnect_interruption_should_mark_interrupted', 0, async () => {
      const model = new CastSessionStateModel();
      model.start('dev-0001');
      expect(model.interrupt(InterruptionType.DISCONNECT)).assertTrue();
      expect(model.isInterrupted()).assertTrue();
      expect(model.getInterruptedType()).assertEqual(InterruptionType.DISCONNECT);
    });

    it('recover_should_restore_playing_state', 0, async () => {
      const model = new CastSessionStateModel();
      model.start('dev-0001');
      model.interrupt(InterruptionType.DISCONNECT);
      expect(model.recover()).assertTrue();
      expect(model.isPlaying()).assertTrue();
      expect(model.getInterruptedType()).assertNull();
    });

    it('recover_without_interruption_should_fail', 0, async () => {
      const model = new CastSessionStateModel();
      model.start('dev-0001');
      expect(model.recover()).assertFalse();
      expect(model.isPlaying()).assertTrue();
    });

    it('reset_should_return_to_idle', 0, async () => {
      const model = new CastSessionStateModel();
      model.start('dev-0001');
      model.interrupt(InterruptionType.REBOOT);
      model.reset();
      expect(model.getPhase()).assertEqual(CastSessionPhase.IDLE);
      expect(model.getDeviceId()).assertEqual('');
      expect(model.getInterruptedType()).assertNull();
    });

    // ===== 打断分类 =====
    it('disconnect_should_be_major_severity', 0, async () => {
      const classifier = new InterruptionClassifier();
      expect(classifier.classify(InterruptionType.DISCONNECT)).assertEqual(InterruptionSeverity.MAJOR);
      expect(classifier.classify(InterruptionType.SCREEN_LOST)).assertEqual(InterruptionSeverity.MAJOR);
    });

    it('reboot_should_be_critical_severity', 0, async () => {
      const classifier = new InterruptionClassifier();
      expect(classifier.classify(InterruptionType.REBOOT)).assertEqual(InterruptionSeverity.CRITICAL);
      expect(classifier.classify(InterruptionType.SERVICE_DIE)).assertEqual(InterruptionSeverity.CRITICAL);
    });

    it('reboot_should_not_be_auto_recoverable', 0, async () => {
      const classifier = new InterruptionClassifier();
      expect(classifier.isRecoverable(InterruptionType.REBOOT)).assertFalse();
      expect(classifier.isRecoverable(InterruptionType.DISCONNECT)).assertTrue();
      expect(classifier.isRecoverable(InterruptionType.SERVICE_DIE)).assertTrue();
      expect(classifier.requiresFullRestart(InterruptionType.REBOOT)).assertTrue();
      expect(classifier.requiresFullRestart(InterruptionType.DISCONNECT)).assertFalse();
      expect(classifier.isUserInitiated(InterruptionType.BACK_KEY)).assertTrue();
      expect(classifier.shouldKeepScreen(InterruptionType.BACK_KEY)).assertTrue();
    });

    // ===== 打断队列 =====
    it('interruption_queue_should_keep_fifo_order', 0, async () => {
      const queue = new InterruptionQueue();
      const first: InterruptionRecord = {
        type: InterruptionType.DISCONNECT,
        deviceId: 'dev-0001',
        at: 1000,
        severity: InterruptionSeverity.MAJOR
      };
      const second: InterruptionRecord = {
        type: InterruptionType.BACK_KEY,
        deviceId: 'dev-0001',
        at: 2000,
        severity: InterruptionSeverity.MINOR
      };
      expect(queue.enqueue(first)).assertTrue();
      expect(queue.enqueue(second)).assertTrue();
      expect(queue.size()).assertEqual(2);
      expect(queue.peekType()).assertEqual(InterruptionType.DISCONNECT);
      const head = queue.dequeue();
      expect(head === null).assertFalse();
      if (head !== null) {
        expect(head.type).assertEqual(InterruptionType.DISCONNECT);
      }
      expect(queue.peekType()).assertEqual(InterruptionType.BACK_KEY);
    });

    it('interruption_queue_should_dedup_by_type', 0, async () => {
      const queue = new InterruptionQueue();
      const record: InterruptionRecord = {
        type: InterruptionType.DISCONNECT,
        deviceId: 'dev-0001',
        at: 1000,
        severity: InterruptionSeverity.MAJOR
      };
      expect(queue.enqueue(record)).assertTrue();
      expect(queue.enqueue(record)).assertFalse();
      expect(queue.size()).assertEqual(1);
      expect(queue.getDedupHits()).assertEqual(1);
    });

    it('interruption_queue_drain_should_return_all', 0, async () => {
      const queue = new InterruptionQueue();
      queue.enqueue({
        type: InterruptionType.REBOOT,
        deviceId: 'dev-0001',
        at: 1000,
        severity: InterruptionSeverity.CRITICAL
      });
      queue.enqueue({
        type: InterruptionType.SCREEN_LOST,
        deviceId: 'dev-0001',
        at: 2000,
        severity: InterruptionSeverity.MAJOR
      });
      const drained = queue.drain();
      expect(drained.length).assertEqual(2);
      expect(queue.size()).assertEqual(0);
      queue.clear();
      expect(queue.getDedupHits()).assertEqual(0);
    });

    // ===== 恢复尝试与退避 =====
    it('recovery_tracker_should_grow_delay_linearly', 0, async () => {
      const tracker = new RecoveryAttemptTracker(400, 3);
      expect(tracker.recordAttempt()).assertEqual(400);
      expect(tracker.recordAttempt()).assertEqual(800);
      expect(tracker.recordAttempt()).assertEqual(1200);
      expect(tracker.getAttempts()).assertEqual(3);
      expect(tracker.isExhausted()).assertTrue();
      expect(tracker.getMaxAttempts()).assertEqual(3);
      expect(tracker.getLastDelayMs()).assertEqual(1200);
    });

    it('recovery_manager_should_recover_after_attempt', 0, async () => {
      const manager = new RecoveryManager(new RecoveryAttemptTracker(400, 3));
      expect(manager.begin(InterruptionType.DISCONNECT, 1000)).assertTrue();
      expect(manager.getStatus()).assertEqual(RecoveryStatus.IN_PROGRESS);
      expect(manager.attempt(1100)).assertEqual(400);
      expect(manager.succeed()).assertTrue();
      expect(manager.isRecovered()).assertTrue();
      const result = manager.buildResult(InterruptionType.DISCONNECT, 1500);
      expect(result.status).assertEqual(RecoveryStatus.RECOVERED);
      expect(result.attempts).assertEqual(1);
      expect(result.elapsedMs).assertEqual(500);
    });

    it('recovery_manager_should_reject_reboot', 0, async () => {
      const manager = new RecoveryManager(new RecoveryAttemptTracker(400, 3));
      expect(manager.begin(InterruptionType.REBOOT, 1000)).assertFalse();
      expect(manager.getStatus()).assertEqual(RecoveryStatus.FAILED);
      expect(manager.isFailed()).assertTrue();
    });

    it('recovery_manager_double_begin_should_fail', 0, async () => {
      const manager = new RecoveryManager(new RecoveryAttemptTracker(400, 3));
      manager.begin(InterruptionType.DISCONNECT, 1000);
      expect(manager.begin(InterruptionType.BACK_KEY, 1100)).assertFalse();
      expect(manager.getStatus()).assertEqual(RecoveryStatus.IN_PROGRESS);
    });

    it('recovery_manager_should_fail_after_exhausting_attempts', 0, async () => {
      const manager = new RecoveryManager(new RecoveryAttemptTracker(400, 2));
      manager.begin(InterruptionType.SERVICE_DIE, 1000);
      expect(manager.attempt(1000)).assertEqual(400);
      expect(manager.attempt(1400)).assertEqual(800);
      expect(manager.attempt(1800)).assertEqual(-1);
      expect(manager.isFailed()).assertTrue();
      manager.fail();
      expect(manager.getStatus()).assertEqual(RecoveryStatus.FAILED);
    });

    // ===== 恢复状态机 =====

    it('recovery_state_machine_should_reject_illegal_jump', 0, async () => {
      const machine = new RecoveryStateMachine();
      expect(machine.transitionTo(RecoveryStatus.RECOVERED)).assertFalse();
      expect(machine.transitionTo(RecoveryStatus.FAILED)).assertFalse();
      expect(machine.getStatus()).assertEqual(RecoveryStatus.NONE);
    });


    // ===== 时间线 =====
    it('timeline_should_compute_longest_gap', 0, async () => {
      const timeline = new InterruptionTimeline();
      timeline.add('interrupt', 1000);
      timeline.add('attempt', 1400);
      timeline.add('recovered', 2600);
      expect(timeline.getEventCount()).assertEqual(3);
      expect(timeline.getLongestGap()).assertEqual(1200);
      expect(timeline.getTotalSpan()).assertEqual(1600);
    });

    it('timeline_should_detect_out_of_order_events', 0, async () => {
      const timeline = new InterruptionTimeline();
      timeline.add('interrupt', 2000);
      timeline.add('recovered', 1000);
      expect(timeline.isMonotonic()).assertFalse();
      timeline.add('retry', 3000);
      expect(timeline.getLabels().length).assertEqual(3);
    });

    // ===== 统计 =====
    it('statistics_recovery_rate_should_be_computed', 0, async () => {
      const results: RecoveryResult[] = [
        {
          type: InterruptionType.DISCONNECT,
          status: RecoveryStatus.RECOVERED,
          attempts: 1,
          elapsedMs: 500
        },
        {
          type: InterruptionType.REBOOT,
          status: RecoveryStatus.FAILED,
          attempts: 0,
          elapsedMs: 0
        },
        {
          type: InterruptionType.BACK_KEY,
          status: RecoveryStatus.RECOVERED,
          attempts: 2,
          elapsedMs: 900
        }
      ];
      const stats = new InterruptionStatistics();
      expect(stats.getRecoveryRate(results)).assertEqual(2 / 3);
      expect(stats.getAverageAttempts(results)).assertEqual(1);
      expect(stats.getRecoveryRate([])).assertEqual(0);
      expect(stats.getAverageAttempts([])).assertEqual(0);
      const records: InterruptionRecord[] = [
        { type: InterruptionType.REBOOT, deviceId: 'dev-0001', at: 1000, severity: InterruptionSeverity.CRITICAL }
      ];
      expect(stats.countBySeverity(records, InterruptionSeverity.CRITICAL)).assertEqual(1);
      expect(stats.getCriticalCount(records)).assertEqual(1);
    });

    // ===== 快照 =====
    it('screen_lost_recovery_flow_should_succeed', 0, async () => {
      const model = new CastSessionStateModel();
      model.start('dev-0001');
      model.interrupt(InterruptionType.SCREEN_LOST);
      const manager = new RecoveryManager(new RecoveryAttemptTracker(400, 3));
      manager.begin(InterruptionType.SCREEN_LOST, 1000);
      manager.attempt(1100);
      manager.succeed();
      model.recover();
      expect(manager.isRecovered()).assertTrue();
      expect(model.isPlaying()).assertTrue();
      expect(model.getInterruptedType()).assertNull();
      const builder = new InterruptionSnapshotBuilder();
      const snapshot = builder.build(model, InterruptionType.SCREEN_LOST, 1500);
      expect(snapshot.type).assertEqual(InterruptionType.SCREEN_LOST);
      expect(builder.isSnapshotConsistent(model, snapshot)).assertFalse();
    });

    it('terminated_session_should_not_interrupt', 0, async () => {
      const model = new CastSessionStateModel();
      model.start('dev-0001');
      model.terminate();
      expect(model.interrupt(InterruptionType.DISCONNECT)).assertFalse();
      expect(model.getPhase()).assertEqual(CastSessionPhase.TERMINATED);
    });

  });
}
