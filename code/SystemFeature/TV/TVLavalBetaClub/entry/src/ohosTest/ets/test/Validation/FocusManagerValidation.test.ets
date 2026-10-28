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

const DIRECTION_NEXT: string = 'next';

const DIRECTION_PREVIOUS: string = 'previous';

const FOCUS_NONE: number = -1;

const MAX_SCOPE_DEPTH: number = 8;

const MAX_HISTORY: number = 20;

interface FocusNode {
  id: string;
  focusable: boolean;
  enabled: boolean;
  group: string;
}

// Manages a flat list of focusable components
class FocusManager {
  private nodes: FocusNode[] = [];
  private current: number = FOCUS_NONE;

  public add(node: FocusNode): boolean {
    if (node.id.length === 0 || this.indexOf(node.id) >= 0) {
      return false;
    }
    this.nodes.push({
      id: node.id,
      focusable: node.focusable,
      enabled: node.enabled,
      group: node.group
    });
    return true;
  }

  public remove(id: string): boolean {
    const index = this.indexOf(id);
    if (index < 0) {
      return false;
    }
    this.nodes.splice(index, 1);
    if (this.current >= this.nodes.length) {
      this.current = this.nodes.length - 1;
    }
    return true;
  }

  public indexOf(id: string): number {
    for (let i = 0; i < this.nodes.length; i++) {
      if (this.nodes[i].id === id) {
        return i;
      }
    }
    return FOCUS_NONE;
  }

  public focus(id: string): boolean {
    const index = this.indexOf(id);
    if (index < 0 || !this.isFocusableAt(index)) {
      return false;
    }
    this.current = index;
    return true;
  }

  public move(direction: string): string {
    if (this.nodes.length === 0) {
      return '';
    }
    const step = direction === DIRECTION_PREVIOUS ? -1 : 1;
    let index = this.current === FOCUS_NONE ? (step > 0 ? -1 : 0) : this.current;
    for (let i = 0; i < this.nodes.length; i++) {
      index = (index + step + this.nodes.length) % this.nodes.length;
      if (this.isFocusableAt(index)) {
        this.current = index;
        return this.nodes[index].id;
      }
    }
    return '';
  }

  public moveNext(): string {
    return this.move(DIRECTION_NEXT);
  }

  public movePrevious(): string {
    return this.move(DIRECTION_PREVIOUS);
  }

  public currentId(): string {
    return this.current < 0 || this.current >= this.nodes.length ?
      '' : this.nodes[this.current].id;
  }

  public currentIndex(): number {
    return this.current;
  }

  public size(): number {
    return this.nodes.length;
  }

  public focusableCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.nodes.length; i++) {
      if (this.isFocusableAt(i)) {
        count++;
      }
    }
    return count;
  }

  private isFocusableAt(index: number): boolean {
    return index >= 0 && index < this.nodes.length &&
      this.nodes[index].focusable && this.nodes[index].enabled;
  }

  public clearFocus(): void {
    this.current = FOCUS_NONE;
  }

  public groupOf(id: string): string {
    const index = this.indexOf(id);
    return index < 0 ? '' : this.nodes[index].group;
  }

  public idsInGroup(group: string): string[] {
    const result: string[] = [];
    for (let i = 0; i < this.nodes.length; i++) {
      if (this.nodes[i].group === group && this.isFocusableAt(i)) {
        result.push(this.nodes[i].id);
      }
    }
    return result;
  }

  public reset(): void {
    this.nodes = [];
    this.current = FOCUS_NONE;
  }
}

// Remembers focus per scope and restores it when re-entering
class FocusScope {
  private scopeId: string;
  private savedId: string = '';
  private readonly maxDepth: number;

  constructor(scopeId: string, maxDepth: number) {
    this.scopeId = scopeId;
    this.maxDepth = maxDepth;
  }

  public getScopeId(): string {
    return this.scopeId;
  }

  public save(id: string): boolean {
    if (id.length === 0) {
      return false;
    }
    this.savedId = id;
    return true;
  }

  public restore(): string {
    return this.savedId;
  }

  public hasSaved(): boolean {
    return this.savedId.length > 0;
  }

  public clear(): void {
    this.savedId = '';
  }

  public canNest(depth: number): boolean {
    return depth > 0 && depth <= this.maxDepth;
  }
}

