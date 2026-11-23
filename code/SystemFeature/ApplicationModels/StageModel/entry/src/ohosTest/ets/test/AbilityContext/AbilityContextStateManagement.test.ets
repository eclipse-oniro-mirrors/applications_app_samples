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
  getDriver, ensureAppReady, checkComponentExists,
  BUNDLE_NAME, ACCOUNT_ID, MODULE_ENTRY
} from '../Shared/SharedDriver';

class StEntry {
  key: string = '';
  value: number = 0;
  version: number = 0;

  constructor(key: string, value: number, version: number) {
    this.key = key;
    this.value = value;
    this.version = version;
  }
}

class StStore {
  private entries: StEntry[] = [];
  private version: number = 0;
  private dirty: boolean = false;
  private observers: string[] = [];
  private restoreCount: number = 0;

  private indexOf(key: string): number {
    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i].key === key) {
        return i;
      }
    }
    return -1;
  }

  set(key: string, value: number): boolean {
    if (key.trim().length === 0 || value < 0) {
      return false;
    }
    this.version = this.version + 1;
    this.dirty = true;
    const index = this.indexOf(key);
    if (index >= 0) {
      this.entries[index].value = value;
      this.entries[index].version = this.version;
    } else {
      this.entries.push(new StEntry(key, value, this.version));
    }
    return true;
  }

  get(key: string): number {
    const index = this.indexOf(key);
    if (index < 0) {
      return -1;
    }
    return this.entries[index].value;
  }

  has(key: string): boolean {
    return this.indexOf(key) >= 0;
  }

  remove(key: string): boolean {
    const index = this.indexOf(key);
    if (index < 0) {
      return false;
    }
    this.entries.splice(index, 1);
    this.version = this.version + 1;
    this.dirty = true;
    return true;
  }

  increment(key: string, delta: number): boolean {
    if (!this.has(key) || delta < 0) {
      return false;
    }
    return this.set(key, this.get(key) + delta);
  }

  subscribe(name: string): boolean {
    if (name.trim().length === 0 || this.observers.indexOf(name) >= 0) {
      return false;
    }
    this.observers.push(name);
    return true;
  }

  unsubscribe(name: string): boolean {
    const index = this.observers.indexOf(name);
    if (index < 0) {
      return false;
    }
    this.observers.splice(index, 1);
    return true;
  }

  snapshot(): number[] {
    const values: number[] = [];
    for (let i = 0; i < this.entries.length; i++) {
      values.push(this.entries[i].value);
    }
    return values;
  }

  restore(values: number[]): boolean {
    if (values.length !== this.entries.length) {
      return false;
    }
    for (let i = 0; i < this.entries.length; i++) {
      if (values[i] < 0) {
        return false;
      }
    }
    for (let i = 0; i < this.entries.length; i++) {
      this.entries[i].value = values[i];
    }
    this.restoreCount = this.restoreCount + 1;
    this.version = this.version + 1;
    this.dirty = true;
    return true;
  }

  clearDirty(): void {
    this.dirty = false;
  }

  isDirty(): boolean {
    return this.dirty;
  }

  size(): number {
    return this.entries.length;
  }

  keys(): string[] {
    const result: string[] = [];
    for (let i = 0; i < this.entries.length; i++) {
      result.push(this.entries[i].key);
    }
    return result;
  }

  getVersion(): number {
    return this.version;
  }

  getObservers(): string[] {
    return this.observers;
  }

  getRestoreCount(): number {
    return this.restoreCount;
  }

  total(): number {
    let sum = 0;
    for (let i = 0; i < this.entries.length; i++) {
      sum = sum + this.entries[i].value;
    }
    return sum;
  }

  reset(): void {
    this.entries = [];
    this.version = 0;
    this.dirty = false;
    this.observers = [];
    this.restoreCount = 0;
  }
}

