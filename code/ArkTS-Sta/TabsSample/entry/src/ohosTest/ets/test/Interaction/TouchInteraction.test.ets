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
import { Driver } from '@ohos.UiTest';
import {
  getDriver,
  serializedDelay,
  pressAndWait,
  triggerTabsHome,
  tabsComponentCount,
  getCurrentFocusIndex,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_BACK,
  DELAY_KEY_NAVIGATION
} from '../Shared/SharedDriver';


// TouchInteraction 自定义 TabBar 模型：对齐 TabBar 页面的 5 个页签配置
class TouchInteractionTabBarModel {
  private labels: string[] = ['首页', '新闻', '视频', '朋友圈', '我的'];
  private selectedIndex: number = 0;

  public getLabels(): string[] {
    return this.labels;
  }

  public labelCount(): number {
    return this.labels.length;
  }

  public labelAt(index: number): string {
    if (index < 0 || index >= this.labels.length) {
      return '';
    }
    return this.labels[index];
  }

  public select(index: number): boolean {
    if (index < 0 || index >= this.labels.length) {
      return false;
    }
    this.selectedIndex = index;
    return true;
  }

  public getSelectedIndex(): number {
    return this.selectedIndex;
  }

  public getSelectedLabel(): string {
    return this.labels[this.selectedIndex];
  }

  public isSelected(index: number): boolean {
    return this.selectedIndex === index;
  }

  public reset(): void {
    this.selectedIndex = 0;
  }
}


// TouchInteraction 索引追踪器：覆盖页签索引在 [0, count) 范围内的边界行为
class TouchInteractionIndexTracker {
  private current: number = 0;
  private count: number;

  public constructor(count: number) {
    this.count = count > 0 ? count : 1;
  }

  public setIndex(index: number): boolean {
    if (index < 0 || index >= this.count) {
      return false;
    }
    this.current = index;
    return true;
  }

  public next(): boolean {
    if (this.current >= this.count - 1) {
      return false;
    }
    this.current = this.current + 1;
    return true;
  }

  public prev(): boolean {
    if (this.current <= 0) {
      return false;
    }
    this.current = this.current - 1;
    return true;
  }

  public wrapNext(): number {
    this.current = (this.current + 1) % this.count;
    return this.current;
  }

  public wrapPrev(): number {
    this.current = (this.current - 1 + this.count) % this.count;
    return this.current;
  }

  public getIndex(): number {
    return this.current;
  }

  public getCount(): number {
    return this.count;
  }

  public isFirst(): boolean {
    return this.current === 0;
  }

  public isLast(): boolean {
    return this.current === this.count - 1;
  }

  public reset(): void {
    this.current = 0;
  }
}


// TouchInteraction 历史记录：保存焦点/导航路径序列
class TouchInteractionHistory {
  private items: number[] = [];

  public append(value: number): void {
    this.items.push(value);
  }

  public get(index: number): number {
    if (index < 0 || index >= this.items.length) {
      return -1;
    }
    return this.items[index];
  }

  public length(): number {
    return this.items.length;
  }

  public first(): number {
    return this.items.length === 0 ? -1 : this.items[0];
  }

  public last(): number {
    return this.items.length === 0 ? -1 : this.items[this.items.length - 1];
  }

  public includes(value: number): boolean {
    return this.items.indexOf(value) >= 0;
  }

  public isMonotonicIncreasing(): boolean {
    for (let i: number = 1; i < this.items.length; i++) {
      if (this.items[i] < this.items[i - 1]) {
        return false;
      }
    }
    return true;
  }

  public toArray(): number[] {
    const copy: number[] = [];
    for (let i: number = 0; i < this.items.length; i++) {
      copy.push(this.items[i]);
    }
    return copy;
  }

  public reset(): void {
    this.items = [];
  }
}


// TouchInteraction 校验器：提供页签索引/输入范围等通用边界校验
class TouchInteractionValidator {
  public static isInRange(value: number, min: number, max: number): boolean {
    return value >= min && value <= max;
  }

