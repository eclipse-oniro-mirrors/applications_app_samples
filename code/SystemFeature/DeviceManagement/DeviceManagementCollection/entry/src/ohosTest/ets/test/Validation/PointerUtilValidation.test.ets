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


export default function pointerUtilValidationTest() {
  describe('PointerUtilValidation', () => {
    it('PointerUtilValidation_case_0', 0, (done: () => void) => {
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
    it('PointerUtilValidation_case_1', 0, (done: () => void) => {
      try {
        const item = FeatureItem.create('mouse.east', 11, 'mouse');
        expect(item.key).assertEqual('mouse.east');
        expect(item.getNumberValue()).assertEqual(11);
        expect(item.getCategory()).assertEqual('mouse');
        expect(item.isValid()).assertTrue();
        expect(item.getValue().length > 0).assertTrue();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('PointerUtilValidation_case_2', 0, (done: () => void) => {
      try {
        const original = FeatureItem.create('mouse.west', 12, 'mouse');
        const copied = original.clone();
        expect(original.equals(copied)).assertTrue();
        expect(copied.getCategory()).assertEqual('mouse');
        copied.setNumberValue(112);
        expect(original.getNumberValue()).assertEqual(12);
        expect(copied.getNumberValue()).assertEqual(112);
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('PointerUtilValidation_case_3', 0, (done: () => void) => {
      try {
        const item = FeatureItem.create('mouse.north', 13, 'mouse');
        const text: string = item.toString();
        expect(text.includes('mouse.north')).assertTrue();
        expect(text.includes('mouse')).assertTrue();
        expect(text.includes('13')).assertTrue();
        expect(text.length > 0).assertTrue();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('PointerUtilValidation_case_4', 0, (done: () => void) => {
      try {
        const item = new FeatureItem('mouse.south', 'mouse south', 'mouse_value', 14, true, 'mouse');
        expect(item.getValue()).assertEqual('mouse_value');
        item.setValue('mouse_updated');
        expect(item.getValue()).assertEqual('mouse_updated');
        expect(item.isEnabled()).assertTrue();
        expect(item.getCategory()).assertEqual('mouse');
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('PointerUtilValidation_case_5', 0, (done: () => void) => {
      try {
        const item = FeatureItem.create('mouse.cross', 15, 'mouse');
        expect(item.isEnabled()).assertFalse();
        item.setEnabled(true);
        expect(item.isEnabled()).assertTrue();
        item.setEnabled(false);
        expect(item.isEnabled()).assertFalse();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('PointerUtilValidation_case_6', 0, (done: () => void) => {
      try {
        const low = FeatureItem.create('mouse.copy_low', 16, 'mouse');
        const high = FeatureItem.create('mouse.copy_high', 41, 'mouse');
        expect(low.compareNumber(high)).assertLessOrEqual(-1);
        expect(high.compareNumber(low)).assertLargerOrEqual(1);
        expect(low.compareNumber(low)).assertEqual(0);
        expect(low.compareKey(low)).assertEqual(0);
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('PointerUtilValidation_case_7', 0, (done: () => void) => {
      try {
        const list: FeatureItem[] = FeatureCatalog.createCount(4, 17, 'mouse');
        expect(list.length).assertEqual(4);
        expect(list[0].getCategory()).assertEqual('mouse');
        expect(FeatureValidator.allValid(list)).assertTrue();
        expect(FeatureValidator.hasDuplicateKey(list)).assertFalse();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('PointerUtilValidation_case_8', 0, (done: () => void) => {
      try {
        const list: FeatureItem[] = FeatureCatalog.createCount(3, 18, 'mouse');
        expect(FeatureValidator.hasDuplicateKey(list)).assertFalse();
        list.push(FeatureItem.create(list[0].key, 18, 'mouse'));
        expect(FeatureValidator.hasDuplicateKey(list)).assertTrue();
        expect(list.length).assertEqual(4);
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('PointerUtilValidation_case_9', 0, (done: () => void) => {
      try {
        const list: FeatureItem[] = FeatureCatalog.createCount(6, 19, 'mouse');
        const asc: FeatureItem[] = FeatureSorter.byNumberAsc(list);
        expect(FeatureValidator.isSortedAsc(asc)).assertTrue();
        const desc: FeatureItem[] = FeatureSorter.byNumberDesc(list);
        expect(desc[0].getNumberValue()).assertLargerOrEqual(desc[desc.length - 1].getNumberValue());
        expect(asc[0].getNumberValue()).assertEqual(19);
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('PointerUtilValidation_case_10', 0, (done: () => void) => {
      try {
        const stats = new FeatureStatistics();
        stats.collect(FeatureCatalog.createCount(4, 20, 'mouse'));
        expect(stats.getCount()).assertEqual(4);
        expect(stats.getTotal()).assertEqual(86);
        expect(stats.getMin()).assertEqual(20);
        expect(stats.getMax()).assertEqual(23);
        expect(stats.getAverage()).assertEqual(21.5);
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('PointerUtilValidation_case_11', 0, (done: () => void) => {
      try {
        const collection = new FeatureCollection();
        collection.addAll(FeatureCatalog.createCount(3, 21, 'mouse'));
        expect(collection.getCount()).assertEqual(3);
        expect(collection.contains('mouse.1')).assertTrue();
        expect(collection.removeByKey('mouse.1')).assertTrue();
        expect(collection.getCount()).assertEqual(2);
        expect(collection.removeByKey('missing.key')).assertFalse();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('PointerUtilValidation_case_12', 0, (done: () => void) => {
      try {
        const collection = new FeatureCollection();
        collection.addAll(FeatureCatalog.createCount(2, 22, 'mouse'));
        expect(collection.getByIndex(-1) === null).assertTrue();
        expect(collection.getByIndex(0) !== null).assertTrue();
        expect(collection.getByIndex(5) === null).assertTrue();
        expect(collection.findByKey('mouse.0') !== null).assertTrue();
        expect(collection.findByKey('mouse.9') === null).assertTrue();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('PointerUtilValidation_case_13', 0, (done: () => void) => {
      try {
        const item = FeatureItem.create('mouse.resizeLeftRight', 1000023, 'mouse');
        expect(item.getNumberValue()).assertEqual(1000023);
        expect(item.isValid()).assertTrue();
        expect(item.getCategory()).assertEqual('mouse');
        expect(item.toString().includes('mouse.resizeLeftRight')).assertTrue();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('PointerUtilValidation_case_14', 0, (done: () => void) => {
      try {
        const item = FeatureItem.create('mouse.resizeUpDown', -24, 'mouse');
        expect(item.getNumberValue()).assertEqual(-24);
        expect(item.compareNumber(FeatureItem.createDefault())).assertLessOrEqual(0);
        expect(item.getValue().length > 0).assertTrue();
        expect(item.isValid()).assertTrue();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('PointerUtilValidation_case_15', 0, (done: () => void) => {
      try {
        const item = new FeatureItem('', '', '', 25, false, 'mouse');
        expect(item.isValid()).assertFalse();
        expect(item.isEmpty()).assertTrue();
        expect(item.getCategory()).assertEqual('mouse');
        expect(item.getNumberValue()).assertEqual(25);
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('PointerUtilValidation_case_16', 0, (done: () => void) => {
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
    it('PointerUtilValidation_case_17', 0, (done: () => void) => {
      try {
        const first = FeatureItem.create('mouse.default.a', 27, 'mouse');
        const second = FeatureItem.create('mouse.default.b', 27, 'mouse');
        expect(first.compareKey(second)).assertLessOrEqual(-1);
        expect(second.compareKey(first)).assertLargerOrEqual(1);
        expect(first.compareKey(first)).assertEqual(0);
        expect(first.equals(second)).assertFalse();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('PointerUtilValidation_case_18', 0, (done: () => void) => {
      try {
        const list: FeatureItem[] = FeatureCatalog.createCount(5, 28, 'mouse');
        list.push(FeatureItem.create('other.0', 28, 'general'));
        expect(FeatureValidator.countByCategory(list, 'mouse')).assertEqual(5);
        expect(FeatureValidator.countByCategory(list, 'general')).assertEqual(1);
        expect(list.length).assertEqual(6);
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('PointerUtilValidation_case_19', 0, (done: () => void) => {
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
    it('PointerUtilValidation_case_20', 0, (done: () => void) => {
      try {
        const item = FeatureItem.create('mouse.north', 30, 'mouse');
        expect(item.key).assertEqual('mouse.north');
        expect(item.getNumberValue()).assertEqual(30);
        expect(item.getCategory()).assertEqual('mouse');
        expect(item.isValid()).assertTrue();
        expect(item.getValue().length > 0).assertTrue();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('PointerUtilValidation_case_21', 0, (done: () => void) => {
      try {
        const original = FeatureItem.create('mouse.south', 31, 'mouse');
        const copied = original.clone();
        expect(original.equals(copied)).assertTrue();
        expect(copied.getCategory()).assertEqual('mouse');
        copied.setNumberValue(131);
        expect(original.getNumberValue()).assertEqual(31);
        expect(copied.getNumberValue()).assertEqual(131);
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('PointerUtilValidation_case_22', 0, (done: () => void) => {
      try {
        const item = FeatureItem.create('mouse.cross', 32, 'mouse');
        const text: string = item.toString();
        expect(text.includes('mouse.cross')).assertTrue();
        expect(text.includes('mouse')).assertTrue();
        expect(text.includes('32')).assertTrue();
        expect(text.length > 0).assertTrue();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('PointerUtilValidation_case_23', 0, (done: () => void) => {
      try {
        const item = new FeatureItem('mouse.copy', 'mouse copy', 'mouse_value', 33, true, 'mouse');
        expect(item.getValue()).assertEqual('mouse_value');
        item.setValue('mouse_updated');
        expect(item.getValue()).assertEqual('mouse_updated');
        expect(item.isEnabled()).assertTrue();
        expect(item.getCategory()).assertEqual('mouse');
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('PointerUtilValidation_case_24', 0, (done: () => void) => {
      try {
        const item = FeatureItem.create('mouse.forbid', 34, 'mouse');
        expect(item.isEnabled()).assertFalse();
        item.setEnabled(true);
        expect(item.isEnabled()).assertTrue();
        item.setEnabled(false);
        expect(item.isEnabled()).assertFalse();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('PointerUtilValidation_case_25', 0, (done: () => void) => {
      try {
        const low = FeatureItem.create('mouse.move_low', 35, 'mouse');
        const high = FeatureItem.create('mouse.move_high', 60, 'mouse');
        expect(low.compareNumber(high)).assertLessOrEqual(-1);
        expect(high.compareNumber(low)).assertLargerOrEqual(1);
        expect(low.compareNumber(low)).assertEqual(0);
        expect(low.compareKey(low)).assertEqual(0);
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('PointerUtilValidation_case_26', 0, (done: () => void) => {
      try {
        const list: FeatureItem[] = FeatureCatalog.createCount(9, 36, 'mouse');
        expect(list.length).assertEqual(9);
        expect(list[0].getCategory()).assertEqual('mouse');
        expect(FeatureValidator.allValid(list)).assertTrue();
        expect(FeatureValidator.hasDuplicateKey(list)).assertFalse();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('PointerUtilValidation_case_27', 0, (done: () => void) => {
      try {
        const list: FeatureItem[] = FeatureCatalog.createCount(3, 37, 'mouse');
        expect(FeatureValidator.hasDuplicateKey(list)).assertFalse();
        list.push(FeatureItem.create(list[0].key, 37, 'mouse'));
        expect(FeatureValidator.hasDuplicateKey(list)).assertTrue();
        expect(list.length).assertEqual(4);
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('PointerUtilValidation_case_28', 0, (done: () => void) => {
      try {
        const list: FeatureItem[] = FeatureCatalog.createCount(6, 38, 'mouse');
        const asc: FeatureItem[] = FeatureSorter.byNumberAsc(list);
        expect(FeatureValidator.isSortedAsc(asc)).assertTrue();
        const desc: FeatureItem[] = FeatureSorter.byNumberDesc(list);
        expect(desc[0].getNumberValue()).assertLargerOrEqual(desc[desc.length - 1].getNumberValue());
        expect(asc[0].getNumberValue()).assertEqual(38);
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('PointerUtilValidation_case_29', 0, (done: () => void) => {
      try {
        const stats = new FeatureStatistics();
        stats.collect(FeatureCatalog.createCount(4, 39, 'mouse'));
        expect(stats.getCount()).assertEqual(4);
        expect(stats.getTotal()).assertEqual(162);
        expect(stats.getMin()).assertEqual(39);
        expect(stats.getMax()).assertEqual(42);
        expect(stats.getAverage()).assertEqual(40.5);
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('PointerUtilValidation_case_30', 0, (done: () => void) => {
      try {
        const collection = new FeatureCollection();
        collection.addAll(FeatureCatalog.createCount(3, 40, 'mouse'));
        expect(collection.getCount()).assertEqual(3);
        expect(collection.contains('mouse.1')).assertTrue();
        expect(collection.removeByKey('mouse.1')).assertTrue();
        expect(collection.getCount()).assertEqual(2);
        expect(collection.removeByKey('missing.key')).assertFalse();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('PointerUtilValidation_case_31', 0, (done: () => void) => {
      try {
        const collection = new FeatureCollection();
        collection.addAll(FeatureCatalog.createCount(2, 41, 'mouse'));
        expect(collection.getByIndex(-1) === null).assertTrue();
        expect(collection.getByIndex(0) !== null).assertTrue();
        expect(collection.getByIndex(5) === null).assertTrue();
        expect(collection.findByKey('mouse.0') !== null).assertTrue();
        expect(collection.findByKey('mouse.9') === null).assertTrue();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('PointerUtilValidation_case_32', 0, (done: () => void) => {
      try {
        const item = FeatureItem.create('mouse.speed', 1000042, 'mouse');
        expect(item.getNumberValue()).assertEqual(1000042);
        expect(item.isValid()).assertTrue();
        expect(item.getCategory()).assertEqual('mouse');
        expect(item.toString().includes('mouse.speed')).assertTrue();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('PointerUtilValidation_case_33', 0, (done: () => void) => {
      try {
        const item = FeatureItem.create('mouse.visible', -43, 'mouse');
        expect(item.getNumberValue()).assertEqual(-43);
        expect(item.compareNumber(FeatureItem.createDefault())).assertLessOrEqual(0);
        expect(item.getValue().length > 0).assertTrue();
        expect(item.isValid()).assertTrue();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('PointerUtilValidation_case_34', 0, (done: () => void) => {
      try {
        const item = new FeatureItem('', '', '', 44, false, 'mouse');
        expect(item.isValid()).assertFalse();
        expect(item.isEmpty()).assertTrue();
        expect(item.getCategory()).assertEqual('mouse');
        expect(item.getNumberValue()).assertEqual(44);
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('PointerUtilValidation_case_35', 0, (done: () => void) => {
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
    it('PointerUtilValidation_case_36', 0, (done: () => void) => {
      try {
        const first = FeatureItem.create('mouse.west.a', 46, 'mouse');
        const second = FeatureItem.create('mouse.west.b', 46, 'mouse');
        expect(first.compareKey(second)).assertLessOrEqual(-1);
        expect(second.compareKey(first)).assertLargerOrEqual(1);
        expect(first.compareKey(first)).assertEqual(0);
        expect(first.equals(second)).assertFalse();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('PointerUtilValidation_case_37', 0, (done: () => void) => {
      try {
        const list: FeatureItem[] = FeatureCatalog.createCount(5, 47, 'mouse');
        list.push(FeatureItem.create('other.0', 47, 'general'));
        expect(FeatureValidator.countByCategory(list, 'mouse')).assertEqual(5);
        expect(FeatureValidator.countByCategory(list, 'general')).assertEqual(1);
        expect(list.length).assertEqual(6);
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('PointerUtilValidation_case_38', 0, (done: () => void) => {
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
    it('PointerUtilValidation_case_39', 0, (done: () => void) => {
      try {
        const item = FeatureItem.create('mouse.cross', 49, 'mouse');
        expect(item.key).assertEqual('mouse.cross');
        expect(item.getNumberValue()).assertEqual(49);
        expect(item.getCategory()).assertEqual('mouse');
        expect(item.isValid()).assertTrue();
        expect(item.getValue().length > 0).assertTrue();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('PointerUtilValidation_case_40', 0, (done: () => void) => {
      try {
        const original = FeatureItem.create('mouse.copy', 10, 'mouse');
        const copied = original.clone();
        expect(original.equals(copied)).assertTrue();
        expect(copied.getCategory()).assertEqual('mouse');
        copied.setNumberValue(110);
        expect(original.getNumberValue()).assertEqual(10);
        expect(copied.getNumberValue()).assertEqual(110);
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('PointerUtilValidation_case_41', 0, (done: () => void) => {
      try {
        const item = FeatureItem.create('mouse.forbid', 11, 'mouse');
        const text: string = item.toString();
        expect(text.includes('mouse.forbid')).assertTrue();
        expect(text.includes('mouse')).assertTrue();
        expect(text.includes('11')).assertTrue();
        expect(text.length > 0).assertTrue();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('PointerUtilValidation_case_42', 0, (done: () => void) => {
      try {
        const item = new FeatureItem('mouse.move', 'mouse move', 'mouse_value', 12, true, 'mouse');
        expect(item.getValue()).assertEqual('mouse_value');
        item.setValue('mouse_updated');
        expect(item.getValue()).assertEqual('mouse_updated');
        expect(item.isEnabled()).assertTrue();
        expect(item.getCategory()).assertEqual('mouse');
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('PointerUtilValidation_case_43', 0, (done: () => void) => {
      try {
        const item = FeatureItem.create('mouse.help', 13, 'mouse');
        expect(item.isEnabled()).assertFalse();
        item.setEnabled(true);
        expect(item.isEnabled()).assertTrue();
        item.setEnabled(false);
        expect(item.isEnabled()).assertFalse();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('PointerUtilValidation_case_44', 0, (done: () => void) => {
      try {
        const low = FeatureItem.create('mouse.zoomIn_low', 14, 'mouse');
        const high = FeatureItem.create('mouse.zoomIn_high', 39, 'mouse');
        expect(low.compareNumber(high)).assertLessOrEqual(-1);
        expect(high.compareNumber(low)).assertLargerOrEqual(1);
        expect(low.compareNumber(low)).assertEqual(0);
        expect(low.compareKey(low)).assertEqual(0);
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('PointerUtilValidation_case_45', 0, (done: () => void) => {
      try {
        const list: FeatureItem[] = FeatureCatalog.createCount(7, 15, 'mouse');
        expect(list.length).assertEqual(7);
        expect(list[0].getCategory()).assertEqual('mouse');
        expect(FeatureValidator.allValid(list)).assertTrue();
        expect(FeatureValidator.hasDuplicateKey(list)).assertFalse();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('PointerUtilValidation_case_46', 0, (done: () => void) => {
      try {
        const list: FeatureItem[] = FeatureCatalog.createCount(3, 16, 'mouse');
        expect(FeatureValidator.hasDuplicateKey(list)).assertFalse();
        list.push(FeatureItem.create(list[0].key, 16, 'mouse'));
        expect(FeatureValidator.hasDuplicateKey(list)).assertTrue();
        expect(list.length).assertEqual(4);
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('PointerUtilValidation_case_47', 0, (done: () => void) => {
      try {
        const list: FeatureItem[] = FeatureCatalog.createCount(6, 17, 'mouse');
        const asc: FeatureItem[] = FeatureSorter.byNumberAsc(list);
        expect(FeatureValidator.isSortedAsc(asc)).assertTrue();
        const desc: FeatureItem[] = FeatureSorter.byNumberDesc(list);
        expect(desc[0].getNumberValue()).assertLargerOrEqual(desc[desc.length - 1].getNumberValue());
        expect(asc[0].getNumberValue()).assertEqual(17);
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('PointerUtilValidation_case_48', 0, (done: () => void) => {
      try {
        const stats = new FeatureStatistics();
        stats.collect(FeatureCatalog.createCount(4, 18, 'mouse'));
        expect(stats.getCount()).assertEqual(4);
        expect(stats.getTotal()).assertEqual(78);
        expect(stats.getMin()).assertEqual(18);
        expect(stats.getMax()).assertEqual(21);
        expect(stats.getAverage()).assertEqual(19.5);
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('PointerUtilValidation_case_49', 0, (done: () => void) => {
      try {
        const collection = new FeatureCollection();
        collection.addAll(FeatureCatalog.createCount(3, 19, 'mouse'));
        expect(collection.getCount()).assertEqual(3);
        expect(collection.contains('mouse.1')).assertTrue();
        expect(collection.removeByKey('mouse.1')).assertTrue();
        expect(collection.getCount()).assertEqual(2);
        expect(collection.removeByKey('missing.key')).assertFalse();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('PointerUtilValidation_case_50', 0, (done: () => void) => {
      try {
        const collection = new FeatureCollection();
        collection.addAll(FeatureCatalog.createCount(2, 20, 'mouse'));
        expect(collection.getByIndex(-1) === null).assertTrue();
        expect(collection.getByIndex(0) !== null).assertTrue();
        expect(collection.getByIndex(5) === null).assertTrue();
        expect(collection.findByKey('mouse.0') !== null).assertTrue();
        expect(collection.findByKey('mouse.9') === null).assertTrue();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('PointerUtilValidation_case_51', 0, (done: () => void) => {
      try {
        const item = FeatureItem.create('mouse.default', 1000021, 'mouse');
        expect(item.getNumberValue()).assertEqual(1000021);
        expect(item.isValid()).assertTrue();
        expect(item.getCategory()).assertEqual('mouse');
        expect(item.toString().includes('mouse.default')).assertTrue();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
    it('PointerUtilValidation_case_52', 0, (done: () => void) => {
      try {
        const item = FeatureItem.create('mouse.east', -22, 'mouse');
        expect(item.getNumberValue()).assertEqual(-22);
        expect(item.compareNumber(FeatureItem.createDefault())).assertLessOrEqual(0);
        expect(item.getValue().length > 0).assertTrue();
        expect(item.isValid()).assertTrue();
      } finally {
        setTimeout(() => done(), 0);
      }
    });
  });
}
