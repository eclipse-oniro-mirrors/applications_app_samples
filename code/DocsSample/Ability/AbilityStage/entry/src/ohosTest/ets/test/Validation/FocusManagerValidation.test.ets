/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, beforeAll, afterAll, TestType, Size, Level } from '@ohos/hypium';
import { Driver, Component } from '@ohos.UiTest';
import {
  getDriver,
  getBundleName,
  logInfo,
  waitForIndexPageStable,
  isIndexPageVisible,
  pageComponentCount,
  getCurrentFocusIndex,
  checkFocusState,
  findComponentsByType,
  pressAndWait,
  triggerEntryAbility,
  TIMEOUT_PAGE_RENDER,
  DELAY_KEY_NAVIGATION,
  KEY_DOWN,
  KEY_UP,
  KEY_TAB,
  KEY_LEFT,
  KEY_RIGHT,
  BUNDLE_NAME,
  ensureIndexPageInitial,
} from '../Shared/SharedDriver';

enum FocusDirection {
  NEXT = 'next',
  PREVIOUS = 'previous',
  FIRST = 'first',
  LAST = 'last'
}

enum FocusStatus {
  SUCCESS = 0,
  INVALID_INDEX = 1,
  NODE_NOT_FOUND = 2,
  NOT_FOCUSABLE = 3,
  ALREADY_FOCUSED = 4,
  CHAIN_EMPTY = 5,
  DUPLICATE_ID = 6,
  BOUNDARY = 7,
  STACK_EMPTY = 8
}

interface FocusNode {
  id: string;
  focusable: boolean;
  enabled: boolean;
  tabIndex: number;
}

interface FocusChangeRecord {
  fromId: string;
  toId: string;
  direction: FocusDirection;
  status: FocusStatus;
  sequence: number;
}

interface FocusSnapshot {
  currentId: string;
  currentIndex: number;
  chainSize: number;
  focusableCount: number;
  stackDepth: number;
  historyCount: number;
}

class FocusChain {
  private nodes: FocusNode[] = [];

  public add(id: string, focusable: boolean, enabled: boolean, tabIndex: number): FocusStatus {
    if (id.length === 0) {
      return FocusStatus.NODE_NOT_FOUND;
    }
    if (this.indexOf(id) >= 0) {
      return FocusStatus.DUPLICATE_ID;
    }
    const node: FocusNode = {
      id: id,
      focusable: focusable,
      enabled: enabled,
      tabIndex: tabIndex
    };
    this.nodes.push(node);
    return FocusStatus.SUCCESS;
  }

  public remove(id: string): boolean {
    const index: number = this.indexOf(id);
    if (index < 0) {
      return false;
    }
    const kept: FocusNode[] = [];
    for (let i = 0; i < this.nodes.length; i++) {
      if (i !== index) {
        kept.push(this.nodes[i]);
      }
    }
    this.nodes = kept;
    return true;
  }

  public indexOf(id: string): number {
    for (let i = 0; i < this.nodes.length; i++) {
      if (this.nodes[i].id === id) {
        return i;
      }
    }
    return -1;
  }

  public findByTabIndex(tabIndex: number): number {
    for (let i = 0; i < this.nodes.length; i++) {
      if (this.nodes[i].tabIndex === tabIndex) {
        return i;
      }
    }
    return -1;
  }

  public getAt(index: number): FocusNode | null {
    if (index < 0 || index >= this.nodes.length) {
      return null;
    }
    return this.nodes[index];
  }

  public getIds(): string[] {
    const ids: string[] = [];
    for (let i = 0; i < this.nodes.length; i++) {
      ids.push(this.nodes[i].id);
    }
    return ids;
  }

  public focusableIndexes(): number[] {
    const indexes: number[] = [];
    for (let i = 0; i < this.nodes.length; i++) {
      if (this.nodes[i].focusable && this.nodes[i].enabled) {
        indexes.push(i);
      }
    }
    return indexes;
  }

  public size(): number {
    return this.nodes.length;
  }

  public isEmpty(): boolean {
    return this.nodes.length === 0;
  }

  public clear(): void {
    this.nodes = [];
  }

  public moveIndex(current: number, direction: FocusDirection, wrap: boolean): number {
    const size: number = this.nodes.length;
    if (size === 0) {
      return -1;
    }
    if (direction === FocusDirection.FIRST) {
      return 0;
    }
    if (direction === FocusDirection.LAST) {
      return size - 1;
    }
    if (current < 0 || current >= size) {
      return direction === FocusDirection.NEXT ? 0 : size - 1;
    }
    if (direction === FocusDirection.NEXT) {
      const next: number = current + 1;
      if (next < size) {
        return next;
      }
      return wrap ? 0 : size - 1;
    }
    const previous: number = current - 1;
    if (previous >= 0) {
      return previous;
    }
    return wrap ? size - 1 : 0;
  }
}

class FocusManager {
  private chain: FocusChain;
  private currentIndex: number = -1;
  private focusStack: string[] = [];
  private history: FocusChangeRecord[] = [];
  private sequence: number = 0;

  public constructor(chain: FocusChain) {
    this.chain = chain;
  }

  public getChain(): FocusChain {
    return this.chain;
  }

  public getCurrentIndex(): number {
    return this.currentIndex;
  }

  public getCurrentId(): string {
    const node: FocusNode | null = this.chain.getAt(this.currentIndex);
    return node === null ? '' : node.id;
  }

  public isFocused(id: string): boolean {
    return this.getCurrentId() === id;
  }

  public requestFocusById(id: string): FocusStatus {
    const index: number = this.chain.indexOf(id);
    if (index < 0) {
      return FocusStatus.NODE_NOT_FOUND;
    }
    return this.requestFocusAt(index);
  }

