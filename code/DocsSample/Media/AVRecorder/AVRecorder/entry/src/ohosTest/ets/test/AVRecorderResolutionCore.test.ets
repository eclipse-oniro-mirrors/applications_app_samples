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
import { Resolution } from '../../../main/ets/services/CommonTypes';

const TAG: string = '[Sample_avRecorderResolutionCore]';
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
  assertClose(expectValue: number, precision: number): void;
  assertUndefined(): void;
  assertFail(): void;
}

function expect(actual: string | number | boolean | Object | null | undefined): ExpectAssert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function avRecorderResolutionCoreTest(): void {
  describe('avRecorderResolutionCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RESOLUTION_0001
     * @tc.name      testExtRecResolution0000
     * @tc.desc      Resolution 640x480 stores dimensions.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecResolution0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      expect(resolution.frameWidth).assertEqual(640);
      expect(resolution.frameHeight).assertEqual(480);
      expect(resolution.frameWidth).assertLarger(0);
      expect(resolution.frameHeight).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RESOLUTION_0002
     * @tc.name      testExtRecResolution0001
     * @tc.desc      Resolution 1280x720 stores dimensions.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecResolution0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      resolution.frameWidth = 1280;
      resolution.frameHeight = 720;
      expect(resolution.frameWidth).assertEqual(1280);
      expect(resolution.frameHeight).assertEqual(720);
      expect(resolution.frameWidth).assertLarger(0);
      expect(resolution.frameHeight).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RESOLUTION_0003
     * @tc.name      testExtRecResolution0002
     * @tc.desc      Resolution 1920x1080 stores dimensions.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecResolution0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      resolution.frameWidth = 1920;
      resolution.frameHeight = 1080;
      expect(resolution.frameWidth).assertEqual(1920);
      expect(resolution.frameHeight).assertEqual(1080);
      expect(resolution.frameWidth).assertLarger(0);
      expect(resolution.frameHeight).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RESOLUTION_0004
     * @tc.name      testExtRecResolution0003
     * @tc.desc      Resolution 3840x2160 stores dimensions.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecResolution0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      resolution.frameWidth = 3840;
      resolution.frameHeight = 2160;
      expect(resolution.frameWidth).assertEqual(3840);
      expect(resolution.frameHeight).assertEqual(2160);
      expect(resolution.frameWidth).assertLarger(0);
      expect(resolution.frameHeight).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RESOLUTION_0005
     * @tc.name      testExtRecResolution0004
     * @tc.desc      Resolution 640x480 stores dimensions.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecResolution0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      expect(resolution.frameWidth).assertEqual(640);
      expect(resolution.frameHeight).assertEqual(480);
      expect(resolution.frameWidth).assertLarger(0);
      expect(resolution.frameHeight).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RESOLUTION_0006
     * @tc.name      testExtRecResolution0005
     * @tc.desc      Resolution 1280x720 stores dimensions.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecResolution0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      resolution.frameWidth = 1280;
      resolution.frameHeight = 720;
      expect(resolution.frameWidth).assertEqual(1280);
      expect(resolution.frameHeight).assertEqual(720);
      expect(resolution.frameWidth).assertLarger(0);
      expect(resolution.frameHeight).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RESOLUTION_0007
     * @tc.name      testExtRecResolution0006
     * @tc.desc      Resolution 1920x1080 stores dimensions.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecResolution0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      resolution.frameWidth = 1920;
      resolution.frameHeight = 1080;
      expect(resolution.frameWidth).assertEqual(1920);
      expect(resolution.frameHeight).assertEqual(1080);
      expect(resolution.frameWidth).assertLarger(0);
      expect(resolution.frameHeight).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RESOLUTION_0008
     * @tc.name      testExtRecResolution0007
     * @tc.desc      Resolution 3840x2160 stores dimensions.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecResolution0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      resolution.frameWidth = 3840;
      resolution.frameHeight = 2160;
      expect(resolution.frameWidth).assertEqual(3840);
      expect(resolution.frameHeight).assertEqual(2160);
      expect(resolution.frameWidth).assertLarger(0);
      expect(resolution.frameHeight).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RESOLUTION_0009
     * @tc.name      testExtRecResolution0008
     * @tc.desc      Resolution 640x480 stores dimensions.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecResolution0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      expect(resolution.frameWidth).assertEqual(640);
      expect(resolution.frameHeight).assertEqual(480);
      expect(resolution.frameWidth).assertLarger(0);
      expect(resolution.frameHeight).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RESOLUTION_0010
     * @tc.name      testExtRecResolution0009
     * @tc.desc      Resolution 1280x720 stores dimensions.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecResolution0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      resolution.frameWidth = 1280;
      resolution.frameHeight = 720;
      expect(resolution.frameWidth).assertEqual(1280);
      expect(resolution.frameHeight).assertEqual(720);
      expect(resolution.frameWidth).assertLarger(0);
      expect(resolution.frameHeight).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RESOLUTION_0011
     * @tc.name      testExtRecResolution0010
     * @tc.desc      Resolution 1920x1080 stores dimensions.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecResolution0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      resolution.frameWidth = 1920;
      resolution.frameHeight = 1080;
      expect(resolution.frameWidth).assertEqual(1920);
      expect(resolution.frameHeight).assertEqual(1080);
      expect(resolution.frameWidth).assertLarger(0);
      expect(resolution.frameHeight).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RESOLUTION_0012
     * @tc.name      testExtRecResolution0011
     * @tc.desc      Resolution 3840x2160 stores dimensions.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecResolution0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      resolution.frameWidth = 3840;
      resolution.frameHeight = 2160;
      expect(resolution.frameWidth).assertEqual(3840);
      expect(resolution.frameHeight).assertEqual(2160);
      expect(resolution.frameWidth).assertLarger(0);
      expect(resolution.frameHeight).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RESOLUTION_0013
     * @tc.name      testExtRecResolution0012
     * @tc.desc      Resolution 640x480 stores dimensions.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecResolution0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      expect(resolution.frameWidth).assertEqual(640);
      expect(resolution.frameHeight).assertEqual(480);
      expect(resolution.frameWidth).assertLarger(0);
      expect(resolution.frameHeight).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RESOLUTION_0014
     * @tc.name      testExtRecResolution0013
     * @tc.desc      Resolution 1280x720 stores dimensions.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecResolution0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      resolution.frameWidth = 1280;
      resolution.frameHeight = 720;
      expect(resolution.frameWidth).assertEqual(1280);
      expect(resolution.frameHeight).assertEqual(720);
      expect(resolution.frameWidth).assertLarger(0);
      expect(resolution.frameHeight).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RESOLUTION_0015
     * @tc.name      testExtRecResolution0014
     * @tc.desc      Resolution 1920x1080 stores dimensions.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecResolution0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      resolution.frameWidth = 1920;
      resolution.frameHeight = 1080;
      expect(resolution.frameWidth).assertEqual(1920);
      expect(resolution.frameHeight).assertEqual(1080);
      expect(resolution.frameWidth).assertLarger(0);
      expect(resolution.frameHeight).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RESOLUTION_0016
     * @tc.name      testExtRecResolution0015
     * @tc.desc      Resolution 3840x2160 stores dimensions.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecResolution0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      resolution.frameWidth = 3840;
      resolution.frameHeight = 2160;
      expect(resolution.frameWidth).assertEqual(3840);
      expect(resolution.frameHeight).assertEqual(2160);
      expect(resolution.frameWidth).assertLarger(0);
      expect(resolution.frameHeight).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RESOLUTION_0017
     * @tc.name      testExtRecResolution0016
     * @tc.desc      Resolution 640x480 stores dimensions.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecResolution0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      expect(resolution.frameWidth).assertEqual(640);
      expect(resolution.frameHeight).assertEqual(480);
      expect(resolution.frameWidth).assertLarger(0);
      expect(resolution.frameHeight).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RESOLUTION_0018
     * @tc.name      testExtRecResolution0017
     * @tc.desc      Resolution 1280x720 stores dimensions.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecResolution0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      resolution.frameWidth = 1280;
      resolution.frameHeight = 720;
      expect(resolution.frameWidth).assertEqual(1280);
      expect(resolution.frameHeight).assertEqual(720);
      expect(resolution.frameWidth).assertLarger(0);
      expect(resolution.frameHeight).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RESOLUTION_0019
     * @tc.name      testExtRecResolution0018
     * @tc.desc      Resolution 1920x1080 stores dimensions.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecResolution0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      resolution.frameWidth = 1920;
      resolution.frameHeight = 1080;
      expect(resolution.frameWidth).assertEqual(1920);
      expect(resolution.frameHeight).assertEqual(1080);
      expect(resolution.frameWidth).assertLarger(0);
      expect(resolution.frameHeight).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RESOLUTION_0020
     * @tc.name      testExtRecResolution0019
     * @tc.desc      Resolution 3840x2160 stores dimensions.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecResolution0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      resolution.frameWidth = 3840;
      resolution.frameHeight = 2160;
      expect(resolution.frameWidth).assertEqual(3840);
      expect(resolution.frameHeight).assertEqual(2160);
      expect(resolution.frameWidth).assertLarger(0);
      expect(resolution.frameHeight).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RESOLUTION_0021
     * @tc.name      testExtRecResolution0020
     * @tc.desc      Resolution 640x480 stores dimensions.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecResolution0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      expect(resolution.frameWidth).assertEqual(640);
      expect(resolution.frameHeight).assertEqual(480);
      expect(resolution.frameWidth).assertLarger(0);
      expect(resolution.frameHeight).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RESOLUTION_0022
     * @tc.name      testExtRecResolution0021
     * @tc.desc      Resolution 1280x720 stores dimensions.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecResolution0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      resolution.frameWidth = 1280;
      resolution.frameHeight = 720;
      expect(resolution.frameWidth).assertEqual(1280);
      expect(resolution.frameHeight).assertEqual(720);
      expect(resolution.frameWidth).assertLarger(0);
      expect(resolution.frameHeight).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RESOLUTION_0023
     * @tc.name      testExtRecResolution0022
     * @tc.desc      Resolution 1920x1080 stores dimensions.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecResolution0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      resolution.frameWidth = 1920;
      resolution.frameHeight = 1080;
      expect(resolution.frameWidth).assertEqual(1920);
      expect(resolution.frameHeight).assertEqual(1080);
      expect(resolution.frameWidth).assertLarger(0);
      expect(resolution.frameHeight).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RESOLUTION_0024
     * @tc.name      testExtRecResolution0023
     * @tc.desc      Resolution 3840x2160 stores dimensions.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecResolution0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      resolution.frameWidth = 3840;
      resolution.frameHeight = 2160;
      expect(resolution.frameWidth).assertEqual(3840);
      expect(resolution.frameHeight).assertEqual(2160);
      expect(resolution.frameWidth).assertLarger(0);
      expect(resolution.frameHeight).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RESOLUTION_0025
     * @tc.name      testExtRecResolution0024
     * @tc.desc      Resolution 640x480 stores dimensions.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecResolution0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      expect(resolution.frameWidth).assertEqual(640);
      expect(resolution.frameHeight).assertEqual(480);
      expect(resolution.frameWidth).assertLarger(0);
      expect(resolution.frameHeight).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RESOLUTION_0026
     * @tc.name      testExtRecResolution0025
     * @tc.desc      Resolution 1280x720 stores dimensions.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecResolution0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      resolution.frameWidth = 1280;
      resolution.frameHeight = 720;
      expect(resolution.frameWidth).assertEqual(1280);
      expect(resolution.frameHeight).assertEqual(720);
      expect(resolution.frameWidth).assertLarger(0);
      expect(resolution.frameHeight).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RESOLUTION_0027
     * @tc.name      testExtRecResolution0026
     * @tc.desc      Resolution 1920x1080 stores dimensions.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecResolution0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      resolution.frameWidth = 1920;
      resolution.frameHeight = 1080;
      expect(resolution.frameWidth).assertEqual(1920);
      expect(resolution.frameHeight).assertEqual(1080);
      expect(resolution.frameWidth).assertLarger(0);
      expect(resolution.frameHeight).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RESOLUTION_0028
     * @tc.name      testExtRecResolution0027
     * @tc.desc      Resolution 3840x2160 stores dimensions.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecResolution0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      resolution.frameWidth = 3840;
      resolution.frameHeight = 2160;
      expect(resolution.frameWidth).assertEqual(3840);
      expect(resolution.frameHeight).assertEqual(2160);
      expect(resolution.frameWidth).assertLarger(0);
      expect(resolution.frameHeight).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RESOLUTION_0029
     * @tc.name      testExtRecResolution0028
     * @tc.desc      Resolution 640x480 stores dimensions.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecResolution0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      expect(resolution.frameWidth).assertEqual(640);
      expect(resolution.frameHeight).assertEqual(480);
      expect(resolution.frameWidth).assertLarger(0);
      expect(resolution.frameHeight).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RESOLUTION_0030
     * @tc.name      testExtRecResolution0029
     * @tc.desc      Resolution 1280x720 stores dimensions.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecResolution0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      resolution.frameWidth = 1280;
      resolution.frameHeight = 720;
      expect(resolution.frameWidth).assertEqual(1280);
      expect(resolution.frameHeight).assertEqual(720);
      expect(resolution.frameWidth).assertLarger(0);
      expect(resolution.frameHeight).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RESOLUTION_0031
     * @tc.name      testExtRecResolution0030
     * @tc.desc      Resolution 1920x1080 stores dimensions.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecResolution0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      resolution.frameWidth = 1920;
      resolution.frameHeight = 1080;
      expect(resolution.frameWidth).assertEqual(1920);
      expect(resolution.frameHeight).assertEqual(1080);
      expect(resolution.frameWidth).assertLarger(0);
      expect(resolution.frameHeight).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RESOLUTION_0032
     * @tc.name      testExtRecResolution0031
     * @tc.desc      Resolution 3840x2160 stores dimensions.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecResolution0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      resolution.frameWidth = 3840;
      resolution.frameHeight = 2160;
      expect(resolution.frameWidth).assertEqual(3840);
      expect(resolution.frameHeight).assertEqual(2160);
      expect(resolution.frameWidth).assertLarger(0);
      expect(resolution.frameHeight).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RESOLUTION_0033
     * @tc.name      testExtRecResolution0032
     * @tc.desc      Resolution 640x480 stores dimensions.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecResolution0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      expect(resolution.frameWidth).assertEqual(640);
      expect(resolution.frameHeight).assertEqual(480);
      expect(resolution.frameWidth).assertLarger(0);
      expect(resolution.frameHeight).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RESOLUTION_0034
     * @tc.name      testExtRecResolution0033
     * @tc.desc      Resolution 1280x720 stores dimensions.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecResolution0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      resolution.frameWidth = 1280;
      resolution.frameHeight = 720;
      expect(resolution.frameWidth).assertEqual(1280);
      expect(resolution.frameHeight).assertEqual(720);
      expect(resolution.frameWidth).assertLarger(0);
      expect(resolution.frameHeight).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RESOLUTION_0035
     * @tc.name      testExtRecResolution0034
     * @tc.desc      Resolution 1920x1080 stores dimensions.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecResolution0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      resolution.frameWidth = 1920;
      resolution.frameHeight = 1080;
      expect(resolution.frameWidth).assertEqual(1920);
      expect(resolution.frameHeight).assertEqual(1080);
      expect(resolution.frameWidth).assertLarger(0);
      expect(resolution.frameHeight).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RESOLUTION_0036
     * @tc.name      testExtRecResolution0035
     * @tc.desc      Resolution 3840x2160 stores dimensions.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecResolution0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      resolution.frameWidth = 3840;
      resolution.frameHeight = 2160;
      expect(resolution.frameWidth).assertEqual(3840);
      expect(resolution.frameHeight).assertEqual(2160);
      expect(resolution.frameWidth).assertLarger(0);
      expect(resolution.frameHeight).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RESOLUTION_0037
     * @tc.name      testExtRecResolution0036
     * @tc.desc      Resolution 640x480 stores dimensions.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecResolution0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      resolution.frameWidth = 640;
      resolution.frameHeight = 480;
      expect(resolution.frameWidth).assertEqual(640);
      expect(resolution.frameHeight).assertEqual(480);
      expect(resolution.frameWidth).assertLarger(0);
      expect(resolution.frameHeight).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RESOLUTION_0038
     * @tc.name      testExtRecResolution0037
     * @tc.desc      Resolution 1280x720 stores dimensions.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecResolution0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      resolution.frameWidth = 1280;
      resolution.frameHeight = 720;
      expect(resolution.frameWidth).assertEqual(1280);
      expect(resolution.frameHeight).assertEqual(720);
      expect(resolution.frameWidth).assertLarger(0);
      expect(resolution.frameHeight).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RESOLUTION_0039
     * @tc.name      testExtRecResolution0038
     * @tc.desc      Resolution 1920x1080 stores dimensions.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecResolution0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      resolution.frameWidth = 1920;
      resolution.frameHeight = 1080;
      expect(resolution.frameWidth).assertEqual(1920);
      expect(resolution.frameHeight).assertEqual(1080);
      expect(resolution.frameWidth).assertLarger(0);
      expect(resolution.frameHeight).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_RESOLUTION_0040
     * @tc.name      testExtRecResolution0039
     * @tc.desc      Resolution 3840x2160 stores dimensions.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecResolution0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resolution: Resolution = new Resolution();
      expect(resolution.frameWidth).assertEqual(0);
      expect(resolution.frameHeight).assertEqual(0);
      resolution.frameWidth = 3840;
      resolution.frameHeight = 2160;
      expect(resolution.frameWidth).assertEqual(3840);
      expect(resolution.frameHeight).assertEqual(2160);
      expect(resolution.frameWidth).assertLarger(0);
      expect(resolution.frameHeight).assertLarger(0);
    })
  });
}
