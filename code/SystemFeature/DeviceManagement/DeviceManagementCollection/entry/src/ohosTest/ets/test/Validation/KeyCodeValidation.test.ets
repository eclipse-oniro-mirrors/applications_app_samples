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


export default function keyCodeValidationTest() {
  describe('KeyCodeValidation', () => {
    it('KeyCodeValidation_case_0', 0, (done: () => void) => {
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
    it('KeyCodeValidation_case_1', 0, (done: () => void) => {
      try {
        const item = FeatureItem.create('input.mouse', 11, 'input');
        expect(item.key).assertEqual('input.mouse');
        expect(item.getNumberValue()).assertEqual(11);
        expect(item.getCategory()).assertEqual('input');
        expect(item.isValid()).assertTrue();
        expect(item.getValue().length > 0).assertTrue();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_2', 0, (done: () => void) => {
      try {
        const original = FeatureItem.create('input.touchpad', 12, 'input');
        const copied = original.clone();
        expect(original.equals(copied)).assertTrue();
        expect(copied.getCategory()).assertEqual('input');
        copied.setNumberValue(112);
        expect(original.getNumberValue()).assertEqual(12);
        expect(copied.getNumberValue()).assertEqual(112);
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_3', 0, (done: () => void) => {
      try {
        const item = FeatureItem.create('input.touchscreen', 13, 'input');
        const text: string = item.toString();
        expect(text.includes('input.touchscreen')).assertTrue();
        expect(text.includes('input')).assertTrue();
        expect(text.includes('13')).assertTrue();
        expect(text.length > 0).assertTrue();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_4', 0, (done: () => void) => {
      try {
        const item = new FeatureItem('input.joystick', 'input joystick', 'input_value', 14, true, 'input');
        expect(item.getValue()).assertEqual('input_value');
        item.setValue('input_updated');
        expect(item.getValue()).assertEqual('input_updated');
        expect(item.isEnabled()).assertTrue();
        expect(item.getCategory()).assertEqual('input');
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_5', 0, (done: () => void) => {
      try {
        const item = FeatureItem.create('input.trackball', 15, 'input');
        expect(item.isEnabled()).assertFalse();
        item.setEnabled(true);
        expect(item.isEnabled()).assertTrue();
        item.setEnabled(false);
        expect(item.isEnabled()).assertFalse();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_6', 0, (done: () => void) => {
      try {
        const low = FeatureItem.create('input.consumer_low', 16, 'input');
        const high = FeatureItem.create('input.consumer_high', 41, 'input');
        expect(low.compareNumber(high)).assertLessOrEqual(-1);
        expect(high.compareNumber(low)).assertLargerOrEqual(1);
        expect(low.compareNumber(low)).assertEqual(0);
        expect(low.compareKey(low)).assertEqual(0);
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_7', 0, (done: () => void) => {
      try {
        const list: FeatureItem[] = FeatureCatalog.createCount(4, 17, 'input');
        expect(list.length).assertEqual(4);
        expect(list[0].getCategory()).assertEqual('input');
        expect(FeatureValidator.allValid(list)).assertTrue();
        expect(FeatureValidator.hasDuplicateKey(list)).assertFalse();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_8', 0, (done: () => void) => {
      try {
        const list: FeatureItem[] = FeatureCatalog.createCount(3, 18, 'input');
        expect(FeatureValidator.hasDuplicateKey(list)).assertFalse();
        list.push(FeatureItem.create(list[0].key, 18, 'input'));
        expect(FeatureValidator.hasDuplicateKey(list)).assertTrue();
        expect(list.length).assertEqual(4);
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_9', 0, (done: () => void) => {
      try {
        const list: FeatureItem[] = FeatureCatalog.createCount(6, 19, 'input');
        const asc: FeatureItem[] = FeatureSorter.byNumberAsc(list);
        expect(FeatureValidator.isSortedAsc(asc)).assertTrue();
        const desc: FeatureItem[] = FeatureSorter.byNumberDesc(list);
        expect(desc[0].getNumberValue()).assertLargerOrEqual(desc[desc.length - 1].getNumberValue());
        expect(asc[0].getNumberValue()).assertEqual(19);
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_10', 0, (done: () => void) => {
      try {
        const stats = new FeatureStatistics();
        stats.collect(FeatureCatalog.createCount(4, 20, 'input'));
        expect(stats.getCount()).assertEqual(4);
        expect(stats.getTotal()).assertEqual(86);
        expect(stats.getMin()).assertEqual(20);
        expect(stats.getMax()).assertEqual(23);
        expect(stats.getAverage()).assertEqual(21.5);
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_11', 0, (done: () => void) => {
      try {
        const collection = new FeatureCollection();
        collection.addAll(FeatureCatalog.createCount(3, 21, 'input'));
        expect(collection.getCount()).assertEqual(3);
        expect(collection.contains('input.1')).assertTrue();
        expect(collection.removeByKey('input.1')).assertTrue();
        expect(collection.getCount()).assertEqual(2);
        expect(collection.removeByKey('missing.key')).assertFalse();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_12', 0, (done: () => void) => {
      try {
        const collection = new FeatureCollection();
        collection.addAll(FeatureCatalog.createCount(2, 22, 'input'));
        expect(collection.getByIndex(-1) === null).assertTrue();
        expect(collection.getByIndex(0) !== null).assertTrue();
        expect(collection.getByIndex(5) === null).assertTrue();
        expect(collection.findByKey('input.0') !== null).assertTrue();
        expect(collection.findByKey('input.9') === null).assertTrue();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_13', 0, (done: () => void) => {
      try {
        const item = FeatureItem.create('input.touchscreen', 1000023, 'input');
        expect(item.getNumberValue()).assertEqual(1000023);
        expect(item.isValid()).assertTrue();
        expect(item.getCategory()).assertEqual('input');
        expect(item.toString().includes('input.touchscreen')).assertTrue();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_14', 0, (done: () => void) => {
      try {
        const item = FeatureItem.create('input.joystick', -24, 'input');
        expect(item.getNumberValue()).assertEqual(-24);
        expect(item.compareNumber(FeatureItem.createDefault())).assertLessOrEqual(0);
        expect(item.getValue().length > 0).assertTrue();
        expect(item.isValid()).assertTrue();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_15', 0, (done: () => void) => {
      try {
        const item = new FeatureItem('', '', '', 25, false, 'input');
        expect(item.isValid()).assertFalse();
        expect(item.isEmpty()).assertTrue();
        expect(item.getCategory()).assertEqual('input');
        expect(item.getNumberValue()).assertEqual(25);
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_16', 0, (done: () => void) => {
      try {
        const menu: FeatureItem[] = FeatureCatalog.createMenu();
        expect(menu.length).assertEqual(13);
        expect(menu[0].key.length > 0).assertTrue();
        expect(FeatureValidator.countEnabled(menu)).assertEqual(13);
        expect(FeatureValidator.countByCategory(menu, 'input')).assertEqual(4);
        expect(menu[12].getCategory()).assertEqual('input');
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_17', 0, (done: () => void) => {
      try {
        const first = FeatureItem.create('input.event.a', 27, 'input');
        const second = FeatureItem.create('input.event.b', 27, 'input');
        expect(first.compareKey(second)).assertLessOrEqual(-1);
        expect(second.compareKey(first)).assertLargerOrEqual(1);
        expect(first.compareKey(first)).assertEqual(0);
        expect(first.equals(second)).assertFalse();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_18', 0, (done: () => void) => {
      try {
        const list: FeatureItem[] = FeatureCatalog.createCount(5, 28, 'input');
        list.push(FeatureItem.create('other.0', 28, 'general'));
        expect(FeatureValidator.countByCategory(list, 'input')).assertEqual(5);
        expect(FeatureValidator.countByCategory(list, 'general')).assertEqual(1);
        expect(list.length).assertEqual(6);
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_19', 0, (done: () => void) => {
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
    it('KeyCodeValidation_case_20', 0, (done: () => void) => {
      try {
        const item = FeatureItem.create('input.keyboard', 30, 'input');
        expect(item.key).assertEqual('input.keyboard');
        expect(item.getNumberValue()).assertEqual(30);
        expect(item.getCategory()).assertEqual('input');
        expect(item.isValid()).assertTrue();
        expect(item.getValue().length > 0).assertTrue();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_21', 0, (done: () => void) => {
      try {
        const original = FeatureItem.create('input.mouse', 31, 'input');
        const copied = original.clone();
        expect(original.equals(copied)).assertTrue();
        expect(copied.getCategory()).assertEqual('input');
        copied.setNumberValue(131);
        expect(original.getNumberValue()).assertEqual(31);
        expect(copied.getNumberValue()).assertEqual(131);
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_22', 0, (done: () => void) => {
      try {
        const item = FeatureItem.create('input.touchpad', 32, 'input');
        const text: string = item.toString();
        expect(text.includes('input.touchpad')).assertTrue();
        expect(text.includes('input')).assertTrue();
        expect(text.includes('32')).assertTrue();
        expect(text.length > 0).assertTrue();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_23', 0, (done: () => void) => {
      try {
        const item = new FeatureItem('input.touchscreen', 'input touchscreen', 'input_value', 33, true, 'input');
        expect(item.getValue()).assertEqual('input_value');
        item.setValue('input_updated');
        expect(item.getValue()).assertEqual('input_updated');
        expect(item.isEnabled()).assertTrue();
        expect(item.getCategory()).assertEqual('input');
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_24', 0, (done: () => void) => {
      try {
        const item = FeatureItem.create('input.joystick', 34, 'input');
        expect(item.isEnabled()).assertFalse();
        item.setEnabled(true);
        expect(item.isEnabled()).assertTrue();
        item.setEnabled(false);
        expect(item.isEnabled()).assertFalse();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_25', 0, (done: () => void) => {
      try {
        const low = FeatureItem.create('input.trackball_low', 35, 'input');
        const high = FeatureItem.create('input.trackball_high', 60, 'input');
        expect(low.compareNumber(high)).assertLessOrEqual(-1);
        expect(high.compareNumber(low)).assertLargerOrEqual(1);
        expect(low.compareNumber(low)).assertEqual(0);
        expect(low.compareKey(low)).assertEqual(0);
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_26', 0, (done: () => void) => {
      try {
        const list: FeatureItem[] = FeatureCatalog.createCount(9, 36, 'input');
        expect(list.length).assertEqual(9);
        expect(list[0].getCategory()).assertEqual('input');
        expect(FeatureValidator.allValid(list)).assertTrue();
        expect(FeatureValidator.hasDuplicateKey(list)).assertFalse();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_27', 0, (done: () => void) => {
      try {
        const list: FeatureItem[] = FeatureCatalog.createCount(3, 37, 'input');
        expect(FeatureValidator.hasDuplicateKey(list)).assertFalse();
        list.push(FeatureItem.create(list[0].key, 37, 'input'));
        expect(FeatureValidator.hasDuplicateKey(list)).assertTrue();
        expect(list.length).assertEqual(4);
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_28', 0, (done: () => void) => {
      try {
        const list: FeatureItem[] = FeatureCatalog.createCount(6, 38, 'input');
        const asc: FeatureItem[] = FeatureSorter.byNumberAsc(list);
        expect(FeatureValidator.isSortedAsc(asc)).assertTrue();
        const desc: FeatureItem[] = FeatureSorter.byNumberDesc(list);
        expect(desc[0].getNumberValue()).assertLargerOrEqual(desc[desc.length - 1].getNumberValue());
        expect(asc[0].getNumberValue()).assertEqual(38);
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_29', 0, (done: () => void) => {
      try {
        const stats = new FeatureStatistics();
        stats.collect(FeatureCatalog.createCount(4, 39, 'input'));
        expect(stats.getCount()).assertEqual(4);
        expect(stats.getTotal()).assertEqual(162);
        expect(stats.getMin()).assertEqual(39);
        expect(stats.getMax()).assertEqual(42);
        expect(stats.getAverage()).assertEqual(40.5);
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_30', 0, (done: () => void) => {
      try {
        const collection = new FeatureCollection();
        collection.addAll(FeatureCatalog.createCount(3, 40, 'input'));
        expect(collection.getCount()).assertEqual(3);
        expect(collection.contains('input.1')).assertTrue();
        expect(collection.removeByKey('input.1')).assertTrue();
        expect(collection.getCount()).assertEqual(2);
        expect(collection.removeByKey('missing.key')).assertFalse();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_31', 0, (done: () => void) => {
      try {
        const collection = new FeatureCollection();
        collection.addAll(FeatureCatalog.createCount(2, 41, 'input'));
        expect(collection.getByIndex(-1) === null).assertTrue();
        expect(collection.getByIndex(0) !== null).assertTrue();
        expect(collection.getByIndex(5) === null).assertTrue();
        expect(collection.findByKey('input.0') !== null).assertTrue();
        expect(collection.findByKey('input.9') === null).assertTrue();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_32', 0, (done: () => void) => {
      try {
        const item = FeatureItem.create('input.touchpad', 1000042, 'input');
        expect(item.getNumberValue()).assertEqual(1000042);
        expect(item.isValid()).assertTrue();
        expect(item.getCategory()).assertEqual('input');
        expect(item.toString().includes('input.touchpad')).assertTrue();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_33', 0, (done: () => void) => {
      try {
        const item = FeatureItem.create('input.touchscreen', -43, 'input');
        expect(item.getNumberValue()).assertEqual(-43);
        expect(item.compareNumber(FeatureItem.createDefault())).assertLessOrEqual(0);
        expect(item.getValue().length > 0).assertTrue();
        expect(item.isValid()).assertTrue();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_34', 0, (done: () => void) => {
      try {
        const item = new FeatureItem('', '', '', 44, false, 'input');
        expect(item.isValid()).assertFalse();
        expect(item.isEmpty()).assertTrue();
        expect(item.getCategory()).assertEqual('input');
        expect(item.getNumberValue()).assertEqual(44);
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_35', 0, (done: () => void) => {
      try {
        const menu: FeatureItem[] = FeatureCatalog.createMenu();
        expect(menu.length).assertEqual(13);
        expect(menu[0].key.length > 0).assertTrue();
        expect(FeatureValidator.countEnabled(menu)).assertEqual(13);
        expect(FeatureValidator.countByCategory(menu, 'input')).assertEqual(4);
        expect(menu[12].getCategory()).assertEqual('input');
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_36', 0, (done: () => void) => {
      try {
        const first = FeatureItem.create('input.consumer.a', 46, 'input');
        const second = FeatureItem.create('input.consumer.b', 46, 'input');
        expect(first.compareKey(second)).assertLessOrEqual(-1);
        expect(second.compareKey(first)).assertLargerOrEqual(1);
        expect(first.compareKey(first)).assertEqual(0);
        expect(first.equals(second)).assertFalse();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_37', 0, (done: () => void) => {
      try {
        const list: FeatureItem[] = FeatureCatalog.createCount(5, 47, 'input');
        list.push(FeatureItem.create('other.0', 47, 'general'));
        expect(FeatureValidator.countByCategory(list, 'input')).assertEqual(5);
        expect(FeatureValidator.countByCategory(list, 'general')).assertEqual(1);
        expect(list.length).assertEqual(6);
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_38', 0, (done: () => void) => {
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
    it('KeyCodeValidation_case_39', 0, (done: () => void) => {
      try {
        const item = FeatureItem.create('input.touchEvent', 49, 'input');
        expect(item.key).assertEqual('input.touchEvent');
        expect(item.getNumberValue()).assertEqual(49);
        expect(item.getCategory()).assertEqual('input');
        expect(item.isValid()).assertTrue();
        expect(item.getValue().length > 0).assertTrue();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_40', 0, (done: () => void) => {
      try {
        const original = FeatureItem.create('input.keyboard', 10, 'input');
        const copied = original.clone();
        expect(original.equals(copied)).assertTrue();
        expect(copied.getCategory()).assertEqual('input');
        copied.setNumberValue(110);
        expect(original.getNumberValue()).assertEqual(10);
        expect(copied.getNumberValue()).assertEqual(110);
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_41', 0, (done: () => void) => {
      try {
        const item = FeatureItem.create('input.mouse', 11, 'input');
        const text: string = item.toString();
        expect(text.includes('input.mouse')).assertTrue();
        expect(text.includes('input')).assertTrue();
        expect(text.includes('11')).assertTrue();
        expect(text.length > 0).assertTrue();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_42', 0, (done: () => void) => {
      try {
        const item = new FeatureItem('input.touchpad', 'input touchpad', 'input_value', 12, true, 'input');
        expect(item.getValue()).assertEqual('input_value');
        item.setValue('input_updated');
        expect(item.getValue()).assertEqual('input_updated');
        expect(item.isEnabled()).assertTrue();
        expect(item.getCategory()).assertEqual('input');
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_43', 0, (done: () => void) => {
      try {
        const item = FeatureItem.create('input.touchscreen', 13, 'input');
        expect(item.isEnabled()).assertFalse();
        item.setEnabled(true);
        expect(item.isEnabled()).assertTrue();
        item.setEnabled(false);
        expect(item.isEnabled()).assertFalse();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_44', 0, (done: () => void) => {
      try {
        const low = FeatureItem.create('input.joystick_low', 14, 'input');
        const high = FeatureItem.create('input.joystick_high', 39, 'input');
        expect(low.compareNumber(high)).assertLessOrEqual(-1);
        expect(high.compareNumber(low)).assertLargerOrEqual(1);
        expect(low.compareNumber(low)).assertEqual(0);
        expect(low.compareKey(low)).assertEqual(0);
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_45', 0, (done: () => void) => {
      try {
        const list: FeatureItem[] = FeatureCatalog.createCount(7, 15, 'input');
        expect(list.length).assertEqual(7);
        expect(list[0].getCategory()).assertEqual('input');
        expect(FeatureValidator.allValid(list)).assertTrue();
        expect(FeatureValidator.hasDuplicateKey(list)).assertFalse();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_46', 0, (done: () => void) => {
      try {
        const list: FeatureItem[] = FeatureCatalog.createCount(3, 16, 'input');
        expect(FeatureValidator.hasDuplicateKey(list)).assertFalse();
        list.push(FeatureItem.create(list[0].key, 16, 'input'));
        expect(FeatureValidator.hasDuplicateKey(list)).assertTrue();
        expect(list.length).assertEqual(4);
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_47', 0, (done: () => void) => {
      try {
        const list: FeatureItem[] = FeatureCatalog.createCount(6, 17, 'input');
        const asc: FeatureItem[] = FeatureSorter.byNumberAsc(list);
        expect(FeatureValidator.isSortedAsc(asc)).assertTrue();
        const desc: FeatureItem[] = FeatureSorter.byNumberDesc(list);
        expect(desc[0].getNumberValue()).assertLargerOrEqual(desc[desc.length - 1].getNumberValue());
        expect(asc[0].getNumberValue()).assertEqual(17);
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_48', 0, (done: () => void) => {
      try {
        const stats = new FeatureStatistics();
        stats.collect(FeatureCatalog.createCount(4, 18, 'input'));
        expect(stats.getCount()).assertEqual(4);
        expect(stats.getTotal()).assertEqual(78);
        expect(stats.getMin()).assertEqual(18);
        expect(stats.getMax()).assertEqual(21);
        expect(stats.getAverage()).assertEqual(19.5);
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_49', 0, (done: () => void) => {
      try {
        const collection = new FeatureCollection();
        collection.addAll(FeatureCatalog.createCount(3, 19, 'input'));
        expect(collection.getCount()).assertEqual(3);
        expect(collection.contains('input.1')).assertTrue();
        expect(collection.removeByKey('input.1')).assertTrue();
        expect(collection.getCount()).assertEqual(2);
        expect(collection.removeByKey('missing.key')).assertFalse();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_50', 0, (done: () => void) => {
      try {
        const collection = new FeatureCollection();
        collection.addAll(FeatureCatalog.createCount(2, 20, 'input'));
        expect(collection.getByIndex(-1) === null).assertTrue();
        expect(collection.getByIndex(0) !== null).assertTrue();
        expect(collection.getByIndex(5) === null).assertTrue();
        expect(collection.findByKey('input.0') !== null).assertTrue();
        expect(collection.findByKey('input.9') === null).assertTrue();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_51', 0, (done: () => void) => {
      try {
        const item = FeatureItem.create('input.mouse', 1000021, 'input');
        expect(item.getNumberValue()).assertEqual(1000021);
        expect(item.isValid()).assertTrue();
        expect(item.getCategory()).assertEqual('input');
        expect(item.toString().includes('input.mouse')).assertTrue();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_52', 0, (done: () => void) => {
      try {
        const item = FeatureItem.create('input.touchpad', -22, 'input');
        expect(item.getNumberValue()).assertEqual(-22);
        expect(item.compareNumber(FeatureItem.createDefault())).assertLessOrEqual(0);
        expect(item.getValue().length > 0).assertTrue();
        expect(item.isValid()).assertTrue();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_53', 0, (done: () => void) => {
      try {
        const item = new FeatureItem('', '', '', 23, false, 'input');
        expect(item.isValid()).assertFalse();
        expect(item.isEmpty()).assertTrue();
        expect(item.getCategory()).assertEqual('input');
        expect(item.getNumberValue()).assertEqual(23);
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_54', 0, (done: () => void) => {
      try {
        const menu: FeatureItem[] = FeatureCatalog.createMenu();
        expect(menu.length).assertEqual(13);
        expect(menu[0].key.length > 0).assertTrue();
        expect(FeatureValidator.countEnabled(menu)).assertEqual(13);
        expect(FeatureValidator.countByCategory(menu, 'input')).assertEqual(4);
        expect(menu[12].getCategory()).assertEqual('input');
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_55', 0, (done: () => void) => {
      try {
        const first = FeatureItem.create('input.trackball.a', 25, 'input');
        const second = FeatureItem.create('input.trackball.b', 25, 'input');
        expect(first.compareKey(second)).assertLessOrEqual(-1);
        expect(second.compareKey(first)).assertLargerOrEqual(1);
        expect(first.compareKey(first)).assertEqual(0);
        expect(first.equals(second)).assertFalse();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_56', 0, (done: () => void) => {
      try {
        const list: FeatureItem[] = FeatureCatalog.createCount(5, 26, 'input');
        list.push(FeatureItem.create('other.0', 26, 'general'));
        expect(FeatureValidator.countByCategory(list, 'input')).assertEqual(5);
        expect(FeatureValidator.countByCategory(list, 'general')).assertEqual(1);
        expect(list.length).assertEqual(6);
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_57', 0, (done: () => void) => {
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
    it('KeyCodeValidation_case_58', 0, (done: () => void) => {
      try {
        const item = FeatureItem.create('input.keyEvent', 28, 'input');
        expect(item.key).assertEqual('input.keyEvent');
        expect(item.getNumberValue()).assertEqual(28);
        expect(item.getCategory()).assertEqual('input');
        expect(item.isValid()).assertTrue();
        expect(item.getValue().length > 0).assertTrue();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_59', 0, (done: () => void) => {
      try {
        const original = FeatureItem.create('input.touchEvent', 29, 'input');
        const copied = original.clone();
        expect(original.equals(copied)).assertTrue();
        expect(copied.getCategory()).assertEqual('input');
        copied.setNumberValue(129);
        expect(original.getNumberValue()).assertEqual(29);
        expect(copied.getNumberValue()).assertEqual(129);
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_60', 0, (done: () => void) => {
      try {
        const item = FeatureItem.create('input.keyboard', 30, 'input');
        const text: string = item.toString();
        expect(text.includes('input.keyboard')).assertTrue();
        expect(text.includes('input')).assertTrue();
        expect(text.includes('30')).assertTrue();
        expect(text.length > 0).assertTrue();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_61', 0, (done: () => void) => {
      try {
        const item = new FeatureItem('input.mouse', 'input mouse', 'input_value', 31, true, 'input');
        expect(item.getValue()).assertEqual('input_value');
        item.setValue('input_updated');
        expect(item.getValue()).assertEqual('input_updated');
        expect(item.isEnabled()).assertTrue();
        expect(item.getCategory()).assertEqual('input');
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_62', 0, (done: () => void) => {
      try {
        const item = FeatureItem.create('input.touchpad', 32, 'input');
        expect(item.isEnabled()).assertFalse();
        item.setEnabled(true);
        expect(item.isEnabled()).assertTrue();
        item.setEnabled(false);
        expect(item.isEnabled()).assertFalse();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_63', 0, (done: () => void) => {
      try {
        const low = FeatureItem.create('input.touchscreen_low', 33, 'input');
        const high = FeatureItem.create('input.touchscreen_high', 58, 'input');
        expect(low.compareNumber(high)).assertLessOrEqual(-1);
        expect(high.compareNumber(low)).assertLargerOrEqual(1);
        expect(low.compareNumber(low)).assertEqual(0);
        expect(low.compareKey(low)).assertEqual(0);
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_64', 0, (done: () => void) => {
      try {
        const list: FeatureItem[] = FeatureCatalog.createCount(5, 34, 'input');
        expect(list.length).assertEqual(5);
        expect(list[0].getCategory()).assertEqual('input');
        expect(FeatureValidator.allValid(list)).assertTrue();
        expect(FeatureValidator.hasDuplicateKey(list)).assertFalse();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_65', 0, (done: () => void) => {
      try {
        const list: FeatureItem[] = FeatureCatalog.createCount(3, 35, 'input');
        expect(FeatureValidator.hasDuplicateKey(list)).assertFalse();
        list.push(FeatureItem.create(list[0].key, 35, 'input'));
        expect(FeatureValidator.hasDuplicateKey(list)).assertTrue();
        expect(list.length).assertEqual(4);
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_66', 0, (done: () => void) => {
      try {
        const list: FeatureItem[] = FeatureCatalog.createCount(6, 36, 'input');
        const asc: FeatureItem[] = FeatureSorter.byNumberAsc(list);
        expect(FeatureValidator.isSortedAsc(asc)).assertTrue();
        const desc: FeatureItem[] = FeatureSorter.byNumberDesc(list);
        expect(desc[0].getNumberValue()).assertLargerOrEqual(desc[desc.length - 1].getNumberValue());
        expect(asc[0].getNumberValue()).assertEqual(36);
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_67', 0, (done: () => void) => {
      try {
        const stats = new FeatureStatistics();
        stats.collect(FeatureCatalog.createCount(4, 37, 'input'));
        expect(stats.getCount()).assertEqual(4);
        expect(stats.getTotal()).assertEqual(154);
        expect(stats.getMin()).assertEqual(37);
        expect(stats.getMax()).assertEqual(40);
        expect(stats.getAverage()).assertEqual(38.5);
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('KeyCodeValidation_case_68', 0, (done: () => void) => {
      try {
        const collection = new FeatureCollection();
        collection.addAll(FeatureCatalog.createCount(3, 38, 'input'));
        expect(collection.getCount()).assertEqual(3);
        expect(collection.contains('input.1')).assertTrue();
        expect(collection.removeByKey('input.1')).assertTrue();
        expect(collection.getCount()).assertEqual(2);
        expect(collection.removeByKey('missing.key')).assertFalse();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
  });
}
