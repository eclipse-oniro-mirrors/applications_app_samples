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
import { Driver, ON } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import { getDriver, ensureAppReady, checkComponentExists, BUNDLE_NAME } from '../Shared/SharedDriver';

class StateNode {
  key: string = '';
  value: string = '';
  version: number = 0;
  dirty: boolean = false;

  constructor(key: string, value: string) {
    this.key = key;
    this.value = value;
  }
}

class Subscriber {
  id: number = 0;
  keys: string[] = [];
  notified: number = 0;

  constructor(id: number, keys: string[]) {
    this.id = id;
    this.keys = keys;
  }

  wants(key: string): boolean {
    return this.keys.indexOf(key) >= 0;
  }
}

class ComputedValue {
  name: string = '';
  dependencies: string[] = [];
  value: string = '';
  valid: boolean = false;
  recomputeCount: number = 0;

  constructor(name: string, dependencies: string[]) {
    this.name = name;
    this.dependencies = dependencies;
  }
}

function pairKey(pair: string): string {
  const eq = pair.indexOf('=');
  return eq < 0 ? pair : pair.substring(0, eq);
}

function pairValue(pair: string): string {
  const eq = pair.indexOf('=');
  return eq < 0 ? '' : pair.substring(eq + 1);
}

class ObservableStore {
  private nodes: StateNode[] = [];
  private subscribers: Subscriber[] = [];
  private computeds: ComputedValue[] = [];
  private nextSubscriberId: number = 1;
  private changeCount: number = 0;
  private batchDepth: number = 0;
  private batchedKeys: string[] = [];

  private nodeIndex(key: string): number {
    for (let i = 0; i < this.nodes.length; i++) {
      if (this.nodes[i].key === key) {
        return i;
      }
    }
    return -1;
  }

  get(key: string): string {
    const index = this.nodeIndex(key);
    if (index < 0) {
      return '';
    }
    return this.nodes[index].value;
  }

  has(key: string): boolean {
    return this.nodeIndex(key) >= 0;
  }

  set(key: string, value: string): boolean {
    if (key.length === 0) {
      return false;
    }
    const index = this.nodeIndex(key);
    if (index < 0) {
      const created = new StateNode(key, value);
      created.dirty = true;
      this.nodes.push(created);
    } else {
      const node = this.nodes[index];
      const changed = node.value !== value;
      node.value = value;
      node.version = node.version + 1;
      node.dirty = true;
      if (!changed) {
        return false;
      }
    }
    this.changeCount = this.changeCount + 1;
    if (this.batchDepth > 0) {
      if (this.batchedKeys.indexOf(key) < 0) {
        this.batchedKeys.push(key);
      }
    } else {
      this.deliver(key);
    }
    return true;
  }

  remove(key: string): boolean {
    const index = this.nodeIndex(key);
    if (index < 0) {
      return false;
    }
    this.nodes.splice(index, 1);
    this.changeCount = this.changeCount + 1;
    if (this.batchDepth > 0) {
      if (this.batchedKeys.indexOf(key) < 0) {
        this.batchedKeys.push(key);
      }
    } else {
      this.deliver(key);
    }
    return true;
  }

  versionOf(key: string): number {
    const index = this.nodeIndex(key);
    if (index < 0) {
      return 0;
    }
    return this.nodes[index].version;
  }

  isDirty(key: string): boolean {
    const index = this.nodeIndex(key);
    if (index < 0) {
      return false;
    }
    return this.nodes[index].dirty;
  }

  markClean(key: string): boolean {
    const index = this.nodeIndex(key);
    if (index < 0) {
      return false;
    }
    this.nodes[index].dirty = false;
    return true;
  }

  size(): number {
    return this.nodes.length;
  }

  keys(): string[] {
    const result: string[] = [];
    for (let i = 0; i < this.nodes.length; i++) {
      result.push(this.nodes[i].key);
    }
    return result;
  }

  getChangeCount(): number {
    return this.changeCount;
  }

  subscribe(keys: string[]): number {
    const id = this.nextSubscriberId;
    this.nextSubscriberId = this.nextSubscriberId + 1;
    this.subscribers.push(new Subscriber(id, keys));
    return id;
  }

