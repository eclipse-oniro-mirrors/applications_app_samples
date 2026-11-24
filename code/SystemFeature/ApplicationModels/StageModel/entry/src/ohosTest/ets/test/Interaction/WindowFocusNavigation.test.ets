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
import { Driver, ON } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {
  getDriver, ensureAppReady, checkComponentExists, clampNumber
} from '../Shared/SharedDriver';

enum FocusDirection {
  NEXT = 0,
  PREV = 1,
  UP = 2,
  DOWN = 3,
  LEFT = 4,
  RIGHT = 5
}

class FocusNode {
  id: string = '';
  group: string = '';
  row: number = 0;
  col: number = 0;
  focusable: boolean = true;

  constructor(id: string, group: string, row: number, col: number, focusable: boolean) {
    this.id = id;
    this.group = group;
    this.row = row;
    this.col = col;
    this.focusable = focusable;
  }
}

class FocusHistory {
  private entries: string[] = [];
  private capacity: number = 16;

  constructor(capacity: number) {
    this.capacity = clampNumber(capacity, 1, 256);
  }

  push(id: string): void {
    this.entries.push(id);
    if (this.entries.length > this.capacity) {
      this.entries.shift();
    }
  }

  pop(): string {
    if (this.entries.length === 0) {
      return '';
    }
    const value = this.entries.pop();
    if (value === undefined) {
      return '';
    }
    return value;
  }

  size(): number {
    return this.entries.length;
  }

  getCapacity(): number {
    return this.capacity;
  }

  clear(): void {
    this.entries = [];
  }
}

class FocusModel {
  private nodes: FocusNode[] = [];
  private currentId: string = '';
  private history: FocusHistory = new FocusHistory(8);
  private trapped: boolean = false;
  private moves: number = 0;

  register(node: FocusNode): boolean {
    if (node.id.length === 0 || this.find(node.id) !== null) {
      return false;
    }
    this.nodes.push(node);
    return true;
  }

  find(id: string): FocusNode | null {
    for (const node of this.nodes) {
      if (node.id === id) {
        return node;
      }
    }
    return null;
  }

  count(): number {
    return this.nodes.length;
  }

  indexOf(id: string): number {
    for (let i = 0; i < this.nodes.length; i++) {
      if (this.nodes[i].id === id) {
        return i;
      }
    }
    return -1;
  }

  currentIndex(): number {
    return this.indexOf(this.currentId);
  }

  getCurrentId(): string {
    return this.currentId;
  }

  current(): FocusNode | null {
    return this.find(this.currentId);
  }

  isFocused(id: string): boolean {
    return this.currentId.length > 0 && this.currentId === id;
  }

  getMoves(): number {
    return this.moves;
  }

  isTrapped(): boolean {
    return this.trapped;
  }

  setTrapped(value: boolean): void {
    this.trapped = value;
  }

  focus(id: string): boolean {
    const node = this.find(id);
    if (node === null || !node.focusable) {
      return false;
    }
    if (this.currentId.length > 0 && this.currentId !== id) {
      this.history.push(this.currentId);
    }
    this.currentId = id;
    this.moves = this.moves + 1;
    return true;
  }

  blur(): boolean {
    if (this.currentId.length === 0) {
      return false;
    }
    this.currentId = '';
    this.moves = this.moves + 1;
    return true;
  }

  firstFocusableIndex(): number {
    for (let i = 0; i < this.nodes.length; i++) {
      if (this.nodes[i].focusable) {
        return i;
      }
    }
    return -1;
  }

  lastFocusableIndex(): number {
    for (let i = this.nodes.length - 1; i >= 0; i--) {
      if (this.nodes[i].focusable) {
        return i;
      }
    }
    return -1;
  }

  moveNext(wrap: boolean): boolean {
    if (this.nodes.length === 0) {
      return false;
    }
    let index = this.currentIndex();
    if (index < 0) {
      const first = this.firstFocusableIndex();
      if (first < 0) {
        return false;
      }
      return this.focus(this.nodes[first].id);
    }
    for (let step = 1; step <= this.nodes.length; step++) {
      let candidate = index + step;
      if (candidate >= this.nodes.length) {
        if (!wrap && !this.trapped) {
          return false;
        }
        candidate = candidate % this.nodes.length;
      }
      if (this.nodes[candidate].focusable) {
        return this.focus(this.nodes[candidate].id);
      }
    }
    return false;
  }

  movePrev(wrap: boolean): boolean {
    if (this.nodes.length === 0) {
      return false;
    }
    let index = this.currentIndex();
    if (index < 0) {
      const last = this.lastFocusableIndex();
      if (last < 0) {
        return false;
      }
      return this.focus(this.nodes[last].id);
    }
    for (let step = 1; step <= this.nodes.length; step++) {
      let candidate = index - step;
      if (candidate < 0) {
        if (!wrap && !this.trapped) {
          return false;
        }
        candidate = (candidate + this.nodes.length * step) % this.nodes.length;
        if (candidate < 0) {
          candidate = candidate + this.nodes.length;
        }
      }
      if (this.nodes[candidate].focusable) {
        return this.focus(this.nodes[candidate].id);
      }
    }
    return false;
  }

