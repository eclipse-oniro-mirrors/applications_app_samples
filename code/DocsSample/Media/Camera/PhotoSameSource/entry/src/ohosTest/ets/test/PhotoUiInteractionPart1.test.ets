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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { driver, ensureApp, startApp, waitForText, waitForId } from './shared/PhotoUiSupport';
import { ON, Component } from '@kit.TestKit';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF812;
const TAG: string = '[Sample_PhotoSameSource]';



export default function PhotoUiInteractionPart1Test(): void {
  describe('PhotoUiInteractionPart1', () => {

    /**
     * @tc.number    SUB_PHOTO_UIXP1_0100
     * @tc.name      testCaptureTapKeepsUi0001
     * @tc.desc      Verify tapping capture keeps the capture control present.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCaptureTapKeepsUi0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCaptureTapKeepsUi0001 begin');
      expect(await ensureApp()).assertTrue();
      const capture = await waitForId('Capture');
      expect(capture !== null).assertTrue();
      if (capture !== null) {
        await capture.click();
        await driver.delayMs(1000);
      }
      expect(await waitForId('Capture') !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCaptureTapKeepsUi0001 end');
    })

    /**
     * @tc.number    SUB_PHOTO_UIXP1_0200
     * @tc.name      testCaptureDoubleTapKeepsUi0002
     * @tc.desc      Verify two capture taps keep both mode labels.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCaptureDoubleTapKeepsUi0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCaptureDoubleTapKeepsUi0002 begin');
      expect(await ensureApp()).assertTrue();
      const capture = await waitForId('Capture');
      expect(capture !== null).assertTrue();
      if (capture !== null) {
        await capture.click();
        await driver.delayMs(600);
        await capture.click();
        await driver.delayMs(1000);
      }
      expect(await waitForText('拍照') !== null).assertTrue();
      expect(await waitForText('录像') !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCaptureDoubleTapKeepsUi0002 end');
    })

    /**
     * @tc.number    SUB_PHOTO_UIXP1_0300
     * @tc.name      testSwitchCameraTapKeepsUi0003
     * @tc.desc      Verify tapping the switch camera button keeps capture visible.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSwitchCameraTapKeepsUi0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchCameraTapKeepsUi0003 begin');
      expect(await ensureApp()).assertTrue();
      const buttons: Component[] = await driver.findComponents(ON.type('Button'));
      expect(buttons.length >= 2).assertTrue();
      if (buttons.length >= 2) {
        await buttons[1].click();
        await driver.delayMs(1000);
      }
      expect(await waitForId('Capture') !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSwitchCameraTapKeepsUi0003 end');
    })

    /**
     * @tc.number    SUB_PHOTO_UIXP1_0400
     * @tc.name      testLivePhotoTapKeepsUi0004
     * @tc.desc      Verify tapping live photo keeps the flash row visible.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLivePhotoTapKeepsUi0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLivePhotoTapKeepsUi0004 begin');
      expect(await ensureApp()).assertTrue();
      const glyphs: Component[] = await driver.findComponents(ON.type('SymbolGlyph'));
      expect(glyphs.length >= 2).assertTrue();
      if (glyphs.length >= 2) {
        await glyphs[1].click();
        await driver.delayMs(800);
      }
      expect(await waitForId('flashingLightComponent') !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLivePhotoTapKeepsUi0004 end');
    })

    /**
     * @tc.number    SUB_PHOTO_UIXP1_0500
     * @tc.name      testWarmLaunchBudget0005
     * @tc.desc      Verify a warm relaunch completes within eight seconds.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWarmLaunchBudget0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWarmLaunchBudget0005 begin');
      expect(await ensureApp()).assertTrue();
      const start: number = Date.now();
      expect(await startApp()).assertTrue();
      expect(Date.now() - start < 8000).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testWarmLaunchBudget0005 end');
    })

  })
}