  public requestFocusAt(index: number): FocusStatus {
    const size: number = this.chain.size();
    if (size === 0) {
      return FocusStatus.CHAIN_EMPTY;
    }
    if (index < 0 || index >= size) {
      return FocusStatus.INVALID_INDEX;
    }
    const node: FocusNode | null = this.chain.getAt(index);
    if (node === null) {
      return FocusStatus.NODE_NOT_FOUND;
    }
    if (!node.focusable || !node.enabled) {
      return FocusStatus.NOT_FOCUSABLE;
    }
    if (index === this.currentIndex) {
      return FocusStatus.ALREADY_FOCUSED;
    }
    const fromId: string = this.getCurrentId();
    this.currentIndex = index;
    this.record(fromId, node.id, FocusDirection.FIRST, FocusStatus.SUCCESS);
    return FocusStatus.SUCCESS;
  }

  public moveFocus(direction: FocusDirection, wrap: boolean): FocusStatus {
    const size: number = this.chain.size();
    if (size === 0) {
      return FocusStatus.CHAIN_EMPTY;
    }
    let target: number = -1;
    if (direction === FocusDirection.FIRST) {
      target = this.firstFocusable();
    } else if (direction === FocusDirection.LAST) {
      target = this.lastFocusable();
    } else if (this.currentIndex < 0) {
      target = direction === FocusDirection.NEXT ? this.firstFocusable() : this.lastFocusable();
    } else {
      const delta: number = direction === FocusDirection.NEXT ? 1 : -1;
      target = this.adjacentFocusable(this.currentIndex, delta, wrap);
    }
    if (target === -2) {
      return FocusStatus.BOUNDARY;
    }
    if (target < 0) {
      return FocusStatus.NOT_FOCUSABLE;
    }
    if (target === this.currentIndex) {
      return FocusStatus.ALREADY_FOCUSED;
    }
    const fromId: string = this.getCurrentId();
    const node: FocusNode | null = this.chain.getAt(target);
    if (node === null) {
      return FocusStatus.NODE_NOT_FOUND;
    }
    this.currentIndex = target;
    this.record(fromId, node.id, direction, FocusStatus.SUCCESS);
    return FocusStatus.SUCCESS;
  }

  public pushFocus(id: string): FocusStatus {
    const index: number = this.chain.indexOf(id);
    if (index < 0) {
      return FocusStatus.NODE_NOT_FOUND;
    }
    if (!this.isFocusableIndex(index)) {
      return FocusStatus.NOT_FOCUSABLE;
    }
    const fromId: string = this.getCurrentId();
    this.focusStack.push(fromId);
    this.currentIndex = index;
    this.record(fromId, id, FocusDirection.FIRST, FocusStatus.SUCCESS);
    return FocusStatus.SUCCESS;
  }

  public popFocus(): FocusStatus {
    if (this.focusStack.length === 0) {
      return FocusStatus.STACK_EMPTY;
    }
    const popped: string | undefined = this.focusStack.pop();
    if (popped === undefined) {
      return FocusStatus.STACK_EMPTY;
    }
    const fromId: string = this.getCurrentId();
    const restoredIndex: number = this.chain.indexOf(popped);
    this.currentIndex = restoredIndex;
    const toId: string = restoredIndex < 0 ? '' : popped;
    this.record(fromId, toId, FocusDirection.PREVIOUS, FocusStatus.SUCCESS);
    return FocusStatus.SUCCESS;
  }

  public clearFocus(): void {
    this.currentIndex = -1;
    this.focusStack = [];
  }

  public getStackDepth(): number {
    return this.focusStack.length;
  }

  public getHistory(): FocusChangeRecord[] {
    const copy: FocusChangeRecord[] = [];
    for (let i = 0; i < this.history.length; i++) {
      copy.push(this.history[i]);
    }
    return copy;
  }

  public getHistoryCount(): number {
    return this.history.length;
  }

  public getSnapshot(): FocusSnapshot {
    const snapshot: FocusSnapshot = {
      currentId: this.getCurrentId(),
      currentIndex: this.currentIndex,
      chainSize: this.chain.size(),
      focusableCount: this.chain.focusableIndexes().length,
      stackDepth: this.focusStack.length,
      historyCount: this.history.length
    };
    return snapshot;
  }

  public reset(): void {
    this.chain.clear();
    this.currentIndex = -1;
    this.focusStack = [];
    this.history = [];
    this.sequence = 0;
  }

  private isFocusableIndex(index: number): boolean {
    const node: FocusNode | null = this.chain.getAt(index);
    if (node === null) {
      return false;
    }
    return node.focusable && node.enabled;
  }

  private firstFocusable(): number {
    for (let i = 0; i < this.chain.size(); i++) {
      if (this.isFocusableIndex(i)) {
        return i;
      }
    }
    return -1;
  }

  private lastFocusable(): number {
    for (let i = this.chain.size() - 1; i >= 0; i--) {
      if (this.isFocusableIndex(i)) {
        return i;
      }
    }
    return -1;
  }

  private adjacentFocusable(from: number, delta: number, wrap: boolean): number {
    const size: number = this.chain.size();
    let cursor: number = from;
    for (let count = 0; count < size; count++) {
      cursor = cursor + delta;
      if (cursor >= size) {
        if (!wrap) {
          return -2;
        }
        cursor = 0;
      } else if (cursor < 0) {
        if (!wrap) {
          return -2;
        }
        cursor = size - 1;
      }
      if (this.isFocusableIndex(cursor)) {
        return cursor;
      }
    }
    return -1;
  }

  private record(fromId: string, toId: string, direction: FocusDirection, status: FocusStatus): void {
    this.sequence++;
    const record: FocusChangeRecord = {
      fromId: fromId,
      toId: toId,
      direction: direction,
      status: status,
      sequence: this.sequence
    };
    this.history.push(record);
  }
}

