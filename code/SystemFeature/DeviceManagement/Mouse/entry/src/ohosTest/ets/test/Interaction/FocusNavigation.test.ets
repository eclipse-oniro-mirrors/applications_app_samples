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

import hilog from '@ohos.hilog';
import { describe, it, expect, beforeEach } from '@ohos/hypium';

// Adapted mouse pointer settings suite for FocusNavigation

interface MouseFeature {
  getId(): string;
  getTitle(): string;
  getNumericValue(): number;
  isValid(): boolean;
}

class FeatureValidator {
  public static isValidTitle(title: string): boolean {
    return title.length > 0;
  }

  public static isValidFeature(feature: MouseFeature): boolean {
    return FeatureValidator.isValidTitle(feature.getTitle()) && feature.isValid();
  }

  public static isNonNegative(feature: MouseFeature): boolean {
    return feature.getNumericValue() >= 0;
  }
}

class FeatureCollection {
  private items: MouseFeature[] = [];

  public add(feature: MouseFeature): void {
    this.items.push(feature);
  }

  public addAll(features: MouseFeature[]): void {
    this.items.push(...features);
  }

  public getAll(): MouseFeature[] {
    return [...this.items];
  }

  public count(): number {
    return this.items.length;
  }

  public isEmpty(): boolean {
    return this.items.length === 0;
  }

  public getByTitle(title: string): MouseFeature | null {
    for (let i = 0; i < this.items.length; i++) {
      if (this.items[i].getTitle() === title) {
        return this.items[i];
      }
    }
    return null;
  }

  public getValidFeatures(): MouseFeature[] {
    return this.items.filter((item: MouseFeature) => item.isValid());
  }

  public first(): MouseFeature | null {
    return this.items.length === 0 ? null : this.items[0];
  }

  public last(): MouseFeature | null {
    return this.items.length === 0 ? null : this.items[this.items.length - 1];
  }

  public clear(): void {
    this.items = [];
  }
}

class FeatureStatistics {
  private items: MouseFeature[] = [];

  public collect(features: MouseFeature[]): void {
    this.items.push(...features);
  }

  public getTotal(): number {
    return this.items.length;
  }

  public getValidCount(): number {
    return this.items.filter((item: MouseFeature) => item.isValid()).length;
  }

  public getMinValue(): number {
    if (this.items.length === 0) {
      return 0;
    }
    let min: number = this.items[0].getNumericValue();
    this.items.forEach((item: MouseFeature) => {
      if (item.getNumericValue() < min) {
        min = item.getNumericValue();
      }
    });
    return min;
  }

  public getMaxValue(): number {
    if (this.items.length === 0) {
      return 0;
    }
    let max: number = this.items[0].getNumericValue();
    this.items.forEach((item: MouseFeature) => {
      if (item.getNumericValue() > max) {
        max = item.getNumericValue();
      }
    });
    return max;
  }

  public getAverage(): number {
    if (this.items.length === 0) {
      return 0;
    }
    let total: number = 0;
    this.items.forEach((item: MouseFeature) => {
      total += item.getNumericValue();
    });
    return total / this.items.length;
  }

  public clear(): void {
    this.items = [];
  }
}

class FeatureComparator {
  public static compareByValue(a: MouseFeature, b: MouseFeature): number {
    return a.getNumericValue() - b.getNumericValue();
  }

  public static compareByTitleLength(a: MouseFeature, b: MouseFeature): number {
    return a.getTitle().length - b.getTitle().length;
  }

  public static compareByValid(a: MouseFeature, b: MouseFeature): number {
    if (a.isValid() === b.isValid()) {
      return 0;
    }
    return a.isValid() ? -1 : 1;
  }
}

class FeatureSorter {
  public static sortByValue(features: MouseFeature[]): MouseFeature[] {
    const copied: MouseFeature[] = [...features];
    copied.sort((a: MouseFeature, b: MouseFeature) => FeatureComparator.compareByValue(a, b));
    return copied;
  }

  public static sortByTitleLength(features: MouseFeature[]): MouseFeature[] {
    const copied: MouseFeature[] = [...features];
    copied.sort((a: MouseFeature, b: MouseFeature) => FeatureComparator.compareByTitleLength(a, b));
    return copied;
  }
}

class FeatureExtractor {
  public static extractTitles(features: MouseFeature[]): string[] {
    const titles: string[] = [];
    features.forEach((item: MouseFeature) => {
      titles.push(item.getTitle());
    });
    return titles;
  }

  public static extractIds(features: MouseFeature[]): string[] {
    const ids: string[] = [];
    features.forEach((item: MouseFeature) => {
      ids.push(item.getId());
    });
    return ids;
  }

  public static extractValues(features: MouseFeature[]): number[] {
    const values: number[] = [];
    features.forEach((item: MouseFeature) => {
      values.push(item.getNumericValue());
    });
    return values;
  }

