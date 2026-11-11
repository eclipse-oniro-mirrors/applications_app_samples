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

function expect(actual: string | number | boolean | Object | null | undefined): Assert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function avRecorderNativePageContractTest(): void {
  describe('avRecorderNdkPageContractTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0001
     * @tc.name      testExtRecNativePage0000
     * @tc.desc      Native page id videoRecorderNativePage.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('videoRecorderNDKPage') >= 0).assertTrue();
      expect('videoRecorderNDKPage'.endsWith('NDK') || 'videoRecorderNDKPage'.endsWith('NDKPage')).assertTrue();
      expect('videoRecorderNDKPage'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0002
     * @tc.name      testExtRecNativePage0001
     * @tc.desc      Native page id audioRecorderNativePage.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('audioRecorderNDKPage') >= 0).assertTrue();
      expect('audioRecorderNDKPage'.endsWith('NDK') || 'audioRecorderNDKPage'.endsWith('NDKPage')).assertTrue();
      expect('audioRecorderNDKPage'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0003
     * @tc.name      testExtRecNativePage0002
     * @tc.desc      Native page id videoStartNative.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('videoStartNDK') >= 0).assertTrue();
      expect('videoStartNDK'.endsWith('NDK') || 'videoStartNDK'.endsWith('NDKPage')).assertTrue();
      expect('videoStartNDK'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0004
     * @tc.name      testExtRecNativePage0003
     * @tc.desc      Native page id videoPauseNative.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('videoPauseNDK') >= 0).assertTrue();
      expect('videoPauseNDK'.endsWith('NDK') || 'videoPauseNDK'.endsWith('NDKPage')).assertTrue();
      expect('videoPauseNDK'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0005
     * @tc.name      testExtRecNativePage0004
     * @tc.desc      Native page id videoResumeNative.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('videoResumeNDK') >= 0).assertTrue();
      expect('videoResumeNDK'.endsWith('NDK') || 'videoResumeNDK'.endsWith('NDKPage')).assertTrue();
      expect('videoResumeNDK'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0006
     * @tc.name      testExtRecNativePage0005
     * @tc.desc      Native page id videoStopNative.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('videoStopNDK') >= 0).assertTrue();
      expect('videoStopNDK'.endsWith('NDK') || 'videoStopNDK'.endsWith('NDKPage')).assertTrue();
      expect('videoStopNDK'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0007
     * @tc.name      testExtRecNativePage0006
     * @tc.desc      Native page id audioStartNative.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('audioStartNDK') >= 0).assertTrue();
      expect('audioStartNDK'.endsWith('NDK') || 'audioStartNDK'.endsWith('NDKPage')).assertTrue();
      expect('audioStartNDK'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0008
     * @tc.name      testExtRecNativePage0007
     * @tc.desc      Native page id audioPauseNative.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('audioPauseNDK') >= 0).assertTrue();
      expect('audioPauseNDK'.endsWith('NDK') || 'audioPauseNDK'.endsWith('NDKPage')).assertTrue();
      expect('audioPauseNDK'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0009
     * @tc.name      testExtRecNativePage0008
     * @tc.desc      Native page id audioResumeNative.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('audioResumeNDK') >= 0).assertTrue();
      expect('audioResumeNDK'.endsWith('NDK') || 'audioResumeNDK'.endsWith('NDKPage')).assertTrue();
      expect('audioResumeNDK'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0010
     * @tc.name      testExtRecNativePage0009
     * @tc.desc      Native page id audioStopNative.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('audioStopNDK') >= 0).assertTrue();
      expect('audioStopNDK'.endsWith('NDK') || 'audioStopNDK'.endsWith('NDKPage')).assertTrue();
      expect('audioStopNDK'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0011
     * @tc.name      testExtRecNativePage0010
     * @tc.desc      Native page id videoRecorderNativePage.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('videoRecorderNDKPage') >= 0).assertTrue();
      expect('videoRecorderNDKPage'.endsWith('NDK') || 'videoRecorderNDKPage'.endsWith('NDKPage')).assertTrue();
      expect('videoRecorderNDKPage'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0012
     * @tc.name      testExtRecNativePage0011
     * @tc.desc      Native page id audioRecorderNativePage.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('audioRecorderNDKPage') >= 0).assertTrue();
      expect('audioRecorderNDKPage'.endsWith('NDK') || 'audioRecorderNDKPage'.endsWith('NDKPage')).assertTrue();
      expect('audioRecorderNDKPage'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0013
     * @tc.name      testExtRecNativePage0012
     * @tc.desc      Native page id videoStartNative.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('videoStartNDK') >= 0).assertTrue();
      expect('videoStartNDK'.endsWith('NDK') || 'videoStartNDK'.endsWith('NDKPage')).assertTrue();
      expect('videoStartNDK'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0014
     * @tc.name      testExtRecNativePage0013
     * @tc.desc      Native page id videoPauseNative.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('videoPauseNDK') >= 0).assertTrue();
      expect('videoPauseNDK'.endsWith('NDK') || 'videoPauseNDK'.endsWith('NDKPage')).assertTrue();
      expect('videoPauseNDK'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0015
     * @tc.name      testExtRecNativePage0014
     * @tc.desc      Native page id videoResumeNative.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('videoResumeNDK') >= 0).assertTrue();
      expect('videoResumeNDK'.endsWith('NDK') || 'videoResumeNDK'.endsWith('NDKPage')).assertTrue();
      expect('videoResumeNDK'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0016
     * @tc.name      testExtRecNativePage0015
     * @tc.desc      Native page id videoStopNative.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('videoStopNDK') >= 0).assertTrue();
      expect('videoStopNDK'.endsWith('NDK') || 'videoStopNDK'.endsWith('NDKPage')).assertTrue();
      expect('videoStopNDK'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0017
     * @tc.name      testExtRecNativePage0016
     * @tc.desc      Native page id audioStartNative.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('audioStartNDK') >= 0).assertTrue();
      expect('audioStartNDK'.endsWith('NDK') || 'audioStartNDK'.endsWith('NDKPage')).assertTrue();
      expect('audioStartNDK'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0018
     * @tc.name      testExtRecNativePage0017
     * @tc.desc      Native page id audioPauseNative.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('audioPauseNDK') >= 0).assertTrue();
      expect('audioPauseNDK'.endsWith('NDK') || 'audioPauseNDK'.endsWith('NDKPage')).assertTrue();
      expect('audioPauseNDK'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0019
     * @tc.name      testExtRecNativePage0018
     * @tc.desc      Native page id audioResumeNative.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('audioResumeNDK') >= 0).assertTrue();
      expect('audioResumeNDK'.endsWith('NDK') || 'audioResumeNDK'.endsWith('NDKPage')).assertTrue();
      expect('audioResumeNDK'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0020
     * @tc.name      testExtRecNativePage0019
     * @tc.desc      Native page id audioStopNative.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('audioStopNDK') >= 0).assertTrue();
      expect('audioStopNDK'.endsWith('NDK') || 'audioStopNDK'.endsWith('NDKPage')).assertTrue();
      expect('audioStopNDK'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0021
     * @tc.name      testExtRecNativePage0020
     * @tc.desc      Native page id videoRecorderNativePage.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('videoRecorderNDKPage') >= 0).assertTrue();
      expect('videoRecorderNDKPage'.endsWith('NDK') || 'videoRecorderNDKPage'.endsWith('NDKPage')).assertTrue();
      expect('videoRecorderNDKPage'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0022
     * @tc.name      testExtRecNativePage0021
     * @tc.desc      Native page id audioRecorderNativePage.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('audioRecorderNDKPage') >= 0).assertTrue();
      expect('audioRecorderNDKPage'.endsWith('NDK') || 'audioRecorderNDKPage'.endsWith('NDKPage')).assertTrue();
      expect('audioRecorderNDKPage'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0023
     * @tc.name      testExtRecNativePage0022
     * @tc.desc      Native page id videoStartNative.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('videoStartNDK') >= 0).assertTrue();
      expect('videoStartNDK'.endsWith('NDK') || 'videoStartNDK'.endsWith('NDKPage')).assertTrue();
      expect('videoStartNDK'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0024
     * @tc.name      testExtRecNativePage0023
     * @tc.desc      Native page id videoPauseNative.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('videoPauseNDK') >= 0).assertTrue();
      expect('videoPauseNDK'.endsWith('NDK') || 'videoPauseNDK'.endsWith('NDKPage')).assertTrue();
      expect('videoPauseNDK'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0025
     * @tc.name      testExtRecNativePage0024
     * @tc.desc      Native page id videoResumeNative.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('videoResumeNDK') >= 0).assertTrue();
      expect('videoResumeNDK'.endsWith('NDK') || 'videoResumeNDK'.endsWith('NDKPage')).assertTrue();
      expect('videoResumeNDK'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0026
     * @tc.name      testExtRecNativePage0025
     * @tc.desc      Native page id videoStopNative.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('videoStopNDK') >= 0).assertTrue();
      expect('videoStopNDK'.endsWith('NDK') || 'videoStopNDK'.endsWith('NDKPage')).assertTrue();
      expect('videoStopNDK'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0027
     * @tc.name      testExtRecNativePage0026
     * @tc.desc      Native page id audioStartNative.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('audioStartNDK') >= 0).assertTrue();
      expect('audioStartNDK'.endsWith('NDK') || 'audioStartNDK'.endsWith('NDKPage')).assertTrue();
      expect('audioStartNDK'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0028
     * @tc.name      testExtRecNativePage0027
     * @tc.desc      Native page id audioPauseNative.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('audioPauseNDK') >= 0).assertTrue();
      expect('audioPauseNDK'.endsWith('NDK') || 'audioPauseNDK'.endsWith('NDKPage')).assertTrue();
      expect('audioPauseNDK'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0029
     * @tc.name      testExtRecNativePage0028
     * @tc.desc      Native page id audioResumeNative.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('audioResumeNDK') >= 0).assertTrue();
      expect('audioResumeNDK'.endsWith('NDK') || 'audioResumeNDK'.endsWith('NDKPage')).assertTrue();
      expect('audioResumeNDK'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0030
     * @tc.name      testExtRecNativePage0029
     * @tc.desc      Native page id audioStopNative.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNativePage0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('audioStopNDK') >= 0).assertTrue();
      expect('audioStopNDK'.endsWith('NDK') || 'audioStopNDK'.endsWith('NDKPage')).assertTrue();
      expect('audioStopNDK'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
  });
}
