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

class FeatureItem {
  public key: string;
  public title: string;
  public value: string;
  public numberValue: number;
  public enabled: boolean;
  public category: string;

  constructor(key: string, title: string, value: string, numberValue: number, enabled: boolean, category: string) {
    this.key = key;
    this.title = title;
    this.value = value;
    this.numberValue = numberValue;
    this.enabled = enabled;
    this.category = category;
  }

  public static createDefault(): FeatureItem {
    return new FeatureItem('', '', '', 0, false, 'general');
  }

  public static create(key: string, numberValue: number, category: string): FeatureItem {
    return new FeatureItem(key, 'title_' + key, 'value_' + key, numberValue, false, category);
  }

  public clone(): FeatureItem {
    return new FeatureItem(this.key, this.title, this.value, this.numberValue, this.enabled, this.category);
  }

  public equals(other: FeatureItem): boolean {
    return this.key === other.key && this.title === other.title && this.value === other.value &&
      this.numberValue === other.numberValue && this.enabled === other.enabled && this.category === other.category;
  }

  public toString(): string {
    return 'FeatureItem{key: ' + this.key + ', value: ' + this.value + ', number: ' + this.numberValue + '}';
  }

  public isValid(): boolean {
    return this.key.length > 0 && this.title.length > 0;
  }

  public isEmpty(): boolean {
    return this.key.length === 0 && this.title.length === 0 && this.value.length === 0;
  }

  public getValue(): string {
    return this.value;
  }

  public setValue(value: string): void {
    this.value = value;
  }

  public getNumberValue(): number {
    return this.numberValue;
  }

  public setNumberValue(numberValue: number): void {
    this.numberValue = numberValue;
  }

  public isEnabled(): boolean {
    return this.enabled;
  }

  public setEnabled(enabled: boolean): void {
    this.enabled = enabled;
  }

  public getCategory(): string {
    return this.category;
  }

  public compareNumber(other: FeatureItem): number {
    if (this.numberValue === other.numberValue) {
      return 0;
    }
    return this.numberValue > other.numberValue ? 1 : -1;
  }

  public compareKey(other: FeatureItem): number {
    if (this.key === other.key) {
      return 0;
    }
    return this.key > other.key ? 1 : -1;
  }
}

class FeatureCatalog {
  public static createMenu(): FeatureItem[] {
    return [
      new FeatureItem('battery_statistics', 'Battery statistics', '', 0, true, 'battery'),
      new FeatureItem('brightness_manager', 'Brightness manager', '', 1, true, 'system'),
      new FeatureItem('power_manager', 'Power manager', '', 2, true, 'power'),
      new FeatureItem('settings', 'Settings', '', 3, true, 'system'),
      new FeatureItem('system_capability', 'System capability', '', 4, true, 'system'),
      new FeatureItem('system_parameter', 'System parameter', '', 5, true, 'system'),
      new FeatureItem('battery_info', 'Battery info', '', 6, true, 'battery'),
      new FeatureItem('device_info', 'Device info', '', 7, true, 'device'),
      new FeatureItem('input_consumer', 'Input consumer', '', 8, true, 'input'),
      new FeatureItem('mouse_pointer', 'Mouse pointer', '', 9, true, 'mouse'),
      new FeatureItem('input_event', 'Input event', '', 10, true, 'input'),
      new FeatureItem('input_device', 'Input device', '', 11, true, 'input'),
      new FeatureItem('input_key_event', 'Input key event', '', 12, true, 'input')
    ];
  }

  public static createCount(count: number, base: number, category: string): FeatureItem[] {
    const items: FeatureItem[] = [];
    for (let i = 0; i < count; i++) {
      items.push(FeatureItem.create(category + '.' + i, base + i, category));
    }
    return items;
  }

  public static createStandard(category: string): FeatureItem[] {
    return FeatureCatalog.createCount(6, 0, category);
  }
}

class FeatureValidator {
  public static isValid(item: FeatureItem): boolean {
    return item.isValid();
  }

