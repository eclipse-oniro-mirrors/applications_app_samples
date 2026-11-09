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
import { describe, beforeAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Driver, ON } from '@kit.TestKit';
import {
  SHOW_ID,
  BUTTON_IDS,
  getDriver,
  startApp,
  clickAndExpect,
  clickAndExpectLast,
  repeatClick,
  readShowText
} from './StationaryUiSupport';

/**
 * Stationary 页面控件与文案映射矩阵（UiTest）
 *
 * 设备支持 stationary 时，按钮点击会把状态文本改为对应动作名；不支持时
 * 动作异常被页面捕获，文本保持原值。用例按环境自适应断言，从而在真实
 * 设备与模拟器上都能稳定验证控件存在、点击映射、重复点击幂等以及
 * “最后一次动作生效”的语义。
 */
export default function StationaryUiMatrixTest() {
  describe('StationaryUiMatrixTest', () => {
    beforeAll(async () => {
      await startApp();
    });

    /**
     * @tc.number SUB_STATIONARY_UI_0100
     * @tc.name testStationaryUi0001
     * @tc.desc Verify the page exposes the status text and all three action buttons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testStationaryUi0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const driver: Driver = getDriver();
      expect(await driver.waitForComponent(ON.id(SHOW_ID), 4000) !== null).assertTrue();
      let found: number = 0;
      for (const id of BUTTON_IDS) {
        if (await driver.waitForComponent(ON.id(id), 3000) !== null) {
          found++;
        }
      }
      expect(found).assertEqual(BUTTON_IDS.length);
    });

    /**
     * @tc.number SUB_STATIONARY_UI_0200
     * @tc.name testStationaryUi0002
     * @tc.desc Verify clicking subscribe updates the status text for the active device
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testStationaryUi0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpect(driver, 0)).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_UI_0300
     * @tc.name testStationaryUi0003
     * @tc.desc Verify clicking unsubscribe updates the status text for the active device
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testStationaryUi0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpect(driver, 1)).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_UI_0400
     * @tc.name testStationaryUi0004
     * @tc.desc Verify clicking the one-shot query updates the status text for the active device
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testStationaryUi0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpect(driver, 2)).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_UI_0500
     * @tc.name testStationaryUi0005
     * @tc.desc Verify clicking subscribe twice keeps the status text stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testStationaryUi0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await repeatClick(driver, 'button1', 2)).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_UI_0600
     * @tc.name testStationaryUi0006
     * @tc.desc Verify the last action wins after subscribe then unsubscribe
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testStationaryUi0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button1', 'button2'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_UI_0700
     * @tc.name testStationaryUi0007
     * @tc.desc Verify the last action wins after unsubscribe then one-shot query
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testStationaryUi0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button2', 'button3'])).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_UI_0800
     * @tc.name testStationaryUi0008
     * @tc.desc Verify a full button cycle ends on the one-shot query status text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testStationaryUi0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, BUTTON_IDS)).assertTrue();
    });

    /**
     * @tc.number SUB_STATIONARY_UI_0900
     * @tc.name testStationaryUi0009
     * @tc.desc Verify all action buttons remain present after repeated use
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testStationaryUi0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      expect(await clickAndExpect(driver, 0)).assertTrue();
      expect(await clickAndExpect(driver, 2)).assertTrue();
      let found: number = 0;
      for (const id of BUTTON_IDS) {
        if (await driver.findComponent(ON.id(id)) !== null) {
          found++;
        }
      }
      expect(found).assertEqual(BUTTON_IDS.length);
    });

    /**
     * @tc.number SUB_STATIONARY_UI_1000
     * @tc.name testStationaryUi0010
     * @tc.desc Verify the status text stays non-empty after every action
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testStationaryUi0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const driver: Driver = getDriver();
      for (let i = 0; i < BUTTON_IDS.length; i++) {
        expect(await clickAndExpect(driver, i)).assertTrue();
        expect((await readShowText(driver)).length > 0).assertTrue();
      }
    });
  });
}
