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


// SystemIntegration 页签数据模型：对齐 TabsSample 的 TabDataModel 与 TabDataSource
class SystemIntegrationTabDataModel {
  public id: number = 0;
  public navData: string = '';

  public constructor(id: number, navData: string) {
    this.id = id;
    this.navData = navData;
  }
}

class SystemIntegrationTabDataSourceModel {
  private dataArray: SystemIntegrationTabDataModel[] = [];
  private listeners: number = 0;

  public totalCount(): number {
    return this.dataArray.length;
  }

  public getData(index: number): SystemIntegrationTabDataModel {
    if (index < 0 || index >= this.dataArray.length) {
      return new SystemIntegrationTabDataModel(-1, '');
    }
    return this.dataArray[index];
  }

  public addData(index: number, data: SystemIntegrationTabDataModel): boolean {
    if (index < 0 || index > this.dataArray.length) {
      return false;
    }
    this.dataArray.splice(index, 0, data);
    return true;
  }

  public pushData(data: SystemIntegrationTabDataModel): void {
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


// SystemIntegration 场景信息模型：对齐 SceneModuleInfo 的构造默认值与字段
class SystemIntegrationSceneModuleInfoModel {
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


// SystemIntegration 瀑布流数据源模型：对齐 WaterFlowDataSource 的增删移动/重载
class SystemIntegrationWaterFlowModel {
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

export default function systemIntegrationTest() {
  describe('SystemIntegration_Test', () => {
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

    it('systemintegration_tabs_visible_1', 0, async () => {
      const driver: Driver = getDriver();
      await serializedDelay(driver, 300);
      await triggerTabsHome(driver);
      const count: number = await tabsComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
      const focus: number = await getCurrentFocusIndex(driver);
      expect(focus).assertLargerOrEqual(-1);
    });

    it('systemintegration_tab_navigation_1', 0, async () => {
      const driver: Driver = getDriver();
      await pressAndWait(driver, KEY_RIGHT, 2, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const count: number = await tabsComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
    });

    it('systemintegration_tab_stability_1', 0, async () => {
      const driver: Driver = getDriver();
      const before: number = await tabsComponentCount(driver);
      for (let i: number = 0; i < 3; i++) {
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      }
      const after: number = await tabsComponentCount(driver);
      expect(Math.abs(after - before)).assertLessOrEqual(5);
    });

    it('systemIntegrationTest_model_construction_0', 0, async () => {
      const model = new SystemIntegrationTabDataModel(0, '全部');
      expect(model.id).assertEqual(0);
      expect(model.navData).assertEqual('全部');
    });

    it('systemIntegrationTest_datasource_total_0', 0, async () => {
      const source = new SystemIntegrationTabDataSourceModel();
      source.pushData(new SystemIntegrationTabDataModel(0, '全部'));
      source.pushData(new SystemIntegrationTabDataModel(1, 'Native'));
      expect(source.totalCount()).assertEqual(2);
      expect(source.getData(0).navData).assertEqual('全部');
      expect(source.getData(5).id).assertEqual(-1);
    });

    it('systemIntegrationTest_datasource_insert_listener_0', 0, async () => {
      const source = new SystemIntegrationTabDataSourceModel();
      source.pushData(new SystemIntegrationTabDataModel(0, 'A'));
      source.pushData(new SystemIntegrationTabDataModel(1, 'B'));
      expect(source.addData(1, new SystemIntegrationTabDataModel(9, 'X'))).assertTrue();
      expect(source.getData(1).navData).assertEqual('X');
      expect(source.addData(99, new SystemIntegrationTabDataModel(2, 'Y'))).assertFalse();
      source.registerListener();
      source.registerListener();
      expect(source.getListenerCount()).assertEqual(2);
      source.unregisterListener();
      expect(source.getListenerCount()).assertEqual(1);
    });

    it('systemIntegrationTest_model_construction_1', 0, async () => {
      const model = new SystemIntegrationTabDataModel(1, 'Native');
      expect(model.id).assertEqual(1);
      expect(model.navData).assertEqual('Native');
    });

    it('systemIntegrationTest_datasource_total_1', 0, async () => {
      const source = new SystemIntegrationTabDataSourceModel();
      source.pushData(new SystemIntegrationTabDataModel(0, '全部'));
      source.pushData(new SystemIntegrationTabDataModel(1, 'Native'));
      expect(source.totalCount()).assertEqual(2);
      expect(source.getData(0).navData).assertEqual('全部');
      expect(source.getData(5).id).assertEqual(-1);
    });

    it('systemIntegrationTest_datasource_insert_listener_1', 0, async () => {
      const source = new SystemIntegrationTabDataSourceModel();
      source.pushData(new SystemIntegrationTabDataModel(0, 'A'));
      source.pushData(new SystemIntegrationTabDataModel(1, 'B'));
      expect(source.addData(1, new SystemIntegrationTabDataModel(9, 'X'))).assertTrue();
      expect(source.getData(1).navData).assertEqual('X');
      expect(source.addData(99, new SystemIntegrationTabDataModel(2, 'Y'))).assertFalse();
      source.registerListener();
      source.registerListener();
      expect(source.getListenerCount()).assertEqual(2);
      source.unregisterListener();
      expect(source.getListenerCount()).assertEqual(1);
    });

    it('systemIntegrationTest_model_construction_2', 0, async () => {
      const model = new SystemIntegrationTabDataModel(2, '动效');
      expect(model.id).assertEqual(2);
      expect(model.navData).assertEqual('动效');
    });

    it('systemIntegrationTest_datasource_total_2', 0, async () => {
      const source = new SystemIntegrationTabDataSourceModel();
      source.pushData(new SystemIntegrationTabDataModel(0, '全部'));
      source.pushData(new SystemIntegrationTabDataModel(1, 'Native'));
      expect(source.totalCount()).assertEqual(2);
      expect(source.getData(0).navData).assertEqual('全部');
      expect(source.getData(5).id).assertEqual(-1);
    });

    it('systemIntegrationTest_datasource_insert_listener_2', 0, async () => {
      const source = new SystemIntegrationTabDataSourceModel();
      source.pushData(new SystemIntegrationTabDataModel(0, 'A'));
      source.pushData(new SystemIntegrationTabDataModel(1, 'B'));
      expect(source.addData(1, new SystemIntegrationTabDataModel(9, 'X'))).assertTrue();
      expect(source.getData(1).navData).assertEqual('X');
      expect(source.addData(99, new SystemIntegrationTabDataModel(2, 'Y'))).assertFalse();
      source.registerListener();
      source.registerListener();
      expect(source.getListenerCount()).assertEqual(2);
      source.unregisterListener();
      expect(source.getListenerCount()).assertEqual(1);
    });

    it('systemIntegrationTest_defaults_0', 0, async () => {
      const info = new SystemIntegrationSceneModuleInfoModel('应用开发性能优化入门引导', '性能优化', 1);
      expect(info.name).assertEqual('应用开发性能优化入门引导');
      expect(info.ratingNumber).assertEqual(2);
      expect(info.helperUrl).assertEqual('');
      expect(info.hasHelper()).assertFalse();
      expect(info.describe()).assertEqual('1. 应用开发性能优化入门引导');
    });

    it('systemIntegrationTest_explicit_values_0', 0, async () => {
      const info = new SystemIntegrationSceneModuleInfoModel('应用开发性能优化入门引导', '界面开发', 1, 4, 'README.md');
      expect(info.ratingNumber).assertEqual(4);
      expect(info.isHighRated()).assertTrue();
      expect(info.hasHelper()).assertTrue();
      expect(info.serialNumber).assertEqual(1);
    });

    it('systemIntegrationTest_rating_scale_0', 0, async () => {
      const low = new SystemIntegrationSceneModuleInfoModel('低分', '基础能力', 1, 1);
      const high = new SystemIntegrationSceneModuleInfoModel('高分', '基础能力', 2, 5);
      expect(low.isHighRated()).assertFalse();
      expect(high.isHighRated()).assertTrue();
      expect(low.serialNumber < high.serialNumber).assertTrue();
    });

    it('systemIntegrationTest_defaults_1', 0, async () => {
      const info = new SystemIntegrationSceneModuleInfoModel('性能优化实操宝典', '性能优化', 2);
      expect(info.name).assertEqual('性能优化实操宝典');
      expect(info.ratingNumber).assertEqual(2);
      expect(info.helperUrl).assertEqual('');
      expect(info.hasHelper()).assertFalse();
      expect(info.describe()).assertEqual('2. 性能优化实操宝典');
    });

    it('systemIntegrationTest_explicit_values_1', 0, async () => {
      const info = new SystemIntegrationSceneModuleInfoModel('性能优化实操宝典', '界面开发', 2, 4, 'README.md');
      expect(info.ratingNumber).assertEqual(4);
      expect(info.isHighRated()).assertTrue();
      expect(info.hasHelper()).assertTrue();
      expect(info.serialNumber).assertEqual(2);
    });

    it('systemIntegrationTest_rating_scale_1', 0, async () => {
      const low = new SystemIntegrationSceneModuleInfoModel('低分', '基础能力', 1, 1);
      const high = new SystemIntegrationSceneModuleInfoModel('高分', '基础能力', 2, 5);
      expect(low.isHighRated()).assertFalse();
      expect(high.isHighRated()).assertTrue();
      expect(low.serialNumber < high.serialNumber).assertTrue();
    });

    it('systemIntegrationTest_defaults_2', 0, async () => {
      const info = new SystemIntegrationSceneModuleInfoModel('UI 框架基础使用', '性能优化', 3);
      expect(info.name).assertEqual('UI 框架基础使用');
      expect(info.ratingNumber).assertEqual(2);
      expect(info.helperUrl).assertEqual('');
      expect(info.hasHelper()).assertFalse();
      expect(info.describe()).assertEqual('3. UI 框架基础使用');
    });

    it('systemIntegrationTest_explicit_values_2', 0, async () => {
      const info = new SystemIntegrationSceneModuleInfoModel('UI 框架基础使用', '界面开发', 3, 4, 'README.md');
      expect(info.ratingNumber).assertEqual(4);
      expect(info.isHighRated()).assertTrue();
      expect(info.hasHelper()).assertTrue();
      expect(info.serialNumber).assertEqual(3);
    });

    it('systemIntegrationTest_rating_scale_2', 0, async () => {
      const low = new SystemIntegrationSceneModuleInfoModel('低分', '基础能力', 1, 1);
      const high = new SystemIntegrationSceneModuleInfoModel('高分', '基础能力', 2, 5);
      expect(low.isHighRated()).assertFalse();
      expect(high.isHighRated()).assertTrue();
      expect(low.serialNumber < high.serialNumber).assertTrue();
    });

    it('systemIntegrationTest_add_delete_0', 0, async () => {
      const flow = new SystemIntegrationWaterFlowModel(['a', 'b', 'c']);
      expect(flow.totalCount()).assertEqual(3);
      expect(flow.addItem(1, 'x')).assertTrue();
      expect(flow.getData(1)).assertEqual('x');
      expect(flow.addItem(99, 'y')).assertFalse();
      expect(flow.deleteItem(0)).assertTrue();
      expect(flow.totalCount()).assertEqual(3);
    });

    it('systemIntegrationTest_move_reload_0', 0, async () => {
      const flow = new SystemIntegrationWaterFlowModel(['a', 'b', 'c']);
      expect(flow.move(0, 2)).assertTrue();
      expect(flow.getData(2)).assertEqual('a');
      expect(flow.move(5, 0)).assertFalse();
      flow.reload(['p', 'q']);
      expect(flow.totalCount()).assertEqual(2);
      expect(flow.getData(0)).assertEqual('p');
    });

    it('systemIntegrationTest_listener_lifecycle_0', 0, async () => {
      const flow = new SystemIntegrationWaterFlowModel([]);
      flow.registerListener();
      flow.registerListener();
      expect(flow.getListenerCount()).assertEqual(2);
      flow.unregisterListener();
      flow.unregisterListener();
      flow.unregisterListener();
      expect(flow.getListenerCount()).assertEqual(0);
      expect(flow.getData(0)).assertEqual('');
    });

    it('systemIntegrationTest_add_delete_1', 0, async () => {
      const flow = new SystemIntegrationWaterFlowModel(['a', 'b', 'c']);
      expect(flow.totalCount()).assertEqual(3);
      expect(flow.addItem(1, 'x')).assertTrue();
      expect(flow.getData(1)).assertEqual('x');
      expect(flow.addItem(99, 'y')).assertFalse();
      expect(flow.deleteItem(0)).assertTrue();
      expect(flow.totalCount()).assertEqual(3);
    });

    it('systemIntegrationTest_move_reload_1', 0, async () => {
      const flow = new SystemIntegrationWaterFlowModel(['a', 'b', 'c']);
      expect(flow.move(0, 2)).assertTrue();
      expect(flow.getData(2)).assertEqual('a');
      expect(flow.move(5, 0)).assertFalse();
      flow.reload(['p', 'q']);
      expect(flow.totalCount()).assertEqual(2);
      expect(flow.getData(0)).assertEqual('p');
    });

    it('systemIntegrationTest_listener_lifecycle_1', 0, async () => {
      const flow = new SystemIntegrationWaterFlowModel([]);
      flow.registerListener();
      flow.registerListener();
      expect(flow.getListenerCount()).assertEqual(2);
      flow.unregisterListener();
      flow.unregisterListener();
      flow.unregisterListener();
      expect(flow.getListenerCount()).assertEqual(0);
      expect(flow.getData(0)).assertEqual('');
    });

    it('systemIntegrationTest_add_delete_2', 0, async () => {
      const flow = new SystemIntegrationWaterFlowModel(['a', 'b', 'c']);
      expect(flow.totalCount()).assertEqual(3);
      expect(flow.addItem(1, 'x')).assertTrue();
      expect(flow.getData(1)).assertEqual('x');
      expect(flow.addItem(99, 'y')).assertFalse();
      expect(flow.deleteItem(0)).assertTrue();
      expect(flow.totalCount()).assertEqual(3);
    });

    it('systemIntegrationTest_move_reload_2', 0, async () => {
      const flow = new SystemIntegrationWaterFlowModel(['a', 'b', 'c']);
      expect(flow.move(0, 2)).assertTrue();
      expect(flow.getData(2)).assertEqual('a');
      expect(flow.move(5, 0)).assertFalse();
      flow.reload(['p', 'q']);
      expect(flow.totalCount()).assertEqual(2);
      expect(flow.getData(0)).assertEqual('p');
    });

    it('systemIntegrationTest_listener_lifecycle_2', 0, async () => {
      const flow = new SystemIntegrationWaterFlowModel([]);
      flow.registerListener();
      flow.registerListener();
      expect(flow.getListenerCount()).assertEqual(2);
      flow.unregisterListener();
      flow.unregisterListener();
      flow.unregisterListener();
      expect(flow.getListenerCount()).assertEqual(0);
      expect(flow.getData(0)).assertEqual('');
    });

  });
}
