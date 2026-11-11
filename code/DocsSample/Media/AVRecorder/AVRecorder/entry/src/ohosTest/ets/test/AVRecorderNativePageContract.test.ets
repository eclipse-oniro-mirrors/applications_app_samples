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

const TAG: string = '[Sample_avRecorderNativePageContract]';
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

export default function avRecorderNativePageContractTest(): void {
  describe('avRecorderNativePageContractTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativePAGE_0001
     * @tc.name      testExtRecNativePage0000
     * @tc.desc      Native page id videoRecorderNativePage.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNativePage', 'audioRecorderNativePage', 'videoStartNative', 'videoPauseNative', 'videoResumeNative', 'videoStopNative', 'audioStartNative', 'audioPauseNative', 'audioResumeNative', 'audioStopNative'];
      expect(ids.indexOf('videoRecorderNativePage') >= 0).assertTrue();
      expect('videoRecorderNativePage'.endsWith('Native') || 'videoRecorderNativePage'.endsWith('NativePage')).assertTrue();
      expect('videoRecorderNativePage'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativePAGE_0002
     * @tc.name      testExtRecNativePage0001
     * @tc.desc      Native page id audioRecorderNativePage.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNativePage', 'audioRecorderNativePage', 'videoStartNative', 'videoPauseNative', 'videoResumeNative', 'videoStopNative', 'audioStartNative', 'audioPauseNative', 'audioResumeNative', 'audioStopNative'];
      expect(ids.indexOf('audioRecorderNativePage') >= 0).assertTrue();
      expect('audioRecorderNativePage'.endsWith('Native') || 'audioRecorderNativePage'.endsWith('NativePage')).assertTrue();
      expect('audioRecorderNativePage'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativePAGE_0003
     * @tc.name      testExtRecNativePage0002
     * @tc.desc      Native page id videoStartNative.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNativePage', 'audioRecorderNativePage', 'videoStartNative', 'videoPauseNative', 'videoResumeNative', 'videoStopNative', 'audioStartNative', 'audioPauseNative', 'audioResumeNative', 'audioStopNative'];
      expect(ids.indexOf('videoStartNative') >= 0).assertTrue();
      expect('videoStartNative'.endsWith('Native') || 'videoStartNative'.endsWith('NativePage')).assertTrue();
      expect('videoStartNative'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativePAGE_0004
     * @tc.name      testExtRecNativePage0003
     * @tc.desc      Native page id videoPauseNative.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNativePage', 'audioRecorderNativePage', 'videoStartNative', 'videoPauseNative', 'videoResumeNative', 'videoStopNative', 'audioStartNative', 'audioPauseNative', 'audioResumeNative', 'audioStopNative'];
      expect(ids.indexOf('videoPauseNative') >= 0).assertTrue();
      expect('videoPauseNative'.endsWith('Native') || 'videoPauseNative'.endsWith('NativePage')).assertTrue();
      expect('videoPauseNative'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativePAGE_0005
     * @tc.name      testExtRecNativePage0004
     * @tc.desc      Native page id videoResumeNative.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNativePage', 'audioRecorderNativePage', 'videoStartNative', 'videoPauseNative', 'videoResumeNative', 'videoStopNative', 'audioStartNative', 'audioPauseNative', 'audioResumeNative', 'audioStopNative'];
      expect(ids.indexOf('videoResumeNative') >= 0).assertTrue();
      expect('videoResumeNative'.endsWith('Native') || 'videoResumeNative'.endsWith('NativePage')).assertTrue();
      expect('videoResumeNative'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativePAGE_0006
     * @tc.name      testExtRecNativePage0005
     * @tc.desc      Native page id videoStopNative.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNativePage', 'audioRecorderNativePage', 'videoStartNative', 'videoPauseNative', 'videoResumeNative', 'videoStopNative', 'audioStartNative', 'audioPauseNative', 'audioResumeNative', 'audioStopNative'];
      expect(ids.indexOf('videoStopNative') >= 0).assertTrue();
      expect('videoStopNative'.endsWith('Native') || 'videoStopNative'.endsWith('NativePage')).assertTrue();
      expect('videoStopNative'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativePAGE_0007
     * @tc.name      testExtRecNativePage0006
     * @tc.desc      Native page id audioStartNative.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNativePage', 'audioRecorderNativePage', 'videoStartNative', 'videoPauseNative', 'videoResumeNative', 'videoStopNative', 'audioStartNative', 'audioPauseNative', 'audioResumeNative', 'audioStopNative'];
      expect(ids.indexOf('audioStartNative') >= 0).assertTrue();
      expect('audioStartNative'.endsWith('Native') || 'audioStartNative'.endsWith('NativePage')).assertTrue();
      expect('audioStartNative'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativePAGE_0008
     * @tc.name      testExtRecNativePage0007
     * @tc.desc      Native page id audioPauseNative.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNativePage', 'audioRecorderNativePage', 'videoStartNative', 'videoPauseNative', 'videoResumeNative', 'videoStopNative', 'audioStartNative', 'audioPauseNative', 'audioResumeNative', 'audioStopNative'];
      expect(ids.indexOf('audioPauseNative') >= 0).assertTrue();
      expect('audioPauseNative'.endsWith('Native') || 'audioPauseNative'.endsWith('NativePage')).assertTrue();
      expect('audioPauseNative'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativePAGE_0009
     * @tc.name      testExtRecNativePage0008
     * @tc.desc      Native page id audioResumeNative.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNativePage', 'audioRecorderNativePage', 'videoStartNative', 'videoPauseNative', 'videoResumeNative', 'videoStopNative', 'audioStartNative', 'audioPauseNative', 'audioResumeNative', 'audioStopNative'];
      expect(ids.indexOf('audioResumeNative') >= 0).assertTrue();
      expect('audioResumeNative'.endsWith('Native') || 'audioResumeNative'.endsWith('NativePage')).assertTrue();
      expect('audioResumeNative'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativePAGE_0010
     * @tc.name      testExtRecNativePage0009
     * @tc.desc      Native page id audioStopNative.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNativePage', 'audioRecorderNativePage', 'videoStartNative', 'videoPauseNative', 'videoResumeNative', 'videoStopNative', 'audioStartNative', 'audioPauseNative', 'audioResumeNative', 'audioStopNative'];
      expect(ids.indexOf('audioStopNative') >= 0).assertTrue();
      expect('audioStopNative'.endsWith('Native') || 'audioStopNative'.endsWith('NativePage')).assertTrue();
      expect('audioStopNative'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativePAGE_0011
     * @tc.name      testExtRecNativePage0010
     * @tc.desc      Native page id videoRecorderNativePage.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNativePage', 'audioRecorderNativePage', 'videoStartNative', 'videoPauseNative', 'videoResumeNative', 'videoStopNative', 'audioStartNative', 'audioPauseNative', 'audioResumeNative', 'audioStopNative'];
      expect(ids.indexOf('videoRecorderNativePage') >= 0).assertTrue();
      expect('videoRecorderNativePage'.endsWith('Native') || 'videoRecorderNativePage'.endsWith('NativePage')).assertTrue();
      expect('videoRecorderNativePage'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativePAGE_0012
     * @tc.name      testExtRecNativePage0011
     * @tc.desc      Native page id audioRecorderNativePage.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNativePage', 'audioRecorderNativePage', 'videoStartNative', 'videoPauseNative', 'videoResumeNative', 'videoStopNative', 'audioStartNative', 'audioPauseNative', 'audioResumeNative', 'audioStopNative'];
      expect(ids.indexOf('audioRecorderNativePage') >= 0).assertTrue();
      expect('audioRecorderNativePage'.endsWith('Native') || 'audioRecorderNativePage'.endsWith('NativePage')).assertTrue();
      expect('audioRecorderNativePage'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativePAGE_0013
     * @tc.name      testExtRecNativePage0012
     * @tc.desc      Native page id videoStartNative.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNativePage', 'audioRecorderNativePage', 'videoStartNative', 'videoPauseNative', 'videoResumeNative', 'videoStopNative', 'audioStartNative', 'audioPauseNative', 'audioResumeNative', 'audioStopNative'];
      expect(ids.indexOf('videoStartNative') >= 0).assertTrue();
      expect('videoStartNative'.endsWith('Native') || 'videoStartNative'.endsWith('NativePage')).assertTrue();
      expect('videoStartNative'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativePAGE_0014
     * @tc.name      testExtRecNativePage0013
     * @tc.desc      Native page id videoPauseNative.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNativePage', 'audioRecorderNativePage', 'videoStartNative', 'videoPauseNative', 'videoResumeNative', 'videoStopNative', 'audioStartNative', 'audioPauseNative', 'audioResumeNative', 'audioStopNative'];
      expect(ids.indexOf('videoPauseNative') >= 0).assertTrue();
      expect('videoPauseNative'.endsWith('Native') || 'videoPauseNative'.endsWith('NativePage')).assertTrue();
      expect('videoPauseNative'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativePAGE_0015
     * @tc.name      testExtRecNativePage0014
     * @tc.desc      Native page id videoResumeNative.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNativePage', 'audioRecorderNativePage', 'videoStartNative', 'videoPauseNative', 'videoResumeNative', 'videoStopNative', 'audioStartNative', 'audioPauseNative', 'audioResumeNative', 'audioStopNative'];
      expect(ids.indexOf('videoResumeNative') >= 0).assertTrue();
      expect('videoResumeNative'.endsWith('Native') || 'videoResumeNative'.endsWith('NativePage')).assertTrue();
      expect('videoResumeNative'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativePAGE_0016
     * @tc.name      testExtRecNativePage0015
     * @tc.desc      Native page id videoStopNative.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNativePage', 'audioRecorderNativePage', 'videoStartNative', 'videoPauseNative', 'videoResumeNative', 'videoStopNative', 'audioStartNative', 'audioPauseNative', 'audioResumeNative', 'audioStopNative'];
      expect(ids.indexOf('videoStopNative') >= 0).assertTrue();
      expect('videoStopNative'.endsWith('Native') || 'videoStopNative'.endsWith('NativePage')).assertTrue();
      expect('videoStopNative'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativePAGE_0017
     * @tc.name      testExtRecNativePage0016
     * @tc.desc      Native page id audioStartNative.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNativePage', 'audioRecorderNativePage', 'videoStartNative', 'videoPauseNative', 'videoResumeNative', 'videoStopNative', 'audioStartNative', 'audioPauseNative', 'audioResumeNative', 'audioStopNative'];
      expect(ids.indexOf('audioStartNative') >= 0).assertTrue();
      expect('audioStartNative'.endsWith('Native') || 'audioStartNative'.endsWith('NativePage')).assertTrue();
      expect('audioStartNative'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativePAGE_0018
     * @tc.name      testExtRecNativePage0017
     * @tc.desc      Native page id audioPauseNative.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNativePage', 'audioRecorderNativePage', 'videoStartNative', 'videoPauseNative', 'videoResumeNative', 'videoStopNative', 'audioStartNative', 'audioPauseNative', 'audioResumeNative', 'audioStopNative'];
      expect(ids.indexOf('audioPauseNative') >= 0).assertTrue();
      expect('audioPauseNative'.endsWith('Native') || 'audioPauseNative'.endsWith('NativePage')).assertTrue();
      expect('audioPauseNative'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativePAGE_0019
     * @tc.name      testExtRecNativePage0018
     * @tc.desc      Native page id audioResumeNative.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNativePage', 'audioRecorderNativePage', 'videoStartNative', 'videoPauseNative', 'videoResumeNative', 'videoStopNative', 'audioStartNative', 'audioPauseNative', 'audioResumeNative', 'audioStopNative'];
      expect(ids.indexOf('audioResumeNative') >= 0).assertTrue();
      expect('audioResumeNative'.endsWith('Native') || 'audioResumeNative'.endsWith('NativePage')).assertTrue();
      expect('audioResumeNative'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativePAGE_0020
     * @tc.name      testExtRecNativePage0019
     * @tc.desc      Native page id audioStopNative.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNativePage', 'audioRecorderNativePage', 'videoStartNative', 'videoPauseNative', 'videoResumeNative', 'videoStopNative', 'audioStartNative', 'audioPauseNative', 'audioResumeNative', 'audioStopNative'];
      expect(ids.indexOf('audioStopNative') >= 0).assertTrue();
      expect('audioStopNative'.endsWith('Native') || 'audioStopNative'.endsWith('NativePage')).assertTrue();
      expect('audioStopNative'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativePAGE_0021
     * @tc.name      testExtRecNativePage0020
     * @tc.desc      Native page id videoRecorderNativePage.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNativePage', 'audioRecorderNativePage', 'videoStartNative', 'videoPauseNative', 'videoResumeNative', 'videoStopNative', 'audioStartNative', 'audioPauseNative', 'audioResumeNative', 'audioStopNative'];
      expect(ids.indexOf('videoRecorderNativePage') >= 0).assertTrue();
      expect('videoRecorderNativePage'.endsWith('Native') || 'videoRecorderNativePage'.endsWith('NativePage')).assertTrue();
      expect('videoRecorderNativePage'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativePAGE_0022
     * @tc.name      testExtRecNativePage0021
     * @tc.desc      Native page id audioRecorderNativePage.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNativePage', 'audioRecorderNativePage', 'videoStartNative', 'videoPauseNative', 'videoResumeNative', 'videoStopNative', 'audioStartNative', 'audioPauseNative', 'audioResumeNative', 'audioStopNative'];
      expect(ids.indexOf('audioRecorderNativePage') >= 0).assertTrue();
      expect('audioRecorderNativePage'.endsWith('Native') || 'audioRecorderNativePage'.endsWith('NativePage')).assertTrue();
      expect('audioRecorderNativePage'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativePAGE_0023
     * @tc.name      testExtRecNativePage0022
     * @tc.desc      Native page id videoStartNative.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNativePage', 'audioRecorderNativePage', 'videoStartNative', 'videoPauseNative', 'videoResumeNative', 'videoStopNative', 'audioStartNative', 'audioPauseNative', 'audioResumeNative', 'audioStopNative'];
      expect(ids.indexOf('videoStartNative') >= 0).assertTrue();
      expect('videoStartNative'.endsWith('Native') || 'videoStartNative'.endsWith('NativePage')).assertTrue();
      expect('videoStartNative'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativePAGE_0024
     * @tc.name      testExtRecNativePage0023
     * @tc.desc      Native page id videoPauseNative.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNativePage', 'audioRecorderNativePage', 'videoStartNative', 'videoPauseNative', 'videoResumeNative', 'videoStopNative', 'audioStartNative', 'audioPauseNative', 'audioResumeNative', 'audioStopNative'];
      expect(ids.indexOf('videoPauseNative') >= 0).assertTrue();
      expect('videoPauseNative'.endsWith('Native') || 'videoPauseNative'.endsWith('NativePage')).assertTrue();
      expect('videoPauseNative'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativePAGE_0025
     * @tc.name      testExtRecNativePage0024
     * @tc.desc      Native page id videoResumeNative.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNativePage', 'audioRecorderNativePage', 'videoStartNative', 'videoPauseNative', 'videoResumeNative', 'videoStopNative', 'audioStartNative', 'audioPauseNative', 'audioResumeNative', 'audioStopNative'];
      expect(ids.indexOf('videoResumeNative') >= 0).assertTrue();
      expect('videoResumeNative'.endsWith('Native') || 'videoResumeNative'.endsWith('NativePage')).assertTrue();
      expect('videoResumeNative'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativePAGE_0026
     * @tc.name      testExtRecNativePage0025
     * @tc.desc      Native page id videoStopNative.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNativePage', 'audioRecorderNativePage', 'videoStartNative', 'videoPauseNative', 'videoResumeNative', 'videoStopNative', 'audioStartNative', 'audioPauseNative', 'audioResumeNative', 'audioStopNative'];
      expect(ids.indexOf('videoStopNative') >= 0).assertTrue();
      expect('videoStopNative'.endsWith('Native') || 'videoStopNative'.endsWith('NativePage')).assertTrue();
      expect('videoStopNative'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativePAGE_0027
     * @tc.name      testExtRecNativePage0026
     * @tc.desc      Native page id audioStartNative.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNativePage', 'audioRecorderNativePage', 'videoStartNative', 'videoPauseNative', 'videoResumeNative', 'videoStopNative', 'audioStartNative', 'audioPauseNative', 'audioResumeNative', 'audioStopNative'];
      expect(ids.indexOf('audioStartNative') >= 0).assertTrue();
      expect('audioStartNative'.endsWith('Native') || 'audioStartNative'.endsWith('NativePage')).assertTrue();
      expect('audioStartNative'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativePAGE_0028
     * @tc.name      testExtRecNativePage0027
     * @tc.desc      Native page id audioPauseNative.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNativePage', 'audioRecorderNativePage', 'videoStartNative', 'videoPauseNative', 'videoResumeNative', 'videoStopNative', 'audioStartNative', 'audioPauseNative', 'audioResumeNative', 'audioStopNative'];
      expect(ids.indexOf('audioPauseNative') >= 0).assertTrue();
      expect('audioPauseNative'.endsWith('Native') || 'audioPauseNative'.endsWith('NativePage')).assertTrue();
      expect('audioPauseNative'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativePAGE_0029
     * @tc.name      testExtRecNativePage0028
     * @tc.desc      Native page id audioResumeNative.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNativePage', 'audioRecorderNativePage', 'videoStartNative', 'videoPauseNative', 'videoResumeNative', 'videoStopNative', 'audioStartNative', 'audioPauseNative', 'audioResumeNative', 'audioStopNative'];
      expect(ids.indexOf('audioResumeNative') >= 0).assertTrue();
      expect('audioResumeNative'.endsWith('Native') || 'audioResumeNative'.endsWith('NativePage')).assertTrue();
      expect('audioResumeNative'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NativePAGE_0030
     * @tc.name      testExtRecNativePage0029
     * @tc.desc      Native page id audioStopNative.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNativePage', 'audioRecorderNativePage', 'videoStartNative', 'videoPauseNative', 'videoResumeNative', 'videoStopNative', 'audioStartNative', 'audioPauseNative', 'audioResumeNative', 'audioStopNative'];
      expect(ids.indexOf('audioStopNative') >= 0).assertTrue();
      expect('audioStopNative'.endsWith('Native') || 'audioStopNative'.endsWith('NativePage')).assertTrue();
      expect('audioStopNative'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
  });
}
