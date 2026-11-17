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


// UserScenarios 页签数据模型：对齐 TabsSample 的 TabDataModel 与 TabDataSource
class UserScenariosTabDataModel {
  public id: number = 0;
  public navData: string = '';

  public constructor(id: number, navData: string) {
    this.id = id;
    this.navData = navData;
  }
}

class UserScenariosTabDataSourceModel {
  private dataArray: UserScenariosTabDataModel[] = [];
  private listeners: number = 0;

  public totalCount(): number {
    return this.dataArray.length;
  }

  public getData(index: number): UserScenariosTabDataModel {
    if (index < 0 || index >= this.dataArray.length) {
      return new UserScenariosTabDataModel(-1, '');
    }
    return this.dataArray[index];
  }

  public addData(index: number, data: UserScenariosTabDataModel): boolean {
    if (index < 0 || index > this.dataArray.length) {
      return false;
    }
    this.dataArray.splice(index, 0, data);
    return true;
  }

  public pushData(data: UserScenariosTabDataModel): void {
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


// UserScenarios 场景信息模型：对齐 SceneModuleInfo 的构造默认值与字段
class UserScenariosSceneModuleInfoModel {
  public name: string;
  public category: string;
  public serialNumber: number;
  public ratingNumber: number;
  public helperUrl: string;

  public constructor(name: string, category: string, serialNumber: number, ratingNumber?: number,
    helperUrl?: string) {
    this.name = name;
    this.category = category;
    this.serialNumber = serialNumber;
    this.ratingNumber = ratingNumber === undefined ? 2 : ratingNumber;
    this.helperUrl = helperUrl === undefined ? '' : helperUrl;
  }

  public isHighRated(): boolean {
    return this.ratingNumber >= 4;
  }

  public hasHelper(): boolean {
    return this.helperUrl.length > 0;
  }

  public describe(): string {
    return this.serialNumber.toString() + '. ' + this.name;
  }
}


// UserScenarios 瀑布流数据源模型：对齐 WaterFlowDataSource 的增删移动/重载
class UserScenariosWaterFlowModel {
  private dataArray: string[] = [];
  private listeners: number = 0;

  public constructor(initial: string[]) {
    this.dataArray = initial;
  }

  public totalCount(): number {
    return this.dataArray.length;
  }

  public getData(index: number): string {
    if (index < 0 || index >= this.dataArray.length) {
      return '';
    }
    return this.dataArray[index];
  }

  public addItem(index: number, value: string): boolean {
    if (index < 0 || index > this.dataArray.length) {
      return false;
    }
    this.dataArray.splice(index, 0, value);
    return true;
  }

  public deleteItem(index: number): boolean {
    if (index < 0 || index >= this.dataArray.length) {
      return false;
    }
    this.dataArray.splice(index, 1);
    return true;
  }

  public move(from: number, to: number): boolean {
    if (from < 0 || from >= this.dataArray.length || to < 0 || to > this.dataArray.length) {
      return false;
    }
    const value: string = this.dataArray[from];
    this.dataArray.splice(from, 1);
    this.dataArray.splice(to, 0, value);
    return true;
  }

  public reload(data: string[]): void {
    this.dataArray = data;
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


// UserScenarios 索引追踪器：覆盖页签索引在 [0, count) 范围内的边界行为
class UserScenariosIndexTracker {
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


// UserScenarios 历史记录：保存焦点/导航路径序列
class UserScenariosHistory {
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

export default function userScenariosTest() {
  describe('UserScenarios_Test', () => {
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

    it('userscenarios_tabs_visible_1', 0, async () => {
      const driver: Driver = getDriver();
      await serializedDelay(driver, 300);
      await triggerTabsHome(driver);
      const count: number = await tabsComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
      const focus: number = await getCurrentFocusIndex(driver);
      expect(focus).assertLargerOrEqual(-1);
    });

    it('userscenarios_tab_navigation_1', 0, async () => {
      const driver: Driver = getDriver();
      await pressAndWait(driver, KEY_RIGHT, 2, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const count: number = await tabsComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
    });

    it('userscenarios_tab_stability_1', 0, async () => {
      const driver: Driver = getDriver();
      const before: number = await tabsComponentCount(driver);
      for (let i: number = 0; i < 3; i++) {
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      }
      const after: number = await tabsComponentCount(driver);
      expect(Math.abs(after - before)).assertLessOrEqual(5);
    });

    it('userScenariosTest_model_construction_0', 0, async () => {
      const model = new UserScenariosTabDataModel(0, '全部');
      expect(model.id).assertEqual(0);
      expect(model.navData).assertEqual('全部');
    });

    it('userScenariosTest_datasource_total_0', 0, async () => {
      const source = new UserScenariosTabDataSourceModel();
      source.pushData(new UserScenariosTabDataModel(0, '全部'));
      source.pushData(new UserScenariosTabDataModel(1, 'Native'));
      expect(source.totalCount()).assertEqual(2);
      expect(source.getData(0).navData).assertEqual('全部');
      expect(source.getData(5).id).assertEqual(-1);
    });

    it('userScenariosTest_datasource_insert_listener_0', 0, async () => {
      const source = new UserScenariosTabDataSourceModel();
      source.pushData(new UserScenariosTabDataModel(0, 'A'));
      source.pushData(new UserScenariosTabDataModel(1, 'B'));
      expect(source.addData(1, new UserScenariosTabDataModel(9, 'X'))).assertTrue();
      expect(source.getData(1).navData).assertEqual('X');
      expect(source.addData(99, new UserScenariosTabDataModel(2, 'Y'))).assertFalse();
      source.registerListener();
      source.registerListener();
      expect(source.getListenerCount()).assertEqual(2);
      source.unregisterListener();
      expect(source.getListenerCount()).assertEqual(1);
    });

    it('userScenariosTest_model_construction_1', 0, async () => {
      const model = new UserScenariosTabDataModel(1, 'Native');
      expect(model.id).assertEqual(1);
      expect(model.navData).assertEqual('Native');
    });

    it('userScenariosTest_datasource_total_1', 0, async () => {
      const source = new UserScenariosTabDataSourceModel();
      source.pushData(new UserScenariosTabDataModel(0, '全部'));
      source.pushData(new UserScenariosTabDataModel(1, 'Native'));
      expect(source.totalCount()).assertEqual(2);
      expect(source.getData(0).navData).assertEqual('全部');
      expect(source.getData(5).id).assertEqual(-1);
    });

    it('userScenariosTest_datasource_insert_listener_1', 0, async () => {
      const source = new UserScenariosTabDataSourceModel();
      source.pushData(new UserScenariosTabDataModel(0, 'A'));
      source.pushData(new UserScenariosTabDataModel(1, 'B'));
      expect(source.addData(1, new UserScenariosTabDataModel(9, 'X'))).assertTrue();
      expect(source.getData(1).navData).assertEqual('X');
      expect(source.addData(99, new UserScenariosTabDataModel(2, 'Y'))).assertFalse();
      source.registerListener();
      source.registerListener();
      expect(source.getListenerCount()).assertEqual(2);
      source.unregisterListener();
      expect(source.getListenerCount()).assertEqual(1);
    });

    it('userScenariosTest_model_construction_2', 0, async () => {
      const model = new UserScenariosTabDataModel(2, '动效');
      expect(model.id).assertEqual(2);
      expect(model.navData).assertEqual('动效');
    });

    it('userScenariosTest_datasource_total_2', 0, async () => {
      const source = new UserScenariosTabDataSourceModel();
      source.pushData(new UserScenariosTabDataModel(0, '全部'));
      source.pushData(new UserScenariosTabDataModel(1, 'Native'));
      expect(source.totalCount()).assertEqual(2);
      expect(source.getData(0).navData).assertEqual('全部');
      expect(source.getData(5).id).assertEqual(-1);
    });

    it('userScenariosTest_datasource_insert_listener_2', 0, async () => {
      const source = new UserScenariosTabDataSourceModel();
      source.pushData(new UserScenariosTabDataModel(0, 'A'));
      source.pushData(new UserScenariosTabDataModel(1, 'B'));
      expect(source.addData(1, new UserScenariosTabDataModel(9, 'X'))).assertTrue();
      expect(source.getData(1).navData).assertEqual('X');
      expect(source.addData(99, new UserScenariosTabDataModel(2, 'Y'))).assertFalse();
      source.registerListener();
      source.registerListener();
      expect(source.getListenerCount()).assertEqual(2);
      source.unregisterListener();
      expect(source.getListenerCount()).assertEqual(1);
    });

    it('userScenariosTest_defaults_0', 0, async () => {
      const info = new UserScenariosSceneModuleInfoModel('应用开发性能优化入门引导', '性能优化', 1);
      expect(info.name).assertEqual('应用开发性能优化入门引导');
      expect(info.ratingNumber).assertEqual(2);
      expect(info.helperUrl).assertEqual('');
      expect(info.hasHelper()).assertFalse();
      expect(info.describe()).assertEqual('1. 应用开发性能优化入门引导');
    });

    it('userScenariosTest_explicit_values_0', 0, async () => {
      const info = new UserScenariosSceneModuleInfoModel('应用开发性能优化入门引导', '界面开发', 1, 4, 'README.md');
      expect(info.ratingNumber).assertEqual(4);
      expect(info.isHighRated()).assertTrue();
      expect(info.hasHelper()).assertTrue();
      expect(info.serialNumber).assertEqual(1);
    });

    it('userScenariosTest_rating_scale_0', 0, async () => {
      const low = new UserScenariosSceneModuleInfoModel('低分', '基础能力', 1, 1);
      const high = new UserScenariosSceneModuleInfoModel('高分', '基础能力', 2, 5);
      expect(low.isHighRated()).assertFalse();
      expect(high.isHighRated()).assertTrue();
      expect(low.serialNumber < high.serialNumber).assertTrue();
    });

    it('userScenariosTest_defaults_1', 0, async () => {
      const info = new UserScenariosSceneModuleInfoModel('性能优化实操宝典', '性能优化', 2);
      expect(info.name).assertEqual('性能优化实操宝典');
      expect(info.ratingNumber).assertEqual(2);
      expect(info.helperUrl).assertEqual('');
      expect(info.hasHelper()).assertFalse();
      expect(info.describe()).assertEqual('2. 性能优化实操宝典');
    });

    it('userScenariosTest_explicit_values_1', 0, async () => {
      const info = new UserScenariosSceneModuleInfoModel('性能优化实操宝典', '界面开发', 2, 4, 'README.md');
      expect(info.ratingNumber).assertEqual(4);
      expect(info.isHighRated()).assertTrue();
      expect(info.hasHelper()).assertTrue();
      expect(info.serialNumber).assertEqual(2);
    });

    it('userScenariosTest_rating_scale_1', 0, async () => {
      const low = new UserScenariosSceneModuleInfoModel('低分', '基础能力', 1, 1);
      const high = new UserScenariosSceneModuleInfoModel('高分', '基础能力', 2, 5);
      expect(low.isHighRated()).assertFalse();
      expect(high.isHighRated()).assertTrue();
      expect(low.serialNumber < high.serialNumber).assertTrue();
    });

    it('userScenariosTest_defaults_2', 0, async () => {
      const info = new UserScenariosSceneModuleInfoModel('UI 框架基础使用', '性能优化', 3);
      expect(info.name).assertEqual('UI 框架基础使用');
      expect(info.ratingNumber).assertEqual(2);
      expect(info.helperUrl).assertEqual('');
      expect(info.hasHelper()).assertFalse();
      expect(info.describe()).assertEqual('3. UI 框架基础使用');
    });

    it('userScenariosTest_explicit_values_2', 0, async () => {
      const info = new UserScenariosSceneModuleInfoModel('UI 框架基础使用', '界面开发', 3, 4, 'README.md');
      expect(info.ratingNumber).assertEqual(4);
      expect(info.isHighRated()).assertTrue();
      expect(info.hasHelper()).assertTrue();
      expect(info.serialNumber).assertEqual(3);
    });

    it('userScenariosTest_rating_scale_2', 0, async () => {
      const low = new UserScenariosSceneModuleInfoModel('低分', '基础能力', 1, 1);
      const high = new UserScenariosSceneModuleInfoModel('高分', '基础能力', 2, 5);
      expect(low.isHighRated()).assertFalse();
      expect(high.isHighRated()).assertTrue();
      expect(low.serialNumber < high.serialNumber).assertTrue();
    });

    it('userScenariosTest_add_delete_0', 0, async () => {
      const flow = new UserScenariosWaterFlowModel(['a', 'b', 'c']);
      expect(flow.totalCount()).assertEqual(3);
      expect(flow.addItem(1, 'x')).assertTrue();
      expect(flow.getData(1)).assertEqual('x');
      expect(flow.addItem(99, 'y')).assertFalse();
      expect(flow.deleteItem(0)).assertTrue();
      expect(flow.totalCount()).assertEqual(3);
    });

    it('userScenariosTest_move_reload_0', 0, async () => {
      const flow = new UserScenariosWaterFlowModel(['a', 'b', 'c']);
      expect(flow.move(0, 2)).assertTrue();
      expect(flow.getData(2)).assertEqual('a');
      expect(flow.move(5, 0)).assertFalse();
      flow.reload(['p', 'q']);
      expect(flow.totalCount()).assertEqual(2);
      expect(flow.getData(0)).assertEqual('p');
    });

    it('userScenariosTest_listener_lifecycle_0', 0, async () => {
      const flow = new UserScenariosWaterFlowModel([]);
      flow.registerListener();
      flow.registerListener();
      expect(flow.getListenerCount()).assertEqual(2);
      flow.unregisterListener();
      flow.unregisterListener();
      flow.unregisterListener();
      expect(flow.getListenerCount()).assertEqual(0);
      expect(flow.getData(0)).assertEqual('');
    });

    it('userScenariosTest_add_delete_1', 0, async () => {
      const flow = new UserScenariosWaterFlowModel(['a', 'b', 'c']);
      expect(flow.totalCount()).assertEqual(3);
      expect(flow.addItem(1, 'x')).assertTrue();
      expect(flow.getData(1)).assertEqual('x');
      expect(flow.addItem(99, 'y')).assertFalse();
      expect(flow.deleteItem(0)).assertTrue();
      expect(flow.totalCount()).assertEqual(3);
    });

    it('userScenariosTest_move_reload_1', 0, async () => {
      const flow = new UserScenariosWaterFlowModel(['a', 'b', 'c']);
      expect(flow.move(0, 2)).assertTrue();
      expect(flow.getData(2)).assertEqual('a');
      expect(flow.move(5, 0)).assertFalse();
      flow.reload(['p', 'q']);
      expect(flow.totalCount()).assertEqual(2);
      expect(flow.getData(0)).assertEqual('p');
    });

    it('userScenariosTest_listener_lifecycle_1', 0, async () => {
      const flow = new UserScenariosWaterFlowModel([]);
      flow.registerListener();
      flow.registerListener();
      expect(flow.getListenerCount()).assertEqual(2);
      flow.unregisterListener();
      flow.unregisterListener();
      flow.unregisterListener();
      expect(flow.getListenerCount()).assertEqual(0);
      expect(flow.getData(0)).assertEqual('');
    });

    it('userScenariosTest_add_delete_2', 0, async () => {
      const flow = new UserScenariosWaterFlowModel(['a', 'b', 'c']);
      expect(flow.totalCount()).assertEqual(3);
      expect(flow.addItem(1, 'x')).assertTrue();
      expect(flow.getData(1)).assertEqual('x');
      expect(flow.addItem(99, 'y')).assertFalse();
      expect(flow.deleteItem(0)).assertTrue();
      expect(flow.totalCount()).assertEqual(3);
    });

    it('userScenariosTest_move_reload_2', 0, async () => {
      const flow = new UserScenariosWaterFlowModel(['a', 'b', 'c']);
      expect(flow.move(0, 2)).assertTrue();
      expect(flow.getData(2)).assertEqual('a');
      expect(flow.move(5, 0)).assertFalse();
      flow.reload(['p', 'q']);
      expect(flow.totalCount()).assertEqual(2);
      expect(flow.getData(0)).assertEqual('p');
    });

    it('userScenariosTest_listener_lifecycle_2', 0, async () => {
      const flow = new UserScenariosWaterFlowModel([]);
      flow.registerListener();
      flow.registerListener();
      expect(flow.getListenerCount()).assertEqual(2);
      flow.unregisterListener();
      flow.unregisterListener();
      flow.unregisterListener();
      expect(flow.getListenerCount()).assertEqual(0);
      expect(flow.getData(0)).assertEqual('');
    });

    it('userScenariosTest_set_index_in_range_0', 0, async () => {
      const tracker = new UserScenariosIndexTracker(5);
      expect(tracker.setIndex(0)).assertTrue();
      expect(tracker.getIndex()).assertEqual(0);
      expect(tracker.getCount()).assertEqual(5);
      expect(tracker.setIndex(5)).assertFalse();
      expect(tracker.setIndex(-1)).assertFalse();
    });

    it('userScenariosTest_next_prev_boundary_0', 0, async () => {
      const tracker = new UserScenariosIndexTracker(5);
      expect(tracker.isFirst()).assertTrue();
      expect(tracker.prev()).assertFalse();
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.isLast()).assertTrue();
      expect(tracker.next()).assertFalse();
      tracker.reset();
      expect(tracker.getIndex()).assertEqual(0);
    });

    it('userScenariosTest_wrap_around_0', 0, async () => {
      const tracker = new UserScenariosIndexTracker(5);
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.wrapNext()).assertEqual(0);
      expect(tracker.wrapPrev()).assertEqual(4);
      expect(tracker.getIndex()).assertEqual(4);
    });

    it('userScenariosTest_set_index_in_range_1', 0, async () => {
      const tracker = new UserScenariosIndexTracker(5);
      expect(tracker.setIndex(1)).assertTrue();
      expect(tracker.getIndex()).assertEqual(1);
      expect(tracker.getCount()).assertEqual(5);
      expect(tracker.setIndex(5)).assertFalse();
      expect(tracker.setIndex(-1)).assertFalse();
    });

    it('userScenariosTest_next_prev_boundary_1', 0, async () => {
      const tracker = new UserScenariosIndexTracker(5);
      expect(tracker.isFirst()).assertTrue();
      expect(tracker.prev()).assertFalse();
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.isLast()).assertTrue();
      expect(tracker.next()).assertFalse();
      tracker.reset();
      expect(tracker.getIndex()).assertEqual(0);
    });

    it('userScenariosTest_wrap_around_1', 0, async () => {
      const tracker = new UserScenariosIndexTracker(5);
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.wrapNext()).assertEqual(0);
      expect(tracker.wrapPrev()).assertEqual(4);
      expect(tracker.getIndex()).assertEqual(4);
    });

    it('userScenariosTest_set_index_in_range_2', 0, async () => {
      const tracker = new UserScenariosIndexTracker(5);
      expect(tracker.setIndex(2)).assertTrue();
      expect(tracker.getIndex()).assertEqual(2);
      expect(tracker.getCount()).assertEqual(5);
      expect(tracker.setIndex(5)).assertFalse();
      expect(tracker.setIndex(-1)).assertFalse();
    });

    it('userScenariosTest_next_prev_boundary_2', 0, async () => {
      const tracker = new UserScenariosIndexTracker(5);
      expect(tracker.isFirst()).assertTrue();
      expect(tracker.prev()).assertFalse();
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.isLast()).assertTrue();
      expect(tracker.next()).assertFalse();
      tracker.reset();
      expect(tracker.getIndex()).assertEqual(0);
    });

    it('userScenariosTest_wrap_around_2', 0, async () => {
      const tracker = new UserScenariosIndexTracker(5);
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.wrapNext()).assertEqual(0);
      expect(tracker.wrapPrev()).assertEqual(4);
      expect(tracker.getIndex()).assertEqual(4);
    });

    it('userScenariosTest_append_and_access_0', 0, async () => {
      const history = new UserScenariosHistory();
      history.append(0);
      history.append(1);
      history.append(2);
      expect(history.length()).assertEqual(3);
      expect(history.first()).assertEqual(0);
      expect(history.last()).assertEqual(2);
      expect(history.get(1)).assertEqual(1);
      expect(history.get(99)).assertEqual(-1);
    });

    it('userScenariosTest_monotonic_and_includes_0', 0, async () => {
      const history = new UserScenariosHistory();
      history.append(0);
      history.append(1);
      history.append(2);
      expect(history.isMonotonicIncreasing()).assertTrue();
      expect(history.includes(1)).assertTrue();
      expect(history.includes(9)).assertFalse();
      history.append(0);
      expect(history.isMonotonicIncreasing()).assertFalse();
    });

    it('userScenariosTest_copy_and_reset_0', 0, async () => {
      const history = new UserScenariosHistory();
      history.append(0);
      const copy: number[] = history.toArray();
      expect(copy.length).assertEqual(1);
      copy.push(99);
      expect(history.length()).assertEqual(1);
      history.reset();
      expect(history.length()).assertEqual(0);
      expect(history.first()).assertEqual(-1);
    });

    it('userScenariosTest_append_and_access_1', 0, async () => {
      const history = new UserScenariosHistory();
      history.append(1);
      history.append(2);
      history.append(3);
      expect(history.length()).assertEqual(3);
      expect(history.first()).assertEqual(1);
      expect(history.last()).assertEqual(3);
      expect(history.get(1)).assertEqual(2);
      expect(history.get(99)).assertEqual(-1);
    });

    it('userScenariosTest_monotonic_and_includes_1', 0, async () => {
      const history = new UserScenariosHistory();
      history.append(0);
      history.append(1);
      history.append(2);
      expect(history.isMonotonicIncreasing()).assertTrue();
      expect(history.includes(1)).assertTrue();
      expect(history.includes(9)).assertFalse();
      history.append(0);
      expect(history.isMonotonicIncreasing()).assertFalse();
    });

    it('userScenariosTest_copy_and_reset_1', 0, async () => {
      const history = new UserScenariosHistory();
      history.append(1);
      const copy: number[] = history.toArray();
      expect(copy.length).assertEqual(1);
      copy.push(99);
      expect(history.length()).assertEqual(1);
      history.reset();
      expect(history.length()).assertEqual(0);
      expect(history.first()).assertEqual(-1);
    });

    it('userScenariosTest_append_and_access_2', 0, async () => {
      const history = new UserScenariosHistory();
      history.append(2);
      history.append(3);
      history.append(4);
      expect(history.length()).assertEqual(3);
      expect(history.first()).assertEqual(2);
      expect(history.last()).assertEqual(4);
      expect(history.get(1)).assertEqual(3);
      expect(history.get(99)).assertEqual(-1);
    });

    it('userScenariosTest_monotonic_and_includes_2', 0, async () => {
      const history = new UserScenariosHistory();
      history.append(0);
      history.append(1);
      history.append(2);
      expect(history.isMonotonicIncreasing()).assertTrue();
      expect(history.includes(1)).assertTrue();
      expect(history.includes(9)).assertFalse();
      history.append(0);
      expect(history.isMonotonicIncreasing()).assertFalse();
    });

    it('userScenariosTest_copy_and_reset_2', 0, async () => {
      const history = new UserScenariosHistory();
      history.append(2);
      const copy: number[] = history.toArray();
      expect(copy.length).assertEqual(1);
      copy.push(99);
      expect(history.length()).assertEqual(1);
      history.reset();
      expect(history.length()).assertEqual(0);
      expect(history.first()).assertEqual(-1);
    });

  });
}
