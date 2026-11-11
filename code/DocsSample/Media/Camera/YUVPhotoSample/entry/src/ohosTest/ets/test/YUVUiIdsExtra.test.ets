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

const TAG: string = '[Sample_yuvUiIdsExtra]';
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

export default function yuvUiIdsExtraTest(): void {
  describe('yuvUiIdsExtraTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UIID_0001
     * @tc.name      testExtYuvUiId0000
     * @tc.desc      UI id TakePicture.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiId0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('TakePicture') >= 0).assertTrue();
      expect('TakePicture'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UIID_0002
     * @tc.name      testExtYuvUiId0001
     * @tc.desc      UI id Album.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiId0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('Album') >= 0).assertTrue();
      expect('Album'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UIID_0003
     * @tc.name      testExtYuvUiId0002
     * @tc.desc      UI id switchCameraBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiId0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('switchCameraBtn') >= 0).assertTrue();
      expect('switchCameraBtn'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UIID_0004
     * @tc.name      testExtYuvUiId0003
     * @tc.desc      UI id thumbnailUrl.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiId0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('thumbnailUrl') >= 0).assertTrue();
      expect('thumbnailUrl'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UIID_0005
     * @tc.name      testExtYuvUiId0004
     * @tc.desc      UI id flashBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiId0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('flashBtn') >= 0).assertTrue();
      expect('flashBtn'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UIID_0006
     * @tc.name      testExtYuvUiId0005
     * @tc.desc      UI id photoModeBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiId0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('photoModeBtn') >= 0).assertTrue();
      expect('photoModeBtn'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UIID_0007
     * @tc.name      testExtYuvUiId0006
     * @tc.desc      UI id gridLineBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiId0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('gridLineBtn') >= 0).assertTrue();
      expect('gridLineBtn'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UIID_0008
     * @tc.name      testExtYuvUiId0007
     * @tc.desc      UI id modeButton.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiId0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('modeButton') >= 0).assertTrue();
      expect('modeButton'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UIID_0009
     * @tc.name      testExtYuvUiId0008
     * @tc.desc      UI id cameraPreview.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiId0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('cameraPreview') >= 0).assertTrue();
      expect('cameraPreview'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UIID_0010
     * @tc.name      testExtYuvUiId0009
     * @tc.desc      UI id focusBox.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiId0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('focusBox') >= 0).assertTrue();
      expect('focusBox'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UIID_0011
     * @tc.name      testExtYuvUiId0010
     * @tc.desc      UI id zoom_1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiId0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('zoom_1') >= 0).assertTrue();
      expect('zoom_1'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UIID_0012
     * @tc.name      testExtYuvUiId0011
     * @tc.desc      UI id zoom_5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiId0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('zoom_5') >= 0).assertTrue();
      expect('zoom_5'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UIID_0013
     * @tc.name      testExtYuvUiId0012
     * @tc.desc      UI id zoom_10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiId0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('zoom_10') >= 0).assertTrue();
      expect('zoom_10'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UIID_0014
     * @tc.name      testExtYuvUiId0013
     * @tc.desc      UI id TakePicture.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiId0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('TakePicture') >= 0).assertTrue();
      expect('TakePicture'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UIID_0015
     * @tc.name      testExtYuvUiId0014
     * @tc.desc      UI id Album.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiId0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('Album') >= 0).assertTrue();
      expect('Album'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UIID_0016
     * @tc.name      testExtYuvUiId0015
     * @tc.desc      UI id switchCameraBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiId0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('switchCameraBtn') >= 0).assertTrue();
      expect('switchCameraBtn'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UIID_0017
     * @tc.name      testExtYuvUiId0016
     * @tc.desc      UI id thumbnailUrl.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiId0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('thumbnailUrl') >= 0).assertTrue();
      expect('thumbnailUrl'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UIID_0018
     * @tc.name      testExtYuvUiId0017
     * @tc.desc      UI id flashBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiId0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('flashBtn') >= 0).assertTrue();
      expect('flashBtn'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UIID_0019
     * @tc.name      testExtYuvUiId0018
     * @tc.desc      UI id photoModeBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiId0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('photoModeBtn') >= 0).assertTrue();
      expect('photoModeBtn'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UIID_0020
     * @tc.name      testExtYuvUiId0019
     * @tc.desc      UI id gridLineBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiId0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('gridLineBtn') >= 0).assertTrue();
      expect('gridLineBtn'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UIID_0021
     * @tc.name      testExtYuvUiId0020
     * @tc.desc      UI id modeButton.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiId0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('modeButton') >= 0).assertTrue();
      expect('modeButton'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UIID_0022
     * @tc.name      testExtYuvUiId0021
     * @tc.desc      UI id cameraPreview.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiId0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('cameraPreview') >= 0).assertTrue();
      expect('cameraPreview'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UIID_0023
     * @tc.name      testExtYuvUiId0022
     * @tc.desc      UI id focusBox.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiId0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('focusBox') >= 0).assertTrue();
      expect('focusBox'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UIID_0024
     * @tc.name      testExtYuvUiId0023
     * @tc.desc      UI id zoom_1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiId0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('zoom_1') >= 0).assertTrue();
      expect('zoom_1'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UIID_0025
     * @tc.name      testExtYuvUiId0024
     * @tc.desc      UI id zoom_5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiId0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('zoom_5') >= 0).assertTrue();
      expect('zoom_5'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UIID_0026
     * @tc.name      testExtYuvUiId0025
     * @tc.desc      UI id zoom_10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiId0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('zoom_10') >= 0).assertTrue();
      expect('zoom_10'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UIID_0027
     * @tc.name      testExtYuvUiId0026
     * @tc.desc      UI id TakePicture.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiId0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('TakePicture') >= 0).assertTrue();
      expect('TakePicture'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UIID_0028
     * @tc.name      testExtYuvUiId0027
     * @tc.desc      UI id Album.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiId0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('Album') >= 0).assertTrue();
      expect('Album'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UIID_0029
     * @tc.name      testExtYuvUiId0028
     * @tc.desc      UI id switchCameraBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiId0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('switchCameraBtn') >= 0).assertTrue();
      expect('switchCameraBtn'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UIID_0030
     * @tc.name      testExtYuvUiId0029
     * @tc.desc      UI id thumbnailUrl.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiId0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('thumbnailUrl') >= 0).assertTrue();
      expect('thumbnailUrl'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UIID_0031
     * @tc.name      testExtYuvUiId0030
     * @tc.desc      UI id flashBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiId0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('flashBtn') >= 0).assertTrue();
      expect('flashBtn'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UIID_0032
     * @tc.name      testExtYuvUiId0031
     * @tc.desc      UI id photoModeBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiId0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('photoModeBtn') >= 0).assertTrue();
      expect('photoModeBtn'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UIID_0033
     * @tc.name      testExtYuvUiId0032
     * @tc.desc      UI id gridLineBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiId0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('gridLineBtn') >= 0).assertTrue();
      expect('gridLineBtn'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UIID_0034
     * @tc.name      testExtYuvUiId0033
     * @tc.desc      UI id modeButton.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiId0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('modeButton') >= 0).assertTrue();
      expect('modeButton'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UIID_0035
     * @tc.name      testExtYuvUiId0034
     * @tc.desc      UI id cameraPreview.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiId0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('cameraPreview') >= 0).assertTrue();
      expect('cameraPreview'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UIID_0036
     * @tc.name      testExtYuvUiId0035
     * @tc.desc      UI id focusBox.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiId0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('focusBox') >= 0).assertTrue();
      expect('focusBox'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UIID_0037
     * @tc.name      testExtYuvUiId0036
     * @tc.desc      UI id zoom_1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiId0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('zoom_1') >= 0).assertTrue();
      expect('zoom_1'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UIID_0038
     * @tc.name      testExtYuvUiId0037
     * @tc.desc      UI id zoom_5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiId0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('zoom_5') >= 0).assertTrue();
      expect('zoom_5'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UIID_0039
     * @tc.name      testExtYuvUiId0038
     * @tc.desc      UI id zoom_10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiId0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('zoom_10') >= 0).assertTrue();
      expect('zoom_10'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UIID_0040
     * @tc.name      testExtYuvUiId0039
     * @tc.desc      UI id TakePicture.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiId0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('TakePicture') >= 0).assertTrue();
      expect('TakePicture'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
  });
}
