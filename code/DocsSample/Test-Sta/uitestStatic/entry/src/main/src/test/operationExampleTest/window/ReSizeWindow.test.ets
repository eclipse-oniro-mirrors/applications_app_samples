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
import { abilityDelegatorRegistry, Driver, Rect, ResizeDirection, UiWindow, WindowMode } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import { Utils, startAbility, stopApplication } from '../../Util.test';

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName: string = abilityDelegatorRegistry.getArguments().bundleName;
const TAG: string = 'ReSize_Test';
const BUNDLE: string = 'ReSize_';
const waitUiReadyMs: int = 1000;

export default function ReSizeWindow(): void {
  describe('ReSizeWindow', (): void => {
    beforeAll(async (): Promise<void> => {
      await startAbility(bundleName, 'EntryAbility');
      await Utils.msSleep(2000);
    })

    /**
     * @tc.number:ReSize_001
     * @tc.name: ReSize_Test_001
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 设置window指定的大小与方向测试
     */
    it('ReSize_Test_001', TestType.FUNCTION, async (): Promise<void> => {
      hilog.info(0x0000, TAG, `${BUNDLE}Test_001 start`);
      let driver: Driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let window: UiWindow | null = await driver.findWindow({ bundleName: bundleName });
      try {
        await window!.resume();
        await driver.delayMs(waitUiReadyMs);
        let window1: UiWindow | null = await driver.findWindow({ bundleName: bundleName });
        let bounds1: Rect = await window1!.getBounds();
        await window1!.resize(600, 600, ResizeDirection.RIGHT_DOWN);
        await driver.delayMs(waitUiReadyMs);
        let window2: UiWindow | null = await driver.findWindow({ bundleName: bundleName });
        let bounds2: Rect = await window2!.getBounds();
        expect(bounds2 != bounds1).assertTrue();
        await window2!.resize(400, 400, ResizeDirection.RIGHT_UP);
        let window3: UiWindow | null = await driver.findWindow({ bundleName: bundleName });
        let bounds3: Rect = await window3!.getBounds();
        expect(bounds3 != bounds2).assertTrue();
        await window3!.resize(300, 300, ResizeDirection.LEFT_DOWN);
        let window4: UiWindow | null = await driver.findWindow({ bundleName: bundleName });
        let bounds4: Rect = await window4!.getBounds();
        expect(bounds4 != bounds3).assertTrue();
        await window4!.resize(500, 500, ResizeDirection.LEFT_UP);
        let window5: UiWindow | null = await driver.findWindow({ bundleName: bundleName });
        let bounds5: Rect = await window5!.getBounds();
        expect(bounds5 != bounds4).assertTrue();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        if (error.message != 'this device can not support this action') {
          expect(false).assertTrue();
        }
      }
        hilog.info(0x0000, TAG, `${BUNDLE}Test_001 end`);
    })

    /**
     * @tc.number:ReSize_002
     * @tc.name: testWindowMaximize
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 设置window最大窗口,WindowMode.FLOATING: 悬浮窗口, WindowMode.FULLSCREEN: 全屏窗口
     */
    it('testWindowMaximize', TestType.FUNCTION, async (): Promise<void> => {
      let driver: Driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let window: UiWindow | null = await driver.findWindow({ bundleName: bundleName });
      try {
        let windowMode: WindowMode = await window!.getWindowMode();
        if (windowMode != WindowMode.FLOATING) {
          await window!.resume();
        }
        let window2: UiWindow | null = await driver.findWindow({ bundleName: bundleName });
        await window2!.maximize();
        await driver.delayMs(waitUiReadyMs);
        let window3: UiWindow | null = await driver.findWindow({ bundleName: bundleName });
        let mode: WindowMode = await window3!.getWindowMode();
        expect(mode == WindowMode.FULLSCREEN).assertTrue();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        if (error.message != 'this device can not support this action') {
          expect(false).assertTrue();
        }
      }
    })

    /**
     * @tc.number:ReSize_003
     * @tc.name: testWindowMinimize
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 设置window最小窗口, WindowMode.FLOATING: 悬浮窗口, WindowMode.FULLSCREEN: 全屏窗口
     */
    it('testWindowMinimize', TestType.FUNCTION, async (): Promise<void> => {
      let driver: Driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let window: UiWindow | null = await driver.findWindow({ bundleName: bundleName });
      try {
        let windowMode: WindowMode = await window!.getWindowMode();
        if (windowMode != WindowMode.FLOATING) {
          await window!.resume();
        }
        await window!.minimize();
        await driver.delayMs(waitUiReadyMs);
        let window1: UiWindow | null = await driver.findWindow({ bundleName: bundleName });
        expect(window1 == null).assertTrue();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        if (error.message != 'this device can not support this action') {
          expect(false).assertTrue();
        }
      }
    })
  })
}
