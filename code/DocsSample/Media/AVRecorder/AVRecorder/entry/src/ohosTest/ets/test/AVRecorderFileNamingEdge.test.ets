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

const TAG: string = '[Sample_avRecorderFileNamingEdge]';
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

export default function avRecorderFileNamingEdgeTest(): void {
  describe('avRecorderFileNamingEdgeTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0001
     * @tc.name      testExtRecFileEdge0000
     * @tc.desc      File name edge case 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0002
     * @tc.name      testExtRecFileEdge0001
     * @tc.desc      File name edge case 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0003
     * @tc.name      testExtRecFileEdge0002
     * @tc.desc      File name edge case 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0004
     * @tc.name      testExtRecFileEdge0003
     * @tc.desc      File name edge case 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0005
     * @tc.name      testExtRecFileEdge0004
     * @tc.desc      File name edge case 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0006
     * @tc.name      testExtRecFileEdge0005
     * @tc.desc      File name edge case 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0007
     * @tc.name      testExtRecFileEdge0006
     * @tc.desc      File name edge case 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0008
     * @tc.name      testExtRecFileEdge0007
     * @tc.desc      File name edge case 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0009
     * @tc.name      testExtRecFileEdge0008
     * @tc.desc      File name edge case 9.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0010
     * @tc.name      testExtRecFileEdge0009
     * @tc.desc      File name edge case 10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0011
     * @tc.name      testExtRecFileEdge0010
     * @tc.desc      File name edge case 11.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0012
     * @tc.name      testExtRecFileEdge0011
     * @tc.desc      File name edge case 12.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0013
     * @tc.name      testExtRecFileEdge0012
     * @tc.desc      File name edge case 13.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0014
     * @tc.name      testExtRecFileEdge0013
     * @tc.desc      File name edge case 14.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0015
     * @tc.name      testExtRecFileEdge0014
     * @tc.desc      File name edge case 15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0016
     * @tc.name      testExtRecFileEdge0015
     * @tc.desc      File name edge case 16.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0017
     * @tc.name      testExtRecFileEdge0016
     * @tc.desc      File name edge case 17.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0018
     * @tc.name      testExtRecFileEdge0017
     * @tc.desc      File name edge case 18.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0019
     * @tc.name      testExtRecFileEdge0018
     * @tc.desc      File name edge case 19.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0020
     * @tc.name      testExtRecFileEdge0019
     * @tc.desc      File name edge case 20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0021
     * @tc.name      testExtRecFileEdge0020
     * @tc.desc      File name edge case 21.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0022
     * @tc.name      testExtRecFileEdge0021
     * @tc.desc      File name edge case 22.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0023
     * @tc.name      testExtRecFileEdge0022
     * @tc.desc      File name edge case 23.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0024
     * @tc.name      testExtRecFileEdge0023
     * @tc.desc      File name edge case 24.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0025
     * @tc.name      testExtRecFileEdge0024
     * @tc.desc      File name edge case 25.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0026
     * @tc.name      testExtRecFileEdge0025
     * @tc.desc      File name edge case 26.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0027
     * @tc.name      testExtRecFileEdge0026
     * @tc.desc      File name edge case 27.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0028
     * @tc.name      testExtRecFileEdge0027
     * @tc.desc      File name edge case 28.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0029
     * @tc.name      testExtRecFileEdge0028
     * @tc.desc      File name edge case 29.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0030
     * @tc.name      testExtRecFileEdge0029
     * @tc.desc      File name edge case 30.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0031
     * @tc.name      testExtRecFileEdge0030
     * @tc.desc      File name edge case 31.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0032
     * @tc.name      testExtRecFileEdge0031
     * @tc.desc      File name edge case 32.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0033
     * @tc.name      testExtRecFileEdge0032
     * @tc.desc      File name edge case 33.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0034
     * @tc.name      testExtRecFileEdge0033
     * @tc.desc      File name edge case 34.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0035
     * @tc.name      testExtRecFileEdge0034
     * @tc.desc      File name edge case 35.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0036
     * @tc.name      testExtRecFileEdge0035
     * @tc.desc      File name edge case 36.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0037
     * @tc.name      testExtRecFileEdge0036
     * @tc.desc      File name edge case 37.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0038
     * @tc.name      testExtRecFileEdge0037
     * @tc.desc      File name edge case 38.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0039
     * @tc.name      testExtRecFileEdge0038
     * @tc.desc      File name edge case 39.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0040
     * @tc.name      testExtRecFileEdge0039
     * @tc.desc      File name edge case 40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0041
     * @tc.name      testExtRecFileEdge0040
     * @tc.desc      File name edge case 41.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0042
     * @tc.name      testExtRecFileEdge0041
     * @tc.desc      File name edge case 42.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0043
     * @tc.name      testExtRecFileEdge0042
     * @tc.desc      File name edge case 43.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0044
     * @tc.name      testExtRecFileEdge0043
     * @tc.desc      File name edge case 44.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0045
     * @tc.name      testExtRecFileEdge0044
     * @tc.desc      File name edge case 45.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0046
     * @tc.name      testExtRecFileEdge0045
     * @tc.desc      File name edge case 46.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0047
     * @tc.name      testExtRecFileEdge0046
     * @tc.desc      File name edge case 47.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0048
     * @tc.name      testExtRecFileEdge0047
     * @tc.desc      File name edge case 48.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0049
     * @tc.name      testExtRecFileEdge0048
     * @tc.desc      File name edge case 49.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0050
     * @tc.name      testExtRecFileEdge0049
     * @tc.desc      File name edge case 50.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0051
     * @tc.name      testExtRecFileEdge0050
     * @tc.desc      File name edge case 51.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0052
     * @tc.name      testExtRecFileEdge0051
     * @tc.desc      File name edge case 52.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0053
     * @tc.name      testExtRecFileEdge0052
     * @tc.desc      File name edge case 53.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0054
     * @tc.name      testExtRecFileEdge0053
     * @tc.desc      File name edge case 54.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0055
     * @tc.name      testExtRecFileEdge0054
     * @tc.desc      File name edge case 55.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0056
     * @tc.name      testExtRecFileEdge0055
     * @tc.desc      File name edge case 56.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0057
     * @tc.name      testExtRecFileEdge0056
     * @tc.desc      File name edge case 57.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0058
     * @tc.name      testExtRecFileEdge0057
     * @tc.desc      File name edge case 58.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0059
     * @tc.name      testExtRecFileEdge0058
     * @tc.desc      File name edge case 59.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0060
     * @tc.name      testExtRecFileEdge0059
     * @tc.desc      File name edge case 60.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0061
     * @tc.name      testExtRecFileEdge0060
     * @tc.desc      File name edge case 61.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0062
     * @tc.name      testExtRecFileEdge0061
     * @tc.desc      File name edge case 62.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0063
     * @tc.name      testExtRecFileEdge0062
     * @tc.desc      File name edge case 63.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0064
     * @tc.name      testExtRecFileEdge0063
     * @tc.desc      File name edge case 64.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0065
     * @tc.name      testExtRecFileEdge0064
     * @tc.desc      File name edge case 65.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0066
     * @tc.name      testExtRecFileEdge0065
     * @tc.desc      File name edge case 66.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0067
     * @tc.name      testExtRecFileEdge0066
     * @tc.desc      File name edge case 67.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0068
     * @tc.name      testExtRecFileEdge0067
     * @tc.desc      File name edge case 68.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0069
     * @tc.name      testExtRecFileEdge0068
     * @tc.desc      File name edge case 69.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0070
     * @tc.name      testExtRecFileEdge0069
     * @tc.desc      File name edge case 70.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0071
     * @tc.name      testExtRecFileEdge0070
     * @tc.desc      File name edge case 71.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0072
     * @tc.name      testExtRecFileEdge0071
     * @tc.desc      File name edge case 72.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0073
     * @tc.name      testExtRecFileEdge0072
     * @tc.desc      File name edge case 73.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0074
     * @tc.name      testExtRecFileEdge0073
     * @tc.desc      File name edge case 74.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0075
     * @tc.name      testExtRecFileEdge0074
     * @tc.desc      File name edge case 75.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0076
     * @tc.name      testExtRecFileEdge0075
     * @tc.desc      File name edge case 76.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0077
     * @tc.name      testExtRecFileEdge0076
     * @tc.desc      File name edge case 77.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0078
     * @tc.name      testExtRecFileEdge0077
     * @tc.desc      File name edge case 78.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0079
     * @tc.name      testExtRecFileEdge0078
     * @tc.desc      File name edge case 79.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILENAME2_0080
     * @tc.name      testExtRecFileEdge0079
     * @tc.desc      File name edge case 80.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileEdge0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
      expect(time.length).assertEqual(6);
    })
  });
}