  public static allValid(list: FeatureItem[]): boolean {
    return list.every((item: FeatureItem) => FeatureValidator.isValid(item));
  }

  public static hasDuplicateKey(list: FeatureItem[]): boolean {
    const seen: string[] = [];
    for (const item of list) {
      if (seen.indexOf(item.key) >= 0) {
        return true;
      }
      seen.push(item.key);
    }
    return false;
  }

  public static countEnabled(list: FeatureItem[]): number {
    return list.filter((item: FeatureItem) => item.isEnabled()).length;
  }

  public static isSortedAsc(list: FeatureItem[]): boolean {
    for (let i = 1; i < list.length; i++) {
      if (list[i - 1].getNumberValue() > list[i].getNumberValue()) {
        return false;
      }
    }
    return true;
  }

  public static countByCategory(list: FeatureItem[], category: string): number {
    return list.filter((item: FeatureItem) => item.getCategory() === category).length;
  }
}

class FeatureSorter {
  public static byNumberAsc(list: FeatureItem[]): FeatureItem[] {
    const copied: FeatureItem[] = [...list];
    copied.sort((a: FeatureItem, b: FeatureItem) => a.getNumberValue() - b.getNumberValue());
    return copied;
  }

  public static byNumberDesc(list: FeatureItem[]): FeatureItem[] {
    const copied: FeatureItem[] = [...list];
    copied.sort((a: FeatureItem, b: FeatureItem) => b.getNumberValue() - a.getNumberValue());
    return copied;
  }

  public static byKey(list: FeatureItem[]): FeatureItem[] {
    const copied: FeatureItem[] = [...list];
    copied.sort((a: FeatureItem, b: FeatureItem) => a.compareKey(b));
    return copied;
  }

  public static byTitleLength(list: FeatureItem[]): FeatureItem[] {
    const copied: FeatureItem[] = [...list];
    copied.sort((a: FeatureItem, b: FeatureItem) => a.title.length - b.title.length);
    return copied;
  }
}

class FeatureStatistics {
  private items: FeatureItem[] = [];

  public collect(list: FeatureItem[]): void {
    this.items.push(...list);
  }

  public getCount(): number {
    return this.items.length;
  }

  public getTotal(): number {
    let total: number = 0;
    this.items.forEach((item: FeatureItem) => {
      total += item.getNumberValue();
    });
    return total;
  }

  public getAverage(): number {
    if (this.items.length === 0) {
      return 0;
    }
    return this.getTotal() / this.items.length;
  }

  public getMax(): number {
    if (this.items.length === 0) {
      return 0;
    }
    let max: number = this.items[0].getNumberValue();
    this.items.forEach((item: FeatureItem) => {
      if (item.getNumberValue() > max) {
        max = item.getNumberValue();
      }
    });
    return max;
  }

  public getMin(): number {
    if (this.items.length === 0) {
      return 0;
    }
    let min: number = this.items[0].getNumberValue();
    this.items.forEach((item: FeatureItem) => {
      if (item.getNumberValue() < min) {
        min = item.getNumberValue();
      }
    });
    return min;
  }

  public countEnabled(): number {
    return this.items.filter((item: FeatureItem) => item.isEnabled()).length;
  }

  public countCategory(category: string): number {
    return this.items.filter((item: FeatureItem) => item.getCategory() === category).length;
  }

  public clear(): void {
    this.items = [];
  }
}

class FeatureCollection {
  private items: FeatureItem[] = [];

  public add(item: FeatureItem): void {
    this.items.push(item);
  }

  public addAll(list: FeatureItem[]): void {
    this.items.push(...list);
  }

  public getCount(): number {
    return this.items.length;
  }

  public getByIndex(index: number): FeatureItem | null {
    if (index < 0 || index >= this.items.length) {
      return null;
    }
    return this.items[index];
  }

