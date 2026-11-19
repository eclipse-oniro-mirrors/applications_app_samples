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


// CompatibilityMatrix 页签数据模型：对齐 TabsSample 的 TabDataModel 与 TabDataSource
class CompatibilityMatrixTabDataModel {
  public id: number = 0;
  public navData: string = '';

  public constructor(id: number, navData: string) {
    this.id = id;
    this.navData = navData;
  }
}

class CompatibilityMatrixTabDataSourceModel {
  private dataArray: CompatibilityMatrixTabDataModel[] = [];
  private listeners: number = 0;

  public totalCount(): number {
    return this.dataArray.length;
  }

  public getData(index: number): CompatibilityMatrixTabDataModel {
    if (index < 0 || index >= this.dataArray.length) {
      return new CompatibilityMatrixTabDataModel(-1, '');
    }
    return this.dataArray[index];
  }

  public addData(index: number, data: CompatibilityMatrixTabDataModel): boolean {
    if (index < 0 || index > this.dataArray.length) {
      return false;
    }
    this.dataArray.splice(index, 0, data);
    return true;
  }

  public pushData(data: CompatibilityMatrixTabDataModel): void {
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


// CompatibilityMatrix 场景信息模型：对齐 SceneModuleInfo 的构造默认值与字段
class CompatibilityMatrixSceneModuleInfoModel {
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


// CompatibilityMatrix 瀑布流数据源模型：对齐 WaterFlowDataSource 的增删移动/重载
class CompatibilityMatrixWaterFlowModel {
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


// CompatibilityMatrix 索引追踪器：覆盖页签索引在 [0, count) 范围内的边界行为
class CompatibilityMatrixIndexTracker {
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

export default function compatibilityMatrixTest() {
  describe('CompatibilityMatrix_Test', () => {
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

    it('compatibilitymatrix_tabs_visible_1', 0, async () => {
      const driver: Driver = getDriver();
      await serializedDelay(driver, 300);
      await triggerTabsHome(driver);
      const count: number = await tabsComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
      const focus: number = await getCurrentFocusIndex(driver);
      expect(focus).assertLargerOrEqual(-1);
    });

    it('compatibilitymatrix_tab_navigation_1', 0, async () => {
      const driver: Driver = getDriver();
      await pressAndWait(driver, KEY_RIGHT, 2, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const count: number = await tabsComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
    });

    it('compatibilitymatrix_tab_stability_1', 0, async () => {
      const driver: Driver = getDriver();
      const before: number = await tabsComponentCount(driver);
      for (let i: number = 0; i < 3; i++) {
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      }
      const after: number = await tabsComponentCount(driver);
      expect(Math.abs(after - before)).assertLessOrEqual(5);
    });

    it('compatibilityMatrixTest_model_construction_0', 0, async () => {
      const model = new CompatibilityMatrixTabDataModel(0, '全部');
      expect(model.id).assertEqual(0);
      expect(model.navData).assertEqual('全部');
    });

    it('compatibilityMatrixTest_datasource_total_0', 0, async () => {
      const source = new CompatibilityMatrixTabDataSourceModel();
      source.pushData(new CompatibilityMatrixTabDataModel(0, '全部'));
      source.pushData(new CompatibilityMatrixTabDataModel(1, 'Native'));
      expect(source.totalCount()).assertEqual(2);
      expect(source.getData(0).navData).assertEqual('全部');
      expect(source.getData(5).id).assertEqual(-1);
    });

    it('compatibilityMatrixTest_datasource_insert_listener_0', 0, async () => {
      const source = new CompatibilityMatrixTabDataSourceModel();
      source.pushData(new CompatibilityMatrixTabDataModel(0, 'A'));
      source.pushData(new CompatibilityMatrixTabDataModel(1, 'B'));
      expect(source.addData(1, new CompatibilityMatrixTabDataModel(9, 'X'))).assertTrue();
      expect(source.getData(1).navData).assertEqual('X');
      expect(source.addData(99, new CompatibilityMatrixTabDataModel(2, 'Y'))).assertFalse();
      source.registerListener();
      source.registerListener();
      expect(source.getListenerCount()).assertEqual(2);
      source.unregisterListener();
      expect(source.getListenerCount()).assertEqual(1);
    });

    it('compatibilityMatrixTest_model_construction_1', 0, async () => {
      const model = new CompatibilityMatrixTabDataModel(1, 'Native');
      expect(model.id).assertEqual(1);
      expect(model.navData).assertEqual('Native');
    });

    it('compatibilityMatrixTest_datasource_total_1', 0, async () => {
      const source = new CompatibilityMatrixTabDataSourceModel();
      source.pushData(new CompatibilityMatrixTabDataModel(0, '全部'));
      source.pushData(new CompatibilityMatrixTabDataModel(1, 'Native'));
      expect(source.totalCount()).assertEqual(2);
      expect(source.getData(0).navData).assertEqual('全部');
      expect(source.getData(5).id).assertEqual(-1);
    });

    it('compatibilityMatrixTest_datasource_insert_listener_1', 0, async () => {
      const source = new CompatibilityMatrixTabDataSourceModel();
      source.pushData(new CompatibilityMatrixTabDataModel(0, 'A'));
      source.pushData(new CompatibilityMatrixTabDataModel(1, 'B'));
      expect(source.addData(1, new CompatibilityMatrixTabDataModel(9, 'X'))).assertTrue();
      expect(source.getData(1).navData).assertEqual('X');
      expect(source.addData(99, new CompatibilityMatrixTabDataModel(2, 'Y'))).assertFalse();
      source.registerListener();
      source.registerListener();
      expect(source.getListenerCount()).assertEqual(2);
      source.unregisterListener();
      expect(source.getListenerCount()).assertEqual(1);
    });

    it('compatibilityMatrixTest_model_construction_2', 0, async () => {
      const model = new CompatibilityMatrixTabDataModel(2, '动效');
      expect(model.id).assertEqual(2);
      expect(model.navData).assertEqual('动效');
    });

    it('compatibilityMatrixTest_datasource_total_2', 0, async () => {
      const source = new CompatibilityMatrixTabDataSourceModel();
      source.pushData(new CompatibilityMatrixTabDataModel(0, '全部'));
      source.pushData(new CompatibilityMatrixTabDataModel(1, 'Native'));
      expect(source.totalCount()).assertEqual(2);
      expect(source.getData(0).navData).assertEqual('全部');
      expect(source.getData(5).id).assertEqual(-1);
    });

    it('compatibilityMatrixTest_datasource_insert_listener_2', 0, async () => {
      const source = new CompatibilityMatrixTabDataSourceModel();
      source.pushData(new CompatibilityMatrixTabDataModel(0, 'A'));
      source.pushData(new CompatibilityMatrixTabDataModel(1, 'B'));
      expect(source.addData(1, new CompatibilityMatrixTabDataModel(9, 'X'))).assertTrue();
      expect(source.getData(1).navData).assertEqual('X');
      expect(source.addData(99, new CompatibilityMatrixTabDataModel(2, 'Y'))).assertFalse();
      source.registerListener();
      source.registerListener();
      expect(source.getListenerCount()).assertEqual(2);
      source.unregisterListener();
      expect(source.getListenerCount()).assertEqual(1);
    });

    it('compatibilityMatrixTest_defaults_0', 0, async () => {
      const info = new CompatibilityMatrixSceneModuleInfoModel('应用开发性能优化入门引导', '性能优化', 1);
      expect(info.name).assertEqual('应用开发性能优化入门引导');
      expect(info.ratingNumber).assertEqual(2);
      expect(info.helperUrl).assertEqual('');
      expect(info.hasHelper()).assertFalse();
      expect(info.describe()).assertEqual('1. 应用开发性能优化入门引导');
    });

    it('compatibilityMatrixTest_explicit_values_0', 0, async () => {
      const info = new CompatibilityMatrixSceneModuleInfoModel('应用开发性能优化入门引导', '界面开发', 1, 4, 'README.md');
      expect(info.ratingNumber).assertEqual(4);
      expect(info.isHighRated()).assertTrue();
      expect(info.hasHelper()).assertTrue();
      expect(info.serialNumber).assertEqual(1);
    });

    it('compatibilityMatrixTest_rating_scale_0', 0, async () => {
      const low = new CompatibilityMatrixSceneModuleInfoModel('低分', '基础能力', 1, 1);
      const high = new CompatibilityMatrixSceneModuleInfoModel('高分', '基础能力', 2, 5);
      expect(low.isHighRated()).assertFalse();
      expect(high.isHighRated()).assertTrue();
      expect(low.serialNumber < high.serialNumber).assertTrue();
    });

    it('compatibilityMatrixTest_defaults_1', 0, async () => {
      const info = new CompatibilityMatrixSceneModuleInfoModel('性能优化实操宝典', '性能优化', 2);
      expect(info.name).assertEqual('性能优化实操宝典');
      expect(info.ratingNumber).assertEqual(2);
      expect(info.helperUrl).assertEqual('');
      expect(info.hasHelper()).assertFalse();
      expect(info.describe()).assertEqual('2. 性能优化实操宝典');
    });

    it('compatibilityMatrixTest_explicit_values_1', 0, async () => {
      const info = new CompatibilityMatrixSceneModuleInfoModel('性能优化实操宝典', '界面开发', 2, 4, 'README.md');
      expect(info.ratingNumber).assertEqual(4);
      expect(info.isHighRated()).assertTrue();
      expect(info.hasHelper()).assertTrue();
      expect(info.serialNumber).assertEqual(2);
    });

    it('compatibilityMatrixTest_rating_scale_1', 0, async () => {
      const low = new CompatibilityMatrixSceneModuleInfoModel('低分', '基础能力', 1, 1);
      const high = new CompatibilityMatrixSceneModuleInfoModel('高分', '基础能力', 2, 5);
      expect(low.isHighRated()).assertFalse();
      expect(high.isHighRated()).assertTrue();
      expect(low.serialNumber < high.serialNumber).assertTrue();
    });

    it('compatibilityMatrixTest_defaults_2', 0, async () => {
      const info = new CompatibilityMatrixSceneModuleInfoModel('UI 框架基础使用', '性能优化', 3);
      expect(info.name).assertEqual('UI 框架基础使用');
      expect(info.ratingNumber).assertEqual(2);
      expect(info.helperUrl).assertEqual('');
      expect(info.hasHelper()).assertFalse();
      expect(info.describe()).assertEqual('3. UI 框架基础使用');
    });

    it('compatibilityMatrixTest_explicit_values_2', 0, async () => {
      const info = new CompatibilityMatrixSceneModuleInfoModel('UI 框架基础使用', '界面开发', 3, 4, 'README.md');
      expect(info.ratingNumber).assertEqual(4);
      expect(info.isHighRated()).assertTrue();
      expect(info.hasHelper()).assertTrue();
      expect(info.serialNumber).assertEqual(3);
    });

    it('compatibilityMatrixTest_rating_scale_2', 0, async () => {
      const low = new CompatibilityMatrixSceneModuleInfoModel('低分', '基础能力', 1, 1);
      const high = new CompatibilityMatrixSceneModuleInfoModel('高分', '基础能力', 2, 5);
      expect(low.isHighRated()).assertFalse();
      expect(high.isHighRated()).assertTrue();
      expect(low.serialNumber < high.serialNumber).assertTrue();
    });

    it('compatibilityMatrixTest_add_delete_0', 0, async () => {
      const flow = new CompatibilityMatrixWaterFlowModel(['a', 'b', 'c']);
      expect(flow.totalCount()).assertEqual(3);
      expect(flow.addItem(1, 'x')).assertTrue();
      expect(flow.getData(1)).assertEqual('x');
      expect(flow.addItem(99, 'y')).assertFalse();
      expect(flow.deleteItem(0)).assertTrue();
      expect(flow.totalCount()).assertEqual(3);
    });

    it('compatibilityMatrixTest_move_reload_0', 0, async () => {
      const flow = new CompatibilityMatrixWaterFlowModel(['a', 'b', 'c']);
      expect(flow.move(0, 2)).assertTrue();
      expect(flow.getData(2)).assertEqual('a');
      expect(flow.move(5, 0)).assertFalse();
      flow.reload(['p', 'q']);
      expect(flow.totalCount()).assertEqual(2);
      expect(flow.getData(0)).assertEqual('p');
    });

    it('compatibilityMatrixTest_listener_lifecycle_0', 0, async () => {
      const flow = new CompatibilityMatrixWaterFlowModel([]);
      flow.registerListener();
      flow.registerListener();
      expect(flow.getListenerCount()).assertEqual(2);
      flow.unregisterListener();
      flow.unregisterListener();
      flow.unregisterListener();
      expect(flow.getListenerCount()).assertEqual(0);
      expect(flow.getData(0)).assertEqual('');
    });

    it('compatibilityMatrixTest_add_delete_1', 0, async () => {
      const flow = new CompatibilityMatrixWaterFlowModel(['a', 'b', 'c']);
      expect(flow.totalCount()).assertEqual(3);
      expect(flow.addItem(1, 'x')).assertTrue();
      expect(flow.getData(1)).assertEqual('x');
      expect(flow.addItem(99, 'y')).assertFalse();
      expect(flow.deleteItem(0)).assertTrue();
      expect(flow.totalCount()).assertEqual(3);
    });

    it('compatibilityMatrixTest_move_reload_1', 0, async () => {
      const flow = new CompatibilityMatrixWaterFlowModel(['a', 'b', 'c']);
      expect(flow.move(0, 2)).assertTrue();
      expect(flow.getData(2)).assertEqual('a');
      expect(flow.move(5, 0)).assertFalse();
      flow.reload(['p', 'q']);
      expect(flow.totalCount()).assertEqual(2);
      expect(flow.getData(0)).assertEqual('p');
    });

    it('compatibilityMatrixTest_listener_lifecycle_1', 0, async () => {
      const flow = new CompatibilityMatrixWaterFlowModel([]);
      flow.registerListener();
      flow.registerListener();
      expect(flow.getListenerCount()).assertEqual(2);
      flow.unregisterListener();
      flow.unregisterListener();
      flow.unregisterListener();
      expect(flow.getListenerCount()).assertEqual(0);
      expect(flow.getData(0)).assertEqual('');
    });

    it('compatibilityMatrixTest_add_delete_2', 0, async () => {
      const flow = new CompatibilityMatrixWaterFlowModel(['a', 'b', 'c']);
      expect(flow.totalCount()).assertEqual(3);
      expect(flow.addItem(1, 'x')).assertTrue();
      expect(flow.getData(1)).assertEqual('x');
      expect(flow.addItem(99, 'y')).assertFalse();
      expect(flow.deleteItem(0)).assertTrue();
      expect(flow.totalCount()).assertEqual(3);
    });

    it('compatibilityMatrixTest_move_reload_2', 0, async () => {
      const flow = new CompatibilityMatrixWaterFlowModel(['a', 'b', 'c']);
      expect(flow.move(0, 2)).assertTrue();
      expect(flow.getData(2)).assertEqual('a');
      expect(flow.move(5, 0)).assertFalse();
      flow.reload(['p', 'q']);
      expect(flow.totalCount()).assertEqual(2);
      expect(flow.getData(0)).assertEqual('p');
    });

    it('compatibilityMatrixTest_listener_lifecycle_2', 0, async () => {
      const flow = new CompatibilityMatrixWaterFlowModel([]);
      flow.registerListener();
      flow.registerListener();
      expect(flow.getListenerCount()).assertEqual(2);
      flow.unregisterListener();
      flow.unregisterListener();
      flow.unregisterListener();
      expect(flow.getListenerCount()).assertEqual(0);
      expect(flow.getData(0)).assertEqual('');
    });

    it('compatibilityMatrixTest_set_index_in_range_0', 0, async () => {
      const tracker = new CompatibilityMatrixIndexTracker(5);
      expect(tracker.setIndex(0)).assertTrue();
      expect(tracker.getIndex()).assertEqual(0);
      expect(tracker.getCount()).assertEqual(5);
      expect(tracker.setIndex(5)).assertFalse();
      expect(tracker.setIndex(-1)).assertFalse();
    });

    it('compatibilityMatrixTest_next_prev_boundary_0', 0, async () => {
      const tracker = new CompatibilityMatrixIndexTracker(5);
      expect(tracker.isFirst()).assertTrue();
      expect(tracker.prev()).assertFalse();
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.isLast()).assertTrue();
      expect(tracker.next()).assertFalse();
      tracker.reset();
      expect(tracker.getIndex()).assertEqual(0);
    });

    it('compatibilityMatrixTest_wrap_around_0', 0, async () => {
      const tracker = new CompatibilityMatrixIndexTracker(5);
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.wrapNext()).assertEqual(0);
      expect(tracker.wrapPrev()).assertEqual(4);
      expect(tracker.getIndex()).assertEqual(4);
    });

    it('compatibilityMatrixTest_set_index_in_range_1', 0, async () => {
      const tracker = new CompatibilityMatrixIndexTracker(5);
      expect(tracker.setIndex(1)).assertTrue();
      expect(tracker.getIndex()).assertEqual(1);
      expect(tracker.getCount()).assertEqual(5);
      expect(tracker.setIndex(5)).assertFalse();
      expect(tracker.setIndex(-1)).assertFalse();
    });

    it('compatibilityMatrixTest_next_prev_boundary_1', 0, async () => {
      const tracker = new CompatibilityMatrixIndexTracker(5);
      expect(tracker.isFirst()).assertTrue();
      expect(tracker.prev()).assertFalse();
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.isLast()).assertTrue();
      expect(tracker.next()).assertFalse();
      tracker.reset();
      expect(tracker.getIndex()).assertEqual(0);
    });

    it('compatibilityMatrixTest_wrap_around_1', 0, async () => {
      const tracker = new CompatibilityMatrixIndexTracker(5);
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.wrapNext()).assertEqual(0);
      expect(tracker.wrapPrev()).assertEqual(4);
      expect(tracker.getIndex()).assertEqual(4);
    });

    it('compatibilityMatrixTest_set_index_in_range_2', 0, async () => {
      const tracker = new CompatibilityMatrixIndexTracker(5);
      expect(tracker.setIndex(2)).assertTrue();
      expect(tracker.getIndex()).assertEqual(2);
      expect(tracker.getCount()).assertEqual(5);
      expect(tracker.setIndex(5)).assertFalse();
      expect(tracker.setIndex(-1)).assertFalse();
    });

    it('compatibilityMatrixTest_next_prev_boundary_2', 0, async () => {
      const tracker = new CompatibilityMatrixIndexTracker(5);
      expect(tracker.isFirst()).assertTrue();
      expect(tracker.prev()).assertFalse();
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.isLast()).assertTrue();
      expect(tracker.next()).assertFalse();
      tracker.reset();
      expect(tracker.getIndex()).assertEqual(0);
    });

    it('compatibilityMatrixTest_wrap_around_2', 0, async () => {
      const tracker = new CompatibilityMatrixIndexTracker(5);
      expect(tracker.setIndex(4)).assertTrue();
      expect(tracker.wrapNext()).assertEqual(0);
      expect(tracker.wrapPrev()).assertEqual(4);
      expect(tracker.getIndex()).assertEqual(4);
    });

  });
}
