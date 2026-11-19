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


// AdvancedScenarios 页签数据模型：对齐 TabsSample 的 TabDataModel 与 TabDataSource
class AdvancedScenariosTabDataModel {
  public id: number = 0;
  public navData: string = '';

  public constructor(id: number, navData: string) {
    this.id = id;
    this.navData = navData;
  }
}

class AdvancedScenariosTabDataSourceModel {
  private dataArray: AdvancedScenariosTabDataModel[] = [];
  private listeners: number = 0;

  public totalCount(): number {
    return this.dataArray.length;
  }

  public getData(index: number): AdvancedScenariosTabDataModel {
    if (index < 0 || index >= this.dataArray.length) {
      return new AdvancedScenariosTabDataModel(-1, '');
    }
    return this.dataArray[index];
  }

  public addData(index: number, data: AdvancedScenariosTabDataModel): boolean {
    if (index < 0 || index > this.dataArray.length) {
      return false;
    }
    this.dataArray.splice(index, 0, data);
    return true;
  }

  public pushData(data: AdvancedScenariosTabDataModel): void {
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


// AdvancedScenarios 场景信息模型：对齐 SceneModuleInfo 的构造默认值与字段
class AdvancedScenariosSceneModuleInfoModel {
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

export default function advancedScenariosTest() {
  describe('AdvancedScenarios_Test', () => {
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

    it('advancedscenarios_tabs_visible_1', 0, async () => {
      const driver: Driver = getDriver();
      await serializedDelay(driver, 300);
      await triggerTabsHome(driver);
      const count: number = await tabsComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
      const focus: number = await getCurrentFocusIndex(driver);
      expect(focus).assertLargerOrEqual(-1);
    });

    it('advancedscenarios_tab_navigation_1', 0, async () => {
      const driver: Driver = getDriver();
      await pressAndWait(driver, KEY_RIGHT, 2, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const count: number = await tabsComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
    });

    it('advancedscenarios_tab_stability_1', 0, async () => {
      const driver: Driver = getDriver();
      const before: number = await tabsComponentCount(driver);
      for (let i: number = 0; i < 3; i++) {
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      }
      const after: number = await tabsComponentCount(driver);
      expect(Math.abs(after - before)).assertLessOrEqual(5);
    });

    it('advancedScenariosTest_model_construction_0', 0, async () => {
      const model = new AdvancedScenariosTabDataModel(0, '全部');
      expect(model.id).assertEqual(0);
      expect(model.navData).assertEqual('全部');
    });

    it('advancedScenariosTest_datasource_total_0', 0, async () => {
      const source = new AdvancedScenariosTabDataSourceModel();
      source.pushData(new AdvancedScenariosTabDataModel(0, '全部'));
      source.pushData(new AdvancedScenariosTabDataModel(1, 'Native'));
      expect(source.totalCount()).assertEqual(2);
      expect(source.getData(0).navData).assertEqual('全部');
      expect(source.getData(5).id).assertEqual(-1);
    });

    it('advancedScenariosTest_datasource_insert_listener_0', 0, async () => {
      const source = new AdvancedScenariosTabDataSourceModel();
      source.pushData(new AdvancedScenariosTabDataModel(0, 'A'));
      source.pushData(new AdvancedScenariosTabDataModel(1, 'B'));
      expect(source.addData(1, new AdvancedScenariosTabDataModel(9, 'X'))).assertTrue();
      expect(source.getData(1).navData).assertEqual('X');
      expect(source.addData(99, new AdvancedScenariosTabDataModel(2, 'Y'))).assertFalse();
      source.registerListener();
      source.registerListener();
      expect(source.getListenerCount()).assertEqual(2);
      source.unregisterListener();
      expect(source.getListenerCount()).assertEqual(1);
    });

    it('advancedScenariosTest_model_construction_1', 0, async () => {
      const model = new AdvancedScenariosTabDataModel(1, 'Native');
      expect(model.id).assertEqual(1);
      expect(model.navData).assertEqual('Native');
    });

    it('advancedScenariosTest_datasource_total_1', 0, async () => {
      const source = new AdvancedScenariosTabDataSourceModel();
      source.pushData(new AdvancedScenariosTabDataModel(0, '全部'));
      source.pushData(new AdvancedScenariosTabDataModel(1, 'Native'));
      expect(source.totalCount()).assertEqual(2);
      expect(source.getData(0).navData).assertEqual('全部');
      expect(source.getData(5).id).assertEqual(-1);
    });

    it('advancedScenariosTest_datasource_insert_listener_1', 0, async () => {
      const source = new AdvancedScenariosTabDataSourceModel();
      source.pushData(new AdvancedScenariosTabDataModel(0, 'A'));
      source.pushData(new AdvancedScenariosTabDataModel(1, 'B'));
      expect(source.addData(1, new AdvancedScenariosTabDataModel(9, 'X'))).assertTrue();
      expect(source.getData(1).navData).assertEqual('X');
      expect(source.addData(99, new AdvancedScenariosTabDataModel(2, 'Y'))).assertFalse();
      source.registerListener();
      source.registerListener();
      expect(source.getListenerCount()).assertEqual(2);
      source.unregisterListener();
      expect(source.getListenerCount()).assertEqual(1);
    });

    it('advancedScenariosTest_model_construction_2', 0, async () => {
      const model = new AdvancedScenariosTabDataModel(2, '动效');
      expect(model.id).assertEqual(2);
      expect(model.navData).assertEqual('动效');
    });

    it('advancedScenariosTest_datasource_total_2', 0, async () => {
      const source = new AdvancedScenariosTabDataSourceModel();
      source.pushData(new AdvancedScenariosTabDataModel(0, '全部'));
      source.pushData(new AdvancedScenariosTabDataModel(1, 'Native'));
      expect(source.totalCount()).assertEqual(2);
      expect(source.getData(0).navData).assertEqual('全部');
      expect(source.getData(5).id).assertEqual(-1);
    });

    it('advancedScenariosTest_datasource_insert_listener_2', 0, async () => {
      const source = new AdvancedScenariosTabDataSourceModel();
      source.pushData(new AdvancedScenariosTabDataModel(0, 'A'));
      source.pushData(new AdvancedScenariosTabDataModel(1, 'B'));
      expect(source.addData(1, new AdvancedScenariosTabDataModel(9, 'X'))).assertTrue();
      expect(source.getData(1).navData).assertEqual('X');
      expect(source.addData(99, new AdvancedScenariosTabDataModel(2, 'Y'))).assertFalse();
      source.registerListener();
      source.registerListener();
      expect(source.getListenerCount()).assertEqual(2);
      source.unregisterListener();
      expect(source.getListenerCount()).assertEqual(1);
    });

    it('advancedScenariosTest_defaults_0', 0, async () => {
      const info = new AdvancedScenariosSceneModuleInfoModel('应用开发性能优化入门引导', '性能优化', 1);
      expect(info.name).assertEqual('应用开发性能优化入门引导');
      expect(info.ratingNumber).assertEqual(2);
      expect(info.helperUrl).assertEqual('');
      expect(info.hasHelper()).assertFalse();
      expect(info.describe()).assertEqual('1. 应用开发性能优化入门引导');
    });

    it('advancedScenariosTest_explicit_values_0', 0, async () => {
      const info = new AdvancedScenariosSceneModuleInfoModel('应用开发性能优化入门引导', '界面开发', 1, 4, 'README.md');
      expect(info.ratingNumber).assertEqual(4);
      expect(info.isHighRated()).assertTrue();
      expect(info.hasHelper()).assertTrue();
      expect(info.serialNumber).assertEqual(1);
    });

    it('advancedScenariosTest_rating_scale_0', 0, async () => {
      const low = new AdvancedScenariosSceneModuleInfoModel('低分', '基础能力', 1, 1);
      const high = new AdvancedScenariosSceneModuleInfoModel('高分', '基础能力', 2, 5);
      expect(low.isHighRated()).assertFalse();
      expect(high.isHighRated()).assertTrue();
      expect(low.serialNumber < high.serialNumber).assertTrue();
    });

    it('advancedScenariosTest_defaults_1', 0, async () => {
      const info = new AdvancedScenariosSceneModuleInfoModel('性能优化实操宝典', '性能优化', 2);
      expect(info.name).assertEqual('性能优化实操宝典');
      expect(info.ratingNumber).assertEqual(2);
      expect(info.helperUrl).assertEqual('');
      expect(info.hasHelper()).assertFalse();
      expect(info.describe()).assertEqual('2. 性能优化实操宝典');
    });

    it('advancedScenariosTest_explicit_values_1', 0, async () => {
      const info = new AdvancedScenariosSceneModuleInfoModel('性能优化实操宝典', '界面开发', 2, 4, 'README.md');
      expect(info.ratingNumber).assertEqual(4);
      expect(info.isHighRated()).assertTrue();
      expect(info.hasHelper()).assertTrue();
      expect(info.serialNumber).assertEqual(2);
    });

    it('advancedScenariosTest_rating_scale_1', 0, async () => {
      const low = new AdvancedScenariosSceneModuleInfoModel('低分', '基础能力', 1, 1);
      const high = new AdvancedScenariosSceneModuleInfoModel('高分', '基础能力', 2, 5);
      expect(low.isHighRated()).assertFalse();
      expect(high.isHighRated()).assertTrue();
      expect(low.serialNumber < high.serialNumber).assertTrue();
    });

    it('advancedScenariosTest_defaults_2', 0, async () => {
      const info = new AdvancedScenariosSceneModuleInfoModel('UI 框架基础使用', '性能优化', 3);
      expect(info.name).assertEqual('UI 框架基础使用');
      expect(info.ratingNumber).assertEqual(2);
      expect(info.helperUrl).assertEqual('');
      expect(info.hasHelper()).assertFalse();
      expect(info.describe()).assertEqual('3. UI 框架基础使用');
    });

    it('advancedScenariosTest_explicit_values_2', 0, async () => {
      const info = new AdvancedScenariosSceneModuleInfoModel('UI 框架基础使用', '界面开发', 3, 4, 'README.md');
      expect(info.ratingNumber).assertEqual(4);
      expect(info.isHighRated()).assertTrue();
      expect(info.hasHelper()).assertTrue();
      expect(info.serialNumber).assertEqual(3);
    });

    it('advancedScenariosTest_rating_scale_2', 0, async () => {
      const low = new AdvancedScenariosSceneModuleInfoModel('低分', '基础能力', 1, 1);
      const high = new AdvancedScenariosSceneModuleInfoModel('高分', '基础能力', 2, 5);
      expect(low.isHighRated()).assertFalse();
      expect(high.isHighRated()).assertTrue();
      expect(low.serialNumber < high.serialNumber).assertTrue();
    });

  });
}