  public findByKey(key: string): FeatureItem | null {
    const found = this.items.filter((item: FeatureItem) => item.key === key);
    if (found.length === 0) {
      return null;
    }
    return found[0];
  }

  public contains(key: string): boolean {
    return this.findByKey(key) !== null;
  }

  public removeByKey(key: string): boolean {
    const index: number = this.items.findIndex((item: FeatureItem) => item.key === key);
    if (index < 0) {
      return false;
    }
    this.items.splice(index, 1);
    return true;
  }

  public getItems(): FeatureItem[] {
    return [...this.items];
  }

  public clear(): void {
    this.items = [];
  }
}

function buildFeatureKey(category: string, index: number): string {
  return category + '.' + index;
}

class FeatureMatrix {
  private items: FeatureItem[] = [];

  public add(item: FeatureItem): void {
    this.items.push(item);
  }

  public addAll(list: FeatureItem[]): void {
    this.items.push(...list);
  }

  public getCount(): number {
    return this.items.length;
  }

  public get(index: number): FeatureItem | null {
    if (index < 0 || index >= this.items.length) {
      return null;
    }
    return this.items[index];
  }

  public filterByCategory(category: string): FeatureItem[] {
    return this.items.filter((item: FeatureItem) => item.getCategory() === category);
  }

  public getEnabled(): FeatureItem[] {
    return this.items.filter((item: FeatureItem) => item.isEnabled());
  }

  public getTotal(): number {
    let total: number = 0;
    this.items.forEach((item: FeatureItem) => {
      total += item.getNumberValue();
    });
    return total;
  }

  public getAverage(): number {
    if (this.items.length === 0) {
      return 0;
    }
    return this.getTotal() / this.items.length;
  }

  public groupByCategory(): Map<string, number> {
    const result: Map<string, number> = new Map<string, number>();
    this.items.forEach((item: FeatureItem) => {
      const current: number = result.get(item.getCategory()) ?? 0;
      result.set(item.getCategory(), current + 1);
    });
    return result;
  }

  public clear(): void {
    this.items = [];
  }
}

class FeatureMatrixReport {
  private matrix: FeatureMatrix;

  constructor(matrix: FeatureMatrix) {
    this.matrix = matrix;
  }

  public getSummary(): string {
    return 'items:' + this.matrix.getCount() + ',total:' + this.matrix.getTotal();
  }

  public isStable(): boolean {
    return this.matrix.getCount() >= 0 && this.matrix.getTotal() >= 0;
  }
}

class FeatureAggregator {
  private items: FeatureItem[] = [];

  public add(item: FeatureItem): void {
    this.items.push(item);
  }

  public addAll(list: FeatureItem[]): void {
    this.items.push(...list);
  }

  public getCount(): number {
    return this.items.length;
  }

  public getEnabledCount(): number {
    return this.items.filter((item: FeatureItem) => item.isEnabled()).length;
  }

  public getDisabledCount(): number {
    return this.items.filter((item: FeatureItem) => !item.isEnabled()).length;
  }

  public getCategoryCount(category: string): number {
    return this.items.filter((item: FeatureItem) => item.getCategory() === category).length;
  }

  public getValidCount(): number {
    return this.items.filter((item: FeatureItem) => item.isValid()).length;
  }

  public getInvalidCount(): number {
    return this.items.filter((item: FeatureItem) => !item.isValid()).length;
  }

  public getFirstEnabled(): FeatureItem | null {
    const found = this.items.filter((item: FeatureItem) => item.isEnabled());
    return found.length === 0 ? null : found[0];
  }

  public getLastEnabled(): FeatureItem | null {
    const found = this.items.filter((item: FeatureItem) => item.isEnabled());
    return found.length === 0 ? null : found[found.length - 1];
  }

  public findMin(): FeatureItem | null {
    if (this.items.length === 0) {
      return null;
    }
    let result: FeatureItem = this.items[0];
    this.items.forEach((item: FeatureItem) => {
      if (item.getNumberValue() < result.getNumberValue()) {
        result = item;
      }
    });
    return result;
  }

