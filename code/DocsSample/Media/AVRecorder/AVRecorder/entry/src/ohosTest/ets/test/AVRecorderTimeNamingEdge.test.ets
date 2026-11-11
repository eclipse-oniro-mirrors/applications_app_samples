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
import DateTimeUtil, { getShownTimer } from '../../../main/ets/utils/DateTimeUtil';

const TAG: string = '[Sample_avRecorderTimeNamingEdge]';
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

export default function avRecorderTimeNamingEdgeTest(): void {
  describe('avRecorderTimeNamingEdgeTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMENAME_0001
     * @tc.name      testExtRecTimeName0000
     * @tc.desc      Time/name edge 0ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeName0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(getShownTimer(0)).assertEqual('0:0');
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMENAME_0002
     * @tc.name      testExtRecTimeName0001
     * @tc.desc      Time/name edge 1ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeName0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(getShownTimer(1)).assertEqual('0:0');
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMENAME_0003
     * @tc.name      testExtRecTimeName0002
     * @tc.desc      Time/name edge 499ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeName0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(getShownTimer(499)).assertEqual('0:0');
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMENAME_0004
     * @tc.name      testExtRecTimeName0003
     * @tc.desc      Time/name edge 500ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeName0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(getShownTimer(500)).assertEqual('0:1');
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMENAME_0005
     * @tc.name      testExtRecTimeName0004
     * @tc.desc      Time/name edge 999ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeName0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(getShownTimer(999)).assertEqual('0:1');
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMENAME_0006
     * @tc.name      testExtRecTimeName0005
     * @tc.desc      Time/name edge 1000ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeName0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(getShownTimer(1000)).assertEqual('0:1');
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMENAME_0007
     * @tc.name      testExtRecTimeName0006
     * @tc.desc      Time/name edge 59999ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeName0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(getShownTimer(59999)).assertEqual('1:0');
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMENAME_0008
     * @tc.name      testExtRecTimeName0007
     * @tc.desc      Time/name edge 60000ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeName0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(getShownTimer(60000)).assertEqual('1:0');
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMENAME_0009
     * @tc.name      testExtRecTimeName0008
     * @tc.desc      Time/name edge 3599999ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeName0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(getShownTimer(3599999)).assertEqual('60:0');
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMENAME_0010
     * @tc.name      testExtRecTimeName0009
     * @tc.desc      Time/name edge 3600000ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeName0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(getShownTimer(3600000)).assertEqual('60:0');
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMENAME_0011
     * @tc.name      testExtRecTimeName0010
     * @tc.desc      Time/name edge 0ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeName0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(getShownTimer(0)).assertEqual('0:0');
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMENAME_0012
     * @tc.name      testExtRecTimeName0011
     * @tc.desc      Time/name edge 1ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeName0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(getShownTimer(1)).assertEqual('0:0');
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMENAME_0013
     * @tc.name      testExtRecTimeName0012
     * @tc.desc      Time/name edge 499ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeName0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(getShownTimer(499)).assertEqual('0:0');
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMENAME_0014
     * @tc.name      testExtRecTimeName0013
     * @tc.desc      Time/name edge 500ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeName0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(getShownTimer(500)).assertEqual('0:1');
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMENAME_0015
     * @tc.name      testExtRecTimeName0014
     * @tc.desc      Time/name edge 999ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeName0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(getShownTimer(999)).assertEqual('0:1');
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMENAME_0016
     * @tc.name      testExtRecTimeName0015
     * @tc.desc      Time/name edge 1000ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeName0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(getShownTimer(1000)).assertEqual('0:1');
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMENAME_0017
     * @tc.name      testExtRecTimeName0016
     * @tc.desc      Time/name edge 59999ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeName0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(getShownTimer(59999)).assertEqual('1:0');
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMENAME_0018
     * @tc.name      testExtRecTimeName0017
     * @tc.desc      Time/name edge 60000ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeName0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(getShownTimer(60000)).assertEqual('1:0');
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMENAME_0019
     * @tc.name      testExtRecTimeName0018
     * @tc.desc      Time/name edge 3599999ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeName0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(getShownTimer(3599999)).assertEqual('60:0');
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMENAME_0020
     * @tc.name      testExtRecTimeName0019
     * @tc.desc      Time/name edge 3600000ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeName0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(getShownTimer(3600000)).assertEqual('60:0');
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMENAME_0021
     * @tc.name      testExtRecTimeName0020
     * @tc.desc      Time/name edge 0ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeName0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(getShownTimer(0)).assertEqual('0:0');
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMENAME_0022
     * @tc.name      testExtRecTimeName0021
     * @tc.desc      Time/name edge 1ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeName0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(getShownTimer(1)).assertEqual('0:0');
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMENAME_0023
     * @tc.name      testExtRecTimeName0022
     * @tc.desc      Time/name edge 499ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeName0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(getShownTimer(499)).assertEqual('0:0');
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMENAME_0024
     * @tc.name      testExtRecTimeName0023
     * @tc.desc      Time/name edge 500ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeName0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(getShownTimer(500)).assertEqual('0:1');
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMENAME_0025
     * @tc.name      testExtRecTimeName0024
     * @tc.desc      Time/name edge 999ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeName0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(getShownTimer(999)).assertEqual('0:1');
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMENAME_0026
     * @tc.name      testExtRecTimeName0025
     * @tc.desc      Time/name edge 1000ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeName0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(getShownTimer(1000)).assertEqual('0:1');
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMENAME_0027
     * @tc.name      testExtRecTimeName0026
     * @tc.desc      Time/name edge 59999ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeName0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(getShownTimer(59999)).assertEqual('1:0');
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMENAME_0028
     * @tc.name      testExtRecTimeName0027
     * @tc.desc      Time/name edge 60000ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeName0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(getShownTimer(60000)).assertEqual('1:0');
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMENAME_0029
     * @tc.name      testExtRecTimeName0028
     * @tc.desc      Time/name edge 3599999ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeName0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(getShownTimer(3599999)).assertEqual('60:0');
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMENAME_0030
     * @tc.name      testExtRecTimeName0029
     * @tc.desc      Time/name edge 3600000ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeName0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(getShownTimer(3600000)).assertEqual('60:0');
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMENAME_0031
     * @tc.name      testExtRecTimeName0030
     * @tc.desc      Time/name edge 0ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeName0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(getShownTimer(0)).assertEqual('0:0');
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMENAME_0032
     * @tc.name      testExtRecTimeName0031
     * @tc.desc      Time/name edge 1ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeName0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(getShownTimer(1)).assertEqual('0:0');
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMENAME_0033
     * @tc.name      testExtRecTimeName0032
     * @tc.desc      Time/name edge 499ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeName0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(getShownTimer(499)).assertEqual('0:0');
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMENAME_0034
     * @tc.name      testExtRecTimeName0033
     * @tc.desc      Time/name edge 500ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeName0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(getShownTimer(500)).assertEqual('0:1');
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMENAME_0035
     * @tc.name      testExtRecTimeName0034
     * @tc.desc      Time/name edge 999ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeName0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(getShownTimer(999)).assertEqual('0:1');
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMENAME_0036
     * @tc.name      testExtRecTimeName0035
     * @tc.desc      Time/name edge 1000ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeName0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(getShownTimer(1000)).assertEqual('0:1');
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMENAME_0037
     * @tc.name      testExtRecTimeName0036
     * @tc.desc      Time/name edge 59999ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeName0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(getShownTimer(59999)).assertEqual('1:0');
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMENAME_0038
     * @tc.name      testExtRecTimeName0037
     * @tc.desc      Time/name edge 60000ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeName0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(getShownTimer(60000)).assertEqual('1:0');
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMENAME_0039
     * @tc.name      testExtRecTimeName0038
     * @tc.desc      Time/name edge 3599999ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeName0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(getShownTimer(3599999)).assertEqual('60:0');
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(time.length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_TIMENAME_0040
     * @tc.name      testExtRecTimeName0039
     * @tc.desc      Time/name edge 3600000ms.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeName0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(getShownTimer(3600000)).assertEqual('60:0');
      const util: DateTimeUtil = new DateTimeUtil();
      const date: string = util.getDate();
      const time: string = util.getTime();
      const audio: string = `AUDIO_${date}_${time}.m4a`;
      const video: string = `VIDEO_${date}_${time}.mp4`;
      expect(audio.startsWith('AUDIO_')).assertTrue();
      expect(video.endsWith('.mp4')).assertTrue();
      expect(time.length).assertEqual(6);
    })
  });
}
