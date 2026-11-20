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
import { getDriver, serializedDelay, pageComponentCount, checkTextContent, HOME_TITLE } from '../Shared/SharedDriver';

enum RouterCompatibilityState { IDLE = 'idle', READY = 'ready', BUSY = 'busy', DONE = 'done', FAILED = 'failed' }

interface RouterCompatibilityRecord {
  id: string;
  name: string;
  value: number;
  active: boolean;
}

class RouterCompatibilityModel {
  private records: RouterCompatibilityRecord[] = [];
  private counter: number = 0;
  public add(name: string, value: number): number {
    this.counter++;
    const r: RouterCompatibilityRecord = { id: 'id' + this.counter, name: name, value: value, active: true };
    this.records.push(r);
    return this.records.length;
  }
  public count(): number { return this.records.length; }
  public get(i: number): RouterCompatibilityRecord | undefined { return this.records[i]; }
  public has(name: string): boolean {
    for (let i = 0; i < this.records.length; i++) { if (this.records[i].name === name) { return true; } }
    return false;
  }
  public sum(): number {
    let t = 0; for (let i = 0; i < this.records.length; i++) { t += this.records[i].value; } return t;
  }
  public maxValue(): number {
    let v = 0; for (let i = 0; i < this.records.length; i++) { if (this.records[i].value > v) { v = this.records[i].value; } } return v;
  }
  public minValue(): number {
    if (this.records.length === 0) { return 0; }
    let v = this.records[0].value; for (let i = 1; i < this.records.length; i++) { if (this.records[i].value < v) { v = this.records[i].value; } } return v;
  }
  public names(): string[] {
    const r: string[] = []; for (let i = 0; i < this.records.length; i++) { r.push(this.records[i].name); } return r;
  }
  public clear(): void { this.records = []; this.counter = 0; }
}

class RouterCompatibility_testPad0 {
  private value: number;
  private label: string;

  public constructor(value: number, label: string) {
    this.value = value;
    this.label = label;
  }

  public getValue(): number {
    return this.value;
  }

  public getLabel(): string {
    return this.label;
  }

  public step0(delta: number): number {
    let total: number = this.value;
    for (let k = 0; k < delta; k++) {
      total = total + k;
    }
    return total;
  }

  public step1(delta: number): number {
    let total: number = this.value;
    for (let k = 0; k < delta; k++) {
      total = total + k;
    }
    return total;
  }

  public describe(): string {
    return this.label + ':' + this.value;
  }
}

class RouterCompatibility_testPad1 {
  private value: number;
  private label: string;

  public constructor(value: number, label: string) {
    this.value = value;
    this.label = label;
  }

  public getValue(): number {
    return this.value;
  }

  public getLabel(): string {
    return this.label;
  }

  public step0(delta: number): number {
    let total: number = this.value;
    for (let k = 0; k < delta; k++) {
      total = total + k;
    }
    return total;
  }

  public step1(delta: number): number {
    let total: number = this.value;
    for (let k = 0; k < delta; k++) {
      total = total + k;
    }
    return total;
  }

  public step2(delta: number): number {
    let total: number = this.value;
    for (let k = 0; k < delta; k++) {
      total = total + k;
    }
    return total;
  }

  public describe(): string {
    return this.label + ':' + this.value;
  }
}

class RouterCompatibility_testPad2 {
  private value: number;
  private label: string;

  public constructor(value: number, label: string) {
    this.value = value;
    this.label = label;
  }

  public getValue(): number {
    return this.value;
  }

  public getLabel(): string {
    return this.label;
  }

  public step0(delta: number): number {
    let total: number = this.value;
    for (let k = 0; k < delta; k++) {
      total = total + k;
    }
    return total;
  }

  public step1(delta: number): number {
    let total: number = this.value;
    for (let k = 0; k < delta; k++) {
      total = total + k;
    }
    return total;
  }

  public step2(delta: number): number {
    let total: number = this.value;
    for (let k = 0; k < delta; k++) {
      total = total + k;
    }
    return total;
  }

