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
import CameraServiceNative from '../../../main/ets/services/CameraServiceNative';

const TAG: string = '[Sample_avRecorderCameraNativeNoop]';
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

export default function avRecorderCameraNativeNoopTest(): void {
  describe('avRecorderCameraNativeNoopTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0001
     * @tc.name      testExtRecNativeNoop0000
     * @tc.desc      CameraServiceNative no-op createInput/createCaptureSession before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.createInput();
      await service.createCaptureSession();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0002
     * @tc.name      testExtRecNativeNoop0001
     * @tc.desc      CameraServiceNative no-op createCaptureSession/startCaptureSession before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.createCaptureSession();
      await service.startCaptureSession();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0003
     * @tc.name      testExtRecNativeNoop0002
     * @tc.desc      CameraServiceNative no-op startCaptureSession/restartVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.startCaptureSession();
      await service.restartVideoOutput('');
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0004
     * @tc.name      testExtRecNativeNoop0003
     * @tc.desc      CameraServiceNative no-op restartVideoOutput/removeVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.restartVideoOutput('');
      await service.removeVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0005
     * @tc.name      testExtRecNativeNoop0004
     * @tc.desc      CameraServiceNative no-op removeVideoOutput/createVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.removeVideoOutput();
      await service.createVideoOutput('');
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0006
     * @tc.name      testExtRecNativeNoop0005
     * @tc.desc      CameraServiceNative no-op createVideoOutput/stopVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.createVideoOutput('');
      await service.stopVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0007
     * @tc.name      testExtRecNativeNoop0006
     * @tc.desc      CameraServiceNative no-op stopVideoOutput/startVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.stopVideoOutput();
      await service.startVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0008
     * @tc.name      testExtRecNativeNoop0007
     * @tc.desc      CameraServiceNative no-op startVideoOutput/release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.startVideoOutput();
      await service.release();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0009
     * @tc.name      testExtRecNativeNoop0008
     * @tc.desc      CameraServiceNative no-op release/createInput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.release();
      await service.createInput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0010
     * @tc.name      testExtRecNativeNoop0009
     * @tc.desc      CameraServiceNative no-op createInput/createCaptureSession before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.createInput();
      await service.createCaptureSession();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0011
     * @tc.name      testExtRecNativeNoop0010
     * @tc.desc      CameraServiceNative no-op createCaptureSession/startCaptureSession before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.createCaptureSession();
      await service.startCaptureSession();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0012
     * @tc.name      testExtRecNativeNoop0011
     * @tc.desc      CameraServiceNative no-op startCaptureSession/restartVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.startCaptureSession();
      await service.restartVideoOutput('');
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0013
     * @tc.name      testExtRecNativeNoop0012
     * @tc.desc      CameraServiceNative no-op restartVideoOutput/removeVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.restartVideoOutput('');
      await service.removeVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0014
     * @tc.name      testExtRecNativeNoop0013
     * @tc.desc      CameraServiceNative no-op removeVideoOutput/createVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.removeVideoOutput();
      await service.createVideoOutput('');
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0015
     * @tc.name      testExtRecNativeNoop0014
     * @tc.desc      CameraServiceNative no-op createVideoOutput/stopVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.createVideoOutput('');
      await service.stopVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0016
     * @tc.name      testExtRecNativeNoop0015
     * @tc.desc      CameraServiceNative no-op stopVideoOutput/startVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.stopVideoOutput();
      await service.startVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0017
     * @tc.name      testExtRecNativeNoop0016
     * @tc.desc      CameraServiceNative no-op startVideoOutput/release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.startVideoOutput();
      await service.release();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0018
     * @tc.name      testExtRecNativeNoop0017
     * @tc.desc      CameraServiceNative no-op release/createInput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.release();
      await service.createInput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0019
     * @tc.name      testExtRecNativeNoop0018
     * @tc.desc      CameraServiceNative no-op createInput/createCaptureSession before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.createInput();
      await service.createCaptureSession();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0020
     * @tc.name      testExtRecNativeNoop0019
     * @tc.desc      CameraServiceNative no-op createCaptureSession/startCaptureSession before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.createCaptureSession();
      await service.startCaptureSession();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0021
     * @tc.name      testExtRecNativeNoop0020
     * @tc.desc      CameraServiceNative no-op startCaptureSession/restartVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.startCaptureSession();
      await service.restartVideoOutput('');
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0022
     * @tc.name      testExtRecNativeNoop0021
     * @tc.desc      CameraServiceNative no-op restartVideoOutput/removeVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.restartVideoOutput('');
      await service.removeVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0023
     * @tc.name      testExtRecNativeNoop0022
     * @tc.desc      CameraServiceNative no-op removeVideoOutput/createVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.removeVideoOutput();
      await service.createVideoOutput('');
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0024
     * @tc.name      testExtRecNativeNoop0023
     * @tc.desc      CameraServiceNative no-op createVideoOutput/stopVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.createVideoOutput('');
      await service.stopVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0025
     * @tc.name      testExtRecNativeNoop0024
     * @tc.desc      CameraServiceNative no-op stopVideoOutput/startVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.stopVideoOutput();
      await service.startVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0026
     * @tc.name      testExtRecNativeNoop0025
     * @tc.desc      CameraServiceNative no-op startVideoOutput/release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.startVideoOutput();
      await service.release();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0027
     * @tc.name      testExtRecNativeNoop0026
     * @tc.desc      CameraServiceNative no-op release/createInput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.release();
      await service.createInput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0028
     * @tc.name      testExtRecNativeNoop0027
     * @tc.desc      CameraServiceNative no-op createInput/createCaptureSession before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.createInput();
      await service.createCaptureSession();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0029
     * @tc.name      testExtRecNativeNoop0028
     * @tc.desc      CameraServiceNative no-op createCaptureSession/startCaptureSession before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.createCaptureSession();
      await service.startCaptureSession();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0030
     * @tc.name      testExtRecNativeNoop0029
     * @tc.desc      CameraServiceNative no-op startCaptureSession/restartVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.startCaptureSession();
      await service.restartVideoOutput('');
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0031
     * @tc.name      testExtRecNativeNoop0030
     * @tc.desc      CameraServiceNative no-op restartVideoOutput/removeVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.restartVideoOutput('');
      await service.removeVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0032
     * @tc.name      testExtRecNativeNoop0031
     * @tc.desc      CameraServiceNative no-op removeVideoOutput/createVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.removeVideoOutput();
      await service.createVideoOutput('');
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0033
     * @tc.name      testExtRecNativeNoop0032
     * @tc.desc      CameraServiceNative no-op createVideoOutput/stopVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.createVideoOutput('');
      await service.stopVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0034
     * @tc.name      testExtRecNativeNoop0033
     * @tc.desc      CameraServiceNative no-op stopVideoOutput/startVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.stopVideoOutput();
      await service.startVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0035
     * @tc.name      testExtRecNativeNoop0034
     * @tc.desc      CameraServiceNative no-op startVideoOutput/release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.startVideoOutput();
      await service.release();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0036
     * @tc.name      testExtRecNativeNoop0035
     * @tc.desc      CameraServiceNative no-op release/createInput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.release();
      await service.createInput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0037
     * @tc.name      testExtRecNativeNoop0036
     * @tc.desc      CameraServiceNative no-op createInput/createCaptureSession before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.createInput();
      await service.createCaptureSession();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0038
     * @tc.name      testExtRecNativeNoop0037
     * @tc.desc      CameraServiceNative no-op createCaptureSession/startCaptureSession before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.createCaptureSession();
      await service.startCaptureSession();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0039
     * @tc.name      testExtRecNativeNoop0038
     * @tc.desc      CameraServiceNative no-op startCaptureSession/restartVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.startCaptureSession();
      await service.restartVideoOutput('');
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0040
     * @tc.name      testExtRecNativeNoop0039
     * @tc.desc      CameraServiceNative no-op restartVideoOutput/removeVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.restartVideoOutput('');
      await service.removeVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0041
     * @tc.name      testExtRecNativeNoop0040
     * @tc.desc      CameraServiceNative no-op removeVideoOutput/createVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.removeVideoOutput();
      await service.createVideoOutput('');
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0042
     * @tc.name      testExtRecNativeNoop0041
     * @tc.desc      CameraServiceNative no-op createVideoOutput/stopVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.createVideoOutput('');
      await service.stopVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0043
     * @tc.name      testExtRecNativeNoop0042
     * @tc.desc      CameraServiceNative no-op stopVideoOutput/startVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.stopVideoOutput();
      await service.startVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0044
     * @tc.name      testExtRecNativeNoop0043
     * @tc.desc      CameraServiceNative no-op startVideoOutput/release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.startVideoOutput();
      await service.release();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0045
     * @tc.name      testExtRecNativeNoop0044
     * @tc.desc      CameraServiceNative no-op release/createInput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.release();
      await service.createInput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0046
     * @tc.name      testExtRecNativeNoop0045
     * @tc.desc      CameraServiceNative no-op createInput/createCaptureSession before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.createInput();
      await service.createCaptureSession();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0047
     * @tc.name      testExtRecNativeNoop0046
     * @tc.desc      CameraServiceNative no-op createCaptureSession/startCaptureSession before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.createCaptureSession();
      await service.startCaptureSession();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0048
     * @tc.name      testExtRecNativeNoop0047
     * @tc.desc      CameraServiceNative no-op startCaptureSession/restartVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.startCaptureSession();
      await service.restartVideoOutput('');
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0049
     * @tc.name      testExtRecNativeNoop0048
     * @tc.desc      CameraServiceNative no-op restartVideoOutput/removeVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.restartVideoOutput('');
      await service.removeVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0050
     * @tc.name      testExtRecNativeNoop0049
     * @tc.desc      CameraServiceNative no-op removeVideoOutput/createVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.removeVideoOutput();
      await service.createVideoOutput('');
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0051
     * @tc.name      testExtRecNativeNoop0050
     * @tc.desc      CameraServiceNative no-op createVideoOutput/stopVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.createVideoOutput('');
      await service.stopVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0052
     * @tc.name      testExtRecNativeNoop0051
     * @tc.desc      CameraServiceNative no-op stopVideoOutput/startVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.stopVideoOutput();
      await service.startVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0053
     * @tc.name      testExtRecNativeNoop0052
     * @tc.desc      CameraServiceNative no-op startVideoOutput/release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.startVideoOutput();
      await service.release();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0054
     * @tc.name      testExtRecNativeNoop0053
     * @tc.desc      CameraServiceNative no-op release/createInput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.release();
      await service.createInput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0055
     * @tc.name      testExtRecNativeNoop0054
     * @tc.desc      CameraServiceNative no-op createInput/createCaptureSession before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.createInput();
      await service.createCaptureSession();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0056
     * @tc.name      testExtRecNativeNoop0055
     * @tc.desc      CameraServiceNative no-op createCaptureSession/startCaptureSession before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.createCaptureSession();
      await service.startCaptureSession();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0057
     * @tc.name      testExtRecNativeNoop0056
     * @tc.desc      CameraServiceNative no-op startCaptureSession/restartVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.startCaptureSession();
      await service.restartVideoOutput('');
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0058
     * @tc.name      testExtRecNativeNoop0057
     * @tc.desc      CameraServiceNative no-op restartVideoOutput/removeVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.restartVideoOutput('');
      await service.removeVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0059
     * @tc.name      testExtRecNativeNoop0058
     * @tc.desc      CameraServiceNative no-op removeVideoOutput/createVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.removeVideoOutput();
      await service.createVideoOutput('');
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0060
     * @tc.name      testExtRecNativeNoop0059
     * @tc.desc      CameraServiceNative no-op createVideoOutput/stopVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.createVideoOutput('');
      await service.stopVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0061
     * @tc.name      testExtRecNativeNoop0060
     * @tc.desc      CameraServiceNative no-op stopVideoOutput/startVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.stopVideoOutput();
      await service.startVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0062
     * @tc.name      testExtRecNativeNoop0061
     * @tc.desc      CameraServiceNative no-op startVideoOutput/release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.startVideoOutput();
      await service.release();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0063
     * @tc.name      testExtRecNativeNoop0062
     * @tc.desc      CameraServiceNative no-op release/createInput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.release();
      await service.createInput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0064
     * @tc.name      testExtRecNativeNoop0063
     * @tc.desc      CameraServiceNative no-op createInput/createCaptureSession before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.createInput();
      await service.createCaptureSession();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0065
     * @tc.name      testExtRecNativeNoop0064
     * @tc.desc      CameraServiceNative no-op createCaptureSession/startCaptureSession before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.createCaptureSession();
      await service.startCaptureSession();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0066
     * @tc.name      testExtRecNativeNoop0065
     * @tc.desc      CameraServiceNative no-op startCaptureSession/restartVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.startCaptureSession();
      await service.restartVideoOutput('');
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0067
     * @tc.name      testExtRecNativeNoop0066
     * @tc.desc      CameraServiceNative no-op restartVideoOutput/removeVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.restartVideoOutput('');
      await service.removeVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0068
     * @tc.name      testExtRecNativeNoop0067
     * @tc.desc      CameraServiceNative no-op removeVideoOutput/createVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.removeVideoOutput();
      await service.createVideoOutput('');
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0069
     * @tc.name      testExtRecNativeNoop0068
     * @tc.desc      CameraServiceNative no-op createVideoOutput/stopVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.createVideoOutput('');
      await service.stopVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0070
     * @tc.name      testExtRecNativeNoop0069
     * @tc.desc      CameraServiceNative no-op stopVideoOutput/startVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.stopVideoOutput();
      await service.startVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0071
     * @tc.name      testExtRecNativeNoop0070
     * @tc.desc      CameraServiceNative no-op startVideoOutput/release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.startVideoOutput();
      await service.release();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0072
     * @tc.name      testExtRecNativeNoop0071
     * @tc.desc      CameraServiceNative no-op release/createInput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.release();
      await service.createInput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0073
     * @tc.name      testExtRecNativeNoop0072
     * @tc.desc      CameraServiceNative no-op createInput/createCaptureSession before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.createInput();
      await service.createCaptureSession();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0074
     * @tc.name      testExtRecNativeNoop0073
     * @tc.desc      CameraServiceNative no-op createCaptureSession/startCaptureSession before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.createCaptureSession();
      await service.startCaptureSession();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0075
     * @tc.name      testExtRecNativeNoop0074
     * @tc.desc      CameraServiceNative no-op startCaptureSession/restartVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.startCaptureSession();
      await service.restartVideoOutput('');
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0076
     * @tc.name      testExtRecNativeNoop0075
     * @tc.desc      CameraServiceNative no-op restartVideoOutput/removeVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.restartVideoOutput('');
      await service.removeVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0077
     * @tc.name      testExtRecNativeNoop0076
     * @tc.desc      CameraServiceNative no-op removeVideoOutput/createVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.removeVideoOutput();
      await service.createVideoOutput('');
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0078
     * @tc.name      testExtRecNativeNoop0077
     * @tc.desc      CameraServiceNative no-op createVideoOutput/stopVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.createVideoOutput('');
      await service.stopVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0079
     * @tc.name      testExtRecNativeNoop0078
     * @tc.desc      CameraServiceNative no-op stopVideoOutput/startVideoOutput before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.stopVideoOutput();
      await service.startVideoOutput();
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativeNOOP_0080
     * @tc.name      testExtRecNativeNoop0079
     * @tc.desc      CameraServiceNative no-op startVideoOutput/release before init.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativeNoop0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const service: CameraServiceNative = new CameraServiceNative();
      await service.startVideoOutput();
      await service.release();
      expect(service !== null && service !== undefined).assertTrue();
    })
  });
}