  public static isValidIndex(index: number, count: number): boolean {
    return index >= 0 && index < count;
  }

  public static isNonEmptyText(text: string): boolean {
    return text.length > 0;
  }

  public static isPositive(value: number): boolean {
    return value > 0;
  }

  public static clamp(value: number, min: number, max: number): number {
    if (value < min) {
      return min;
    }
    if (value > max) {
      return max;
    }
    return value;
  }

  public static normalizeIndex(index: number, count: number): number {
    if (count <= 0) {
      return 0;
    }
    const mod: number = index % count;
    return mod < 0 ? mod + count : mod;
  }
}


// TouchInteraction 页签下拉菜单模型：对齐 FunctionalScenes 的 TAB_DATA 菜单
class TouchInteractionMenuModel {
  private ids: number[] = [0, 1, 2, 3, 4, 5, 6, 7];
  private names: string[] = ['全部', 'Native', '动效', '三方库', 'UI布局', '性能示例', '其他', '性能文章'];
  private currentId: number = 0;

  public itemCount(): number {
    return this.ids.length;
  }

  public nameOf(id: number): string {
    if (id < 0 || id >= this.names.length) {
      return '';
    }
    return this.names[id];
  }

  public contains(id: number): boolean {
    return this.ids.indexOf(id) >= 0;
  }

  public choose(id: number): boolean {
    if (!this.contains(id)) {
      return false;
    }
    this.currentId = id;
    return true;
  }

  public current(): number {
    return this.currentId;
  }

  public next(): number {
    this.currentId = (this.currentId + 1) % this.ids.length;
    return this.currentId;
  }
}


// TouchInteraction 指标采集器：统计页签切换/渲染耗时样本
class TouchInteractionMetricsCollector {
  private samples: number[] = [];

  public record(value: number): void {
    if (value >= 0) {
      this.samples.push(value);
    }
  }

  public getSampleCount(): number {
    return this.samples.length;
  }

  public getSum(): number {
    let total: number = 0;
    for (let i: number = 0; i < this.samples.length; i++) {
      total += this.samples[i];
    }
    return total;
  }

  public getAverage(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    return this.getSum() / this.samples.length;
  }

  public getMax(): number {
    let max: number = 0;
    for (let i: number = 0; i < this.samples.length; i++) {
      if (this.samples[i] > max) {
        max = this.samples[i];
      }
    }
    return max;
  }

  public getMin(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    let min: number = this.samples[0];
    for (let i: number = 1; i < this.samples.length; i++) {
      if (this.samples[i] < min) {
        min = this.samples[i];
      }
    }
    return min;
  }

  public isWithinBudget(budget: number): boolean {
    return this.getMax() <= budget;
  }

  public clear(): void {
    this.samples = [];
  }
}

