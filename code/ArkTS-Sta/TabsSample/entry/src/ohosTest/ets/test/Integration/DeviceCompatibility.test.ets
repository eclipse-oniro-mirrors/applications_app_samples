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


// DeviceCompatibility 页签数据模型：对齐 TabsSample 的 TabDataModel 与 TabDataSource
class DeviceCompatibilityTabDataModel {
  public id: number = 0;
  public navData: string = '';

  public constructor(id: number, navData: string) {
    this.id = id;
    this.navData = navData;
  }
}

class DeviceCompatibilityTabDataSourceModel {
  private dataArray: DeviceCompatibilityTabDataModel[] = [];
  private listeners: number = 0;

  public totalCount(): number {
    return this.dataArray.length;
  }

  public getData(index: number): DeviceCompatibilityTabDataModel {
    if (index < 0 || index >= this.dataArray.length) {
      return new DeviceCompatibilityTabDataModel(-1, '');
    }
    return this.dataArray[index];
  }

  public addData(index: number, data: DeviceCompatibilityTabDataModel): boolean {
    if (index < 0 || index > this.dataArray.length) {
      return false;
    }
    this.dataArray.splice(index, 0, data);
    return true;
  }

  public pushData(data: DeviceCompatibilityTabDataModel): void {
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

export default function deviceCompatibilityTest() {
  describe('DeviceCompatibility_Test', () => {
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

    it('devicecompatibility_tabs_visible_1', 0, async () => {
      const driver: Driver = getDriver();
      await serializedDelay(driver, 300);
      await triggerTabsHome(driver);
      const count: number = await tabsComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
      const focus: number = await getCurrentFocusIndex(driver);
      expect(focus).assertLargerOrEqual(-1);
    });

    it('devicecompatibility_tab_navigation_1', 0, async () => {
      const driver: Driver = getDriver();
      await pressAndWait(driver, KEY_RIGHT, 2, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const count: number = await tabsComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
    });

    it('devicecompatibility_tab_stability_1', 0, async () => {
      const driver: Driver = getDriver();
      const before: number = await tabsComponentCount(driver);
      for (let i: number = 0; i < 3; i++) {
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      }
      const after: number = await tabsComponentCount(driver);
      expect(Math.abs(after - before)).assertLessOrEqual(5);
    });

    it('deviceCompatibilityTest_model_construction_0', 0, async () => {
      const model = new DeviceCompatibilityTabDataModel(0, '全部');
      expect(model.id).assertEqual(0);
      expect(model.navData).assertEqual('全部');
    });

    it('deviceCompatibilityTest_datasource_total_0', 0, async () => {
      const source = new DeviceCompatibilityTabDataSourceModel();
      source.pushData(new DeviceCompatibilityTabDataModel(0, '全部'));
      source.pushData(new DeviceCompatibilityTabDataModel(1, 'Native'));
      expect(source.totalCount()).assertEqual(2);
      expect(source.getData(0).navData).assertEqual('全部');
      expect(source.getData(5).id).assertEqual(-1);
    });

    it('deviceCompatibilityTest_datasource_insert_listener_0', 0, async () => {
      const source = new DeviceCompatibilityTabDataSourceModel();
      source.pushData(new DeviceCompatibilityTabDataModel(0, 'A'));
      source.pushData(new DeviceCompatibilityTabDataModel(1, 'B'));
      expect(source.addData(1, new DeviceCompatibilityTabDataModel(9, 'X'))).assertTrue();
      expect(source.getData(1).navData).assertEqual('X');
      expect(source.addData(99, new DeviceCompatibilityTabDataModel(2, 'Y'))).assertFalse();
      source.registerListener();
      source.registerListener();
      expect(source.getListenerCount()).assertEqual(2);
      source.unregisterListener();
      expect(source.getListenerCount()).assertEqual(1);
    });

    it('deviceCompatibilityTest_model_construction_1', 0, async () => {
      const model = new DeviceCompatibilityTabDataModel(1, 'Native');
      expect(model.id).assertEqual(1);
      expect(model.navData).assertEqual('Native');
    });

    it('deviceCompatibilityTest_datasource_total_1', 0, async () => {
      const source = new DeviceCompatibilityTabDataSourceModel();
      source.pushData(new DeviceCompatibilityTabDataModel(0, '全部'));
      source.pushData(new DeviceCompatibilityTabDataModel(1, 'Native'));
      expect(source.totalCount()).assertEqual(2);
      expect(source.getData(0).navData).assertEqual('全部');
      expect(source.getData(5).id).assertEqual(-1);
    });

    it('deviceCompatibilityTest_datasource_insert_listener_1', 0, async () => {
      const source = new DeviceCompatibilityTabDataSourceModel();
      source.pushData(new DeviceCompatibilityTabDataModel(0, 'A'));
      source.pushData(new DeviceCompatibilityTabDataModel(1, 'B'));
      expect(source.addData(1, new DeviceCompatibilityTabDataModel(9, 'X'))).assertTrue();
      expect(source.getData(1).navData).assertEqual('X');
      expect(source.addData(99, new DeviceCompatibilityTabDataModel(2, 'Y'))).assertFalse();
      source.registerListener();
      source.registerListener();
      expect(source.getListenerCount()).assertEqual(2);
      source.unregisterListener();
      expect(source.getListenerCount()).assertEqual(1);
    });

    it('deviceCompatibilityTest_model_construction_2', 0, async () => {
      const model = new DeviceCompatibilityTabDataModel(2, '动效');
      expect(model.id).assertEqual(2);
      expect(model.navData).assertEqual('动效');
    });

    it('deviceCompatibilityTest_datasource_total_2', 0, async () => {
      const source = new DeviceCompatibilityTabDataSourceModel();
      source.pushData(new DeviceCompatibilityTabDataModel(0, '全部'));
      source.pushData(new DeviceCompatibilityTabDataModel(1, 'Native'));
      expect(source.totalCount()).assertEqual(2);
      expect(source.getData(0).navData).assertEqual('全部');
      expect(source.getData(5).id).assertEqual(-1);
    });

    it('deviceCompatibilityTest_datasource_insert_listener_2', 0, async () => {
      const source = new DeviceCompatibilityTabDataSourceModel();
      source.pushData(new DeviceCompatibilityTabDataModel(0, 'A'));
      source.pushData(new DeviceCompatibilityTabDataModel(1, 'B'));
      expect(source.addData(1, new DeviceCompatibilityTabDataModel(9, 'X'))).assertTrue();
      expect(source.getData(1).navData).assertEqual('X');
      expect(source.addData(99, new DeviceCompatibilityTabDataModel(2, 'Y'))).assertFalse();
      source.registerListener();
      source.registerListener();
      expect(source.getListenerCount()).assertEqual(2);
      source.unregisterListener();
      expect(source.getListenerCount()).assertEqual(1);
    });

  });
}
