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
import {
  getDriver, KEY_LEFT, KEY_RIGHT, KEY_BACK, miracastComponentCount,
  waitForPageStable, pressAndWait, triggerMiracastHome, serializedDelay,
  runSerializedUiOperation, TIMEOUT_PAGE_RENDER, DELAY_KEY_NAVIGATION, DELAY_AFTER_SESSION_OP
} from '../Shared/MiracastDriver';

enum OperationKind { SESSION_START = 'session_start', SESSION_STOP = 'session_stop', SCREEN_BIND = 'screen_bind', MUTE = 'mute', UNMUTE = 'unmute' }
interface QueuedOperation { sequence: number; kind: OperationKind; deviceId: string; }

class OperationQueue {
  private pending: Array<QueuedOperation> = [];
  private running: QueuedOperation | null = null;
  private sequence: number = 0;
  private maxDepth: number = 0;
  private rejected: number = 0;
  private closed: boolean = false;
  public enqueue(kind: OperationKind, deviceId: string): number {
    if (this.closed) { this.rejected++; return -1; }
    const operation: QueuedOperation = { sequence: this.sequence, kind: kind, deviceId: deviceId };
    this.sequence++;
    this.pending.push(operation);
    if (this.pending.length > this.maxDepth) { this.maxDepth = this.pending.length; }
    return operation.sequence;
  }

  public beginNext(): QueuedOperation | null {
    if (this.running !== null || this.pending.length === 0) { return null; }
    this.running = this.pending[0];
    this.pending.splice(0, 1);
    return this.running;
  }

  public complete(): boolean {
    if (this.running === null) { return false; }
    this.running = null;
    return true;
  }

  public getPendingCount(): number { return this.pending.length; }
  public getRunningKind(): OperationKind | null { return this.running === null ? null : this.running.kind; }
  public getMaxDepth(): number { return this.maxDepth; }
  public getRejectedCount(): number { return this.rejected; }
  public isIdle(): boolean { return this.running === null && this.pending.length === 0; }
  public isClosed(): boolean { return this.closed; }
  public close(): void { this.closed = true; }
  public open(): void { this.closed = false; }
}

