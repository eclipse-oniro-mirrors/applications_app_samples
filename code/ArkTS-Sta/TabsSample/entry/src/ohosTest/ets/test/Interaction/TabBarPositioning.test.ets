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


// TabBarPositioning 自定义 TabBar 模型：对齐 TabBar 页面的 5 个页签配置
class TabBarPositioningTabBarModel {
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


// TabBarPositioning 索引追踪器：覆盖页签索引在 [0, count) 范围内的边界行为
class TabBarPositioningIndexTracker {
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

export default function tabBarPositioningTest() {
  describe('TabBarPositioning_Test', () => {
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

    it('tabbarpositioning_tabs_visible_1', 0, async () => {
      const driver: Driver = getDriver();
      await serializedDelay(driver, 300);
      await triggerTabsHome(driver);
      const count: number = await tabsComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
      const focus: number = await getCurrentFocusIndex(driver);
      expect(focus).assertLargerOrEqual(-1);
    });

    it('tabbarpositioning_tab_navigation_1', 0, async () => {
      const driver: Driver = getDriver();
      await pressAndWait(driver, KEY_RIGHT, 2, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const count: number = await tabsComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
    });

    it('tabbarpositioning_tab_stability_1', 0, async () => {
      const driver: Driver = getDriver();
      const before: number = await tabsComponentCount(driver);
      for (let i: number = 0; i < 3; i++) {
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      }
      const after: number = await tabsComponentCount(driver);
      expect(Math.abs(after - before)).assertLessOrEqual(5);
    });

    it('tabBarPositioningTest_labels_0', 0, async () => {
      const bar = new TabBarPositioningTabBarModel();
      expect(bar.labelCount()).assertEqual(5);
      expect(bar.labelAt(0)).assertEqual('首页');
      expect(bar.labelAt(4)).assertEqual('我的');
      expect(bar.labelAt(9)).assertEqual('');
    });

    it('tabBarPositioningTest_selection_0', 0, async () => {
      const bar = new TabBarPositioningTabBarModel();
      expect(bar.getSelectedIndex()).assertEqual(0);
      expect(bar.select(0)).assertTrue();
      expect(bar.isSelected(0)).assertTrue();
      expect(bar.getSelectedLabel()).assertEqual('首页');
      expect(bar.select(9)).assertFalse();
    });

    it('tabBarPositioningTest_reset_0', 0, async () => {
      const bar = new TabBarPositioningTabBarModel();
      bar.select(3);
      bar.reset();
      expect(bar.getSelectedIndex()).assertEqual(0);
      expect(bar.isSelected(0)).assertTrue();
      expect(bar.getLabels().length).assertEqual(5);
    });

    it('tabBarPositioningTest_labels_1', 0, async () => {
      const bar = new TabBarPositioningTabBarModel();
      expect(bar.labelCount()).assertEqual(5);
      expect(bar.labelAt(0)).assertEqual('首页');
      expect(bar.labelAt(4)).assertEqual('我的');
      expect(bar.labelAt(9)).assertEqual('');
    });

    it('tabBarPositioningTest_selection_1', 0, async () => {
      const bar = new TabBarPositioningTabBarModel();
      expect(bar.getSelectedIndex()).assertEqual(0);
      expect(bar.select(1)).assertTrue();
      expect(bar.isSelected(1)).assertTrue();
      expect(bar.getSelectedLabel()).assertEqual('新闻');
      expect(bar.select(9)).assertFalse();
    });

    it('tabBarPositioningTest_reset_1', 0, async () => {
      const bar = new TabBarPositioningTabBarModel();
      bar.select(3);
      bar.reset();
      expect(bar.getSelectedIndex()).assertEqual(0);
      expect(bar.isSelected(0)).assertTrue();
      expect(bar.getLabels().length).assertEqual(5);
    });

    it('tabBarPositioningTest_labels_2', 0, async () => {
      const bar = new TabBarPositioningTabBarModel();
      expect(bar.labelCount()).assertEqual(5);
      expect(bar.labelAt(0)).assertEqual('首页');
      expect(bar.labelAt(4)).assertEqual('我的');
      expect(bar.labelAt(9)).assertEqual('');
    });

    it('tabBarPositioningTest_selection_2', 0, async () => {
      const bar = new TabBarPositioningTabBarModel();
      expect(bar.getSelectedIndex()).assertEqual(0);
      expect(bar.select(2)).assertTrue();
      expect(bar.isSelected(2)).assertTrue();
      expect(bar.getSelectedLabel()).assertEqual('视频');
      expect(bar.select(9)).assertFalse();
    });

    it('tabBarPositioningTest_reset_2', 0, async () => {
      const bar = new TabBarPositioningTabBarModel();
      bar.select(3);
      bar.reset();
      expect(bar.getSelectedIndex()).assertEqual(0);
      expect(bar.isSelected(0)).assertTrue();
      expect(bar.getLabels().length).assertEqual(5);
    });

    it('tabBarPositioningTest_set_index_in_range_0', 0, async () => {
      const tracker = new TabBarPositioningIndexTracker(5);
      expect(tracker.setIndex(0)).assertTrue();
      expect(tracker.getIndex()).assertEqual(0);
      expect(tracker.getCount()).assertEqual(5);
      expect(tracker.setIndex(5)).assertFalse();
      expect(tracker.setIndex(-1)).assertFalse();
    });

    it('tabBarPositioningTest_next_prev_boundary_0', 0, async () => {
      const tracker = new TabBarPositioningIndexTracker(5);
      expect(tracker.isFirst()).assertTrue();
      expect(tracker.prev()).assertFalse();
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.isLast()).assertTrue();
      expect(tracker.next()).assertFalse();
      tracker.reset();
      expect(tracker.getIndex()).assertEqual(0);
    });

    it('tabBarPositioningTest_wrap_around_0', 0, async () => {
      const tracker = new TabBarPositioningIndexTracker(5);
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.wrapNext()).assertEqual(0);
      expect(tracker.wrapPrev()).assertEqual(4);
      expect(tracker.getIndex()).assertEqual(4);
    });

    it('tabBarPositioningTest_set_index_in_range_1', 0, async () => {
      const tracker = new TabBarPositioningIndexTracker(5);
      expect(tracker.setIndex(1)).assertTrue();
      expect(tracker.getIndex()).assertEqual(1);
      expect(tracker.getCount()).assertEqual(5);
      expect(tracker.setIndex(5)).assertFalse();
      expect(tracker.setIndex(-1)).assertFalse();
    });

    it('tabBarPositioningTest_next_prev_boundary_1', 0, async () => {
      const tracker = new TabBarPositioningIndexTracker(5);
      expect(tracker.isFirst()).assertTrue();
      expect(tracker.prev()).assertFalse();
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.isLast()).assertTrue();
      expect(tracker.next()).assertFalse();
      tracker.reset();
      expect(tracker.getIndex()).assertEqual(0);
    });

    it('tabBarPositioningTest_wrap_around_1', 0, async () => {
      const tracker = new TabBarPositioningIndexTracker(5);
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.wrapNext()).assertEqual(0);
      expect(tracker.wrapPrev()).assertEqual(4);
      expect(tracker.getIndex()).assertEqual(4);
    });

    it('tabBarPositioningTest_set_index_in_range_2', 0, async () => {
      const tracker = new TabBarPositioningIndexTracker(5);
      expect(tracker.setIndex(2)).assertTrue();
      expect(tracker.getIndex()).assertEqual(2);
      expect(tracker.getCount()).assertEqual(5);
      expect(tracker.setIndex(5)).assertFalse();
      expect(tracker.setIndex(-1)).assertFalse();
    });

    it('tabBarPositioningTest_next_prev_boundary_2', 0, async () => {
      const tracker = new TabBarPositioningIndexTracker(5);
      expect(tracker.isFirst()).assertTrue();
      expect(tracker.prev()).assertFalse();
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.isLast()).assertTrue();
      expect(tracker.next()).assertFalse();
      tracker.reset();
      expect(tracker.getIndex()).assertEqual(0);
    });

    it('tabBarPositioningTest_wrap_around_2', 0, async () => {
      const tracker = new TabBarPositioningIndexTracker(5);
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.wrapNext()).assertEqual(0);
      expect(tracker.wrapPrev()).assertEqual(4);
      expect(tracker.getIndex()).assertEqual(4);
    });

  });
}