// Tracks focus movement history for undo and diagnostics
class FocusHistory {
  private entries: string[] = [];
  private readonly capacity: number;

  constructor(capacity: number) {
    this.capacity = capacity;
  }

  public record(id: string): boolean {
    if (id.length === 0 || this.capacity <= 0) {
      return false;
    }
    if (this.entries.length >= this.capacity) {
      this.entries.shift();
    }
    this.entries.push(id);
    return true;
  }

  public previous(): string {
    if (this.entries.length < 2) {
      return '';
    }
    return this.entries[this.entries.length - 2];
  }

  public latest(): string {
    return this.entries.length === 0 ? '' : this.entries[this.entries.length - 1];
  }

  public countOf(id: string): number {
    return this.entries.filter((entry: string) => entry === id).length;
  }

  public count(): number {
    return this.entries.length;
  }

  public clear(): void {
    this.entries = [];
  }
}

// Prevents focus from escaping a modal scope
class FocusTrap {
  private scopeIds: string[] = [];
  private active: boolean = false;

  public activate(ids: string[]): boolean {
    if (ids.length === 0) {
      return false;
    }
    this.scopeIds = [...ids];
    this.active = true;
    return true;
  }

  public deactivate(): void {
    this.active = false;
    this.scopeIds = [];
  }

  public isActive(): boolean {
    return this.active;
  }

  public allows(id: string): boolean {
    return !this.active || this.scopeIds.includes(id);
  }

  public scopeSize(): number {
    return this.scopeIds.length;
  }

  public wrap(index: number): number {
    if (this.scopeIds.length === 0) {
      return FOCUS_NONE;
    }
    return (index + this.scopeIds.length) % this.scopeIds.length;
  }
}

