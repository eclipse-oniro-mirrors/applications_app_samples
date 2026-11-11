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

const TAG: string = '[Sample_avRecorderUiContracts]';
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

export default function avRecorderUiContractsTest(): void {
  describe('avRecorderUiContractsTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UICONTRACT_0001
     * @tc.name      testExtRecUiContract0000
     * @tc.desc      UI contract videoRecorderPage audioStart.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiContract0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNDKPage', 'audioRecorderNDKPage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop', 'audioSetting', 'videoSetting'];
      expect(pages.indexOf('videoRecorderPage') >= 0).assertTrue();
      expect(buttons.indexOf('audioStart') >= 0).assertTrue();
      expect(pages.length).assertEqual(4);
      expect(buttons.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UICONTRACT_0002
     * @tc.name      testExtRecUiContract0001
     * @tc.desc      UI contract audioRecorderPage audioPause.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiContract0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNDKPage', 'audioRecorderNDKPage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop', 'audioSetting', 'videoSetting'];
      expect(pages.indexOf('audioRecorderPage') >= 0).assertTrue();
      expect(buttons.indexOf('audioPause') >= 0).assertTrue();
      expect(pages.length).assertEqual(4);
      expect(buttons.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UICONTRACT_0003
     * @tc.name      testExtRecUiContract0002
     * @tc.desc      UI contract videoRecorderNativePage audioResume.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiContract0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNDKPage', 'audioRecorderNDKPage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop', 'audioSetting', 'videoSetting'];
      expect(pages.indexOf('videoRecorderNDKPage') >= 0).assertTrue();
      expect(buttons.indexOf('audioResume') >= 0).assertTrue();
      expect(pages.length).assertEqual(4);
      expect(buttons.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UICONTRACT_0004
     * @tc.name      testExtRecUiContract0003
     * @tc.desc      UI contract audioRecorderNativePage audioStop.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiContract0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNDKPage', 'audioRecorderNDKPage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop', 'audioSetting', 'videoSetting'];
      expect(pages.indexOf('audioRecorderNDKPage') >= 0).assertTrue();
      expect(buttons.indexOf('audioStop') >= 0).assertTrue();
      expect(pages.length).assertEqual(4);
      expect(buttons.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UICONTRACT_0005
     * @tc.name      testExtRecUiContract0004
     * @tc.desc      UI contract videoRecorderPage videoStart.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiContract0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNDKPage', 'audioRecorderNDKPage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop', 'audioSetting', 'videoSetting'];
      expect(pages.indexOf('videoRecorderPage') >= 0).assertTrue();
      expect(buttons.indexOf('videoStart') >= 0).assertTrue();
      expect(pages.length).assertEqual(4);
      expect(buttons.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UICONTRACT_0006
     * @tc.name      testExtRecUiContract0005
     * @tc.desc      UI contract audioRecorderPage videoPause.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiContract0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNDKPage', 'audioRecorderNDKPage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop', 'audioSetting', 'videoSetting'];
      expect(pages.indexOf('audioRecorderPage') >= 0).assertTrue();
      expect(buttons.indexOf('videoPause') >= 0).assertTrue();
      expect(pages.length).assertEqual(4);
      expect(buttons.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UICONTRACT_0007
     * @tc.name      testExtRecUiContract0006
     * @tc.desc      UI contract videoRecorderNativePage videoResume.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiContract0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNDKPage', 'audioRecorderNDKPage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop', 'audioSetting', 'videoSetting'];
      expect(pages.indexOf('videoRecorderNDKPage') >= 0).assertTrue();
      expect(buttons.indexOf('videoResume') >= 0).assertTrue();
      expect(pages.length).assertEqual(4);
      expect(buttons.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UICONTRACT_0008
     * @tc.name      testExtRecUiContract0007
     * @tc.desc      UI contract audioRecorderNativePage videoStop.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiContract0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNDKPage', 'audioRecorderNDKPage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop', 'audioSetting', 'videoSetting'];
      expect(pages.indexOf('audioRecorderNDKPage') >= 0).assertTrue();
      expect(buttons.indexOf('videoStop') >= 0).assertTrue();
      expect(pages.length).assertEqual(4);
      expect(buttons.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UICONTRACT_0009
     * @tc.name      testExtRecUiContract0008
     * @tc.desc      UI contract videoRecorderPage audioSetting.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiContract0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNDKPage', 'audioRecorderNDKPage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop', 'audioSetting', 'videoSetting'];
      expect(pages.indexOf('videoRecorderPage') >= 0).assertTrue();
      expect(buttons.indexOf('audioSetting') >= 0).assertTrue();
      expect(pages.length).assertEqual(4);
      expect(buttons.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UICONTRACT_0010
     * @tc.name      testExtRecUiContract0009
     * @tc.desc      UI contract audioRecorderPage videoSetting.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiContract0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNDKPage', 'audioRecorderNDKPage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop', 'audioSetting', 'videoSetting'];
      expect(pages.indexOf('audioRecorderPage') >= 0).assertTrue();
      expect(buttons.indexOf('videoSetting') >= 0).assertTrue();
      expect(pages.length).assertEqual(4);
      expect(buttons.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UICONTRACT_0011
     * @tc.name      testExtRecUiContract0010
     * @tc.desc      UI contract videoRecorderNativePage audioStart.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiContract0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNDKPage', 'audioRecorderNDKPage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop', 'audioSetting', 'videoSetting'];
      expect(pages.indexOf('videoRecorderNDKPage') >= 0).assertTrue();
      expect(buttons.indexOf('audioStart') >= 0).assertTrue();
      expect(pages.length).assertEqual(4);
      expect(buttons.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UICONTRACT_0012
     * @tc.name      testExtRecUiContract0011
     * @tc.desc      UI contract audioRecorderNativePage audioPause.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiContract0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNDKPage', 'audioRecorderNDKPage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop', 'audioSetting', 'videoSetting'];
      expect(pages.indexOf('audioRecorderNDKPage') >= 0).assertTrue();
      expect(buttons.indexOf('audioPause') >= 0).assertTrue();
      expect(pages.length).assertEqual(4);
      expect(buttons.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UICONTRACT_0013
     * @tc.name      testExtRecUiContract0012
     * @tc.desc      UI contract videoRecorderPage audioResume.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiContract0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNDKPage', 'audioRecorderNDKPage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop', 'audioSetting', 'videoSetting'];
      expect(pages.indexOf('videoRecorderPage') >= 0).assertTrue();
      expect(buttons.indexOf('audioResume') >= 0).assertTrue();
      expect(pages.length).assertEqual(4);
      expect(buttons.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UICONTRACT_0014
     * @tc.name      testExtRecUiContract0013
     * @tc.desc      UI contract audioRecorderPage audioStop.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiContract0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNDKPage', 'audioRecorderNDKPage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop', 'audioSetting', 'videoSetting'];
      expect(pages.indexOf('audioRecorderPage') >= 0).assertTrue();
      expect(buttons.indexOf('audioStop') >= 0).assertTrue();
      expect(pages.length).assertEqual(4);
      expect(buttons.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UICONTRACT_0015
     * @tc.name      testExtRecUiContract0014
     * @tc.desc      UI contract videoRecorderNativePage videoStart.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiContract0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNDKPage', 'audioRecorderNDKPage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop', 'audioSetting', 'videoSetting'];
      expect(pages.indexOf('videoRecorderNDKPage') >= 0).assertTrue();
      expect(buttons.indexOf('videoStart') >= 0).assertTrue();
      expect(pages.length).assertEqual(4);
      expect(buttons.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UICONTRACT_0016
     * @tc.name      testExtRecUiContract0015
     * @tc.desc      UI contract audioRecorderNativePage videoPause.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiContract0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNDKPage', 'audioRecorderNDKPage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop', 'audioSetting', 'videoSetting'];
      expect(pages.indexOf('audioRecorderNDKPage') >= 0).assertTrue();
      expect(buttons.indexOf('videoPause') >= 0).assertTrue();
      expect(pages.length).assertEqual(4);
      expect(buttons.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UICONTRACT_0017
     * @tc.name      testExtRecUiContract0016
     * @tc.desc      UI contract videoRecorderPage videoResume.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiContract0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNDKPage', 'audioRecorderNDKPage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop', 'audioSetting', 'videoSetting'];
      expect(pages.indexOf('videoRecorderPage') >= 0).assertTrue();
      expect(buttons.indexOf('videoResume') >= 0).assertTrue();
      expect(pages.length).assertEqual(4);
      expect(buttons.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UICONTRACT_0018
     * @tc.name      testExtRecUiContract0017
     * @tc.desc      UI contract audioRecorderPage videoStop.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiContract0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNDKPage', 'audioRecorderNDKPage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop', 'audioSetting', 'videoSetting'];
      expect(pages.indexOf('audioRecorderPage') >= 0).assertTrue();
      expect(buttons.indexOf('videoStop') >= 0).assertTrue();
      expect(pages.length).assertEqual(4);
      expect(buttons.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UICONTRACT_0019
     * @tc.name      testExtRecUiContract0018
     * @tc.desc      UI contract videoRecorderNativePage audioSetting.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiContract0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNDKPage', 'audioRecorderNDKPage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop', 'audioSetting', 'videoSetting'];
      expect(pages.indexOf('videoRecorderNDKPage') >= 0).assertTrue();
      expect(buttons.indexOf('audioSetting') >= 0).assertTrue();
      expect(pages.length).assertEqual(4);
      expect(buttons.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UICONTRACT_0020
     * @tc.name      testExtRecUiContract0019
     * @tc.desc      UI contract audioRecorderNativePage videoSetting.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiContract0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNDKPage', 'audioRecorderNDKPage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop', 'audioSetting', 'videoSetting'];
      expect(pages.indexOf('audioRecorderNDKPage') >= 0).assertTrue();
      expect(buttons.indexOf('videoSetting') >= 0).assertTrue();
      expect(pages.length).assertEqual(4);
      expect(buttons.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UICONTRACT_0021
     * @tc.name      testExtRecUiContract0020
     * @tc.desc      UI contract videoRecorderPage audioStart.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiContract0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNDKPage', 'audioRecorderNDKPage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop', 'audioSetting', 'videoSetting'];
      expect(pages.indexOf('videoRecorderPage') >= 0).assertTrue();
      expect(buttons.indexOf('audioStart') >= 0).assertTrue();
      expect(pages.length).assertEqual(4);
      expect(buttons.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UICONTRACT_0022
     * @tc.name      testExtRecUiContract0021
     * @tc.desc      UI contract audioRecorderPage audioPause.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiContract0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNDKPage', 'audioRecorderNDKPage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop', 'audioSetting', 'videoSetting'];
      expect(pages.indexOf('audioRecorderPage') >= 0).assertTrue();
      expect(buttons.indexOf('audioPause') >= 0).assertTrue();
      expect(pages.length).assertEqual(4);
      expect(buttons.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UICONTRACT_0023
     * @tc.name      testExtRecUiContract0022
     * @tc.desc      UI contract videoRecorderNativePage audioResume.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiContract0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNDKPage', 'audioRecorderNDKPage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop', 'audioSetting', 'videoSetting'];
      expect(pages.indexOf('videoRecorderNDKPage') >= 0).assertTrue();
      expect(buttons.indexOf('audioResume') >= 0).assertTrue();
      expect(pages.length).assertEqual(4);
      expect(buttons.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UICONTRACT_0024
     * @tc.name      testExtRecUiContract0023
     * @tc.desc      UI contract audioRecorderNativePage audioStop.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiContract0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNDKPage', 'audioRecorderNDKPage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop', 'audioSetting', 'videoSetting'];
      expect(pages.indexOf('audioRecorderNDKPage') >= 0).assertTrue();
      expect(buttons.indexOf('audioStop') >= 0).assertTrue();
      expect(pages.length).assertEqual(4);
      expect(buttons.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UICONTRACT_0025
     * @tc.name      testExtRecUiContract0024
     * @tc.desc      UI contract videoRecorderPage videoStart.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiContract0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNDKPage', 'audioRecorderNDKPage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop', 'audioSetting', 'videoSetting'];
      expect(pages.indexOf('videoRecorderPage') >= 0).assertTrue();
      expect(buttons.indexOf('videoStart') >= 0).assertTrue();
      expect(pages.length).assertEqual(4);
      expect(buttons.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UICONTRACT_0026
     * @tc.name      testExtRecUiContract0025
     * @tc.desc      UI contract audioRecorderPage videoPause.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiContract0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNDKPage', 'audioRecorderNDKPage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop', 'audioSetting', 'videoSetting'];
      expect(pages.indexOf('audioRecorderPage') >= 0).assertTrue();
      expect(buttons.indexOf('videoPause') >= 0).assertTrue();
      expect(pages.length).assertEqual(4);
      expect(buttons.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UICONTRACT_0027
     * @tc.name      testExtRecUiContract0026
     * @tc.desc      UI contract videoRecorderNativePage videoResume.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiContract0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNDKPage', 'audioRecorderNDKPage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop', 'audioSetting', 'videoSetting'];
      expect(pages.indexOf('videoRecorderNDKPage') >= 0).assertTrue();
      expect(buttons.indexOf('videoResume') >= 0).assertTrue();
      expect(pages.length).assertEqual(4);
      expect(buttons.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UICONTRACT_0028
     * @tc.name      testExtRecUiContract0027
     * @tc.desc      UI contract audioRecorderNativePage videoStop.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiContract0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNDKPage', 'audioRecorderNDKPage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop', 'audioSetting', 'videoSetting'];
      expect(pages.indexOf('audioRecorderNDKPage') >= 0).assertTrue();
      expect(buttons.indexOf('videoStop') >= 0).assertTrue();
      expect(pages.length).assertEqual(4);
      expect(buttons.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UICONTRACT_0029
     * @tc.name      testExtRecUiContract0028
     * @tc.desc      UI contract videoRecorderPage audioSetting.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiContract0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNDKPage', 'audioRecorderNDKPage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop', 'audioSetting', 'videoSetting'];
      expect(pages.indexOf('videoRecorderPage') >= 0).assertTrue();
      expect(buttons.indexOf('audioSetting') >= 0).assertTrue();
      expect(pages.length).assertEqual(4);
      expect(buttons.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UICONTRACT_0030
     * @tc.name      testExtRecUiContract0029
     * @tc.desc      UI contract audioRecorderPage videoSetting.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiContract0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNDKPage', 'audioRecorderNDKPage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop', 'audioSetting', 'videoSetting'];
      expect(pages.indexOf('audioRecorderPage') >= 0).assertTrue();
      expect(buttons.indexOf('videoSetting') >= 0).assertTrue();
      expect(pages.length).assertEqual(4);
      expect(buttons.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UICONTRACT_0031
     * @tc.name      testExtRecUiContract0030
     * @tc.desc      UI contract videoRecorderNativePage audioStart.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiContract0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNDKPage', 'audioRecorderNDKPage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop', 'audioSetting', 'videoSetting'];
      expect(pages.indexOf('videoRecorderNDKPage') >= 0).assertTrue();
      expect(buttons.indexOf('audioStart') >= 0).assertTrue();
      expect(pages.length).assertEqual(4);
      expect(buttons.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UICONTRACT_0032
     * @tc.name      testExtRecUiContract0031
     * @tc.desc      UI contract audioRecorderNativePage audioPause.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiContract0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNDKPage', 'audioRecorderNDKPage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop', 'audioSetting', 'videoSetting'];
      expect(pages.indexOf('audioRecorderNDKPage') >= 0).assertTrue();
      expect(buttons.indexOf('audioPause') >= 0).assertTrue();
      expect(pages.length).assertEqual(4);
      expect(buttons.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UICONTRACT_0033
     * @tc.name      testExtRecUiContract0032
     * @tc.desc      UI contract videoRecorderPage audioResume.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiContract0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNDKPage', 'audioRecorderNDKPage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop', 'audioSetting', 'videoSetting'];
      expect(pages.indexOf('videoRecorderPage') >= 0).assertTrue();
      expect(buttons.indexOf('audioResume') >= 0).assertTrue();
      expect(pages.length).assertEqual(4);
      expect(buttons.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UICONTRACT_0034
     * @tc.name      testExtRecUiContract0033
     * @tc.desc      UI contract audioRecorderPage audioStop.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiContract0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNDKPage', 'audioRecorderNDKPage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop', 'audioSetting', 'videoSetting'];
      expect(pages.indexOf('audioRecorderPage') >= 0).assertTrue();
      expect(buttons.indexOf('audioStop') >= 0).assertTrue();
      expect(pages.length).assertEqual(4);
      expect(buttons.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UICONTRACT_0035
     * @tc.name      testExtRecUiContract0034
     * @tc.desc      UI contract videoRecorderNativePage videoStart.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiContract0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNDKPage', 'audioRecorderNDKPage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop', 'audioSetting', 'videoSetting'];
      expect(pages.indexOf('videoRecorderNDKPage') >= 0).assertTrue();
      expect(buttons.indexOf('videoStart') >= 0).assertTrue();
      expect(pages.length).assertEqual(4);
      expect(buttons.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UICONTRACT_0036
     * @tc.name      testExtRecUiContract0035
     * @tc.desc      UI contract audioRecorderNativePage videoPause.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiContract0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNDKPage', 'audioRecorderNDKPage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop', 'audioSetting', 'videoSetting'];
      expect(pages.indexOf('audioRecorderNDKPage') >= 0).assertTrue();
      expect(buttons.indexOf('videoPause') >= 0).assertTrue();
      expect(pages.length).assertEqual(4);
      expect(buttons.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UICONTRACT_0037
     * @tc.name      testExtRecUiContract0036
     * @tc.desc      UI contract videoRecorderPage videoResume.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiContract0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNDKPage', 'audioRecorderNDKPage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop', 'audioSetting', 'videoSetting'];
      expect(pages.indexOf('videoRecorderPage') >= 0).assertTrue();
      expect(buttons.indexOf('videoResume') >= 0).assertTrue();
      expect(pages.length).assertEqual(4);
      expect(buttons.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UICONTRACT_0038
     * @tc.name      testExtRecUiContract0037
     * @tc.desc      UI contract audioRecorderPage videoStop.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiContract0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNDKPage', 'audioRecorderNDKPage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop', 'audioSetting', 'videoSetting'];
      expect(pages.indexOf('audioRecorderPage') >= 0).assertTrue();
      expect(buttons.indexOf('videoStop') >= 0).assertTrue();
      expect(pages.length).assertEqual(4);
      expect(buttons.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UICONTRACT_0039
     * @tc.name      testExtRecUiContract0038
     * @tc.desc      UI contract videoRecorderNativePage audioSetting.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiContract0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNDKPage', 'audioRecorderNDKPage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop', 'audioSetting', 'videoSetting'];
      expect(pages.indexOf('videoRecorderNDKPage') >= 0).assertTrue();
      expect(buttons.indexOf('audioSetting') >= 0).assertTrue();
      expect(pages.length).assertEqual(4);
      expect(buttons.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_UICONTRACT_0040
     * @tc.name      testExtRecUiContract0039
     * @tc.desc      UI contract audioRecorderNativePage videoSetting.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecUiContract0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const pages: string[] = ['videoRecorderPage', 'audioRecorderPage', 'videoRecorderNDKPage', 'audioRecorderNDKPage'];
      const buttons: string[] = ['audioStart', 'audioPause', 'audioResume', 'audioStop', 'videoStart', 'videoPause', 'videoResume', 'videoStop', 'audioSetting', 'videoSetting'];
      expect(pages.indexOf('audioRecorderNDKPage') >= 0).assertTrue();
      expect(buttons.indexOf('videoSetting') >= 0).assertTrue();
      expect(pages.length).assertEqual(4);
      expect(buttons.length).assertEqual(10);
    })
  });
}