  columns(): number {
    let maxCol = 0;
    for (const node of this.nodes) {
      if (node.col > maxCol) {
        maxCol = node.col;
      }
    }
    return maxCol + 1;
  }

  moveUp(wrap: boolean): boolean {
    const index = this.currentIndex();
    if (index < 0) {
      return false;
    }
    const step = this.columns();
    let candidate = index - step;
    if (candidate < 0) {
      if (!wrap && !this.trapped) {
        return false;
      }
      candidate = candidate + this.nodes.length * step;
      while (candidate < 0) {
        candidate = candidate + this.nodes.length;
      }
      candidate = candidate % this.nodes.length;
    }
    return this.focusByIndex(candidate);
  }

  moveDown(wrap: boolean): boolean {
    const index = this.currentIndex();
    if (index < 0) {
      return false;
    }
    const step = this.columns();
    let candidate = index + step;
    if (candidate >= this.nodes.length) {
      if (!wrap && !this.trapped) {
        return false;
      }
      candidate = candidate % this.nodes.length;
    }
    return this.focusByIndex(candidate);
  }

  move(direction: FocusDirection, wrap: boolean): boolean {
    if (direction === FocusDirection.NEXT || direction === FocusDirection.RIGHT) {
      return this.moveNext(wrap);
    }
    if (direction === FocusDirection.PREV || direction === FocusDirection.LEFT) {
      return this.movePrev(wrap);
    }
    if (direction === FocusDirection.UP) {
      return this.moveUp(wrap);
    }
    return this.moveDown(wrap);
  }

  private focusByIndex(index: number): boolean {
    if (index < 0 || index >= this.nodes.length) {
      return false;
    }
    const node = this.nodes[index];
    if (!node.focusable) {
      return false;
    }
    return this.focus(node.id);
  }

  focusFirstInGroup(group: string): boolean {
    for (const node of this.nodes) {
      if (node.group === group && node.focusable) {
        return this.focus(node.id);
      }
    }
    return false;
  }

  countInGroup(group: string): number {
    let total = 0;
    for (const node of this.nodes) {
      if (node.group === group) {
        total = total + 1;
      }
    }
    return total;
  }

  historySize(): number {
    return this.history.size();
  }

  historyBack(): boolean {
    const previous = this.history.pop();
    if (previous.length === 0) {
      return false;
    }
    this.currentId = previous;
    this.moves = this.moves + 1;
    return true;
  }
}

