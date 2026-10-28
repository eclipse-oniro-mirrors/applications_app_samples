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

const INTERRUPT_BACKGROUND: string = 'background';

const INTERRUPT_NETWORK: string = 'network';

const INTERRUPT_PROCESS_KILL: string = 'processKill';

const INTERRUPT_CONFIGURATION: string = 'configuration';

const INTERRUPT_UNKNOWN: string = 'unknown';

const RESUME_IDLE: string = 'idle';

const RESUME_RESTORING: string = 'restoring';

const RESUME_READY: string = 'ready';

const RESUME_FAILED: string = 'failed';

const MAX_RESTORE_ATTEMPTS: number = 3;

interface Checkpoint {
  issueId: string;
  description: string;
  status: string;
  savedAt: number;
}

// Classifies app interruptions that require state restoration
class InterruptionClassifier {
  public static classify(reason: string): string {
    if (reason === INTERRUPT_BACKGROUND || reason === INTERRUPT_NETWORK ||
      reason === INTERRUPT_PROCESS_KILL || reason === INTERRUPT_CONFIGURATION) {
      return reason;
    }
    return INTERRUPT_UNKNOWN;
  }

  public static requiresRestore(reason: string): boolean {
    return InterruptionClassifier.classify(reason) === INTERRUPT_PROCESS_KILL ||
      InterruptionClassifier.classify(reason) === INTERRUPT_CONFIGURATION;
  }

  public static requiresRetry(reason: string): boolean {
    return InterruptionClassifier.classify(reason) === INTERRUPT_NETWORK;
  }

  public static isTransparent(reason: string): boolean {
    return InterruptionClassifier.classify(reason) === INTERRUPT_BACKGROUND;
  }

  public static isKnown(reason: string): boolean {
    return InterruptionClassifier.classify(reason) !== INTERRUPT_UNKNOWN;
  }
}

// Saves and restores the latest issue draft checkpoint
class CheckpointStore {
  private checkpoints: Map<string, Checkpoint> = new Map<string, Checkpoint>();

  public save(checkpoint: Checkpoint): boolean {
    if (checkpoint.issueId.length === 0 || checkpoint.description.length === 0) {
      return false;
    }
    this.checkpoints.set(checkpoint.issueId, {
      issueId: checkpoint.issueId,
      description: checkpoint.description,
      status: checkpoint.status,
      savedAt: checkpoint.savedAt
    });
    return true;
  }

  public restore(issueId: string): Checkpoint | undefined {
    return this.checkpoints.get(issueId);
  }

  public remove(issueId: string): boolean {
    return this.checkpoints.delete(issueId);
  }

  public size(): number {
    return this.checkpoints.size;
  }

  public latest(): Checkpoint | undefined {
    let latest: Checkpoint | undefined = undefined;
    this.checkpoints.forEach((checkpoint: Checkpoint) => {
      if (latest === undefined || checkpoint.savedAt > latest.savedAt) {
        latest = checkpoint;
      }
    });
    return latest;
  }

  public clear(): void {
    this.checkpoints = new Map<string, Checkpoint>();
  }
}

// Drives restoration after interruptions
class InterruptionRecoveryManager {
  private state: string = RESUME_IDLE;
  private attempts: number = 0;
  private lastReason: string = INTERRUPT_UNKNOWN;

  public onInterrupt(reason: string): string {
    this.lastReason = InterruptionClassifier.classify(reason);
    if (InterruptionClassifier.requiresRestore(this.lastReason)) {
      this.state = RESUME_RESTORING;
    }
    return this.state;
  }

  public attemptRestore(restore: () => boolean): boolean {
    if (this.state !== RESUME_RESTORING) {
      return false;
    }
    this.attempts++;
    const restored = restore();
    if (restored) {
      this.state = RESUME_READY;
      this.attempts = 0;
      return true;
    }
    if (this.attempts >= MAX_RESTORE_ATTEMPTS) {
      this.state = RESUME_FAILED;
    }
    return false;
  }

  public complete(): boolean {
    if (this.state !== RESUME_READY) {
      return false;
    }
    this.state = RESUME_IDLE;
    return true;
  }

