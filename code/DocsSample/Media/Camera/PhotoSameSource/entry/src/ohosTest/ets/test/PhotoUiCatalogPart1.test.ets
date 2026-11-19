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
import { driver, ensureApp, startApp, waitForText, waitForId, openFlashMenu, closeFlashMenu, tapText } from './shared/PhotoUiSupport';
import { ON, Component } from '@kit.TestKit';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF812;
const TAG: string = '[Sample_PhotoSameSource]';

export default function PhotoUiCatalogPart1Test(): void {
  describe('PhotoUiCatalogPart1', () => {

    /**
     * @tc.number    SUB_PHOTO_UIP1_0100
     * @tc.name      testModeLabelText0001
     * @tc.desc      Verify photo and video labels expose their exact text.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testModeLabelText0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModeLabelText0001 begin');
      expect(await ensureApp()).assertTrue();
      const photo = await waitForText('拍照');
      const video = await waitForText('录像');
      expect(photo !== null).assertTrue();
      expect(video !== null).assertTrue();
      if (photo !== null) {
        expect(await photo.getText()).assertEqual('拍照');
      }
      if (video !== null) {
        expect(await video.getText()).assertEqual('录像');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testModeLabelText0001 end');
    })

    /**
     * @tc.number    SUB_PHOTO_UIP1_0200
     * @tc.name      testCaptureType0002
     * @tc.desc      Verify the Capture control is a Button.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCaptureType0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCaptureType0002 begin');
      expect(await ensureApp()).assertTrue();
      const capture = await waitForId('Capture');
      expect(capture !== null).assertTrue();
      if (capture !== null) {
        expect(await capture.getType()).assertEqual('Button');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCaptureType0002 end');
    })

    /**
     * @tc.number    SUB_PHOTO_UIP1_0300
     * @tc.name      testCaptureClickable0003
     * @tc.desc      Verify the Capture control accepts clicks.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCaptureClickable0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCaptureClickable0003 begin');
      expect(await ensureApp()).assertTrue();
      const capture = await waitForId('Capture');
      expect(capture !== null).assertTrue();
      if (capture !== null) {
        expect(await capture.isClickable()).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCaptureClickable0003 end');
    })

    /**
     * @tc.number    SUB_PHOTO_UIP1_0400
     * @tc.name      testButtonCount0004
     * @tc.desc      Verify photo mode exposes exactly two buttons.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testButtonCount0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonCount0004 begin');
      expect(await ensureApp()).assertTrue();
      const buttons: Component[] = await driver.findComponents(ON.type('Button'));
      expect(buttons.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testButtonCount0004 end');
    })

    /**
     * @tc.number    SUB_PHOTO_UIP1_0500
     * @tc.name      testFlashRowType0005
     * @tc.desc      Verify the flash row is present with Row type.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFlashRowType0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlashRowType0005 begin');
      expect(await ensureApp()).assertTrue();
      const row = await waitForId('flashingLightComponent');
      expect(row !== null).assertTrue();
      if (row !== null) {
        expect(await row.getType()).assertEqual('Row');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlashRowType0005 end');
    })

    /**
     * @tc.number    SUB_PHOTO_UIP1_0600
     * @tc.name      testThumbnailPresent0006
     * @tc.desc      Verify the thumbnail preview node exists.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testThumbnailPresent0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testThumbnailPresent0006 begin');
      expect(await ensureApp()).assertTrue();
      expect(await waitForId('Thumbnail') !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testThumbnailPresent0006 end');
    })

    /**
     * @tc.number    SUB_PHOTO_UIP1_0700
     * @tc.name      testFlashMenuOption0007
     * @tc.desc      Verify the photo flash menu offers off.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFlashMenuOption0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlashMenuOption0007 begin');
      expect(await ensureApp()).assertTrue();
      expect(await openFlashMenu()).assertTrue();
      expect(await waitForText('off') !== null).assertTrue();
      await closeFlashMenu();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlashMenuOption0007 end');
    })

    /**
     * @tc.number    SUB_PHOTO_UIP1_0800
     * @tc.name      testFlashMenuOption0008
     * @tc.desc      Verify the photo flash menu offers on.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFlashMenuOption0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlashMenuOption0008 begin');
      expect(await ensureApp()).assertTrue();
      expect(await openFlashMenu()).assertTrue();
      expect(await waitForText('on') !== null).assertTrue();
      await closeFlashMenu();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlashMenuOption0008 end');
    })

    /**
     * @tc.number    SUB_PHOTO_UIP1_0900
     * @tc.name      testFlashMenuOption0009
     * @tc.desc      Verify the photo flash menu offers auto.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFlashMenuOption0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlashMenuOption0009 begin');
      expect(await ensureApp()).assertTrue();
      expect(await openFlashMenu()).assertTrue();
      expect(await waitForText('auto') !== null).assertTrue();
      await closeFlashMenu();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlashMenuOption0009 end');
    })

    /**
     * @tc.number    SUB_PHOTO_UIP1_1000
     * @tc.name      testFlashMenuOption0010
     * @tc.desc      Verify the photo flash menu offers always_on.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFlashMenuOption0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlashMenuOption0010 begin');
      expect(await ensureApp()).assertTrue();
      expect(await openFlashMenu()).assertTrue();
      expect(await waitForText('always_on') !== null).assertTrue();
      await closeFlashMenu();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlashMenuOption0010 end');
    })

    /**
     * @tc.number    SUB_PHOTO_UIP1_1100
     * @tc.name      testFlashMenuDismiss0011
     * @tc.desc      Verify back closes the flash menu but keeps the row.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlashMenuDismiss0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlashMenuDismiss0011 begin');
      expect(await ensureApp()).assertTrue();
      expect(await openFlashMenu()).assertTrue();
      expect(await waitForText('always_on') !== null).assertTrue();
      await closeFlashMenu();
      expect(await waitForText('always_on', 800) === null).assertTrue();
      expect(await waitForId('flashingLightComponent') !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlashMenuDismiss0011 end');
    })

    /**
     * @tc.number    SUB_PHOTO_UIP1_1200
     * @tc.name      testFlashSelectOn0012
     * @tc.desc      Verify selecting on closes the menu.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlashSelectOn0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlashSelectOn0012 begin');
      expect(await ensureApp()).assertTrue();
      expect(await openFlashMenu()).assertTrue();
      expect(await tapText('on')).assertTrue();
      expect(await waitForText('auto', 800) === null).assertTrue();
      expect(await waitForId('flashingLightComponent') !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlashSelectOn0012 end');
    })

    /**
     * @tc.number    SUB_PHOTO_UIP1_1300
     * @tc.name      testFlashSelectAuto0013
     * @tc.desc      Verify selecting auto closes the menu.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlashSelectAuto0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlashSelectAuto0013 begin');
      expect(await ensureApp()).assertTrue();
      expect(await openFlashMenu()).assertTrue();
      expect(await tapText('auto')).assertTrue();
      expect(await waitForText('always_on', 800) === null).assertTrue();
      expect(await waitForId('flashingLightComponent') !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlashSelectAuto0013 end');
    })

    /**
     * @tc.number    SUB_PHOTO_UIP1_1400
     * @tc.name      testFlashMenuReopen0014
     * @tc.desc      Verify the flash menu can be opened and closed three times.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFlashMenuReopen0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlashMenuReopen0014 begin');
      expect(await ensureApp()).assertTrue();
      for (let i: number = 0; i < 3; i++) {
        expect(await openFlashMenu()).assertTrue();
        expect(await waitForText('off') !== null).assertTrue();
        await closeFlashMenu();
        expect(await waitForText('off', 800) === null).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFlashMenuReopen0014 end');
    })

    /**
     * @tc.number    SUB_PHOTO_UIP1_1500
     * @tc.name      testRelaunch0015
     * @tc.desc      Verify starting the app again keeps the index visible.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRelaunch0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRelaunch0015 begin');
      expect(await ensureApp()).assertTrue();
      expect(await startApp()).assertTrue();
      expect(await waitForId('Capture') !== null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRelaunch0015 end');
    })

    /**
     * @tc.number    SUB_PHOTO_UIP1_1600
     * @tc.name      testRepeatedLaunches0016
     * @tc.desc      Verify three launches keep both mode labels.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRepeatedLaunches0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepeatedLaunches0016 begin');
      for (let i: number = 0; i < 3; i++) {
        expect(await startApp()).assertTrue();
        expect(await waitForText('拍照') !== null).assertTrue();
        expect(await waitForText('录像') !== null).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRepeatedLaunches0016 end');
    })

  })
}
