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

const DIALOG_OPENING: string = 'opening';

const DIALOG_OPEN: string = 'open';

const DIALOG_CLOSING: string = 'closing';

const DIALOG_CLOSED: string = 'closed';

const MAX_DIALOGS: number = 4;

const MODAL_PRIORITY: number = 100;

interface DialogEntry {
  id: string;
  priority: number;
  state: string;
  createdAt: number;
}

// Manages stacked dialogs with z-order by priority
class DialogStateManager {
  private dialogs: Map<string, DialogEntry> = new Map<string, DialogEntry>();
  private readonly capacity: number;

  constructor(capacity: number) {
    this.capacity = capacity;
  }

  public open(id: string, priority: number, now: number): boolean {
    if (id.length === 0 || this.dialogs.has(id)) {
      return false;
    }
    if (this.dialogs.size >= this.capacity) {
      return false;
    }
    this.dialogs.set(id, {
      id: id,
      priority: priority,
      state: DIALOG_OPEN,
      createdAt: now
    });
    return true;
  }

  public close(id: string): boolean {
    const entry = this.dialogs.get(id);
    if (entry === undefined || entry.state === DIALOG_CLOSED) {
      return false;
    }
    entry.state = DIALOG_CLOSED;
    return true;
  }

  public removeClosed(): number {
    const remove: string[] = [];
    this.dialogs.forEach((entry: DialogEntry, id: string) => {
      if (entry.state === DIALOG_CLOSED) {
        remove.push(id);
      }
    });
    for (let i = 0; i < remove.length; i++) {
      this.dialogs.delete(remove[i]);
    }
    return remove.length;
  }

  public stateOf(id: string): string {
    const entry = this.dialogs.get(id);
    return entry === undefined ? '' : entry.state;
  }

  public isOpen(id: string): boolean {
    return this.stateOf(id) === DIALOG_OPEN;
  }

  public size(): number {
    return this.dialogs.size;
  }

  public openCount(): number {
    let count: number = 0;
    this.dialogs.forEach((entry: DialogEntry) => {
      if (entry.state === DIALOG_OPEN) {
        count++;
      }
    });
    return count;
  }

  public top(): DialogEntry | undefined {
    let top: DialogEntry | undefined = undefined;
    this.dialogs.forEach((entry: DialogEntry) => {
      if (entry.state !== DIALOG_OPEN) {
        return;
      }
      if (top === undefined || entry.priority > top.priority ||
        (entry.priority === top.priority && entry.createdAt > top.createdAt)) {
        top = entry;
      }
    });
    return top;
  }

  public topId(): string {
    const entry = this.top();
    return entry === undefined ? '' : entry.id;
  }

  public idsByPriority(): string[] {
    const entries: DialogEntry[] = [];
    this.dialogs.forEach((entry: DialogEntry) => {
      if (entry.state === DIALOG_OPEN) {
        entries.push(entry);
      }
    });
    entries.sort((left: DialogEntry, right: DialogEntry) => right.priority - left.priority);
    return entries.map((entry: DialogEntry) => entry.id);
  }

  public hasModal(): boolean {
    let modal: boolean = false;
    this.dialogs.forEach((entry: DialogEntry) => {
      if (entry.state === DIALOG_OPEN && entry.priority >= MODAL_PRIORITY) {
        modal = true;
      }
    });
    return modal;
  }

  public clear(): void {
    this.dialogs = new Map<string, DialogEntry>();
  }
}

// Queues dialogs while another modal is active
class DialogQueue {
  private queue: string[] = [];
  private readonly capacity: number;

  constructor(capacity: number) {
    this.capacity = capacity;
  }

  public enqueue(id: string): boolean {
    if (id.length === 0 || this.queue.includes(id) || this.queue.length >= this.capacity) {
      return false;
    }
    this.queue.push(id);
    return true;
  }

  public dequeue(): string {
    if (this.queue.length === 0) {
      return '';
    }
    const id = this.queue.shift();
    return id === undefined ? '' : id;
  }

