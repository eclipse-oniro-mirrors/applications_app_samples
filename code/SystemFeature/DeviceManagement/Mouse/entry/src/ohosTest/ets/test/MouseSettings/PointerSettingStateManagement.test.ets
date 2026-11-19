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

// Adapted mouse pointer settings suite for PointerSettingStateManagement

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

class StateFeature implements MouseFeature {
  private title: string;
  private value: number;
  private primaryButton: number;
  private hoverScroll: number;
  private pointerSize: number;
  private pointerColor: number;
  private pointerStyle: number;

  constructor(title: string, value: number) {
    this.title = title;
    this.value = value < 0 ? 0 : value;
    this.primaryButton = 0;
    this.hoverScroll = 1;
    this.pointerSize = 1;
    this.pointerColor = 0x171717;
    this.pointerStyle = 0;
  }

  public getId(): string {
    return 'state:' + this.title;
  }

  public getTitle(): string {
    return this.title;
  }

  public getNumericValue(): number {
    return this.value;
  }

  public isValid(): boolean {
    return true;
  }

  public getPrimaryButton(): number {
    return this.primaryButton;
  }

  public setPrimaryButton(button: number): void {
    this.primaryButton = button === 1 ? 1 : 0;
  }

  public isHoverScrollEnabled(): boolean {
    return this.hoverScroll === 1;
  }

  public setHoverScroll(enabled: boolean): void {
    this.hoverScroll = enabled ? 1 : 0;
  }

  public getPointerSize(): number {
    return this.pointerSize;
  }

  public setPointerSize(size: number): void {
    if (size < 1) {
      this.pointerSize = 1;
    } else if (size > 7) {
      this.pointerSize = 7;
    } else {
      this.pointerSize = size;
    }
  }

  public getPointerColor(): number {
    return this.pointerColor;
  }

  public setPointerColor(color: number): void {
    this.pointerColor = color;
  }

  public getPointerStyle(): number {
    return this.pointerStyle;
  }

  public setPointerStyle(style: number): void {
    this.pointerStyle = ((style % 3) + 3) % 3;
  }

  public reset(): void {
    this.primaryButton = 0;
    this.hoverScroll = 1;
    this.pointerSize = 1;
    this.pointerColor = 0x171717;
    this.pointerStyle = 0;
  }

  public isDefault(): boolean {
    return this.primaryButton === 0 && this.hoverScroll === 1 && this.pointerSize === 1 &&
      this.pointerColor === 0x171717 && this.pointerStyle === 0;
  }

  public toJson(): string {
    return '{"primaryButton":' + this.primaryButton + ',"hoverScroll":' + this.hoverScroll +
      ',"pointerSize":' + this.pointerSize + ',"pointerColor":' + this.pointerColor +
      ',"pointerStyle":' + this.pointerStyle + '}';
  }

  public clone(): StateFeature {
    const copy: StateFeature = new StateFeature(this.title, this.value);
    copy.setPrimaryButton(this.primaryButton);
    copy.setHoverScroll(this.hoverScroll === 1);
    copy.setPointerSize(this.pointerSize);
    copy.setPointerColor(this.pointerColor);
    copy.setPointerStyle(this.pointerStyle);
    return copy;
  }

  public toString(): string {
    return 'StateFeature{title:' + this.title + ', value:' + this.value + '}';
  }
}

