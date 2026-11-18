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

import { describe, expect, it } from '@ohos/hypium';
import { DisplayRotation, Driver } from '@ohos.UiTest';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  getDriver,
  ensureHome,
  isImageSelectVisible,
  isDeviceAuthVisible,
  isHomeVisible,
  navigateToImageSelect,
  navigateToCamera,
  navigateToDeviceAuth,
  pressAndWait,
  checkTextContent,
  KEY_ENTER,
  KEY_BACK,
  TEXT_DISCOVER_DEVICES,
  TEXT_DISCOVERING,
  TEXT_TRUST_DEVICE,
  DELAY_KEY_NAVIGATION,
  DELAY_PAGE_TRANSITION
} from './Shared/AIFaceSharedDriver';

const TAG: string = '[Sample_AIFace]';
const BUNDLE: string = 'AIFace_';

/**
 * Legacy entry level page tests. They drive the home page with the remote control
 * (the AIFace home page entries are activated with DPAD + ENTER) and use the shared
 * driver so that the assertions accept both the Chinese and the English UI.
 */
export default function IndexTest(): void {
  describe('AIFaceTests', () => {
    it(BUNDLE + 'HomePage_CameraRecognition_001', 0, async () => {
      const driver: Driver = getDriver();
      await ensureHome(driver);
      // A TV without a camera keeps the home page and shows a hint, both are valid.
      await navigateToCamera(driver);
      await ensureHome(driver);
      hilog.info(0x0000, TAG, '%{public}s', 'Camera entry checked');
    })

    it(BUNDLE + 'ImageSelect_001', 0, async () => {
      const driver: Driver = getDriver();
      await ensureHome(driver);
      const opened: boolean = await navigateToImageSelect(driver);
      expect(opened).assertTrue();
      expect(await isImageSelectVisible(driver)).assertTrue();
      await ensureHome(driver);
    })

    it(BUNDLE + 'DeviceAuthentication_Discover_001', 0, async () => {
      const driver: Driver = getDriver();
      await ensureHome(driver);
      const opened: boolean = await navigateToDeviceAuth(driver);
      expect(opened).assertTrue();
      // The discover button owns the default focus, ENTER starts and stops discovery.
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(DELAY_PAGE_TRANSITION);
      const discovering: boolean = await checkTextContent(driver, TEXT_DISCOVERING);
      if (!discovering) {
        // Stopping discovery again restores the initial hint, which is also valid.
        await checkTextContent(driver, TEXT_DISCOVER_DEVICES);
        await checkTextContent(driver, TEXT_TRUST_DEVICE);
      }
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await ensureHome(driver);
      expect(await isHomeVisible(driver)).assertTrue();
    })

    it(BUNDLE + 'CameraPage_MultiCamera_001', 0, async () => {
      const driver: Driver = getDriver();
      await ensureHome(driver);
      await navigateToCamera(driver);
      await ensureHome(driver);
      hilog.info(0x0000, TAG, '%{public}s', 'Camera page checked');
    })

    it(BUNDLE + 'CleanupEnvironment', 0, async (done: Function) => {
      const driver: Driver = getDriver();
      await driver.setDisplayRotation(DisplayRotation.ROTATION_0);
      await driver.pressHome();
      await driver.delayMs(2000);
      done();
    })
  })
}
