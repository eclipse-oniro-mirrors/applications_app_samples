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

const STATE_CLOSED: string = 'closed';

const STATE_OPENING: string = 'opening';

const STATE_OPEN: string = 'open';

const STATE_CLOSING: string = 'closing';

const MAX_STACK: number = 5;

const ANIMATION_MS: number = 200;

interface DialogInstance {
  id: string;
  state: string;
  openedAt: number;
  openCount: number;
}

// Tracks a single dialog through its lifecycle
class DialogLifecycleManager {
  private dialogs: Map<string, DialogInstance> = new Map<string, DialogInstance>();
  private readonly capacity: number;

  constructor(capacity: number) {
    this.capacity = capacity;
  }

  public open(id: string, now: number): boolean {
    if (id.length === 0 || this.dialogs.size >= this.capacity) {
      return false;
    }
    const existing = this.dialogs.get(id);
    if (existing !== undefined) {
      if (existing.state === STATE_CLOSED) {
        existing.state = STATE_OPENING;
        existing.openedAt = now;
        existing.openCount++;
        return true;
      }
      return false;
    }
    this.dialogs.set(id, {
      id: id,
      state: STATE_OPENING,
      openedAt: now,
      openCount: 1
    });
    return true;
  }

  public show(id: string): boolean {
    const dialog = this.dialogs.get(id);
    if (dialog === undefined || dialog.state !== STATE_OPENING) {
      return false;
    }
    dialog.state = STATE_OPEN;
    return true;
  }

  public beginClose(id: string): boolean {
    const dialog = this.dialogs.get(id);
    if (dialog === undefined || dialog.state !== STATE_OPEN) {
      return false;
    }
    dialog.state = STATE_CLOSING;
    return true;
  }

  public finishClose(id: string): boolean {
    const dialog = this.dialogs.get(id);
    if (dialog === undefined || dialog.state !== STATE_CLOSING) {
      return false;
    }
    dialog.state = STATE_CLOSED;
    return true;
  }

  public stateOf(id: string): string {
    const dialog = this.dialogs.get(id);
    return dialog === undefined ? '' : dialog.state;
  }

  public isVisible(id: string): boolean {
    const state = this.stateOf(id);
    return state === STATE_OPENING || state === STATE_OPEN ||
      state === STATE_CLOSING;
  }

  public isOpen(id: string): boolean {
    return this.stateOf(id) === STATE_OPEN;
  }

  public openCountOf(id: string): number {
    const dialog = this.dialogs.get(id);
    return dialog === undefined ? 0 : dialog.openCount;
  }

  public openedAt(id: string): number {
    const dialog = this.dialogs.get(id);
    return dialog === undefined ? 0 : dialog.openedAt;
  }

  public visibleCount(): number {
    let count: number = 0;
    this.dialogs.forEach((dialog: DialogInstance) => {
      if (dialog.state === STATE_OPENING || dialog.state === STATE_OPEN ||
        dialog.state === STATE_CLOSING) {
        count++;
      }
    });
    return count;
  }

  public removeClosed(): number {
    const remove: string[] = [];
    this.dialogs.forEach((dialog: DialogInstance, id: string) => {
      if (dialog.state === STATE_CLOSED) {
        remove.push(id);
      }
    });
    for (let i = 0; i < remove.length; i++) {
      this.dialogs.delete(remove[i]);
    }
    return remove.length;
  }

  public size(): number {
    return this.dialogs.size;
  }

  public clear(): void {
    this.dialogs = new Map<string, DialogInstance>();
  }
}

// Maintains an ordered back stack of dialogs
class DialogBackStack {
  private stack: string[] = [];
  private readonly limit: number;

  constructor(limit: number) {
    this.limit = limit;
  }

  public push(id: string): boolean {
    if (id.length === 0 || this.stack.includes(id) || this.stack.length >= this.limit) {
      return false;
    }
    this.stack.push(id);
    return true;
  }

  public pop(): string {
    if (this.stack.length === 0) {
      return '';
    }
    const id = this.stack.pop();
    return id === undefined ? '' : id;
  }

  public peek(): string {
    return this.stack.length === 0 ? '' : this.stack[this.stack.length - 1];
  }

  public remove(id: string): boolean {
    const index = this.stack.indexOf(id);
    if (index < 0) {
      return false;
    }
    this.stack.splice(index, 1);
    return true;
  }