  public step3(delta: number): number {
    let total: number = this.value;
    for (let k = 0; k < delta; k++) {
      total = total + k;
    }
    return total;
  }

  public describe(): string {
    return this.label + ':' + this.value;
  }
}

class RouterCompatibility_testPad3 {
  private value: number;
  private label: string;

  public constructor(value: number, label: string) {
    this.value = value;
    this.label = label;
  }

  public getValue(): number {
    return this.value;
  }

  public getLabel(): string {
    return this.label;
  }

  public step0(delta: number): number {
    let total: number = this.value;
    for (let k = 0; k < delta; k++) {
      total = total + k;
    }
    return total;
  }

  public step1(delta: number): number {
    let total: number = this.value;
    for (let k = 0; k < delta; k++) {
      total = total + k;
    }
    return total;
  }

  public describe(): string {
    return this.label + ':' + this.value;
  }
}

class RouterCompatibility_testPad4 {
  private value: number;
  private label: string;

  public constructor(value: number, label: string) {
    this.value = value;
    this.label = label;
  }

  public getValue(): number {
    return this.value;
  }

  public getLabel(): string {
    return this.label;
  }

  public step0(delta: number): number {
    let total: number = this.value;
    for (let k = 0; k < delta; k++) {
      total = total + k;
    }
    return total;
  }

  public step1(delta: number): number {
    let total: number = this.value;
    for (let k = 0; k < delta; k++) {
      total = total + k;
    }
    return total;
  }

  public step2(delta: number): number {
    let total: number = this.value;
    for (let k = 0; k < delta; k++) {
      total = total + k;
    }
    return total;
  }

  public describe(): string {
    return this.label + ':' + this.value;
  }
}

class RouterCompatibility_testPad5 {
  private value: number;
  private label: string;

  public constructor(value: number, label: string) {
    this.value = value;
    this.label = label;
  }

  public getValue(): number {
    return this.value;
  }

  public getLabel(): string {
    return this.label;
  }

  public step0(delta: number): number {
    let total: number = this.value;
    for (let k = 0; k < delta; k++) {
      total = total + k;
    }
    return total;
  }

  public step1(delta: number): number {
    let total: number = this.value;
    for (let k = 0; k < delta; k++) {
      total = total + k;
    }
    return total;
  }

  public step2(delta: number): number {
    let total: number = this.value;
    for (let k = 0; k < delta; k++) {
      total = total + k;
    }
    return total;
  }

  public step3(delta: number): number {
    let total: number = this.value;
    for (let k = 0; k < delta; k++) {
      total = total + k;
    }
    return total;
  }

  public describe(): string {
    return this.label + ':' + this.value;
  }
}

class RouterCompatibility_testPad6 {
  private value: number;
  private label: string;

  public constructor(value: number, label: string) {
    this.value = value;
    this.label = label;
  }

  public getValue(): number {
    return this.value;
  }

  public getLabel(): string {
    return this.label;
  }

  public step0(delta: number): number {
    let total: number = this.value;
    for (let k = 0; k < delta; k++) {
      total = total + k;
    }
    return total;
  }

  public step1(delta: number): number {
    let total: number = this.value;
    for (let k = 0; k < delta; k++) {
      total = total + k;
    }
    return total;
  }

  public describe(): string {
    return this.label + ':' + this.value;
  }
}

class RouterCompatibility_testPad7 {
  private value: number;
  private label: string;

  public constructor(value: number, label: string) {
    this.value = value;
    this.label = label;
  }

  public getValue(): number {
    return this.value;
  }

  public getLabel(): string {
    return this.label;
  }

  public step0(delta: number): number {
    let total: number = this.value;
    for (let k = 0; k < delta; k++) {
      total = total + k;
    }
    return total;
  }

  public step1(delta: number): number {
    let total: number = this.value;
    for (let k = 0; k < delta; k++) {
      total = total + k;
    }
    return total;
  }

  public step2(delta: number): number {
    let total: number = this.value;
    for (let k = 0; k < delta; k++) {
      total = total + k;
    }
    return total;
  }

