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
import { describe, it as hypiumIt, expect as hypiumExpect, beforeEach, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = '[Sample_yuvUiMenuContract]';
const DOMAIN: number = 0xF817;

function it(name: string, filter: number, func: () => void | Promise<void>): void {
  hypiumIt(name, filter, async () => {
    hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
    try {
      await func();
    } finally {
      hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
    }
  });
}

interface ExpectAssert {
  assertEqual(expectValue: string | number | boolean | Object | null | undefined): void;
  assertTrue(): void;
  assertFalse(): void;
  assertLarger(expectValue: number): void;
  assertLargerOrEqual(expectValue: number): void;
  assertLess(expectValue: number): void;
  assertLessOrEqual(expectValue: number): void;
  assertUndefined(): void;
  assertFail(): void;
}

function expect(actual: string | number | boolean | Object | null | undefined): ExpectAssert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function yuvUiMenuContractTest(): void {
  describe('yuvUiMenuContractTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MENU_0001
     * @tc.name      testExtYuvMenu0000
     * @tc.desc      Menu contract off flashBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMenu0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const flashTitles: string[] = ['off', 'on', 'auto', 'always_on'];
      const ids: string[] = ['flashBtn', 'photoModeBtn', 'gridLineBtn', 'switchCameraBtn', 'TakePicture', 'Album', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(flashTitles.indexOf('off') >= 0).assertTrue();
      expect(ids.indexOf('flashBtn') >= 0).assertTrue();
      expect(flashTitles.length).assertEqual(4);
      expect(ids.length).assertEqual(9);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MENU_0002
     * @tc.name      testExtYuvMenu0001
     * @tc.desc      Menu contract on photoModeBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMenu0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const flashTitles: string[] = ['off', 'on', 'auto', 'always_on'];
      const ids: string[] = ['flashBtn', 'photoModeBtn', 'gridLineBtn', 'switchCameraBtn', 'TakePicture', 'Album', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(flashTitles.indexOf('on') >= 0).assertTrue();
      expect(ids.indexOf('photoModeBtn') >= 0).assertTrue();
      expect(flashTitles.length).assertEqual(4);
      expect(ids.length).assertEqual(9);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MENU_0003
     * @tc.name      testExtYuvMenu0002
     * @tc.desc      Menu contract auto gridLineBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMenu0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const flashTitles: string[] = ['off', 'on', 'auto', 'always_on'];
      const ids: string[] = ['flashBtn', 'photoModeBtn', 'gridLineBtn', 'switchCameraBtn', 'TakePicture', 'Album', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(flashTitles.indexOf('auto') >= 0).assertTrue();
      expect(ids.indexOf('gridLineBtn') >= 0).assertTrue();
      expect(flashTitles.length).assertEqual(4);
      expect(ids.length).assertEqual(9);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MENU_0004
     * @tc.name      testExtYuvMenu0003
     * @tc.desc      Menu contract always_on switchCameraBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMenu0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const flashTitles: string[] = ['off', 'on', 'auto', 'always_on'];
      const ids: string[] = ['flashBtn', 'photoModeBtn', 'gridLineBtn', 'switchCameraBtn', 'TakePicture', 'Album', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(flashTitles.indexOf('always_on') >= 0).assertTrue();
      expect(ids.indexOf('switchCameraBtn') >= 0).assertTrue();
      expect(flashTitles.length).assertEqual(4);
      expect(ids.length).assertEqual(9);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MENU_0005
     * @tc.name      testExtYuvMenu0004
     * @tc.desc      Menu contract off TakePicture.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMenu0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const flashTitles: string[] = ['off', 'on', 'auto', 'always_on'];
      const ids: string[] = ['flashBtn', 'photoModeBtn', 'gridLineBtn', 'switchCameraBtn', 'TakePicture', 'Album', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(flashTitles.indexOf('off') >= 0).assertTrue();
      expect(ids.indexOf('TakePicture') >= 0).assertTrue();
      expect(flashTitles.length).assertEqual(4);
      expect(ids.length).assertEqual(9);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MENU_0006
     * @tc.name      testExtYuvMenu0005
     * @tc.desc      Menu contract on Album.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMenu0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const flashTitles: string[] = ['off', 'on', 'auto', 'always_on'];
      const ids: string[] = ['flashBtn', 'photoModeBtn', 'gridLineBtn', 'switchCameraBtn', 'TakePicture', 'Album', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(flashTitles.indexOf('on') >= 0).assertTrue();
      expect(ids.indexOf('Album') >= 0).assertTrue();
      expect(flashTitles.length).assertEqual(4);
      expect(ids.length).assertEqual(9);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MENU_0007
     * @tc.name      testExtYuvMenu0006
     * @tc.desc      Menu contract auto zoom_1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMenu0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const flashTitles: string[] = ['off', 'on', 'auto', 'always_on'];
      const ids: string[] = ['flashBtn', 'photoModeBtn', 'gridLineBtn', 'switchCameraBtn', 'TakePicture', 'Album', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(flashTitles.indexOf('auto') >= 0).assertTrue();
      expect(ids.indexOf('zoom_1') >= 0).assertTrue();
      expect(flashTitles.length).assertEqual(4);
      expect(ids.length).assertEqual(9);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MENU_0008
     * @tc.name      testExtYuvMenu0007
     * @tc.desc      Menu contract always_on zoom_5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMenu0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const flashTitles: string[] = ['off', 'on', 'auto', 'always_on'];
      const ids: string[] = ['flashBtn', 'photoModeBtn', 'gridLineBtn', 'switchCameraBtn', 'TakePicture', 'Album', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(flashTitles.indexOf('always_on') >= 0).assertTrue();
      expect(ids.indexOf('zoom_5') >= 0).assertTrue();
      expect(flashTitles.length).assertEqual(4);
      expect(ids.length).assertEqual(9);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MENU_0009
     * @tc.name      testExtYuvMenu0008
     * @tc.desc      Menu contract off zoom_10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMenu0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const flashTitles: string[] = ['off', 'on', 'auto', 'always_on'];
      const ids: string[] = ['flashBtn', 'photoModeBtn', 'gridLineBtn', 'switchCameraBtn', 'TakePicture', 'Album', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(flashTitles.indexOf('off') >= 0).assertTrue();
      expect(ids.indexOf('zoom_10') >= 0).assertTrue();
      expect(flashTitles.length).assertEqual(4);
      expect(ids.length).assertEqual(9);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MENU_0010
     * @tc.name      testExtYuvMenu0009
     * @tc.desc      Menu contract on flashBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMenu0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const flashTitles: string[] = ['off', 'on', 'auto', 'always_on'];
      const ids: string[] = ['flashBtn', 'photoModeBtn', 'gridLineBtn', 'switchCameraBtn', 'TakePicture', 'Album', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(flashTitles.indexOf('on') >= 0).assertTrue();
      expect(ids.indexOf('flashBtn') >= 0).assertTrue();
      expect(flashTitles.length).assertEqual(4);
      expect(ids.length).assertEqual(9);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MENU_0011
     * @tc.name      testExtYuvMenu0010
     * @tc.desc      Menu contract auto photoModeBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMenu0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const flashTitles: string[] = ['off', 'on', 'auto', 'always_on'];
      const ids: string[] = ['flashBtn', 'photoModeBtn', 'gridLineBtn', 'switchCameraBtn', 'TakePicture', 'Album', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(flashTitles.indexOf('auto') >= 0).assertTrue();
      expect(ids.indexOf('photoModeBtn') >= 0).assertTrue();
      expect(flashTitles.length).assertEqual(4);
      expect(ids.length).assertEqual(9);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MENU_0012
     * @tc.name      testExtYuvMenu0011
     * @tc.desc      Menu contract always_on gridLineBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMenu0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const flashTitles: string[] = ['off', 'on', 'auto', 'always_on'];
      const ids: string[] = ['flashBtn', 'photoModeBtn', 'gridLineBtn', 'switchCameraBtn', 'TakePicture', 'Album', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(flashTitles.indexOf('always_on') >= 0).assertTrue();
      expect(ids.indexOf('gridLineBtn') >= 0).assertTrue();
      expect(flashTitles.length).assertEqual(4);
      expect(ids.length).assertEqual(9);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MENU_0013
     * @tc.name      testExtYuvMenu0012
     * @tc.desc      Menu contract off switchCameraBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMenu0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const flashTitles: string[] = ['off', 'on', 'auto', 'always_on'];
      const ids: string[] = ['flashBtn', 'photoModeBtn', 'gridLineBtn', 'switchCameraBtn', 'TakePicture', 'Album', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(flashTitles.indexOf('off') >= 0).assertTrue();
      expect(ids.indexOf('switchCameraBtn') >= 0).assertTrue();
      expect(flashTitles.length).assertEqual(4);
      expect(ids.length).assertEqual(9);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MENU_0014
     * @tc.name      testExtYuvMenu0013
     * @tc.desc      Menu contract on TakePicture.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMenu0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const flashTitles: string[] = ['off', 'on', 'auto', 'always_on'];
      const ids: string[] = ['flashBtn', 'photoModeBtn', 'gridLineBtn', 'switchCameraBtn', 'TakePicture', 'Album', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(flashTitles.indexOf('on') >= 0).assertTrue();
      expect(ids.indexOf('TakePicture') >= 0).assertTrue();
      expect(flashTitles.length).assertEqual(4);
      expect(ids.length).assertEqual(9);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MENU_0015
     * @tc.name      testExtYuvMenu0014
     * @tc.desc      Menu contract auto Album.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMenu0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const flashTitles: string[] = ['off', 'on', 'auto', 'always_on'];
      const ids: string[] = ['flashBtn', 'photoModeBtn', 'gridLineBtn', 'switchCameraBtn', 'TakePicture', 'Album', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(flashTitles.indexOf('auto') >= 0).assertTrue();
      expect(ids.indexOf('Album') >= 0).assertTrue();
      expect(flashTitles.length).assertEqual(4);
      expect(ids.length).assertEqual(9);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MENU_0016
     * @tc.name      testExtYuvMenu0015
     * @tc.desc      Menu contract always_on zoom_1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMenu0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const flashTitles: string[] = ['off', 'on', 'auto', 'always_on'];
      const ids: string[] = ['flashBtn', 'photoModeBtn', 'gridLineBtn', 'switchCameraBtn', 'TakePicture', 'Album', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(flashTitles.indexOf('always_on') >= 0).assertTrue();
      expect(ids.indexOf('zoom_1') >= 0).assertTrue();
      expect(flashTitles.length).assertEqual(4);
      expect(ids.length).assertEqual(9);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MENU_0017
     * @tc.name      testExtYuvMenu0016
     * @tc.desc      Menu contract off zoom_5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMenu0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const flashTitles: string[] = ['off', 'on', 'auto', 'always_on'];
      const ids: string[] = ['flashBtn', 'photoModeBtn', 'gridLineBtn', 'switchCameraBtn', 'TakePicture', 'Album', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(flashTitles.indexOf('off') >= 0).assertTrue();
      expect(ids.indexOf('zoom_5') >= 0).assertTrue();
      expect(flashTitles.length).assertEqual(4);
      expect(ids.length).assertEqual(9);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MENU_0018
     * @tc.name      testExtYuvMenu0017
     * @tc.desc      Menu contract on zoom_10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMenu0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const flashTitles: string[] = ['off', 'on', 'auto', 'always_on'];
      const ids: string[] = ['flashBtn', 'photoModeBtn', 'gridLineBtn', 'switchCameraBtn', 'TakePicture', 'Album', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(flashTitles.indexOf('on') >= 0).assertTrue();
      expect(ids.indexOf('zoom_10') >= 0).assertTrue();
      expect(flashTitles.length).assertEqual(4);
      expect(ids.length).assertEqual(9);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MENU_0019
     * @tc.name      testExtYuvMenu0018
     * @tc.desc      Menu contract auto flashBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMenu0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const flashTitles: string[] = ['off', 'on', 'auto', 'always_on'];
      const ids: string[] = ['flashBtn', 'photoModeBtn', 'gridLineBtn', 'switchCameraBtn', 'TakePicture', 'Album', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(flashTitles.indexOf('auto') >= 0).assertTrue();
      expect(ids.indexOf('flashBtn') >= 0).assertTrue();
      expect(flashTitles.length).assertEqual(4);
      expect(ids.length).assertEqual(9);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MENU_0020
     * @tc.name      testExtYuvMenu0019
     * @tc.desc      Menu contract always_on photoModeBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMenu0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const flashTitles: string[] = ['off', 'on', 'auto', 'always_on'];
      const ids: string[] = ['flashBtn', 'photoModeBtn', 'gridLineBtn', 'switchCameraBtn', 'TakePicture', 'Album', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(flashTitles.indexOf('always_on') >= 0).assertTrue();
      expect(ids.indexOf('photoModeBtn') >= 0).assertTrue();
      expect(flashTitles.length).assertEqual(4);
      expect(ids.length).assertEqual(9);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MENU_0021
     * @tc.name      testExtYuvMenu0020
     * @tc.desc      Menu contract off gridLineBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMenu0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const flashTitles: string[] = ['off', 'on', 'auto', 'always_on'];
      const ids: string[] = ['flashBtn', 'photoModeBtn', 'gridLineBtn', 'switchCameraBtn', 'TakePicture', 'Album', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(flashTitles.indexOf('off') >= 0).assertTrue();
      expect(ids.indexOf('gridLineBtn') >= 0).assertTrue();
      expect(flashTitles.length).assertEqual(4);
      expect(ids.length).assertEqual(9);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MENU_0022
     * @tc.name      testExtYuvMenu0021
     * @tc.desc      Menu contract on switchCameraBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMenu0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const flashTitles: string[] = ['off', 'on', 'auto', 'always_on'];
      const ids: string[] = ['flashBtn', 'photoModeBtn', 'gridLineBtn', 'switchCameraBtn', 'TakePicture', 'Album', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(flashTitles.indexOf('on') >= 0).assertTrue();
      expect(ids.indexOf('switchCameraBtn') >= 0).assertTrue();
      expect(flashTitles.length).assertEqual(4);
      expect(ids.length).assertEqual(9);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MENU_0023
     * @tc.name      testExtYuvMenu0022
     * @tc.desc      Menu contract auto TakePicture.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMenu0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const flashTitles: string[] = ['off', 'on', 'auto', 'always_on'];
      const ids: string[] = ['flashBtn', 'photoModeBtn', 'gridLineBtn', 'switchCameraBtn', 'TakePicture', 'Album', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(flashTitles.indexOf('auto') >= 0).assertTrue();
      expect(ids.indexOf('TakePicture') >= 0).assertTrue();
      expect(flashTitles.length).assertEqual(4);
      expect(ids.length).assertEqual(9);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MENU_0024
     * @tc.name      testExtYuvMenu0023
     * @tc.desc      Menu contract always_on Album.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMenu0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const flashTitles: string[] = ['off', 'on', 'auto', 'always_on'];
      const ids: string[] = ['flashBtn', 'photoModeBtn', 'gridLineBtn', 'switchCameraBtn', 'TakePicture', 'Album', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(flashTitles.indexOf('always_on') >= 0).assertTrue();
      expect(ids.indexOf('Album') >= 0).assertTrue();
      expect(flashTitles.length).assertEqual(4);
      expect(ids.length).assertEqual(9);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MENU_0025
     * @tc.name      testExtYuvMenu0024
     * @tc.desc      Menu contract off zoom_1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMenu0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const flashTitles: string[] = ['off', 'on', 'auto', 'always_on'];
      const ids: string[] = ['flashBtn', 'photoModeBtn', 'gridLineBtn', 'switchCameraBtn', 'TakePicture', 'Album', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(flashTitles.indexOf('off') >= 0).assertTrue();
      expect(ids.indexOf('zoom_1') >= 0).assertTrue();
      expect(flashTitles.length).assertEqual(4);
      expect(ids.length).assertEqual(9);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MENU_0026
     * @tc.name      testExtYuvMenu0025
     * @tc.desc      Menu contract on zoom_5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMenu0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const flashTitles: string[] = ['off', 'on', 'auto', 'always_on'];
      const ids: string[] = ['flashBtn', 'photoModeBtn', 'gridLineBtn', 'switchCameraBtn', 'TakePicture', 'Album', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(flashTitles.indexOf('on') >= 0).assertTrue();
      expect(ids.indexOf('zoom_5') >= 0).assertTrue();
      expect(flashTitles.length).assertEqual(4);
      expect(ids.length).assertEqual(9);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MENU_0027
     * @tc.name      testExtYuvMenu0026
     * @tc.desc      Menu contract auto zoom_10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMenu0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const flashTitles: string[] = ['off', 'on', 'auto', 'always_on'];
      const ids: string[] = ['flashBtn', 'photoModeBtn', 'gridLineBtn', 'switchCameraBtn', 'TakePicture', 'Album', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(flashTitles.indexOf('auto') >= 0).assertTrue();
      expect(ids.indexOf('zoom_10') >= 0).assertTrue();
      expect(flashTitles.length).assertEqual(4);
      expect(ids.length).assertEqual(9);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MENU_0028
     * @tc.name      testExtYuvMenu0027
     * @tc.desc      Menu contract always_on flashBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMenu0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const flashTitles: string[] = ['off', 'on', 'auto', 'always_on'];
      const ids: string[] = ['flashBtn', 'photoModeBtn', 'gridLineBtn', 'switchCameraBtn', 'TakePicture', 'Album', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(flashTitles.indexOf('always_on') >= 0).assertTrue();
      expect(ids.indexOf('flashBtn') >= 0).assertTrue();
      expect(flashTitles.length).assertEqual(4);
      expect(ids.length).assertEqual(9);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MENU_0029
     * @tc.name      testExtYuvMenu0028
     * @tc.desc      Menu contract off photoModeBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMenu0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const flashTitles: string[] = ['off', 'on', 'auto', 'always_on'];
      const ids: string[] = ['flashBtn', 'photoModeBtn', 'gridLineBtn', 'switchCameraBtn', 'TakePicture', 'Album', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(flashTitles.indexOf('off') >= 0).assertTrue();
      expect(ids.indexOf('photoModeBtn') >= 0).assertTrue();
      expect(flashTitles.length).assertEqual(4);
      expect(ids.length).assertEqual(9);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_MENU_0030
     * @tc.name      testExtYuvMenu0029
     * @tc.desc      Menu contract on gridLineBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvMenu0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const flashTitles: string[] = ['off', 'on', 'auto', 'always_on'];
      const ids: string[] = ['flashBtn', 'photoModeBtn', 'gridLineBtn', 'switchCameraBtn', 'TakePicture', 'Album', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(flashTitles.indexOf('on') >= 0).assertTrue();
      expect(ids.indexOf('gridLineBtn') >= 0).assertTrue();
      expect(flashTitles.length).assertEqual(4);
      expect(ids.length).assertEqual(9);
    })
  });
}