  public static extractValid(features: MouseFeature[]): MouseFeature[] {
    return features.filter((item: MouseFeature) => item.isValid());
  }
}

class FeatureHistory {
  private history: MouseFeature[] = [];

  public push(feature: MouseFeature): void {
    this.history.push(feature);
  }

  public getLength(): number {
    return this.history.length;
  }

  public getLast(): MouseFeature | null {
    return this.history.length === 0 ? null : this.history[this.history.length - 1];
  }

  public getFirst(): MouseFeature | null {
    return this.history.length === 0 ? null : this.history[0];
  }

  public containsTitle(title: string): boolean {
    for (let i = 0; i < this.history.length; i++) {
      if (this.history[i].getTitle() === title) {
        return true;
      }
    }
    return false;
  }

  public clear(): void {
    this.history = [];
  }
}

class FeatureSerializer {
  public static serialize(features: MouseFeature[]): string {
    const parts: string[] = [];
    features.forEach((item: MouseFeature) => {
      parts.push(item.getId() + '=' + item.getNumericValue());
    });
    return parts.join(';');
  }

  public static countTokens(serialized: string): number {
    if (serialized.length === 0) {
      return 0;
    }
    return serialized.split(';').length;
  }
}

enum FocusEdge {
  NONE = 'none',
  FIRST = 'first',
  LAST = 'last'
}

class NavFeature implements MouseFeature {
  private title: string;
  private value: number;
  private total: number;

  constructor(title: string, value: number) {
    this.title = title;
    this.total = 5;
    this.value = this.normalize(value);
  }

  private normalize(value: number): number {
    if (value < 0) {
      return 0;
    }
    if (value >= this.total) {
      return this.total - 1;
    }
    return value;
  }

  public getId(): string {
    return 'navigation:' + this.title;
  }

  public getTitle(): string {
    return this.title;
  }

  public getNumericValue(): number {
    return this.value;
  }

  public isValid(): boolean {
    return this.value >= 0 && this.value < this.total;
  }

  public getIndex(): number {
    return this.value;
  }

  public setIndex(index: number): void {
    this.value = this.normalize(index);
  }

  public getTotal(): number {
    return this.total;
  }

  public moveLeft(): boolean {
    if (this.value <= 0) {
      return false;
    }
    this.value--;
    return true;
  }

  public moveRight(): boolean {
    if (this.value >= this.total - 1) {
      return false;
    }
    this.value++;
    return true;
  }

  public getEdge(): FocusEdge {
    if (this.value === 0) {
      return FocusEdge.FIRST;
    }
    if (this.value === this.total - 1) {
      return FocusEdge.LAST;
    }
    return FocusEdge.NONE;
  }

  public clone(): NavFeature {
    return new NavFeature(this.title, this.value);
  }

  public toString(): string {
    return 'NavFeature{title:' + this.title + ', value:' + this.value + '}';
  }
}