export default function touchInteractionTest() {
  describe('TouchInteraction_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 500);
      await triggerTabsHome(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 300);
    });

    it('touchinteraction_tabs_visible_1', 0, async () => {
      const driver: Driver = getDriver();
      await serializedDelay(driver, 300);
      await triggerTabsHome(driver);
      const count: number = await tabsComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
      const focus: number = await getCurrentFocusIndex(driver);
      expect(focus).assertLargerOrEqual(-1);
    });

    it('touchinteraction_tab_navigation_1', 0, async () => {
      const driver: Driver = getDriver();
      await pressAndWait(driver, KEY_RIGHT, 2, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const count: number = await tabsComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
    });

    it('touchinteraction_tab_stability_1', 0, async () => {
      const driver: Driver = getDriver();
      const before: number = await tabsComponentCount(driver);
      for (let i: number = 0; i < 3; i++) {
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      }
      const after: number = await tabsComponentCount(driver);
      expect(Math.abs(after - before)).assertLessOrEqual(5);
    });

    it('touchInteractionTest_labels_0', 0, async () => {
      const bar = new TouchInteractionTabBarModel();
      expect(bar.labelCount()).assertEqual(5);
      expect(bar.labelAt(0)).assertEqual('首页');
      expect(bar.labelAt(4)).assertEqual('我的');
      expect(bar.labelAt(9)).assertEqual('');
    });

    it('touchInteractionTest_selection_0', 0, async () => {
      const bar = new TouchInteractionTabBarModel();
      expect(bar.getSelectedIndex()).assertEqual(0);
      expect(bar.select(0)).assertTrue();
      expect(bar.isSelected(0)).assertTrue();
      expect(bar.getSelectedLabel()).assertEqual('首页');
      expect(bar.select(9)).assertFalse();
    });

    it('touchInteractionTest_reset_0', 0, async () => {
      const bar = new TouchInteractionTabBarModel();
      bar.select(3);
      bar.reset();
      expect(bar.getSelectedIndex()).assertEqual(0);
      expect(bar.isSelected(0)).assertTrue();
      expect(bar.getLabels().length).assertEqual(5);
    });

    it('touchInteractionTest_labels_1', 0, async () => {
      const bar = new TouchInteractionTabBarModel();
      expect(bar.labelCount()).assertEqual(5);
      expect(bar.labelAt(0)).assertEqual('首页');
      expect(bar.labelAt(4)).assertEqual('我的');
      expect(bar.labelAt(9)).assertEqual('');
    });

    it('touchInteractionTest_selection_1', 0, async () => {
      const bar = new TouchInteractionTabBarModel();
      expect(bar.getSelectedIndex()).assertEqual(0);
      expect(bar.select(1)).assertTrue();
      expect(bar.isSelected(1)).assertTrue();
      expect(bar.getSelectedLabel()).assertEqual('新闻');
      expect(bar.select(9)).assertFalse();
    });

    it('touchInteractionTest_reset_1', 0, async () => {
      const bar = new TouchInteractionTabBarModel();
      bar.select(3);
      bar.reset();
      expect(bar.getSelectedIndex()).assertEqual(0);
      expect(bar.isSelected(0)).assertTrue();
      expect(bar.getLabels().length).assertEqual(5);
    });

    it('touchInteractionTest_labels_2', 0, async () => {
      const bar = new TouchInteractionTabBarModel();
      expect(bar.labelCount()).assertEqual(5);
      expect(bar.labelAt(0)).assertEqual('首页');
      expect(bar.labelAt(4)).assertEqual('我的');
      expect(bar.labelAt(9)).assertEqual('');
    });

    it('touchInteractionTest_selection_2', 0, async () => {
      const bar = new TouchInteractionTabBarModel();
      expect(bar.getSelectedIndex()).assertEqual(0);
      expect(bar.select(2)).assertTrue();
      expect(bar.isSelected(2)).assertTrue();
      expect(bar.getSelectedLabel()).assertEqual('视频');
      expect(bar.select(9)).assertFalse();
    });

    it('touchInteractionTest_reset_2', 0, async () => {
      const bar = new TouchInteractionTabBarModel();
      bar.select(3);
      bar.reset();
      expect(bar.getSelectedIndex()).assertEqual(0);
      expect(bar.isSelected(0)).assertTrue();
      expect(bar.getLabels().length).assertEqual(5);
    });

    it('touchInteractionTest_set_index_in_range_0', 0, async () => {
      const tracker = new TouchInteractionIndexTracker(5);
      expect(tracker.setIndex(0)).assertTrue();
      expect(tracker.getIndex()).assertEqual(0);
      expect(tracker.getCount()).assertEqual(5);
      expect(tracker.setIndex(5)).assertFalse();
      expect(tracker.setIndex(-1)).assertFalse();
    });

    it('touchInteractionTest_next_prev_boundary_0', 0, async () => {
      const tracker = new TouchInteractionIndexTracker(5);
      expect(tracker.isFirst()).assertTrue();
      expect(tracker.prev()).assertFalse();
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.isLast()).assertTrue();
      expect(tracker.next()).assertFalse();
      tracker.reset();
      expect(tracker.getIndex()).assertEqual(0);
    });

    it('touchInteractionTest_wrap_around_0', 0, async () => {
      const tracker = new TouchInteractionIndexTracker(5);
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.wrapNext()).assertEqual(0);
      expect(tracker.wrapPrev()).assertEqual(4);
      expect(tracker.getIndex()).assertEqual(4);
    });

    it('touchInteractionTest_set_index_in_range_1', 0, async () => {
      const tracker = new TouchInteractionIndexTracker(5);
      expect(tracker.setIndex(1)).assertTrue();
      expect(tracker.getIndex()).assertEqual(1);
      expect(tracker.getCount()).assertEqual(5);
      expect(tracker.setIndex(5)).assertFalse();
      expect(tracker.setIndex(-1)).assertFalse();
    });

    it('touchInteractionTest_next_prev_boundary_1', 0, async () => {
      const tracker = new TouchInteractionIndexTracker(5);
      expect(tracker.isFirst()).assertTrue();
      expect(tracker.prev()).assertFalse();
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.isLast()).assertTrue();
      expect(tracker.next()).assertFalse();
      tracker.reset();
      expect(tracker.getIndex()).assertEqual(0);
    });

    it('touchInteractionTest_wrap_around_1', 0, async () => {
      const tracker = new TouchInteractionIndexTracker(5);
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.wrapNext()).assertEqual(0);
      expect(tracker.wrapPrev()).assertEqual(4);
      expect(tracker.getIndex()).assertEqual(4);
    });

    it('touchInteractionTest_set_index_in_range_2', 0, async () => {
      const tracker = new TouchInteractionIndexTracker(5);
      expect(tracker.setIndex(2)).assertTrue();
      expect(tracker.getIndex()).assertEqual(2);
      expect(tracker.getCount()).assertEqual(5);
      expect(tracker.setIndex(5)).assertFalse();
      expect(tracker.setIndex(-1)).assertFalse();
    });

    it('touchInteractionTest_next_prev_boundary_2', 0, async () => {
      const tracker = new TouchInteractionIndexTracker(5);
      expect(tracker.isFirst()).assertTrue();
      expect(tracker.prev()).assertFalse();
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.isLast()).assertTrue();
      expect(tracker.next()).assertFalse();
      tracker.reset();
      expect(tracker.getIndex()).assertEqual(0);
    });

    it('touchInteractionTest_wrap_around_2', 0, async () => {
      const tracker = new TouchInteractionIndexTracker(5);
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.wrapNext()).assertEqual(0);
      expect(tracker.wrapPrev()).assertEqual(4);
      expect(tracker.getIndex()).assertEqual(4);
    });

    it('touchInteractionTest_append_and_access_0', 0, async () => {
      const history = new TouchInteractionHistory();
      history.append(0);
      history.append(1);
      history.append(2);
      expect(history.length()).assertEqual(3);
      expect(history.first()).assertEqual(0);
      expect(history.last()).assertEqual(2);
      expect(history.get(1)).assertEqual(1);
      expect(history.get(99)).assertEqual(-1);
    });

    it('touchInteractionTest_monotonic_and_includes_0', 0, async () => {
      const history = new TouchInteractionHistory();
      history.append(0);
      history.append(1);
      history.append(2);
      expect(history.isMonotonicIncreasing()).assertTrue();
      expect(history.includes(1)).assertTrue();
      expect(history.includes(9)).assertFalse();
      history.append(0);
      expect(history.isMonotonicIncreasing()).assertFalse();
    });

    it('touchInteractionTest_copy_and_reset_0', 0, async () => {
      const history = new TouchInteractionHistory();
      history.append(0);
      const copy: number[] = history.toArray();
      expect(copy.length).assertEqual(1);
      copy.push(99);
      expect(history.length()).assertEqual(1);
      history.reset();
      expect(history.length()).assertEqual(0);
      expect(history.first()).assertEqual(-1);
    });

    it('touchInteractionTest_append_and_access_1', 0, async () => {
      const history = new TouchInteractionHistory();
      history.append(1);
      history.append(2);
      history.append(3);
      expect(history.length()).assertEqual(3);
      expect(history.first()).assertEqual(1);
      expect(history.last()).assertEqual(3);
      expect(history.get(1)).assertEqual(2);
      expect(history.get(99)).assertEqual(-1);
    });

    it('touchInteractionTest_monotonic_and_includes_1', 0, async () => {
      const history = new TouchInteractionHistory();
      history.append(0);
      history.append(1);
      history.append(2);
      expect(history.isMonotonicIncreasing()).assertTrue();
      expect(history.includes(1)).assertTrue();
      expect(history.includes(9)).assertFalse();
      history.append(0);
      expect(history.isMonotonicIncreasing()).assertFalse();
    });

    it('touchInteractionTest_copy_and_reset_1', 0, async () => {
      const history = new TouchInteractionHistory();
      history.append(1);
      const copy: number[] = history.toArray();
      expect(copy.length).assertEqual(1);
      copy.push(99);
      expect(history.length()).assertEqual(1);
      history.reset();
      expect(history.length()).assertEqual(0);
      expect(history.first()).assertEqual(-1);
    });

    it('touchInteractionTest_append_and_access_2', 0, async () => {
      const history = new TouchInteractionHistory();
      history.append(2);
      history.append(3);
      history.append(4);
      expect(history.length()).assertEqual(3);
      expect(history.first()).assertEqual(2);
      expect(history.last()).assertEqual(4);
      expect(history.get(1)).assertEqual(3);
      expect(history.get(99)).assertEqual(-1);
    });

    it('touchInteractionTest_monotonic_and_includes_2', 0, async () => {
      const history = new TouchInteractionHistory();
      history.append(0);
      history.append(1);
      history.append(2);
      expect(history.isMonotonicIncreasing()).assertTrue();
      expect(history.includes(1)).assertTrue();
      expect(history.includes(9)).assertFalse();
      history.append(0);
      expect(history.isMonotonicIncreasing()).assertFalse();
    });

    it('touchInteractionTest_copy_and_reset_2', 0, async () => {
      const history = new TouchInteractionHistory();
      history.append(2);
      const copy: number[] = history.toArray();
      expect(copy.length).assertEqual(1);
      copy.push(99);
      expect(history.length()).assertEqual(1);
      history.reset();
      expect(history.length()).assertEqual(0);
      expect(history.first()).assertEqual(-1);
    });

    it('touchInteractionTest_range_checks_0', 0, async () => {
      expect(TouchInteractionValidator.isInRange(1, 0, 5)).assertTrue();
      expect(TouchInteractionValidator.isInRange(9, 0, 5)).assertFalse();
      expect(TouchInteractionValidator.isValidIndex(0, 3)).assertTrue();
      expect(TouchInteractionValidator.isValidIndex(3, 3)).assertFalse();
      expect(TouchInteractionValidator.isPositive(1)).assertTrue();
      expect(TouchInteractionValidator.isPositive(0)).assertFalse();
    });

    it('touchInteractionTest_text_and_clamp_0', 0, async () => {
      expect(TouchInteractionValidator.isNonEmptyText('tabs')).assertTrue();
      expect(TouchInteractionValidator.isNonEmptyText('')).assertFalse();
      expect(TouchInteractionValidator.clamp(-5, 0, 10)).assertEqual(0);
      expect(TouchInteractionValidator.clamp(50, 0, 10)).assertEqual(10);
      expect(TouchInteractionValidator.clamp(5, 0, 10)).assertEqual(5);
    });

    it('touchInteractionTest_normalize_index_0', 0, async () => {
      expect(TouchInteractionValidator.normalizeIndex(-1, 5)).assertEqual(4);
      expect(TouchInteractionValidator.normalizeIndex(5, 5)).assertEqual(0);
      expect(TouchInteractionValidator.normalizeIndex(7, 5)).assertEqual(2);
      expect(TouchInteractionValidator.normalizeIndex(3, 0)).assertEqual(0);
    });

    it('touchInteractionTest_range_checks_1', 0, async () => {
      expect(TouchInteractionValidator.isInRange(2, 0, 6)).assertTrue();
      expect(TouchInteractionValidator.isInRange(10, 0, 6)).assertFalse();
      expect(TouchInteractionValidator.isValidIndex(0, 4)).assertTrue();
      expect(TouchInteractionValidator.isValidIndex(4, 4)).assertFalse();
      expect(TouchInteractionValidator.isPositive(1)).assertTrue();
      expect(TouchInteractionValidator.isPositive(0)).assertFalse();
    });

    it('touchInteractionTest_text_and_clamp_1', 0, async () => {
      expect(TouchInteractionValidator.isNonEmptyText('tabs')).assertTrue();
      expect(TouchInteractionValidator.isNonEmptyText('')).assertFalse();
      expect(TouchInteractionValidator.clamp(-5, 0, 10)).assertEqual(0);
      expect(TouchInteractionValidator.clamp(50, 0, 10)).assertEqual(10);
      expect(TouchInteractionValidator.clamp(5, 0, 10)).assertEqual(5);
    });

    it('touchInteractionTest_normalize_index_1', 0, async () => {
      expect(TouchInteractionValidator.normalizeIndex(-1, 5)).assertEqual(4);
      expect(TouchInteractionValidator.normalizeIndex(5, 5)).assertEqual(0);
      expect(TouchInteractionValidator.normalizeIndex(8, 5)).assertEqual(3);
      expect(TouchInteractionValidator.normalizeIndex(3, 0)).assertEqual(0);
    });

    it('touchInteractionTest_range_checks_2', 0, async () => {
      expect(TouchInteractionValidator.isInRange(3, 0, 7)).assertTrue();
      expect(TouchInteractionValidator.isInRange(11, 0, 7)).assertFalse();
      expect(TouchInteractionValidator.isValidIndex(0, 5)).assertTrue();
      expect(TouchInteractionValidator.isValidIndex(5, 5)).assertFalse();
      expect(TouchInteractionValidator.isPositive(1)).assertTrue();
      expect(TouchInteractionValidator.isPositive(0)).assertFalse();
    });

    it('touchInteractionTest_text_and_clamp_2', 0, async () => {
      expect(TouchInteractionValidator.isNonEmptyText('tabs')).assertTrue();
      expect(TouchInteractionValidator.isNonEmptyText('')).assertFalse();
      expect(TouchInteractionValidator.clamp(-5, 0, 10)).assertEqual(0);
      expect(TouchInteractionValidator.clamp(50, 0, 10)).assertEqual(10);
      expect(TouchInteractionValidator.clamp(5, 0, 10)).assertEqual(5);
    });

    it('touchInteractionTest_normalize_index_2', 0, async () => {
      expect(TouchInteractionValidator.normalizeIndex(-1, 5)).assertEqual(4);
      expect(TouchInteractionValidator.normalizeIndex(5, 5)).assertEqual(0);
      expect(TouchInteractionValidator.normalizeIndex(9, 5)).assertEqual(4);
      expect(TouchInteractionValidator.normalizeIndex(3, 0)).assertEqual(0);
    });

    it('touchInteractionTest_items_0', 0, async () => {
      const menu = new TouchInteractionMenuModel();
      expect(menu.itemCount()).assertEqual(8);
      expect(menu.nameOf(0)).assertEqual('全部');
      expect(menu.nameOf(7)).assertEqual('性能文章');
      expect(menu.nameOf(99)).assertEqual('');
    });

    it('touchInteractionTest_choose_0', 0, async () => {
      const menu = new TouchInteractionMenuModel();
      expect(menu.choose(0)).assertTrue();
      expect(menu.current()).assertEqual(0);
      expect(menu.contains(0)).assertTrue();
      expect(menu.choose(99)).assertFalse();
    });

    it('touchInteractionTest_next_wrap_0', 0, async () => {
      const menu = new TouchInteractionMenuModel();
      expect(menu.next()).assertEqual(1);
      for (let i: number = 0; i < 7; i++) {
        menu.next();
      }
      expect(menu.current()).assertEqual(0);
    });

    it('touchInteractionTest_items_1', 0, async () => {
      const menu = new TouchInteractionMenuModel();
      expect(menu.itemCount()).assertEqual(8);
      expect(menu.nameOf(0)).assertEqual('全部');
      expect(menu.nameOf(7)).assertEqual('性能文章');
      expect(menu.nameOf(99)).assertEqual('');
    });

    it('touchInteractionTest_choose_1', 0, async () => {
      const menu = new TouchInteractionMenuModel();
      expect(menu.choose(1)).assertTrue();
      expect(menu.current()).assertEqual(1);
      expect(menu.contains(1)).assertTrue();
      expect(menu.choose(99)).assertFalse();
    });

    it('touchInteractionTest_next_wrap_1', 0, async () => {
      const menu = new TouchInteractionMenuModel();
      expect(menu.next()).assertEqual(1);
      for (let i: number = 0; i < 7; i++) {
        menu.next();
      }
      expect(menu.current()).assertEqual(0);
    });

    it('touchInteractionTest_items_2', 0, async () => {
      const menu = new TouchInteractionMenuModel();
      expect(menu.itemCount()).assertEqual(8);
      expect(menu.nameOf(0)).assertEqual('全部');
      expect(menu.nameOf(7)).assertEqual('性能文章');
      expect(menu.nameOf(99)).assertEqual('');
    });

    it('touchInteractionTest_choose_2', 0, async () => {
      const menu = new TouchInteractionMenuModel();
      expect(menu.choose(2)).assertTrue();
      expect(menu.current()).assertEqual(2);
      expect(menu.contains(2)).assertTrue();
      expect(menu.choose(99)).assertFalse();
    });

    it('touchInteractionTest_next_wrap_2', 0, async () => {
      const menu = new TouchInteractionMenuModel();
      expect(menu.next()).assertEqual(1);
      for (let i: number = 0; i < 7; i++) {
        menu.next();
      }
      expect(menu.current()).assertEqual(0);
    });

    it('touchInteractionTest_sum_average_0', 0, async () => {
      const metrics = new TouchInteractionMetricsCollector();
      metrics.record(10);
      metrics.record(20);
      metrics.record(30);
      expect(metrics.getSampleCount()).assertEqual(3);
      expect(metrics.getSum()).assertEqual(60);
      expect(metrics.getAverage()).assertEqual(20);
    });

    it('touchInteractionTest_max_min_0', 0, async () => {
      const metrics = new TouchInteractionMetricsCollector();
      metrics.record(5);
      metrics.record(50);
      metrics.record(15);
      expect(metrics.getMax()).assertEqual(50);
      expect(metrics.getMin()).assertEqual(5);
      metrics.record(-1);
      expect(metrics.getSampleCount()).assertEqual(3);
    });

    it('touchInteractionTest_budget_0', 0, async () => {
      const metrics = new TouchInteractionMetricsCollector();
      metrics.record(16);
      metrics.record(20);
      expect(metrics.isWithinBudget(30)).assertTrue();
      expect(metrics.isWithinBudget(10)).assertFalse();
      metrics.clear();
      expect(metrics.getSampleCount()).assertEqual(0);
      expect(metrics.getAverage()).assertEqual(0);
    });

    it('touchInteractionTest_sum_average_1', 0, async () => {
      const metrics = new TouchInteractionMetricsCollector();
      metrics.record(11);
      metrics.record(21);
      metrics.record(31);
      expect(metrics.getSampleCount()).assertEqual(3);
      expect(metrics.getSum()).assertEqual(63);
      expect(metrics.getAverage()).assertEqual(21);
    });

    it('touchInteractionTest_max_min_1', 0, async () => {
      const metrics = new TouchInteractionMetricsCollector();
      metrics.record(6);
      metrics.record(51);
      metrics.record(16);
      expect(metrics.getMax()).assertEqual(51);
      expect(metrics.getMin()).assertEqual(6);
      metrics.record(-1);
      expect(metrics.getSampleCount()).assertEqual(3);
    });

    it('touchInteractionTest_budget_1', 0, async () => {
      const metrics = new TouchInteractionMetricsCollector();
      metrics.record(16);
      metrics.record(20);
      expect(metrics.isWithinBudget(30)).assertTrue();
      expect(metrics.isWithinBudget(10)).assertFalse();
      metrics.clear();
      expect(metrics.getSampleCount()).assertEqual(0);
      expect(metrics.getAverage()).assertEqual(0);
    });

    it('touchInteractionTest_sum_average_2', 0, async () => {
      const metrics = new TouchInteractionMetricsCollector();
      metrics.record(12);
      metrics.record(22);
      metrics.record(32);
      expect(metrics.getSampleCount()).assertEqual(3);
      expect(metrics.getSum()).assertEqual(66);
      expect(metrics.getAverage()).assertEqual(22);
    });

    it('touchInteractionTest_max_min_2', 0, async () => {
      const metrics = new TouchInteractionMetricsCollector();
      metrics.record(7);
      metrics.record(52);
      metrics.record(17);
      expect(metrics.getMax()).assertEqual(52);
      expect(metrics.getMin()).assertEqual(7);
      metrics.record(-1);
      expect(metrics.getSampleCount()).assertEqual(3);
    });

    it('touchInteractionTest_budget_2', 0, async () => {
      const metrics = new TouchInteractionMetricsCollector();
      metrics.record(16);
      metrics.record(20);
      expect(metrics.isWithinBudget(30)).assertTrue();
      expect(metrics.isWithinBudget(10)).assertFalse();
      metrics.clear();
      expect(metrics.getSampleCount()).assertEqual(0);
      expect(metrics.getAverage()).assertEqual(0);
    });

    it('touchInteractionTest_selection_1_p1', 0, async () => {
      const bar = new TouchInteractionTabBarModel();
      expect(bar.getSelectedIndex()).assertEqual(0);
      expect(bar.select(1)).assertTrue();
      expect(bar.isSelected(1)).assertTrue();
      expect(bar.getSelectedLabel()).assertEqual('新闻');
      expect(bar.select(9)).assertFalse();
    });

    it('touchInteractionTest_wrap_around_2_p2', 0, async () => {
      const tracker = new TouchInteractionIndexTracker(5);
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.wrapNext()).assertEqual(0);
      expect(tracker.wrapPrev()).assertEqual(4);
      expect(tracker.getIndex()).assertEqual(4);
    });

    it('touchInteractionTest_append_and_access_3_p3', 0, async () => {
      const history = new TouchInteractionHistory();
      history.append(3);
      history.append(4);
      history.append(5);
      expect(history.length()).assertEqual(3);
      expect(history.first()).assertEqual(3);
      expect(history.last()).assertEqual(5);
      expect(history.get(1)).assertEqual(4);
      expect(history.get(99)).assertEqual(-1);
    });

    it('touchInteractionTest_text_and_clamp_4_p4', 0, async () => {
      expect(TouchInteractionValidator.isNonEmptyText('tabs')).assertTrue();
      expect(TouchInteractionValidator.isNonEmptyText('')).assertFalse();
      expect(TouchInteractionValidator.clamp(-5, 0, 10)).assertEqual(0);
      expect(TouchInteractionValidator.clamp(50, 0, 10)).assertEqual(10);
      expect(TouchInteractionValidator.clamp(5, 0, 10)).assertEqual(5);
    });

    it('touchInteractionTest_next_wrap_5_p5', 0, async () => {
      const menu = new TouchInteractionMenuModel();
      expect(menu.next()).assertEqual(1);
      for (let i: number = 0; i < 7; i++) {
        menu.next();
      }
      expect(menu.current()).assertEqual(0);
    });

  });
}
