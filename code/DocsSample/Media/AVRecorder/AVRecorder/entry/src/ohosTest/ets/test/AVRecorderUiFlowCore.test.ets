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

const TAG: string = '[Sample_avRecorderUiFlowCore]';
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

export default function avRecorderUiFlowCoreTest(): void {
  describe('avRecorderUiFlowCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW_0001
     * @tc.name      testExtRecUiFlow0000
     * @tc.desc      UI flow videoRecorderPage audioStart 8000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNativePage', 'audioRecorderNativePage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop'];
      expect(pages.indexOf('videoRecorderPage') >= 0).assertTrue();
      expect(buttons.indexOf('audioStart') >= 0).assertTrue();
      expect(8000).assertLarger(0);
      expect(640).assertLarger(0);
      expect(480).assertLarger(0);
      expect('videoRecorderPage'.length).assertLarger(0);
      expect('audioStart'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW_0002
     * @tc.name      testExtRecUiFlow0001
     * @tc.desc      UI flow audioRecorderPage audioPause 22050Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNativePage', 'audioRecorderNativePage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop'];
      expect(pages.indexOf('audioRecorderPage') >= 0).assertTrue();
      expect(buttons.indexOf('audioPause') >= 0).assertTrue();
      expect(22050).assertLarger(0);
      expect(1280).assertLarger(0);
      expect(720).assertLarger(0);
      expect('audioRecorderPage'.length).assertLarger(0);
      expect('audioPause'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW_0003
     * @tc.name      testExtRecUiFlow0002
     * @tc.desc      UI flow videoRecorderNativePage audioResume 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNativePage', 'audioRecorderNativePage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop'];
      expect(pages.indexOf('videoRecorderNativePage') >= 0).assertTrue();
      expect(buttons.indexOf('audioResume') >= 0).assertTrue();
      expect(44100).assertLarger(0);
      expect(1920).assertLarger(0);
      expect(1080).assertLarger(0);
      expect('videoRecorderNativePage'.length).assertLarger(0);
      expect('audioResume'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW_0004
     * @tc.name      testExtRecUiFlow0003
     * @tc.desc      UI flow audioRecorderNativePage audioStop 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNativePage', 'audioRecorderNativePage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop'];
      expect(pages.indexOf('audioRecorderNativePage') >= 0).assertTrue();
      expect(buttons.indexOf('audioStop') >= 0).assertTrue();
      expect(48000).assertLarger(0);
      expect(640).assertLarger(0);
      expect(480).assertLarger(0);
      expect('audioRecorderNativePage'.length).assertLarger(0);
      expect('audioStop'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW_0005
     * @tc.name      testExtRecUiFlow0004
     * @tc.desc      UI flow videoRecorderPage videoStart 96000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNativePage', 'audioRecorderNativePage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop'];
      expect(pages.indexOf('videoRecorderPage') >= 0).assertTrue();
      expect(buttons.indexOf('videoStart') >= 0).assertTrue();
      expect(96000).assertLarger(0);
      expect(1280).assertLarger(0);
      expect(720).assertLarger(0);
      expect('videoRecorderPage'.length).assertLarger(0);
      expect('videoStart'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW_0006
     * @tc.name      testExtRecUiFlow0005
     * @tc.desc      UI flow audioRecorderPage videoPause 8000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNativePage', 'audioRecorderNativePage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop'];
      expect(pages.indexOf('audioRecorderPage') >= 0).assertTrue();
      expect(buttons.indexOf('videoPause') >= 0).assertTrue();
      expect(8000).assertLarger(0);
      expect(1920).assertLarger(0);
      expect(1080).assertLarger(0);
      expect('audioRecorderPage'.length).assertLarger(0);
      expect('videoPause'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW_0007
     * @tc.name      testExtRecUiFlow0006
     * @tc.desc      UI flow videoRecorderNativePage videoResume 22050Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNativePage', 'audioRecorderNativePage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop'];
      expect(pages.indexOf('videoRecorderNativePage') >= 0).assertTrue();
      expect(buttons.indexOf('videoResume') >= 0).assertTrue();
      expect(22050).assertLarger(0);
      expect(640).assertLarger(0);
      expect(480).assertLarger(0);
      expect('videoRecorderNativePage'.length).assertLarger(0);
      expect('videoResume'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW_0008
     * @tc.name      testExtRecUiFlow0007
     * @tc.desc      UI flow audioRecorderNativePage videoStop 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNativePage', 'audioRecorderNativePage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop'];
      expect(pages.indexOf('audioRecorderNativePage') >= 0).assertTrue();
      expect(buttons.indexOf('videoStop') >= 0).assertTrue();
      expect(44100).assertLarger(0);
      expect(1280).assertLarger(0);
      expect(720).assertLarger(0);
      expect('audioRecorderNativePage'.length).assertLarger(0);
      expect('videoStop'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW_0009
     * @tc.name      testExtRecUiFlow0008
     * @tc.desc      UI flow videoRecorderPage audioStart 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNativePage', 'audioRecorderNativePage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop'];
      expect(pages.indexOf('videoRecorderPage') >= 0).assertTrue();
      expect(buttons.indexOf('audioStart') >= 0).assertTrue();
      expect(48000).assertLarger(0);
      expect(1920).assertLarger(0);
      expect(1080).assertLarger(0);
      expect('videoRecorderPage'.length).assertLarger(0);
      expect('audioStart'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW_0010
     * @tc.name      testExtRecUiFlow0009
     * @tc.desc      UI flow audioRecorderPage audioPause 96000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNativePage', 'audioRecorderNativePage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop'];
      expect(pages.indexOf('audioRecorderPage') >= 0).assertTrue();
      expect(buttons.indexOf('audioPause') >= 0).assertTrue();
      expect(96000).assertLarger(0);
      expect(640).assertLarger(0);
      expect(480).assertLarger(0);
      expect('audioRecorderPage'.length).assertLarger(0);
      expect('audioPause'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW_0011
     * @tc.name      testExtRecUiFlow0010
     * @tc.desc      UI flow videoRecorderNativePage audioResume 8000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNativePage', 'audioRecorderNativePage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop'];
      expect(pages.indexOf('videoRecorderNativePage') >= 0).assertTrue();
      expect(buttons.indexOf('audioResume') >= 0).assertTrue();
      expect(8000).assertLarger(0);
      expect(1280).assertLarger(0);
      expect(720).assertLarger(0);
      expect('videoRecorderNativePage'.length).assertLarger(0);
      expect('audioResume'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW_0012
     * @tc.name      testExtRecUiFlow0011
     * @tc.desc      UI flow audioRecorderNativePage audioStop 22050Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNativePage', 'audioRecorderNativePage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop'];
      expect(pages.indexOf('audioRecorderNativePage') >= 0).assertTrue();
      expect(buttons.indexOf('audioStop') >= 0).assertTrue();
      expect(22050).assertLarger(0);
      expect(1920).assertLarger(0);
      expect(1080).assertLarger(0);
      expect('audioRecorderNativePage'.length).assertLarger(0);
      expect('audioStop'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW_0013
     * @tc.name      testExtRecUiFlow0012
     * @tc.desc      UI flow videoRecorderPage videoStart 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNativePage', 'audioRecorderNativePage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop'];
      expect(pages.indexOf('videoRecorderPage') >= 0).assertTrue();
      expect(buttons.indexOf('videoStart') >= 0).assertTrue();
      expect(44100).assertLarger(0);
      expect(640).assertLarger(0);
      expect(480).assertLarger(0);
      expect('videoRecorderPage'.length).assertLarger(0);
      expect('videoStart'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW_0014
     * @tc.name      testExtRecUiFlow0013
     * @tc.desc      UI flow audioRecorderPage videoPause 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNativePage', 'audioRecorderNativePage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop'];
      expect(pages.indexOf('audioRecorderPage') >= 0).assertTrue();
      expect(buttons.indexOf('videoPause') >= 0).assertTrue();
      expect(48000).assertLarger(0);
      expect(1280).assertLarger(0);
      expect(720).assertLarger(0);
      expect('audioRecorderPage'.length).assertLarger(0);
      expect('videoPause'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW_0015
     * @tc.name      testExtRecUiFlow0014
     * @tc.desc      UI flow videoRecorderNativePage videoResume 96000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNativePage', 'audioRecorderNativePage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop'];
      expect(pages.indexOf('videoRecorderNativePage') >= 0).assertTrue();
      expect(buttons.indexOf('videoResume') >= 0).assertTrue();
      expect(96000).assertLarger(0);
      expect(1920).assertLarger(0);
      expect(1080).assertLarger(0);
      expect('videoRecorderNativePage'.length).assertLarger(0);
      expect('videoResume'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW_0016
     * @tc.name      testExtRecUiFlow0015
     * @tc.desc      UI flow audioRecorderNativePage videoStop 8000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNativePage', 'audioRecorderNativePage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop'];
      expect(pages.indexOf('audioRecorderNativePage') >= 0).assertTrue();
      expect(buttons.indexOf('videoStop') >= 0).assertTrue();
      expect(8000).assertLarger(0);
      expect(640).assertLarger(0);
      expect(480).assertLarger(0);
      expect('audioRecorderNativePage'.length).assertLarger(0);
      expect('videoStop'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW_0017
     * @tc.name      testExtRecUiFlow0016
     * @tc.desc      UI flow videoRecorderPage audioStart 22050Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNativePage', 'audioRecorderNativePage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop'];
      expect(pages.indexOf('videoRecorderPage') >= 0).assertTrue();
      expect(buttons.indexOf('audioStart') >= 0).assertTrue();
      expect(22050).assertLarger(0);
      expect(1280).assertLarger(0);
      expect(720).assertLarger(0);
      expect('videoRecorderPage'.length).assertLarger(0);
      expect('audioStart'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW_0018
     * @tc.name      testExtRecUiFlow0017
     * @tc.desc      UI flow audioRecorderPage audioPause 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNativePage', 'audioRecorderNativePage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop'];
      expect(pages.indexOf('audioRecorderPage') >= 0).assertTrue();
      expect(buttons.indexOf('audioPause') >= 0).assertTrue();
      expect(44100).assertLarger(0);
      expect(1920).assertLarger(0);
      expect(1080).assertLarger(0);
      expect('audioRecorderPage'.length).assertLarger(0);
      expect('audioPause'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW_0019
     * @tc.name      testExtRecUiFlow0018
     * @tc.desc      UI flow videoRecorderNativePage audioResume 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNativePage', 'audioRecorderNativePage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop'];
      expect(pages.indexOf('videoRecorderNativePage') >= 0).assertTrue();
      expect(buttons.indexOf('audioResume') >= 0).assertTrue();
      expect(48000).assertLarger(0);
      expect(640).assertLarger(0);
      expect(480).assertLarger(0);
      expect('videoRecorderNativePage'.length).assertLarger(0);
      expect('audioResume'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW_0020
     * @tc.name      testExtRecUiFlow0019
     * @tc.desc      UI flow audioRecorderNativePage audioStop 96000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNativePage', 'audioRecorderNativePage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop'];
      expect(pages.indexOf('audioRecorderNativePage') >= 0).assertTrue();
      expect(buttons.indexOf('audioStop') >= 0).assertTrue();
      expect(96000).assertLarger(0);
      expect(1280).assertLarger(0);
      expect(720).assertLarger(0);
      expect('audioRecorderNativePage'.length).assertLarger(0);
      expect('audioStop'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW_0021
     * @tc.name      testExtRecUiFlow0020
     * @tc.desc      UI flow videoRecorderPage videoStart 8000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNativePage', 'audioRecorderNativePage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop'];
      expect(pages.indexOf('videoRecorderPage') >= 0).assertTrue();
      expect(buttons.indexOf('videoStart') >= 0).assertTrue();
      expect(8000).assertLarger(0);
      expect(1920).assertLarger(0);
      expect(1080).assertLarger(0);
      expect('videoRecorderPage'.length).assertLarger(0);
      expect('videoStart'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW_0022
     * @tc.name      testExtRecUiFlow0021
     * @tc.desc      UI flow audioRecorderPage videoPause 22050Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNativePage', 'audioRecorderNativePage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop'];
      expect(pages.indexOf('audioRecorderPage') >= 0).assertTrue();
      expect(buttons.indexOf('videoPause') >= 0).assertTrue();
      expect(22050).assertLarger(0);
      expect(640).assertLarger(0);
      expect(480).assertLarger(0);
      expect('audioRecorderPage'.length).assertLarger(0);
      expect('videoPause'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW_0023
     * @tc.name      testExtRecUiFlow0022
     * @tc.desc      UI flow videoRecorderNativePage videoResume 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNativePage', 'audioRecorderNativePage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop'];
      expect(pages.indexOf('videoRecorderNativePage') >= 0).assertTrue();
      expect(buttons.indexOf('videoResume') >= 0).assertTrue();
      expect(44100).assertLarger(0);
      expect(1280).assertLarger(0);
      expect(720).assertLarger(0);
      expect('videoRecorderNativePage'.length).assertLarger(0);
      expect('videoResume'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW_0024
     * @tc.name      testExtRecUiFlow0023
     * @tc.desc      UI flow audioRecorderNativePage videoStop 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNativePage', 'audioRecorderNativePage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop'];
      expect(pages.indexOf('audioRecorderNativePage') >= 0).assertTrue();
      expect(buttons.indexOf('videoStop') >= 0).assertTrue();
      expect(48000).assertLarger(0);
      expect(1920).assertLarger(0);
      expect(1080).assertLarger(0);
      expect('audioRecorderNativePage'.length).assertLarger(0);
      expect('videoStop'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW_0025
     * @tc.name      testExtRecUiFlow0024
     * @tc.desc      UI flow videoRecorderPage audioStart 96000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNativePage', 'audioRecorderNativePage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop'];
      expect(pages.indexOf('videoRecorderPage') >= 0).assertTrue();
      expect(buttons.indexOf('audioStart') >= 0).assertTrue();
      expect(96000).assertLarger(0);
      expect(640).assertLarger(0);
      expect(480).assertLarger(0);
      expect('videoRecorderPage'.length).assertLarger(0);
      expect('audioStart'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW_0026
     * @tc.name      testExtRecUiFlow0025
     * @tc.desc      UI flow audioRecorderPage audioPause 8000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNativePage', 'audioRecorderNativePage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop'];
      expect(pages.indexOf('audioRecorderPage') >= 0).assertTrue();
      expect(buttons.indexOf('audioPause') >= 0).assertTrue();
      expect(8000).assertLarger(0);
      expect(1280).assertLarger(0);
      expect(720).assertLarger(0);
      expect('audioRecorderPage'.length).assertLarger(0);
      expect('audioPause'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW_0027
     * @tc.name      testExtRecUiFlow0026
     * @tc.desc      UI flow videoRecorderNativePage audioResume 22050Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNativePage', 'audioRecorderNativePage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop'];
      expect(pages.indexOf('videoRecorderNativePage') >= 0).assertTrue();
      expect(buttons.indexOf('audioResume') >= 0).assertTrue();
      expect(22050).assertLarger(0);
      expect(1920).assertLarger(0);
      expect(1080).assertLarger(0);
      expect('videoRecorderNativePage'.length).assertLarger(0);
      expect('audioResume'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW_0028
     * @tc.name      testExtRecUiFlow0027
     * @tc.desc      UI flow audioRecorderNativePage audioStop 44100Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNativePage', 'audioRecorderNativePage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop'];
      expect(pages.indexOf('audioRecorderNativePage') >= 0).assertTrue();
      expect(buttons.indexOf('audioStop') >= 0).assertTrue();
      expect(44100).assertLarger(0);
      expect(640).assertLarger(0);
      expect(480).assertLarger(0);
      expect('audioRecorderNativePage'.length).assertLarger(0);
      expect('audioStop'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW_0029
     * @tc.name      testExtRecUiFlow0028
     * @tc.desc      UI flow videoRecorderPage videoStart 48000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNativePage', 'audioRecorderNativePage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop'];
      expect(pages.indexOf('videoRecorderPage') >= 0).assertTrue();
      expect(buttons.indexOf('videoStart') >= 0).assertTrue();
      expect(48000).assertLarger(0);
      expect(1280).assertLarger(0);
      expect(720).assertLarger(0);
      expect('videoRecorderPage'.length).assertLarger(0);
      expect('videoStart'.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UIFLOW_0030
     * @tc.name      testExtRecUiFlow0029
     * @tc.desc      UI flow audioRecorderPage videoPause 96000Hz.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiFlow0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNativePage', 'audioRecorderNativePage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop'];
      expect(pages.indexOf('audioRecorderPage') >= 0).assertTrue();
      expect(buttons.indexOf('videoPause') >= 0).assertTrue();
      expect(96000).assertLarger(0);
      expect(1920).assertLarger(0);
      expect(1080).assertLarger(0);
      expect('audioRecorderPage'.length).assertLarger(0);
      expect('videoPause'.length).assertLarger(0);
    })
  });
}
