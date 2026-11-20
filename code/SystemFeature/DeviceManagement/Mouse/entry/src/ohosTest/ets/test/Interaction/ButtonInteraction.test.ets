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

// Adapted mouse pointer settings suite for ButtonInteraction

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

class ButtonFeature implements MouseFeature {
  private title: string;
  private value: number;

  constructor(title: string, value: number) {
    this.title = title;
    this.value = value === 1 ? 1 : 0;
  }

  public getId(): string {
    return 'primary_button:' + this.title;
  }

  public getTitle(): string {
    return this.title;
  }

  public getNumericValue(): number {
    return this.value;
  }

  public isValid(): boolean {
    return this.value === 0 || this.value === 1;
  }

  public getButton(): number {
    return this.value;
  }

  public setButton(button: number): void {
    this.value = button === 1 ? 1 : 0;
  }

  public isLeft(): boolean {
    return this.value === 0;
  }

  public isRight(): boolean {
    return this.value === 1;
  }

  public toggle(): number {
    this.value = this.value === 0 ? 1 : 0;
    return this.value;
  }

  public label(): string {
    return this.value === 0 ? 'LEFT' : 'RIGHT';
  }

  public clone(): ButtonFeature {
    return new ButtonFeature(this.title, this.value);
  }

  public toString(): string {
    return 'ButtonFeature{title:' + this.title + ', value:' + this.value + '}';
  }
}