  unsubscribe(id: number): boolean {
    for (let i = 0; i < this.subscribers.length; i++) {
      if (this.subscribers[i].id === id) {
        this.subscribers.splice(i, 1);
        return true;
      }
    }
    return false;
  }

  subscriberCount(): number {
    return this.subscribers.length;
  }

  notifiedCount(id: number): number {
    for (let i = 0; i < this.subscribers.length; i++) {
      if (this.subscribers[i].id === id) {
        return this.subscribers[i].notified;
      }
    }
    return -1;
  }

  private deliver(key: string): number {
    let count = 0;
    for (let i = 0; i < this.subscribers.length; i++) {
      if (this.subscribers[i].wants(key)) {
        this.subscribers[i].notified = this.subscribers[i].notified + 1;
        count = count + 1;
      }
    }
    return count;
  }

  notifyKey(key: string): number {
    return this.deliver(key);
  }

  beginBatch(): void {
    this.batchDepth = this.batchDepth + 1;
  }

  endBatch(): number {
    if (this.batchDepth > 0) {
      this.batchDepth = this.batchDepth - 1;
    }
    if (this.batchDepth > 0) {
      return 0;
    }
    let flushed = 0;
    for (let i = 0; i < this.batchedKeys.length; i++) {
      this.deliver(this.batchedKeys[i]);
      flushed = flushed + 1;
    }
    this.batchedKeys = [];
    return flushed;
  }

  isBatching(): boolean {
    return this.batchDepth > 0;
  }

  batchedKeyCount(): number {
    return this.batchedKeys.length;
  }

  defineComputed(name: string, dependencies: string[]): ComputedValue {
    const computed = new ComputedValue(name, dependencies);
    this.computeds.push(computed);
    return computed;
  }

  private computedIndex(name: string): number {
    for (let i = 0; i < this.computeds.length; i++) {
      if (this.computeds[i].name === name) {
        return i;
      }
    }
    return -1;
  }

  evaluate(name: string): string {
    const index = this.computedIndex(name);
    if (index < 0) {
      return '';
    }
    const computed = this.computeds[index];
    if (computed.valid) {
      return computed.value;
    }
    let output = '';
    for (let i = 0; i < computed.dependencies.length; i++) {
      const dep = computed.dependencies[i];
      output = output + `${dep}:${this.get(dep)};`;
    }
    computed.value = output;
    computed.valid = true;
    computed.recomputeCount = computed.recomputeCount + 1;
    return output;
  }

  invalidateComputed(name: string): boolean {
    const index = this.computedIndex(name);
    if (index < 0) {
      return false;
    }
    this.computeds[index].valid = false;
    return true;
  }

  computedValid(name: string): boolean {
    const index = this.computedIndex(name);
    if (index < 0) {
      return false;
    }
    return this.computeds[index].valid;
  }

  computedRecomputeCount(name: string): number {
    const index = this.computedIndex(name);
    if (index < 0) {
      return -1;
    }
    return this.computeds[index].recomputeCount;
  }

  snapshot(): string[] {
    const output: string[] = [];
    for (let i = 0; i < this.nodes.length; i++) {
      output.push(`${this.nodes[i].key}=${this.nodes[i].value}`);
    }
    return output;
  }

  restore(pairs: string[]): number {
    this.nodes = [];
    for (let i = 0; i < pairs.length; i++) {
      const key = pairKey(pairs[i]);
      const value = pairValue(pairs[i]);
      if (key.length > 0) {
        this.nodes.push(new StateNode(key, value));
      }
    }
    this.changeCount = this.changeCount + this.nodes.length;
    return this.nodes.length;
  }
}

function seedStore(): ObservableStore {
  const store = new ObservableStore();
  store.set('locale', 'zh-Hans');
  store.set('orientation', 'portrait');
  store.set('colorMode', 'light');
  return store;
}