  public getState(): string {
    return this.state;
  }

  public getAttempts(): number {
    return this.attempts;
  }

  public getLastReason(): string {
    return this.lastReason;
  }

  public isFailed(): boolean {
    return this.state === RESUME_FAILED;
  }

  public reset(): void {
    this.state = RESUME_IDLE;
    this.attempts = 0;
    this.lastReason = INTERRUPT_UNKNOWN;
  }
}

// Tracks a submission that was interrupted and can be resumed
class PendingSubmission {
  private issueId: string = '';
  private attempts: number = 0;
  private suspended: boolean = false;
  private completed: boolean = false;

  public begin(issueId: string): boolean {
    if (issueId.length === 0 || this.completed) {
      return false;
    }
    this.issueId = issueId;
    this.suspended = false;
    return true;
  }

  public suspend(): boolean {
    if (this.issueId.length === 0 || this.completed) {
      return false;
    }
    this.suspended = true;
    return true;
  }

  public resume(): boolean {
    if (!this.suspended || this.completed) {
      return false;
    }
    if (this.attempts >= MAX_RESTORE_ATTEMPTS) {
      return false;
    }
    this.suspended = false;
    this.attempts++;
    return true;
  }

  public complete(): boolean {
    if (this.issueId.length === 0 || this.completed) {
      return false;
    }
    this.completed = true;
    this.suspended = false;
    return true;
  }

  public getIssueId(): string {
    return this.issueId;
  }

  public getAttempts(): number {
    return this.attempts;
  }

  public isSuspended(): boolean {
    return this.suspended;
  }

  public isCompleted(): boolean {
    return this.completed;
  }

  public canRetry(): boolean {
    return this.attempts < MAX_RESTORE_ATTEMPTS && !this.completed;
  }

  public reset(): void {
    this.issueId = '';
    this.attempts = 0;
    this.suspended = false;
    this.completed = false;
  }
}

// Logs interruption events for diagnostics
class InterruptionLog {
  private events: string[] = [];
  private readonly capacity: number;

  constructor(capacity: number) {
    this.capacity = capacity;
  }

  public record(reason: string): void {
    if (this.capacity <= 0) {
      return;
    }
    if (this.events.length >= this.capacity) {
      this.events.shift();
    }
    this.events.push(InterruptionClassifier.classify(reason));
  }

  public count(): number {
    return this.events.length;
  }

  public countOf(reason: string): number {
    let count: number = 0;
    for (let i = 0; i < this.events.length; i++) {
      if (this.events[i] === reason) {
        count++;
      }
    }
    return count;
  }

  public latest(): string {
    return this.events.length === 0 ? '' : this.events[this.events.length - 1];
  }

  public clear(): void {
    this.events = [];
  }
}

