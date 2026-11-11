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

const TAG: string = '[Sample_yuvUiContractCore]';
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

export default function yuvUiContractCoreTest(): void {
  describe('yuvUiContractCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0001
     * @tc.name      testExtYuvUiContract0000
     * @tc.desc      UI contract TakePicture.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('TakePicture') >= 0).assertTrue();
      expect('TakePicture'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0002
     * @tc.name      testExtYuvUiContract0001
     * @tc.desc      UI contract Album.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('Album') >= 0).assertTrue();
      expect('Album'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0003
     * @tc.name      testExtYuvUiContract0002
     * @tc.desc      UI contract switchCameraBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('switchCameraBtn') >= 0).assertTrue();
      expect('switchCameraBtn'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0004
     * @tc.name      testExtYuvUiContract0003
     * @tc.desc      UI contract thumbnailUrl.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('thumbnailUrl') >= 0).assertTrue();
      expect('thumbnailUrl'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0005
     * @tc.name      testExtYuvUiContract0004
     * @tc.desc      UI contract flashBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('flashBtn') >= 0).assertTrue();
      expect('flashBtn'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0006
     * @tc.name      testExtYuvUiContract0005
     * @tc.desc      UI contract photoModeBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('photoModeBtn') >= 0).assertTrue();
      expect('photoModeBtn'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0007
     * @tc.name      testExtYuvUiContract0006
     * @tc.desc      UI contract gridLineBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('gridLineBtn') >= 0).assertTrue();
      expect('gridLineBtn'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0008
     * @tc.name      testExtYuvUiContract0007
     * @tc.desc      UI contract modeButton.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('modeButton') >= 0).assertTrue();
      expect('modeButton'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0009
     * @tc.name      testExtYuvUiContract0008
     * @tc.desc      UI contract cameraPreview.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('cameraPreview') >= 0).assertTrue();
      expect('cameraPreview'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0010
     * @tc.name      testExtYuvUiContract0009
     * @tc.desc      UI contract focusBox.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('focusBox') >= 0).assertTrue();
      expect('focusBox'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0011
     * @tc.name      testExtYuvUiContract0010
     * @tc.desc      UI contract zoom_1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('zoom_1') >= 0).assertTrue();
      expect('zoom_1'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0012
     * @tc.name      testExtYuvUiContract0011
     * @tc.desc      UI contract zoom_5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('zoom_5') >= 0).assertTrue();
      expect('zoom_5'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0013
     * @tc.name      testExtYuvUiContract0012
     * @tc.desc      UI contract zoom_10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('zoom_10') >= 0).assertTrue();
      expect('zoom_10'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0014
     * @tc.name      testExtYuvUiContract0013
     * @tc.desc      UI contract TakePicture.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('TakePicture') >= 0).assertTrue();
      expect('TakePicture'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0015
     * @tc.name      testExtYuvUiContract0014
     * @tc.desc      UI contract Album.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('Album') >= 0).assertTrue();
      expect('Album'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0016
     * @tc.name      testExtYuvUiContract0015
     * @tc.desc      UI contract switchCameraBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('switchCameraBtn') >= 0).assertTrue();
      expect('switchCameraBtn'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0017
     * @tc.name      testExtYuvUiContract0016
     * @tc.desc      UI contract thumbnailUrl.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('thumbnailUrl') >= 0).assertTrue();
      expect('thumbnailUrl'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0018
     * @tc.name      testExtYuvUiContract0017
     * @tc.desc      UI contract flashBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('flashBtn') >= 0).assertTrue();
      expect('flashBtn'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0019
     * @tc.name      testExtYuvUiContract0018
     * @tc.desc      UI contract photoModeBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('photoModeBtn') >= 0).assertTrue();
      expect('photoModeBtn'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0020
     * @tc.name      testExtYuvUiContract0019
     * @tc.desc      UI contract gridLineBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('gridLineBtn') >= 0).assertTrue();
      expect('gridLineBtn'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0021
     * @tc.name      testExtYuvUiContract0020
     * @tc.desc      UI contract modeButton.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('modeButton') >= 0).assertTrue();
      expect('modeButton'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0022
     * @tc.name      testExtYuvUiContract0021
     * @tc.desc      UI contract cameraPreview.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('cameraPreview') >= 0).assertTrue();
      expect('cameraPreview'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0023
     * @tc.name      testExtYuvUiContract0022
     * @tc.desc      UI contract focusBox.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('focusBox') >= 0).assertTrue();
      expect('focusBox'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0024
     * @tc.name      testExtYuvUiContract0023
     * @tc.desc      UI contract zoom_1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('zoom_1') >= 0).assertTrue();
      expect('zoom_1'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0025
     * @tc.name      testExtYuvUiContract0024
     * @tc.desc      UI contract zoom_5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('zoom_5') >= 0).assertTrue();
      expect('zoom_5'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0026
     * @tc.name      testExtYuvUiContract0025
     * @tc.desc      UI contract zoom_10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('zoom_10') >= 0).assertTrue();
      expect('zoom_10'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0027
     * @tc.name      testExtYuvUiContract0026
     * @tc.desc      UI contract TakePicture.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('TakePicture') >= 0).assertTrue();
      expect('TakePicture'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0028
     * @tc.name      testExtYuvUiContract0027
     * @tc.desc      UI contract Album.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('Album') >= 0).assertTrue();
      expect('Album'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0029
     * @tc.name      testExtYuvUiContract0028
     * @tc.desc      UI contract switchCameraBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('switchCameraBtn') >= 0).assertTrue();
      expect('switchCameraBtn'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0030
     * @tc.name      testExtYuvUiContract0029
     * @tc.desc      UI contract thumbnailUrl.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('thumbnailUrl') >= 0).assertTrue();
      expect('thumbnailUrl'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0031
     * @tc.name      testExtYuvUiContract0030
     * @tc.desc      UI contract flashBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('flashBtn') >= 0).assertTrue();
      expect('flashBtn'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0032
     * @tc.name      testExtYuvUiContract0031
     * @tc.desc      UI contract photoModeBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('photoModeBtn') >= 0).assertTrue();
      expect('photoModeBtn'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0033
     * @tc.name      testExtYuvUiContract0032
     * @tc.desc      UI contract gridLineBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('gridLineBtn') >= 0).assertTrue();
      expect('gridLineBtn'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0034
     * @tc.name      testExtYuvUiContract0033
     * @tc.desc      UI contract modeButton.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('modeButton') >= 0).assertTrue();
      expect('modeButton'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0035
     * @tc.name      testExtYuvUiContract0034
     * @tc.desc      UI contract cameraPreview.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('cameraPreview') >= 0).assertTrue();
      expect('cameraPreview'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0036
     * @tc.name      testExtYuvUiContract0035
     * @tc.desc      UI contract focusBox.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('focusBox') >= 0).assertTrue();
      expect('focusBox'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0037
     * @tc.name      testExtYuvUiContract0036
     * @tc.desc      UI contract zoom_1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('zoom_1') >= 0).assertTrue();
      expect('zoom_1'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0038
     * @tc.name      testExtYuvUiContract0037
     * @tc.desc      UI contract zoom_5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('zoom_5') >= 0).assertTrue();
      expect('zoom_5'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0039
     * @tc.name      testExtYuvUiContract0038
     * @tc.desc      UI contract zoom_10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('zoom_10') >= 0).assertTrue();
      expect('zoom_10'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0040
     * @tc.name      testExtYuvUiContract0039
     * @tc.desc      UI contract TakePicture.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('TakePicture') >= 0).assertTrue();
      expect('TakePicture'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0041
     * @tc.name      testExtYuvUiContract0040
     * @tc.desc      UI contract Album.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('Album') >= 0).assertTrue();
      expect('Album'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0042
     * @tc.name      testExtYuvUiContract0041
     * @tc.desc      UI contract switchCameraBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('switchCameraBtn') >= 0).assertTrue();
      expect('switchCameraBtn'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0043
     * @tc.name      testExtYuvUiContract0042
     * @tc.desc      UI contract thumbnailUrl.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('thumbnailUrl') >= 0).assertTrue();
      expect('thumbnailUrl'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0044
     * @tc.name      testExtYuvUiContract0043
     * @tc.desc      UI contract flashBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('flashBtn') >= 0).assertTrue();
      expect('flashBtn'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0045
     * @tc.name      testExtYuvUiContract0044
     * @tc.desc      UI contract photoModeBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('photoModeBtn') >= 0).assertTrue();
      expect('photoModeBtn'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0046
     * @tc.name      testExtYuvUiContract0045
     * @tc.desc      UI contract gridLineBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('gridLineBtn') >= 0).assertTrue();
      expect('gridLineBtn'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0047
     * @tc.name      testExtYuvUiContract0046
     * @tc.desc      UI contract modeButton.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('modeButton') >= 0).assertTrue();
      expect('modeButton'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0048
     * @tc.name      testExtYuvUiContract0047
     * @tc.desc      UI contract cameraPreview.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('cameraPreview') >= 0).assertTrue();
      expect('cameraPreview'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0049
     * @tc.name      testExtYuvUiContract0048
     * @tc.desc      UI contract focusBox.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('focusBox') >= 0).assertTrue();
      expect('focusBox'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0050
     * @tc.name      testExtYuvUiContract0049
     * @tc.desc      UI contract zoom_1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('zoom_1') >= 0).assertTrue();
      expect('zoom_1'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0051
     * @tc.name      testExtYuvUiContract0050
     * @tc.desc      UI contract zoom_5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('zoom_5') >= 0).assertTrue();
      expect('zoom_5'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0052
     * @tc.name      testExtYuvUiContract0051
     * @tc.desc      UI contract zoom_10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('zoom_10') >= 0).assertTrue();
      expect('zoom_10'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0053
     * @tc.name      testExtYuvUiContract0052
     * @tc.desc      UI contract TakePicture.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('TakePicture') >= 0).assertTrue();
      expect('TakePicture'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0054
     * @tc.name      testExtYuvUiContract0053
     * @tc.desc      UI contract Album.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('Album') >= 0).assertTrue();
      expect('Album'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0055
     * @tc.name      testExtYuvUiContract0054
     * @tc.desc      UI contract switchCameraBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('switchCameraBtn') >= 0).assertTrue();
      expect('switchCameraBtn'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0056
     * @tc.name      testExtYuvUiContract0055
     * @tc.desc      UI contract thumbnailUrl.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('thumbnailUrl') >= 0).assertTrue();
      expect('thumbnailUrl'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0057
     * @tc.name      testExtYuvUiContract0056
     * @tc.desc      UI contract flashBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('flashBtn') >= 0).assertTrue();
      expect('flashBtn'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0058
     * @tc.name      testExtYuvUiContract0057
     * @tc.desc      UI contract photoModeBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('photoModeBtn') >= 0).assertTrue();
      expect('photoModeBtn'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0059
     * @tc.name      testExtYuvUiContract0058
     * @tc.desc      UI contract gridLineBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('gridLineBtn') >= 0).assertTrue();
      expect('gridLineBtn'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_YUV_CAMERA_EXT_UICONTRACT_0060
     * @tc.name      testExtYuvUiContract0059
     * @tc.desc      UI contract modeButton.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtYuvUiContract0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['TakePicture', 'Album', 'switchCameraBtn', 'thumbnailUrl', 'flashBtn', 'photoModeBtn', 'gridLineBtn', 'modeButton', 'cameraPreview', 'focusBox', 'zoom_1', 'zoom_5', 'zoom_10'];
      expect(ids.indexOf('modeButton') >= 0).assertTrue();
      expect('modeButton'.length).assertLarger(0);
    })
  });
}
