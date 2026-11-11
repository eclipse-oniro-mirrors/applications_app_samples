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
import CameraServiceNDK from '../../../main/ets/services/CameraServiceNDK';

const TAG: string = '[Sample_avRecorderCameraNDKNoop]';
const DOMAIN: number = 0xF811;

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

export default function avRecorderCameraNDKNoopTest(): void {
  describe('avRecorderCameraNDKNoopTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0001
     * @tc.name      testExtRecNdkNoop0000
     * @tc.desc      CameraServiceNDK no-op createInput/createCaptureSession before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.createInput();
      await service.createCaptureSession();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0002
     * @tc.name      testExtRecNdkNoop0001
     * @tc.desc      CameraServiceNDK no-op createCaptureSession/startCaptureSession before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.createCaptureSession();
      await service.startCaptureSession();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0003
     * @tc.name      testExtRecNdkNoop0002
     * @tc.desc      CameraServiceNDK no-op startCaptureSession/restartVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.startCaptureSession();
      await service.restartVideoOutput('');
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0004
     * @tc.name      testExtRecNdkNoop0003
     * @tc.desc      CameraServiceNDK no-op restartVideoOutput/removeVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.restartVideoOutput('');
      await service.removeVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0005
     * @tc.name      testExtRecNdkNoop0004
     * @tc.desc      CameraServiceNDK no-op removeVideoOutput/createVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.removeVideoOutput();
      await service.createVideoOutput('');
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0006
     * @tc.name      testExtRecNdkNoop0005
     * @tc.desc      CameraServiceNDK no-op createVideoOutput/stopVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.createVideoOutput('');
      await service.stopVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0007
     * @tc.name      testExtRecNdkNoop0006
     * @tc.desc      CameraServiceNDK no-op stopVideoOutput/startVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.stopVideoOutput();
      await service.startVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0008
     * @tc.name      testExtRecNdkNoop0007
     * @tc.desc      CameraServiceNDK no-op startVideoOutput/release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.startVideoOutput();
      await service.release();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0009
     * @tc.name      testExtRecNdkNoop0008
     * @tc.desc      CameraServiceNDK no-op release/createInput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.release();
      await service.createInput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0010
     * @tc.name      testExtRecNdkNoop0009
     * @tc.desc      CameraServiceNDK no-op createInput/createCaptureSession before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.createInput();
      await service.createCaptureSession();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0011
     * @tc.name      testExtRecNdkNoop0010
     * @tc.desc      CameraServiceNDK no-op createCaptureSession/startCaptureSession before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.createCaptureSession();
      await service.startCaptureSession();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0012
     * @tc.name      testExtRecNdkNoop0011
     * @tc.desc      CameraServiceNDK no-op startCaptureSession/restartVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.startCaptureSession();
      await service.restartVideoOutput('');
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0013
     * @tc.name      testExtRecNdkNoop0012
     * @tc.desc      CameraServiceNDK no-op restartVideoOutput/removeVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.restartVideoOutput('');
      await service.removeVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0014
     * @tc.name      testExtRecNdkNoop0013
     * @tc.desc      CameraServiceNDK no-op removeVideoOutput/createVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.removeVideoOutput();
      await service.createVideoOutput('');
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0015
     * @tc.name      testExtRecNdkNoop0014
     * @tc.desc      CameraServiceNDK no-op createVideoOutput/stopVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.createVideoOutput('');
      await service.stopVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0016
     * @tc.name      testExtRecNdkNoop0015
     * @tc.desc      CameraServiceNDK no-op stopVideoOutput/startVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.stopVideoOutput();
      await service.startVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0017
     * @tc.name      testExtRecNdkNoop0016
     * @tc.desc      CameraServiceNDK no-op startVideoOutput/release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.startVideoOutput();
      await service.release();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0018
     * @tc.name      testExtRecNdkNoop0017
     * @tc.desc      CameraServiceNDK no-op release/createInput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.release();
      await service.createInput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0019
     * @tc.name      testExtRecNdkNoop0018
     * @tc.desc      CameraServiceNDK no-op createInput/createCaptureSession before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.createInput();
      await service.createCaptureSession();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0020
     * @tc.name      testExtRecNdkNoop0019
     * @tc.desc      CameraServiceNDK no-op createCaptureSession/startCaptureSession before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.createCaptureSession();
      await service.startCaptureSession();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0021
     * @tc.name      testExtRecNdkNoop0020
     * @tc.desc      CameraServiceNDK no-op startCaptureSession/restartVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.startCaptureSession();
      await service.restartVideoOutput('');
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0022
     * @tc.name      testExtRecNdkNoop0021
     * @tc.desc      CameraServiceNDK no-op restartVideoOutput/removeVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.restartVideoOutput('');
      await service.removeVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0023
     * @tc.name      testExtRecNdkNoop0022
     * @tc.desc      CameraServiceNDK no-op removeVideoOutput/createVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.removeVideoOutput();
      await service.createVideoOutput('');
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0024
     * @tc.name      testExtRecNdkNoop0023
     * @tc.desc      CameraServiceNDK no-op createVideoOutput/stopVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.createVideoOutput('');
      await service.stopVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0025
     * @tc.name      testExtRecNdkNoop0024
     * @tc.desc      CameraServiceNDK no-op stopVideoOutput/startVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.stopVideoOutput();
      await service.startVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0026
     * @tc.name      testExtRecNdkNoop0025
     * @tc.desc      CameraServiceNDK no-op startVideoOutput/release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.startVideoOutput();
      await service.release();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0027
     * @tc.name      testExtRecNdkNoop0026
     * @tc.desc      CameraServiceNDK no-op release/createInput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.release();
      await service.createInput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0028
     * @tc.name      testExtRecNdkNoop0027
     * @tc.desc      CameraServiceNDK no-op createInput/createCaptureSession before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.createInput();
      await service.createCaptureSession();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0029
     * @tc.name      testExtRecNdkNoop0028
     * @tc.desc      CameraServiceNDK no-op createCaptureSession/startCaptureSession before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.createCaptureSession();
      await service.startCaptureSession();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0030
     * @tc.name      testExtRecNdkNoop0029
     * @tc.desc      CameraServiceNDK no-op startCaptureSession/restartVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.startCaptureSession();
      await service.restartVideoOutput('');
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0031
     * @tc.name      testExtRecNdkNoop0030
     * @tc.desc      CameraServiceNDK no-op restartVideoOutput/removeVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.restartVideoOutput('');
      await service.removeVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0032
     * @tc.name      testExtRecNdkNoop0031
     * @tc.desc      CameraServiceNDK no-op removeVideoOutput/createVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.removeVideoOutput();
      await service.createVideoOutput('');
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0033
     * @tc.name      testExtRecNdkNoop0032
     * @tc.desc      CameraServiceNDK no-op createVideoOutput/stopVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.createVideoOutput('');
      await service.stopVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0034
     * @tc.name      testExtRecNdkNoop0033
     * @tc.desc      CameraServiceNDK no-op stopVideoOutput/startVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.stopVideoOutput();
      await service.startVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0035
     * @tc.name      testExtRecNdkNoop0034
     * @tc.desc      CameraServiceNDK no-op startVideoOutput/release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.startVideoOutput();
      await service.release();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0036
     * @tc.name      testExtRecNdkNoop0035
     * @tc.desc      CameraServiceNDK no-op release/createInput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.release();
      await service.createInput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0037
     * @tc.name      testExtRecNdkNoop0036
     * @tc.desc      CameraServiceNDK no-op createInput/createCaptureSession before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.createInput();
      await service.createCaptureSession();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0038
     * @tc.name      testExtRecNdkNoop0037
     * @tc.desc      CameraServiceNDK no-op createCaptureSession/startCaptureSession before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.createCaptureSession();
      await service.startCaptureSession();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0039
     * @tc.name      testExtRecNdkNoop0038
     * @tc.desc      CameraServiceNDK no-op startCaptureSession/restartVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.startCaptureSession();
      await service.restartVideoOutput('');
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0040
     * @tc.name      testExtRecNdkNoop0039
     * @tc.desc      CameraServiceNDK no-op restartVideoOutput/removeVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.restartVideoOutput('');
      await service.removeVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0041
     * @tc.name      testExtRecNdkNoop0040
     * @tc.desc      CameraServiceNDK no-op removeVideoOutput/createVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.removeVideoOutput();
      await service.createVideoOutput('');
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0042
     * @tc.name      testExtRecNdkNoop0041
     * @tc.desc      CameraServiceNDK no-op createVideoOutput/stopVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.createVideoOutput('');
      await service.stopVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0043
     * @tc.name      testExtRecNdkNoop0042
     * @tc.desc      CameraServiceNDK no-op stopVideoOutput/startVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.stopVideoOutput();
      await service.startVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0044
     * @tc.name      testExtRecNdkNoop0043
     * @tc.desc      CameraServiceNDK no-op startVideoOutput/release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.startVideoOutput();
      await service.release();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0045
     * @tc.name      testExtRecNdkNoop0044
     * @tc.desc      CameraServiceNDK no-op release/createInput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.release();
      await service.createInput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0046
     * @tc.name      testExtRecNdkNoop0045
     * @tc.desc      CameraServiceNDK no-op createInput/createCaptureSession before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.createInput();
      await service.createCaptureSession();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0047
     * @tc.name      testExtRecNdkNoop0046
     * @tc.desc      CameraServiceNDK no-op createCaptureSession/startCaptureSession before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.createCaptureSession();
      await service.startCaptureSession();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0048
     * @tc.name      testExtRecNdkNoop0047
     * @tc.desc      CameraServiceNDK no-op startCaptureSession/restartVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.startCaptureSession();
      await service.restartVideoOutput('');
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0049
     * @tc.name      testExtRecNdkNoop0048
     * @tc.desc      CameraServiceNDK no-op restartVideoOutput/removeVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.restartVideoOutput('');
      await service.removeVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0050
     * @tc.name      testExtRecNdkNoop0049
     * @tc.desc      CameraServiceNDK no-op removeVideoOutput/createVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.removeVideoOutput();
      await service.createVideoOutput('');
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0051
     * @tc.name      testExtRecNdkNoop0050
     * @tc.desc      CameraServiceNDK no-op createVideoOutput/stopVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.createVideoOutput('');
      await service.stopVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0052
     * @tc.name      testExtRecNdkNoop0051
     * @tc.desc      CameraServiceNDK no-op stopVideoOutput/startVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.stopVideoOutput();
      await service.startVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0053
     * @tc.name      testExtRecNdkNoop0052
     * @tc.desc      CameraServiceNDK no-op startVideoOutput/release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.startVideoOutput();
      await service.release();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0054
     * @tc.name      testExtRecNdkNoop0053
     * @tc.desc      CameraServiceNDK no-op release/createInput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.release();
      await service.createInput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0055
     * @tc.name      testExtRecNdkNoop0054
     * @tc.desc      CameraServiceNDK no-op createInput/createCaptureSession before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.createInput();
      await service.createCaptureSession();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0056
     * @tc.name      testExtRecNdkNoop0055
     * @tc.desc      CameraServiceNDK no-op createCaptureSession/startCaptureSession before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.createCaptureSession();
      await service.startCaptureSession();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0057
     * @tc.name      testExtRecNdkNoop0056
     * @tc.desc      CameraServiceNDK no-op startCaptureSession/restartVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.startCaptureSession();
      await service.restartVideoOutput('');
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0058
     * @tc.name      testExtRecNdkNoop0057
     * @tc.desc      CameraServiceNDK no-op restartVideoOutput/removeVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.restartVideoOutput('');
      await service.removeVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0059
     * @tc.name      testExtRecNdkNoop0058
     * @tc.desc      CameraServiceNDK no-op removeVideoOutput/createVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.removeVideoOutput();
      await service.createVideoOutput('');
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0060
     * @tc.name      testExtRecNdkNoop0059
     * @tc.desc      CameraServiceNDK no-op createVideoOutput/stopVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.createVideoOutput('');
      await service.stopVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0061
     * @tc.name      testExtRecNdkNoop0060
     * @tc.desc      CameraServiceNDK no-op stopVideoOutput/startVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.stopVideoOutput();
      await service.startVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0062
     * @tc.name      testExtRecNdkNoop0061
     * @tc.desc      CameraServiceNDK no-op startVideoOutput/release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.startVideoOutput();
      await service.release();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0063
     * @tc.name      testExtRecNdkNoop0062
     * @tc.desc      CameraServiceNDK no-op release/createInput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.release();
      await service.createInput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0064
     * @tc.name      testExtRecNdkNoop0063
     * @tc.desc      CameraServiceNDK no-op createInput/createCaptureSession before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.createInput();
      await service.createCaptureSession();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0065
     * @tc.name      testExtRecNdkNoop0064
     * @tc.desc      CameraServiceNDK no-op createCaptureSession/startCaptureSession before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.createCaptureSession();
      await service.startCaptureSession();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0066
     * @tc.name      testExtRecNdkNoop0065
     * @tc.desc      CameraServiceNDK no-op startCaptureSession/restartVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.startCaptureSession();
      await service.restartVideoOutput('');
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0067
     * @tc.name      testExtRecNdkNoop0066
     * @tc.desc      CameraServiceNDK no-op restartVideoOutput/removeVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.restartVideoOutput('');
      await service.removeVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0068
     * @tc.name      testExtRecNdkNoop0067
     * @tc.desc      CameraServiceNDK no-op removeVideoOutput/createVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.removeVideoOutput();
      await service.createVideoOutput('');
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0069
     * @tc.name      testExtRecNdkNoop0068
     * @tc.desc      CameraServiceNDK no-op createVideoOutput/stopVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.createVideoOutput('');
      await service.stopVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0070
     * @tc.name      testExtRecNdkNoop0069
     * @tc.desc      CameraServiceNDK no-op stopVideoOutput/startVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.stopVideoOutput();
      await service.startVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0071
     * @tc.name      testExtRecNdkNoop0070
     * @tc.desc      CameraServiceNDK no-op startVideoOutput/release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.startVideoOutput();
      await service.release();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0072
     * @tc.name      testExtRecNdkNoop0071
     * @tc.desc      CameraServiceNDK no-op release/createInput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.release();
      await service.createInput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0073
     * @tc.name      testExtRecNdkNoop0072
     * @tc.desc      CameraServiceNDK no-op createInput/createCaptureSession before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.createInput();
      await service.createCaptureSession();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0074
     * @tc.name      testExtRecNdkNoop0073
     * @tc.desc      CameraServiceNDK no-op createCaptureSession/startCaptureSession before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.createCaptureSession();
      await service.startCaptureSession();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0075
     * @tc.name      testExtRecNdkNoop0074
     * @tc.desc      CameraServiceNDK no-op startCaptureSession/restartVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.startCaptureSession();
      await service.restartVideoOutput('');
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0076
     * @tc.name      testExtRecNdkNoop0075
     * @tc.desc      CameraServiceNDK no-op restartVideoOutput/removeVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.restartVideoOutput('');
      await service.removeVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0077
     * @tc.name      testExtRecNdkNoop0076
     * @tc.desc      CameraServiceNDK no-op removeVideoOutput/createVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.removeVideoOutput();
      await service.createVideoOutput('');
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0078
     * @tc.name      testExtRecNdkNoop0077
     * @tc.desc      CameraServiceNDK no-op createVideoOutput/stopVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.createVideoOutput('');
      await service.stopVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0079
     * @tc.name      testExtRecNdkNoop0078
     * @tc.desc      CameraServiceNDK no-op stopVideoOutput/startVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.stopVideoOutput();
      await service.startVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKNOOP_0080
     * @tc.name      testExtRecNdkNoop0079
     * @tc.desc      CameraServiceNDK no-op startVideoOutput/release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkNoop0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNDK = new CameraServiceNDK();
      await service.startVideoOutput();
      await service.release();
      expect(service !== null && service !== undefined).assertTrue();
    })
  });
}