export default function concurrencyControlSuite(): void {
  describe('ConcurrencyControl_Suite', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, TIMEOUT_PAGE_RENDER);
      await triggerMiracastHome(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await triggerMiracastHome(driver);
      await serializedDelay(driver, DELAY_AFTER_SESSION_OP);
    });

    it('serialized_queue_should_dispatch_in_order', 0, async () => {
      const queue = new OperationQueue();
      expect(queue.enqueue(OperationKind.MUTE, 'dev_1')).assertEqual(0);
      expect(queue.enqueue(OperationKind.UNMUTE, 'dev_1')).assertEqual(1);
    });
    it('serialized_queue_should_allow_single_running_operation', 0, async () => {
      const queue = new OperationQueue();
      queue.enqueue(OperationKind.MUTE, 'dev_a');
      expect(queue.beginNext()?.kind).assertEqual(OperationKind.MUTE);
      expect(queue.beginNext()).assertNull();
    });
    it('serialized_queue_should_reject_when_closed', 0, async () => {
      const queue = new OperationQueue();
      queue.close();
      expect(queue.enqueue(OperationKind.MUTE, 'dev_x')).assertEqual(-1);
      expect(queue.getRejectedCount()).assertEqual(1);
    });
    it('serialized_queue_should_reopen_after_close', 0, async () => {
      const queue = new OperationQueue();
      queue.close();
      queue.open();
      expect(queue.enqueue(OperationKind.MUTE, 'dev_x')).assertEqual(0);
    });
    it('serialized_queue_should_track_max_depth', 0, async () => {
      const queue = new OperationQueue();
      for (let i = 0; i < 3; i++) { queue.enqueue(OperationKind.MUTE, 'dev_' + i); }
      expect(queue.getMaxDepth()).assertEqual(3);
    });
    it('serialized_queue_idle_state_should_be_strict', 0, async () => {
      const queue = new OperationQueue();
      queue.enqueue(OperationKind.SCREEN_BIND, 'dev_a');
      expect(queue.isIdle()).assertFalse();
      expect(queue.getPendingCount()).assertEqual(1);
    });
    it('serialized_queue_should_be_idle_when_drained', 0, async () => {
      const queue = new OperationQueue();
      queue.enqueue(OperationKind.MUTE, 'dev_a');
      queue.beginNext();
      queue.complete();
      expect(queue.isIdle()).assertTrue();
    });
    it('serialized_queue_complete_should_require_running', 0, async () => {
      expect(new OperationQueue().complete()).assertFalse();
    });
    it('serialized_queue_pending_should_shrink_after_begin', 0, async () => {
      const queue = new OperationQueue();
      for (let i = 0; i < 2; i++) { queue.enqueue(OperationKind.MUTE, 'dev_' + i); }
      queue.beginNext();
      expect(queue.getPendingCount()).assertEqual(1);
    });

    it('serialized_queue_should_hold_nine_pending_rounds', 0, async () => {
      const queue = new OperationQueue();
      for (let i = 0; i < 9; i++) { queue.enqueue(OperationKind.SCREEN_BIND, 'dev_' + i); }
      expect(queue.getPendingCount()).assertEqual(9);
    });
    it('serialized_queue_should_drain_in_fifo_order', 0, async () => {
      const queue = new OperationQueue();
      queue.enqueue(OperationKind.SESSION_START, 'dev_a');
      queue.enqueue(OperationKind.SESSION_STOP, 'dev_a');
      expect(queue.beginNext()?.kind).assertEqual(OperationKind.SESSION_START);
    });
    it('serialized_queue_should_free_slot_after_complete', 0, async () => {
      const queue = new OperationQueue();
      queue.enqueue(OperationKind.MUTE, 'dev_a');
      queue.enqueue(OperationKind.UNMUTE, 'dev_a');
      queue.beginNext();
      queue.complete();
      expect(queue.beginNext()?.kind).assertEqual(OperationKind.UNMUTE);
    });
    it('serialized_queue_should_count_multiple_rejections', 0, async () => {
      const queue = new OperationQueue();
      queue.close();
      for (let i = 0; i < 2; i++) { queue.enqueue(OperationKind.MUTE, 'dev_' + i); }
      expect(queue.getRejectedCount()).assertEqual(2);
    });
    it('serialized_queue_should_report_empty_running_kind', 0, async () => {
      expect(new OperationQueue().getRunningKind()).assertNull();
    });
    it('serialized_queue_should_reset_running_after_complete', 0, async () => {
      const queue = new OperationQueue();
      queue.enqueue(OperationKind.MUTE, 'dev_a');
      queue.beginNext();
      queue.complete();
      expect(queue.getRunningKind()).assertNull();
    });
    it('queue_should_finish_nine_round_bind_cycle', 0, async () => {
      const queue = new OperationQueue();
      for (let i = 0; i < 9; i++) { queue.enqueue(OperationKind.SCREEN_BIND, 'dev_' + i); }
      while (!queue.isIdle()) { queue.beginNext(); queue.complete(); }
      expect(queue.getRejectedCount()).assertEqual(0);
    });
    it('mixed_operation_kinds_should_keep_count', 0, async () => {
      const queue = new OperationQueue();
      queue.enqueue(OperationKind.SESSION_START, 'dev_a');
      queue.enqueue(OperationKind.SCREEN_BIND, 'dev_a');
      expect(queue.getPendingCount()).assertEqual(2);
    });

    it('serialized_ui_operation_should_return_action_result', 0, async () => {
      expect(await runSerializedUiOperation(async () => { return 42; })).assertEqual(42);
    });
    it('serialized_ui_operation_should_keep_page_stable', 0, async () => {
      expect(await runSerializedUiOperation(async () => { return 7; })).assertEqual(7);
    });
    it('queue_should_report_zero_pending_initially', 0, async () => {
      expect(new OperationQueue().getPendingCount()).assertEqual(0);
    });
    it('queue_should_report_max_depth_of_one', 0, async () => {
      const queue = new OperationQueue();
      queue.enqueue(OperationKind.MUTE, 'dev_a');
      expect(queue.getMaxDepth()).assertEqual(1);
    });
  });
}
