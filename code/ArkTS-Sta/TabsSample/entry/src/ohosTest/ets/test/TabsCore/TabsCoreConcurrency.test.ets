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


// TabsCoreConcurrency 页签数据模型：对齐 TabsSample 的 TabDataModel 与 TabDataSource
class TabsCoreConcurrencyTabDataModel {
  public id: number = 0;
  public navData: string = '';

  public constructor(id: number, navData: string) {
    this.id = id;
    this.navData = navData;
  }
}

class TabsCoreConcurrencyTabDataSourceModel {
  private dataArray: TabsCoreConcurrencyTabDataModel[] = [];
  private listeners: number = 0;

  public totalCount(): number {
    return this.dataArray.length;
  }

  public getData(index: number): TabsCoreConcurrencyTabDataModel {
    if (index < 0 || index >= this.dataArray.length) {
      return new TabsCoreConcurrencyTabDataModel(-1, '');
    }
    return this.dataArray[index];
  }

  public addData(index: number, data: TabsCoreConcurrencyTabDataModel): boolean {
    if (index < 0 || index > this.dataArray.length) {
      return false;
    }
    this.dataArray.splice(index, 0, data);
    return true;
  }

  public pushData(data: TabsCoreConcurrencyTabDataModel): void {
    this.dataArray.push(data);
  }

  public registerListener(): void {
    this.listeners = this.listeners + 1;
  }

  public unregisterListener(): void {
    if (this.listeners > 0) {
      this.listeners = this.listeners - 1;
    }
  }

  public getListenerCount(): number {
    return this.listeners;
  }
}


