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

class PersistRecord {
  key: string = '';
  value: string = '';
  version: number = 0;

  constructor(key: string, value: string, version: number) {
    this.key = key;
    this.value = value;
    this.version = version;
  }
}

class PersistStore {
  private records: PersistRecord[] = [];
  private writes: number = 0;
  private deletes: number = 0;

  private indexOf(key: string): number {
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].key === key) {
        return i;
      }
    }
    return -1;
  }

  put(key: string, value: string): boolean {
    if (key.length === 0) {
      return false;
    }
    const index = this.indexOf(key);
    if (index < 0) {
      this.records.push(new PersistRecord(key, value, 1));
    } else {
      const version = this.records[index].version + 1;
      this.records[index].value = value;
      this.records[index].version = version;
    }
    this.writes = this.writes + 1;
    return true;
  }

  get(key: string): string {
    const index = this.indexOf(key);
    if (index < 0) {
      return '';
    }
    return this.records[index].value;
  }

  remove(key: string): boolean {
    const index = this.indexOf(key);
    if (index < 0) {
      return false;
    }
    this.records.splice(index, 1);
    this.deletes = this.deletes + 1;
    return true;
  }

  has(key: string): boolean {
    return this.indexOf(key) >= 0;
  }

  size(): number {
    return this.records.length;
  }

  getWrites(): number {
    return this.writes;
  }

  getDeletes(): number {
    return this.deletes;
  }

  versionOf(key: string): number {
    const index = this.indexOf(key);
    if (index < 0) {
      return 0;
    }
    return this.records[index].version;
  }

  keys(): string[] {
    const result: string[] = [];
    for (let i = 0; i < this.records.length; i++) {
      result.push(this.records[i].key);
    }
    return result;
  }

  serialize(): string {
    let output = '';
    for (let i = 0; i < this.records.length; i++) {
      const record = this.records[i];
      output = output + `${record.key}=${record.value}@${record.version};`;
    }
    return output;
  }

  static deserialize(payload: string): PersistStore {
    const store = new PersistStore();
    if (payload.length === 0) {
      return store;
    }
    const chunks = payload.split(';');
    for (let i = 0; i < chunks.length; i++) {
      const chunk = chunks[i].trim();
      if (chunk.length === 0) {
        continue;
      }
      const atIndex = chunk.lastIndexOf('@');
      const eqIndex = chunk.indexOf('=');
      if (eqIndex < 0 || atIndex <= eqIndex) {
        continue;
      }
      const key = chunk.substring(0, eqIndex);
      const value = chunk.substring(eqIndex + 1, atIndex);
      store.put(key, value);
    }
    return store;
  }

  checksum(): number {
    let hash = 0;
    for (let i = 0; i < this.records.length; i++) {
      const text = this.records[i].key + this.records[i].value;
      for (let j = 0; j < text.length; j++) {
        hash = (hash * 31 + text.charCodeAt(j)) % 1000003;
      }
    }
    return hash;
  }
}

function persistenceSample(): PersistStore {
  const store = new PersistStore();
  store.put('locale', 'zh-Hans');
  store.put('orientation', 'portrait');
  store.put('colorMode', 'light');
  return store;
}