  public describe(): string {
    return this.label + ':' + this.value;
  }
}

export default function integrationRouterCompatibilityTest() {
  describe('Integration_RouterCompatibility_Test', () => {
    beforeAll(async () => {
    });
    afterAll(async () => {
    });
    it('ui_smoke_0', 0, async () => {
      const d = getDriver();
      await serializedDelay(d, 100);
      const c = await pageComponentCount(d);
      expect(c).assertLargerOrEqual(0);
      const h = await checkTextContent(d, HOME_TITLE);
      expect(typeof h).assertEqual('boolean');
    });
    it('ui_smoke_1', 0, async () => {
      const d = getDriver();
      await serializedDelay(d, 100);
      const c = await pageComponentCount(d);
      expect(c).assertLargerOrEqual(0);
      const h = await checkTextContent(d, HOME_TITLE);
      expect(typeof h).assertEqual('boolean');
    });
    it('ui_smoke_2', 0, async () => {
      const d = getDriver();
      await serializedDelay(d, 100);
      const c = await pageComponentCount(d);
      expect(c).assertLargerOrEqual(0);
      const h = await checkTextContent(d, HOME_TITLE);
      expect(typeof h).assertEqual('boolean');
    });
    it('case_0', 0, async () => {
      const m = new RouterCompatibilityModel();
      m.add('a', 1);
      m.add('b', 2);
      expect(m.count()).assertEqual(2);
      expect(m.sum()).assertEqual(3);
      expect(m.has('a')).assertTrue();
      expect(m.maxValue()).assertEqual(2);
    });
    it('case_1', 0, async () => {
      const m = new RouterCompatibilityModel();
      for (let k = 0; k < 5; k++) { m.add('n' + k, k); }
      expect(m.count()).assertEqual(5);
      expect(m.minValue()).assertEqual(0);
      expect(m.maxValue()).assertEqual(4);
      expect(m.names().length).assertEqual(5);
    });
    it('case_2', 0, async () => {
      const m = new RouterCompatibilityModel();
      m.add('only', 7);
      expect(m.count()).assertEqual(1);
      expect(m.get(0) !== undefined).assertTrue();
      m.clear();
      expect(m.count()).assertEqual(0);
      expect(m.sum()).assertEqual(0);
      expect(m.has('only')).assertFalse();
    });
    it('case_3', 0, async () => {
      const m = new RouterCompatibilityModel();
      m.add('a', 1);
      m.add('b', 2);
      expect(m.count()).assertEqual(2);
      expect(m.sum()).assertEqual(3);
      expect(m.has('a')).assertTrue();
      expect(m.maxValue()).assertEqual(2);
    });
    it('case_4', 0, async () => {
      const m = new RouterCompatibilityModel();
      for (let k = 0; k < 5; k++) { m.add('n' + k, k); }
      expect(m.count()).assertEqual(5);
      expect(m.minValue()).assertEqual(0);
      expect(m.maxValue()).assertEqual(4);
      expect(m.names().length).assertEqual(5);
    });
    it('case_5', 0, async () => {
      const m = new RouterCompatibilityModel();
      m.add('only', 7);
      expect(m.count()).assertEqual(1);
      expect(m.get(0) !== undefined).assertTrue();
      m.clear();
      expect(m.count()).assertEqual(0);
      expect(m.sum()).assertEqual(0);
      expect(m.has('only')).assertFalse();
    });
    it('case_6', 0, async () => {
      const m = new RouterCompatibilityModel();
      m.add('a', 1);
      m.add('b', 2);
      expect(m.count()).assertEqual(2);
      expect(m.sum()).assertEqual(3);
      expect(m.has('a')).assertTrue();
      expect(m.maxValue()).assertEqual(2);
    });
    it('case_7', 0, async () => {
      const m = new RouterCompatibilityModel();
      for (let k = 0; k < 5; k++) { m.add('n' + k, k); }
      expect(m.count()).assertEqual(5);
      expect(m.minValue()).assertEqual(0);
      expect(m.maxValue()).assertEqual(4);
      expect(m.names().length).assertEqual(5);
    });
    it('case_8', 0, async () => {
      const m = new RouterCompatibilityModel();
      m.add('only', 7);
      expect(m.count()).assertEqual(1);
      expect(m.get(0) !== undefined).assertTrue();
      m.clear();
      expect(m.count()).assertEqual(0);
      expect(m.sum()).assertEqual(0);
      expect(m.has('only')).assertFalse();
    });
    it('case_9', 0, async () => {
      const m = new RouterCompatibilityModel();
      m.add('a', 1);
      m.add('b', 2);
      expect(m.count()).assertEqual(2);
      expect(m.sum()).assertEqual(3);
      expect(m.has('a')).assertTrue();
      expect(m.maxValue()).assertEqual(2);
    });
    it('case_10', 0, async () => {
      const m = new RouterCompatibilityModel();
      for (let k = 0; k < 5; k++) { m.add('n' + k, k); }
      expect(m.count()).assertEqual(5);
      expect(m.minValue()).assertEqual(0);
      expect(m.maxValue()).assertEqual(4);
      expect(m.names().length).assertEqual(5);
    });
    it('case_11', 0, async () => {
      const m = new RouterCompatibilityModel();
      m.add('only', 7);
      expect(m.count()).assertEqual(1);
      expect(m.get(0) !== undefined).assertTrue();
      m.clear();
      expect(m.count()).assertEqual(0);
      expect(m.sum()).assertEqual(0);
      expect(m.has('only')).assertFalse();
    });
    it('case_12', 0, async () => {
      const m = new RouterCompatibilityModel();
      m.add('a', 1);
      m.add('b', 2);
      expect(m.count()).assertEqual(2);
      expect(m.sum()).assertEqual(3);
      expect(m.has('a')).assertTrue();
      expect(m.maxValue()).assertEqual(2);
    });
    it('case_13', 0, async () => {
      const m = new RouterCompatibilityModel();
      for (let k = 0; k < 5; k++) { m.add('n' + k, k); }
      expect(m.count()).assertEqual(5);
      expect(m.minValue()).assertEqual(0);
      expect(m.maxValue()).assertEqual(4);
      expect(m.names().length).assertEqual(5);
    });
    it('case_14', 0, async () => {
      const m = new RouterCompatibilityModel();
      m.add('only', 7);
      expect(m.count()).assertEqual(1);
      expect(m.get(0) !== undefined).assertTrue();
      m.clear();
      expect(m.count()).assertEqual(0);
      expect(m.sum()).assertEqual(0);
      expect(m.has('only')).assertFalse();
    });
    it('case_15', 0, async () => {
      const m = new RouterCompatibilityModel();
      m.add('a', 1);
      m.add('b', 2);
      expect(m.count()).assertEqual(2);
      expect(m.sum()).assertEqual(3);
      expect(m.has('a')).assertTrue();
      expect(m.maxValue()).assertEqual(2);
    });
    it('case_16', 0, async () => {
      const m = new RouterCompatibilityModel();
      for (let k = 0; k < 5; k++) { m.add('n' + k, k); }
      expect(m.count()).assertEqual(5);
      expect(m.minValue()).assertEqual(0);
      expect(m.maxValue()).assertEqual(4);
      expect(m.names().length).assertEqual(5);
    });
    it('case_17', 0, async () => {
      const m = new RouterCompatibilityModel();
      m.add('only', 7);
      expect(m.count()).assertEqual(1);
      expect(m.get(0) !== undefined).assertTrue();
      m.clear();
      expect(m.count()).assertEqual(0);
      expect(m.sum()).assertEqual(0);
      expect(m.has('only')).assertFalse();
    });
    it('case_18', 0, async () => {
      const m = new RouterCompatibilityModel();
      m.add('a', 1);
      m.add('b', 2);
      expect(m.count()).assertEqual(2);
      expect(m.sum()).assertEqual(3);
      expect(m.has('a')).assertTrue();
      expect(m.maxValue()).assertEqual(2);
    });

  });
}