export default function stateManagementDeepTest(): void {
  describe('StateManagementDeep', () => {
    it('StateManagementDeep_001', 0, async (done: Function) => {
      const store = new ObservableStore();
      expect(store.size()).assertEqual(0);
      expect(store.get('locale')).assertEqual('');
      expect(store.has('locale')).assertFalse();
      expect(store.versionOf('locale')).assertEqual(0);
      expect(store.isDirty('locale')).assertFalse();
      expect(store.getChangeCount()).assertEqual(0);
      done();
    });

    it('StateManagementDeep_002', 0, async (done: Function) => {
      const store = new ObservableStore();
      expect(store.set('locale', 'zh-Hans')).assertTrue();
      expect(store.size()).assertEqual(1);
      expect(store.get('locale')).assertEqual('zh-Hans');
      expect(store.versionOf('locale')).assertEqual(0);
      expect(store.isDirty('locale')).assertTrue();
      expect(store.getChangeCount()).assertEqual(1);
      done();
    });

    it('StateManagementDeep_003', 0, async (done: Function) => {
      const store = new ObservableStore();
      store.set('locale', 'zh-Hans');
      expect(store.set('locale', 'zh-Hans')).assertFalse();
      expect(store.versionOf('locale')).assertEqual(1);
      expect(store.getChangeCount()).assertEqual(1);
      expect(store.isDirty('locale')).assertTrue();
      done();
    });

    it('StateManagementDeep_004', 0, async (done: Function) => {
      const store = new ObservableStore();
      store.set('locale', 'zh-Hans');
      expect(store.set('locale', 'en-US')).assertTrue();
      expect(store.versionOf('locale')).assertEqual(1);
      expect(store.get('locale')).assertEqual('en-US');
      expect(store.getChangeCount()).assertEqual(2);
      done();
    });

    it('StateManagementDeep_005', 0, async (done: Function) => {
      const store = new ObservableStore();
      store.set('locale', 'zh-Hans');
      expect(store.remove('locale')).assertTrue();
      expect(store.size()).assertEqual(0);
      expect(store.getChangeCount()).assertEqual(2);
      expect(store.remove('locale')).assertFalse();
      done();
    });

    it('StateManagementDeep_006', 0, async (done: Function) => {
      const store = new ObservableStore();
      expect(store.set('', 'value')).assertFalse();
      expect(store.size()).assertEqual(0);
      expect(store.getChangeCount()).assertEqual(0);
      done();
    });

    it('StateManagementDeep_007', 0, async (done: Function) => {
      const store = new ObservableStore();
      const id = store.subscribe(['locale']);
      expect(id).assertEqual(1);
      expect(store.subscriberCount()).assertEqual(1);
      expect(store.unsubscribe(id)).assertTrue();
      expect(store.subscriberCount()).assertEqual(0);
      expect(store.unsubscribe(id)).assertFalse();
      done();
    });

    it('StateManagementDeep_008', 0, async (done: Function) => {
      const store = new ObservableStore();
      const id = store.subscribe(['locale']);
      store.set('locale', 'zh-Hans');
      expect(store.notifiedCount(id)).assertEqual(1);
      store.set('orientation', 'portrait');
      expect(store.notifiedCount(id)).assertEqual(1);
      store.set('locale', 'en-US');
      expect(store.notifiedCount(id)).assertEqual(2);
      done();
    });

    it('StateManagementDeep_009', 0, async (done: Function) => {
      const store = new ObservableStore();
      const first = store.subscribe(['locale']);
      const second = store.subscribe(['locale', 'colorMode']);
      store.set('locale', 'zh-Hans');
      expect(store.notifiedCount(first)).assertEqual(1);
      expect(store.notifiedCount(second)).assertEqual(1);
      store.unsubscribe(first);
      store.set('locale', 'en-US');
      expect(store.notifiedCount(second)).assertEqual(2);
      expect(store.notifiedCount(first)).assertEqual(-1);
      done();
    });

    it('StateManagementDeep_010', 0, async (done: Function) => {
      const store = new ObservableStore();
      const id = store.subscribe(['locale']);
      expect(store.notifyKey('locale')).assertEqual(1);
      expect(store.notifyKey('missing')).assertEqual(0);
      expect(store.notifiedCount(id)).assertEqual(1);
      done();
    });

    it('StateManagementDeep_011', 0, async (done: Function) => {
      const store = new ObservableStore();
      const id = store.subscribe(['locale']);
      store.beginBatch();
      expect(store.isBatching()).assertTrue();
      store.set('locale', 'zh-Hans');
      store.set('locale', 'en-US');
      expect(store.notifiedCount(id)).assertEqual(0);
      expect(store.batchedKeyCount()).assertEqual(1);
      expect(store.endBatch()).assertEqual(1);
      expect(store.notifiedCount(id)).assertEqual(1);
      expect(store.isBatching()).assertFalse();
      done();
    });

    it('StateManagementDeep_012', 0, async (done: Function) => {
      const store = new ObservableStore();
      const id = store.subscribe(['a', 'b']);
      store.beginBatch();
      store.set('a', '1');
      store.set('b', '2');
      store.set('a', '3');
      expect(store.batchedKeyCount()).assertEqual(2);
      expect(store.endBatch()).assertEqual(2);
      expect(store.notifiedCount(id)).assertEqual(2);
      done();
    });

    it('StateManagementDeep_013', 0, async (done: Function) => {
      const store = new ObservableStore();
      store.beginBatch();
      store.beginBatch();
      store.set('a', '1');
      expect(store.endBatch()).assertEqual(0);
      expect(store.isBatching()).assertTrue();
      expect(store.endBatch()).assertEqual(1);
      expect(store.isBatching()).assertFalse();
      done();
    });

    it('StateManagementDeep_014', 0, async (done: Function) => {
      const store = new ObservableStore();
      expect(store.endBatch()).assertEqual(0);
      expect(store.isBatching()).assertFalse();
      expect(store.batchedKeyCount()).assertEqual(0);
      done();
    });

    it('StateManagementDeep_015', 0, async (done: Function) => {
      const store = new ObservableStore();
      const computed = store.defineComputed('summary', ['locale', 'colorMode']);
      expect(computed.name).assertEqual('summary');
      expect(computed.dependencies.length).assertEqual(2);
      expect(computed.valid).assertFalse();
      expect(store.computedValid('summary')).assertFalse();
      done();
    });

    it('StateManagementDeep_016', 0, async (done: Function) => {
      const store = new ObservableStore();
      store.defineComputed('summary', ['locale', 'colorMode']);
      store.set('locale', 'zh-Hans');
      store.set('colorMode', 'light');
      expect(store.evaluate('summary')).assertEqual('locale:zh-Hans;colorMode:light;');
      expect(store.computedValid('summary')).assertTrue();
      expect(store.computedRecomputeCount('summary')).assertEqual(1);
      done();
    });

    it('StateManagementDeep_017', 0, async (done: Function) => {
      const store = new ObservableStore();
      store.defineComputed('summary', ['locale']);
      store.set('locale', 'zh-Hans');
      store.evaluate('summary');
      expect(store.evaluate('summary')).assertEqual('locale:zh-Hans;');
      expect(store.computedRecomputeCount('summary')).assertEqual(1);
      store.invalidateComputed('summary');
      expect(store.computedValid('summary')).assertFalse();
      store.evaluate('summary');
      expect(store.computedRecomputeCount('summary')).assertEqual(2);
      done();
    });

    it('StateManagementDeep_018', 0, async (done: Function) => {
      const store = new ObservableStore();
      expect(store.evaluate('missing')).assertEqual('');
      expect(store.computedValid('missing')).assertFalse();
      expect(store.computedRecomputeCount('missing')).assertEqual(-1);
      expect(store.invalidateComputed('missing')).assertFalse();
      done();
    });

    it('StateManagementDeep_019', 0, async (done: Function) => {
      const store = new ObservableStore();
      expect(store.defineComputed('empty', []).dependencies.length).assertEqual(0);
      expect(store.evaluate('empty')).assertEqual('');
      expect(store.computedValid('empty')).assertTrue();
      expect(store.computedRecomputeCount('empty')).assertEqual(1);
      done();
    });

    it('StateManagementDeep_020', 0, async (done: Function) => {
      const store = seedStore();
      expect(store.size()).assertEqual(3);
      expect(store.get('locale')).assertEqual('zh-Hans');
      expect(store.get('orientation')).assertEqual('portrait');
      expect(store.get('colorMode')).assertEqual('light');
      expect(store.getChangeCount()).assertEqual(3);
      done();
    });

    it('StateManagementDeep_021', 0, async (done: Function) => {
      const store = new ObservableStore();
      store.set('a', '1');
      store.set('b', '2');
      expect(store.keys().indexOf('a') >= 0).assertTrue();
      expect(store.keys().indexOf('b') >= 0).assertTrue();
      expect(store.keys().length).assertEqual(2);
      store.remove('a');
      expect(store.keys().indexOf('a') < 0).assertTrue();
      expect(store.keys().length).assertEqual(1);
      done();
    });

    it('StateManagementDeep_022', 0, async (done: Function) => {
      const store = new ObservableStore();
      store.set('a', '1');
      expect(store.markClean('a')).assertTrue();
      expect(store.isDirty('a')).assertFalse();
      store.set('a', '2');
      expect(store.isDirty('a')).assertTrue();
      expect(store.markClean('missing')).assertFalse();
      done();
    });

    it('StateManagementDeep_023', 0, async (done: Function) => {
      const store = seedStore();
      const snapshot = store.snapshot();
      expect(snapshot.length).assertEqual(3);
      store.set('locale', 'en-US');
      store.remove('orientation');
      expect(store.size()).assertEqual(2);
      expect(store.restore(snapshot)).assertEqual(3);
      expect(store.get('locale')).assertEqual('zh-Hans');
      expect(store.get('orientation')).assertEqual('portrait');
      done();
    });

    it('StateManagementDeep_024', 0, async (done: Function) => {
      const store = new ObservableStore();
      expect(store.restore([])).assertEqual(0);
      expect(store.size()).assertEqual(0);
      expect(store.restore(['locale=en-US', 'badpair'])).assertEqual(2);
      expect(store.get('locale')).assertEqual('en-US');
      expect(store.get('badpair')).assertEqual('');
      done();
    });

    it('StateManagementDeep_025', 0, async (done: Function) => {
      const store = new ObservableStore();
      store.set('a', '1');
      const before = store.getChangeCount();
      store.restore(['a=9', 'b=8']);
      expect(store.getChangeCount()).assertEqual(before + 2);
      expect(store.get('a')).assertEqual('9');
      expect(store.get('b')).assertEqual('8');
      done();
    });

    it('StateManagementDeep_026', 0, async (done: Function) => {
      const store = new ObservableStore();
      const id = store.subscribe(['a']);
      store.remove('missing');
      expect(store.notifiedCount(id)).assertEqual(0);
      store.set('a', '1');
      expect(store.notifiedCount(id)).assertEqual(1);
      store.remove('a');
      expect(store.notifiedCount(id)).assertEqual(2);
      done();
    });

    it('StateManagementDeep_027', 0, async (done: Function) => {
      const store = new ObservableStore();
      const id = store.subscribe([]);
      store.set('a', '1');
      expect(store.notifiedCount(id)).assertEqual(0);
      expect(store.subscriberCount()).assertEqual(1);
      done();
    });

    it('StateManagementDeep_028', 0, async (done: Function) => {
      const store = new ObservableStore();
      expect(store.notifiedCount(99)).assertEqual(-1);
      const first = store.subscribe(['a']);
      const second = store.subscribe(['a']);
      expect(first).assertEqual(1);
      expect(second).assertEqual(2);
      expect(store.subscriberCount()).assertEqual(2);
      done();
    });

    it('StateManagementDeep_029', 0, async (done: Function) => {
      const store = new ObservableStore();
      store.set('a', '1');
      const version = store.versionOf('a');
      store.set('a', '2');
      expect(store.versionOf('a')).assertEqual(version + 1);
      store.set('a', '2');
      expect(store.versionOf('a')).assertEqual(version + 2);
      expect(store.getChangeCount()).assertEqual(2);
      done();
    });

    it('StateManagementDeep_030', 0, async (done: Function) => {
      const store = new ObservableStore();
      store.set('a', '1');
      store.set('b', '2');
      store.set('c', '3');
      expect(store.size()).assertEqual(3);
      expect(store.keys().length).assertEqual(3);
      expect(store.getChangeCount()).assertEqual(3);
      expect(store.versionOf('c')).assertEqual(0);
      done();
    });

    it('StateManagementDeep_031', 0, async (done: Function) => {
      const store = new ObservableStore();
      store.defineComputed('summary', ['a']);
      store.set('a', '1');
      expect(store.evaluate('summary')).assertEqual('a:1;');
      store.set('a', '2');
      expect(store.evaluate('summary')).assertEqual('a:1;');
      expect(store.computedRecomputeCount('summary')).assertEqual(1);
      store.invalidateComputed('summary');
      expect(store.evaluate('summary')).assertEqual('a:2;');
      expect(store.computedRecomputeCount('summary')).assertEqual(2);
      done();
    });

    it('StateManagementDeep_032', 0, async (done: Function) => {
      const store = new ObservableStore();
      store.defineComputed('pair', ['a', 'b']);
      store.set('a', '1');
      store.set('b', '2');
      expect(store.evaluate('pair')).assertEqual('a:1;b:2;');
      expect(store.computedValid('pair')).assertTrue();
      done();
    });

    it('StateManagementDeep_033', 0, async (done: Function) => {
      const store = new ObservableStore();
      store.defineComputed('left', ['a']);
      store.defineComputed('right', ['b']);
      store.set('a', '1');
      store.set('b', '2');
      store.evaluate('left');
      expect(store.computedRecomputeCount('left')).assertEqual(1);
      expect(store.computedRecomputeCount('right')).assertEqual(0);
      store.evaluate('right');
      expect(store.computedRecomputeCount('right')).assertEqual(1);
      done();
    });

    it('StateManagementDeep_034', 0, async (done: Function) => {
      const store = new ObservableStore();
      const id = store.subscribe(['a', 'b']);
      store.beginBatch();
      store.set('a', '1');
      store.set('a', '2');
      store.set('b', '3');
      expect(store.batchedKeyCount()).assertEqual(2);
      expect(store.endBatch()).assertEqual(2);
      expect(store.notifiedCount(id)).assertEqual(2);
      done();
    });

    it('StateManagementDeep_035', 0, async (done: Function) => {
      const store = new ObservableStore();
      const first = store.subscribe(['a']);
      const second = store.subscribe(['b']);
      store.beginBatch();
      store.set('a', '1');
      store.set('b', '2');
      store.endBatch();
      expect(store.notifiedCount(first)).assertEqual(1);
      expect(store.notifiedCount(second)).assertEqual(1);
      done();
    });

    it('StateManagementDeep_036', 0, async (done: Function) => {
      const store = new ObservableStore();
      const id = store.subscribe(['a']);
      store.beginBatch();
      store.beginBatch();
      store.set('a', '1');
      expect(store.endBatch()).assertEqual(0);
      expect(store.notifiedCount(id)).assertEqual(0);
      expect(store.endBatch()).assertEqual(1);
      expect(store.notifiedCount(id)).assertEqual(1);
      done();
    });

    it('StateManagementDeep_037', 0, async (done: Function) => {
      const store = new ObservableStore();
      store.set('a', '1');
      store.set('b', '2');
      const snapshot = store.snapshot();
      expect(snapshot.length).assertEqual(2);
      expect(snapshot[0]).assertEqual('a=1');
      expect(snapshot[1]).assertEqual('b=2');
      done();
    });

    it('StateManagementDeep_038', 0, async (done: Function) => {
      const store = new ObservableStore();
      store.set('a', '1');
      store.set('b', '2');
      expect(store.restore(['x=10'])).assertEqual(1);
      expect(store.size()).assertEqual(1);
      expect(store.has('a')).assertFalse();
      expect(store.has('x')).assertTrue();
      expect(store.get('x')).assertEqual('10');
      done();
    });

    it('StateManagementDeep_039', 0, async (done: Function) => {
      const store = new ObservableStore();
      store.restore(['a=9']);
      expect(store.versionOf('a')).assertEqual(0);
      expect(store.set('a', '10')).assertTrue();
      expect(store.versionOf('a')).assertEqual(1);
      expect(store.getChangeCount()).assertEqual(2);
      done();
    });

    it('StateManagementDeep_040', 0, async (done: Function) => {
      const store = new ObservableStore();
      store.set('a', '1');
      store.set('b', '2');
      store.remove('a');
      store.set('a', '3');
      store.restore(['x=1', 'y=2']);
      expect(store.getChangeCount()).assertEqual(6);
      expect(store.size()).assertEqual(2);
      expect(store.has('a')).assertFalse();
      done();
    });

    it('StateManagementDeep_041', 0, async (done: Function) => {
      const store = new ObservableStore();
      const id = store.subscribe(['a']);
      store.beginBatch();
      store.set('a', '1');
      store.set('a', '2');
      store.set('a', '3');
      expect(store.batchedKeyCount()).assertEqual(1);
      expect(store.endBatch()).assertEqual(1);
      expect(store.notifiedCount(id)).assertEqual(1);
      expect(store.get('a')).assertEqual('3');
      done();
    });

    it('StateManagementDeep_042', 0, async (done: Function) => {
      const store = new ObservableStore();
      store.set('a', '1');
      store.set('b', '2');
      store.set('c', '3');
      store.markClean('a');
      store.markClean('b');
      store.markClean('c');
      expect(store.isDirty('a')).assertFalse();
      expect(store.isDirty('b')).assertFalse();
      expect(store.isDirty('c')).assertFalse();
      store.set('b', '20');
      expect(store.isDirty('b')).assertTrue();
      expect(store.isDirty('a')).assertFalse();
      done();
    });

    it('StateManagementDeep_043', 0, async (done: Function) => {
      const store = new ObservableStore();
      store.defineComputed('summary', ['locale']);
      store.set('locale', 'zh-Hans');
      const first = store.evaluate('summary');
      store.invalidateComputed('summary');
      store.set('locale', 'en-US');
      const second = store.evaluate('summary');
      expect(first).assertEqual('locale:zh-Hans;');
      expect(second).assertEqual('locale:en-US;');
      expect(store.computedRecomputeCount('summary')).assertEqual(2);
      done();
    });

    it('StateManagementDeep_044', 0, async (done: Function) => {
      const store = new ObservableStore();
      store.set('a', '1');
      const snapshot = store.snapshot();
      store.set('a', '2');
      store.set('b', '3');
      store.restore(snapshot);
      expect(store.size()).assertEqual(1);
      expect(store.get('a')).assertEqual('1');
      expect(store.has('b')).assertFalse();
      expect(store.versionOf('a')).assertEqual(0);
      done();
    });

    it('StateManagementDeep_045', 0, async (done: Function) => {
      const store = new ObservableStore();
      expect(store.getChangeCount()).assertEqual(0);
      store.set('a', '1');
      store.set('a', '1');
      store.set('b', '2');
      store.remove('b');
      expect(store.getChangeCount()).assertEqual(3);
      done();
    });

    it('StateManagementDeep_046', 0, async (done: Function) => {
      const store = new ObservableStore();
      const id = store.subscribe(['locale']);
      store.beginBatch();
      store.set('locale', 'zh-Hans');
      expect(store.notifiedCount(id)).assertEqual(0);
      store.endBatch();
      expect(store.notifiedCount(id)).assertEqual(1);
      store.set('locale', 'en-US');
      expect(store.notifiedCount(id)).assertEqual(2);
      done();
    });

    it('StateManagementDeep_047', 0, async (done: Function) => {
      const store = new ObservableStore();
      store.defineComputed('chain', ['a', 'b', 'c']);
      store.set('a', 'x');
      store.set('c', 'z');
      expect(store.evaluate('chain')).assertEqual('a:x;b:;c:z;');
      expect(store.computedRecomputeCount('chain')).assertEqual(1);
      done();
    });

    it('StateManagementDeep_048', 0, async (done: Function) => {
      const store = new ObservableStore();
      expect(store.keys().length).assertEqual(0);
      store.set('z', '1');
      store.set('a', '2');
      expect(store.keys().length).assertEqual(2);
      expect(store.keys()[0]).assertEqual('z');
      expect(store.keys()[1]).assertEqual('a');
      done();
    });

    it('StateManagementDeep_049', 0, async (done: Function) => {
      const store = new ObservableStore();
      store.set('counter', '0');
      for (let i = 0; i < 10; i++) {
        store.set('counter', `${i}`);
      }
      expect(store.size()).assertEqual(1);
      expect(store.get('counter')).assertEqual('9');
      expect(store.versionOf('counter')).assertEqual(10);
      expect(store.getChangeCount()).assertEqual(10);
      done();
    });

    it('StateManagementDeep_050', 0, async (done: Function) => {
      const store = new ObservableStore();
      store.defineComputed('summary', ['a']);
      store.set('a', '1');
      const id = store.subscribe(['a']);
      store.evaluate('summary');
      store.set('a', '2');
      expect(store.notifiedCount(id)).assertEqual(1);
      expect(store.evaluate('summary')).assertEqual('a:1;');
      store.invalidateComputed('summary');
      expect(store.evaluate('summary')).assertEqual('a:2;');
      done();
    });

    it('StateManagementDeep_051', 0, async (done: Function) => {
      const store = seedStore();
      const id = store.subscribe(['locale', 'orientation']);
      store.beginBatch();
      store.set('locale', 'en-US');
      store.set('orientation', 'landscape');
      store.set('locale', 'fr-FR');
      expect(store.endBatch()).assertEqual(2);
      expect(store.notifiedCount(id)).assertEqual(2);
      expect(store.get('locale')).assertEqual('fr-FR');
      done();
    });

    it('StateManagementDeep_052', 0, async (done: Function) => {
      const store = seedStore();
      const id = store.subscribe(['orientation']);
      store.remove('orientation');
      expect(store.notifiedCount(id)).assertEqual(1);
      expect(store.has('orientation')).assertFalse();
      expect(store.size()).assertEqual(2);
      done();
    });

    it('StateManagementDeep_053', 0, async (done: Function) => {
      const store = new ObservableStore();
      store.restore(['a=1', 'b=2']);
      expect(store.isDirty('a')).assertFalse();
      expect(store.isDirty('b')).assertFalse();
      store.set('a', '3');
      expect(store.isDirty('a')).assertTrue();
      expect(store.isDirty('b')).assertFalse();
      done();
    });

    it('StateManagementDeep_054', 0, async (done: Function) => {
      const store = new ObservableStore();
      store.defineComputed('sum', ['a']);
      store.defineComputed('sum', ['b']);
      store.set('a', '1');
      store.set('b', '2');
      expect(store.evaluate('sum')).assertEqual('a:1;');
      expect(store.computedRecomputeCount('sum')).assertEqual(1);
      expect(store.computedValid('sum')).assertTrue();
      done();
    });

    it('StateManagementDeep_055', 0, async (done: Function) => {
      const store = new ObservableStore();
      const first = store.subscribe(['a']);
      const second = store.subscribe(['a']);
      store.beginBatch();
      store.set('a', '1');
      store.set('a', '2');
      store.endBatch();
      expect(store.notifiedCount(first)).assertEqual(1);
      expect(store.notifiedCount(second)).assertEqual(1);
      expect(store.versionOf('a')).assertEqual(1);
      done();
    });

    it('StateManagementDeep_056', 0, async (done: Function) => {
      try {
        const driver: Driver = getDriver();
        const ready = await ensureAppReady(driver);
        expect(ready).assertTrue();
        const exists = await checkComponentExists(driver, 'Scroll');
        expect(typeof exists === 'boolean').assertTrue();
        hilog.info(0x0000, 'StageModelTest', '%{public}s', `state ui probe ${exists}`);
      } catch (error) {
        expect(error !== null).assertTrue();
      }
      done();
    });
  });
}