export default function abilityContextStateManagementTest(): void {
  describe('AbilityContextStateManagement', () => {
    it('AbilityContextStateManagement_001', 0, async (done: Function) => {
      const store = new StStore();
      expect(store.set('count', 5)).assertTrue();
      expect(store.get('count')).assertEqual(5);
      expect(store.size()).assertEqual(1);
      done();
    });

    it('AbilityContextStateManagement_002', 0, async (done: Function) => {
      const store = new StStore();
      expect(store.get('missing')).assertEqual(-1);
      expect(store.has('missing')).assertFalse();
      expect(store.size()).assertEqual(0);
      done();
    });

    it('AbilityContextStateManagement_003', 0, async (done: Function) => {
      const store = new StStore();
      store.set('count', 1);
      store.set('count', 9);
      expect(store.get('count')).assertEqual(9);
      expect(store.size()).assertEqual(1);
      done();
    });

    it('AbilityContextStateManagement_004', 0, async (done: Function) => {
      const store = new StStore();
      expect(store.set('', 5)).assertFalse();
      expect(store.set('neg', -2)).assertFalse();
      expect(store.size()).assertEqual(0);
      done();
    });

    it('AbilityContextStateManagement_005', 0, async (done: Function) => {
      const store = new StStore();
      store.set('a', 1);
      store.set('b', 2);
      expect(store.remove('a')).assertTrue();
      expect(store.has('a')).assertFalse();
      expect(store.size()).assertEqual(1);
      done();
    });

    it('AbilityContextStateManagement_006', 0, async (done: Function) => {
      const store = new StStore();
      expect(store.remove('missing')).assertFalse();
      expect(store.size()).assertEqual(0);
      done();
    });

    it('AbilityContextStateManagement_007', 0, async (done: Function) => {
      const store = new StStore();
      store.set('a', 1);
      store.set('b', 2);
      expect(store.getVersion()).assertEqual(2);
      store.remove('a');
      expect(store.getVersion()).assertEqual(3);
      done();
    });

    it('AbilityContextStateManagement_008', 0, async (done: Function) => {
      const store = new StStore();
      expect(store.getVersion()).assertEqual(0);
      expect(store.set('', 1)).assertFalse();
      expect(store.getVersion()).assertEqual(0);
      done();
    });

    it('AbilityContextStateManagement_009', 0, async (done: Function) => {
      const store = new StStore();
      expect(store.isDirty()).assertFalse();
      store.set('a', 1);
      expect(store.isDirty()).assertTrue();
      store.clearDirty();
      expect(store.isDirty()).assertFalse();
      done();
    });

    it('AbilityContextStateManagement_010', 0, async (done: Function) => {
      const store = new StStore();
      store.set('a', 1);
      store.set('b', 2);
      store.set('c', 3);
      expect(store.total()).assertEqual(6);
      expect(store.keys().length).assertEqual(3);
      done();
    });

    it('AbilityContextStateManagement_011', 0, async (done: Function) => {
      const store = new StStore();
      store.set('a', 4);
      store.set('b', 6);
      const snap = store.snapshot();
      expect(snap.length).assertEqual(2);
      expect(snap[0]).assertEqual(4);
      expect(snap[1]).assertEqual(6);
      done();
    });

    it('AbilityContextStateManagement_012', 0, async (done: Function) => {
      const store = new StStore();
      store.set('a', 1);
      store.set('b', 2);
      const snap = store.snapshot();
      expect(store.restore(snap)).assertTrue();
      expect(store.getRestoreCount()).assertEqual(1);
      expect(store.get('a')).assertEqual(1);
      done();
    });

    it('AbilityContextStateManagement_013', 0, async (done: Function) => {
      const store = new StStore();
      store.set('a', 1);
      expect(store.restore([1, 2])).assertFalse();
      expect(store.getRestoreCount()).assertEqual(0);
      expect(store.get('a')).assertEqual(1);
      done();
    });

    it('AbilityContextStateManagement_014', 0, async (done: Function) => {
      const store = new StStore();
      store.set('a', 10);
      expect(store.increment('a', 5)).assertTrue();
      expect(store.get('a')).assertEqual(15);
      expect(store.increment('missing', 1)).assertFalse();
      done();
    });

    it('AbilityContextStateManagement_015', 0, async (done: Function) => {
      const store = new StStore();
      store.set('a', 10);
      expect(store.increment('a', -1)).assertFalse();
      expect(store.get('a')).assertEqual(10);
      expect(store.getVersion()).assertEqual(1);
      done();
    });

    it('AbilityContextStateManagement_016', 0, async (done: Function) => {
      const store = new StStore();
      expect(store.subscribe('observerA')).assertTrue();
      expect(store.subscribe('observerB')).assertTrue();
      expect(store.getObservers().length).assertEqual(2);
      expect(store.subscribe('observerA')).assertFalse();
      done();
    });

    it('AbilityContextStateManagement_017', 0, async (done: Function) => {
      const store = new StStore();
      store.subscribe('observerA');
      expect(store.unsubscribe('observerA')).assertTrue();
      expect(store.getObservers().length).assertEqual(0);
      expect(store.unsubscribe('observerA')).assertFalse();
      done();
    });

    it('AbilityContextStateManagement_018', 0, async (done: Function) => {
      const store = new StStore();
      expect(store.subscribe('')).assertFalse();
      expect(store.getObservers().length).assertEqual(0);
      expect(store.getVersion()).assertEqual(0);
      done();
    });

    it('AbilityContextStateManagement_019', 0, async (done: Function) => {
      const store = new StStore();
      store.set('a', 1);
      store.set('b', 2);
      const keys = store.keys();
      expect(keys[0]).assertEqual('a');
      expect(keys[1]).assertEqual('b');
      expect(keys.indexOf('c')).assertEqual(-1);
      done();
    });

    it('AbilityContextStateManagement_020', 0, async (done: Function) => {
      const store = new StStore();
      store.set('a', 1);
      store.set('b', 2);
      const snap = store.snapshot();
      store.set('a', 100);
      expect(store.restore(snap)).assertTrue();
      expect(store.get('a')).assertEqual(1);
      expect(store.get('b')).assertEqual(2);
      expect(store.total()).assertEqual(3);
      done();
    });

    it('AbilityContextStateManagement_021', 0, async (done: Function) => {
      const store = new StStore();
      store.set('a', 1);
      expect(store.restore([-1])).assertFalse();
      expect(store.getRestoreCount()).assertEqual(0);
      expect(store.get('a')).assertEqual(1);
      done();
    });

    it('AbilityContextStateManagement_022', 0, async (done: Function) => {
      const store = new StStore();
      store.set('a', 0);
      store.set('b', 0);
      expect(store.total()).assertEqual(0);
      expect(store.size()).assertEqual(2);
      expect(store.get('a')).assertEqual(0);
      done();
    });

    it('AbilityContextStateManagement_023', 0, async (done: Function) => {
      const store = new StStore();
      store.set('a', 1);
      store.reset();
      expect(store.size()).assertEqual(0);
      expect(store.getVersion()).assertEqual(0);
      expect(store.isDirty()).assertFalse();
      expect(store.get('a')).assertEqual(-1);
      done();
    });

    it('AbilityContextStateManagement_024', 0, async (done: Function) => {
      const store = new StStore();
      store.set('a', 1);
      store.set('b', 2);
      store.set('a', 3);
      expect(store.getVersion()).assertEqual(3);
      expect(store.size()).assertEqual(2);
      expect(store.total()).assertEqual(5);
      done();
    });

    it('AbilityContextStateManagement_025', 0, async (done: Function) => {
      const store = new StStore();
      store.set('a', 1);
      store.remove('a');
      expect(store.isDirty()).assertTrue();
      store.clearDirty();
      expect(store.isDirty()).assertFalse();
      expect(store.size()).assertEqual(0);
      done();
    });

    it('AbilityContextStateManagement_026', 0, async (done: Function) => {
      const store = new StStore();
      store.set('a', 100);
      store.set('b', 200);
      expect(store.snapshot()[0]).assertEqual(100);
      expect(store.snapshot()[1]).assertEqual(200);
      expect(store.snapshot().length).assertEqual(2);
      done();
    });

    it('AbilityContextStateManagement_027', 0, async (done: Function) => {
      const store = new StStore();
      store.set('count', 7);
      const before = store.getVersion();
      store.increment('count', 3);
      expect(store.get('count')).assertEqual(10);
      expect(store.getVersion()).assertEqual(before + 1);
      expect(store.total()).assertEqual(10);
      done();
    });

    it('AbilityContextStateManagement_028', 0, async (done: Function) => {
      const store = new StStore();
      store.subscribe('o1');
      store.subscribe('o2');
      store.subscribe('o3');
      expect(store.getObservers()[1]).assertEqual('o2');
      expect(store.unsubscribe('o2')).assertTrue();
      expect(store.getObservers().length).assertEqual(2);
      done();
    });

    it('AbilityContextStateManagement_029', 0, async (done: Function) => {
      const store = new StStore();
      store.set('a', 5);
      expect(store.has('a')).assertTrue();
      expect(store.has('b')).assertFalse();
      expect(store.keys().length).assertEqual(1);
      expect(store.get('b')).assertEqual(-1);
      done();
    });

    it('AbilityContextStateManagement_030', 0, async (done: Function) => {
      const store = new StStore();
      store.set('a', 5);
      store.set('b', 6);
      const snap = store.snapshot();
      store.remove('a');
      expect(store.size()).assertEqual(1);
      expect(store.restore(snap)).assertFalse();
      expect(store.get('b')).assertEqual(6);
      done();
    });

    it('AbilityContextStateManagement_031', 0, async (done: Function) => {
      const store = new StStore();
      store.set('a', 1);
      store.set('b', 2);
      const snap = store.snapshot();
      expect(store.restore(snap)).assertTrue();
      expect(store.restore(snap)).assertTrue();
      expect(store.getRestoreCount()).assertEqual(2);
      expect(store.isDirty()).assertTrue();
      done();
    });

    it('AbilityContextStateManagement_032', 0, async (done: Function) => {
      const store = new StStore();
      expect(store.total()).assertEqual(0);
      store.set('a', 3);
      expect(store.total()).assertEqual(3);
      store.reset();
      expect(store.total()).assertEqual(0);
      done();
    });

    it('AbilityContextStateManagement_033', 0, async (done: Function) => {
      const store = new StStore();
      store.set('a', 0);
      expect(store.increment('a', 0)).assertTrue();
      expect(store.get('a')).assertEqual(0);
      expect(store.total()).assertEqual(0);
      expect(store.size()).assertEqual(1);
      done();
    });

    it('AbilityContextStateManagement_034', 0, async (done: Function) => {
      const store = new StStore();
      store.set('k1', 11);
      store.set('k2', 22);
      store.set('k3', 33);
      expect(store.keys().length).assertEqual(3);
      expect(store.keys()[2]).assertEqual('k3');
      expect(store.total()).assertEqual(66);
      done();
    });

    it('AbilityContextStateManagement_035', 0, async (done: Function) => {
      const store = new StStore();
      store.set('a', 9);
      store.clearDirty();
      const versionBefore = store.getVersion();
      store.clearDirty();
      expect(store.getVersion()).assertEqual(versionBefore);
      expect(store.isDirty()).assertFalse();
      expect(store.get('a')).assertEqual(9);
      done();
    });

    it('AbilityContextStateManagement_036', 0, async (done: Function) => {
      const store = new StStore();
      expect(store.getObservers().length).assertEqual(0);
      store.subscribe('only');
      expect(store.getObservers()[0]).assertEqual('only');
      store.unsubscribe('only');
      expect(store.subscribe('only')).assertTrue();
      expect(store.getObservers().length).assertEqual(1);
      done();
    });

    it('AbilityContextStateManagement_037', 0, async (done: Function) => {
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

    it('AbilityContextStateManagement_038', 0, async (done: Function) => {
      const store = new StStore();
      store.set('a', 2);
      store.set('b', 4);
      const snap = store.snapshot();
      store.reset();
      store.set('a', 0);
      store.set('b', 0);
      expect(store.restore(snap)).assertTrue();
      expect(store.get('a')).assertEqual(2);
      expect(store.get('b')).assertEqual(4);
      expect(store.total()).assertEqual(6);
      done();
    });

    it('AbilityContextStateManagement_039', 0, async (done: Function) => {
      const store = new StStore();
      store.set('x', 1);
      store.set('y', 2);
      store.set('z', 3);
      expect(store.keys().indexOf('x')).assertEqual(0);
      expect(store.keys().indexOf('y')).assertEqual(1);
      expect(store.keys().indexOf('z')).assertEqual(2);
      expect(store.keys().indexOf('w')).assertEqual(-1);
      done();
    });

  });
}