  public findMax(): FeatureItem | null {
    if (this.items.length === 0) {
      return null;
    }
    let result: FeatureItem = this.items[0];
    this.items.forEach((item: FeatureItem) => {
      if (item.getNumberValue() > result.getNumberValue()) {
        result = item;
      }
    });
    return result;
  }

  public toKeys(): string[] {
    return this.items.map((item: FeatureItem) => item.key);
  }

  public clear(): void {
    this.items = [];
  }
}


export default function configurationChangesTest() {
  describe('ConfigurationChanges', () => {
    it('ConfigurationChanges_case_0', 0, (done: () => void) => {
      try {
        const item: FeatureItem = FeatureItem.createDefault();
        expect(item.key).assertEqual('');
        expect(item.title).assertEqual('');
        expect(item.isValid()).assertFalse();
        expect(item.isEmpty()).assertTrue();
        expect(item.isEnabled()).assertFalse();
        expect(item.getNumberValue()).assertEqual(0);
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('ConfigurationChanges_case_1', 0, (done: () => void) => {
      try {
        const item = FeatureItem.create('system.settings', 11, 'system');
        expect(item.key).assertEqual('system.settings');
        expect(item.getNumberValue()).assertEqual(11);
        expect(item.getCategory()).assertEqual('system');
        expect(item.isValid()).assertTrue();
        expect(item.getValue().length > 0).assertTrue();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('ConfigurationChanges_case_2', 0, (done: () => void) => {
      try {
        const original = FeatureItem.create('system.capability', 12, 'system');
        const copied = original.clone();
        expect(original.equals(copied)).assertTrue();
        expect(copied.getCategory()).assertEqual('system');
        copied.setNumberValue(112);
        expect(original.getNumberValue()).assertEqual(12);
        expect(copied.getNumberValue()).assertEqual(112);
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('ConfigurationChanges_case_3', 0, (done: () => void) => {
      try {
        const item = FeatureItem.create('system.parameter', 13, 'system');
        const text: string = item.toString();
        expect(text.includes('system.parameter')).assertTrue();
        expect(text.includes('system')).assertTrue();
        expect(text.includes('13')).assertTrue();
        expect(text.length > 0).assertTrue();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('ConfigurationChanges_case_4', 0, (done: () => void) => {
      try {
        const item = new FeatureItem('system.resource', 'system resource', 'system_value', 14, true, 'system');
        expect(item.getValue()).assertEqual('system_value');
        item.setValue('system_updated');
        expect(item.getValue()).assertEqual('system_updated');
        expect(item.isEnabled()).assertTrue();
        expect(item.getCategory()).assertEqual('system');
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('ConfigurationChanges_case_5', 0, (done: () => void) => {
      try {
        const item = FeatureItem.create('system.event', 15, 'system');
        expect(item.isEnabled()).assertFalse();
        item.setEnabled(true);
        expect(item.isEnabled()).assertTrue();
        item.setEnabled(false);
        expect(item.isEnabled()).assertFalse();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('ConfigurationChanges_case_6', 0, (done: () => void) => {
      try {
        const low = FeatureItem.create('system.configuration_low', 16, 'system');
        const high = FeatureItem.create('system.configuration_high', 41, 'system');
        expect(low.compareNumber(high)).assertLessOrEqual(-1);
        expect(high.compareNumber(low)).assertLargerOrEqual(1);
        expect(low.compareNumber(low)).assertEqual(0);
        expect(low.compareKey(low)).assertEqual(0);
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('ConfigurationChanges_case_7', 0, (done: () => void) => {
      try {
        const list: FeatureItem[] = FeatureCatalog.createCount(4, 17, 'system');
        expect(list.length).assertEqual(4);
        expect(list[0].getCategory()).assertEqual('system');
        expect(FeatureValidator.allValid(list)).assertTrue();
        expect(FeatureValidator.hasDuplicateKey(list)).assertFalse();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
  });
}