export default function focusManagerValidationTest() {
  describe('FocusManagerValidation_Test', () => {

    it('manager_should_add_and_remove_nodes', 0, () => {
      const manager = new FocusManager();
      expect(manager.add({ id: 'a', focusable: true, enabled: true, group: 'main' })).assertTrue();
      expect(manager.add({ id: 'a', focusable: true, enabled: true, group: 'main' })).assertFalse();
      expect(manager.add({ id: '', focusable: true, enabled: true, group: 'main' })).assertFalse();
      expect(manager.size()).assertEqual(1);
      expect(manager.remove('a')).assertTrue();
      expect(manager.remove('a')).assertFalse();
      expect(manager.size()).assertEqual(0);
    });

    it('manager_should_focus_enabled_node', 0, () => {
      const manager = new FocusManager();
      manager.add({ id: 'a', focusable: true, enabled: true, group: 'main' });
      manager.add({ id: 'b', focusable: true, enabled: false, group: 'main' });
      expect(manager.focus('a')).assertTrue();
      expect(manager.currentId()).assertEqual('a');
      expect(manager.currentIndex()).assertEqual(0);
      expect(manager.focus('b')).assertFalse();
      expect(manager.focus('missing')).assertFalse();
      expect(manager.currentId()).assertEqual('a');
    });

    it('manager_should_skip_disabled_and_unfocusable', 0, () => {
      const manager = new FocusManager();
      manager.add({ id: 'a', focusable: true, enabled: true, group: 'main' });
      manager.add({ id: 'b', focusable: true, enabled: false, group: 'main' });
      manager.add({ id: 'c', focusable: false, enabled: true, group: 'main' });
      manager.add({ id: 'd', focusable: true, enabled: true, group: 'main' });
      expect(manager.focus('a')).assertTrue();
      expect(manager.moveNext()).assertEqual('d');
      expect(manager.moveNext()).assertEqual('a');
      expect(manager.movePrevious()).assertEqual('d');
      expect(manager.focusableCount()).assertEqual(2);
    });

    it('manager_should_move_without_initial_focus', 0, () => {
      const manager = new FocusManager();
      manager.add({ id: 'a', focusable: true, enabled: true, group: 'main' });
      manager.add({ id: 'b', focusable: true, enabled: true, group: 'main' });
      expect(manager.currentIndex()).assertEqual(FOCUS_NONE);
      expect(manager.moveNext()).assertEqual('a');
      expect(manager.movePrevious()).assertEqual('b');
      expect(manager.currentId()).assertEqual('b');
    });

    it('manager_should_handle_empty_list', 0, () => {
      const manager = new FocusManager();
      expect(manager.size()).assertEqual(0);
      expect(manager.moveNext()).assertEqual('');
      expect(manager.movePrevious()).assertEqual('');
      expect(manager.currentId()).assertEqual('');
      expect(manager.focusableCount()).assertEqual(0);
      expect(manager.groupOf('missing')).assertEqual('');
      manager.clearFocus();
      expect(manager.currentIndex()).assertEqual(FOCUS_NONE);
    });

    it('manager_should_remove_current_and_clamp', 0, () => {
      const manager = new FocusManager();
      manager.add({ id: 'a', focusable: true, enabled: true, group: 'main' });
      manager.add({ id: 'b', focusable: true, enabled: true, group: 'main' });
      manager.focus('b');
      expect(manager.remove('b')).assertTrue();
      expect(manager.currentIndex()).assertEqual(0);
      expect(manager.currentId()).assertEqual('a');
      manager.reset();
      expect(manager.size()).assertEqual(0);
      expect(manager.currentId()).assertEqual('');
    });

    it('manager_should_group_focusables', 0, () => {
      const manager = new FocusManager();
      manager.add({ id: 'a', focusable: true, enabled: true, group: 'form' });
      manager.add({ id: 'b', focusable: true, enabled: false, group: 'form' });
      manager.add({ id: 'c', focusable: true, enabled: true, group: 'form' });
      manager.add({ id: 'd', focusable: true, enabled: true, group: 'footer' });
      expect(manager.groupOf('c')).assertEqual('form');
      expect(manager.idsInGroup('form')).assertDeepEquals(['a', 'c']);
      expect(manager.idsInGroup('footer').length).assertEqual(1);
      expect(manager.idsInGroup('missing').length).assertEqual(0);
    });

    it('manager_should_toggle_focusability', 0, () => {
      const manager = new FocusManager();
      manager.add({ id: 'a', focusable: true, enabled: true, group: 'main' });
      manager.add({ id: 'b', focusable: true, enabled: true, group: 'main' });
      expect(manager.focus('a')).assertTrue();
      expect(manager.moveNext()).assertEqual('b');
      manager.remove('b');
      manager.add({ id: 'b', focusable: false, enabled: true, group: 'main' });
      expect(manager.moveNext()).assertEqual('a');
      expect(manager.focusableCount()).assertEqual(1);
    });

    it('scope_should_save_and_restore_focus', 0, () => {
      const scope = new FocusScope('home', MAX_SCOPE_DEPTH);
      expect(scope.getScopeId()).assertEqual('home');
      expect(scope.hasSaved()).assertFalse();
      expect(scope.save('button-a')).assertTrue();
      expect(scope.hasSaved()).assertTrue();
      expect(scope.restore()).assertEqual('button-a');
      scope.clear();
      expect(scope.restore()).assertEqual('');
      expect(scope.hasSaved()).assertFalse();
    });

    it('scope_should_reject_empty_focus', 0, () => {
      const scope = new FocusScope('home', MAX_SCOPE_DEPTH);
      expect(scope.save('')).assertFalse();
      expect(scope.restore()).assertEqual('');
      expect(scope.canNest(1)).assertTrue();
      expect(scope.canNest(MAX_SCOPE_DEPTH)).assertTrue();
      expect(scope.canNest(0)).assertFalse();
      expect(scope.canNest(MAX_SCOPE_DEPTH + 1)).assertFalse();
    });

    it('history_should_track_focus_changes', 0, () => {
      const history = new FocusHistory(MAX_HISTORY);
      expect(history.record('a')).assertTrue();
      expect(history.record('b')).assertTrue();
      expect(history.record('c')).assertTrue();
      expect(history.count()).assertEqual(3);
      expect(history.latest()).assertEqual('c');
      expect(history.previous()).assertEqual('b');
      expect(history.countOf('a')).assertEqual(1);
    });

    it('history_should_be_bounded', 0, () => {
      const history = new FocusHistory(2);
      history.record('a');
      history.record('b');
      history.record('c');
      expect(history.count()).assertEqual(2);
      expect(history.countOf('a')).assertEqual(0);
      expect(history.previous()).assertEqual('b');
      history.clear();
      expect(history.count()).assertEqual(0);
      expect(history.latest()).assertEqual('');
      expect(history.previous()).assertEqual('');
    });

    it('history_should_reject_invalid_entries', 0, () => {
      const history = new FocusHistory(MAX_HISTORY);
      expect(history.record('')).assertFalse();
      expect(history.count()).assertEqual(0);
      const zero = new FocusHistory(0);
      expect(zero.record('a')).assertFalse();
      expect(zero.count()).assertEqual(0);
      expect(zero.previous()).assertEqual('');
    });

    it('trap_should_block_outside_focus', 0, () => {
      const trap = new FocusTrap();
      expect(trap.isActive()).assertFalse();
      expect(trap.allows('anything')).assertTrue();
      expect(trap.activate(['a', 'b'])).assertTrue();
      expect(trap.isActive()).assertTrue();
      expect(trap.scopeSize()).assertEqual(2);
      expect(trap.allows('a')).assertTrue();
      expect(trap.allows('outside')).assertFalse();
      trap.deactivate();
      expect(trap.isActive()).assertFalse();
      expect(trap.allows('outside')).assertTrue();
    });

    it('trap_should_wrap_scope_index', 0, () => {
      const trap = new FocusTrap();
      expect(trap.activate([])).assertFalse();
      trap.activate(['a', 'b', 'c']);
      expect(trap.wrap(0)).assertEqual(0);
      expect(trap.wrap(2)).assertEqual(2);
      expect(trap.wrap(3)).assertEqual(0);
      expect(trap.wrap(-1)).assertEqual(2);
      trap.deactivate();
      expect(trap.wrap(0)).assertEqual(FOCUS_NONE);
    });

    it('focus_flow_should_restore_after_scope_change', 0, () => {
      const manager = new FocusManager();
      const scope = new FocusScope('list', MAX_SCOPE_DEPTH);
      const history = new FocusHistory(MAX_HISTORY);
      manager.add({ id: 'item-1', focusable: true, enabled: true, group: 'list' });
      manager.add({ id: 'item-2', focusable: true, enabled: true, group: 'list' });
      manager.focus('item-2');
      history.record(manager.currentId());
      scope.save(manager.currentId());
      manager.clearFocus();
      expect(manager.currentId()).assertEqual('');
      manager.focus(scope.restore());
      expect(manager.currentId()).assertEqual('item-2');
      expect(history.latest()).assertEqual('item-2');
    });

    it('focus_flow_should_trap_modal_focus', 0, () => {
      const manager = new FocusManager();
      const trap = new FocusTrap();
      manager.add({ id: 'page', focusable: true, enabled: true, group: 'page' });
      manager.add({ id: 'dialog-ok', focusable: true, enabled: true, group: 'dialog' });
      manager.add({ id: 'dialog-cancel', focusable: true, enabled: true, group: 'dialog' });
      trap.activate(manager.idsInGroup('dialog'));
      expect(trap.scopeSize()).assertEqual(2);
      expect(trap.allows('page')).assertFalse();
      expect(trap.allows('dialog-ok')).assertTrue();
      manager.focus('dialog-ok');
      expect(manager.currentId()).assertEqual('dialog-ok');
    });

    it('focus_validator_should_cover_all_states', 0, () => {
      const manager = new FocusManager();
      manager.add({ id: 'a', focusable: true, enabled: true, group: 'g' });
      manager.add({ id: 'b', focusable: false, enabled: true, group: 'g' });
      manager.add({ id: 'c', focusable: true, enabled: false, group: 'g' });
      expect(manager.focusableCount()).assertEqual(1);
      expect(manager.focus('b')).assertFalse();
      expect(manager.focus('c')).assertFalse();
      expect(manager.focus('a')).assertTrue();
      expect(manager.indexOf('a')).assertEqual(0);
      expect(manager.indexOf('missing')).assertEqual(FOCUS_NONE);
    });

    it('focus_constants_should_be_stable', 0, () => {
      expect(DIRECTION_NEXT).assertEqual('next');
      expect(DIRECTION_PREVIOUS).assertEqual('previous');
      expect(FOCUS_NONE).assertEqual(-1);
      expect(MAX_SCOPE_DEPTH).assertEqual(8);
      expect(MAX_HISTORY).assertEqual(20);
    });
  });
}
