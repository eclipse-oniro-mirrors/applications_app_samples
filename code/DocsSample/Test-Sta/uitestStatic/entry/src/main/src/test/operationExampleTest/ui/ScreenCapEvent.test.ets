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

import { describe, expect, it, Level, Size, TestType } from "../../../../../hypium/index";
import { abilityDelegatorRegistry, Driver } from '@kit.TestKit';
import { BusinessError } from '@ohos.base';
import display from '@ohos.display';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Utils, startAbility, stopApplication } from '../../Util.test';

const delegator: AbilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName: string = abilityDelegatorRegistry.getArguments().bundleName;
const waitUiReadyMs: int = 1000;

export default function ScreenCapEventTest(): void {
  describe('ScreenCapEvent', (): void => {

    /**
     * @tc.number:ScreenCapEventTest_001
     * @tc.name: testScreenCap
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 检测uitest screenCap 功能
     */
    it('testScreenCap', TestType.FUNCTION, async (): Promise<void> => {
      let driver: Driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let savePath: string = '/data/storage/el2/base/cache/1.png';
      let success: boolean = await driver.screenCap(savePath);
      expect(success === true).assertTrue();
    })

    /**
     * @tc.number:ScreenCapEventTest_001
     * @tc.name: testScreenCap
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 检测uitest screenCapture 指定大小截图功能
     */
    it('testScreenCap_1', TestType.FUNCTION, async (): Promise<void> => {
      let driver: Driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let savePath: string = '/data/storage/el2/base/cache/2.png';
      let success: boolean = await driver.screenCapture(savePath, {
        left: 0,
        top: 0,
        right: 100,
        bottom: 100
      });
      expect(success === true).assertTrue();
    })

    /**
     * @tc.name: testScreenCapWithId
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 检测多屏下 uitest screenCapture 指定大小截图功能,
     */
    it('testScreenCapWithId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let driver: Driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let disPlay = display.getDefaultDisplaySync();
      await driver.delayMs(waitUiReadyMs);
      let savePath: string = '/data/storage/el2/base/cache/1.png';
      let success: boolean = await driver.screenCap(savePath, disPlay.id.toInt());
      expect(success == true).assertTrue();
    })
  })
}