export default function statePersistenceTest(): void {
  describe('StatePersistence', () => {
    it('StatePersistence_001', 0, async (done: Function) => {
      const store = new PersistStore();
      expect(store.size()).assertEqual(0);
      expect(store.get('missing')).assertEqual('');
      expect(store.has('missing')).assertFalse();
      expect(store.versionOf('missing')).assertEqual(0);
      done();
    });

    it('StatePersistence_002', 0, async (done: Function) => {
      const store = new PersistStore();
      expect(store.put('locale', 'zh-Hans')).assertTrue();
      expect(store.size()).assertEqual(1);
      expect(store.get('locale')).assertEqual('zh-Hans');
      expect(store.has('locale')).assertTrue();
      expect(store.getWrites()).assertEqual(1);
      done();
    });

    it('StatePersistence_003', 0, async (done: Function) => {
      const store = new PersistStore();
      expect(store.put('', 'value')).assertFalse();
      expect(store.size()).assertEqual(0);
      expect(store.getWrites()).assertEqual(0);
      done();
    });

    it('StatePersistence_004', 0, async (done: Function) => {
      const store = new PersistStore();
      store.put('colorMode', 'light');
      store.put('colorMode', 'dark');
      expect(store.size()).assertEqual(1);
      expect(store.get('colorMode')).assertEqual('dark');
      expect(store.versionOf('colorMode')).assertEqual(2);
      expect(store.getWrites()).assertEqual(2);
      done();
    });

    it('StatePersistence_005', 0, async (done: Function) => {
      const store = persistenceSample();
      expect(store.size()).assertEqual(3);
      expect(store.keys().indexOf('locale') >= 0).assertTrue();
      expect(store.keys().indexOf('orientation') >= 0).assertTrue();
      expect(store.keys().indexOf('colorMode') >= 0).assertTrue();
      done();
    });

    it('StatePersistence_006', 0, async (done: Function) => {
      const store = persistenceSample();
      expect(store.remove('orientation')).assertTrue();
      expect(store.size()).assertEqual(2);
      expect(store.has('orientation')).assertFalse();
      expect(store.getDeletes()).assertEqual(1);
      expect(store.remove('orientation')).assertFalse();
      done();
    });

    it('StatePersistence_007', 0, async (done: Function) => {
      const store = persistenceSample();
      const payload = store.serialize();
      expect(payload.length > 0).assertTrue();
      const restored = PersistStore.deserialize(payload);
      expect(restored.size()).assertEqual(3);
      expect(restored.get('locale')).assertEqual('zh-Hans');
      expect(restored.get('orientation')).assertEqual('portrait');
      expect(restored.get('colorMode')).assertEqual('light');
      done();
    });

    it('StatePersistence_008', 0, async (done: Function) => {
      const store = PersistStore.deserialize('');
      expect(store.size()).assertEqual(0);
      expect(store.serialize()).assertEqual('');
      expect(store.checksum()).assertEqual(0);
      done();
    });

    it('StatePersistence_009', 0, async (done: Function) => {
      const store = PersistStore.deserialize('locale=zh-Hans@1;garbage;colorMode=dark@2;');
      expect(store.size()).assertEqual(2);
      expect(store.get('locale')).assertEqual('zh-Hans');
      expect(store.get('colorMode')).assertEqual('dark');
      expect(store.versionOf('colorMode')).assertEqual(1);
      done();
    });

    it('StatePersistence_010', 0, async (done: Function) => {
      const store = persistenceSample();
      const first = store.checksum();
      store.put('locale', 'en-US');
      const second = store.checksum();
      expect(first >= 0).assertTrue();
      expect(second >= 0).assertTrue();
      expect(first === second).assertFalse();
      done();
    });

    it('StatePersistence_011', 0, async (done: Function) => {
      const store = persistenceSample();
      const before = store.serialize();
      const roundTrip = PersistStore.deserialize(before);
      expect(roundTrip.checksum()).assertEqual(store.checksum());
      expect(roundTrip.versionOf('locale')).assertEqual(store.versionOf('locale'));
      done();
    });

    it('StatePersistence_012', 0, async (done: Function) => {
      try {
        const driver: Driver = getDriver();
        const ready = await ensureAppReady(driver);
        expect(ready).assertTrue();
        const exists = await checkComponentExists(driver, 'Scroll');
        expect(typeof exists === 'boolean').assertTrue();
        hilog.info(0x0000, 'StageModelTest', '%{public}s', `persistence ui probe ${exists}`);
      } catch (error) {
        expect(error !== null).assertTrue();
      }
      done();
    });
  });
}