  public remove(id: string): boolean {
    const index = this.queue.indexOf(id);
    if (index < 0) {
      return false;
    }
    this.queue.splice(index, 1);
    return true;
  }

  public size(): number {
    return this.queue.length;
  }

  public contains(id: string): boolean {
    return this.queue.includes(id);
  }

  public pending(): string[] {
    return [...this.queue];
  }

  public clear(): void {
    this.queue = [];
  }
}

// Validates allowed dialog state transitions
class DialogTransition {
  public static readonly ALLOWED: string[][] = [
    [DIALOG_CLOSED, DIALOG_OPENING],
    [DIALOG_OPENING, DIALOG_OPEN],
    [DIALOG_OPEN, DIALOG_CLOSING],
    [DIALOG_CLOSING, DIALOG_CLOSED]
  ];

  public static canTransition(from: string, to: string): boolean {
    for (let i = 0; i < DialogTransition.ALLOWED.length; i++) {
      if (DialogTransition.ALLOWED[i][0] === from && DialogTransition.ALLOWED[i][1] === to) {
        return true;
      }
    }
    return false;
  }

  public static isTerminal(state: string): boolean {
    return state === DIALOG_CLOSED;
  }

  public static nextOf(state: string): string {
    for (let i = 0; i < DialogTransition.ALLOWED.length; i++) {
      if (DialogTransition.ALLOWED[i][0] === state) {
        return DialogTransition.ALLOWED[i][1];
      }
    }
    return '';
  }
}

// Counts lifecycle events for diagnostics
class DialogStateReport {
  private opened: number = 0;
  private closed: number = 0;
  private rejected: number = 0;

  public recordOpen(success: boolean): void {
    if (success) {
      this.opened++;
    } else {
      this.rejected++;
    }
  }

  public recordClose(success: boolean): void {
    if (success) {
      this.closed++;
    } else {
      this.rejected++;
    }
  }

  public getOpened(): number {
    return this.opened;
  }

  public getClosed(): number {
    return this.closed;
  }

  public getRejected(): number {
    return this.rejected;
  }

  public getActive(): number {
    const active = this.opened - this.closed;
    return active < 0 ? 0 : active;
  }

  public summary(): string {
    return `opened=${this.opened},closed=${this.closed},rejected=${this.rejected}`;
  }

  public reset(): void {
    this.opened = 0;
    this.closed = 0;
    this.rejected = 0;
  }
}