export default function pointerSettingStateManagementTest() {
  describe('PointerSettingStateManagement_Test', () => {
    beforeEach(() => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'suite setup');
    });

    it('PointerSettingStateManagement_aggregated_validation', 0, async () => {
      {
        const feature = new StateFeature('state_default', 1);
        expect(feature.isDefault()).assertTrue();
        expect(feature.getPrimaryButton()).assertEqual(0);
      }

      {
        const feature = new StateFeature('state_button', 1);
        feature.setPrimaryButton(1);
        expect(feature.getPrimaryButton()).assertEqual(1);
      }

      {
        const feature = new StateFeature('state_size', 1);
        feature.setPointerSize(99);
        expect(feature.getPointerSize()).assertEqual(7);
      }

      {
        const feature = new StateFeature('state_json', 1);
        const json: string = feature.toJson();
        expect(json.includes('primaryButton')).assertTrue();
      }

      {
        const feature = new StateFeature('state_reset', 1);
        feature.setPrimaryButton(1);
        feature.reset();
        expect(feature.isDefault()).assertTrue();
      }

      {
        const feature = new StateFeature('alpha', 1);
        expect(feature.getTitle()).assertEqual('alpha');
        expect(feature.getId().length).assertLarger(0);
      }

      {
        const feature = new StateFeature('beta', 2);
        expect(FeatureValidator.isValidTitle(feature.getTitle())).assertTrue();
        expect(FeatureValidator.isNonNegative(feature)).assertTrue();
      }

      {
        const collection = new FeatureCollection();
        collection.add(new StateFeature('one', 1));
        collection.add(new StateFeature('two', 2));
        collection.add(new StateFeature('three', 3));
        expect(collection.count()).assertEqual(3);
      }

      {
        const collection = new FeatureCollection();
        collection.add(new StateFeature('target', 2));
        expect(collection.getByTitle('target') === null).assertFalse();
        expect(collection.getByTitle('missing') === null).assertTrue();
      }

      {
        const collection = new FeatureCollection();
        expect(collection.isEmpty()).assertTrue();
        collection.add(new StateFeature('solo', 1));
        expect(collection.isEmpty()).assertFalse();
      }

      {
        const a = new StateFeature('a', 1);
        const b = new StateFeature('b', 3);
        const av: number = a.getNumericValue();
        const bv: number = b.getNumericValue();
        const statistics = new FeatureStatistics();
        statistics.collect([a, b]);
        expect(statistics.getMinValue()).assertEqual(Math.min(av, bv));
        expect(statistics.getMaxValue()).assertEqual(Math.max(av, bv));
      }

      {
        const a = new StateFeature('a', 1);
        const b = new StateFeature('b', 3);
        const av: number = a.getNumericValue();
        const bv: number = b.getNumericValue();
        const statistics = new FeatureStatistics();
        statistics.collect([a, b]);
        expect(statistics.getAverage()).assertEqual((av + bv) / 2);
        expect(statistics.getTotal()).assertEqual(2);
      }

      {
        const low = new StateFeature('low', 1);
        const high = new StateFeature('high', 3);
        const lv: number = low.getNumericValue();
        const hv: number = high.getNumericValue();
        expect(FeatureComparator.compareByValue(low, high)).assertEqual(lv - hv);
        expect(FeatureComparator.compareByValue(high, low)).assertEqual(hv - lv);
      }

      {
        const high = new StateFeature('c', 3);
        const low = new StateFeature('a', 1);
        const lv: number = low.getNumericValue();
        const hv: number = high.getNumericValue();
        const sorted: MouseFeature[] = FeatureSorter.sortByValue([high, low]);
        expect(sorted.length).assertEqual(2);
        expect(sorted[0].getNumericValue()).assertEqual(Math.min(lv, hv));
      }

      {
        const collection = new FeatureCollection();
        collection.add(new StateFeature('x', 1));
        collection.add(new StateFeature('y', 2));
        const titles: string[] = FeatureExtractor.extractTitles(collection.getAll());
        expect(titles.length).assertEqual(2);
        expect(titles.includes('x')).assertTrue();
      }

      {
        const collection = new FeatureCollection();
        collection.add(new StateFeature('x', 1));
        collection.add(new StateFeature('y', 2));
        const values: number[] = FeatureExtractor.extractValues(collection.getAll());
        expect(values.length).assertEqual(2);
      }

      {
        const history = new FeatureHistory();
        history.push(new StateFeature('first', 1));
        history.push(new StateFeature('second', 2));
        expect(history.getLength()).assertEqual(2);
        expect(history.containsTitle('first')).assertTrue();
      }

      {
        const history = new FeatureHistory();
        history.push(new StateFeature('only', 1));
        history.clear();
        expect(history.getLength()).assertEqual(0);
      }

      {
        const collection = new FeatureCollection();
        collection.add(new StateFeature('x', 1));
        collection.add(new StateFeature('y', 2));
        const serialized: string = FeatureSerializer.serialize(collection.getAll());
        expect(FeatureSerializer.countTokens(serialized)).assertEqual(2);
      }

      {
        const serialized: string = FeatureSerializer.serialize([]);
        expect(serialized.length).assertEqual(0);
        expect(FeatureSerializer.countTokens(serialized)).assertEqual(0);
      }

      {
        const first = new StateFeature('first', 1);
        const second = new StateFeature('second', 2);
        expect(first.getTitle() === second.getTitle()).assertFalse();
        expect(first.getId()).assertEqual(first.getId());
      }

      {
        const a = new StateFeature('extra_0', 1);
        const b = new StateFeature('extra_0_peer', 3);
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

    });

  });
}

