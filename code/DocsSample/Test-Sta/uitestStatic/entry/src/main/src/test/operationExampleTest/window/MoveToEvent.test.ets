'use static';
/**
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

import { beforeAll, describe, expect, it, TestType } from "../../../../../hypium/index";
import { abilityDelegatorRegistry, DisplayRotation, Driver, Rect, UiWindow } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import { Utils, startAbility, stopApplication } from '../../Util.test';

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName: string = abilityDelegatorRegistry.getArguments().bundleName;
const TAG: string = 'MoveTo_Test';
const BUNDLE: string = 'MoveTo_';
const waitUiReadyMs: int = 1000;
export default function MoveToEventTest(): void {
  describe('MoveToEventTest', (): void => {
    beforeAll(async (): Promise<void> => {
      await startAbility(bundleName, 'EntryAbility');
      await Utils.msSleep(2000);
    })

    /**
     * @tc.number:MoveToEventTest_001
     * @tc.name: testWindowMoveTo
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 检测 window1.moveTo 功能
     */
    it('MoveTo_Test_001', TestType.FUNCTION, async (): Promise<void> => {
      hilog.info(0x0000, TAG, `${BUNDLE}Test_001 start`);
      let driver: Driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let window: UiWindow | null = await driver.findWindow({ bundleName: bundleName });
      try {
        await window!.resume();
        await driver.delayMs(waitUiReadyMs);
        let window1: UiWindow | null = await driver.findWindow({ bundleName: bundleName });
        let bounds1: Rect = await window1!.getBounds();
        await window1!.moveTo(100, 100);
        await driver.delayMs(waitUiReadyMs);
        let window2: UiWindow | null = await driver.findWindow({ bundleName: bundleName });
        let bounds2: Rect = await window2!.getBounds();
        expect(bounds1 != bounds2).assertTrue();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        if (error.message != 'this device can not support this action') {
          expect(false).assertTrue();
        }
      }
        hilog.info(0x0000, TAG, `${BUNDLE}Test_001 end`);
    })

    /**
     * @tc.number:MoveToEventTest_002
     * @tc.name: testDisplayRotation
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 获取、切换屏幕显示方向
     */
    it('testDisplayRotation', TestType.FUNCTION, async (): Promise<void> => {
      let driver: Driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      await driver.setDisplayRotation(DisplayRotation.ROTATION_0);
      await driver.delayMs(waitUiReadyMs);
      let rotation: DisplayRotation = await driver.getDisplayRotation();
      // 屏幕垂直显示
      if (rotation == DisplayRotation.ROTATION_90) {
        console.info('The device is displayed in horizontal on default');
        // 屏幕旋转90 degrees
        await driver.setDisplayRotation(DisplayRotation.ROTATION_90);
        await driver.delayMs(waitUiReadyMs);
        let rotation1: DisplayRotation = await driver.getDisplayRotation();
        // 屏幕水平位置
        expect(rotation1 == DisplayRotation.ROTATION_0);

        // 屏幕旋转180 degrees
        await driver.setDisplayRotation(DisplayRotation.ROTATION_180);
        await driver.delayMs(waitUiReadyMs);
        let rotation2: DisplayRotation = await driver.getDisplayRotation();
        expect(rotation2 == DisplayRotation.ROTATION_270);

        // 屏幕旋转270 degrees
        await driver.setDisplayRotation(DisplayRotation.ROTATION_270);
        await driver.delayMs(waitUiReadyMs);
        let rotation3: DisplayRotation = await driver.getDisplayRotation();
        expect(rotation3 == DisplayRotation.ROTATION_180);
        await driver.setDisplayRotation(DisplayRotation.ROTATION_90);

      } else if (rotation == DisplayRotation.ROTATION_0) { // 屏幕水平显示
        console.info('The device is displayed in vertical on default');
        // 屏幕旋转90 degrees
        await driver.setDisplayRotation(DisplayRotation.ROTATION_90);
        await driver.delayMs(waitUiReadyMs);
        let rotation1: DisplayRotation = await driver.getDisplayRotation();
        expect(rotation1 == DisplayRotation.ROTATION_90);

        await driver.setDisplayRotation(DisplayRotation.ROTATION_180);
        await driver.delayMs(waitUiReadyMs);
        let rotation2: DisplayRotation = await driver.getDisplayRotation();
        expect(rotation2 == DisplayRotation.ROTATION_180);

        await driver.setDisplayRotation(DisplayRotation.ROTATION_270);
        await driver.delayMs(waitUiReadyMs);
        let rotation3: DisplayRotation = await driver.getDisplayRotation();
        expect(rotation3 == DisplayRotation.ROTATION_270);
        await driver.setDisplayRotation(DisplayRotation.ROTATION_0);
      }
    })

    /**
     * @tc.number:MoveToEventTest_003
     * @tc.name: testWakeUpDisplay
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 唤醒屏幕
     */
    it('testWakeUpDisplay', 0, async (): Promise<void> => {
      let driver: Driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      await driver.wakeUpDisplay();
    })
  })
}
