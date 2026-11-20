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
import DateTimeUtil from '../../../main/ets/utils/DateTimeUtil';

const TAG: string = '[Sample_avRecorderFileNamingMatrix]';
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

export default function avRecorderFileNamingMatrixTest(): void {
  describe('avRecorderFileNamingMatrixTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NAMEMATRIX_0001
     * @tc.name      testExtRecNameMatrix0000
     * @tc.desc      File name matrix 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNameMatrix0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.startsWith('VIDEO_')).assertTrue();
      expect(audio.endsWith('.m4a')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(audio.indexOf('/')).assertEqual(-1);
      expect(video.indexOf('/')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NAMEMATRIX_0002
     * @tc.name      testExtRecNameMatrix0001
     * @tc.desc      File name matrix 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNameMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.startsWith('VIDEO_')).assertTrue();
      expect(audio.endsWith('.m4a')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(audio.indexOf('/')).assertEqual(-1);
      expect(video.indexOf('/')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NAMEMATRIX_0003
     * @tc.name      testExtRecNameMatrix0002
     * @tc.desc      File name matrix 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNameMatrix0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.startsWith('VIDEO_')).assertTrue();
      expect(audio.endsWith('.m4a')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(audio.indexOf('/')).assertEqual(-1);
      expect(video.indexOf('/')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NAMEMATRIX_0004
     * @tc.name      testExtRecNameMatrix0003
     * @tc.desc      File name matrix 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNameMatrix0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.startsWith('VIDEO_')).assertTrue();
      expect(audio.endsWith('.m4a')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(audio.indexOf('/')).assertEqual(-1);
      expect(video.indexOf('/')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NAMEMATRIX_0005
     * @tc.name      testExtRecNameMatrix0004
     * @tc.desc      File name matrix 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNameMatrix0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.startsWith('VIDEO_')).assertTrue();
      expect(audio.endsWith('.m4a')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(audio.indexOf('/')).assertEqual(-1);
      expect(video.indexOf('/')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NAMEMATRIX_0006
     * @tc.name      testExtRecNameMatrix0005
     * @tc.desc      File name matrix 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNameMatrix0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.startsWith('VIDEO_')).assertTrue();
      expect(audio.endsWith('.m4a')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(audio.indexOf('/')).assertEqual(-1);
      expect(video.indexOf('/')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NAMEMATRIX_0007
     * @tc.name      testExtRecNameMatrix0006
     * @tc.desc      File name matrix 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNameMatrix0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.startsWith('VIDEO_')).assertTrue();
      expect(audio.endsWith('.m4a')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(audio.indexOf('/')).assertEqual(-1);
      expect(video.indexOf('/')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NAMEMATRIX_0008
     * @tc.name      testExtRecNameMatrix0007
     * @tc.desc      File name matrix 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNameMatrix0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.startsWith('VIDEO_')).assertTrue();
      expect(audio.endsWith('.m4a')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(audio.indexOf('/')).assertEqual(-1);
      expect(video.indexOf('/')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NAMEMATRIX_0009
     * @tc.name      testExtRecNameMatrix0008
     * @tc.desc      File name matrix 9.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNameMatrix0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.startsWith('VIDEO_')).assertTrue();
      expect(audio.endsWith('.m4a')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(audio.indexOf('/')).assertEqual(-1);
      expect(video.indexOf('/')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NAMEMATRIX_0010
     * @tc.name      testExtRecNameMatrix0009
     * @tc.desc      File name matrix 10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNameMatrix0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.startsWith('VIDEO_')).assertTrue();
      expect(audio.endsWith('.m4a')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(audio.indexOf('/')).assertEqual(-1);
      expect(video.indexOf('/')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NAMEMATRIX_0011
     * @tc.name      testExtRecNameMatrix0010
     * @tc.desc      File name matrix 11.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNameMatrix0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.startsWith('VIDEO_')).assertTrue();
      expect(audio.endsWith('.m4a')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(audio.indexOf('/')).assertEqual(-1);
      expect(video.indexOf('/')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NAMEMATRIX_0012
     * @tc.name      testExtRecNameMatrix0011
     * @tc.desc      File name matrix 12.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNameMatrix0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.startsWith('VIDEO_')).assertTrue();
      expect(audio.endsWith('.m4a')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(audio.indexOf('/')).assertEqual(-1);
      expect(video.indexOf('/')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NAMEMATRIX_0013
     * @tc.name      testExtRecNameMatrix0012
     * @tc.desc      File name matrix 13.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNameMatrix0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.startsWith('VIDEO_')).assertTrue();
      expect(audio.endsWith('.m4a')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(audio.indexOf('/')).assertEqual(-1);
      expect(video.indexOf('/')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NAMEMATRIX_0014
     * @tc.name      testExtRecNameMatrix0013
     * @tc.desc      File name matrix 14.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNameMatrix0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.startsWith('VIDEO_')).assertTrue();
      expect(audio.endsWith('.m4a')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(audio.indexOf('/')).assertEqual(-1);
      expect(video.indexOf('/')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NAMEMATRIX_0015
     * @tc.name      testExtRecNameMatrix0014
     * @tc.desc      File name matrix 15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNameMatrix0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.startsWith('VIDEO_')).assertTrue();
      expect(audio.endsWith('.m4a')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(audio.indexOf('/')).assertEqual(-1);
      expect(video.indexOf('/')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NAMEMATRIX_0016
     * @tc.name      testExtRecNameMatrix0015
     * @tc.desc      File name matrix 16.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNameMatrix0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.startsWith('VIDEO_')).assertTrue();
      expect(audio.endsWith('.m4a')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(audio.indexOf('/')).assertEqual(-1);
      expect(video.indexOf('/')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NAMEMATRIX_0017
     * @tc.name      testExtRecNameMatrix0016
     * @tc.desc      File name matrix 17.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNameMatrix0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.startsWith('VIDEO_')).assertTrue();
      expect(audio.endsWith('.m4a')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(audio.indexOf('/')).assertEqual(-1);
      expect(video.indexOf('/')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NAMEMATRIX_0018
     * @tc.name      testExtRecNameMatrix0017
     * @tc.desc      File name matrix 18.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNameMatrix0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.startsWith('VIDEO_')).assertTrue();
      expect(audio.endsWith('.m4a')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(audio.indexOf('/')).assertEqual(-1);
      expect(video.indexOf('/')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NAMEMATRIX_0019
     * @tc.name      testExtRecNameMatrix0018
     * @tc.desc      File name matrix 19.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNameMatrix0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.startsWith('VIDEO_')).assertTrue();
      expect(audio.endsWith('.m4a')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(audio.indexOf('/')).assertEqual(-1);
      expect(video.indexOf('/')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NAMEMATRIX_0020
     * @tc.name      testExtRecNameMatrix0019
     * @tc.desc      File name matrix 20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNameMatrix0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.startsWith('VIDEO_')).assertTrue();
      expect(audio.endsWith('.m4a')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(audio.indexOf('/')).assertEqual(-1);
      expect(video.indexOf('/')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NAMEMATRIX_0021
     * @tc.name      testExtRecNameMatrix0020
     * @tc.desc      File name matrix 21.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNameMatrix0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.startsWith('VIDEO_')).assertTrue();
      expect(audio.endsWith('.m4a')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(audio.indexOf('/')).assertEqual(-1);
      expect(video.indexOf('/')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NAMEMATRIX_0022
     * @tc.name      testExtRecNameMatrix0021
     * @tc.desc      File name matrix 22.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNameMatrix0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.startsWith('VIDEO_')).assertTrue();
      expect(audio.endsWith('.m4a')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(audio.indexOf('/')).assertEqual(-1);
      expect(video.indexOf('/')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NAMEMATRIX_0023
     * @tc.name      testExtRecNameMatrix0022
     * @tc.desc      File name matrix 23.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNameMatrix0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.startsWith('VIDEO_')).assertTrue();
      expect(audio.endsWith('.m4a')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(audio.indexOf('/')).assertEqual(-1);
      expect(video.indexOf('/')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NAMEMATRIX_0024
     * @tc.name      testExtRecNameMatrix0023
     * @tc.desc      File name matrix 24.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNameMatrix0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.startsWith('VIDEO_')).assertTrue();
      expect(audio.endsWith('.m4a')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(audio.indexOf('/')).assertEqual(-1);
      expect(video.indexOf('/')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NAMEMATRIX_0025
     * @tc.name      testExtRecNameMatrix0024
     * @tc.desc      File name matrix 25.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNameMatrix0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.startsWith('VIDEO_')).assertTrue();
      expect(audio.endsWith('.m4a')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(audio.indexOf('/')).assertEqual(-1);
      expect(video.indexOf('/')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NAMEMATRIX_0026
     * @tc.name      testExtRecNameMatrix0025
     * @tc.desc      File name matrix 26.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNameMatrix0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.startsWith('VIDEO_')).assertTrue();
      expect(audio.endsWith('.m4a')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(audio.indexOf('/')).assertEqual(-1);
      expect(video.indexOf('/')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NAMEMATRIX_0027
     * @tc.name      testExtRecNameMatrix0026
     * @tc.desc      File name matrix 27.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNameMatrix0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.startsWith('VIDEO_')).assertTrue();
      expect(audio.endsWith('.m4a')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(audio.indexOf('/')).assertEqual(-1);
      expect(video.indexOf('/')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NAMEMATRIX_0028
     * @tc.name      testExtRecNameMatrix0027
     * @tc.desc      File name matrix 28.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNameMatrix0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.startsWith('VIDEO_')).assertTrue();
      expect(audio.endsWith('.m4a')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(audio.indexOf('/')).assertEqual(-1);
      expect(video.indexOf('/')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NAMEMATRIX_0029
     * @tc.name      testExtRecNameMatrix0028
     * @tc.desc      File name matrix 29.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNameMatrix0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.startsWith('VIDEO_')).assertTrue();
      expect(audio.endsWith('.m4a')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(audio.indexOf('/')).assertEqual(-1);
      expect(video.indexOf('/')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NAMEMATRIX_0030
     * @tc.name      testExtRecNameMatrix0029
     * @tc.desc      File name matrix 30.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNameMatrix0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.startsWith('VIDEO_')).assertTrue();
      expect(audio.endsWith('.m4a')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(audio.indexOf('/')).assertEqual(-1);
      expect(video.indexOf('/')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NAMEMATRIX_0031
     * @tc.name      testExtRecNameMatrix0030
     * @tc.desc      File name matrix 31.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNameMatrix0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.startsWith('VIDEO_')).assertTrue();
      expect(audio.endsWith('.m4a')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(audio.indexOf('/')).assertEqual(-1);
      expect(video.indexOf('/')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NAMEMATRIX_0032
     * @tc.name      testExtRecNameMatrix0031
     * @tc.desc      File name matrix 32.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNameMatrix0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.startsWith('VIDEO_')).assertTrue();
      expect(audio.endsWith('.m4a')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(audio.indexOf('/')).assertEqual(-1);
      expect(video.indexOf('/')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NAMEMATRIX_0033
     * @tc.name      testExtRecNameMatrix0032
     * @tc.desc      File name matrix 33.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNameMatrix0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.startsWith('VIDEO_')).assertTrue();
      expect(audio.endsWith('.m4a')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(audio.indexOf('/')).assertEqual(-1);
      expect(video.indexOf('/')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NAMEMATRIX_0034
     * @tc.name      testExtRecNameMatrix0033
     * @tc.desc      File name matrix 34.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNameMatrix0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.startsWith('VIDEO_')).assertTrue();
      expect(audio.endsWith('.m4a')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(audio.indexOf('/')).assertEqual(-1);
      expect(video.indexOf('/')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NAMEMATRIX_0035
     * @tc.name      testExtRecNameMatrix0034
     * @tc.desc      File name matrix 35.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNameMatrix0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.startsWith('VIDEO_')).assertTrue();
      expect(audio.endsWith('.m4a')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(audio.indexOf('/')).assertEqual(-1);
      expect(video.indexOf('/')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NAMEMATRIX_0036
     * @tc.name      testExtRecNameMatrix0035
     * @tc.desc      File name matrix 36.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNameMatrix0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.startsWith('VIDEO_')).assertTrue();
      expect(audio.endsWith('.m4a')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(audio.indexOf('/')).assertEqual(-1);
      expect(video.indexOf('/')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NAMEMATRIX_0037
     * @tc.name      testExtRecNameMatrix0036
     * @tc.desc      File name matrix 37.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNameMatrix0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.startsWith('VIDEO_')).assertTrue();
      expect(audio.endsWith('.m4a')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(audio.indexOf('/')).assertEqual(-1);
      expect(video.indexOf('/')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NAMEMATRIX_0038
     * @tc.name      testExtRecNameMatrix0037
     * @tc.desc      File name matrix 38.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNameMatrix0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.startsWith('VIDEO_')).assertTrue();
      expect(audio.endsWith('.m4a')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(audio.indexOf('/')).assertEqual(-1);
      expect(video.indexOf('/')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NAMEMATRIX_0039
     * @tc.name      testExtRecNameMatrix0038
     * @tc.desc      File name matrix 39.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNameMatrix0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.startsWith('VIDEO_')).assertTrue();
      expect(audio.endsWith('.m4a')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(audio.indexOf('/')).assertEqual(-1);
      expect(video.indexOf('/')).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_NAMEMATRIX_0040
     * @tc.name      testExtRecNameMatrix0039
     * @tc.desc      File name matrix 40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecNameMatrix0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.startsWith('VIDEO_')).assertTrue();
      expect(audio.endsWith('.m4a')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(audio.indexOf('/')).assertEqual(-1);
      expect(video.indexOf('/')).assertEqual(-1);
    })
  });
}