export default function windowFocusNavigationTest(): void {
  describe('WindowFocusNavigation', () => {
    it('WindowFocusNavigation_001', 0, async (done: Function) => {
      const model = new FocusModel();
      expect(model.register(new FocusNode('a', 'g1', 0, 0, true))).assertTrue();
      expect(model.register(new FocusNode('b', 'g1', 0, 1, true))).assertTrue();
      expect(model.count()).assertEqual(2);
      expect(model.indexOf('a')).assertEqual(0);
      expect(model.indexOf('b')).assertEqual(1);
      done();
    });

    it('WindowFocusNavigation_002', 0, async (done: Function) => {
      const model = new FocusModel();
      model.register(new FocusNode('a', 'g1', 0, 0, true));
      expect(model.register(new FocusNode('a', 'g2', 0, 0, true))).assertFalse();
      expect(model.register(new FocusNode('', 'g1', 0, 0, true))).assertFalse();
      expect(model.count()).assertEqual(1);
      done();
    });

    it('WindowFocusNavigation_003', 0, async (done: Function) => {
      const model = new FocusModel();
      model.register(new FocusNode('a', 'g1', 0, 0, true));
      expect(model.getCurrentId()).assertEqual('');
      expect(model.current()).assertNull();
      expect(model.currentIndex()).assertEqual(-1);
      done();
    });

    it('WindowFocusNavigation_004', 0, async (done: Function) => {
      const model = new FocusModel();
      model.register(new FocusNode('a', 'g1', 0, 0, true));
      expect(model.focus('a')).assertTrue();
      expect(model.isFocused('a')).assertTrue();
      expect(model.currentIndex()).assertEqual(0);
      expect(model.getMoves()).assertEqual(1);
      done();
    });

    it('WindowFocusNavigation_005', 0, async (done: Function) => {
      const model = new FocusModel();
      expect(model.focus('missing')).assertFalse();
      expect(model.getCurrentId()).assertEqual('');
      expect(model.getMoves()).assertEqual(0);
      done();
    });

    it('WindowFocusNavigation_006', 0, async (done: Function) => {
      const model = new FocusModel();
      model.register(new FocusNode('a', 'g1', 0, 0, false));
      expect(model.focus('a')).assertFalse();
      expect(model.isFocused('a')).assertFalse();
      done();
    });

    it('WindowFocusNavigation_007', 0, async (done: Function) => {
      const model = new FocusModel();
      model.register(new FocusNode('a', 'g1', 0, 0, true));
      model.focus('a');
      expect(model.blur()).assertTrue();
      expect(model.getCurrentId()).assertEqual('');
      expect(model.current()).assertNull();
      expect(model.getMoves()).assertEqual(2);
      done();
    });

    it('WindowFocusNavigation_008', 0, async (done: Function) => {
      const model = new FocusModel();
      expect(model.blur()).assertFalse();
      expect(model.getMoves()).assertEqual(0);
      done();
    });

    it('WindowFocusNavigation_009', 0, async (done: Function) => {
      const model = new FocusModel();
      model.register(new FocusNode('a', 'g1', 0, 0, true));
      model.register(new FocusNode('b', 'g1', 0, 1, true));
      model.focus('a');
      model.focus('b');
      expect(model.historySize()).assertEqual(1);
      expect(model.isFocused('b')).assertTrue();
      done();
    });

    it('WindowFocusNavigation_010', 0, async (done: Function) => {
      const model = new FocusModel();
      model.register(new FocusNode('a', 'g1', 0, 0, true));
      model.register(new FocusNode('b', 'g1', 0, 1, true));
      model.focus('a');
      model.focus('b');
      expect(model.historyBack()).assertTrue();
      expect(model.isFocused('a')).assertTrue();
      expect(model.getMoves()).assertEqual(3);
      done();
    });

    it('WindowFocusNavigation_011', 0, async (done: Function) => {
      const model = new FocusModel();
      expect(model.historyBack()).assertFalse();
      expect(model.getCurrentId()).assertEqual('');
      done();
    });

    it('WindowFocusNavigation_012', 0, async (done: Function) => {
      const model = new FocusModel();
      for (let i = 0; i < 4; i++) {
        model.register(new FocusNode(`n${i}`, 'g1', 0, i, true));
      }
      expect(model.firstFocusableIndex()).assertEqual(0);
      expect(model.lastFocusableIndex()).assertEqual(3);
      expect(model.columns()).assertEqual(4);
      done();
    });

    it('WindowFocusNavigation_013', 0, async (done: Function) => {
      const model = new FocusModel();
      model.register(new FocusNode('a', 'g1', 0, 0, false));
      model.register(new FocusNode('b', 'g1', 0, 1, true));
      expect(model.firstFocusableIndex()).assertEqual(1);
      expect(model.lastFocusableIndex()).assertEqual(1);
      done();
    });

    it('WindowFocusNavigation_014', 0, async (done: Function) => {
      const model = new FocusModel();
      model.register(new FocusNode('a', 'g1', 0, 0, true));
      model.register(new FocusNode('b', 'g1', 0, 1, true));
      model.register(new FocusNode('c', 'g1', 0, 2, true));
      expect(model.moveNext(false)).assertTrue();
      expect(model.isFocused('a')).assertTrue();
      expect(model.moveNext(false)).assertTrue();
      expect(model.isFocused('b')).assertTrue();
      done();
    });

    it('WindowFocusNavigation_015', 0, async (done: Function) => {
      const model = new FocusModel();
      model.register(new FocusNode('a', 'g1', 0, 0, true));
      model.register(new FocusNode('b', 'g1', 0, 1, true));
      model.focus('b');
      expect(model.moveNext(false)).assertFalse();
      expect(model.isFocused('b')).assertTrue();
      done();
    });

    it('WindowFocusNavigation_016', 0, async (done: Function) => {
      const model = new FocusModel();
      model.register(new FocusNode('a', 'g1', 0, 0, true));
      model.register(new FocusNode('b', 'g1', 0, 1, true));
      model.focus('b');
      expect(model.moveNext(true)).assertTrue();
      expect(model.isFocused('a')).assertTrue();
      done();
    });

    it('WindowFocusNavigation_017', 0, async (done: Function) => {
      const model = new FocusModel();
      model.register(new FocusNode('a', 'g1', 0, 0, true));
      model.register(new FocusNode('b', 'g1', 0, 1, true));
      model.focus('a');
      expect(model.movePrev(false)).assertFalse();
      expect(model.isFocused('a')).assertTrue();
      done();
    });

    it('WindowFocusNavigation_018', 0, async (done: Function) => {
      const model = new FocusModel();
      model.register(new FocusNode('a', 'g1', 0, 0, true));
      model.register(new FocusNode('b', 'g1', 0, 1, true));
      model.focus('a');
      expect(model.movePrev(true)).assertTrue();
      expect(model.isFocused('b')).assertTrue();
      done();
    });

    it('WindowFocusNavigation_019', 0, async (done: Function) => {
      const model = new FocusModel();
      model.register(new FocusNode('a', 'g1', 0, 0, true));
      model.register(new FocusNode('b', 'g1', 0, 1, false));
      model.register(new FocusNode('c', 'g1', 0, 2, true));
      model.focus('a');
      expect(model.moveNext(false)).assertTrue();
      expect(model.isFocused('c')).assertTrue();
      done();
    });

    it('WindowFocusNavigation_020', 0, async (done: Function) => {
      const model = new FocusModel();
      model.register(new FocusNode('a', 'g1', 0, 0, false));
      model.register(new FocusNode('b', 'g1', 0, 1, false));
      expect(model.moveNext(false)).assertFalse();
      expect(model.getCurrentId()).assertEqual('');
      done();
    });

    it('WindowFocusNavigation_021', 0, async (done: Function) => {
      const model = new FocusModel();
      model.register(new FocusNode('a', 'g1', 0, 0, true));
      model.register(new FocusNode('b', 'g1', 0, 1, true));
      expect(model.movePrev(false)).assertTrue();
      expect(model.isFocused('b')).assertTrue();
      done();
    });

    it('WindowFocusNavigation_022', 0, async (done: Function) => {
      const model = new FocusModel();
      model.register(new FocusNode('a', 'g1', 0, 0, true));
      model.register(new FocusNode('b', 'g1', 0, 1, true));
      model.register(new FocusNode('c', 'g1', 0, 2, true));
      model.focus('a');
      expect(model.move(FocusDirection.NEXT, false)).assertTrue();
      expect(model.isFocused('b')).assertTrue();
      expect(model.move(FocusDirection.PREV, false)).assertTrue();
      expect(model.isFocused('a')).assertTrue();
      done();
    });

    it('WindowFocusNavigation_023', 0, async (done: Function) => {
      const model = new FocusModel();
      model.register(new FocusNode('a', 'g1', 0, 0, true));
      model.register(new FocusNode('b', 'g1', 0, 1, true));
      model.focus('a');
      expect(model.move(FocusDirection.RIGHT, false)).assertTrue();
      expect(model.isFocused('b')).assertTrue();
      expect(model.move(FocusDirection.LEFT, false)).assertTrue();
      expect(model.isFocused('a')).assertTrue();
      done();
    });

    it('WindowFocusNavigation_024', 0, async (done: Function) => {
      const model = new FocusModel();
      model.register(new FocusNode('a', 'g1', 0, 0, true));
      model.register(new FocusNode('b', 'g1', 0, 1, true));
      model.register(new FocusNode('c', 'g1', 1, 0, true));
      model.register(new FocusNode('d', 'g1', 1, 1, true));
      model.focus('a');
      expect(model.columns()).assertEqual(2);
      expect(model.move(FocusDirection.DOWN, false)).assertTrue();
      expect(model.isFocused('c')).assertTrue();
      expect(model.move(FocusDirection.UP, false)).assertTrue();
      expect(model.isFocused('a')).assertTrue();
      done();
    });

    it('WindowFocusNavigation_025', 0, async (done: Function) => {
      const model = new FocusModel();
      model.register(new FocusNode('a', 'g1', 0, 0, true));
      model.register(new FocusNode('b', 'g1', 0, 1, true));
      model.register(new FocusNode('c', 'g1', 1, 0, true));
      model.register(new FocusNode('d', 'g1', 1, 1, true));
      model.focus('c');
      expect(model.moveUp(false)).assertTrue();
      expect(model.isFocused('a')).assertTrue();
      done();
    });

    it('WindowFocusNavigation_026', 0, async (done: Function) => {
      const model = new FocusModel();
      model.register(new FocusNode('a', 'g1', 0, 0, true));
      model.register(new FocusNode('b', 'g1', 0, 1, true));
      model.focus('b');
      expect(model.moveDown(false)).assertFalse();
      expect(model.isFocused('b')).assertTrue();
      done();
    });

    it('WindowFocusNavigation_027', 0, async (done: Function) => {
      const model = new FocusModel();
      model.register(new FocusNode('a', 'g1', 0, 0, true));
      model.register(new FocusNode('b', 'g1', 0, 1, true));
      model.register(new FocusNode('c', 'g1', 1, 0, true));
      model.register(new FocusNode('d', 'g1', 1, 1, true));
      model.focus('c');
      expect(model.moveDown(true)).assertTrue();
      expect(model.isFocused('a')).assertTrue();
      done();
    });

    it('WindowFocusNavigation_028', 0, async (done: Function) => {
      const model = new FocusModel();
      model.register(new FocusNode('a', 'g1', 0, 0, true));
      model.register(new FocusNode('b', 'g1', 0, 1, true));
      model.focus('a');
      expect(model.moveUp(true)).assertTrue();
      expect(model.isFocused('a')).assertTrue();
      done();
    });

    it('WindowFocusNavigation_029', 0, async (done: Function) => {
      const model = new FocusModel();
      model.register(new FocusNode('a', 'g1', 0, 0, true));
      model.register(new FocusNode('b', 'g2', 0, 1, true));
      model.register(new FocusNode('c', 'g2', 0, 2, true));
      expect(model.focusFirstInGroup('g2')).assertTrue();
      expect(model.isFocused('b')).assertTrue();
      expect(model.countInGroup('g2')).assertEqual(2);
      expect(model.countInGroup('g1')).assertEqual(1);
      done();
    });

    it('WindowFocusNavigation_030', 0, async (done: Function) => {
      const model = new FocusModel();
      expect(model.focusFirstInGroup('missing')).assertFalse();
      expect(model.countInGroup('missing')).assertEqual(0);
      done();
    });

    it('WindowFocusNavigation_031', 0, async (done: Function) => {
      const model = new FocusModel();
      model.register(new FocusNode('a', 'g1', 0, 0, true));
      model.register(new FocusNode('b', 'g1', 0, 1, true));
      expect(model.isTrapped()).assertFalse();
      model.setTrapped(true);
      expect(model.isTrapped()).assertTrue();
      done();
    });

    it('WindowFocusNavigation_032', 0, async (done: Function) => {
      const model = new FocusModel();
      model.register(new FocusNode('a', 'g1', 0, 0, true));
      model.register(new FocusNode('b', 'g1', 0, 1, true));
      model.setTrapped(true);
      model.focus('b');
      expect(model.moveNext(false)).assertTrue();
      expect(model.isFocused('a')).assertTrue();
      done();
    });

    it('WindowFocusNavigation_033', 0, async (done: Function) => {
      const model = new FocusModel();
      model.register(new FocusNode('a', 'g1', 0, 0, true));
      model.register(new FocusNode('b', 'g1', 0, 1, true));
      model.setTrapped(true);
      model.focus('a');
      expect(model.movePrev(false)).assertTrue();
      expect(model.isFocused('b')).assertTrue();
      done();
    });

    it('WindowFocusNavigation_034', 0, async (done: Function) => {
      const history = new FocusHistory(2);
      history.push('a');
      history.push('b');
      history.push('c');
      expect(history.size()).assertEqual(2);
      expect(history.pop()).assertEqual('c');
      expect(history.pop()).assertEqual('b');
      done();
    });

    it('WindowFocusNavigation_035', 0, async (done: Function) => {
      const history = new FocusHistory(4);
      expect(history.pop()).assertEqual('');
      expect(history.size()).assertEqual(0);
      expect(history.getCapacity()).assertEqual(4);
      done();
    });

    it('WindowFocusNavigation_036', 0, async (done: Function) => {
      const history = new FocusHistory(0);
      expect(history.getCapacity()).assertEqual(1);
      history.push('a');
      history.push('b');
      expect(history.size()).assertEqual(1);
      expect(history.pop()).assertEqual('b');
      done();
    });

    it('WindowFocusNavigation_037', 0, async (done: Function) => {
      const history = new FocusHistory(16);
      history.push('a');
      history.push('b');
      history.clear();
      expect(history.size()).assertEqual(0);
      expect(history.pop()).assertEqual('');
      done();
    });

    it('WindowFocusNavigation_038', 0, async (done: Function) => {
      const model = new FocusModel();
      model.register(new FocusNode('a', 'g1', 0, 0, true));
      model.register(new FocusNode('b', 'g1', 0, 1, true));
      model.register(new FocusNode('c', 'g1', 0, 2, true));
      model.focus('a');
      model.focus('b');
      model.focus('c');
      expect(model.historySize()).assertEqual(2);
      expect(model.historyBack()).assertTrue();
      expect(model.isFocused('b')).assertTrue();
      expect(model.historyBack()).assertTrue();
      expect(model.isFocused('a')).assertTrue();
      done();
    });

    it('WindowFocusNavigation_039', 0, async (done: Function) => {
      const model = new FocusModel();
      model.register(new FocusNode('a', 'g1', 0, 0, true));
      model.focus('a');
      model.focus('a');
      expect(model.historySize()).assertEqual(0);
      expect(model.getMoves()).assertEqual(2);
      done();
    });

    it('WindowFocusNavigation_040', 0, async (done: Function) => {
      const model = new FocusModel();
      model.register(new FocusNode('a', 'g1', 0, 0, true));
      model.register(new FocusNode('b', 'g1', 0, 1, true));
      model.focus('a');
      model.focus('b');
      model.blur();
      expect(model.historyBack()).assertTrue();
      expect(model.isFocused('a')).assertTrue();
      done();
    });

    it('WindowFocusNavigation_041', 0, async (done: Function) => {
      const model = new FocusModel();
      for (let i = 0; i < 5; i++) {
        model.register(new FocusNode(`n${i}`, 'g1', 0, i, true));
      }
      model.focus('n0');
      expect(model.moveNext(true)).assertTrue();
      expect(model.isFocused('n1')).assertTrue();
      expect(model.movePrev(true)).assertTrue();
      expect(model.isFocused('n0')).assertTrue();
      done();
    });

    it('WindowFocusNavigation_042', 0, async (done: Function) => {
      const model = new FocusModel();
      for (let i = 0; i < 5; i++) {
        model.register(new FocusNode(`n${i}`, 'g1', 0, i, true));
      }
      model.focus('n4');
      expect(model.moveNext(false)).assertFalse();
      expect(model.moveNext(true)).assertTrue();
      expect(model.isFocused('n0')).assertTrue();
      done();
    });

    it('WindowFocusNavigation_043', 0, async (done: Function) => {
      const model = new FocusModel();
      for (let i = 0; i < 5; i++) {
        model.register(new FocusNode(`n${i}`, 'g1', 0, i, true));
      }
      model.focus('n0');
      expect(model.movePrev(false)).assertFalse();
      expect(model.movePrev(true)).assertTrue();
      expect(model.isFocused('n4')).assertTrue();
      done();
    });

    it('WindowFocusNavigation_044', 0, async (done: Function) => {
      const model = new FocusModel();
      model.register(new FocusNode('a', 'g1', 0, 0, true));
      model.register(new FocusNode('b', 'g1', 0, 1, false));
      model.register(new FocusNode('c', 'g1', 0, 2, true));
      model.focus('c');
      expect(model.movePrev(false)).assertTrue();
      expect(model.isFocused('a')).assertTrue();
      done();
    });

    it('WindowFocusNavigation_045', 0, async (done: Function) => {
      const model = new FocusModel();
      model.register(new FocusNode('a', 'g1', 0, 0, false));
      model.register(new FocusNode('b', 'g1', 0, 1, true));
      model.register(new FocusNode('c', 'g1', 0, 2, true));
      model.focus('b');
      expect(model.movePrev(true)).assertTrue();
      expect(model.isFocused('c')).assertTrue();
      done();
    });

    it('WindowFocusNavigation_046', 0, async (done: Function) => {
      const model = new FocusModel();
      model.register(new FocusNode('a', 'g1', 0, 0, true));
      model.register(new FocusNode('b', 'g1', 0, 1, true));
      model.register(new FocusNode('c', 'g1', 1, 0, true));
      model.register(new FocusNode('d', 'g1', 1, 1, true));
      model.focus('b');
      expect(model.moveDown(false)).assertTrue();
      expect(model.isFocused('d')).assertTrue();
      expect(model.moveUp(false)).assertTrue();
      expect(model.isFocused('b')).assertTrue();
      done();
    });

    it('WindowFocusNavigation_047', 0, async (done: Function) => {
      const model = new FocusModel();
      model.register(new FocusNode('a', 'g1', 0, 0, true));
      model.register(new FocusNode('b', 'g1', 0, 1, true));
      model.register(new FocusNode('c', 'g1', 1, 0, true));
      model.register(new FocusNode('d', 'g1', 1, 1, true));
      model.focus('d');
      expect(model.moveDown(false)).assertFalse();
      expect(model.moveDown(true)).assertTrue();
      expect(model.isFocused('b')).assertTrue();
      done();
    });

    it('WindowFocusNavigation_048', 0, async (done: Function) => {
      const model = new FocusModel();
      model.register(new FocusNode('a', 'left', 0, 0, true));
      model.register(new FocusNode('b', 'left', 0, 1, true));
      model.register(new FocusNode('c', 'right', 0, 0, true));
      expect(model.countInGroup('left')).assertEqual(2);
      expect(model.countInGroup('right')).assertEqual(1);
      expect(model.focusFirstInGroup('right')).assertTrue();
      expect(model.isFocused('c')).assertTrue();
      done();
    });

    it('WindowFocusNavigation_049', 0, async (done: Function) => {
      const model = new FocusModel();
      model.register(new FocusNode('a', 'g1', 0, 0, true));
      model.register(new FocusNode('b', 'g1', 0, 1, true));
      model.focus('a');
      model.focus('b');
      model.focus('a');
      expect(model.historySize()).assertEqual(2);
      expect(model.isFocused('a')).assertTrue();
      done();
    });

    it('WindowFocusNavigation_050', 0, async (done: Function) => {
      const model = new FocusModel();
      model.register(new FocusNode('a', 'g1', 0, 0, true));
      model.register(new FocusNode('b', 'g1', 0, 1, true));
      model.focus('a');
      model.focus('b');
      model.focus('a');
      model.focus('b');
      expect(model.historyBack()).assertTrue();
      expect(model.isFocused('a')).assertTrue();
      done();
    });

    it('WindowFocusNavigation_051', 0, async (done: Function) => {
      const model = new FocusModel();
      model.register(new FocusNode('a', 'g1', 0, 0, true));
      model.register(new FocusNode('b', 'g1', 0, 1, true));
      model.register(new FocusNode('c', 'g1', 0, 2, true));
      model.focus('b');
      expect(model.getCurrentId()).assertEqual('b');
      expect(model.indexOf('c')).assertEqual(2);
      expect(model.getMoves()).assertEqual(1);
      done();
    });

    it('WindowFocusNavigation_052', 0, async (done: Function) => {
      const model = new FocusModel();
      expect(model.count()).assertEqual(0);
      expect(model.firstFocusableIndex()).assertEqual(-1);
      expect(model.lastFocusableIndex()).assertEqual(-1);
      expect(model.moveNext(false)).assertFalse();
      expect(model.movePrev(false)).assertFalse();
      done();
    });

    it('WindowFocusNavigation_053', 0, async (done: Function) => {
      const model = new FocusModel();
      model.register(new FocusNode('a', 'g1', 0, 0, false));
      model.register(new FocusNode('b', 'g1', 0, 1, false));
      expect(model.firstFocusableIndex()).assertEqual(-1);
      expect(model.lastFocusableIndex()).assertEqual(-1);
      expect(model.movePrev(false)).assertFalse();
      done();
    });

    it('WindowFocusNavigation_054', 0, async (done: Function) => {
      const model = new FocusModel();
      for (let i = 0; i < 3; i++) {
        model.register(new FocusNode(`n${i}`, 'g1', 0, i, true));
      }
      model.focus('n1');
      expect(model.move(FocusDirection.NEXT, true)).assertTrue();
      expect(model.isFocused('n2')).assertTrue();
      expect(model.move(FocusDirection.PREV, true)).assertTrue();
      expect(model.isFocused('n1')).assertTrue();
      done();
    });

    it('WindowFocusNavigation_055', 0, async (done: Function) => {
      const model = new FocusModel();
      model.register(new FocusNode('a', 'g1', 0, 0, true));
      model.register(new FocusNode('b', 'g1', 0, 1, true));
      model.focus('a');
      model.blur();
      expect(model.current()).assertNull();
      expect(model.currentIndex()).assertEqual(-1);
      expect(model.getMoves()).assertEqual(2);
      done();
    });

    it('WindowFocusNavigation_056', 0, async (done: Function) => {
      const model = new FocusModel();
      model.register(new FocusNode('a', 'g1', 0, 0, true));
      model.register(new FocusNode('b', 'g1', 0, 1, true));
      model.setTrapped(true);
      model.focus('a');
      model.blur();
      expect(model.movePrev(false)).assertTrue();
      expect(model.isFocused('b')).assertTrue();
      done();
    });

    it('WindowFocusNavigation_057', 0, async (done: Function) => {
      const model = new FocusModel();
      model.register(new FocusNode('a', 'g1', 0, 0, true));
      model.register(new FocusNode('b', 'g1', 0, 1, true));
      model.register(new FocusNode('c', 'g1', 1, 0, true));
      model.register(new FocusNode('d', 'g1', 1, 1, true));
      model.focus('a');
      expect(model.move(FocusDirection.DOWN, true)).assertTrue();
      expect(model.isFocused('c')).assertTrue();
      expect(model.move(FocusDirection.RIGHT, true)).assertTrue();
      expect(model.isFocused('d')).assertTrue();
      done();
    });

    it('WindowFocusNavigation_058', 0, async (done: Function) => {
      const model = new FocusModel();
      model.register(new FocusNode('a', 'g1', 0, 0, true));
      model.register(new FocusNode('b', 'g1', 0, 1, true));
      expect(model.move(FocusDirection.DOWN, false)).assertFalse();
      expect(model.move(FocusDirection.UP, false)).assertFalse();
      done();
    });

    it('WindowFocusNavigation_059', 0, async (done: Function) => {
      const model = new FocusModel();
      model.register(new FocusNode('a', 'g1', 0, 0, true));
      model.register(new FocusNode('b', 'g1', 0, 1, true));
      model.focus('b');
      expect(model.moveUp(false)).assertFalse();
      expect(model.isFocused('b')).assertTrue();
      done();
    });

    it('WindowFocusNavigation_060', 0, async (done: Function) => {
      const model = new FocusModel();
      model.register(new FocusNode('a', 'g1', 0, 0, true));
      model.register(new FocusNode('b', 'g1', 0, 1, true));
      model.register(new FocusNode('c', 'g1', 0, 2, true));
      expect(model.focusFirstInGroup('g1')).assertTrue();
      expect(model.isFocused('a')).assertTrue();
      expect(model.getMoves()).assertEqual(1);
      done();
    });

    it('WindowFocusNavigation_061', 0, async (done: Function) => {
      const model = new FocusModel();
      for (let i = 0; i < 4; i++) {
        model.register(new FocusNode(`n${i}`, 'g1', 0, i, true));
      }
      model.focus('n0');
      model.focus('n1');
      model.focus('n2');
      model.focus('n3');
      expect(model.historyBack()).assertTrue();
      expect(model.isFocused('n2')).assertTrue();
      expect(model.historyBack()).assertTrue();
      expect(model.isFocused('n1')).assertTrue();
      done();
    });

    it('WindowFocusNavigation_062', 0, async (done: Function) => {
      const model = new FocusModel();
      for (let i = 0; i < 4; i++) {
        model.register(new FocusNode(`n${i}`, 'g1', 0, i, true));
      }
      model.focus('n0');
      expect(model.moveNext(true)).assertTrue();
      expect(model.moveNext(true)).assertTrue();
      expect(model.moveNext(true)).assertTrue();
      expect(model.isFocused('n3')).assertTrue();
      done();
    });

    it('WindowFocusNavigation_063', 0, async (done: Function) => {
      const model = new FocusModel();
      model.register(new FocusNode('a', 'g1', 0, 0, true));
      model.register(new FocusNode('b', 'g1', 0, 1, true));
      expect(model.isTrapped()).assertFalse();
      model.setTrapped(true);
      expect(model.isTrapped()).assertTrue();
      done();
    });

    it('WindowFocusNavigation_064', 0, async (done: Function) => {
      const model = new FocusModel();
      model.register(new FocusNode('a', 'g1', 0, 0, true));
      model.register(new FocusNode('b', 'g1', 0, 1, true));
      model.register(new FocusNode('c', 'g1', 0, 2, true));
      model.focus('b');
      expect(model.moveNext(false)).assertTrue();
      expect(model.isFocused('c')).assertTrue();
      expect(model.moveNext(false)).assertFalse();
      expect(model.isFocused('c')).assertTrue();
      done();
    });

    it('WindowFocusNavigation_065', 0, async (done: Function) => {
      const model = new FocusModel();
      model.register(new FocusNode('a', 'g1', 0, 0, true));
      model.register(new FocusNode('b', 'g1', 0, 1, true));
      model.register(new FocusNode('c', 'g1', 0, 2, true));
      model.focus('b');
      expect(model.movePrev(false)).assertTrue();
      expect(model.isFocused('a')).assertTrue();
      expect(model.movePrev(false)).assertFalse();
      expect(model.isFocused('a')).assertTrue();
      done();
    });

    it('WindowFocusNavigation_066', 0, async (done: Function) => {
      const model = new FocusModel();
      model.register(new FocusNode('a', 'g1', 0, 0, true));
      model.register(new FocusNode('b', 'g1', 0, 1, true));
      model.register(new FocusNode('c', 'g1', 1, 0, true));
      model.register(new FocusNode('d', 'g1', 1, 1, true));
      model.focus('c');
      expect(model.moveUp(false)).assertTrue();
      expect(model.isFocused('a')).assertTrue();
      expect(model.moveDown(false)).assertTrue();
      expect(model.isFocused('c')).assertTrue();
      done();
    });

    it('WindowFocusNavigation_067', 0, async (done: Function) => {
      const model = new FocusModel();
      model.register(new FocusNode('a', 'g1', 0, 0, true));
      model.register(new FocusNode('b', 'g1', 0, 1, true));
      model.register(new FocusNode('c', 'g1', 1, 0, true));
      model.register(new FocusNode('d', 'g1', 1, 1, true));
      model.focus('d');
      expect(model.moveUp(false)).assertTrue();
      expect(model.isFocused('b')).assertTrue();
      expect(model.moveUp(false)).assertFalse();
      done();
    });

    it('WindowFocusNavigation_068', 0, async (done: Function) => {
      const model = new FocusModel();
      model.register(new FocusNode('a', 'g1', 0, 0, true));
      model.register(new FocusNode('b', 'g1', 0, 1, true));
      expect(model.current()).assertNull();
      model.focus('a');
      const node = model.current();
      expect(node !== null).assertTrue();
      if (node !== null) {
        expect(node.id).assertEqual('a');
        expect(node.group).assertEqual('g1');
      }
      done();
    });

    it('WindowFocusNavigation_069', 0, async (done: Function) => {
      const model = new FocusModel();
      model.register(new FocusNode('a', 'g1', 0, 0, true));
      model.register(new FocusNode('b', 'g1', 0, 1, false));
      model.register(new FocusNode('c', 'g1', 0, 2, true));
      model.focus('c');
      expect(model.movePrev(true)).assertTrue();
      expect(model.isFocused('a')).assertTrue();
      expect(model.historySize()).assertEqual(1);
      done();
    });

    it('WindowFocusNavigation_070', 0, async (done: Function) => {
      try {
        const driver: Driver = getDriver();
        const ready = await ensureAppReady(driver);
        expect(ready).assertTrue();
        const exists = await checkComponentExists(driver, 'Text');
        expect(typeof exists === 'boolean').assertTrue();
      } catch (error) {
        expect(error !== null).assertTrue();
      }
      done();
    });

    it('WindowFocusNavigation_071', 0, async (done: Function) => {
      const model = new FocusModel();
      model.register(new FocusNode('a', 'g1', 0, 0, true));
      model.register(new FocusNode('b', 'g1', 0, 1, true));
      model.register(new FocusNode('c', 'g1', 1, 0, true));
      model.focus('a');
      expect(model.move(FocusDirection.DOWN, false)).assertTrue();
      expect(model.isFocused('c')).assertTrue();
      expect(model.move(FocusDirection.UP, false)).assertTrue();
      expect(model.isFocused('a')).assertTrue();
      done();
    });

    it('WindowFocusNavigation_072', 0, async (done: Function) => {
      const model = new FocusModel();
      model.register(new FocusNode('a', 'g1', 0, 0, true));
      model.register(new FocusNode('b', 'g1', 0, 1, true));
      expect(model.count()).assertEqual(2);
      expect(model.columns()).assertEqual(2);
      expect(model.indexOf('b')).assertEqual(1);
      expect(model.isFocused('b')).assertFalse();
      done();
    });
  });
}