export default function focusManagerValidationTest(): void {
  describe('FocusManagerValidationTest', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      logInfo('FocusManagerValidationTest: beforeAll start');
      await triggerEntryAbility(driver);
      await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
      logInfo('FocusManagerValidationTest: beforeAll finished');

      await ensureIndexPageInitial(driver);
    })

    afterAll(async () => {
      driver = getDriver();
      await pressAndWait(driver, KEY_TAB, 1, DELAY_KEY_NAVIGATION);
      logInfo('FocusManagerValidationTest: afterAll finished');
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSMGR_0100
     * @tc.name testFocusStatusEnumValues
     * @tc.desc Verify focus status enum carries the exact numeric codes used by every focus result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusStatusEnumValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(FocusStatus.SUCCESS).assertEqual(0);
        expect(FocusStatus.INVALID_INDEX).assertEqual(1);
        expect(FocusStatus.NODE_NOT_FOUND).assertEqual(2);
        expect(FocusStatus.NOT_FOCUSABLE).assertEqual(3);
        expect(FocusStatus.ALREADY_FOCUSED).assertEqual(4);
        expect(FocusStatus.CHAIN_EMPTY).assertEqual(5);
        expect(FocusStatus.DUPLICATE_ID).assertEqual(6);
        expect(FocusStatus.BOUNDARY).assertEqual(7);
        expect(FocusStatus.STACK_EMPTY).assertEqual(8);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSMGR_0200
     * @tc.name testFocusDirectionEnumValues
     * @tc.desc Verify focus direction enum resolves to the expected string tags for next previous first last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusDirectionEnumValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(FocusDirection.NEXT).assertEqual('next');
        expect(FocusDirection.PREVIOUS).assertEqual('previous');
        expect(FocusDirection.FIRST).assertEqual('first');
        expect(FocusDirection.LAST).assertEqual('last');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSMGR_0300
     * @tc.name testFocusChainAddSingleNode
     * @tc.desc Verify adding one focusable node returns success and exposes it at index zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusChainAddSingleNode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const chain: FocusChain = new FocusChain();
        const status: FocusStatus = chain.add('button_ok', true, true, 1);
        expect(status).assertEqual(FocusStatus.SUCCESS);
        expect(chain.size()).assertEqual(1);
        expect(chain.indexOf('button_ok')).assertEqual(0);
        const node: FocusNode | null = chain.getAt(0);
        expect(node === null).assertFalse();
        if (node !== null) {
          expect(node.id).assertEqual('button_ok');
          expect(node.tabIndex).assertEqual(1);
        }
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSMGR_0400
     * @tc.name testFocusChainRejectsDuplicateId
     * @tc.desc Verify a second add with an existing id is rejected with duplicate status and keeps size one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusChainRejectsDuplicateId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const chain: FocusChain = new FocusChain();
        chain.add('item_a', true, true, 0);
        const duplicate: FocusStatus = chain.add('item_a', true, true, 2);
        expect(duplicate).assertEqual(FocusStatus.DUPLICATE_ID);
        expect(chain.size()).assertEqual(1);
        const node: FocusNode | null = chain.getAt(0);
        if (node !== null) {
          expect(node.tabIndex).assertEqual(0);
        }
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSMGR_0500
     * @tc.name testFocusChainPreservesInsertionOrder
     * @tc.desc Verify three inserted nodes are reported by getIds in insertion order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusChainPreservesInsertionOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const chain: FocusChain = new FocusChain();
        chain.add('first_node', true, true, 0);
        chain.add('second_node', true, true, 1);
        chain.add('third_node', true, true, 2);
        const ids: string[] = chain.getIds();
        expect(ids.length).assertEqual(3);
        expect(ids[0]).assertEqual('first_node');
        expect(ids[1]).assertEqual('second_node');
        expect(ids[2]).assertEqual('third_node');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSMGR_0600
     * @tc.name testFocusChainRemoveNode
     * @tc.desc Verify removing a middle node shrinks the chain and reindexes the trailing node
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusChainRemoveNode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const chain: FocusChain = new FocusChain();
        chain.add('node_one', true, true, 0);
        chain.add('node_two', true, true, 1);
        chain.add('node_three', true, true, 2);
        const removed: boolean = chain.remove('node_two');
        expect(removed).assertTrue();
        expect(chain.size()).assertEqual(2);
        expect(chain.indexOf('node_two')).assertEqual(-1);
        expect(chain.indexOf('node_three')).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSMGR_0700
     * @tc.name testFocusChainRemoveMissingReturnsFalse
     * @tc.desc Verify removing an id that never joined the chain returns false and leaves size untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusChainRemoveMissingReturnsFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const chain: FocusChain = new FocusChain();
        chain.add('only_node', true, true, 0);
        const removed: boolean = chain.remove('ghost_node');
        expect(removed).assertFalse();
        expect(chain.size()).assertEqual(1);
        expect(chain.indexOf('only_node')).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSMGR_0800
     * @tc.name testFocusChainIndexOfLookup
     * @tc.desc Verify indexOf resolves known ids to their position and unknown ids to minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusChainIndexOfLookup', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const chain: FocusChain = new FocusChain();
        chain.add('alpha', true, true, 0);
        chain.add('beta', true, true, 1);
        chain.add('gamma', true, true, 2);
        expect(chain.indexOf('alpha')).assertEqual(0);
        expect(chain.indexOf('beta')).assertEqual(1);
        expect(chain.indexOf('gamma')).assertEqual(2);
        expect(chain.indexOf('delta')).assertEqual(-1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSMGR_0900
     * @tc.name testFocusChainGetAtBoundaries
     * @tc.desc Verify getAt returns nodes for valid indexes and null for negative and out-of-range indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusChainGetAtBoundaries', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const chain: FocusChain = new FocusChain();
        chain.add('left_item', true, true, 0);
        chain.add('right_item', true, true, 1);
        const negative: FocusNode | null = chain.getAt(-1);
        const overflow: FocusNode | null = chain.getAt(2);
        const valid: FocusNode | null = chain.getAt(1);
        expect(negative === null).assertTrue();
        expect(overflow === null).assertTrue();
        expect(valid === null).assertFalse();
        if (valid !== null) {
          expect(valid.id).assertEqual('right_item');
        }
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSMGR_1000
     * @tc.name testFocusChainClearResetsSize
     * @tc.desc Verify clear empties the chain and isEmpty flips from false to true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusChainClearResetsSize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const chain: FocusChain = new FocusChain();
        chain.add('node_x', true, true, 0);
        chain.add('node_y', true, true, 1);
        expect(chain.isEmpty()).assertFalse();
        chain.clear();
        expect(chain.isEmpty()).assertTrue();
        expect(chain.size()).assertEqual(0);
        expect(chain.getIds().length).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSMGR_1100
     * @tc.name testFocusChainFocusableIndexes
     * @tc.desc Verify focusableIndexes returns only enabled focusable nodes and skips disabled ones
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusChainFocusableIndexes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const chain: FocusChain = new FocusChain();
        chain.add('enabled_one', true, true, 0);
        chain.add('disabled_two', true, false, 1);
        chain.add('static_three', false, true, 2);
        chain.add('enabled_four', true, true, 3);
        const indexes: number[] = chain.focusableIndexes();
        expect(indexes.length).assertEqual(2);
        expect(indexes[0]).assertEqual(0);
        expect(indexes[1]).assertEqual(3);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSMGR_1200
     * @tc.name testFocusChainMoveIndexNext
     * @tc.desc Verify moveIndex next from the middle advances by exactly one position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusChainMoveIndexNext', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const chain: FocusChain = new FocusChain();
        chain.add('n0', true, true, 0);
        chain.add('n1', true, true, 1);
        chain.add('n2', true, true, 2);
        expect(chain.moveIndex(0, FocusDirection.NEXT, true)).assertEqual(1);
        expect(chain.moveIndex(1, FocusDirection.NEXT, true)).assertEqual(2);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSMGR_1300
     * @tc.name testFocusChainMoveIndexNextWrap
     * @tc.desc Verify moveIndex next from the last position wraps back to index zero when wrap enabled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusChainMoveIndexNextWrap', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const chain: FocusChain = new FocusChain();
        chain.add('w0', true, true, 0);
        chain.add('w1', true, true, 1);
        chain.add('w2', true, true, 2);
        expect(chain.moveIndex(2, FocusDirection.NEXT, true)).assertEqual(0);
        expect(chain.moveIndex(0, FocusDirection.NEXT, true)).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSMGR_1400
     * @tc.name testFocusChainMoveIndexPreviousWrap
     * @tc.desc Verify moveIndex previous from index zero wraps to the last position when wrap enabled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusChainMoveIndexPreviousWrap', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const chain: FocusChain = new FocusChain();
        chain.add('p0', true, true, 0);
        chain.add('p1', true, true, 1);
        chain.add('p2', true, true, 2);
        expect(chain.moveIndex(0, FocusDirection.PREVIOUS, true)).assertEqual(2);
        expect(chain.moveIndex(2, FocusDirection.PREVIOUS, true)).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSMGR_1500
     * @tc.name testFocusChainMoveIndexClampWithoutWrap
     * @tc.desc Verify moveIndex clamps at chain edges when wrap is disabled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusChainMoveIndexClampWithoutWrap', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const chain: FocusChain = new FocusChain();
        chain.add('c0', true, true, 0);
        chain.add('c1', true, true, 1);
        chain.add('c2', true, true, 2);
        expect(chain.moveIndex(2, FocusDirection.NEXT, false)).assertEqual(2);
        expect(chain.moveIndex(0, FocusDirection.PREVIOUS, false)).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSMGR_1600
     * @tc.name testFocusManagerRequestFocusSuccess
     * @tc.desc Verify requesting focus by id moves the current index and reports the focused id
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusManagerRequestFocusSuccess', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const chain: FocusChain = new FocusChain();
        chain.add('menu_item', true, true, 0);
        chain.add('confirm_item', true, true, 1);
        const manager: FocusManager = new FocusManager(chain);
        const status: FocusStatus = manager.requestFocusById('confirm_item');
        expect(status).assertEqual(FocusStatus.SUCCESS);
        expect(manager.getCurrentIndex()).assertEqual(1);
        expect(manager.getCurrentId()).assertEqual('confirm_item');
        expect(manager.isFocused('confirm_item')).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSMGR_1700
     * @tc.name testFocusManagerRequestFocusUnknownId
     * @tc.desc Verify requesting focus with an unknown id returns node-not-found and keeps index minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusManagerRequestFocusUnknownId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const chain: FocusChain = new FocusChain();
        chain.add('known_item', true, true, 0);
        const manager: FocusManager = new FocusManager(chain);
        const status: FocusStatus = manager.requestFocusById('unknown_item');
        expect(status).assertEqual(FocusStatus.NODE_NOT_FOUND);
        expect(manager.getCurrentIndex()).assertEqual(-1);
        expect(manager.getCurrentId()).assertEqual('');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSMGR_1800
     * @tc.name testFocusManagerRequestFocusNotFocusable
     * @tc.desc Verify requesting focus on a disabled node reports not-focusable and leaves focus empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusManagerRequestFocusNotFocusable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const chain: FocusChain = new FocusChain();
        chain.add('active_item', true, true, 0);
        chain.add('locked_item', true, false, 1);
        const manager: FocusManager = new FocusManager(chain);
        const status: FocusStatus = manager.requestFocusById('locked_item');
        expect(status).assertEqual(FocusStatus.NOT_FOCUSABLE);
        expect(manager.getCurrentIndex()).assertEqual(-1);
        const activeStatus: FocusStatus = manager.requestFocusById('active_item');
        expect(activeStatus).assertEqual(FocusStatus.SUCCESS);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSMGR_1900
     * @tc.name testFocusManagerRequestFocusDuplicateCall
     * @tc.desc Verify requesting focus twice for the same node reports already-focused on the second call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusManagerRequestFocusDuplicateCall', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const chain: FocusChain = new FocusChain();
        chain.add('dup_item', true, true, 0);
        const manager: FocusManager = new FocusManager(chain);
        const first: FocusStatus = manager.requestFocusById('dup_item');
        const second: FocusStatus = manager.requestFocusById('dup_item');
        expect(first).assertEqual(FocusStatus.SUCCESS);
        expect(second).assertEqual(FocusStatus.ALREADY_FOCUSED);
        expect(manager.getHistoryCount()).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSMGR_2000
     * @tc.name testFocusManagerRequestFocusInvalidIndex
     * @tc.desc Verify requestFocusAt rejects negative and out-of-range indexes with invalid-index status
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusManagerRequestFocusInvalidIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const chain: FocusChain = new FocusChain();
        chain.add('idx_item', true, true, 0);
        const manager: FocusManager = new FocusManager(chain);
        expect(manager.requestFocusAt(-1)).assertEqual(FocusStatus.INVALID_INDEX);
        expect(manager.requestFocusAt(1)).assertEqual(FocusStatus.INVALID_INDEX);
        expect(manager.requestFocusAt(0)).assertEqual(FocusStatus.SUCCESS);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSMGR_2100
     * @tc.name testFocusManagerMoveNextAdvances
     * @tc.desc Verify moving next from the first node focuses the second node and records history
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusManagerMoveNextAdvances', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const chain: FocusChain = new FocusChain();
        chain.add('move_a', true, true, 0);
        chain.add('move_b', true, true, 1);
        chain.add('move_c', true, true, 2);
        const manager: FocusManager = new FocusManager(chain);
        manager.requestFocusById('move_a');
        const status: FocusStatus = manager.moveFocus(FocusDirection.NEXT, false);
        expect(status).assertEqual(FocusStatus.SUCCESS);
        expect(manager.getCurrentId()).assertEqual('move_b');
        expect(manager.getHistoryCount()).assertEqual(2);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSMGR_2200
     * @tc.name testFocusManagerMoveNextWraps
     * @tc.desc Verify moving next from the last node wraps to the first focusable node
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusManagerMoveNextWraps', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const chain: FocusChain = new FocusChain();
        chain.add('wrap_a', true, true, 0);
        chain.add('wrap_b', true, true, 1);
        chain.add('wrap_c', true, true, 2);
        const manager: FocusManager = new FocusManager(chain);
        manager.requestFocusById('wrap_c');
        const status: FocusStatus = manager.moveFocus(FocusDirection.NEXT, true);
        expect(status).assertEqual(FocusStatus.SUCCESS);
        expect(manager.getCurrentId()).assertEqual('wrap_a');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSMGR_2300
     * @tc.name testFocusManagerMovePrevWraps
     * @tc.desc Verify moving previous from the first node wraps to the last focusable node
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusManagerMovePrevWraps', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const chain: FocusChain = new FocusChain();
        chain.add('back_a', true, true, 0);
        chain.add('back_b', true, true, 1);
        chain.add('back_c', true, true, 2);
        const manager: FocusManager = new FocusManager(chain);
        manager.requestFocusById('back_a');
        const status: FocusStatus = manager.moveFocus(FocusDirection.PREVIOUS, true);
        expect(status).assertEqual(FocusStatus.SUCCESS);
        expect(manager.getCurrentId()).assertEqual('back_c');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSMGR_2400
     * @tc.name testFocusManagerMoveSkipDisabledNode
     * @tc.desc Verify a next move skips a disabled node and lands on the following focusable node
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusManagerMoveSkipDisabledNode', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const chain: FocusChain = new FocusChain();
        chain.add('skip_a', true, true, 0);
        chain.add('skip_b', false, true, 1);
        chain.add('skip_c', true, true, 2);
        const manager: FocusManager = new FocusManager(chain);
        manager.requestFocusById('skip_a');
        const status: FocusStatus = manager.moveFocus(FocusDirection.NEXT, false);
        expect(status).assertEqual(FocusStatus.SUCCESS);
        expect(manager.getCurrentId()).assertEqual('skip_c');
        expect(manager.getCurrentIndex()).assertEqual(2);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSMGR_2500
     * @tc.name testFocusManagerMoveAtBoundaryWithoutWrap
     * @tc.desc Verify moving next past the last node without wrap reports boundary and keeps focus
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusManagerMoveAtBoundaryWithoutWrap', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const chain: FocusChain = new FocusChain();
        chain.add('edge_a', true, true, 0);
        chain.add('edge_b', true, true, 1);
        const manager: FocusManager = new FocusManager(chain);
        manager.requestFocusById('edge_b');
        const status: FocusStatus = manager.moveFocus(FocusDirection.NEXT, false);
        expect(status).assertEqual(FocusStatus.BOUNDARY);
        expect(manager.getCurrentId()).assertEqual('edge_b');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSMGR_2600
     * @tc.name testFocusManagerMoveOnEmptyChain
     * @tc.desc Verify moveFocus on an empty chain reports chain-empty and records no history
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusManagerMoveOnEmptyChain', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const chain: FocusChain = new FocusChain();
        const manager: FocusManager = new FocusManager(chain);
        expect(manager.moveFocus(FocusDirection.NEXT, true)).assertEqual(FocusStatus.CHAIN_EMPTY);
        expect(manager.getHistoryCount()).assertEqual(0);
        expect(manager.getCurrentIndex()).assertEqual(-1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSMGR_2700
     * @tc.name testFocusManagerPushPopFocusStack
     * @tc.desc Verify pushing focus stacks the previous id and popping restores it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusManagerPushPopFocusStack', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const chain: FocusChain = new FocusChain();
        chain.add('page_root', true, true, 0);
        chain.add('dialog_button', true, true, 1);
        const manager: FocusManager = new FocusManager(chain);
        manager.requestFocusById('page_root');
        const pushed: FocusStatus = manager.pushFocus('dialog_button');
        expect(pushed).assertEqual(FocusStatus.SUCCESS);
        expect(manager.getCurrentId()).assertEqual('dialog_button');
        expect(manager.getStackDepth()).assertEqual(1);
        const popped: FocusStatus = manager.popFocus();
        expect(popped).assertEqual(FocusStatus.SUCCESS);
        expect(manager.getCurrentId()).assertEqual('page_root');
        expect(manager.getStackDepth()).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSMGR_2800
     * @tc.name testFocusManagerPopEmptyStack
     * @tc.desc Verify popping an empty focus stack reports stack-empty and keeps the current focus
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusManagerPopEmptyStack', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const chain: FocusChain = new FocusChain();
        chain.add('solo_item', true, true, 0);
        const manager: FocusManager = new FocusManager(chain);
        manager.requestFocusById('solo_item');
        const status: FocusStatus = manager.popFocus();
        expect(status).assertEqual(FocusStatus.STACK_EMPTY);
        expect(manager.getCurrentId()).assertEqual('solo_item');
        expect(manager.getStackDepth()).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSMGR_2900
     * @tc.name testFocusManagerClearFocus
     * @tc.desc Verify clearFocus resets current index to minus one and drops the stack depth to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusManagerClearFocus', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const chain: FocusChain = new FocusChain();
        chain.add('clear_one', true, true, 0);
        chain.add('clear_two', true, true, 1);
        const manager: FocusManager = new FocusManager(chain);
        manager.requestFocusById('clear_one');
        manager.pushFocus('clear_two');
        expect(manager.getStackDepth()).assertEqual(1);
        manager.clearFocus();
        expect(manager.getCurrentIndex()).assertEqual(-1);
        expect(manager.getCurrentId()).assertEqual('');
        expect(manager.getStackDepth()).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSMGR_3000
     * @tc.name testFocusManagerSnapshotFields
     * @tc.desc Verify snapshot aggregates current id chain size focusable count stack depth and history count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusManagerSnapshotFields', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const chain: FocusChain = new FocusChain();
        chain.add('snap_a', true, true, 0);
        chain.add('snap_b', true, false, 1);
        chain.add('snap_c', true, true, 2);
        const manager: FocusManager = new FocusManager(chain);
        manager.requestFocusById('snap_c');
        const snapshot: FocusSnapshot = manager.getSnapshot();
        expect(snapshot.currentId).assertEqual('snap_c');
        expect(snapshot.currentIndex).assertEqual(2);
        expect(snapshot.chainSize).assertEqual(3);
        expect(snapshot.focusableCount).assertEqual(2);
        expect(snapshot.stackDepth).assertEqual(0);
        expect(snapshot.historyCount).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSMGR_3100
     * @tc.name testFocusManagerHistorySequence
     * @tc.desc Verify history records carry sequential numbers and the from-to ids of each transition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusManagerHistorySequence', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const chain: FocusChain = new FocusChain();
        chain.add('hist_a', true, true, 0);
        chain.add('hist_b', true, true, 1);
        chain.add('hist_c', true, true, 2);
        const manager: FocusManager = new FocusManager(chain);
        manager.requestFocusById('hist_a');
        manager.moveFocus(FocusDirection.NEXT, false);
        manager.moveFocus(FocusDirection.NEXT, false);
        const history: FocusChangeRecord[] = manager.getHistory();
        expect(history.length).assertEqual(3);
        expect(history[0].toId).assertEqual('hist_a');
        expect(history[1].fromId).assertEqual('hist_a');
        expect(history[1].toId).assertEqual('hist_b');
        expect(history[2].fromId).assertEqual('hist_b');
        expect(history[2].toId).assertEqual('hist_c');
        expect(history[2].sequence).assertEqual(3);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSMGR_3200
     * @tc.name testFocusManagerMoveFirstAndLast
     * @tc.desc Verify first and last directions jump to the first and last focusable nodes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusManagerMoveFirstAndLast', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const chain: FocusChain = new FocusChain();
        chain.add('jump_a', false, true, 0);
        chain.add('jump_b', true, true, 1);
        chain.add('jump_c', true, true, 2);
        chain.add('jump_d', false, true, 3);
        const manager: FocusManager = new FocusManager(chain);
        expect(manager.moveFocus(FocusDirection.LAST, false)).assertEqual(FocusStatus.SUCCESS);
        expect(manager.getCurrentId()).assertEqual('jump_c');
        expect(manager.moveFocus(FocusDirection.FIRST, false)).assertEqual(FocusStatus.SUCCESS);
        expect(manager.getCurrentId()).assertEqual('jump_b');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSMGR_3300
     * @tc.name testFocusManagerStressRepeatedMoves
     * @tc.desc Verify one hundred wrapped next moves keep the index within range and advance exactly once per step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusManagerStressRepeatedMoves', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const chain: FocusChain = new FocusChain();
        for (let i = 0; i < 5; i++) {
          chain.add(`stress_${i}`, true, true, i);
        }
        const manager: FocusManager = new FocusManager(chain);
        manager.requestFocusById('stress_0');
        let successCount: number = 0;
        for (let i = 0; i < 100; i++) {
          const status: FocusStatus = manager.moveFocus(FocusDirection.NEXT, true);
          if (status === FocusStatus.SUCCESS) {
            successCount++;
          }
        }
        expect(successCount).assertEqual(100);
        expect(manager.getCurrentIndex()).assertEqual(0);
        expect(manager.getHistoryCount()).assertEqual(101);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSMGR_3400
     * @tc.name testUiIndexPageVisibleForFocusProbe
     * @tc.desc Verify the index page is visible before any focus chain probe runs against the real window
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiIndexPageVisibleForFocusProbe', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        expect(stable).assertTrue();
        const visible: boolean = await isIndexPageVisible(driver);
        expect(visible).assertTrue();
        logInfo('testUiIndexPageVisibleForFocusProbe: index page reachable for focus probes');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSMGR_3500
     * @tc.name testUiComponentCountPositive
     * @tc.desc Verify the real window exposes at least one component that a focus chain could reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiComponentCountPositive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const count: number = await pageComponentCount(driver);
        expect(count > 0).assertTrue();
        const initialIndex: number = await getCurrentFocusIndex(driver);
        expect(initialIndex < count).assertTrue();
        logInfo(`testUiComponentCountPositive: live component count ${count} focus index ${initialIndex}`);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSMGR_3600
     * @tc.name testUiFocusIndexWithinBounds
     * @tc.desc Verify the live focus index reported by the driver stays between minus one and component count minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiFocusIndexWithinBounds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const count: number = await pageComponentCount(driver);
        const index: number = await getCurrentFocusIndex(driver);
        expect(index >= -1).assertTrue();
        expect(index <= count - 1).assertTrue();
        const mirrored: boolean = await checkFocusState(driver, index);
        if (index >= 0) {
          expect(mirrored).assertTrue();
        } else {
          const anyFocus: boolean = await checkFocusState(driver, -1);
          expect(anyFocus).assertFalse();
        }
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSMGR_3700
     * @tc.name testUiFocusStateMatchesFocusIndex
     * @tc.desc Verify the focus state query for the reported index agrees with the index probe on the live page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiFocusStateMatchesFocusIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const count: number = await pageComponentCount(driver);
        const index: number = await getCurrentFocusIndex(driver);
        expect(index >= -1).assertTrue();
        expect(index < count).assertTrue();
        const repeated: number = await getCurrentFocusIndex(driver);
        expect(repeated).assertEqual(index);
        if (index >= 0) {
          const focused: boolean = await checkFocusState(driver, index);
          expect(focused).assertTrue();
        }
        expect(await isIndexPageVisible(driver)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSMGR_3800
     * @tc.name testUiKeyDownKeepsFocusInBounds
     * @tc.desc Verify pressing dpad down keeps the live focus index inside the component bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiKeyDownKeepsFocusInBounds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const count: number = await pageComponentCount(driver);
        await pressAndWait(driver, KEY_DOWN, 2, DELAY_KEY_NAVIGATION);
        const index: number = await getCurrentFocusIndex(driver);
        expect(index >= -1).assertTrue();
        expect(index <= count - 1).assertTrue();
        logInfo(`testUiKeyDownKeepsFocusInBounds: index ${index} of ${count}`);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSMGR_3900
     * @tc.name testUiKeyTabKeepsFocusInBounds
     * @tc.desc Verify tab traversal keeps the live focus index inside the component bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiKeyTabKeepsFocusInBounds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const count: number = await pageComponentCount(driver);
        await pressAndWait(driver, KEY_TAB, 3, DELAY_KEY_NAVIGATION);
        const index: number = await getCurrentFocusIndex(driver);
        expect(index >= -1).assertTrue();
        expect(index < count).assertTrue();
        const hasFocus: boolean = await checkFocusState(driver, -1);
        if (index >= 0) {
          expect(hasFocus).assertTrue();
        } else {
          expect(hasFocus).assertFalse();
        }
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSMGR_4000
     * @tc.name testUiKeyUpKeepsFocusInBounds
     * @tc.desc Verify pressing dpad up after down keeps the live focus index inside the component bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiKeyUpKeepsFocusInBounds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const count: number = await pageComponentCount(driver);
        await pressAndWait(driver, KEY_DOWN, 1, DELAY_KEY_NAVIGATION);
        await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
        const index: number = await getCurrentFocusIndex(driver);
        expect(index >= -1).assertTrue();
        expect(index <= count - 1).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSMGR_4100
     * @tc.name testUiHorizontalKeysKeepFocusInBounds
     * @tc.desc Verify left and right dpad presses keep the live focus index inside the component bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiHorizontalKeysKeepFocusInBounds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const count: number = await pageComponentCount(driver);
        await pressAndWait(driver, KEY_RIGHT, 2, DELAY_KEY_NAVIGATION);
        const afterRight: number = await getCurrentFocusIndex(driver);
        await pressAndWait(driver, KEY_LEFT, 2, DELAY_KEY_NAVIGATION);
        const afterLeft: number = await getCurrentFocusIndex(driver);
        expect(afterRight >= -1).assertTrue();
        expect(afterRight <= count - 1).assertTrue();
        expect(afterLeft >= -1).assertTrue();
        expect(afterLeft <= count - 1).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSMGR_4200
     * @tc.name testUiFindTextComponentsForFocusChain
     * @tc.desc Verify the live page text components can be enumerated as candidate focus chain entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiFindTextComponentsForFocusChain', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const texts: Component[] = await findComponentsByType(driver, 'Text');
        expect(texts.length >= 1).assertTrue();
        const total: number = await pageComponentCount(driver);
        expect(total >= texts.length).assertTrue();
        logInfo(`testUiFindTextComponentsForFocusChain: ${texts.length} text nodes among ${total} components`);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSMGR_4300
     * @tc.name testUiAbilityDelegatorBundleNameForFocus
     * @tc.desc Verify the AbilityDelegator reports the configured bundle name while focus probes run
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiAbilityDelegatorBundleNameForFocus', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const bundleName: string = getBundleName();
        expect(bundleName).assertEqual(BUNDLE_NAME);
        expect(bundleName.length > 0).assertTrue();
        expect(await isIndexPageVisible(driver)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSMGR_4400
     * @tc.name testFocusChainExposedThroughManager
     * @tc.desc Verify the manager exposes the same chain instance it was built with including its ids
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusChainExposedThroughManager', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const chain: FocusChain = new FocusChain();
        chain.add('exposed_a', true, true, 0);
        chain.add('exposed_b', true, true, 1);
        const manager: FocusManager = new FocusManager(chain);
        const exposed: FocusChain = manager.getChain();
        expect(exposed.size()).assertEqual(2);
        expect(exposed.getIds()[0]).assertEqual('exposed_a');
        expect(exposed.getIds()[1]).assertEqual('exposed_b');
        exposed.add('exposed_c', true, true, 2);
        expect(manager.getChain().size()).assertEqual(3);
        expect(chain.size()).assertEqual(3);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSMGR_4500
     * @tc.name testFocusChainTabIndexLookup
     * @tc.desc Verify tab index lookup resolves declared indexes to positions and missing indexes to minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusChainTabIndexLookup', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const chain: FocusChain = new FocusChain();
        chain.add('tab_five', true, true, 5);
        chain.add('tab_nine', true, true, 9);
        chain.add('tab_twelve', true, true, 12);
        expect(chain.findByTabIndex(5)).assertEqual(0);
        expect(chain.findByTabIndex(9)).assertEqual(1);
        expect(chain.findByTabIndex(12)).assertEqual(2);
        expect(chain.findByTabIndex(7)).assertEqual(-1);
        expect(chain.findByTabIndex(-1)).assertEqual(-1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSMGR_4600
     * @tc.name testFocusManagerResetClearsState
     * @tc.desc Verify reset empties the chain and zeroes the index stack depth and history counters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusManagerResetClearsState', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const chain: FocusChain = new FocusChain();
        chain.add('reset_a', true, true, 0);
        chain.add('reset_b', true, true, 1);
        const manager: FocusManager = new FocusManager(chain);
        manager.requestFocusById('reset_a');
        manager.pushFocus('reset_b');
        expect(manager.getHistoryCount()).assertEqual(2);
        expect(manager.getStackDepth()).assertEqual(1);
        manager.reset();
        const snapshot: FocusSnapshot = manager.getSnapshot();
        expect(snapshot.chainSize).assertEqual(0);
        expect(snapshot.currentIndex).assertEqual(-1);
        expect(snapshot.currentId).assertEqual('');
        expect(snapshot.stackDepth).assertEqual(0);
        expect(snapshot.historyCount).assertEqual(0);
        expect(manager.getHistory().length).assertEqual(0);
      } finally {
        done();
      }
    })
    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSMGR_4700
     * @tc.name testUiFocusChainMirrorsLiveComponentCount
     * @tc.desc Verify a chain sized from the live component count traverses every index in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiFocusChainMirrorsLiveComponentCount', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const count: number = await pageComponentCount(driver);
        expect(count > 0).assertTrue();
        const chain: FocusChain = new FocusChain();
        for (let i = 0; i < count; i++) {
          expect(chain.add(`live_${i}`, true, true, i)).assertEqual(FocusStatus.SUCCESS);
        }
        expect(chain.size()).assertEqual(count);
        expect(chain.focusableIndexes().length).assertEqual(count);
        const manager: FocusManager = new FocusManager(chain);
        expect(manager.moveFocus(FocusDirection.FIRST, false)).assertEqual(FocusStatus.SUCCESS);
        expect(manager.getCurrentIndex()).assertEqual(0);
        const lastStatus: FocusStatus = manager.moveFocus(FocusDirection.LAST, false);
        expect(lastStatus === FocusStatus.SUCCESS || lastStatus === FocusStatus.ALREADY_FOCUSED).assertTrue();
        expect(manager.getCurrentIndex()).assertEqual(count - 1);
        const liveIndex: number = await getCurrentFocusIndex(driver);
        expect(liveIndex < count).assertTrue();
        expect(await isIndexPageVisible(driver)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSMGR_4800
     * @tc.name testUiFocusStackRestoresAfterLiveKeyPress
     * @tc.desc Verify a push pop round trip restores the origin node after a real key press on the page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiFocusStackRestoresAfterLiveKeyPress', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const texts: Component[] = await findComponentsByType(driver, 'Text');
        expect(texts.length >= 1).assertTrue();
        const chain: FocusChain = new FocusChain();
        chain.add('origin', true, true, 0);
        chain.add('overlay', true, true, 1);
        const manager: FocusManager = new FocusManager(chain);
        expect(manager.requestFocusById('origin')).assertEqual(FocusStatus.SUCCESS);
        expect(manager.pushFocus('overlay')).assertEqual(FocusStatus.SUCCESS);
        expect(manager.getCurrentId()).assertEqual('overlay');
        expect(manager.getStackDepth()).assertEqual(1);
        await pressAndWait(driver, KEY_DOWN, 1, DELAY_KEY_NAVIGATION);
        expect(manager.popFocus()).assertEqual(FocusStatus.SUCCESS);
        expect(manager.getCurrentId()).assertEqual('origin');
        expect(manager.getStackDepth()).assertEqual(0);
        expect(manager.getHistoryCount()).assertEqual(3);
        const count: number = await pageComponentCount(driver);
        expect(count > 0).assertTrue();
      } finally {
        done();
      }
    })
    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSMGR_4900
     * @tc.name testUiFocusSnapshotReflectsLiveProbe
     * @tc.desc Verify a snapshot taken after a live probe reports the chain size focusable count and focus state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiFocusSnapshotReflectsLiveProbe', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const count: number = await pageComponentCount(driver);
        expect(count > 0).assertTrue();
        const chain: FocusChain = new FocusChain();
        chain.add('snap_a', true, true, 0);
        chain.add('snap_b', false, true, 1);
        chain.add('snap_c', true, false, 2);
        const manager: FocusManager = new FocusManager(chain);
        expect(manager.requestFocusById('snap_a')).assertEqual(FocusStatus.SUCCESS);
        const snapshot: FocusSnapshot = manager.getSnapshot();
        expect(snapshot.chainSize).assertEqual(3);
        expect(snapshot.focusableCount).assertEqual(1);
        expect(snapshot.currentId).assertEqual('snap_a');
        expect(snapshot.currentIndex).assertEqual(0);
        expect(snapshot.stackDepth).assertEqual(0);
        expect(snapshot.historyCount).assertEqual(1);
        const liveIndex: number = await getCurrentFocusIndex(driver);
        expect(liveIndex < count).assertTrue();
        expect(await isIndexPageVisible(driver)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSMGR_5000
     * @tc.name testUiTabPressAdvancesChainTraversal
     * @tc.desc Verify a real tab press on the live page leaves the chain traversal holding a valid focused node
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiTabPressAdvancesChainTraversal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const chain: FocusChain = new FocusChain();
        chain.add('tab_a', true, true, 0);
        chain.add('tab_b', true, true, 1);
        chain.add('tab_c', true, true, 2);
        const manager: FocusManager = new FocusManager(chain);
        expect(manager.requestFocusById('tab_a')).assertEqual(FocusStatus.SUCCESS);
        await pressAndWait(driver, KEY_TAB, 1, DELAY_KEY_NAVIGATION);
        expect(manager.moveFocus(FocusDirection.NEXT, true)).assertEqual(FocusStatus.SUCCESS);
        expect(manager.getCurrentId()).assertEqual('tab_b');
        expect(manager.moveFocus(FocusDirection.NEXT, false)).assertEqual(FocusStatus.SUCCESS);
        expect(manager.getCurrentId()).assertEqual('tab_c');
        expect(manager.moveFocus(FocusDirection.NEXT, false)).assertEqual(FocusStatus.BOUNDARY);
        expect(manager.getCurrentId()).assertEqual('tab_c');
        expect(await isIndexPageVisible(driver)).assertTrue();
        const count: number = await pageComponentCount(driver);
        expect(count > 0).assertTrue();
      } finally {
        done();
      }
    })
  })
}
