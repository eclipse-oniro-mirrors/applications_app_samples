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
 * Concurrency control model of the TV screen recorder.
 * The TV device exposes a single UI thread, therefore every recorder request is
 * serialized. The suite models the queue, the parallel start requests and the
 * race between a stop request and a late state callback.
 */

/** Recording state of the sample application. */
enum RecordingState {
  IDLE = 0,
  RECORDING = 1,
  STOPPED = 2,
  ERROR = 3
}

/** Result of one start request. */
interface StartRequestResult {
  accepted: boolean;
  reason: string;
  queuePosition: number;
}

/** Serialized task queue with explicit identifiers. */
class SerialTaskQueue {
  private queue: string[] = [];
  private executed: string[] = [];
  private running: string = '';
  private rejects: number = 0;

  public enqueue(taskId: string): number {
    if (taskId.length === 0) {
      this.rejects++;
      return -1;
    }
    if (this.running === taskId || this.queue.includes(taskId)) {
      this.rejects++;
      return -1;
    }
    this.queue.push(taskId);
    return this.queue.length;
  }

  public runNext(): string {
    if (this.running.length > 0) {
      return '';
    }
    if (this.queue.length === 0) {
      return '';
    }
    const task = this.queue[0];
    this.queue.splice(0, 1);
    this.running = task;
    this.executed.push(task);
    this.running = '';
    return task;
  }

  public runAll(): number {
    let executed = 0;
    while (this.queue.length > 0) {
      const task = this.runNext();
      if (task.length > 0) {
        executed++;
      }
    }
    return executed;
  }

  public pendingCount(): number {
    return this.queue.length;
  }

  public executedCount(): number {
    return this.executed.length;
  }

  public executedOrder(): string[] {
    const result: string[] = [];
    for (let index = 0; index < this.executed.length; index++) {
      result.push(this.executed[index]);
    }
    return result;
  }

  public isRunning(): boolean {
    return this.running.length > 0;
  }

  public getRejects(): number {
    return this.rejects;
  }

  public clear(): void {
    this.queue = [];
    this.executed = [];
    this.running = '';
  }
}

/**
 * Broker of concurrent start requests.
 * Two remote control presses may arrive before the first request completes, so
 * the broker accepts only the first one and reports the following ones as busy.
 */
class StartRequestBroker {
  private busy: boolean = false;
  private accepted: number = 0;
  private rejected: number = 0;
  private lastReason: string = '';

  public request(): StartRequestResult {
    if (this.busy) {
      this.rejected++;
      this.lastReason = 'busy';
      const rejectedResult: StartRequestResult = {
        accepted: false, reason: 'busy', queuePosition: -1
      };
      return rejectedResult;
    }
    this.busy = true;
    this.accepted++;
    this.lastReason = 'accepted';
    const acceptedResult: StartRequestResult = {
      accepted: true, reason: 'accepted', queuePosition: 1
    };
    return acceptedResult;
  }

  public complete(): void {
    this.busy = false;
  }

  public isBusy(): boolean {
    return this.busy;
  }

  public getAccepted(): number {
    return this.accepted;
  }

  public getRejected(): number {
    return this.rejected;
  }

  public getLastReason(): string {
    return this.lastReason;
  }

  public reset(): void {
    this.busy = false;
    this.accepted = 0;
    this.rejected = 0;
    this.lastReason = '';
  }
}

/**
 * Race model between a stop request and a late state callback.
 * The stop request wins when it arrives first; a late Recording callback must
 * not resurrect the stopped session.
 */
class StopStateRaceModel {
  private state: RecordingState = RecordingState.IDLE;
  private staleCallbacks: number = 0;
  private appliedCallbacks: number = 0;
  private history: number[] = [];

  public start(): void {
    if (this.state === RecordingState.IDLE) {
      this.state = RecordingState.RECORDING;
    }
  }

  public requestStop(): boolean {
    if (this.state !== RecordingState.RECORDING) {
      return false;
    }
    this.state = RecordingState.STOPPED;
    this.history.push(RecordingState.STOPPED);
    return true;
  }