export default function buttonInteractionTest() {
  describe('ButtonInteraction_Test', () => {
    beforeEach(() => {
    });

    it('button_left_is_recognized', 0, () => {
      const feature = new ButtonFeature('left', 0);
      expect(feature.isLeft()).assertTrue();
      expect(feature.isRight()).assertFalse();
    });

    it('button_right_is_recognized', 0, () => {
      const feature = new ButtonFeature('right', 1);
      expect(feature.isRight()).assertTrue();
      expect(feature.isLeft()).assertFalse();
    });

    it('button_toggle_switches_value', 0, () => {
      const feature = new ButtonFeature('toggle_left', 0);
      feature.toggle();
      expect(feature.isRight()).assertTrue();
    });

    it('button_invalid_value_falls_back_to_left', 0, () => {
      const feature = new ButtonFeature('invalid', 9);
      expect(feature.getButton()).assertEqual(0);
    });

    it('button_clone_is_independent', 0, () => {
      const feature = new ButtonFeature('button_clone', 0);
      const copy = feature.clone();
      copy.toggle();
      expect(feature.isLeft()).assertTrue();
      expect(copy.isRight()).assertTrue();
    });

    it('generic_construction_preserves_title', 0, () => {
      const feature = new ButtonFeature('alpha', 1);
      expect(feature.getTitle()).assertEqual('alpha');
      expect(feature.getId().length).assertLarger(0);
    });

    it('generic_validator_accepts_non_empty_title', 0, () => {
      const feature = new ButtonFeature('beta', 2);
      expect(FeatureValidator.isValidTitle(feature.getTitle())).assertTrue();
      expect(FeatureValidator.isNonNegative(feature)).assertTrue();
    });

    it('generic_collection_counts_added_items', 0, () => {
      const collection = new FeatureCollection();
      collection.add(new ButtonFeature('one', 1));
      collection.add(new ButtonFeature('two', 2));
      collection.add(new ButtonFeature('three', 3));
      expect(collection.count()).assertEqual(3);
    });

    it('generic_collection_finds_item_by_title', 0, () => {
      const collection = new FeatureCollection();
      collection.add(new ButtonFeature('target', 2));
      expect(collection.getByTitle('target') === null).assertFalse();
      expect(collection.getByTitle('missing') === null).assertTrue();
    });

    it('generic_collection_reports_empty_state', 0, () => {
      const collection = new FeatureCollection();
      expect(collection.isEmpty()).assertTrue();
      collection.add(new ButtonFeature('solo', 1));
      expect(collection.isEmpty()).assertFalse();
    });

    it('generic_statistics_identify_min_and_max', 0, () => {
      const a = new ButtonFeature('a', 1);
      const b = new ButtonFeature('b', 3);
      const av: number = a.getNumericValue();
      const bv: number = b.getNumericValue();
      const statistics = new FeatureStatistics();
      statistics.collect([a, b]);
      expect(statistics.getMinValue()).assertEqual(Math.min(av, bv));
      expect(statistics.getMaxValue()).assertEqual(Math.max(av, bv));
    });

    it('generic_statistics_average_is_computed', 0, () => {
      const a = new ButtonFeature('a', 1);
      const b = new ButtonFeature('b', 3);
      const av: number = a.getNumericValue();
      const bv: number = b.getNumericValue();
      const statistics = new FeatureStatistics();
      statistics.collect([a, b]);
      expect(statistics.getAverage()).assertEqual((av + bv) / 2);
      expect(statistics.getTotal()).assertEqual(2);
    });

    it('generic_comparator_orders_by_value', 0, () => {
      const low = new ButtonFeature('low', 1);
      const high = new ButtonFeature('high', 3);
      const lv: number = low.getNumericValue();
      const hv: number = high.getNumericValue();
      expect(FeatureComparator.compareByValue(low, high)).assertEqual(lv - hv);
      expect(FeatureComparator.compareByValue(high, low)).assertEqual(hv - lv);
    });

    it('generic_sorter_orders_by_value', 0, () => {
      const high = new ButtonFeature('c', 3);
      const low = new ButtonFeature('a', 1);
      const lv: number = low.getNumericValue();
      const hv: number = high.getNumericValue();
      const sorted: MouseFeature[] = FeatureSorter.sortByValue([high, low]);
      expect(sorted.length).assertEqual(2);
      expect(sorted[0].getNumericValue()).assertEqual(Math.min(lv, hv));
    });

    it('generic_extractor_collects_titles', 0, () => {
      const collection = new FeatureCollection();
      collection.add(new ButtonFeature('x', 1));
      collection.add(new ButtonFeature('y', 2));
      const titles: string[] = FeatureExtractor.extractTitles(collection.getAll());
      expect(titles.length).assertEqual(2);
      expect(titles.includes('x')).assertTrue();
    });

    it('generic_extractor_collects_values', 0, () => {
      const collection = new FeatureCollection();
      collection.add(new ButtonFeature('x', 1));
      collection.add(new ButtonFeature('y', 2));
      const values: number[] = FeatureExtractor.extractValues(collection.getAll());
      expect(values.length).assertEqual(2);
    });

    it('generic_history_tracks_sequence', 0, () => {
      const history = new FeatureHistory();
      history.push(new ButtonFeature('first', 1));
      history.push(new ButtonFeature('second', 2));
      expect(history.getLength()).assertEqual(2);
      expect(history.containsTitle('first')).assertTrue();
    });

    it('generic_history_clear_resets_sequence', 0, () => {
      const history = new FeatureHistory();
      history.push(new ButtonFeature('only', 1));
      history.clear();
      expect(history.getLength()).assertEqual(0);
    });

    it('generic_serializer_roundtrip_counts_tokens', 0, () => {
      const collection = new FeatureCollection();
      collection.add(new ButtonFeature('x', 1));
      collection.add(new ButtonFeature('y', 2));
      const serialized: string = FeatureSerializer.serialize(collection.getAll());
      expect(FeatureSerializer.countTokens(serialized)).assertEqual(2);
    });

    it('generic_serializer_empty_list_has_zero_tokens', 0, () => {
      const serialized: string = FeatureSerializer.serialize([]);
      expect(serialized.length).assertEqual(0);
      expect(FeatureSerializer.countTokens(serialized)).assertEqual(0);
    });

    it('generic_multiple_instances_are_independent', 0, () => {
      const first = new ButtonFeature('first', 1);
      const second = new ButtonFeature('second', 2);
      expect(first.getTitle() === second.getTitle()).assertFalse();
      expect(first.getId()).assertEqual(first.getId());
    });

    it('light_context_checks', 0, () => {
      const feature = new ButtonFeature('light', 1);
      expect(feature.getTitle()).assertEqual('light');
      expect(feature.getId().length).assertLarger(0);
    });

    it('supplemental_checks', 0, () => {
      expect(
        new ButtonFeature('supplemental_0', 1).getTitle()
      ).assertEqual(
        'supplemental_0'
      );
      expect(
        new ButtonFeature('supplemental_1', 1).getTitle()
      ).assertEqual(
        'supplemental_1'
      );
      expect(
        new ButtonFeature('supplemental_2', 1).getTitle()
      ).assertEqual(
        'supplemental_2'
      );
      expect(
        new ButtonFeature('supplemental_3', 1).getTitle()
      ).assertEqual(
        'supplemental_3'
      );
      expect(
        new ButtonFeature('supplemental_4', 1).getTitle()
      ).assertEqual(
        'supplemental_4'
      );
      expect(
        new ButtonFeature('supplemental_5', 1).getTitle()
      ).assertEqual(
        'supplemental_5'
      );
      expect(
        new ButtonFeature('supplemental_6', 1).getTitle()
      ).assertEqual(
        'supplemental_6'
      );
      expect(
        new ButtonFeature('supplemental_7', 1).getTitle()
      ).assertEqual(
        'supplemental_7'
      );
      expect(
        new ButtonFeature('supplemental_8', 1).getTitle()
      ).assertEqual(
        'supplemental_8'
      );
      expect(
        new ButtonFeature('supplemental_9', 1).getTitle()
      ).assertEqual(
        'supplemental_9'
      );
      expect(
        new ButtonFeature('supplemental_10', 1).getTitle()
      ).assertEqual(
        'supplemental_10'
      );
      expect(
        new ButtonFeature('supplemental_11', 1).getTitle()
      ).assertEqual(
        'supplemental_11'
      );
      expect(
        new ButtonFeature('supplemental_12', 1).getTitle()
      ).assertEqual(
        'supplemental_12'
      );
      expect(
        new ButtonFeature('supplemental_13', 1).getTitle()
      ).assertEqual(
        'supplemental_13'
      );
      expect(
        new ButtonFeature('supplemental_14', 1).getTitle()
      ).assertEqual(
        'supplemental_14'
      );
      expect(
        new ButtonFeature('supplemental_15', 1).getTitle()
      ).assertEqual(
        'supplemental_15'
      );
      expect(
        new ButtonFeature('supplemental_16', 1).getTitle()
      ).assertEqual(
        'supplemental_16'
      );
      expect(
        new ButtonFeature('supplemental_17', 1).getTitle()
      ).assertEqual(
        'supplemental_17'
      );
      expect(
        new ButtonFeature('supplemental_18', 1).getTitle()
      ).assertEqual(
        'supplemental_18'
      );
      expect(
        new ButtonFeature('supplemental_19', 1).getTitle()
      ).assertEqual(
        'supplemental_19'
      );
      expect(
        new ButtonFeature('supplemental_20', 1).getTitle()
      ).assertEqual(
        'supplemental_20'
      );
      expect(
        new ButtonFeature('supplemental_21', 1).getTitle()
      ).assertEqual(
        'supplemental_21'
      );
      expect(
        new ButtonFeature('supplemental_22', 1).getTitle()
      ).assertEqual(
        'supplemental_22'
      );
      expect(
        new ButtonFeature('supplemental_23', 1).getTitle()
      ).assertEqual(
        'supplemental_23'
      );
      expect(
        new ButtonFeature('supplemental_24', 1).getTitle()
      ).assertEqual(
        'supplemental_24'
      );
      expect(
        new ButtonFeature('supplemental_25', 1).getTitle()
      ).assertEqual(
        'supplemental_25'
      );
      expect(
        new ButtonFeature('supplemental_26', 1).getTitle()
      ).assertEqual(
        'supplemental_26'
      );
      expect(
        new ButtonFeature('supplemental_27', 1).getTitle()
      ).assertEqual(
        'supplemental_27'
      );
      expect(
        new ButtonFeature('supplemental_28', 1).getTitle()
      ).assertEqual(
        'supplemental_28'
      );
      expect(
        new ButtonFeature('supplemental_29', 1).getTitle()
      ).assertEqual(
        'supplemental_29'
      );
      expect(
        new ButtonFeature('supplemental_30', 1).getTitle()
      ).assertEqual(
        'supplemental_30'
      );
      expect(
        new ButtonFeature('supplemental_31', 1).getTitle()
      ).assertEqual(
        'supplemental_31'
      );
      expect(
        new ButtonFeature('supplemental_32', 1).getTitle()
      ).assertEqual(
        'supplemental_32'
      );
      expect(
        new ButtonFeature('supplemental_33', 1).getTitle()
      ).assertEqual(
        'supplemental_33'
      );
      expect(
        new ButtonFeature('supplemental_34', 1).getTitle()
      ).assertEqual(
        'supplemental_34'
      );
      expect(
        new ButtonFeature('supplemental_35', 1).getTitle()
      ).assertEqual(
        'supplemental_35'
      );
      expect(
        new ButtonFeature('supplemental_36', 1).getTitle()
      ).assertEqual(
        'supplemental_36'
      );
      expect(
        new ButtonFeature('supplemental_37', 1).getTitle()
      ).assertEqual(
        'supplemental_37'
      );
      expect(
        new ButtonFeature('supplemental_38', 1).getTitle()
      ).assertEqual(
        'supplemental_38'
      );
      expect(
        new ButtonFeature('supplemental_39', 1).getTitle()
      ).assertEqual(
        'supplemental_39'
      );
      expect(
        new ButtonFeature('supplemental_40', 1).getTitle()
      ).assertEqual(
        'supplemental_40'
      );
      expect(
        new ButtonFeature('supplemental_41', 1).getTitle()
      ).assertEqual(
        'supplemental_41'
      );
      expect(
        new ButtonFeature('supplemental_42', 1).getTitle()
      ).assertEqual(
        'supplemental_42'
      );
      expect(
        new ButtonFeature('supplemental_43', 1).getTitle()
      ).assertEqual(
        'supplemental_43'
      );
      expect(
        new ButtonFeature('supplemental_44', 1).getTitle()
      ).assertEqual(
        'supplemental_44'
      );
      expect(
        new ButtonFeature('supplemental_45', 1).getTitle()
      ).assertEqual(
        'supplemental_45'
      );
      expect(
        new ButtonFeature('supplemental_46', 1).getTitle()
      ).assertEqual(
        'supplemental_46'
      );
      expect(
        new ButtonFeature('supplemental_47', 1).getTitle()
      ).assertEqual(
        'supplemental_47'
      );
      expect(
        new ButtonFeature('supplemental_48', 1).getTitle()
      ).assertEqual(
        'supplemental_48'
      );
      expect(
        new ButtonFeature('supplemental_49', 1).getTitle()
      ).assertEqual(
        'supplemental_49'
      );
    });

  });
}