export default function dialogStateManagerValidationTest() {
  describe('DialogStateManagerValidation_Test', () => {

    it('manager_should_open_and_close', 0, () => {
      const manager = new DialogStateManager(MAX_DIALOGS);
      expect(manager.open('dialog-1', 10, 100)).assertTrue();
      expect(manager.isOpen('dialog-1')).assertTrue();
      expect(manager.size()).assertEqual(1);
      expect(manager.openCount()).assertEqual(1);
      expect(manager.close('dialog-1')).assertTrue();
      expect(manager.stateOf('dialog-1')).assertEqual(DIALOG_CLOSED);
      expect(manager.close('dialog-1')).assertFalse();
    });

    it('manager_should_reject_duplicate_and_empty_ids', 0, () => {
      const manager = new DialogStateManager(MAX_DIALOGS);
      expect(manager.open('dialog-1', 10, 100)).assertTrue();
      expect(manager.open('dialog-1', 20, 200)).assertFalse();
      expect(manager.open('', 10, 100)).assertFalse();
      expect(manager.size()).assertEqual(1);
      expect(manager.stateOf('missing')).assertEqual('');
      expect(manager.isOpen('missing')).assertFalse();
    });

    it('manager_should_enforce_capacity', 0, () => {
      const manager = new DialogStateManager(2);
      expect(manager.open('a', 1, 0)).assertTrue();
      expect(manager.open('b', 2, 0)).assertTrue();
      expect(manager.open('c', 3, 0)).assertFalse();
      expect(manager.size()).assertEqual(2);
      manager.close('a');
      expect(manager.removeClosed()).assertEqual(1);
      expect(manager.size()).assertEqual(1);
      expect(manager.open('c', 3, 0)).assertTrue();
    });

    it('manager_should_return_highest_priority_top', 0, () => {
      const manager = new DialogStateManager(MAX_DIALOGS);
      manager.open('low', 10, 100);
      manager.open('high', 50, 200);
      manager.open('mid', 30, 300);
      expect(manager.topId()).assertEqual('high');
      expect(manager.idsByPriority()).assertDeepEquals(['high', 'mid', 'low']);
      manager.close('high');
      expect(manager.topId()).assertEqual('mid');
    });

    it('manager_should_break_priority_ties_by_time', 0, () => {
      const manager = new DialogStateManager(MAX_DIALOGS);
      manager.open('first', 10, 100);
      manager.open('second', 10, 200);
      expect(manager.topId()).assertEqual('second');
      manager.open('third', 10, 150);
      expect(manager.topId()).assertEqual('second');
    });

    it('manager_should_detect_modal_dialogs', 0, () => {
      const manager = new DialogStateManager(MAX_DIALOGS);
      manager.open('toast', 10, 0);
      expect(manager.hasModal()).assertFalse();
      manager.open('confirm', MODAL_PRIORITY, 1);
      expect(manager.hasModal()).assertTrue();
      manager.close('confirm');
      expect(manager.hasModal()).assertFalse();
    });

    it('manager_should_handle_empty_state', 0, () => {
      const manager = new DialogStateManager(MAX_DIALOGS);
      expect(manager.size()).assertEqual(0);
      expect(manager.openCount()).assertEqual(0);
      expect(manager.top() === undefined).assertTrue();
      expect(manager.topId()).assertEqual('');
      expect(manager.idsByPriority().length).assertEqual(0);
      expect(manager.removeClosed()).assertEqual(0);
      manager.clear();
      expect(manager.size()).assertEqual(0);
    });

    it('queue_should_enqueue_unique_dialogs', 0, () => {
      const queue = new DialogQueue(2);
      expect(queue.enqueue('a')).assertTrue();
      expect(queue.enqueue('a')).assertFalse();
      expect(queue.enqueue('')).assertFalse();
      expect(queue.enqueue('b')).assertTrue();
      expect(queue.enqueue('c')).assertFalse();
      expect(queue.size()).assertEqual(2);
      expect(queue.contains('a')).assertTrue();
      expect(queue.pending()).assertDeepEquals(['a', 'b']);
    });

    it('queue_should_dequeue_in_order', 0, () => {
      const queue = new DialogQueue(5);
      queue.enqueue('a');
      queue.enqueue('b');
      expect(queue.dequeue()).assertEqual('a');
      expect(queue.dequeue()).assertEqual('b');
      expect(queue.dequeue()).assertEqual('');
      expect(queue.size()).assertEqual(0);
      expect(queue.pending().length).assertEqual(0);
    });

    it('queue_should_remove_and_clear', 0, () => {
      const queue = new DialogQueue(5);
      queue.enqueue('a');
      queue.enqueue('b');
      expect(queue.remove('a')).assertTrue();
      expect(queue.remove('a')).assertFalse();
      expect(queue.pending()).assertDeepEquals(['b']);
      queue.clear();
      expect(queue.size()).assertEqual(0);
      expect(queue.contains('b')).assertFalse();
    });

    it('transition_should_follow_lifecycle', 0, () => {
      expect(DialogTransition.canTransition(DIALOG_CLOSED, DIALOG_OPENING)).assertTrue();
      expect(DialogTransition.canTransition(DIALOG_OPENING, DIALOG_OPEN)).assertTrue();
      expect(DialogTransition.canTransition(DIALOG_OPEN, DIALOG_CLOSING)).assertTrue();
      expect(DialogTransition.canTransition(DIALOG_CLOSING, DIALOG_CLOSED)).assertTrue();
      expect(DialogTransition.canTransition(DIALOG_OPEN, DIALOG_OPENING)).assertFalse();
      expect(DialogTransition.isTerminal(DIALOG_CLOSED)).assertTrue();
      expect(DialogTransition.isTerminal(DIALOG_OPEN)).assertFalse();
    });

    it('transition_should_return_next_state', 0, () => {
      expect(DialogTransition.nextOf(DIALOG_CLOSED)).assertEqual(DIALOG_OPENING);
      expect(DialogTransition.nextOf(DIALOG_OPENING)).assertEqual(DIALOG_OPEN);
      expect(DialogTransition.nextOf(DIALOG_OPEN)).assertEqual(DIALOG_CLOSING);
      expect(DialogTransition.nextOf(DIALOG_CLOSING)).assertEqual(DIALOG_CLOSED);
      expect(DialogTransition.nextOf('unknown')).assertEqual('');
      expect(DialogTransition.ALLOWED.length).assertEqual(4);
    });

    it('report_should_track_dialog_lifecycle', 0, () => {
      const report = new DialogStateReport();
      report.recordOpen(true);
      report.recordOpen(true);
      report.recordOpen(false);
      report.recordClose(true);
      expect(report.getOpened()).assertEqual(2);
      expect(report.getClosed()).assertEqual(1);
      expect(report.getRejected()).assertEqual(1);
      expect(report.getActive()).assertEqual(1);
      expect(report.summary()).assertEqual('opened=2,closed=1,rejected=1');
      report.reset();
      expect(report.getOpened()).assertEqual(0);
      expect(report.getActive()).assertEqual(0);
    });

    it('dialog_flow_should_queue_while_modal_open', 0, () => {
      const manager = new DialogStateManager(MAX_DIALOGS);
      const queue = new DialogQueue(5);
      const report = new DialogStateReport();
      const opened = manager.open('confirm', MODAL_PRIORITY, 0);
      report.recordOpen(opened);
      expect(manager.hasModal()).assertTrue();
      const queued = queue.enqueue('toast');
      expect(queued).assertTrue();
      expect(manager.isOpen('toast')).assertFalse();
      manager.close('confirm');
      report.recordClose(true);
      const next = queue.dequeue();
      expect(next).assertEqual('toast');
      expect(manager.open(next, 10, 1)).assertTrue();
      report.recordOpen(true);
      expect(manager.isOpen('toast')).assertTrue();
      expect(report.getActive()).assertEqual(1);
    });

    it('dialog_flow_should_preserve_z_order', 0, () => {
      const manager = new DialogStateManager(MAX_DIALOGS);
      manager.open('a', 10, 100);
      manager.open('b', 20, 200);
      manager.open('c', 30, 300);
      expect(manager.idsByPriority()).assertDeepEquals(['c', 'b', 'a']);
      manager.close('b');
      expect(manager.idsByPriority()).assertDeepEquals(['c', 'a']);
      expect(manager.topId()).assertEqual('c');
      expect(manager.openCount()).assertEqual(2);
    });

    it('manager_should_remove_all_closed', 0, () => {
      const manager = new DialogStateManager(MAX_DIALOGS);
      manager.open('a', 1, 0);
      manager.open('b', 2, 0);
      manager.open('c', 3, 0);
      manager.close('a');
      manager.close('c');
      expect(manager.removeClosed()).assertEqual(2);
      expect(manager.size()).assertEqual(1);
      expect(manager.isOpen('b')).assertTrue();
      expect(manager.openCount()).assertEqual(1);
    });

    it('dialog_constants_should_be_stable', 0, () => {
      expect(DIALOG_OPENING).assertEqual('opening');
      expect(DIALOG_OPEN).assertEqual('open');
      expect(DIALOG_CLOSING).assertEqual('closing');
      expect(DIALOG_CLOSED).assertEqual('closed');
      expect(MAX_DIALOGS).assertEqual(4);
      expect(MODAL_PRIORITY).assertEqual(100);
    });
  });
}