  public size(): number {
    return this.stack.length;
  }

  public contains(id: string): boolean {
    return this.stack.includes(id);
  }

  public snapshot(): string[] {
    return [...this.stack];
  }

  public clear(): void {
    this.stack = [];
  }
}

// Counts lifecycle callbacks for assertions
class DialogCallbackCounter {
  private opened: number = 0;
  private shown: number = 0;
  private closed: number = 0;
  private cancelled: number = 0;

  public onOpened(): void {
    this.opened++;
  }

  public onShown(): void {
    this.shown++;
  }

  public onClosed(): void {
    this.closed++;
  }

  public onCancelled(): void {
    this.cancelled++;
  }

  public getOpened(): number {
    return this.opened;
  }

  public getShown(): number {
    return this.shown;
  }

  public getClosed(): number {
    return this.closed;
  }

  public getCancelled(): number {
    return this.cancelled;
  }

  public total(): number {
    return this.opened + this.shown + this.closed + this.cancelled;
  }

  public reset(): void {
    this.opened = 0;
    this.shown = 0;
    this.closed = 0;
    this.cancelled = 0;
  }
}

export default function dialogLifecycleTest() {
  describe('DialogLifecycle_Test', () => {

    it('manager_should_open_dialog', 0, () => {
      const manager = new DialogLifecycleManager(MAX_STACK);
      expect(manager.open('dialog-1', 100)).assertTrue();
      expect(manager.stateOf('dialog-1')).assertEqual(STATE_OPENING);
      expect(manager.isVisible('dialog-1')).assertTrue();
      expect(manager.isOpen('dialog-1')).assertFalse();
      expect(manager.openedAt('dialog-1')).assertEqual(100);
      expect(manager.openCountOf('dialog-1')).assertEqual(1);
    });

    it('manager_should_complete_open_transition', 0, () => {
      const manager = new DialogLifecycleManager(MAX_STACK);
      manager.open('dialog-1', 100);
      expect(manager.show('dialog-1')).assertTrue();
      expect(manager.isOpen('dialog-1')).assertTrue();
      expect(manager.visibleCount()).assertEqual(1);
      expect(manager.show('dialog-1')).assertFalse();
      expect(manager.show('missing')).assertFalse();
    });

    it('manager_should_close_in_two_steps', 0, () => {
      const manager = new DialogLifecycleManager(MAX_STACK);
      manager.open('dialog-1', 100);
      manager.show('dialog-1');
      expect(manager.beginClose('dialog-1')).assertTrue();
      expect(manager.stateOf('dialog-1')).assertEqual(STATE_CLOSING);
      expect(manager.isVisible('dialog-1')).assertTrue();
      expect(manager.finishClose('dialog-1')).assertTrue();
      expect(manager.stateOf('dialog-1')).assertEqual(STATE_CLOSED);
      expect(manager.isVisible('dialog-1')).assertFalse();
    });

    it('manager_should_reject_invalid_transitions', 0, () => {
      const manager = new DialogLifecycleManager(MAX_STACK);
      expect(manager.beginClose('missing')).assertFalse();
      expect(manager.finishClose('missing')).assertFalse();
      manager.open('dialog-1', 0);
      expect(manager.beginClose('dialog-1')).assertFalse();
      expect(manager.finishClose('dialog-1')).assertFalse();
      expect(manager.show('dialog-1')).assertTrue();
      expect(manager.finishClose('dialog-1')).assertFalse();
    });

    it('manager_should_reopen_closed_dialog', 0, () => {
      const manager = new DialogLifecycleManager(MAX_STACK);
      manager.open('dialog-1', 100);
      manager.show('dialog-1');
      manager.beginClose('dialog-1');
      manager.finishClose('dialog-1');
      expect(manager.open('dialog-1', 500)).assertTrue();
      expect(manager.stateOf('dialog-1')).assertEqual(STATE_OPENING);
      expect(manager.openedAt('dialog-1')).assertEqual(500);
      expect(manager.openCountOf('dialog-1')).assertEqual(2);
    });

    it('manager_should_reject_duplicate_open', 0, () => {
      const manager = new DialogLifecycleManager(MAX_STACK);
      manager.open('dialog-1', 0);
      expect(manager.open('dialog-1', 100)).assertFalse();
      expect(manager.open('', 100)).assertFalse();
      expect(manager.size()).assertEqual(1);
    });

    it('manager_should_enforce_capacity', 0, () => {
      const manager = new DialogLifecycleManager(2);
      expect(manager.open('a', 0)).assertTrue();
      expect(manager.open('b', 0)).assertTrue();
      expect(manager.open('c', 0)).assertFalse();
      manager.show('a');
      manager.beginClose('a');
      manager.finishClose('a');
      expect(manager.removeClosed()).assertEqual(1);
      expect(manager.open('c', 0)).assertTrue();
      expect(manager.size()).assertEqual(2);
    });

    it('manager_should_count_visible_dialogs', 0, () => {
      const manager = new DialogLifecycleManager(MAX_STACK);
      manager.open('a', 0);
      manager.open('b', 0);
      manager.show('a');
      expect(manager.visibleCount()).assertEqual(2);
      manager.beginClose('a');
      expect(manager.visibleCount()).assertEqual(2);
      manager.finishClose('a');
      expect(manager.visibleCount()).assertEqual(1);
      expect(manager.size()).assertEqual(2);
      manager.clear();
      expect(manager.size()).assertEqual(0);
    });

    it('back_stack_should_push_and_pop', 0, () => {
      const stack = new DialogBackStack(MAX_STACK);
      expect(stack.push('a')).assertTrue();
      expect(stack.push('b')).assertTrue();
      expect(stack.push('a')).assertFalse();
      expect(stack.push('')).assertFalse();
      expect(stack.size()).assertEqual(2);
      expect(stack.peek()).assertEqual('b');
      expect(stack.pop()).assertEqual('b');
      expect(stack.peek()).assertEqual('a');
      expect(stack.contains('a')).assertTrue();
      expect(stack.snapshot()).assertDeepEquals(['a']);
    });

    it('back_stack_should_remove_and_limit', 0, () => {
      const stack = new DialogBackStack(2);
      stack.push('a');
      stack.push('b');
      expect(stack.push('c')).assertFalse();
      expect(stack.remove('a')).assertTrue();
      expect(stack.remove('a')).assertFalse();
      expect(stack.push('c')).assertTrue();
      expect(stack.size()).assertEqual(2);
      stack.clear();
      expect(stack.size()).assertEqual(0);
      expect(stack.peek()).assertEqual('');
      expect(stack.pop()).assertEqual('');
    });

    it('callbacks_should_track_lifecycle', 0, () => {
      const callbacks = new DialogCallbackCounter();
      callbacks.onOpened();
      callbacks.onShown();
      callbacks.onClosed();
      callbacks.onCancelled();
      expect(callbacks.getOpened()).assertEqual(1);
      expect(callbacks.getShown()).assertEqual(1);
      expect(callbacks.getClosed()).assertEqual(1);
      expect(callbacks.getCancelled()).assertEqual(1);
      expect(callbacks.total()).assertEqual(4);
      callbacks.reset();
      expect(callbacks.total()).assertEqual(0);
    });

    it('lifecycle_flow_should_open_show_close', 0, () => {
      const manager = new DialogLifecycleManager(MAX_STACK);
      const stack = new DialogBackStack(MAX_STACK);
      const callbacks = new DialogCallbackCounter();
      if (manager.open('confirm', 100)) {
        callbacks.onOpened();
        stack.push('confirm');
      }
      if (manager.show('confirm')) {
        callbacks.onShown();
      }
      expect(manager.isOpen('confirm')).assertTrue();
      expect(stack.peek()).assertEqual('confirm');
      if (manager.beginClose('confirm')) {
        callbacks.onCancelled();
      }
      manager.finishClose('confirm');
      stack.pop();
      callbacks.onClosed();
      expect(manager.stateOf('confirm')).assertEqual(STATE_CLOSED);
      expect(stack.size()).assertEqual(0);
      expect(callbacks.total()).assertEqual(4);
    });

    it('dialog_constants_should_be_stable', 0, () => {
      expect(STATE_CLOSED).assertEqual('closed');
      expect(STATE_OPENING).assertEqual('opening');
      expect(STATE_OPEN).assertEqual('open');
      expect(STATE_CLOSING).assertEqual('closing');
      expect(MAX_STACK).assertEqual(5);
      expect(ANIMATION_MS).assertEqual(200);
    });
  });
}

