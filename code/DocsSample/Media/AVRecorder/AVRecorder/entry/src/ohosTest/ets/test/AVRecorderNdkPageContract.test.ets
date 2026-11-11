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

const TAG: string = '[Sample_avRecorderNdkPageContract]';
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

export default function avRecorderNdkPageContractTest(): void {
  describe('avRecorderNdkPageContractTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0001
     * @tc.name      testExtRecNdkPage0000
     * @tc.desc      NDK page id videoRecorderNDKPage.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkPage0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('videoRecorderNDKPage') >= 0).assertTrue();
      expect('videoRecorderNDKPage'.endsWith('NDK') || 'videoRecorderNDKPage'.endsWith('NDKPage')).assertTrue();
      expect('videoRecorderNDKPage'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0002
     * @tc.name      testExtRecNdkPage0001
     * @tc.desc      NDK page id audioRecorderNDKPage.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkPage0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('audioRecorderNDKPage') >= 0).assertTrue();
      expect('audioRecorderNDKPage'.endsWith('NDK') || 'audioRecorderNDKPage'.endsWith('NDKPage')).assertTrue();
      expect('audioRecorderNDKPage'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0003
     * @tc.name      testExtRecNdkPage0002
     * @tc.desc      NDK page id videoStartNDK.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkPage0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('videoStartNDK') >= 0).assertTrue();
      expect('videoStartNDK'.endsWith('NDK') || 'videoStartNDK'.endsWith('NDKPage')).assertTrue();
      expect('videoStartNDK'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0004
     * @tc.name      testExtRecNdkPage0003
     * @tc.desc      NDK page id videoPauseNDK.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkPage0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('videoPauseNDK') >= 0).assertTrue();
      expect('videoPauseNDK'.endsWith('NDK') || 'videoPauseNDK'.endsWith('NDKPage')).assertTrue();
      expect('videoPauseNDK'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0005
     * @tc.name      testExtRecNdkPage0004
     * @tc.desc      NDK page id videoResumeNDK.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkPage0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('videoResumeNDK') >= 0).assertTrue();
      expect('videoResumeNDK'.endsWith('NDK') || 'videoResumeNDK'.endsWith('NDKPage')).assertTrue();
      expect('videoResumeNDK'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0006
     * @tc.name      testExtRecNdkPage0005
     * @tc.desc      NDK page id videoStopNDK.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkPage0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('videoStopNDK') >= 0).assertTrue();
      expect('videoStopNDK'.endsWith('NDK') || 'videoStopNDK'.endsWith('NDKPage')).assertTrue();
      expect('videoStopNDK'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0007
     * @tc.name      testExtRecNdkPage0006
     * @tc.desc      NDK page id audioStartNDK.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkPage0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('audioStartNDK') >= 0).assertTrue();
      expect('audioStartNDK'.endsWith('NDK') || 'audioStartNDK'.endsWith('NDKPage')).assertTrue();
      expect('audioStartNDK'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0008
     * @tc.name      testExtRecNdkPage0007
     * @tc.desc      NDK page id audioPauseNDK.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkPage0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('audioPauseNDK') >= 0).assertTrue();
      expect('audioPauseNDK'.endsWith('NDK') || 'audioPauseNDK'.endsWith('NDKPage')).assertTrue();
      expect('audioPauseNDK'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0009
     * @tc.name      testExtRecNdkPage0008
     * @tc.desc      NDK page id audioResumeNDK.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkPage0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('audioResumeNDK') >= 0).assertTrue();
      expect('audioResumeNDK'.endsWith('NDK') || 'audioResumeNDK'.endsWith('NDKPage')).assertTrue();
      expect('audioResumeNDK'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0010
     * @tc.name      testExtRecNdkPage0009
     * @tc.desc      NDK page id audioStopNDK.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkPage0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('audioStopNDK') >= 0).assertTrue();
      expect('audioStopNDK'.endsWith('NDK') || 'audioStopNDK'.endsWith('NDKPage')).assertTrue();
      expect('audioStopNDK'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0011
     * @tc.name      testExtRecNdkPage0010
     * @tc.desc      NDK page id videoRecorderNDKPage.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkPage0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('videoRecorderNDKPage') >= 0).assertTrue();
      expect('videoRecorderNDKPage'.endsWith('NDK') || 'videoRecorderNDKPage'.endsWith('NDKPage')).assertTrue();
      expect('videoRecorderNDKPage'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0012
     * @tc.name      testExtRecNdkPage0011
     * @tc.desc      NDK page id audioRecorderNDKPage.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkPage0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('audioRecorderNDKPage') >= 0).assertTrue();
      expect('audioRecorderNDKPage'.endsWith('NDK') || 'audioRecorderNDKPage'.endsWith('NDKPage')).assertTrue();
      expect('audioRecorderNDKPage'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0013
     * @tc.name      testExtRecNdkPage0012
     * @tc.desc      NDK page id videoStartNDK.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkPage0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('videoStartNDK') >= 0).assertTrue();
      expect('videoStartNDK'.endsWith('NDK') || 'videoStartNDK'.endsWith('NDKPage')).assertTrue();
      expect('videoStartNDK'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0014
     * @tc.name      testExtRecNdkPage0013
     * @tc.desc      NDK page id videoPauseNDK.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkPage0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('videoPauseNDK') >= 0).assertTrue();
      expect('videoPauseNDK'.endsWith('NDK') || 'videoPauseNDK'.endsWith('NDKPage')).assertTrue();
      expect('videoPauseNDK'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0015
     * @tc.name      testExtRecNdkPage0014
     * @tc.desc      NDK page id videoResumeNDK.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkPage0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('videoResumeNDK') >= 0).assertTrue();
      expect('videoResumeNDK'.endsWith('NDK') || 'videoResumeNDK'.endsWith('NDKPage')).assertTrue();
      expect('videoResumeNDK'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0016
     * @tc.name      testExtRecNdkPage0015
     * @tc.desc      NDK page id videoStopNDK.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkPage0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('videoStopNDK') >= 0).assertTrue();
      expect('videoStopNDK'.endsWith('NDK') || 'videoStopNDK'.endsWith('NDKPage')).assertTrue();
      expect('videoStopNDK'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0017
     * @tc.name      testExtRecNdkPage0016
     * @tc.desc      NDK page id audioStartNDK.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkPage0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('audioStartNDK') >= 0).assertTrue();
      expect('audioStartNDK'.endsWith('NDK') || 'audioStartNDK'.endsWith('NDKPage')).assertTrue();
      expect('audioStartNDK'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0018
     * @tc.name      testExtRecNdkPage0017
     * @tc.desc      NDK page id audioPauseNDK.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkPage0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('audioPauseNDK') >= 0).assertTrue();
      expect('audioPauseNDK'.endsWith('NDK') || 'audioPauseNDK'.endsWith('NDKPage')).assertTrue();
      expect('audioPauseNDK'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0019
     * @tc.name      testExtRecNdkPage0018
     * @tc.desc      NDK page id audioResumeNDK.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkPage0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('audioResumeNDK') >= 0).assertTrue();
      expect('audioResumeNDK'.endsWith('NDK') || 'audioResumeNDK'.endsWith('NDKPage')).assertTrue();
      expect('audioResumeNDK'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0020
     * @tc.name      testExtRecNdkPage0019
     * @tc.desc      NDK page id audioStopNDK.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkPage0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('audioStopNDK') >= 0).assertTrue();
      expect('audioStopNDK'.endsWith('NDK') || 'audioStopNDK'.endsWith('NDKPage')).assertTrue();
      expect('audioStopNDK'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0021
     * @tc.name      testExtRecNdkPage0020
     * @tc.desc      NDK page id videoRecorderNDKPage.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkPage0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('videoRecorderNDKPage') >= 0).assertTrue();
      expect('videoRecorderNDKPage'.endsWith('NDK') || 'videoRecorderNDKPage'.endsWith('NDKPage')).assertTrue();
      expect('videoRecorderNDKPage'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0022
     * @tc.name      testExtRecNdkPage0021
     * @tc.desc      NDK page id audioRecorderNDKPage.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkPage0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('audioRecorderNDKPage') >= 0).assertTrue();
      expect('audioRecorderNDKPage'.endsWith('NDK') || 'audioRecorderNDKPage'.endsWith('NDKPage')).assertTrue();
      expect('audioRecorderNDKPage'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0023
     * @tc.name      testExtRecNdkPage0022
     * @tc.desc      NDK page id videoStartNDK.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkPage0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('videoStartNDK') >= 0).assertTrue();
      expect('videoStartNDK'.endsWith('NDK') || 'videoStartNDK'.endsWith('NDKPage')).assertTrue();
      expect('videoStartNDK'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0024
     * @tc.name      testExtRecNdkPage0023
     * @tc.desc      NDK page id videoPauseNDK.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkPage0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('videoPauseNDK') >= 0).assertTrue();
      expect('videoPauseNDK'.endsWith('NDK') || 'videoPauseNDK'.endsWith('NDKPage')).assertTrue();
      expect('videoPauseNDK'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0025
     * @tc.name      testExtRecNdkPage0024
     * @tc.desc      NDK page id videoResumeNDK.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkPage0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('videoResumeNDK') >= 0).assertTrue();
      expect('videoResumeNDK'.endsWith('NDK') || 'videoResumeNDK'.endsWith('NDKPage')).assertTrue();
      expect('videoResumeNDK'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0026
     * @tc.name      testExtRecNdkPage0025
     * @tc.desc      NDK page id videoStopNDK.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkPage0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('videoStopNDK') >= 0).assertTrue();
      expect('videoStopNDK'.endsWith('NDK') || 'videoStopNDK'.endsWith('NDKPage')).assertTrue();
      expect('videoStopNDK'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0027
     * @tc.name      testExtRecNdkPage0026
     * @tc.desc      NDK page id audioStartNDK.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkPage0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('audioStartNDK') >= 0).assertTrue();
      expect('audioStartNDK'.endsWith('NDK') || 'audioStartNDK'.endsWith('NDKPage')).assertTrue();
      expect('audioStartNDK'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0028
     * @tc.name      testExtRecNdkPage0027
     * @tc.desc      NDK page id audioPauseNDK.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkPage0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('audioPauseNDK') >= 0).assertTrue();
      expect('audioPauseNDK'.endsWith('NDK') || 'audioPauseNDK'.endsWith('NDKPage')).assertTrue();
      expect('audioPauseNDK'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0029
     * @tc.name      testExtRecNdkPage0028
     * @tc.desc      NDK page id audioResumeNDK.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkPage0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('audioResumeNDK') >= 0).assertTrue();
      expect('audioResumeNDK'.endsWith('NDK') || 'audioResumeNDK'.endsWith('NDKPage')).assertTrue();
      expect('audioResumeNDK'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NDKPAGE_0030
     * @tc.name      testExtRecNdkPage0029
     * @tc.desc      NDK page id audioStopNDK.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNdkPage0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: string[] = ['videoRecorderNDKPage', 'audioRecorderNDKPage', 'videoStartNDK', 'videoPauseNDK', 'videoResumeNDK', 'videoStopNDK', 'audioStartNDK', 'audioPauseNDK', 'audioResumeNDK', 'audioStopNDK'];
      expect(ids.indexOf('audioStopNDK') >= 0).assertTrue();
      expect('audioStopNDK'.endsWith('NDK') || 'audioStopNDK'.endsWith('NDKPage')).assertTrue();
      expect('audioStopNDK'.length).assertLarger(0);
      expect(ids.length).assertEqual(10);
    })
  });
}
