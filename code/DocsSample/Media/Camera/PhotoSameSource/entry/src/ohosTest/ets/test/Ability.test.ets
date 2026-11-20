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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { driver, ensureApp, startApp, waitForText, waitForId } from './shared/PhotoUiSupport';

const DOMAIN: number = 0xF812;
const TAG: string = '[Sample_PhotoSameSource]';

export default function abilityTest(): void {
  describe('PhotoLaunchPart1', () => {

    /**
     * @tc.number    SUB_PHOTO_LAUNCHP1_0100
     * @tc.name      testLaunchPhotoLabel0001
     * @tc.desc      Verify launching the app shows the photo mode label.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLaunchPhotoLabel0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLaunchPhotoLabel0001 begin');
      expect(await startApp()).assertTrue();
      expect(await waitForText('拍照') !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLaunchPhotoLabel0001 end');
    })

    /**
     * @tc.number    SUB_PHOTO_LAUNCHP1_0200
     * @tc.name      testLaunchVideoLabel0002
     * @tc.desc      Verify launching the app shows the video mode label.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLaunchVideoLabel0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLaunchVideoLabel0002 begin');
      expect(await startApp()).assertTrue();
      expect(await waitForText('录像') !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLaunchVideoLabel0002 end');
    })

    /**
     * @tc.number    SUB_PHOTO_LAUNCHP1_0300
     * @tc.name      testPermissionDialogGone0003
     * @tc.desc      Verify permission dialogs are dismissed after launch.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPermissionDialogGone0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPermissionDialogGone0003 begin');
      expect(await ensureApp()).assertTrue();
      expect(await waitForText('禁止', 800) === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPermissionDialogGone0003 end');
    })

    /**
     * @tc.number    SUB_PHOTO_LAUNCHP1_0400
     * @tc.name      testIndexStatics0004
     * @tc.desc      Verify the capture button and flash row are present after launch.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIndexStatics0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexStatics0004 begin');
      expect(await ensureApp()).assertTrue();
      expect(await waitForId('Capture') !== null).assertTrue();
      expect(await waitForId('flashingLightComponent') !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testIndexStatics0004 end');
    })

  });
}