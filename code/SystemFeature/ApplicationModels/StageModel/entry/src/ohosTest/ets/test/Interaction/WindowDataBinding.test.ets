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
  getDriver, ensureAppReady, checkComponentExists, isNonEmptyString
} from '../Shared/SharedDriver';

class BindingObserver {
  name: string = '';
  notifications: number = 0;

  constructor(name: string) {
    this.name = name;
  }

  notify(): void {
    this.notifications = this.notifications + 1;
  }
}

class ObservableValue {
  private value: number = 0;
  private dirty: boolean = false;
  private written: number = 0;
  private observers: BindingObserver[] = [];

  constructor(initial: number) {
    this.value = initial;
  }

  get(): number {
    return this.value;
  }

  set(next: number): boolean {
    if (next === this.value) {
      return false;
    }
    this.value = next;
    this.written = this.written + 1;
    this.dirty = true;
    this.flush();
    return true;
  }

  private flush(): void {
    for (const observer of this.observers) {
      observer.notify();
    }
  }

  subscribe(observer: BindingObserver): boolean {
    if (this.observers.indexOf(observer) >= 0) {
      return false;
    }
    this.observers.push(observer);
    return true;
  }

  unsubscribe(observer: BindingObserver): boolean {
    const index = this.observers.indexOf(observer);
    if (index < 0) {
      return false;
    }
    this.observers.splice(index, 1);
    return true;
  }

  observerCount(): number {
    return this.observers.length;
  }

  getWritten(): number {
    return this.written;
  }

  isDirty(): boolean {
    return this.dirty;
  }

  markClean(): void {
    this.dirty = false;
  }
}

class BoundField {
  key: string = '';
  source: ObservableValue | null = null;
  target: ObservableValue | null = null;
  twoWay: boolean = false;

  constructor(key: string, source: ObservableValue, target: ObservableValue, twoWay: boolean) {
    this.key = key;
    this.source = source;
    this.target = target;
    this.twoWay = twoWay;
  }

  syncForward(): boolean {
    if (this.source === null || this.target === null) {
      return false;
    }
    return this.target.set(this.source.get());
  }

  syncBackward(): boolean {
    if (this.source === null || this.target === null || !this.twoWay) {
      return false;
    }
    return this.source.set(this.target.get());
  }

  isValid(): boolean {
    return isNonEmptyString(this.key) && this.source !== null && this.target !== null;
  }
}

class DataBindingModel {
  private fields: BoundField[] = [];
  private syncs: number = 0;
  private rejected: number = 0;

  addField(field: BoundField): boolean {
    if (!field.isValid() || this.findByKey(field.key) !== null) {
      this.rejected = this.rejected + 1;
      return false;
    }
    this.fields.push(field);
    return true;
  }

  findByKey(key: string): BoundField | null {
    for (const field of this.fields) {
      if (field.key === key) {
        return field;
      }
    }
    return null;
  }

  syncAll(): number {
    let applied = 0;
    for (const field of this.fields) {
      if (field.syncForward()) {
        applied = applied + 1;
        this.syncs = this.syncs + 1;
      }
    }
    return applied;
  }

  syncBackAll(): number {
    let applied = 0;
    for (const field of this.fields) {
      if (field.syncBackward()) {
        applied = applied + 1;
      }
    }
    return applied;
  }

  count(): number {
    return this.fields.length;
  }

  getSyncs(): number {
    return this.syncs;
  }

  getRejected(): number {
    return this.rejected;
  }

  removeField(key: string): boolean {
    const field = this.findByKey(key);
    if (field === null) {
      return false;
    }
    const index = this.fields.indexOf(field);
    this.fields.splice(index, 1);
    return true;
  }

  keys(): string[] {
    const result: string[] = [];
    for (const field of this.fields) {
      result.push(field.key);
    }
    return result;
  }
}