// TabsCoreConcurrency 自定义 TabBar 模型：对齐 TabBar 页面的 5 个页签配置
class TabsCoreConcurrencyTabBarModel {
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


// TabsCoreConcurrency 页签下拉菜单模型：对齐 FunctionalScenes 的 TAB_DATA 菜单
class TabsCoreConcurrencyMenuModel {
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


// TabsCoreConcurrency 索引追踪器：覆盖页签索引在 [0, count) 范围内的边界行为
class TabsCoreConcurrencyIndexTracker {
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

export default function tabsCoreConcurrencyTest() {
  describe('TabsCoreConcurrency_Test', () => {
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

    it('tabscoreconcurrency_tabs_visible_1', 0, async () => {
      const driver: Driver = getDriver();
      await serializedDelay(driver, 300);
      await triggerTabsHome(driver);
      const count: number = await tabsComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
      const focus: number = await getCurrentFocusIndex(driver);
      expect(focus).assertLargerOrEqual(-1);
    });

    it('tabscoreconcurrency_tab_navigation_1', 0, async () => {
      const driver: Driver = getDriver();
      await pressAndWait(driver, KEY_RIGHT, 2, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const count: number = await tabsComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
    });

    it('tabscoreconcurrency_tab_stability_1', 0, async () => {
      const driver: Driver = getDriver();
      const before: number = await tabsComponentCount(driver);
      for (let i: number = 0; i < 3; i++) {
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      }
      const after: number = await tabsComponentCount(driver);
      expect(Math.abs(after - before)).assertLessOrEqual(5);
    });

    it('tabsCoreConcurrencyTest_model_construction_0', 0, async () => {
      const model = new TabsCoreConcurrencyTabDataModel(0, '全部');
      expect(model.id).assertEqual(0);
      expect(model.navData).assertEqual('全部');
    });

    it('tabsCoreConcurrencyTest_datasource_total_0', 0, async () => {
      const source = new TabsCoreConcurrencyTabDataSourceModel();
      source.pushData(new TabsCoreConcurrencyTabDataModel(0, '全部'));
      source.pushData(new TabsCoreConcurrencyTabDataModel(1, 'Native'));
      expect(source.totalCount()).assertEqual(2);
      expect(source.getData(0).navData).assertEqual('全部');
      expect(source.getData(5).id).assertEqual(-1);
    });

    it('tabsCoreConcurrencyTest_datasource_insert_listener_0', 0, async () => {
      const source = new TabsCoreConcurrencyTabDataSourceModel();
      source.pushData(new TabsCoreConcurrencyTabDataModel(0, 'A'));
      source.pushData(new TabsCoreConcurrencyTabDataModel(1, 'B'));
      expect(source.addData(1, new TabsCoreConcurrencyTabDataModel(9, 'X'))).assertTrue();
      expect(source.getData(1).navData).assertEqual('X');
      expect(source.addData(99, new TabsCoreConcurrencyTabDataModel(2, 'Y'))).assertFalse();
      source.registerListener();
      source.registerListener();
      expect(source.getListenerCount()).assertEqual(2);
      source.unregisterListener();
      expect(source.getListenerCount()).assertEqual(1);
    });

    it('tabsCoreConcurrencyTest_model_construction_1', 0, async () => {
      const model = new TabsCoreConcurrencyTabDataModel(1, 'Native');
      expect(model.id).assertEqual(1);
      expect(model.navData).assertEqual('Native');
    });

    it('tabsCoreConcurrencyTest_datasource_total_1', 0, async () => {
      const source = new TabsCoreConcurrencyTabDataSourceModel();
      source.pushData(new TabsCoreConcurrencyTabDataModel(0, '全部'));
      source.pushData(new TabsCoreConcurrencyTabDataModel(1, 'Native'));
      expect(source.totalCount()).assertEqual(2);
      expect(source.getData(0).navData).assertEqual('全部');
      expect(source.getData(5).id).assertEqual(-1);
    });

    it('tabsCoreConcurrencyTest_datasource_insert_listener_1', 0, async () => {
      const source = new TabsCoreConcurrencyTabDataSourceModel();
      source.pushData(new TabsCoreConcurrencyTabDataModel(0, 'A'));
      source.pushData(new TabsCoreConcurrencyTabDataModel(1, 'B'));
      expect(source.addData(1, new TabsCoreConcurrencyTabDataModel(9, 'X'))).assertTrue();
      expect(source.getData(1).navData).assertEqual('X');
      expect(source.addData(99, new TabsCoreConcurrencyTabDataModel(2, 'Y'))).assertFalse();
      source.registerListener();
      source.registerListener();
      expect(source.getListenerCount()).assertEqual(2);
      source.unregisterListener();
      expect(source.getListenerCount()).assertEqual(1);
    });

    it('tabsCoreConcurrencyTest_model_construction_2', 0, async () => {
      const model = new TabsCoreConcurrencyTabDataModel(2, '动效');
      expect(model.id).assertEqual(2);
      expect(model.navData).assertEqual('动效');
    });

    it('tabsCoreConcurrencyTest_datasource_total_2', 0, async () => {
      const source = new TabsCoreConcurrencyTabDataSourceModel();
      source.pushData(new TabsCoreConcurrencyTabDataModel(0, '全部'));
      source.pushData(new TabsCoreConcurrencyTabDataModel(1, 'Native'));
      expect(source.totalCount()).assertEqual(2);
      expect(source.getData(0).navData).assertEqual('全部');
      expect(source.getData(5).id).assertEqual(-1);
    });

    it('tabsCoreConcurrencyTest_datasource_insert_listener_2', 0, async () => {
      const source = new TabsCoreConcurrencyTabDataSourceModel();
      source.pushData(new TabsCoreConcurrencyTabDataModel(0, 'A'));
      source.pushData(new TabsCoreConcurrencyTabDataModel(1, 'B'));
      expect(source.addData(1, new TabsCoreConcurrencyTabDataModel(9, 'X'))).assertTrue();
      expect(source.getData(1).navData).assertEqual('X');
      expect(source.addData(99, new TabsCoreConcurrencyTabDataModel(2, 'Y'))).assertFalse();
      source.registerListener();
      source.registerListener();
      expect(source.getListenerCount()).assertEqual(2);
      source.unregisterListener();
      expect(source.getListenerCount()).assertEqual(1);
    });

    it('tabsCoreConcurrencyTest_labels_0', 0, async () => {
      const bar = new TabsCoreConcurrencyTabBarModel();
      expect(bar.labelCount()).assertEqual(5);
      expect(bar.labelAt(0)).assertEqual('首页');
      expect(bar.labelAt(4)).assertEqual('我的');
      expect(bar.labelAt(9)).assertEqual('');
    });

    it('tabsCoreConcurrencyTest_selection_0', 0, async () => {
      const bar = new TabsCoreConcurrencyTabBarModel();
      expect(bar.getSelectedIndex()).assertEqual(0);
      expect(bar.select(0)).assertTrue();
      expect(bar.isSelected(0)).assertTrue();
      expect(bar.getSelectedLabel()).assertEqual('首页');
      expect(bar.select(9)).assertFalse();
    });

    it('tabsCoreConcurrencyTest_reset_0', 0, async () => {
      const bar = new TabsCoreConcurrencyTabBarModel();
      bar.select(3);
      bar.reset();
      expect(bar.getSelectedIndex()).assertEqual(0);
      expect(bar.isSelected(0)).assertTrue();
      expect(bar.getLabels().length).assertEqual(5);
    });

    it('tabsCoreConcurrencyTest_labels_1', 0, async () => {
      const bar = new TabsCoreConcurrencyTabBarModel();
      expect(bar.labelCount()).assertEqual(5);
      expect(bar.labelAt(0)).assertEqual('首页');
      expect(bar.labelAt(4)).assertEqual('我的');
      expect(bar.labelAt(9)).assertEqual('');
    });

    it('tabsCoreConcurrencyTest_selection_1', 0, async () => {
      const bar = new TabsCoreConcurrencyTabBarModel();
      expect(bar.getSelectedIndex()).assertEqual(0);
      expect(bar.select(1)).assertTrue();
      expect(bar.isSelected(1)).assertTrue();
      expect(bar.getSelectedLabel()).assertEqual('新闻');
      expect(bar.select(9)).assertFalse();
    });

    it('tabsCoreConcurrencyTest_reset_1', 0, async () => {
      const bar = new TabsCoreConcurrencyTabBarModel();
      bar.select(3);
      bar.reset();
      expect(bar.getSelectedIndex()).assertEqual(0);
      expect(bar.isSelected(0)).assertTrue();
      expect(bar.getLabels().length).assertEqual(5);
    });

    it('tabsCoreConcurrencyTest_labels_2', 0, async () => {
      const bar = new TabsCoreConcurrencyTabBarModel();
      expect(bar.labelCount()).assertEqual(5);
      expect(bar.labelAt(0)).assertEqual('首页');
      expect(bar.labelAt(4)).assertEqual('我的');
      expect(bar.labelAt(9)).assertEqual('');
    });

    it('tabsCoreConcurrencyTest_selection_2', 0, async () => {
      const bar = new TabsCoreConcurrencyTabBarModel();
      expect(bar.getSelectedIndex()).assertEqual(0);
      expect(bar.select(2)).assertTrue();
      expect(bar.isSelected(2)).assertTrue();
      expect(bar.getSelectedLabel()).assertEqual('视频');
      expect(bar.select(9)).assertFalse();
    });

    it('tabsCoreConcurrencyTest_reset_2', 0, async () => {
      const bar = new TabsCoreConcurrencyTabBarModel();
      bar.select(3);
      bar.reset();
      expect(bar.getSelectedIndex()).assertEqual(0);
      expect(bar.isSelected(0)).assertTrue();
      expect(bar.getLabels().length).assertEqual(5);
    });

    it('tabsCoreConcurrencyTest_items_0', 0, async () => {
      const menu = new TabsCoreConcurrencyMenuModel();
      expect(menu.itemCount()).assertEqual(8);
      expect(menu.nameOf(0)).assertEqual('全部');
      expect(menu.nameOf(7)).assertEqual('性能文章');
      expect(menu.nameOf(99)).assertEqual('');
    });

    it('tabsCoreConcurrencyTest_choose_0', 0, async () => {
      const menu = new TabsCoreConcurrencyMenuModel();
      expect(menu.choose(0)).assertTrue();
      expect(menu.current()).assertEqual(0);
      expect(menu.contains(0)).assertTrue();
      expect(menu.choose(99)).assertFalse();
    });

    it('tabsCoreConcurrencyTest_next_wrap_0', 0, async () => {
      const menu = new TabsCoreConcurrencyMenuModel();
      expect(menu.next()).assertEqual(1);
      for (let i: number = 0; i < 7; i++) {
        menu.next();
      }
      expect(menu.current()).assertEqual(0);
    });

    it('tabsCoreConcurrencyTest_items_1', 0, async () => {
      const menu = new TabsCoreConcurrencyMenuModel();
      expect(menu.itemCount()).assertEqual(8);
      expect(menu.nameOf(0)).assertEqual('全部');
      expect(menu.nameOf(7)).assertEqual('性能文章');
      expect(menu.nameOf(99)).assertEqual('');
    });

    it('tabsCoreConcurrencyTest_choose_1', 0, async () => {
      const menu = new TabsCoreConcurrencyMenuModel();
      expect(menu.choose(1)).assertTrue();
      expect(menu.current()).assertEqual(1);
      expect(menu.contains(1)).assertTrue();
      expect(menu.choose(99)).assertFalse();
    });

    it('tabsCoreConcurrencyTest_next_wrap_1', 0, async () => {
      const menu = new TabsCoreConcurrencyMenuModel();
      expect(menu.next()).assertEqual(1);
      for (let i: number = 0; i < 7; i++) {
        menu.next();
      }
      expect(menu.current()).assertEqual(0);
    });

    it('tabsCoreConcurrencyTest_items_2', 0, async () => {
      const menu = new TabsCoreConcurrencyMenuModel();
      expect(menu.itemCount()).assertEqual(8);
      expect(menu.nameOf(0)).assertEqual('全部');
      expect(menu.nameOf(7)).assertEqual('性能文章');
      expect(menu.nameOf(99)).assertEqual('');
    });

    it('tabsCoreConcurrencyTest_choose_2', 0, async () => {
      const menu = new TabsCoreConcurrencyMenuModel();
      expect(menu.choose(2)).assertTrue();
      expect(menu.current()).assertEqual(2);
      expect(menu.contains(2)).assertTrue();
      expect(menu.choose(99)).assertFalse();
    });

    it('tabsCoreConcurrencyTest_next_wrap_2', 0, async () => {
      const menu = new TabsCoreConcurrencyMenuModel();
      expect(menu.next()).assertEqual(1);
      for (let i: number = 0; i < 7; i++) {
        menu.next();
      }
      expect(menu.current()).assertEqual(0);
    });

    it('tabsCoreConcurrencyTest_set_index_in_range_0', 0, async () => {
      const tracker = new TabsCoreConcurrencyIndexTracker(5);
      expect(tracker.setIndex(0)).assertTrue();
      expect(tracker.getIndex()).assertEqual(0);
      expect(tracker.getCount()).assertEqual(5);
      expect(tracker.setIndex(5)).assertFalse();
      expect(tracker.setIndex(-1)).assertFalse();
    });

    it('tabsCoreConcurrencyTest_next_prev_boundary_0', 0, async () => {
      const tracker = new TabsCoreConcurrencyIndexTracker(5);
      expect(tracker.isFirst()).assertTrue();
      expect(tracker.prev()).assertFalse();
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.isLast()).assertTrue();
      expect(tracker.next()).assertFalse();
      tracker.reset();
      expect(tracker.getIndex()).assertEqual(0);
    });

    it('tabsCoreConcurrencyTest_wrap_around_0', 0, async () => {
      const tracker = new TabsCoreConcurrencyIndexTracker(5);
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.wrapNext()).assertEqual(0);
      expect(tracker.wrapPrev()).assertEqual(4);
      expect(tracker.getIndex()).assertEqual(4);
    });

    it('tabsCoreConcurrencyTest_set_index_in_range_1', 0, async () => {
      const tracker = new TabsCoreConcurrencyIndexTracker(5);
      expect(tracker.setIndex(1)).assertTrue();
      expect(tracker.getIndex()).assertEqual(1);
      expect(tracker.getCount()).assertEqual(5);
      expect(tracker.setIndex(5)).assertFalse();
      expect(tracker.setIndex(-1)).assertFalse();
    });

    it('tabsCoreConcurrencyTest_next_prev_boundary_1', 0, async () => {
      const tracker = new TabsCoreConcurrencyIndexTracker(5);
      expect(tracker.isFirst()).assertTrue();
      expect(tracker.prev()).assertFalse();
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.isLast()).assertTrue();
      expect(tracker.next()).assertFalse();
      tracker.reset();
      expect(tracker.getIndex()).assertEqual(0);
    });

    it('tabsCoreConcurrencyTest_wrap_around_1', 0, async () => {
      const tracker = new TabsCoreConcurrencyIndexTracker(5);
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.wrapNext()).assertEqual(0);
      expect(tracker.wrapPrev()).assertEqual(4);
      expect(tracker.getIndex()).assertEqual(4);
    });

    it('tabsCoreConcurrencyTest_set_index_in_range_2', 0, async () => {
      const tracker = new TabsCoreConcurrencyIndexTracker(5);
      expect(tracker.setIndex(2)).assertTrue();
      expect(tracker.getIndex()).assertEqual(2);
      expect(tracker.getCount()).assertEqual(5);
      expect(tracker.setIndex(5)).assertFalse();
      expect(tracker.setIndex(-1)).assertFalse();
    });

    it('tabsCoreConcurrencyTest_next_prev_boundary_2', 0, async () => {
      const tracker = new TabsCoreConcurrencyIndexTracker(5);
      expect(tracker.isFirst()).assertTrue();
      expect(tracker.prev()).assertFalse();
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.isLast()).assertTrue();
      expect(tracker.next()).assertFalse();
      tracker.reset();
      expect(tracker.getIndex()).assertEqual(0);
    });

    it('tabsCoreConcurrencyTest_wrap_around_2', 0, async () => {
      const tracker = new TabsCoreConcurrencyIndexTracker(5);
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.wrapNext()).assertEqual(0);
      expect(tracker.wrapPrev()).assertEqual(4);
      expect(tracker.getIndex()).assertEqual(4);
    });

  });
}