  public onStateCallback(reportedState: RecordingState): boolean {
    if (this.state === RecordingState.STOPPED && reportedState === RecordingState.RECORDING) {
      this.staleCallbacks++;
      return false;
    }
    this.appliedCallbacks++;
    this.state = reportedState;
    this.history.push(reportedState);
    return true;
  }

  public getState(): RecordingState {
    return this.state;
  }

  public getStaleCallbacks(): number {
    return this.staleCallbacks;
  }

  public getAppliedCallbacks(): number {
    return this.appliedCallbacks;
  }

  public historyCount(): number {
    return this.history.length;
  }

  public isTerminal(): boolean {
    return this.state === RecordingState.STOPPED || this.state === RecordingState.ERROR;
  }
}

/** Guard against re-entrant recorder calls from a state callback. */
class ReentrancyGuard {
  private depth: number = 0;
  private rejected: number = 0;
  private entered: number = 0;

  public enter(): boolean {
    if (this.depth > 0) {
      this.rejected++;
      return false;
    }
    this.depth++;
    this.entered++;
    return true;
  }

  public leave(): void {
    if (this.depth > 0) {
      this.depth--;
    }
  }

  public run(action: string): boolean {
    if (!this.enter()) {
      return false;
    }
    if (action === 'nested') {
      this.enter();
      this.leave();
    }
    this.leave();
    return true;
  }

  public getDepth(): number {
    return this.depth;
  }

  public getRejected(): number {
    return this.rejected;
  }

  public getEntered(): number {
    return this.entered;
  }
}

