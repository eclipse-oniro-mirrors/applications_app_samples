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
import { abilityDelegatorRegistry, Driver, ON, Component, Rect } from '@kit.TestKit';
import { window } from '@kit.ArkUI';
import { UIAbility } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  SHOW_ID,
  BUTTON_IDS,
  getDriver,
  startApp,
  clickAndExpect,
  clickAndExpectLast,
  repeatClick
} from './StationaryUiSupport';

/**
 * Stationary 页面控件与文案映射矩阵（UiTest）
 *
 * 设备支持 stationary 时，按钮点击会把状态文本改为对应动作名；不支持时
 * 动作异常被页面捕获，文本保持原值。用例按环境自适应断言，从而在真实
 * 设备与模拟器上都能稳定验证控件存在、点击映射、重复点击幂等以及
 * “最后一次动作生效”的语义。
 */
const DOMAIN: number = 0xF812;
const TAG: string = 'Sample_Stationary';


function caseEnd(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
}

function caseBegin(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
}

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
      caseBegin('testStationaryUi0001');
      const driver: Driver = getDriver();
      expect(await driver.waitForComponent(ON.id(SHOW_ID), 4000) !== null).assertTrue();
      let found: number = 0;
      for (const id of BUTTON_IDS) {
        if (await driver.waitForComponent(ON.id(id), 3000) !== null) {
          found++;
        }
      }
      expect(found).assertEqual(BUTTON_IDS.length);
      caseEnd('testStationaryUi0001');
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
      caseBegin('testStationaryUi0002');
      const driver: Driver = getDriver();
      expect(await clickAndExpect(driver, 0)).assertTrue();
      caseEnd('testStationaryUi0002');
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
      caseBegin('testStationaryUi0003');
      const driver: Driver = getDriver();
      expect(await clickAndExpect(driver, 1)).assertTrue();
      caseEnd('testStationaryUi0003');
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
      caseBegin('testStationaryUi0004');
      const driver: Driver = getDriver();
      expect(await clickAndExpect(driver, 2)).assertTrue();
      caseEnd('testStationaryUi0004');
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
      caseBegin('testStationaryUi0005');
      const driver: Driver = getDriver();
      expect(await repeatClick(driver, 'button1', 2)).assertTrue();
      caseEnd('testStationaryUi0005');
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
      caseBegin('testStationaryUi0006');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button1', 'button2'])).assertTrue();
      caseEnd('testStationaryUi0006');
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
      caseBegin('testStationaryUi0007');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, ['button2', 'button3'])).assertTrue();
      caseEnd('testStationaryUi0007');
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
      caseBegin('testStationaryUi0008');
      const driver: Driver = getDriver();
      expect(await clickAndExpectLast(driver, BUTTON_IDS)).assertTrue();
      caseEnd('testStationaryUi0008');
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
      caseBegin('testStationaryUi0009');
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
      caseEnd('testStationaryUi0009');
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
      caseBegin('testStationaryUi0010');
      const driver: Driver = getDriver();
      for (let i = 0; i < BUTTON_IDS.length; i++) {
        expect(await clickAndExpect(driver, i)).assertTrue();
      }
      caseEnd('testStationaryUi0010');
    });

    /**
     * @tc.number SUB_STATIONARY_UI_1100
     * @tc.name testStationaryUi0011
     * @tc.desc Verify the three action buttons are stacked, equally wide and centered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testStationaryUi0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testStationaryUi0011');
      const driver: Driver = getDriver();
      const first: Component | null = await driver.waitForComponent(ON.id(BUTTON_IDS[0]), 4000);
      expect(first !== null).assertTrue();
      if (first === null) {
        return;
      }
      const base: Rect = await first.getBounds();
      const baseWidth: number = base.right - base.left;
      hilog.info(DOMAIN, TAG, 'base rect l=%{public}d t=%{public}d r=%{public}d b=%{public}d',
        base.left, base.top, base.right, base.bottom);
      let previousBottom: number = base.top;
      for (const id of BUTTON_IDS) {
        const current: Component | null = await driver.waitForComponent(ON.id(id), 4000);
        expect(current !== null).assertTrue();
        if (current === null) {
          continue;
        }
        const rect: Rect = await current.getBounds();
        const width: number = rect.right - rect.left;
        const widthDelta: number = Math.abs(width - baseWidth);
        hilog.info(DOMAIN, TAG, '%{public}s: l=%{public}d t=%{public}d w=%{public}d, dW=%{public}d',
          id, rect.left, rect.top, width, widthDelta);
        expect(width > 0).assertTrue();
        expect(widthDelta <= Math.max(4, Math.round(baseWidth * 0.05))).assertTrue();
        expect(rect.left <= base.left && base.right <= rect.right).assertTrue();
        expect(rect.top >= previousBottom).assertTrue();
        previousBottom = rect.top;
      }
      caseEnd('testStationaryUi0011');
    });

    /**
     * @tc.number SUB_STATIONARY_UI_1200
     * @tc.name testStationaryUi0012
     * @tc.desc Verify the status text sits above every action button
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testStationaryUi0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testStationaryUi0012');
      const driver: Driver = getDriver();
      const show: Component | null = await driver.waitForComponent(ON.id(SHOW_ID), 4000);
      expect(show !== null).assertTrue();
      if (show === null) {
        return;
      }
      const showRect: Rect = await show.getBounds();
      expect(showRect.bottom > showRect.top).assertTrue();
      for (const id of BUTTON_IDS) {
        const button: Component | null = await driver.waitForComponent(ON.id(id), 4000);
        expect(button !== null).assertTrue();
        if (button !== null) {
          const rect: Rect = await button.getBounds();
          expect(rect.top >= showRect.bottom).assertTrue();
        }
      }
      caseEnd('testStationaryUi0012');
    });

    /**
     * @tc.number SUB_STATIONARY_UI_1300
     * @tc.name testStationaryUi0013
     * @tc.desc Verify each action button takes about thirty percent of the window width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testStationaryUi0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testStationaryUi0013');
      const driver: Driver = getDriver();
      const button: Component | null = await driver.waitForComponent(ON.id(BUTTON_IDS[0]), 4000);
      expect(button !== null).assertTrue();
      if (button === null) {
        return;
      }
      let windowWidth: number = 0;
      try {
        const top: UIAbility = await abilityDelegatorRegistry.getAbilityDelegator().getCurrentTopAbility();
        const main: window.Window = await window.getLastWindow(top.context);
        windowWidth = main.getWindowProperties().windowRect.width;
      } catch (err) {
        hilog.error(DOMAIN, TAG, 'getLastWindow failed: %{public}s', (err as BusinessError).message);
      }
      expect(windowWidth > 0).assertTrue();
      if (windowWidth <= 0) {
        return;
      }
      const rect: Rect = await button.getBounds();
      const ratio: number = (rect.right - rect.left) / windowWidth;
      expect(ratio > 0.25 && ratio < 0.35).assertTrue();
      caseEnd('testStationaryUi0013');
    });

    /**
     * @tc.number SUB_STATIONARY_UI_1400
     * @tc.name testStationaryUi0014
     * @tc.desc Verify the status text block takes about twenty percent of the window height
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testStationaryUi0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      caseBegin('testStationaryUi0014');
      const driver: Driver = getDriver();
      const show: Component | null = await driver.waitForComponent(ON.id(SHOW_ID), 4000);
      expect(show !== null).assertTrue();
      if (show === null) {
        return;
      }
      let windowHeight: number = 0;
      try {
        const top: UIAbility = await abilityDelegatorRegistry.getAbilityDelegator().getCurrentTopAbility();
        const main: window.Window = await window.getLastWindow(top.context);
        windowHeight = main.getWindowProperties().windowRect.height;
      } catch (err) {
        hilog.error(DOMAIN, TAG, 'getLastWindow failed: %{public}s', (err as BusinessError).message);
      }
      expect(windowHeight > 0).assertTrue();
      if (windowHeight <= 0) {
        return;
      }
      const rect: Rect = await show.getBounds();
      const ratio: number = (rect.bottom - rect.top) / windowHeight;
      expect(ratio > 0.15 && ratio < 0.25).assertTrue();
      caseEnd('testStationaryUi0014');
    });
  });
}
