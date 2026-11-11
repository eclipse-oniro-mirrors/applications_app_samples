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
import DateTimeUtil from '../../../main/ets/utils/DateTimeUtil';

const TAG: string = '[Sample_avRecorderFileNamingCore]';
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

export default function avRecorderFileNamingCoreTest(): void {
  describe('avRecorderFileNamingCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0001
     * @tc.name      testExtRecFile0000
     * @tc.desc      Recorder output name case 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0002
     * @tc.name      testExtRecFile0001
     * @tc.desc      Recorder output name case 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0003
     * @tc.name      testExtRecFile0002
     * @tc.desc      Recorder output name case 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0004
     * @tc.name      testExtRecFile0003
     * @tc.desc      Recorder output name case 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0005
     * @tc.name      testExtRecFile0004
     * @tc.desc      Recorder output name case 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0006
     * @tc.name      testExtRecFile0005
     * @tc.desc      Recorder output name case 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0007
     * @tc.name      testExtRecFile0006
     * @tc.desc      Recorder output name case 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0008
     * @tc.name      testExtRecFile0007
     * @tc.desc      Recorder output name case 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0009
     * @tc.name      testExtRecFile0008
     * @tc.desc      Recorder output name case 9.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0010
     * @tc.name      testExtRecFile0009
     * @tc.desc      Recorder output name case 10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0011
     * @tc.name      testExtRecFile0010
     * @tc.desc      Recorder output name case 11.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0012
     * @tc.name      testExtRecFile0011
     * @tc.desc      Recorder output name case 12.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0013
     * @tc.name      testExtRecFile0012
     * @tc.desc      Recorder output name case 13.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0014
     * @tc.name      testExtRecFile0013
     * @tc.desc      Recorder output name case 14.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0015
     * @tc.name      testExtRecFile0014
     * @tc.desc      Recorder output name case 15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0016
     * @tc.name      testExtRecFile0015
     * @tc.desc      Recorder output name case 16.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0017
     * @tc.name      testExtRecFile0016
     * @tc.desc      Recorder output name case 17.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0018
     * @tc.name      testExtRecFile0017
     * @tc.desc      Recorder output name case 18.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0019
     * @tc.name      testExtRecFile0018
     * @tc.desc      Recorder output name case 19.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0020
     * @tc.name      testExtRecFile0019
     * @tc.desc      Recorder output name case 20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0021
     * @tc.name      testExtRecFile0020
     * @tc.desc      Recorder output name case 21.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0022
     * @tc.name      testExtRecFile0021
     * @tc.desc      Recorder output name case 22.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0023
     * @tc.name      testExtRecFile0022
     * @tc.desc      Recorder output name case 23.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0024
     * @tc.name      testExtRecFile0023
     * @tc.desc      Recorder output name case 24.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0025
     * @tc.name      testExtRecFile0024
     * @tc.desc      Recorder output name case 25.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0026
     * @tc.name      testExtRecFile0025
     * @tc.desc      Recorder output name case 26.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0027
     * @tc.name      testExtRecFile0026
     * @tc.desc      Recorder output name case 27.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0028
     * @tc.name      testExtRecFile0027
     * @tc.desc      Recorder output name case 28.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0029
     * @tc.name      testExtRecFile0028
     * @tc.desc      Recorder output name case 29.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0030
     * @tc.name      testExtRecFile0029
     * @tc.desc      Recorder output name case 30.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0031
     * @tc.name      testExtRecFile0030
     * @tc.desc      Recorder output name case 31.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0032
     * @tc.name      testExtRecFile0031
     * @tc.desc      Recorder output name case 32.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0033
     * @tc.name      testExtRecFile0032
     * @tc.desc      Recorder output name case 33.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0034
     * @tc.name      testExtRecFile0033
     * @tc.desc      Recorder output name case 34.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0035
     * @tc.name      testExtRecFile0034
     * @tc.desc      Recorder output name case 35.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0036
     * @tc.name      testExtRecFile0035
     * @tc.desc      Recorder output name case 36.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0037
     * @tc.name      testExtRecFile0036
     * @tc.desc      Recorder output name case 37.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0038
     * @tc.name      testExtRecFile0037
     * @tc.desc      Recorder output name case 38.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0039
     * @tc.name      testExtRecFile0038
     * @tc.desc      Recorder output name case 39.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0040
     * @tc.name      testExtRecFile0039
     * @tc.desc      Recorder output name case 40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0041
     * @tc.name      testExtRecFile0040
     * @tc.desc      Recorder output name case 41.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0042
     * @tc.name      testExtRecFile0041
     * @tc.desc      Recorder output name case 42.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0043
     * @tc.name      testExtRecFile0042
     * @tc.desc      Recorder output name case 43.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0044
     * @tc.name      testExtRecFile0043
     * @tc.desc      Recorder output name case 44.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0045
     * @tc.name      testExtRecFile0044
     * @tc.desc      Recorder output name case 45.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0046
     * @tc.name      testExtRecFile0045
     * @tc.desc      Recorder output name case 46.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0047
     * @tc.name      testExtRecFile0046
     * @tc.desc      Recorder output name case 47.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0048
     * @tc.name      testExtRecFile0047
     * @tc.desc      Recorder output name case 48.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0049
     * @tc.name      testExtRecFile0048
     * @tc.desc      Recorder output name case 49.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0050
     * @tc.name      testExtRecFile0049
     * @tc.desc      Recorder output name case 50.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0051
     * @tc.name      testExtRecFile0050
     * @tc.desc      Recorder output name case 51.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0052
     * @tc.name      testExtRecFile0051
     * @tc.desc      Recorder output name case 52.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0053
     * @tc.name      testExtRecFile0052
     * @tc.desc      Recorder output name case 53.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0054
     * @tc.name      testExtRecFile0053
     * @tc.desc      Recorder output name case 54.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0055
     * @tc.name      testExtRecFile0054
     * @tc.desc      Recorder output name case 55.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0056
     * @tc.name      testExtRecFile0055
     * @tc.desc      Recorder output name case 56.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0057
     * @tc.name      testExtRecFile0056
     * @tc.desc      Recorder output name case 57.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0058
     * @tc.name      testExtRecFile0057
     * @tc.desc      Recorder output name case 58.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0059
     * @tc.name      testExtRecFile0058
     * @tc.desc      Recorder output name case 59.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0060
     * @tc.name      testExtRecFile0059
     * @tc.desc      Recorder output name case 60.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0061
     * @tc.name      testExtRecFile0060
     * @tc.desc      Recorder output name case 61.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0062
     * @tc.name      testExtRecFile0061
     * @tc.desc      Recorder output name case 62.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0063
     * @tc.name      testExtRecFile0062
     * @tc.desc      Recorder output name case 63.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0064
     * @tc.name      testExtRecFile0063
     * @tc.desc      Recorder output name case 64.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0065
     * @tc.name      testExtRecFile0064
     * @tc.desc      Recorder output name case 65.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0066
     * @tc.name      testExtRecFile0065
     * @tc.desc      Recorder output name case 66.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0067
     * @tc.name      testExtRecFile0066
     * @tc.desc      Recorder output name case 67.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0068
     * @tc.name      testExtRecFile0067
     * @tc.desc      Recorder output name case 68.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0069
     * @tc.name      testExtRecFile0068
     * @tc.desc      Recorder output name case 69.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0070
     * @tc.name      testExtRecFile0069
     * @tc.desc      Recorder output name case 70.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0071
     * @tc.name      testExtRecFile0070
     * @tc.desc      Recorder output name case 71.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0072
     * @tc.name      testExtRecFile0071
     * @tc.desc      Recorder output name case 72.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0073
     * @tc.name      testExtRecFile0072
     * @tc.desc      Recorder output name case 73.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0074
     * @tc.name      testExtRecFile0073
     * @tc.desc      Recorder output name case 74.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0075
     * @tc.name      testExtRecFile0074
     * @tc.desc      Recorder output name case 75.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0076
     * @tc.name      testExtRecFile0075
     * @tc.desc      Recorder output name case 76.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0077
     * @tc.name      testExtRecFile0076
     * @tc.desc      Recorder output name case 77.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0078
     * @tc.name      testExtRecFile0077
     * @tc.desc      Recorder output name case 78.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0079
     * @tc.name      testExtRecFile0078
     * @tc.desc      Recorder output name case 79.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME_0080
     * @tc.name      testExtRecFile0079
     * @tc.desc      Recorder output name case 80.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFile0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audioName: string = `AUDIO_${date}_${time}.m4a`;
      const videoName: string = `VIDEO_${date}_${time}.mp4`;
      expect(audioName.startsWith('AUDIO_')).assertTrue();
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.startsWith('VIDEO_')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      expect(audioName.indexOf('/')).assertEqual(-1);
      expect(videoName.indexOf('/')).assertEqual(-1);
      expect(time.length).assertEqual(6);
    })
  });
}
