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
import { describe, it as hypiumIt, expect as hypiumExpect, beforeEach, TestType, Size, Level, Assert } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = '[Sample_avRecorderCameraContract]';
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

function expect(actual: string | number | boolean | Object | null | undefined): Assert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function avRecorderCameraContractTest(): void {
  describe('avRecorderCameraContractTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0001
     * @tc.name      testExtRecCamera0001
     * @tc.desc      Camera profile select 1280x720 index 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 1280;
      const wantedHeight: number = 720;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'YUV';
      expect(selected).assertEqual(1);
      expect(widths[selected]).assertEqual(1280);
      expect(heights[selected]).assertEqual(720);
      expect(sourceType).assertEqual('YUV');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0002
     * @tc.name      testExtRecCamera0002
     * @tc.desc      Camera profile select 1920x1080 index 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 1920;
      const wantedHeight: number = 1080;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'ES';
      expect(selected).assertEqual(2);
      expect(widths[selected]).assertEqual(1920);
      expect(heights[selected]).assertEqual(1080);
      expect(sourceType).assertEqual('ES');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0003
     * @tc.name      testExtRecCamera0003
     * @tc.desc      Camera profile select 640x480 index 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 640;
      const wantedHeight: number = 480;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'YUV';
      expect(selected).assertEqual(0);
      expect(widths[selected]).assertEqual(640);
      expect(heights[selected]).assertEqual(480);
      expect(sourceType).assertEqual('YUV');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0004
     * @tc.name      testExtRecCamera0004
     * @tc.desc      Camera profile select 1280x720 index 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 1280;
      const wantedHeight: number = 720;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'ES';
      expect(selected).assertEqual(1);
      expect(widths[selected]).assertEqual(1280);
      expect(heights[selected]).assertEqual(720);
      expect(sourceType).assertEqual('ES');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0005
     * @tc.name      testExtRecCamera0005
     * @tc.desc      Camera profile select 1920x1080 index 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 1920;
      const wantedHeight: number = 1080;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'YUV';
      expect(selected).assertEqual(2);
      expect(widths[selected]).assertEqual(1920);
      expect(heights[selected]).assertEqual(1080);
      expect(sourceType).assertEqual('YUV');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0006
     * @tc.name      testExtRecCamera0006
     * @tc.desc      Camera profile select 640x480 index 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 640;
      const wantedHeight: number = 480;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'ES';
      expect(selected).assertEqual(0);
      expect(widths[selected]).assertEqual(640);
      expect(heights[selected]).assertEqual(480);
      expect(sourceType).assertEqual('ES');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0007
     * @tc.name      testExtRecCamera0007
     * @tc.desc      Camera profile select 1280x720 index 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 1280;
      const wantedHeight: number = 720;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'YUV';
      expect(selected).assertEqual(1);
      expect(widths[selected]).assertEqual(1280);
      expect(heights[selected]).assertEqual(720);
      expect(sourceType).assertEqual('YUV');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0008
     * @tc.name      testExtRecCamera0008
     * @tc.desc      Camera profile select 1920x1080 index 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 1920;
      const wantedHeight: number = 1080;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'ES';
      expect(selected).assertEqual(2);
      expect(widths[selected]).assertEqual(1920);
      expect(heights[selected]).assertEqual(1080);
      expect(sourceType).assertEqual('ES');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0009
     * @tc.name      testExtRecCamera0009
     * @tc.desc      Camera profile select 640x480 index 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 640;
      const wantedHeight: number = 480;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'YUV';
      expect(selected).assertEqual(0);
      expect(widths[selected]).assertEqual(640);
      expect(heights[selected]).assertEqual(480);
      expect(sourceType).assertEqual('YUV');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0010
     * @tc.name      testExtRecCamera0010
     * @tc.desc      Camera profile select 1280x720 index 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 1280;
      const wantedHeight: number = 720;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'ES';
      expect(selected).assertEqual(1);
      expect(widths[selected]).assertEqual(1280);
      expect(heights[selected]).assertEqual(720);
      expect(sourceType).assertEqual('ES');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0011
     * @tc.name      testExtRecCamera0011
     * @tc.desc      Camera profile select 1920x1080 index 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 1920;
      const wantedHeight: number = 1080;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'YUV';
      expect(selected).assertEqual(2);
      expect(widths[selected]).assertEqual(1920);
      expect(heights[selected]).assertEqual(1080);
      expect(sourceType).assertEqual('YUV');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0012
     * @tc.name      testExtRecCamera0012
     * @tc.desc      Camera profile select 640x480 index 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 640;
      const wantedHeight: number = 480;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'ES';
      expect(selected).assertEqual(0);
      expect(widths[selected]).assertEqual(640);
      expect(heights[selected]).assertEqual(480);
      expect(sourceType).assertEqual('ES');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0013
     * @tc.name      testExtRecCamera0013
     * @tc.desc      Camera profile select 1280x720 index 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 1280;
      const wantedHeight: number = 720;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'YUV';
      expect(selected).assertEqual(1);
      expect(widths[selected]).assertEqual(1280);
      expect(heights[selected]).assertEqual(720);
      expect(sourceType).assertEqual('YUV');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0014
     * @tc.name      testExtRecCamera0014
     * @tc.desc      Camera profile select 1920x1080 index 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 1920;
      const wantedHeight: number = 1080;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'ES';
      expect(selected).assertEqual(2);
      expect(widths[selected]).assertEqual(1920);
      expect(heights[selected]).assertEqual(1080);
      expect(sourceType).assertEqual('ES');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0015
     * @tc.name      testExtRecCamera0015
     * @tc.desc      Camera profile select 640x480 index 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 640;
      const wantedHeight: number = 480;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'YUV';
      expect(selected).assertEqual(0);
      expect(widths[selected]).assertEqual(640);
      expect(heights[selected]).assertEqual(480);
      expect(sourceType).assertEqual('YUV');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0016
     * @tc.name      testExtRecCamera0016
     * @tc.desc      Camera profile select 1280x720 index 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 1280;
      const wantedHeight: number = 720;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'ES';
      expect(selected).assertEqual(1);
      expect(widths[selected]).assertEqual(1280);
      expect(heights[selected]).assertEqual(720);
      expect(sourceType).assertEqual('ES');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0017
     * @tc.name      testExtRecCamera0017
     * @tc.desc      Camera profile select 1920x1080 index 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 1920;
      const wantedHeight: number = 1080;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'YUV';
      expect(selected).assertEqual(2);
      expect(widths[selected]).assertEqual(1920);
      expect(heights[selected]).assertEqual(1080);
      expect(sourceType).assertEqual('YUV');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0018
     * @tc.name      testExtRecCamera0018
     * @tc.desc      Camera profile select 640x480 index 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 640;
      const wantedHeight: number = 480;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'ES';
      expect(selected).assertEqual(0);
      expect(widths[selected]).assertEqual(640);
      expect(heights[selected]).assertEqual(480);
      expect(sourceType).assertEqual('ES');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0019
     * @tc.name      testExtRecCamera0019
     * @tc.desc      Camera profile select 1280x720 index 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 1280;
      const wantedHeight: number = 720;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'YUV';
      expect(selected).assertEqual(1);
      expect(widths[selected]).assertEqual(1280);
      expect(heights[selected]).assertEqual(720);
      expect(sourceType).assertEqual('YUV');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0020
     * @tc.name      testExtRecCamera0020
     * @tc.desc      Camera profile select 1920x1080 index 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 1920;
      const wantedHeight: number = 1080;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'ES';
      expect(selected).assertEqual(2);
      expect(widths[selected]).assertEqual(1920);
      expect(heights[selected]).assertEqual(1080);
      expect(sourceType).assertEqual('ES');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0021
     * @tc.name      testExtRecCamera0021
     * @tc.desc      Camera profile select 640x480 index 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 640;
      const wantedHeight: number = 480;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'YUV';
      expect(selected).assertEqual(0);
      expect(widths[selected]).assertEqual(640);
      expect(heights[selected]).assertEqual(480);
      expect(sourceType).assertEqual('YUV');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0022
     * @tc.name      testExtRecCamera0022
     * @tc.desc      Camera profile select 1280x720 index 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 1280;
      const wantedHeight: number = 720;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'ES';
      expect(selected).assertEqual(1);
      expect(widths[selected]).assertEqual(1280);
      expect(heights[selected]).assertEqual(720);
      expect(sourceType).assertEqual('ES');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0023
     * @tc.name      testExtRecCamera0023
     * @tc.desc      Camera profile select 1920x1080 index 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 1920;
      const wantedHeight: number = 1080;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'YUV';
      expect(selected).assertEqual(2);
      expect(widths[selected]).assertEqual(1920);
      expect(heights[selected]).assertEqual(1080);
      expect(sourceType).assertEqual('YUV');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0024
     * @tc.name      testExtRecCamera0024
     * @tc.desc      Camera profile select 640x480 index 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 640;
      const wantedHeight: number = 480;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'ES';
      expect(selected).assertEqual(0);
      expect(widths[selected]).assertEqual(640);
      expect(heights[selected]).assertEqual(480);
      expect(sourceType).assertEqual('ES');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0025
     * @tc.name      testExtRecCamera0025
     * @tc.desc      Camera profile select 1280x720 index 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 1280;
      const wantedHeight: number = 720;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'YUV';
      expect(selected).assertEqual(1);
      expect(widths[selected]).assertEqual(1280);
      expect(heights[selected]).assertEqual(720);
      expect(sourceType).assertEqual('YUV');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0026
     * @tc.name      testExtRecCamera0026
     * @tc.desc      Camera profile select 1920x1080 index 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 1920;
      const wantedHeight: number = 1080;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'ES';
      expect(selected).assertEqual(2);
      expect(widths[selected]).assertEqual(1920);
      expect(heights[selected]).assertEqual(1080);
      expect(sourceType).assertEqual('ES');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0027
     * @tc.name      testExtRecCamera0027
     * @tc.desc      Camera profile select 640x480 index 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 640;
      const wantedHeight: number = 480;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'YUV';
      expect(selected).assertEqual(0);
      expect(widths[selected]).assertEqual(640);
      expect(heights[selected]).assertEqual(480);
      expect(sourceType).assertEqual('YUV');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0028
     * @tc.name      testExtRecCamera0028
     * @tc.desc      Camera profile select 1280x720 index 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 1280;
      const wantedHeight: number = 720;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'ES';
      expect(selected).assertEqual(1);
      expect(widths[selected]).assertEqual(1280);
      expect(heights[selected]).assertEqual(720);
      expect(sourceType).assertEqual('ES');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0029
     * @tc.name      testExtRecCamera0029
     * @tc.desc      Camera profile select 1920x1080 index 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 1920;
      const wantedHeight: number = 1080;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'YUV';
      expect(selected).assertEqual(2);
      expect(widths[selected]).assertEqual(1920);
      expect(heights[selected]).assertEqual(1080);
      expect(sourceType).assertEqual('YUV');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0030
     * @tc.name      testExtRecCamera0030
     * @tc.desc      Camera profile select 640x480 index 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 640;
      const wantedHeight: number = 480;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'ES';
      expect(selected).assertEqual(0);
      expect(widths[selected]).assertEqual(640);
      expect(heights[selected]).assertEqual(480);
      expect(sourceType).assertEqual('ES');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0031
     * @tc.name      testExtRecCamera0031
     * @tc.desc      Camera profile select 1280x720 index 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 1280;
      const wantedHeight: number = 720;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'YUV';
      expect(selected).assertEqual(1);
      expect(widths[selected]).assertEqual(1280);
      expect(heights[selected]).assertEqual(720);
      expect(sourceType).assertEqual('YUV');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0032
     * @tc.name      testExtRecCamera0032
     * @tc.desc      Camera profile select 1920x1080 index 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 1920;
      const wantedHeight: number = 1080;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'ES';
      expect(selected).assertEqual(2);
      expect(widths[selected]).assertEqual(1920);
      expect(heights[selected]).assertEqual(1080);
      expect(sourceType).assertEqual('ES');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0033
     * @tc.name      testExtRecCamera0033
     * @tc.desc      Camera profile select 640x480 index 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 640;
      const wantedHeight: number = 480;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'YUV';
      expect(selected).assertEqual(0);
      expect(widths[selected]).assertEqual(640);
      expect(heights[selected]).assertEqual(480);
      expect(sourceType).assertEqual('YUV');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0034
     * @tc.name      testExtRecCamera0034
     * @tc.desc      Camera profile select 1280x720 index 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 1280;
      const wantedHeight: number = 720;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'ES';
      expect(selected).assertEqual(1);
      expect(widths[selected]).assertEqual(1280);
      expect(heights[selected]).assertEqual(720);
      expect(sourceType).assertEqual('ES');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0035
     * @tc.name      testExtRecCamera0035
     * @tc.desc      Camera profile select 1920x1080 index 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 1920;
      const wantedHeight: number = 1080;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'YUV';
      expect(selected).assertEqual(2);
      expect(widths[selected]).assertEqual(1920);
      expect(heights[selected]).assertEqual(1080);
      expect(sourceType).assertEqual('YUV');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0036
     * @tc.name      testExtRecCamera0036
     * @tc.desc      Camera profile select 640x480 index 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 640;
      const wantedHeight: number = 480;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'ES';
      expect(selected).assertEqual(0);
      expect(widths[selected]).assertEqual(640);
      expect(heights[selected]).assertEqual(480);
      expect(sourceType).assertEqual('ES');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0037
     * @tc.name      testExtRecCamera0037
     * @tc.desc      Camera profile select 1280x720 index 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 1280;
      const wantedHeight: number = 720;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'YUV';
      expect(selected).assertEqual(1);
      expect(widths[selected]).assertEqual(1280);
      expect(heights[selected]).assertEqual(720);
      expect(sourceType).assertEqual('YUV');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0038
     * @tc.name      testExtRecCamera0038
     * @tc.desc      Camera profile select 1920x1080 index 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 1920;
      const wantedHeight: number = 1080;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'ES';
      expect(selected).assertEqual(2);
      expect(widths[selected]).assertEqual(1920);
      expect(heights[selected]).assertEqual(1080);
      expect(sourceType).assertEqual('ES');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0039
     * @tc.name      testExtRecCamera0039
     * @tc.desc      Camera profile select 640x480 index 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 640;
      const wantedHeight: number = 480;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'YUV';
      expect(selected).assertEqual(0);
      expect(widths[selected]).assertEqual(640);
      expect(heights[selected]).assertEqual(480);
      expect(sourceType).assertEqual('YUV');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0040
     * @tc.name      testExtRecCamera0040
     * @tc.desc      Camera profile select 1280x720 index 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 1280;
      const wantedHeight: number = 720;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'ES';
      expect(selected).assertEqual(1);
      expect(widths[selected]).assertEqual(1280);
      expect(heights[selected]).assertEqual(720);
      expect(sourceType).assertEqual('ES');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0041
     * @tc.name      testExtRecCamera0041
     * @tc.desc      Camera profile select 1920x1080 index 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 1920;
      const wantedHeight: number = 1080;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'YUV';
      expect(selected).assertEqual(2);
      expect(widths[selected]).assertEqual(1920);
      expect(heights[selected]).assertEqual(1080);
      expect(sourceType).assertEqual('YUV');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0042
     * @tc.name      testExtRecCamera0042
     * @tc.desc      Camera profile select 640x480 index 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 640;
      const wantedHeight: number = 480;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'ES';
      expect(selected).assertEqual(0);
      expect(widths[selected]).assertEqual(640);
      expect(heights[selected]).assertEqual(480);
      expect(sourceType).assertEqual('ES');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0043
     * @tc.name      testExtRecCamera0043
     * @tc.desc      Camera profile select 1280x720 index 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 1280;
      const wantedHeight: number = 720;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'YUV';
      expect(selected).assertEqual(1);
      expect(widths[selected]).assertEqual(1280);
      expect(heights[selected]).assertEqual(720);
      expect(sourceType).assertEqual('YUV');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0044
     * @tc.name      testExtRecCamera0044
     * @tc.desc      Camera profile select 1920x1080 index 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 1920;
      const wantedHeight: number = 1080;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'ES';
      expect(selected).assertEqual(2);
      expect(widths[selected]).assertEqual(1920);
      expect(heights[selected]).assertEqual(1080);
      expect(sourceType).assertEqual('ES');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0045
     * @tc.name      testExtRecCamera0045
     * @tc.desc      Camera profile select 640x480 index 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 640;
      const wantedHeight: number = 480;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'YUV';
      expect(selected).assertEqual(0);
      expect(widths[selected]).assertEqual(640);
      expect(heights[selected]).assertEqual(480);
      expect(sourceType).assertEqual('YUV');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0046
     * @tc.name      testExtRecCamera0046
     * @tc.desc      Camera profile select 1280x720 index 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 1280;
      const wantedHeight: number = 720;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'ES';
      expect(selected).assertEqual(1);
      expect(widths[selected]).assertEqual(1280);
      expect(heights[selected]).assertEqual(720);
      expect(sourceType).assertEqual('ES');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0047
     * @tc.name      testExtRecCamera0047
     * @tc.desc      Camera profile select 1920x1080 index 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 1920;
      const wantedHeight: number = 1080;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'YUV';
      expect(selected).assertEqual(2);
      expect(widths[selected]).assertEqual(1920);
      expect(heights[selected]).assertEqual(1080);
      expect(sourceType).assertEqual('YUV');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0048
     * @tc.name      testExtRecCamera0048
     * @tc.desc      Camera profile select 640x480 index 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 640;
      const wantedHeight: number = 480;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'ES';
      expect(selected).assertEqual(0);
      expect(widths[selected]).assertEqual(640);
      expect(heights[selected]).assertEqual(480);
      expect(sourceType).assertEqual('ES');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0049
     * @tc.name      testExtRecCamera0049
     * @tc.desc      Camera profile select 1280x720 index 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 1280;
      const wantedHeight: number = 720;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'YUV';
      expect(selected).assertEqual(1);
      expect(widths[selected]).assertEqual(1280);
      expect(heights[selected]).assertEqual(720);
      expect(sourceType).assertEqual('YUV');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0050
     * @tc.name      testExtRecCamera0050
     * @tc.desc      Camera profile select 1920x1080 index 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 1920;
      const wantedHeight: number = 1080;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'ES';
      expect(selected).assertEqual(2);
      expect(widths[selected]).assertEqual(1920);
      expect(heights[selected]).assertEqual(1080);
      expect(sourceType).assertEqual('ES');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0051
     * @tc.name      testExtRecCamera0051
     * @tc.desc      Camera profile select 640x480 index 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 640;
      const wantedHeight: number = 480;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'YUV';
      expect(selected).assertEqual(0);
      expect(widths[selected]).assertEqual(640);
      expect(heights[selected]).assertEqual(480);
      expect(sourceType).assertEqual('YUV');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0052
     * @tc.name      testExtRecCamera0052
     * @tc.desc      Camera profile select 1280x720 index 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 1280;
      const wantedHeight: number = 720;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'ES';
      expect(selected).assertEqual(1);
      expect(widths[selected]).assertEqual(1280);
      expect(heights[selected]).assertEqual(720);
      expect(sourceType).assertEqual('ES');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0053
     * @tc.name      testExtRecCamera0053
     * @tc.desc      Camera profile select 1920x1080 index 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 1920;
      const wantedHeight: number = 1080;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'YUV';
      expect(selected).assertEqual(2);
      expect(widths[selected]).assertEqual(1920);
      expect(heights[selected]).assertEqual(1080);
      expect(sourceType).assertEqual('YUV');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0054
     * @tc.name      testExtRecCamera0054
     * @tc.desc      Camera profile select 640x480 index 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 640;
      const wantedHeight: number = 480;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'ES';
      expect(selected).assertEqual(0);
      expect(widths[selected]).assertEqual(640);
      expect(heights[selected]).assertEqual(480);
      expect(sourceType).assertEqual('ES');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0055
     * @tc.name      testExtRecCamera0055
     * @tc.desc      Camera profile select 1280x720 index 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 1280;
      const wantedHeight: number = 720;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'YUV';
      expect(selected).assertEqual(1);
      expect(widths[selected]).assertEqual(1280);
      expect(heights[selected]).assertEqual(720);
      expect(sourceType).assertEqual('YUV');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0056
     * @tc.name      testExtRecCamera0056
     * @tc.desc      Camera profile select 1920x1080 index 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 1920;
      const wantedHeight: number = 1080;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'ES';
      expect(selected).assertEqual(2);
      expect(widths[selected]).assertEqual(1920);
      expect(heights[selected]).assertEqual(1080);
      expect(sourceType).assertEqual('ES');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0057
     * @tc.name      testExtRecCamera0057
     * @tc.desc      Camera profile select 640x480 index 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 640;
      const wantedHeight: number = 480;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'YUV';
      expect(selected).assertEqual(0);
      expect(widths[selected]).assertEqual(640);
      expect(heights[selected]).assertEqual(480);
      expect(sourceType).assertEqual('YUV');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0058
     * @tc.name      testExtRecCamera0058
     * @tc.desc      Camera profile select 1280x720 index 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 1280;
      const wantedHeight: number = 720;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'ES';
      expect(selected).assertEqual(1);
      expect(widths[selected]).assertEqual(1280);
      expect(heights[selected]).assertEqual(720);
      expect(sourceType).assertEqual('ES');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0059
     * @tc.name      testExtRecCamera0059
     * @tc.desc      Camera profile select 1920x1080 index 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 1920;
      const wantedHeight: number = 1080;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'YUV';
      expect(selected).assertEqual(2);
      expect(widths[selected]).assertEqual(1920);
      expect(heights[selected]).assertEqual(1080);
      expect(sourceType).assertEqual('YUV');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0060
     * @tc.name      testExtRecCamera0060
     * @tc.desc      Camera profile select 640x480 index 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 640;
      const wantedHeight: number = 480;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'ES';
      expect(selected).assertEqual(0);
      expect(widths[selected]).assertEqual(640);
      expect(heights[selected]).assertEqual(480);
      expect(sourceType).assertEqual('ES');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0061
     * @tc.name      testExtRecCamera0061
     * @tc.desc      Camera profile select 1280x720 index 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 1280;
      const wantedHeight: number = 720;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'YUV';
      expect(selected).assertEqual(1);
      expect(widths[selected]).assertEqual(1280);
      expect(heights[selected]).assertEqual(720);
      expect(sourceType).assertEqual('YUV');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0062
     * @tc.name      testExtRecCamera0062
     * @tc.desc      Camera profile select 1920x1080 index 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 1920;
      const wantedHeight: number = 1080;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'ES';
      expect(selected).assertEqual(2);
      expect(widths[selected]).assertEqual(1920);
      expect(heights[selected]).assertEqual(1080);
      expect(sourceType).assertEqual('ES');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0063
     * @tc.name      testExtRecCamera0063
     * @tc.desc      Camera profile select 640x480 index 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 640;
      const wantedHeight: number = 480;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'YUV';
      expect(selected).assertEqual(0);
      expect(widths[selected]).assertEqual(640);
      expect(heights[selected]).assertEqual(480);
      expect(sourceType).assertEqual('YUV');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0064
     * @tc.name      testExtRecCamera0064
     * @tc.desc      Camera profile select 1280x720 index 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 1280;
      const wantedHeight: number = 720;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'ES';
      expect(selected).assertEqual(1);
      expect(widths[selected]).assertEqual(1280);
      expect(heights[selected]).assertEqual(720);
      expect(sourceType).assertEqual('ES');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0065
     * @tc.name      testExtRecCamera0065
     * @tc.desc      Camera profile select 1920x1080 index 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 1920;
      const wantedHeight: number = 1080;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'YUV';
      expect(selected).assertEqual(2);
      expect(widths[selected]).assertEqual(1920);
      expect(heights[selected]).assertEqual(1080);
      expect(sourceType).assertEqual('YUV');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0066
     * @tc.name      testExtRecCamera0066
     * @tc.desc      Camera profile select 640x480 index 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 640;
      const wantedHeight: number = 480;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'ES';
      expect(selected).assertEqual(0);
      expect(widths[selected]).assertEqual(640);
      expect(heights[selected]).assertEqual(480);
      expect(sourceType).assertEqual('ES');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0067
     * @tc.name      testExtRecCamera0067
     * @tc.desc      Camera profile select 1280x720 index 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 1280;
      const wantedHeight: number = 720;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'YUV';
      expect(selected).assertEqual(1);
      expect(widths[selected]).assertEqual(1280);
      expect(heights[selected]).assertEqual(720);
      expect(sourceType).assertEqual('YUV');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0068
     * @tc.name      testExtRecCamera0068
     * @tc.desc      Camera profile select 1920x1080 index 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 1920;
      const wantedHeight: number = 1080;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'ES';
      expect(selected).assertEqual(2);
      expect(widths[selected]).assertEqual(1920);
      expect(heights[selected]).assertEqual(1080);
      expect(sourceType).assertEqual('ES');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0069
     * @tc.name      testExtRecCamera0069
     * @tc.desc      Camera profile select 640x480 index 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 640;
      const wantedHeight: number = 480;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'YUV';
      expect(selected).assertEqual(0);
      expect(widths[selected]).assertEqual(640);
      expect(heights[selected]).assertEqual(480);
      expect(sourceType).assertEqual('YUV');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_CAMERA_0070
     * @tc.name      testExtRecCamera0070
     * @tc.desc      Camera profile select 1280x720 index 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecCamera0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const widths: number[] = [640, 1280, 1920];
      const heights: number[] = [480, 720, 1080];
      const wantedWidth: number = 1280;
      const wantedHeight: number = 720;
      let selected: number = 0;
      for (let index: number = 0; index < widths.length; index++) {
        if (widths[index] === wantedWidth && heights[index] === wantedHeight) {
          selected = index;
        }
      }
      const sourceType: string = 'ES';
      expect(selected).assertEqual(1);
      expect(widths[selected]).assertEqual(1280);
      expect(heights[selected]).assertEqual(720);
      expect(sourceType).assertEqual('ES');
    })
  });
}
