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
import CameraService from '../../../main/ets/services/CameraService';

const TAG: string = '[Sample_avRecorderCameraServiceNoop]';
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

export default function avRecorderCameraServiceNoopTest(): void {
  describe('avRecorderCameraServiceNoopTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0001
     * @tc.name      testExtRecCamNoop0000
     * @tc.desc      CameraService no-op createInput/createCaptureSession before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.createInput();
      await service.createCaptureSession();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0002
     * @tc.name      testExtRecCamNoop0001
     * @tc.desc      CameraService no-op createCaptureSession/startCaptureSession before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.createCaptureSession();
      await service.startCaptureSession();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0003
     * @tc.name      testExtRecCamNoop0002
     * @tc.desc      CameraService no-op startCaptureSession/restartVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.startCaptureSession();
      await service.restartVideoOutput('');
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0004
     * @tc.name      testExtRecCamNoop0003
     * @tc.desc      CameraService no-op restartVideoOutput/removeVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.restartVideoOutput('');
      await service.removeVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0005
     * @tc.name      testExtRecCamNoop0004
     * @tc.desc      CameraService no-op removeVideoOutput/createVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.removeVideoOutput();
      await service.createVideoOutput('');
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0006
     * @tc.name      testExtRecCamNoop0005
     * @tc.desc      CameraService no-op createVideoOutput/stopVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.createVideoOutput('');
      await service.stopVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0007
     * @tc.name      testExtRecCamNoop0006
     * @tc.desc      CameraService no-op stopVideoOutput/startVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.stopVideoOutput();
      await service.startVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0008
     * @tc.name      testExtRecCamNoop0007
     * @tc.desc      CameraService no-op startVideoOutput/release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.startVideoOutput();
      await service.release();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0009
     * @tc.name      testExtRecCamNoop0008
     * @tc.desc      CameraService no-op release/createInput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.release();
      await service.createInput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0010
     * @tc.name      testExtRecCamNoop0009
     * @tc.desc      CameraService no-op createInput/createCaptureSession before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.createInput();
      await service.createCaptureSession();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0011
     * @tc.name      testExtRecCamNoop0010
     * @tc.desc      CameraService no-op createCaptureSession/startCaptureSession before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.createCaptureSession();
      await service.startCaptureSession();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0012
     * @tc.name      testExtRecCamNoop0011
     * @tc.desc      CameraService no-op startCaptureSession/restartVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.startCaptureSession();
      await service.restartVideoOutput('');
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0013
     * @tc.name      testExtRecCamNoop0012
     * @tc.desc      CameraService no-op restartVideoOutput/removeVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.restartVideoOutput('');
      await service.removeVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0014
     * @tc.name      testExtRecCamNoop0013
     * @tc.desc      CameraService no-op removeVideoOutput/createVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.removeVideoOutput();
      await service.createVideoOutput('');
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0015
     * @tc.name      testExtRecCamNoop0014
     * @tc.desc      CameraService no-op createVideoOutput/stopVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.createVideoOutput('');
      await service.stopVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0016
     * @tc.name      testExtRecCamNoop0015
     * @tc.desc      CameraService no-op stopVideoOutput/startVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.stopVideoOutput();
      await service.startVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0017
     * @tc.name      testExtRecCamNoop0016
     * @tc.desc      CameraService no-op startVideoOutput/release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.startVideoOutput();
      await service.release();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0018
     * @tc.name      testExtRecCamNoop0017
     * @tc.desc      CameraService no-op release/createInput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.release();
      await service.createInput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0019
     * @tc.name      testExtRecCamNoop0018
     * @tc.desc      CameraService no-op createInput/createCaptureSession before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.createInput();
      await service.createCaptureSession();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0020
     * @tc.name      testExtRecCamNoop0019
     * @tc.desc      CameraService no-op createCaptureSession/startCaptureSession before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.createCaptureSession();
      await service.startCaptureSession();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0021
     * @tc.name      testExtRecCamNoop0020
     * @tc.desc      CameraService no-op startCaptureSession/restartVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.startCaptureSession();
      await service.restartVideoOutput('');
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0022
     * @tc.name      testExtRecCamNoop0021
     * @tc.desc      CameraService no-op restartVideoOutput/removeVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.restartVideoOutput('');
      await service.removeVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0023
     * @tc.name      testExtRecCamNoop0022
     * @tc.desc      CameraService no-op removeVideoOutput/createVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.removeVideoOutput();
      await service.createVideoOutput('');
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0024
     * @tc.name      testExtRecCamNoop0023
     * @tc.desc      CameraService no-op createVideoOutput/stopVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.createVideoOutput('');
      await service.stopVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0025
     * @tc.name      testExtRecCamNoop0024
     * @tc.desc      CameraService no-op stopVideoOutput/startVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.stopVideoOutput();
      await service.startVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0026
     * @tc.name      testExtRecCamNoop0025
     * @tc.desc      CameraService no-op startVideoOutput/release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.startVideoOutput();
      await service.release();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0027
     * @tc.name      testExtRecCamNoop0026
     * @tc.desc      CameraService no-op release/createInput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.release();
      await service.createInput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0028
     * @tc.name      testExtRecCamNoop0027
     * @tc.desc      CameraService no-op createInput/createCaptureSession before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.createInput();
      await service.createCaptureSession();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0029
     * @tc.name      testExtRecCamNoop0028
     * @tc.desc      CameraService no-op createCaptureSession/startCaptureSession before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.createCaptureSession();
      await service.startCaptureSession();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0030
     * @tc.name      testExtRecCamNoop0029
     * @tc.desc      CameraService no-op startCaptureSession/restartVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.startCaptureSession();
      await service.restartVideoOutput('');
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0031
     * @tc.name      testExtRecCamNoop0030
     * @tc.desc      CameraService no-op restartVideoOutput/removeVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.restartVideoOutput('');
      await service.removeVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0032
     * @tc.name      testExtRecCamNoop0031
     * @tc.desc      CameraService no-op removeVideoOutput/createVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.removeVideoOutput();
      await service.createVideoOutput('');
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0033
     * @tc.name      testExtRecCamNoop0032
     * @tc.desc      CameraService no-op createVideoOutput/stopVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.createVideoOutput('');
      await service.stopVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0034
     * @tc.name      testExtRecCamNoop0033
     * @tc.desc      CameraService no-op stopVideoOutput/startVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.stopVideoOutput();
      await service.startVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0035
     * @tc.name      testExtRecCamNoop0034
     * @tc.desc      CameraService no-op startVideoOutput/release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.startVideoOutput();
      await service.release();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0036
     * @tc.name      testExtRecCamNoop0035
     * @tc.desc      CameraService no-op release/createInput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.release();
      await service.createInput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0037
     * @tc.name      testExtRecCamNoop0036
     * @tc.desc      CameraService no-op createInput/createCaptureSession before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.createInput();
      await service.createCaptureSession();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0038
     * @tc.name      testExtRecCamNoop0037
     * @tc.desc      CameraService no-op createCaptureSession/startCaptureSession before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.createCaptureSession();
      await service.startCaptureSession();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0039
     * @tc.name      testExtRecCamNoop0038
     * @tc.desc      CameraService no-op startCaptureSession/restartVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.startCaptureSession();
      await service.restartVideoOutput('');
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0040
     * @tc.name      testExtRecCamNoop0039
     * @tc.desc      CameraService no-op restartVideoOutput/removeVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.restartVideoOutput('');
      await service.removeVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0041
     * @tc.name      testExtRecCamNoop0040
     * @tc.desc      CameraService no-op removeVideoOutput/createVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.removeVideoOutput();
      await service.createVideoOutput('');
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0042
     * @tc.name      testExtRecCamNoop0041
     * @tc.desc      CameraService no-op createVideoOutput/stopVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.createVideoOutput('');
      await service.stopVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0043
     * @tc.name      testExtRecCamNoop0042
     * @tc.desc      CameraService no-op stopVideoOutput/startVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.stopVideoOutput();
      await service.startVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0044
     * @tc.name      testExtRecCamNoop0043
     * @tc.desc      CameraService no-op startVideoOutput/release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.startVideoOutput();
      await service.release();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0045
     * @tc.name      testExtRecCamNoop0044
     * @tc.desc      CameraService no-op release/createInput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.release();
      await service.createInput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0046
     * @tc.name      testExtRecCamNoop0045
     * @tc.desc      CameraService no-op createInput/createCaptureSession before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.createInput();
      await service.createCaptureSession();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0047
     * @tc.name      testExtRecCamNoop0046
     * @tc.desc      CameraService no-op createCaptureSession/startCaptureSession before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.createCaptureSession();
      await service.startCaptureSession();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0048
     * @tc.name      testExtRecCamNoop0047
     * @tc.desc      CameraService no-op startCaptureSession/restartVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.startCaptureSession();
      await service.restartVideoOutput('');
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0049
     * @tc.name      testExtRecCamNoop0048
     * @tc.desc      CameraService no-op restartVideoOutput/removeVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.restartVideoOutput('');
      await service.removeVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0050
     * @tc.name      testExtRecCamNoop0049
     * @tc.desc      CameraService no-op removeVideoOutput/createVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.removeVideoOutput();
      await service.createVideoOutput('');
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0051
     * @tc.name      testExtRecCamNoop0050
     * @tc.desc      CameraService no-op createVideoOutput/stopVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.createVideoOutput('');
      await service.stopVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0052
     * @tc.name      testExtRecCamNoop0051
     * @tc.desc      CameraService no-op stopVideoOutput/startVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.stopVideoOutput();
      await service.startVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0053
     * @tc.name      testExtRecCamNoop0052
     * @tc.desc      CameraService no-op startVideoOutput/release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.startVideoOutput();
      await service.release();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0054
     * @tc.name      testExtRecCamNoop0053
     * @tc.desc      CameraService no-op release/createInput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.release();
      await service.createInput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0055
     * @tc.name      testExtRecCamNoop0054
     * @tc.desc      CameraService no-op createInput/createCaptureSession before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.createInput();
      await service.createCaptureSession();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0056
     * @tc.name      testExtRecCamNoop0055
     * @tc.desc      CameraService no-op createCaptureSession/startCaptureSession before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.createCaptureSession();
      await service.startCaptureSession();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0057
     * @tc.name      testExtRecCamNoop0056
     * @tc.desc      CameraService no-op startCaptureSession/restartVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.startCaptureSession();
      await service.restartVideoOutput('');
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0058
     * @tc.name      testExtRecCamNoop0057
     * @tc.desc      CameraService no-op restartVideoOutput/removeVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.restartVideoOutput('');
      await service.removeVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0059
     * @tc.name      testExtRecCamNoop0058
     * @tc.desc      CameraService no-op removeVideoOutput/createVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.removeVideoOutput();
      await service.createVideoOutput('');
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0060
     * @tc.name      testExtRecCamNoop0059
     * @tc.desc      CameraService no-op createVideoOutput/stopVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.createVideoOutput('');
      await service.stopVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0061
     * @tc.name      testExtRecCamNoop0060
     * @tc.desc      CameraService no-op stopVideoOutput/startVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.stopVideoOutput();
      await service.startVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0062
     * @tc.name      testExtRecCamNoop0061
     * @tc.desc      CameraService no-op startVideoOutput/release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.startVideoOutput();
      await service.release();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0063
     * @tc.name      testExtRecCamNoop0062
     * @tc.desc      CameraService no-op release/createInput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.release();
      await service.createInput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0064
     * @tc.name      testExtRecCamNoop0063
     * @tc.desc      CameraService no-op createInput/createCaptureSession before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.createInput();
      await service.createCaptureSession();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0065
     * @tc.name      testExtRecCamNoop0064
     * @tc.desc      CameraService no-op createCaptureSession/startCaptureSession before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.createCaptureSession();
      await service.startCaptureSession();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0066
     * @tc.name      testExtRecCamNoop0065
     * @tc.desc      CameraService no-op startCaptureSession/restartVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.startCaptureSession();
      await service.restartVideoOutput('');
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0067
     * @tc.name      testExtRecCamNoop0066
     * @tc.desc      CameraService no-op restartVideoOutput/removeVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.restartVideoOutput('');
      await service.removeVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0068
     * @tc.name      testExtRecCamNoop0067
     * @tc.desc      CameraService no-op removeVideoOutput/createVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.removeVideoOutput();
      await service.createVideoOutput('');
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0069
     * @tc.name      testExtRecCamNoop0068
     * @tc.desc      CameraService no-op createVideoOutput/stopVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.createVideoOutput('');
      await service.stopVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0070
     * @tc.name      testExtRecCamNoop0069
     * @tc.desc      CameraService no-op stopVideoOutput/startVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.stopVideoOutput();
      await service.startVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0071
     * @tc.name      testExtRecCamNoop0070
     * @tc.desc      CameraService no-op startVideoOutput/release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.startVideoOutput();
      await service.release();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0072
     * @tc.name      testExtRecCamNoop0071
     * @tc.desc      CameraService no-op release/createInput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.release();
      await service.createInput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0073
     * @tc.name      testExtRecCamNoop0072
     * @tc.desc      CameraService no-op createInput/createCaptureSession before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.createInput();
      await service.createCaptureSession();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0074
     * @tc.name      testExtRecCamNoop0073
     * @tc.desc      CameraService no-op createCaptureSession/startCaptureSession before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.createCaptureSession();
      await service.startCaptureSession();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0075
     * @tc.name      testExtRecCamNoop0074
     * @tc.desc      CameraService no-op startCaptureSession/restartVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.startCaptureSession();
      await service.restartVideoOutput('');
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0076
     * @tc.name      testExtRecCamNoop0075
     * @tc.desc      CameraService no-op restartVideoOutput/removeVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.restartVideoOutput('');
      await service.removeVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0077
     * @tc.name      testExtRecCamNoop0076
     * @tc.desc      CameraService no-op removeVideoOutput/createVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.removeVideoOutput();
      await service.createVideoOutput('');
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0078
     * @tc.name      testExtRecCamNoop0077
     * @tc.desc      CameraService no-op createVideoOutput/stopVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.createVideoOutput('');
      await service.stopVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0079
     * @tc.name      testExtRecCamNoop0078
     * @tc.desc      CameraService no-op stopVideoOutput/startVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.stopVideoOutput();
      await service.startVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMNOOP_0080
     * @tc.name      testExtRecCamNoop0079
     * @tc.desc      CameraService no-op startVideoOutput/release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamNoop0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraService = new CameraService();
      await service.startVideoOutput();
      await service.release();
      expect(service !== null && service !== undefined).assertTrue();
    })
  });
}