export default function concurrencyControlTest(): void {
  describe('ConcurrencyControl_Test', () => {
    it('serial_queue_should_preserve_fifo_order', 0, () => {
      const queue = new SerialTaskQueue();
      expect(queue.enqueue('start')).assertEqual(1);
      expect(queue.enqueue('state_callback')).assertEqual(2);
      expect(queue.enqueue('show_tip')).assertEqual(3);
      expect(queue.pendingCount()).assertEqual(3);
      expect(queue.runAll()).assertEqual(3);
      expect(queue.executedCount()).assertEqual(3);
      const order = queue.executedOrder();
      expect(order[0]).assertEqual('start');
      expect(order[1]).assertEqual('state_callback');
      expect(order[2]).assertEqual('show_tip');
      expect(queue.pendingCount()).assertEqual(0);
    });

    it('serial_queue_should_reject_empty_task', 0, () => {
      const queue = new SerialTaskQueue();
      expect(queue.enqueue('')).assertEqual(-1);
      expect(queue.getRejects()).assertEqual(1);
      expect(queue.pendingCount()).assertEqual(0);
    });

    it('serial_queue_should_reject_duplicate_task', 0, () => {
      const queue = new SerialTaskQueue();
      queue.enqueue('start');
      expect(queue.enqueue('start')).assertEqual(-1);
      expect(queue.getRejects()).assertEqual(1);
      expect(queue.pendingCount()).assertEqual(1);
    });

    it('serial_queue_should_run_one_task_at_a_time', 0, () => {
      const queue = new SerialTaskQueue();
      queue.enqueue('start');
      queue.enqueue('stop');
      expect(queue.runNext()).assertEqual('start');
      expect(queue.isRunning()).assertFalse();
      expect(queue.runNext()).assertEqual('stop');
      expect(queue.runNext()).assertEqual('');
      expect(queue.executedCount()).assertEqual(2);
    });

    it('serial_queue_clear_should_drop_pending_tasks', 0, () => {
      const queue = new SerialTaskQueue();
      queue.enqueue('start');
      queue.enqueue('stop');
      queue.clear();
      expect(queue.pendingCount()).assertEqual(0);
      expect(queue.executedCount()).assertEqual(0);
      expect(queue.runNext()).assertEqual('');
    });

    it('parallel_start_requests_should_accept_only_one', 0, () => {
      const broker = new StartRequestBroker();
      const first = broker.request();
      expect(first.accepted).assertTrue();
      expect(first.queuePosition).assertEqual(1);
      const second = broker.request();
      expect(second.accepted).assertFalse();
      expect(second.reason).assertEqual('busy');
      expect(broker.getAccepted()).assertEqual(1);
      expect(broker.getRejected()).assertEqual(1);
      expect(broker.isBusy()).assertTrue();
    });

    it('start_should_be_possible_after_completion', 0, () => {
      const broker = new StartRequestBroker();
      broker.request();
      broker.complete();
      expect(broker.isBusy()).assertFalse();
      const second = broker.request();
      expect(second.accepted).assertTrue();
      expect(broker.getAccepted()).assertEqual(2);
      expect(broker.getLastReason()).assertEqual('accepted');
    });

    it('burst_of_start_requests_should_be_bounded', 0, () => {
      const broker = new StartRequestBroker();
      for (let round = 0; round < 50; round++) {
        broker.request();
      }
      expect(broker.getAccepted()).assertEqual(1);
      expect(broker.getRejected()).assertEqual(49);
      broker.reset();
      expect(broker.getAccepted()).assertEqual(0);
      expect(broker.getRejected()).assertEqual(0);
      expect(broker.isBusy()).assertFalse();
    });

    it('stop_should_win_over_late_state_callback', 0, () => {
      const race = new StopStateRaceModel();
      race.start();
      expect(race.getState()).assertEqual(RecordingState.RECORDING);
      expect(race.requestStop()).assertTrue();
      expect(race.getState()).assertEqual(RecordingState.STOPPED);
      expect(race.onStateCallback(RecordingState.RECORDING)).assertFalse();
      expect(race.getState()).assertEqual(RecordingState.STOPPED);
      expect(race.getStaleCallbacks()).assertEqual(1);
      expect(race.isTerminal()).assertTrue();
    });

    it('state_callback_should_be_applied_before_stop', 0, () => {
      const race = new StopStateRaceModel();
      race.start();
      expect(race.onStateCallback(RecordingState.RECORDING)).assertTrue();
      expect(race.getAppliedCallbacks()).assertEqual(1);
      expect(race.requestStop()).assertTrue();
      expect(race.historyCount()).assertEqual(2);
      expect(race.getStaleCallbacks()).assertEqual(0);
    });

    it('stop_without_recording_should_be_rejected', 0, () => {
      const race = new StopStateRaceModel();
      expect(race.requestStop()).assertFalse();
      expect(race.getState()).assertEqual(RecordingState.IDLE);
      expect(race.historyCount()).assertEqual(0);
      race.start();
      expect(race.requestStop()).assertTrue();
      expect(race.requestStop()).assertFalse();
    });

    it('reentrancy_guard_should_block_nested_calls', 0, () => {
      const guard = new ReentrancyGuard();
      expect(guard.run('normal')).assertTrue();
      expect(guard.getDepth()).assertEqual(0);
      expect(guard.getEntered()).assertEqual(1);
      expect(guard.run('nested')).assertTrue();
      expect(guard.getRejected()).assertEqual(1);
      expect(guard.getDepth()).assertEqual(0);
    });

    it('reentrancy_guard_should_reject_direct_reentry', 0, () => {
      const guard = new ReentrancyGuard();
      expect(guard.enter()).assertTrue();
      expect(guard.enter()).assertFalse();
      expect(guard.getDepth()).assertEqual(1);
      guard.leave();
      expect(guard.getDepth()).assertEqual(0);
      guard.leave();
      expect(guard.getDepth()).assertEqual(0);
    });

    it('serialized_scenario_should_stay_consistent', 0, () => {
      const queue = new SerialTaskQueue();
      const broker = new StartRequestBroker();
      const race = new StopStateRaceModel();
      queue.enqueue('request_start');
      queue.enqueue('request_start_duplicate');
      queue.enqueue('show_tip');
      queue.enqueue('request_stop');
      const executed = queue.runAll();
      expect(executed).assertEqual(4);
      queue.executedOrder().forEach((task: string) => {
        if (task === 'request_start') {
          broker.request();
          race.start();
        }
        if (task === 'request_stop') {
          race.requestStop();
        }
      });
      expect(broker.getAccepted()).assertEqual(1);
      expect(race.getState()).assertEqual(RecordingState.STOPPED);
      expect(queue.pendingCount()).assertEqual(0);
      expect(queue.isRunning()).assertFalse();
    });
  });
}