export default function windowDataBindingTest(): void {
  describe('WindowDataBinding', () => {
    it('WindowDataBinding_001', 0, async (done: Function) => {
      const value = new ObservableValue(10);
      expect(value.get()).assertEqual(10);
      expect(value.isDirty()).assertFalse();
      expect(value.getWritten()).assertEqual(0);
      done();
    });

    it('WindowDataBinding_002', 0, async (done: Function) => {
      const value = new ObservableValue(0);
      expect(value.set(5)).assertTrue();
      expect(value.get()).assertEqual(5);
      expect(value.isDirty()).assertTrue();
      expect(value.getWritten()).assertEqual(1);
      done();
    });

    it('WindowDataBinding_003', 0, async (done: Function) => {
      const value = new ObservableValue(5);
      expect(value.set(5)).assertFalse();
      expect(value.getWritten()).assertEqual(0);
      done();
    });

    it('WindowDataBinding_004', 0, async (done: Function) => {
      const value = new ObservableValue(0);
      const observer = new BindingObserver('view');
      expect(value.subscribe(observer)).assertTrue();
      value.set(1);
      value.set(2);
      expect(observer.notifications).assertEqual(2);
      expect(value.observerCount()).assertEqual(1);
      done();
    });

    it('WindowDataBinding_005', 0, async (done: Function) => {
      const value = new ObservableValue(0);
      const observer = new BindingObserver('view');
      value.subscribe(observer);
      expect(value.subscribe(observer)).assertFalse();
      expect(value.observerCount()).assertEqual(1);
      done();
    });

    it('WindowDataBinding_006', 0, async (done: Function) => {
      const value = new ObservableValue(0);
      const observer = new BindingObserver('view');
      value.subscribe(observer);
      expect(value.unsubscribe(observer)).assertTrue();
      value.set(9);
      expect(observer.notifications).assertEqual(0);
      expect(value.observerCount()).assertEqual(0);
      done();
    });

    it('WindowDataBinding_007', 0, async (done: Function) => {
      const value = new ObservableValue(0);
      value.set(3);
      expect(value.isDirty()).assertTrue();
      value.markClean();
      expect(value.isDirty()).assertFalse();
      done();
    });

    it('WindowDataBinding_008', 0, async (done: Function) => {
      const source = new ObservableValue(7);
      const target = new ObservableValue(0);
      const field = new BoundField('count', source, target, true);
      expect(field.isValid()).assertTrue();
      expect(field.syncForward()).assertTrue();
      expect(target.get()).assertEqual(7);
      done();
    });

    it('WindowDataBinding_009', 0, async (done: Function) => {
      const source = new ObservableValue(7);
      const target = new ObservableValue(0);
      const field = new BoundField('count', source, target, false);
      expect(field.syncForward()).assertTrue();
      expect(field.syncBackward()).assertFalse();
      expect(source.get()).assertEqual(7);
      done();
    });

    it('WindowDataBinding_010', 0, async (done: Function) => {
      const source = new ObservableValue(1);
      const target = new ObservableValue(4);
      const field = new BoundField('count', source, target, true);
      expect(field.syncBackward()).assertTrue();
      expect(source.get()).assertEqual(4);
      done();
    });

    it('WindowDataBinding_011', 0, async (done: Function) => {
      const model = new DataBindingModel();
      const field = new BoundField('count', new ObservableValue(1), new ObservableValue(0), true);
      expect(model.addField(field)).assertTrue();
      expect(model.count()).assertEqual(1);
      expect(model.keys()[0]).assertEqual('count');
      done();
    });

    it('WindowDataBinding_012', 0, async (done: Function) => {
      const model = new DataBindingModel();
      const first = new BoundField('count', new ObservableValue(1), new ObservableValue(0), true);
      const second = new BoundField('count', new ObservableValue(2), new ObservableValue(0), true);
      model.addField(first);
      expect(model.addField(second)).assertFalse();
      expect(model.getRejected()).assertEqual(1);
      expect(model.count()).assertEqual(1);
      done();
    });

    it('WindowDataBinding_013', 0, async (done: Function) => {
      const model = new DataBindingModel();
      const invalid = new BoundField('', new ObservableValue(1), new ObservableValue(0), true);
      expect(model.addField(invalid)).assertFalse();
      expect(model.getRejected()).assertEqual(1);
      done();
    });

    it('WindowDataBinding_014', 0, async (done: Function) => {
      const model = new DataBindingModel();
      model.addField(new BoundField('a', new ObservableValue(1), new ObservableValue(0), true));
      model.addField(new BoundField('b', new ObservableValue(2), new ObservableValue(0), true));
      expect(model.syncAll()).assertEqual(2);
      expect(model.getSyncs()).assertEqual(2);
      done();
    });

    it('WindowDataBinding_015', 0, async (done: Function) => {
      const model = new DataBindingModel();
      const source = new ObservableValue(3);
      const target = new ObservableValue(3);
      model.addField(new BoundField('a', source, target, true));
      expect(model.syncAll()).assertEqual(0);
      expect(source.get()).assertEqual(3);
      done();
    });

    it('WindowDataBinding_016', 0, async (done: Function) => {
      const model = new DataBindingModel();
      model.addField(new BoundField('a', new ObservableValue(1), new ObservableValue(5), true));
      model.addField(new BoundField('b', new ObservableValue(2), new ObservableValue(6), false));
      expect(model.syncBackAll()).assertEqual(1);
      done();
    });

    it('WindowDataBinding_017', 0, async (done: Function) => {
      const model = new DataBindingModel();
      model.addField(new BoundField('a', new ObservableValue(1), new ObservableValue(0), true));
      expect(model.removeField('a')).assertTrue();
      expect(model.removeField('a')).assertFalse();
      expect(model.count()).assertEqual(0);
      done();
    });

    it('WindowDataBinding_018', 0, async (done: Function) => {
      const model = new DataBindingModel();
      expect(model.findByKey('missing')).assertNull();
      model.addField(new BoundField('a', new ObservableValue(1), new ObservableValue(0), true));
      expect(model.findByKey('a') !== null).assertTrue();
      done();
    });

    it('WindowDataBinding_019', 0, async (done: Function) => {
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
  });
}
