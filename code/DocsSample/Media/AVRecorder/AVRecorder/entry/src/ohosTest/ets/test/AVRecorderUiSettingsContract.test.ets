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

const TAG: string = '[Sample_avRecorderUiSettingsContract]';
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

export default function avRecorderUiSettingsContractTest(): void {
  describe('avRecorderUiSettingsContractTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0001
     * @tc.name      testExtRecUiSettings0000
     * @tc.desc      UI settings 8000Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(8000) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(640).assertLarger(0);
      expect(480).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0002
     * @tc.name      testExtRecUiSettings0001
     * @tc.desc      UI settings 22050Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(22050) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(1280).assertLarger(0);
      expect(720).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0003
     * @tc.name      testExtRecUiSettings0002
     * @tc.desc      UI settings 44100Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(44100) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(1920).assertLarger(0);
      expect(1080).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0004
     * @tc.name      testExtRecUiSettings0003
     * @tc.desc      UI settings 48000Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(48000) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(640).assertLarger(0);
      expect(480).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0005
     * @tc.name      testExtRecUiSettings0004
     * @tc.desc      UI settings 96000Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(96000) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(1280).assertLarger(0);
      expect(720).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0006
     * @tc.name      testExtRecUiSettings0005
     * @tc.desc      UI settings 8000Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(8000) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(1920).assertLarger(0);
      expect(1080).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0007
     * @tc.name      testExtRecUiSettings0006
     * @tc.desc      UI settings 22050Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(22050) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(640).assertLarger(0);
      expect(480).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0008
     * @tc.name      testExtRecUiSettings0007
     * @tc.desc      UI settings 44100Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(44100) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(1280).assertLarger(0);
      expect(720).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0009
     * @tc.name      testExtRecUiSettings0008
     * @tc.desc      UI settings 48000Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(48000) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(1920).assertLarger(0);
      expect(1080).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0010
     * @tc.name      testExtRecUiSettings0009
     * @tc.desc      UI settings 96000Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(96000) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(640).assertLarger(0);
      expect(480).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0011
     * @tc.name      testExtRecUiSettings0010
     * @tc.desc      UI settings 8000Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(8000) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(1280).assertLarger(0);
      expect(720).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0012
     * @tc.name      testExtRecUiSettings0011
     * @tc.desc      UI settings 22050Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(22050) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(1920).assertLarger(0);
      expect(1080).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0013
     * @tc.name      testExtRecUiSettings0012
     * @tc.desc      UI settings 44100Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(44100) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(640).assertLarger(0);
      expect(480).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0014
     * @tc.name      testExtRecUiSettings0013
     * @tc.desc      UI settings 48000Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(48000) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(1280).assertLarger(0);
      expect(720).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0015
     * @tc.name      testExtRecUiSettings0014
     * @tc.desc      UI settings 96000Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(96000) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(1920).assertLarger(0);
      expect(1080).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0016
     * @tc.name      testExtRecUiSettings0015
     * @tc.desc      UI settings 8000Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(8000) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(640).assertLarger(0);
      expect(480).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0017
     * @tc.name      testExtRecUiSettings0016
     * @tc.desc      UI settings 22050Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(22050) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(1280).assertLarger(0);
      expect(720).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0018
     * @tc.name      testExtRecUiSettings0017
     * @tc.desc      UI settings 44100Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(44100) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(1920).assertLarger(0);
      expect(1080).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0019
     * @tc.name      testExtRecUiSettings0018
     * @tc.desc      UI settings 48000Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(48000) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(640).assertLarger(0);
      expect(480).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0020
     * @tc.name      testExtRecUiSettings0019
     * @tc.desc      UI settings 96000Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(96000) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(1280).assertLarger(0);
      expect(720).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0021
     * @tc.name      testExtRecUiSettings0020
     * @tc.desc      UI settings 8000Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(8000) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(1920).assertLarger(0);
      expect(1080).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0022
     * @tc.name      testExtRecUiSettings0021
     * @tc.desc      UI settings 22050Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(22050) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(640).assertLarger(0);
      expect(480).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0023
     * @tc.name      testExtRecUiSettings0022
     * @tc.desc      UI settings 44100Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(44100) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(1280).assertLarger(0);
      expect(720).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0024
     * @tc.name      testExtRecUiSettings0023
     * @tc.desc      UI settings 48000Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(48000) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(1920).assertLarger(0);
      expect(1080).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0025
     * @tc.name      testExtRecUiSettings0024
     * @tc.desc      UI settings 96000Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(96000) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(640).assertLarger(0);
      expect(480).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0026
     * @tc.name      testExtRecUiSettings0025
     * @tc.desc      UI settings 8000Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(8000) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(1280).assertLarger(0);
      expect(720).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0027
     * @tc.name      testExtRecUiSettings0026
     * @tc.desc      UI settings 22050Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(22050) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(1920).assertLarger(0);
      expect(1080).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0028
     * @tc.name      testExtRecUiSettings0027
     * @tc.desc      UI settings 44100Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(44100) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(640).assertLarger(0);
      expect(480).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0029
     * @tc.name      testExtRecUiSettings0028
     * @tc.desc      UI settings 48000Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(48000) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(1280).assertLarger(0);
      expect(720).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0030
     * @tc.name      testExtRecUiSettings0029
     * @tc.desc      UI settings 96000Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(96000) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(1920).assertLarger(0);
      expect(1080).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0031
     * @tc.name      testExtRecUiSettings0030
     * @tc.desc      UI settings 8000Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(8000) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(640).assertLarger(0);
      expect(480).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0032
     * @tc.name      testExtRecUiSettings0031
     * @tc.desc      UI settings 22050Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(22050) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(1280).assertLarger(0);
      expect(720).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0033
     * @tc.name      testExtRecUiSettings0032
     * @tc.desc      UI settings 44100Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(44100) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(1920).assertLarger(0);
      expect(1080).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0034
     * @tc.name      testExtRecUiSettings0033
     * @tc.desc      UI settings 48000Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(48000) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(640).assertLarger(0);
      expect(480).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0035
     * @tc.name      testExtRecUiSettings0034
     * @tc.desc      UI settings 96000Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(96000) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(1280).assertLarger(0);
      expect(720).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0036
     * @tc.name      testExtRecUiSettings0035
     * @tc.desc      UI settings 8000Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(8000) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(1920).assertLarger(0);
      expect(1080).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0037
     * @tc.name      testExtRecUiSettings0036
     * @tc.desc      UI settings 22050Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(22050) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(640).assertLarger(0);
      expect(480).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0038
     * @tc.name      testExtRecUiSettings0037
     * @tc.desc      UI settings 44100Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(44100) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(1280).assertLarger(0);
      expect(720).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0039
     * @tc.name      testExtRecUiSettings0038
     * @tc.desc      UI settings 48000Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(48000) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(1920).assertLarger(0);
      expect(1080).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0040
     * @tc.name      testExtRecUiSettings0039
     * @tc.desc      UI settings 96000Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(96000) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(640).assertLarger(0);
      expect(480).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0041
     * @tc.name      testExtRecUiSettings0040
     * @tc.desc      UI settings 8000Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(8000) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(1280).assertLarger(0);
      expect(720).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0042
     * @tc.name      testExtRecUiSettings0041
     * @tc.desc      UI settings 22050Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(22050) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(1920).assertLarger(0);
      expect(1080).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0043
     * @tc.name      testExtRecUiSettings0042
     * @tc.desc      UI settings 44100Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(44100) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(640).assertLarger(0);
      expect(480).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0044
     * @tc.name      testExtRecUiSettings0043
     * @tc.desc      UI settings 48000Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(48000) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(1280).assertLarger(0);
      expect(720).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0045
     * @tc.name      testExtRecUiSettings0044
     * @tc.desc      UI settings 96000Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(96000) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(1920).assertLarger(0);
      expect(1080).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0046
     * @tc.name      testExtRecUiSettings0045
     * @tc.desc      UI settings 8000Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(8000) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(640).assertLarger(0);
      expect(480).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0047
     * @tc.name      testExtRecUiSettings0046
     * @tc.desc      UI settings 22050Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(22050) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(1280).assertLarger(0);
      expect(720).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0048
     * @tc.name      testExtRecUiSettings0047
     * @tc.desc      UI settings 44100Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(44100) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(1920).assertLarger(0);
      expect(1080).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0049
     * @tc.name      testExtRecUiSettings0048
     * @tc.desc      UI settings 48000Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(48000) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(640).assertLarger(0);
      expect(480).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0050
     * @tc.name      testExtRecUiSettings0049
     * @tc.desc      UI settings 96000Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(96000) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(1280).assertLarger(0);
      expect(720).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0051
     * @tc.name      testExtRecUiSettings0050
     * @tc.desc      UI settings 8000Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(8000) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(1920).assertLarger(0);
      expect(1080).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0052
     * @tc.name      testExtRecUiSettings0051
     * @tc.desc      UI settings 22050Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(22050) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(640).assertLarger(0);
      expect(480).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0053
     * @tc.name      testExtRecUiSettings0052
     * @tc.desc      UI settings 44100Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(44100) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(1280).assertLarger(0);
      expect(720).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0054
     * @tc.name      testExtRecUiSettings0053
     * @tc.desc      UI settings 48000Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(48000) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(1920).assertLarger(0);
      expect(1080).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0055
     * @tc.name      testExtRecUiSettings0054
     * @tc.desc      UI settings 96000Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(96000) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(640).assertLarger(0);
      expect(480).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0056
     * @tc.name      testExtRecUiSettings0055
     * @tc.desc      UI settings 8000Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(8000) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(1280).assertLarger(0);
      expect(720).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0057
     * @tc.name      testExtRecUiSettings0056
     * @tc.desc      UI settings 22050Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(22050) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(1920).assertLarger(0);
      expect(1080).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0058
     * @tc.name      testExtRecUiSettings0057
     * @tc.desc      UI settings 44100Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(44100) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(640).assertLarger(0);
      expect(480).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0059
     * @tc.name      testExtRecUiSettings0058
     * @tc.desc      UI settings 48000Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(48000) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(1280).assertLarger(0);
      expect(720).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UISET_0060
     * @tc.name      testExtRecUiSettings0059
     * @tc.desc      UI settings 96000Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiSettings0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sampleRateOptions: number[] = [8000, 22050, 44100, 48000, 96000];
      const resolutionOptions: number[][] = [[640, 480], [1280, 720], [1920, 1080]];
      expect(sampleRateOptions.indexOf(96000) >= 0).assertTrue();
      expect(resolutionOptions[0].length).assertEqual(2);
      expect(resolutionOptions[1][0]).assertEqual(1280);
      expect(resolutionOptions[2][0]).assertEqual(1920);
      expect(1920).assertLarger(0);
      expect(1080).assertLarger(0);
    })
  });
}