export default function issueInterruptionRecoveryTest() {
  describe('IssueInterruptionRecovery_Test', () => {

    it('classifier_should_recognize_reasons', 0, () => {
      expect(InterruptionClassifier.classify(INTERRUPT_BACKGROUND)).assertEqual(INTERRUPT_BACKGROUND);
      expect(InterruptionClassifier.classify(INTERRUPT_NETWORK)).assertEqual(INTERRUPT_NETWORK);
      expect(InterruptionClassifier.classify(INTERRUPT_PROCESS_KILL)).assertEqual(INTERRUPT_PROCESS_KILL);
      expect(InterruptionClassifier.classify(INTERRUPT_CONFIGURATION)).assertEqual(INTERRUPT_CONFIGURATION);
      expect(InterruptionClassifier.classify('other')).assertEqual(INTERRUPT_UNKNOWN);
      expect(InterruptionClassifier.isKnown('other')).assertFalse();
    });

    it('classifier_should_map_recovery_actions', 0, () => {
      expect(InterruptionClassifier.requiresRestore(INTERRUPT_PROCESS_KILL)).assertTrue();
      expect(InterruptionClassifier.requiresRestore(INTERRUPT_CONFIGURATION)).assertTrue();
      expect(InterruptionClassifier.requiresRestore(INTERRUPT_BACKGROUND)).assertFalse();
      expect(InterruptionClassifier.requiresRetry(INTERRUPT_NETWORK)).assertTrue();
      expect(InterruptionClassifier.isTransparent(INTERRUPT_BACKGROUND)).assertTrue();
      expect(InterruptionClassifier.isTransparent(INTERRUPT_NETWORK)).assertFalse();
    });

    it('checkpoint_store_should_save_and_restore', 0, () => {
      const store = new CheckpointStore();
      expect(store.save({
        issueId: 'ISSUE-1001', description: 'screen flickers', status: 'draft', savedAt: 100
      })).assertTrue();
      expect(store.save({
        issueId: '', description: 'x', status: 'draft', savedAt: 1
      })).assertFalse();
      expect(store.save({
        issueId: 'ISSUE-1002', description: '', status: 'draft', savedAt: 1
      })).assertFalse();
      expect(store.size()).assertEqual(1);
      const restored = store.restore('ISSUE-1001') as Checkpoint;
      expect(restored.description).assertEqual('screen flickers');
      expect(store.restore('missing') === undefined).assertTrue();
    });

    it('checkpoint_store_should_find_latest', 0, () => {
      const store = new CheckpointStore();
      store.save({ issueId: 'a', description: 'a', status: 'draft', savedAt: 100 });
      store.save({ issueId: 'b', description: 'b', status: 'draft', savedAt: 300 });
      store.save({ issueId: 'c', description: 'c', status: 'draft', savedAt: 200 });
      expect((store.latest() as Checkpoint).issueId).assertEqual('b');
      expect(store.remove('b')).assertTrue();
      expect(store.remove('b')).assertFalse();
      expect((store.latest() as Checkpoint).issueId).assertEqual('c');
      store.clear();
      expect(store.size()).assertEqual(0);
      expect(store.latest() === undefined).assertTrue();
    });

    it('manager_should_restore_after_process_kill', 0, () => {
      const manager = new InterruptionRecoveryManager();
      expect(manager.onInterrupt(INTERRUPT_PROCESS_KILL)).assertEqual(RESUME_RESTORING);
      expect(manager.getLastReason()).assertEqual(INTERRUPT_PROCESS_KILL);
      expect(manager.attemptRestore(() => true)).assertTrue();
      expect(manager.getState()).assertEqual(RESUME_READY);
      expect(manager.getAttempts()).assertEqual(0);
      expect(manager.complete()).assertTrue();
      expect(manager.getState()).assertEqual(RESUME_IDLE);
    });

    it('manager_should_retry_restore', 0, () => {
      const manager = new InterruptionRecoveryManager();
      manager.onInterrupt(INTERRUPT_CONFIGURATION);
      expect(manager.attemptRestore(() => false)).assertFalse();
      expect(manager.getAttempts()).assertEqual(1);
      expect(manager.getState()).assertEqual(RESUME_RESTORING);
      expect(manager.attemptRestore(() => false)).assertFalse();
      expect(manager.attemptRestore(() => true)).assertTrue();
      expect(manager.getState()).assertEqual(RESUME_READY);
      expect(manager.getAttempts()).assertEqual(0);
    });

    it('manager_should_fail_after_max_attempts', 0, () => {
      const manager = new InterruptionRecoveryManager();
      manager.onInterrupt(INTERRUPT_PROCESS_KILL);
      expect(manager.attemptRestore(() => false)).assertFalse();
      expect(manager.attemptRestore(() => false)).assertFalse();
      expect(manager.attemptRestore(() => false)).assertFalse();
      expect(manager.isFailed()).assertTrue();
      expect(manager.getState()).assertEqual(RESUME_FAILED);
      expect(manager.complete()).assertFalse();
      manager.reset();
      expect(manager.getState()).assertEqual(RESUME_IDLE);
      expect(manager.getAttempts()).assertEqual(0);
    });

    it('manager_should_ignore_transparent_interruptions', 0, () => {
      const manager = new InterruptionRecoveryManager();
      expect(manager.onInterrupt(INTERRUPT_BACKGROUND)).assertEqual(RESUME_IDLE);
      expect(manager.onInterrupt(INTERRUPT_NETWORK)).assertEqual(RESUME_IDLE);
      expect(manager.attemptRestore(() => true)).assertFalse();
      expect(manager.complete()).assertFalse();
      expect(manager.getLastReason()).assertEqual(INTERRUPT_NETWORK);
    });

    it('pending_submission_should_suspend_and_resume', 0, () => {
      const pending = new PendingSubmission();
      expect(pending.begin('ISSUE-2001')).assertTrue();
      expect(pending.begin('')).assertFalse();
      expect(pending.getIssueId()).assertEqual('ISSUE-2001');
      expect(pending.suspend()).assertTrue();
      expect(pending.isSuspended()).assertTrue();
      expect(pending.resume()).assertTrue();
      expect(pending.getAttempts()).assertEqual(1);
      expect(pending.resume()).assertFalse();
      expect(pending.complete()).assertTrue();
      expect(pending.isCompleted()).assertTrue();
      expect(pending.complete()).assertFalse();
    });

    it('pending_submission_should_bound_resume_attempts', 0, () => {
      const pending = new PendingSubmission();
      pending.begin('ISSUE-3001');
      for (let i = 0; i < MAX_RESTORE_ATTEMPTS; i++) {
        pending.suspend();
        expect(pending.resume()).assertTrue();
      }
      pending.suspend();
      expect(pending.resume()).assertFalse();
      expect(pending.canRetry()).assertFalse();
      expect(pending.getAttempts()).assertEqual(MAX_RESTORE_ATTEMPTS);
      pending.reset();
      expect(pending.getAttempts()).assertEqual(0);
      expect(pending.isCompleted()).assertFalse();
    });

    it('log_should_track_interruptions', 0, () => {
      const log = new InterruptionLog(3);
      log.record(INTERRUPT_BACKGROUND);
      log.record(INTERRUPT_NETWORK);
      log.record(INTERRUPT_NETWORK);
      expect(log.count()).assertEqual(3);
      expect(log.countOf(INTERRUPT_NETWORK)).assertEqual(2);
      expect(log.countOf(INTERRUPT_BACKGROUND)).assertEqual(1);
      expect(log.latest()).assertEqual(INTERRUPT_NETWORK);
      log.record(INTERRUPT_PROCESS_KILL);
      expect(log.count()).assertEqual(3);
      expect(log.countOf(INTERRUPT_BACKGROUND)).assertEqual(0);
      expect(log.latest()).assertEqual(INTERRUPT_PROCESS_KILL);
      log.clear();
      expect(log.count()).assertEqual(0);
    });

    it('recovery_flow_should_restore_and_resume', 0, () => {
      const store = new CheckpointStore();
      const manager = new InterruptionRecoveryManager();
      const pending = new PendingSubmission();
      const log = new InterruptionLog(10);
      store.save({
        issueId: 'ISSUE-4001', description: 'black screen', status: 'draft', savedAt: 100
      });
      pending.begin('ISSUE-4001');
      pending.suspend();
      log.record(INTERRUPT_PROCESS_KILL);
      expect(manager.onInterrupt(log.latest())).assertEqual(RESUME_RESTORING);
      const restored = manager.attemptRestore(() => store.restore('ISSUE-4001') !== undefined);
      expect(restored).assertTrue();
      expect(pending.resume()).assertTrue();
      expect(pending.complete()).assertTrue();
      expect(manager.complete()).assertTrue();
      expect(store.remove('ISSUE-4001')).assertTrue();
      expect(store.size()).assertEqual(0);
    });

    it('recovery_constants_should_be_stable', 0, () => {
      expect(INTERRUPT_BACKGROUND).assertEqual('background');
      expect(INTERRUPT_NETWORK).assertEqual('network');
      expect(INTERRUPT_PROCESS_KILL).assertEqual('processKill');
      expect(INTERRUPT_CONFIGURATION).assertEqual('configuration');
      expect(MAX_RESTORE_ATTEMPTS).assertEqual(3);
      expect(RESUME_FAILED).assertEqual('failed');
    });
  });
}