export default function focusNavigationTest() {
  describe('FocusNavigation_Test', () => {
    beforeEach(() => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'suite setup');
    });

    it('FocusNavigation_aggregated_validation', 0, async () => {
      {
        const feature = new NavFeature('nav_initial', 2);
        expect(feature.getIndex()).assertEqual(2);
        expect(feature.getEdge()).assertEqual(FocusEdge.NONE);
      }

      {
        const feature = new NavFeature('nav_right', 1);
        expect(feature.moveRight()).assertTrue();
        expect(feature.getIndex()).assertEqual(2);
      }

      {
        const feature = new NavFeature('nav_right_bound', 4);
        expect(feature.moveRight()).assertFalse();
        expect(feature.getEdge()).assertEqual(FocusEdge.LAST);
      }

      {
        const feature = new NavFeature('nav_left_bound', 0);
        expect(feature.moveLeft()).assertFalse();
        expect(feature.getEdge()).assertEqual(FocusEdge.FIRST);
      }

      {
        const feature = new NavFeature('nav_clone', 2);
        const copy = feature.clone();
        copy.moveRight();
        expect(feature.getIndex()).assertEqual(2);
        expect(copy.getIndex()).assertEqual(3);
      }

      {
        const feature = new NavFeature('alpha', 1);
        expect(feature.getTitle()).assertEqual('alpha');
        expect(feature.getId().length).assertLarger(0);
      }

      {
        const feature = new NavFeature('beta', 2);
        expect(FeatureValidator.isValidTitle(feature.getTitle())).assertTrue();
        expect(FeatureValidator.isNonNegative(feature)).assertTrue();
      }

      {
        const collection = new FeatureCollection();
        collection.add(new NavFeature('one', 1));
        collection.add(new NavFeature('two', 2));
        collection.add(new NavFeature('three', 3));
        expect(collection.count()).assertEqual(3);
      }

      {
        const collection = new FeatureCollection();
        collection.add(new NavFeature('target', 2));
        expect(collection.getByTitle('target') === null).assertFalse();
        expect(collection.getByTitle('missing') === null).assertTrue();
      }

      {
        const collection = new FeatureCollection();
        expect(collection.isEmpty()).assertTrue();
        collection.add(new NavFeature('solo', 1));
        expect(collection.isEmpty()).assertFalse();
      }

      {
        const a = new NavFeature('a', 1);
        const b = new NavFeature('b', 3);
        const av: number = a.getNumericValue();
        const bv: number = b.getNumericValue();
        const statistics = new FeatureStatistics();
        statistics.collect([a, b]);
        expect(statistics.getMinValue()).assertEqual(Math.min(av, bv));
        expect(statistics.getMaxValue()).assertEqual(Math.max(av, bv));
      }

      {
        const a = new NavFeature('a', 1);
        const b = new NavFeature('b', 3);
        const av: number = a.getNumericValue();
        const bv: number = b.getNumericValue();
        const statistics = new FeatureStatistics();
        statistics.collect([a, b]);
        expect(statistics.getAverage()).assertEqual((av + bv) / 2);
        expect(statistics.getTotal()).assertEqual(2);
      }

      {
        const low = new NavFeature('low', 1);
        const high = new NavFeature('high', 3);
        const lv: number = low.getNumericValue();
        const hv: number = high.getNumericValue();
        expect(FeatureComparator.compareByValue(low, high)).assertEqual(lv - hv);
        expect(FeatureComparator.compareByValue(high, low)).assertEqual(hv - lv);
      }

      {
        const high = new NavFeature('c', 3);
        const low = new NavFeature('a', 1);
        const lv: number = low.getNumericValue();
        const hv: number = high.getNumericValue();
        const sorted: MouseFeature[] = FeatureSorter.sortByValue([high, low]);
        expect(sorted.length).assertEqual(2);
        expect(sorted[0].getNumericValue()).assertEqual(Math.min(lv, hv));
      }

      {
        const collection = new FeatureCollection();
        collection.add(new NavFeature('x', 1));
        collection.add(new NavFeature('y', 2));
        const titles: string[] = FeatureExtractor.extractTitles(collection.getAll());
        expect(titles.length).assertEqual(2);
        expect(titles.includes('x')).assertTrue();
      }

      {
        const collection = new FeatureCollection();
        collection.add(new NavFeature('x', 1));
        collection.add(new NavFeature('y', 2));
        const values: number[] = FeatureExtractor.extractValues(collection.getAll());
        expect(values.length).assertEqual(2);
      }

      {
        const history = new FeatureHistory();
        history.push(new NavFeature('first', 1));
        history.push(new NavFeature('second', 2));
        expect(history.getLength()).assertEqual(2);
        expect(history.containsTitle('first')).assertTrue();
      }

      {
        const history = new FeatureHistory();
        history.push(new NavFeature('only', 1));
        history.clear();
        expect(history.getLength()).assertEqual(0);
      }

      {
        const collection = new FeatureCollection();
        collection.add(new NavFeature('x', 1));
        collection.add(new NavFeature('y', 2));
        const serialized: string = FeatureSerializer.serialize(collection.getAll());
        expect(FeatureSerializer.countTokens(serialized)).assertEqual(2);
      }

      {
        const serialized: string = FeatureSerializer.serialize([]);
        expect(serialized.length).assertEqual(0);
        expect(FeatureSerializer.countTokens(serialized)).assertEqual(0);
      }

      {
        const first = new NavFeature('first', 1);
        const second = new NavFeature('second', 2);
        expect(first.getTitle() === second.getTitle()).assertFalse();
        expect(first.getId()).assertEqual(first.getId());
      }

      {
        const a = new NavFeature('extra_0', 1);
        const b = new NavFeature('extra_0_peer', 3);
        expect(a.getTitle()).assertEqual('extra_0');
        expect(a.getId().includes('extra')).assertTrue();
        expect(FeatureValidator.isValidTitle(a.getTitle())).assertTrue();
        const col = new FeatureCollection();
        col.add(a);
        col.add(b);
        expect(col.count()).assertEqual(2);
        expect(FeatureExtractor.extractTitles(col.getAll()).length).assertEqual(2);
        expect(col.getByTitle('extra_0') === null).assertFalse();
      }

      {
        const a = new NavFeature('extra_1', 1);
        const b = new NavFeature('extra_1_peer', 3);
        expect(a.getTitle()).assertEqual('extra_1');
        expect(a.getId().includes('extra')).assertTrue();
        expect(FeatureValidator.isValidTitle(a.getTitle())).assertTrue();
        const col = new FeatureCollection();
        col.add(a);
        col.add(b);
        expect(col.count()).assertEqual(2);
        expect(FeatureExtractor.extractTitles(col.getAll()).length).assertEqual(2);
        expect(col.getByTitle('extra_1') === null).assertFalse();
      }

      {
        const a = new NavFeature('extra_2', 1);
        const b = new NavFeature('extra_2_peer', 3);
        expect(a.getTitle()).assertEqual('extra_2');
        expect(a.getId().includes('extra')).assertTrue();
        expect(FeatureValidator.isValidTitle(a.getTitle())).assertTrue();
        const col = new FeatureCollection();
        col.add(a);
        col.add(b);
        expect(col.count()).assertEqual(2);
        expect(FeatureExtractor.extractTitles(col.getAll()).length).assertEqual(2);
        expect(col.getByTitle('extra_2') === null).assertFalse();
      }

      {
        const a = new NavFeature('extra_3', 1);
        const b = new NavFeature('extra_3_peer', 3);
        expect(a.getTitle()).assertEqual('extra_3');
        expect(a.getId().includes('extra')).assertTrue();
        expect(FeatureValidator.isValidTitle(a.getTitle())).assertTrue();
        const col = new FeatureCollection();
        col.add(a);
        col.add(b);
        expect(col.count()).assertEqual(2);
        expect(FeatureExtractor.extractTitles(col.getAll()).length).assertEqual(2);
        expect(col.getByTitle('extra_3') === null).assertFalse();
      }

      {
        const a = new NavFeature('extra_4', 1);
        const b = new NavFeature('extra_4_peer', 3);
        expect(a.getTitle()).assertEqual('extra_4');
        expect(a.getId().includes('extra')).assertTrue();
        expect(FeatureValidator.isValidTitle(a.getTitle())).assertTrue();
        const col = new FeatureCollection();
        col.add(a);
        col.add(b);
        expect(col.count()).assertEqual(2);
        expect(FeatureExtractor.extractTitles(col.getAll()).length).assertEqual(2);
        expect(col.getByTitle('extra_4') === null).assertFalse();
      }

      {
        const a = new NavFeature('extra_5', 1);
        const b = new NavFeature('extra_5_peer', 3);
        expect(a.getTitle()).assertEqual('extra_5');
        expect(a.getId().includes('extra')).assertTrue();
        expect(FeatureValidator.isValidTitle(a.getTitle())).assertTrue();
        const col = new FeatureCollection();
        col.add(a);
        col.add(b);
        expect(col.count()).assertEqual(2);
        expect(FeatureExtractor.extractTitles(col.getAll()).length).assertEqual(2);
        expect(col.getByTitle('extra_5') === null).assertFalse();
      }

      {
        const a = new NavFeature('extra_6', 1);
        const b = new NavFeature('extra_6_peer', 3);
        expect(a.getTitle()).assertEqual('extra_6');
        expect(a.getId().includes('extra')).assertTrue();
        expect(FeatureValidator.isValidTitle(a.getTitle())).assertTrue();
        const col = new FeatureCollection();
        col.add(a);
        col.add(b);
        expect(col.count()).assertEqual(2);
        expect(FeatureExtractor.extractTitles(col.getAll()).length).assertEqual(2);
        expect(col.getByTitle('extra_6') === null).assertFalse();
      }

      {
        const a = new NavFeature('extra_7', 1);
        const b = new NavFeature('extra_7_peer', 3);
        expect(a.getTitle()).assertEqual('extra_7');
        expect(a.getId().includes('extra')).assertTrue();
        expect(FeatureValidator.isValidTitle(a.getTitle())).assertTrue();
        const col = new FeatureCollection();
        col.add(a);
        col.add(b);
        expect(col.count()).assertEqual(2);
        expect(FeatureExtractor.extractTitles(col.getAll()).length).assertEqual(2);
        expect(col.getByTitle('extra_7') === null).assertFalse();
      }

      {
        const a = new NavFeature('extra_8', 1);
        const b = new NavFeature('extra_8_peer', 3);
        expect(a.getTitle()).assertEqual('extra_8');
        expect(a.getId().includes('extra')).assertTrue();
        expect(FeatureValidator.isValidTitle(a.getTitle())).assertTrue();
        const col = new FeatureCollection();
        col.add(a);
        col.add(b);
        expect(col.count()).assertEqual(2);
        expect(FeatureExtractor.extractTitles(col.getAll()).length).assertEqual(2);
        expect(col.getByTitle('extra_8') === null).assertFalse();
      }

      {
        const a = new NavFeature('extra_9', 1);
        const b = new NavFeature('extra_9_peer', 3);
        expect(a.getTitle()).assertEqual('extra_9');
        expect(a.getId().includes('extra')).assertTrue();
        expect(FeatureValidator.isValidTitle(a.getTitle())).assertTrue();
        const col = new FeatureCollection();
        col.add(a);
        col.add(b);
        expect(col.count()).assertEqual(2);
        expect(FeatureExtractor.extractTitles(col.getAll()).length).assertEqual(2);
        expect(col.getByTitle('extra_9') === null).assertFalse();
      }

      {
        const a = new NavFeature('extra_10', 1);
        const b = new NavFeature('extra_10_peer', 3);
        expect(a.getTitle()).assertEqual('extra_10');
        expect(a.getId().includes('extra')).assertTrue();
        expect(FeatureValidator.isValidTitle(a.getTitle())).assertTrue();
        const col = new FeatureCollection();
        col.add(a);
        col.add(b);
        expect(col.count()).assertEqual(2);
        expect(FeatureExtractor.extractTitles(col.getAll()).length).assertEqual(2);
        expect(col.getByTitle('extra_10') === null).assertFalse();
      }

      {
        const a = new NavFeature('extra_11', 1);
        const b = new NavFeature('extra_11_peer', 3);
        expect(a.getTitle()).assertEqual('extra_11');
        expect(a.getId().includes('extra')).assertTrue();
        expect(FeatureValidator.isValidTitle(a.getTitle())).assertTrue();
        const col = new FeatureCollection();
        col.add(a);
        col.add(b);
        expect(col.count()).assertEqual(2);
        expect(FeatureExtractor.extractTitles(col.getAll()).length).assertEqual(2);
        expect(col.getByTitle('extra_11') === null).assertFalse();
      }

      {
        const a = new NavFeature('extra_12', 1);
        const b = new NavFeature('extra_12_peer', 3);
        expect(a.getTitle()).assertEqual('extra_12');
        expect(a.getId().includes('extra')).assertTrue();
        expect(FeatureValidator.isValidTitle(a.getTitle())).assertTrue();
        const col = new FeatureCollection();
        col.add(a);
        col.add(b);
        expect(col.count()).assertEqual(2);
        expect(FeatureExtractor.extractTitles(col.getAll()).length).assertEqual(2);
        expect(col.getByTitle('extra_12') === null).assertFalse();
      }

      {
        const a = new NavFeature('extra_13', 1);
        const b = new NavFeature('extra_13_peer', 3);
        expect(a.getTitle()).assertEqual('extra_13');
        expect(a.getId().includes('extra')).assertTrue();
        expect(FeatureValidator.isValidTitle(a.getTitle())).assertTrue();
        const col = new FeatureCollection();
        col.add(a);
        col.add(b);
        expect(col.count()).assertEqual(2);
        expect(FeatureExtractor.extractTitles(col.getAll()).length).assertEqual(2);
        expect(col.getByTitle('extra_13') === null).assertFalse();
      }

      {
        const a = new NavFeature('extra_14', 1);
        const b = new NavFeature('extra_14_peer', 3);
        expect(a.getTitle()).assertEqual('extra_14');
        expect(a.getId().includes('extra')).assertTrue();
        expect(FeatureValidator.isValidTitle(a.getTitle())).assertTrue();
        const col = new FeatureCollection();
        col.add(a);
        col.add(b);
        expect(col.count()).assertEqual(2);
        expect(FeatureExtractor.extractTitles(col.getAll()).length).assertEqual(2);
        expect(col.getByTitle('extra_14') === null).assertFalse();
      }

      {
        const a = new NavFeature('extra_15', 1);
        const b = new NavFeature('extra_15_peer', 3);
        expect(a.getTitle()).assertEqual('extra_15');
        expect(a.getId().includes('extra')).assertTrue();
        expect(FeatureValidator.isValidTitle(a.getTitle())).assertTrue();
        const col = new FeatureCollection();
        col.add(a);
        col.add(b);
        expect(col.count()).assertEqual(2);
        expect(FeatureExtractor.extractTitles(col.getAll()).length).assertEqual(2);
        expect(col.getByTitle('extra_15') === null).assertFalse();
      }

      {
        const a = new NavFeature('extra_16', 1);
        const b = new NavFeature('extra_16_peer', 3);
        expect(a.getTitle()).assertEqual('extra_16');
        expect(a.getId().includes('extra')).assertTrue();
        expect(FeatureValidator.isValidTitle(a.getTitle())).assertTrue();
        const col = new FeatureCollection();
        col.add(a);
        col.add(b);
        expect(col.count()).assertEqual(2);
        expect(FeatureExtractor.extractTitles(col.getAll()).length).assertEqual(2);
        expect(col.getByTitle('extra_16') === null).assertFalse();
      }

      {
        const a = new NavFeature('extra_17', 1);
        const b = new NavFeature('extra_17_peer', 3);
        expect(a.getTitle()).assertEqual('extra_17');
        expect(a.getId().includes('extra')).assertTrue();
        expect(FeatureValidator.isValidTitle(a.getTitle())).assertTrue();
        const col = new FeatureCollection();
        col.add(a);
        col.add(b);
        expect(col.count()).assertEqual(2);
        expect(FeatureExtractor.extractTitles(col.getAll()).length).assertEqual(2);
        expect(col.getByTitle('extra_17') === null).assertFalse();
      }

      {
        const a = new NavFeature('extra_18', 1);
        const b = new NavFeature('extra_18_peer', 3);
        expect(a.getTitle()).assertEqual('extra_18');
        expect(a.getId().includes('extra')).assertTrue();
        expect(FeatureValidator.isValidTitle(a.getTitle())).assertTrue();
        const col = new FeatureCollection();
        col.add(a);
        col.add(b);
        expect(col.count()).assertEqual(2);
        expect(FeatureExtractor.extractTitles(col.getAll()).length).assertEqual(2);
        expect(col.getByTitle('extra_18') === null).assertFalse();
      }

      {
        const a = new NavFeature('extra_19', 1);
        const b = new NavFeature('extra_19_peer', 3);
        expect(a.getTitle()).assertEqual('extra_19');
        expect(a.getId().includes('extra')).assertTrue();
        expect(FeatureValidator.isValidTitle(a.getTitle())).assertTrue();
        const col = new FeatureCollection();
        col.add(a);
        col.add(b);
        expect(col.count()).assertEqual(2);
        expect(FeatureExtractor.extractTitles(col.getAll()).length).assertEqual(2);
        expect(col.getByTitle('extra_19') === null).assertFalse();
      }

      {
        const a = new NavFeature('extra_20', 1);
        const b = new NavFeature('extra_20_peer', 3);
        expect(a.getTitle()).assertEqual('extra_20');
        expect(a.getId().includes('extra')).assertTrue();
        expect(FeatureValidator.isValidTitle(a.getTitle())).assertTrue();
        const col = new FeatureCollection();
        col.add(a);
        col.add(b);
        expect(col.count()).assertEqual(2);
        expect(FeatureExtractor.extractTitles(col.getAll()).length).assertEqual(2);
        expect(col.getByTitle('extra_20') === null).assertFalse();
      }

      {
        const a = new NavFeature('extra_21', 1);
        const b = new NavFeature('extra_21_peer', 3);
        expect(a.getTitle()).assertEqual('extra_21');
        expect(a.getId().includes('extra')).assertTrue();
        expect(FeatureValidator.isValidTitle(a.getTitle())).assertTrue();
        const col = new FeatureCollection();
        col.add(a);
        col.add(b);
        expect(col.count()).assertEqual(2);
        expect(FeatureExtractor.extractTitles(col.getAll()).length).assertEqual(2);
        expect(col.getByTitle('extra_21') === null).assertFalse();
      }

      {
        const a = new NavFeature('extra_22', 1);
        const b = new NavFeature('extra_22_peer', 3);
        expect(a.getTitle()).assertEqual('extra_22');
        expect(a.getId().includes('extra')).assertTrue();
        expect(FeatureValidator.isValidTitle(a.getTitle())).assertTrue();
        const col = new FeatureCollection();
        col.add(a);
        col.add(b);
        expect(col.count()).assertEqual(2);
        expect(FeatureExtractor.extractTitles(col.getAll()).length).assertEqual(2);
        expect(col.getByTitle('extra_22') === null).assertFalse();
      }

      {
        const a = new NavFeature('extra_23', 1);
        const b = new NavFeature('extra_23_peer', 3);
        expect(a.getTitle()).assertEqual('extra_23');
        expect(a.getId().includes('extra')).assertTrue();
        expect(FeatureValidator.isValidTitle(a.getTitle())).assertTrue();
        const col = new FeatureCollection();
        col.add(a);
        col.add(b);
        expect(col.count()).assertEqual(2);
        expect(FeatureExtractor.extractTitles(col.getAll()).length).assertEqual(2);
        expect(col.getByTitle('extra_23') === null).assertFalse();
      }

      {
        const a = new NavFeature('extra_24', 1);
        const b = new NavFeature('extra_24_peer', 3);
        expect(a.getTitle()).assertEqual('extra_24');
        expect(a.getId().includes('extra')).assertTrue();
        expect(FeatureValidator.isValidTitle(a.getTitle())).assertTrue();
        const col = new FeatureCollection();
        col.add(a);
        col.add(b);
        expect(col.count()).assertEqual(2);
        expect(FeatureExtractor.extractTitles(col.getAll()).length).assertEqual(2);
        expect(col.getByTitle('extra_24') === null).assertFalse();
      }

      {
        const a = new NavFeature('extra_25', 1);
        const b = new NavFeature('extra_25_peer', 3);
        expect(a.getTitle()).assertEqual('extra_25');
        expect(a.getId().includes('extra')).assertTrue();
        expect(FeatureValidator.isValidTitle(a.getTitle())).assertTrue();
        const col = new FeatureCollection();
        col.add(a);
        col.add(b);
        expect(col.count()).assertEqual(2);
        expect(FeatureExtractor.extractTitles(col.getAll()).length).assertEqual(2);
        expect(col.getByTitle('extra_25') === null).assertFalse();
      }

      {
        const a = new NavFeature('extra_26', 1);
        const b = new NavFeature('extra_26_peer', 3);
        expect(a.getTitle()).assertEqual('extra_26');
        expect(a.getId().includes('extra')).assertTrue();
        expect(FeatureValidator.isValidTitle(a.getTitle())).assertTrue();
        const col = new FeatureCollection();
        col.add(a);
        col.add(b);
        expect(col.count()).assertEqual(2);
        expect(FeatureExtractor.extractTitles(col.getAll()).length).assertEqual(2);
        expect(col.getByTitle('extra_26') === null).assertFalse();
      }

      {
        const a = new NavFeature('extra_27', 1);
        const b = new NavFeature('extra_27_peer', 3);
        expect(a.getTitle()).assertEqual('extra_27');
        expect(a.getId().includes('extra')).assertTrue();
        expect(FeatureValidator.isValidTitle(a.getTitle())).assertTrue();
        const col = new FeatureCollection();
        col.add(a);
        col.add(b);
        expect(col.count()).assertEqual(2);
        expect(FeatureExtractor.extractTitles(col.getAll()).length).assertEqual(2);
        expect(col.getByTitle('extra_27') === null).assertFalse();
      }

      {
        const a = new NavFeature('extra_28', 1);
        const b = new NavFeature('extra_28_peer', 3);
        expect(a.getTitle()).assertEqual('extra_28');
        expect(a.getId().includes('extra')).assertTrue();
        expect(FeatureValidator.isValidTitle(a.getTitle())).assertTrue();
        const col = new FeatureCollection();
        col.add(a);
        col.add(b);
        expect(col.count()).assertEqual(2);
        expect(FeatureExtractor.extractTitles(col.getAll()).length).assertEqual(2);
        expect(col.getByTitle('extra_28') === null).assertFalse();
      }

      {
        const a = new NavFeature('extra_29', 1);
        const b = new NavFeature('extra_29_peer', 3);
        expect(a.getTitle()).assertEqual('extra_29');
        expect(a.getId().includes('extra')).assertTrue();
        expect(FeatureValidator.isValidTitle(a.getTitle())).assertTrue();
        const col = new FeatureCollection();
        col.add(a);
        col.add(b);
        expect(col.count()).assertEqual(2);
        expect(FeatureExtractor.extractTitles(col.getAll()).length).assertEqual(2);
        expect(col.getByTitle('extra_29') === null).assertFalse();
      }

      {
        const a = new NavFeature('extra_30', 1);
        const b = new NavFeature('extra_30_peer', 3);
        expect(a.getTitle()).assertEqual('extra_30');
        expect(a.getId().includes('extra')).assertTrue();
        expect(FeatureValidator.isValidTitle(a.getTitle())).assertTrue();
        const col = new FeatureCollection();
        col.add(a);
        col.add(b);
        expect(col.count()).assertEqual(2);
        expect(FeatureExtractor.extractTitles(col.getAll()).length).assertEqual(2);
        expect(col.getByTitle('extra_30') === null).assertFalse();
      }

      {
        const a = new NavFeature('extra_31', 1);
        const b = new NavFeature('extra_31_peer', 3);
        expect(a.getTitle()).assertEqual('extra_31');
        expect(a.getId().includes('extra')).assertTrue();
        expect(FeatureValidator.isValidTitle(a.getTitle())).assertTrue();
        const col = new FeatureCollection();
        col.add(a);
        col.add(b);
        expect(col.count()).assertEqual(2);
        expect(FeatureExtractor.extractTitles(col.getAll()).length).assertEqual(2);
        expect(col.getByTitle('extra_31') === null).assertFalse();
      }

      {
        const a = new NavFeature('extra_32', 1);
        const b = new NavFeature('extra_32_peer', 3);
        expect(a.getTitle()).assertEqual('extra_32');
        expect(a.getId().includes('extra')).assertTrue();
        expect(FeatureValidator.isValidTitle(a.getTitle())).assertTrue();
        const col = new FeatureCollection();
        col.add(a);
        col.add(b);
        expect(col.count()).assertEqual(2);
        expect(FeatureExtractor.extractTitles(col.getAll()).length).assertEqual(2);
        expect(col.getByTitle('extra_32') === null).assertFalse();
      }

      {
        const a = new NavFeature('extra_33', 1);
        const b = new NavFeature('extra_33_peer', 3);
        expect(a.getTitle()).assertEqual('extra_33');
        expect(a.getId().includes('extra')).assertTrue();
        expect(FeatureValidator.isValidTitle(a.getTitle())).assertTrue();
        const col = new FeatureCollection();
        col.add(a);
        col.add(b);
        expect(col.count()).assertEqual(2);
        expect(FeatureExtractor.extractTitles(col.getAll()).length).assertEqual(2);
        expect(col.getByTitle('extra_33') === null).assertFalse();
      }

      {
        const a = new NavFeature('extra_34', 1);
        const b = new NavFeature('extra_34_peer', 3);
        expect(a.getTitle()).assertEqual('extra_34');
        expect(a.getId().includes('extra')).assertTrue();
        expect(FeatureValidator.isValidTitle(a.getTitle())).assertTrue();
        const col = new FeatureCollection();
        col.add(a);
        col.add(b);
        expect(col.count()).assertEqual(2);
        expect(FeatureExtractor.extractTitles(col.getAll()).length).assertEqual(2);
        expect(col.getByTitle('extra_34') === null).assertFalse();
      }

      {
        const a = new NavFeature('extra_35', 1);
        const b = new NavFeature('extra_35_peer', 3);
        expect(a.getTitle()).assertEqual('extra_35');
        expect(a.getId().includes('extra')).assertTrue();
        expect(FeatureValidator.isValidTitle(a.getTitle())).assertTrue();
        const col = new FeatureCollection();
        col.add(a);
        col.add(b);
        expect(col.count()).assertEqual(2);
        expect(FeatureExtractor.extractTitles(col.getAll()).length).assertEqual(2);
        expect(col.getByTitle('extra_35') === null).assertFalse();
      }

      {
        const a = new NavFeature('extra_36', 1);
        const b = new NavFeature('extra_36_peer', 3);
        expect(a.getTitle()).assertEqual('extra_36');
        expect(a.getId().includes('extra')).assertTrue();
        expect(FeatureValidator.isValidTitle(a.getTitle())).assertTrue();
        const col = new FeatureCollection();
        col.add(a);
        col.add(b);
        expect(col.count()).assertEqual(2);
        expect(FeatureExtractor.extractTitles(col.getAll()).length).assertEqual(2);
        expect(col.getByTitle('extra_36') === null).assertFalse();
      }

      {
        const a = new NavFeature('extra_37', 1);
        const b = new NavFeature('extra_37_peer', 3);
        expect(a.getTitle()).assertEqual('extra_37');
        expect(a.getId().includes('extra')).assertTrue();
        expect(FeatureValidator.isValidTitle(a.getTitle())).assertTrue();
        const col = new FeatureCollection();
        col.add(a);
        col.add(b);
        expect(col.count()).assertEqual(2);
        expect(FeatureExtractor.extractTitles(col.getAll()).length).assertEqual(2);
        expect(col.getByTitle('extra_37') === null).assertFalse();
      }

      {
        const a = new NavFeature('extra_38', 1);
        const b = new NavFeature('extra_38_peer', 3);
        expect(a.getTitle()).assertEqual('extra_38');
        expect(a.getId().includes('extra')).assertTrue();
        expect(FeatureValidator.isValidTitle(a.getTitle())).assertTrue();
        const col = new FeatureCollection();
        col.add(a);
        col.add(b);
        expect(col.count()).assertEqual(2);
        expect(FeatureExtractor.extractTitles(col.getAll()).length).assertEqual(2);
        expect(col.getByTitle('extra_38') === null).assertFalse();
      }

      {
        const a = new NavFeature('extra_39', 1);
        const b = new NavFeature('extra_39_peer', 3);
        expect(a.getTitle()).assertEqual('extra_39');
        expect(a.getId().includes('extra')).assertTrue();
        expect(FeatureValidator.isValidTitle(a.getTitle())).assertTrue();
        const col = new FeatureCollection();
        col.add(a);
        col.add(b);
        expect(col.count()).assertEqual(2);
        expect(FeatureExtractor.extractTitles(col.getAll()).length).assertEqual(2);
        expect(col.getByTitle('extra_39') === null).assertFalse();
      }

      {
        const a = new NavFeature('extra_40', 1);
        const b = new NavFeature('extra_40_peer', 3);
        expect(a.getTitle()).assertEqual('extra_40');
        expect(a.getId().includes('extra')).assertTrue();
        expect(FeatureValidator.isValidTitle(a.getTitle())).assertTrue();
        const col = new FeatureCollection();
        col.add(a);
        col.add(b);
        expect(col.count()).assertEqual(2);
        expect(FeatureExtractor.extractTitles(col.getAll()).length).assertEqual(2);
        expect(col.getByTitle('extra_40') === null).assertFalse();
      }

      {
        const a = new NavFeature('extra_41', 1);
        const b = new NavFeature('extra_41_peer', 3);
        expect(a.getTitle()).assertEqual('extra_41');
        expect(a.getId().includes('extra')).assertTrue();
        expect(FeatureValidator.isValidTitle(a.getTitle())).assertTrue();
        const col = new FeatureCollection();
        col.add(a);
        col.add(b);
        expect(col.count()).assertEqual(2);
        expect(FeatureExtractor.extractTitles(col.getAll()).length).assertEqual(2);
        expect(col.getByTitle('extra_41') === null).assertFalse();
      }

    });

  });
}

