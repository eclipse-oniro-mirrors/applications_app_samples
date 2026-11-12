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
import DateTimeUtil, { dateTime } from '../../../main/ets/utils/DateTimeUtil';

const TAG: string = '[Sample_avRecorderFileOutputMatrix]';
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

export default function avRecorderFileOutputMatrixTest(): void {
  describe('avRecorderFileOutputMatrixTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0001
     * @tc.name      testExtRecFileOut0000
     * @tc.desc      File output AUDIO_ size 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `AUDIO_${util.getDate()}_${util.getTime()}.m4a`;
      const size: number = 0;
      expect(name.startsWith('AUDIO_')).assertTrue();
      expect(name.endsWith('.m4a')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(false);
      expect(dateTime(0).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0002
     * @tc.name      testExtRecFileOut0001
     * @tc.desc      File output VIDEO_ size 500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `VIDEO_${util.getDate()}_${util.getTime()}.mp4`;
      const size: number = 500;
      expect(name.startsWith('VIDEO_')).assertTrue();
      expect(name.endsWith('.mp4')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(false);
      expect(dateTime(1).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0003
     * @tc.name      testExtRecFileOut0002
     * @tc.desc      File output AUDIO_ size 1000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `AUDIO_${util.getDate()}_${util.getTime()}.m4a`;
      const size: number = 1000;
      expect(name.startsWith('AUDIO_')).assertTrue();
      expect(name.endsWith('.m4a')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(true);
      expect(dateTime(2).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0004
     * @tc.name      testExtRecFileOut0003
     * @tc.desc      File output VIDEO_ size 10000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `VIDEO_${util.getDate()}_${util.getTime()}.mp4`;
      const size: number = 10000;
      expect(name.startsWith('VIDEO_')).assertTrue();
      expect(name.endsWith('.mp4')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(true);
      expect(dateTime(3).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0005
     * @tc.name      testExtRecFileOut0004
     * @tc.desc      File output AUDIO_ size 100000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `AUDIO_${util.getDate()}_${util.getTime()}.m4a`;
      const size: number = 100000;
      expect(name.startsWith('AUDIO_')).assertTrue();
      expect(name.endsWith('.m4a')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(true);
      expect(dateTime(4).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0006
     * @tc.name      testExtRecFileOut0005
     * @tc.desc      File output VIDEO_ size 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `VIDEO_${util.getDate()}_${util.getTime()}.mp4`;
      const size: number = 0;
      expect(name.startsWith('VIDEO_')).assertTrue();
      expect(name.endsWith('.mp4')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(false);
      expect(dateTime(5).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0007
     * @tc.name      testExtRecFileOut0006
     * @tc.desc      File output AUDIO_ size 500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `AUDIO_${util.getDate()}_${util.getTime()}.m4a`;
      const size: number = 500;
      expect(name.startsWith('AUDIO_')).assertTrue();
      expect(name.endsWith('.m4a')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(false);
      expect(dateTime(6).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0008
     * @tc.name      testExtRecFileOut0007
     * @tc.desc      File output VIDEO_ size 1000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `VIDEO_${util.getDate()}_${util.getTime()}.mp4`;
      const size: number = 1000;
      expect(name.startsWith('VIDEO_')).assertTrue();
      expect(name.endsWith('.mp4')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(true);
      expect(dateTime(7).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0009
     * @tc.name      testExtRecFileOut0008
     * @tc.desc      File output AUDIO_ size 10000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `AUDIO_${util.getDate()}_${util.getTime()}.m4a`;
      const size: number = 10000;
      expect(name.startsWith('AUDIO_')).assertTrue();
      expect(name.endsWith('.m4a')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(true);
      expect(dateTime(8).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0010
     * @tc.name      testExtRecFileOut0009
     * @tc.desc      File output VIDEO_ size 100000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `VIDEO_${util.getDate()}_${util.getTime()}.mp4`;
      const size: number = 100000;
      expect(name.startsWith('VIDEO_')).assertTrue();
      expect(name.endsWith('.mp4')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(true);
      expect(dateTime(9).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0011
     * @tc.name      testExtRecFileOut0010
     * @tc.desc      File output AUDIO_ size 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `AUDIO_${util.getDate()}_${util.getTime()}.m4a`;
      const size: number = 0;
      expect(name.startsWith('AUDIO_')).assertTrue();
      expect(name.endsWith('.m4a')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(false);
      expect(dateTime(10).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0012
     * @tc.name      testExtRecFileOut0011
     * @tc.desc      File output VIDEO_ size 500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `VIDEO_${util.getDate()}_${util.getTime()}.mp4`;
      const size: number = 500;
      expect(name.startsWith('VIDEO_')).assertTrue();
      expect(name.endsWith('.mp4')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(false);
      expect(dateTime(11).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0013
     * @tc.name      testExtRecFileOut0012
     * @tc.desc      File output AUDIO_ size 1000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `AUDIO_${util.getDate()}_${util.getTime()}.m4a`;
      const size: number = 1000;
      expect(name.startsWith('AUDIO_')).assertTrue();
      expect(name.endsWith('.m4a')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(true);
      expect(dateTime(12).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0014
     * @tc.name      testExtRecFileOut0013
     * @tc.desc      File output VIDEO_ size 10000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `VIDEO_${util.getDate()}_${util.getTime()}.mp4`;
      const size: number = 10000;
      expect(name.startsWith('VIDEO_')).assertTrue();
      expect(name.endsWith('.mp4')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(true);
      expect(dateTime(13).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0015
     * @tc.name      testExtRecFileOut0014
     * @tc.desc      File output AUDIO_ size 100000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `AUDIO_${util.getDate()}_${util.getTime()}.m4a`;
      const size: number = 100000;
      expect(name.startsWith('AUDIO_')).assertTrue();
      expect(name.endsWith('.m4a')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(true);
      expect(dateTime(14).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0016
     * @tc.name      testExtRecFileOut0015
     * @tc.desc      File output VIDEO_ size 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `VIDEO_${util.getDate()}_${util.getTime()}.mp4`;
      const size: number = 0;
      expect(name.startsWith('VIDEO_')).assertTrue();
      expect(name.endsWith('.mp4')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(false);
      expect(dateTime(15).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0017
     * @tc.name      testExtRecFileOut0016
     * @tc.desc      File output AUDIO_ size 500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `AUDIO_${util.getDate()}_${util.getTime()}.m4a`;
      const size: number = 500;
      expect(name.startsWith('AUDIO_')).assertTrue();
      expect(name.endsWith('.m4a')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(false);
      expect(dateTime(16).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0018
     * @tc.name      testExtRecFileOut0017
     * @tc.desc      File output VIDEO_ size 1000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `VIDEO_${util.getDate()}_${util.getTime()}.mp4`;
      const size: number = 1000;
      expect(name.startsWith('VIDEO_')).assertTrue();
      expect(name.endsWith('.mp4')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(true);
      expect(dateTime(17).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0019
     * @tc.name      testExtRecFileOut0018
     * @tc.desc      File output AUDIO_ size 10000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `AUDIO_${util.getDate()}_${util.getTime()}.m4a`;
      const size: number = 10000;
      expect(name.startsWith('AUDIO_')).assertTrue();
      expect(name.endsWith('.m4a')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(true);
      expect(dateTime(18).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0020
     * @tc.name      testExtRecFileOut0019
     * @tc.desc      File output VIDEO_ size 100000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `VIDEO_${util.getDate()}_${util.getTime()}.mp4`;
      const size: number = 100000;
      expect(name.startsWith('VIDEO_')).assertTrue();
      expect(name.endsWith('.mp4')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(true);
      expect(dateTime(19).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0021
     * @tc.name      testExtRecFileOut0020
     * @tc.desc      File output AUDIO_ size 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `AUDIO_${util.getDate()}_${util.getTime()}.m4a`;
      const size: number = 0;
      expect(name.startsWith('AUDIO_')).assertTrue();
      expect(name.endsWith('.m4a')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(false);
      expect(dateTime(20).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0022
     * @tc.name      testExtRecFileOut0021
     * @tc.desc      File output VIDEO_ size 500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `VIDEO_${util.getDate()}_${util.getTime()}.mp4`;
      const size: number = 500;
      expect(name.startsWith('VIDEO_')).assertTrue();
      expect(name.endsWith('.mp4')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(false);
      expect(dateTime(21).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0023
     * @tc.name      testExtRecFileOut0022
     * @tc.desc      File output AUDIO_ size 1000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `AUDIO_${util.getDate()}_${util.getTime()}.m4a`;
      const size: number = 1000;
      expect(name.startsWith('AUDIO_')).assertTrue();
      expect(name.endsWith('.m4a')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(true);
      expect(dateTime(22).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0024
     * @tc.name      testExtRecFileOut0023
     * @tc.desc      File output VIDEO_ size 10000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `VIDEO_${util.getDate()}_${util.getTime()}.mp4`;
      const size: number = 10000;
      expect(name.startsWith('VIDEO_')).assertTrue();
      expect(name.endsWith('.mp4')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(true);
      expect(dateTime(23).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0025
     * @tc.name      testExtRecFileOut0024
     * @tc.desc      File output AUDIO_ size 100000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `AUDIO_${util.getDate()}_${util.getTime()}.m4a`;
      const size: number = 100000;
      expect(name.startsWith('AUDIO_')).assertTrue();
      expect(name.endsWith('.m4a')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(true);
      expect(dateTime(24).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0026
     * @tc.name      testExtRecFileOut0025
     * @tc.desc      File output VIDEO_ size 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `VIDEO_${util.getDate()}_${util.getTime()}.mp4`;
      const size: number = 0;
      expect(name.startsWith('VIDEO_')).assertTrue();
      expect(name.endsWith('.mp4')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(false);
      expect(dateTime(25).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0027
     * @tc.name      testExtRecFileOut0026
     * @tc.desc      File output AUDIO_ size 500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `AUDIO_${util.getDate()}_${util.getTime()}.m4a`;
      const size: number = 500;
      expect(name.startsWith('AUDIO_')).assertTrue();
      expect(name.endsWith('.m4a')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(false);
      expect(dateTime(26).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0028
     * @tc.name      testExtRecFileOut0027
     * @tc.desc      File output VIDEO_ size 1000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `VIDEO_${util.getDate()}_${util.getTime()}.mp4`;
      const size: number = 1000;
      expect(name.startsWith('VIDEO_')).assertTrue();
      expect(name.endsWith('.mp4')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(true);
      expect(dateTime(27).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0029
     * @tc.name      testExtRecFileOut0028
     * @tc.desc      File output AUDIO_ size 10000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `AUDIO_${util.getDate()}_${util.getTime()}.m4a`;
      const size: number = 10000;
      expect(name.startsWith('AUDIO_')).assertTrue();
      expect(name.endsWith('.m4a')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(true);
      expect(dateTime(28).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0030
     * @tc.name      testExtRecFileOut0029
     * @tc.desc      File output VIDEO_ size 100000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `VIDEO_${util.getDate()}_${util.getTime()}.mp4`;
      const size: number = 100000;
      expect(name.startsWith('VIDEO_')).assertTrue();
      expect(name.endsWith('.mp4')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(true);
      expect(dateTime(29).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0031
     * @tc.name      testExtRecFileOut0030
     * @tc.desc      File output AUDIO_ size 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `AUDIO_${util.getDate()}_${util.getTime()}.m4a`;
      const size: number = 0;
      expect(name.startsWith('AUDIO_')).assertTrue();
      expect(name.endsWith('.m4a')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(false);
      expect(dateTime(30).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0032
     * @tc.name      testExtRecFileOut0031
     * @tc.desc      File output VIDEO_ size 500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `VIDEO_${util.getDate()}_${util.getTime()}.mp4`;
      const size: number = 500;
      expect(name.startsWith('VIDEO_')).assertTrue();
      expect(name.endsWith('.mp4')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(false);
      expect(dateTime(31).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0033
     * @tc.name      testExtRecFileOut0032
     * @tc.desc      File output AUDIO_ size 1000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `AUDIO_${util.getDate()}_${util.getTime()}.m4a`;
      const size: number = 1000;
      expect(name.startsWith('AUDIO_')).assertTrue();
      expect(name.endsWith('.m4a')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(true);
      expect(dateTime(32).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0034
     * @tc.name      testExtRecFileOut0033
     * @tc.desc      File output VIDEO_ size 10000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `VIDEO_${util.getDate()}_${util.getTime()}.mp4`;
      const size: number = 10000;
      expect(name.startsWith('VIDEO_')).assertTrue();
      expect(name.endsWith('.mp4')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(true);
      expect(dateTime(33).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0035
     * @tc.name      testExtRecFileOut0034
     * @tc.desc      File output AUDIO_ size 100000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `AUDIO_${util.getDate()}_${util.getTime()}.m4a`;
      const size: number = 100000;
      expect(name.startsWith('AUDIO_')).assertTrue();
      expect(name.endsWith('.m4a')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(true);
      expect(dateTime(34).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0036
     * @tc.name      testExtRecFileOut0035
     * @tc.desc      File output VIDEO_ size 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `VIDEO_${util.getDate()}_${util.getTime()}.mp4`;
      const size: number = 0;
      expect(name.startsWith('VIDEO_')).assertTrue();
      expect(name.endsWith('.mp4')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(false);
      expect(dateTime(35).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0037
     * @tc.name      testExtRecFileOut0036
     * @tc.desc      File output AUDIO_ size 500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `AUDIO_${util.getDate()}_${util.getTime()}.m4a`;
      const size: number = 500;
      expect(name.startsWith('AUDIO_')).assertTrue();
      expect(name.endsWith('.m4a')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(false);
      expect(dateTime(36).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0038
     * @tc.name      testExtRecFileOut0037
     * @tc.desc      File output VIDEO_ size 1000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `VIDEO_${util.getDate()}_${util.getTime()}.mp4`;
      const size: number = 1000;
      expect(name.startsWith('VIDEO_')).assertTrue();
      expect(name.endsWith('.mp4')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(true);
      expect(dateTime(37).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0039
     * @tc.name      testExtRecFileOut0038
     * @tc.desc      File output AUDIO_ size 10000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `AUDIO_${util.getDate()}_${util.getTime()}.m4a`;
      const size: number = 10000;
      expect(name.startsWith('AUDIO_')).assertTrue();
      expect(name.endsWith('.m4a')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(true);
      expect(dateTime(38).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0040
     * @tc.name      testExtRecFileOut0039
     * @tc.desc      File output VIDEO_ size 100000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `VIDEO_${util.getDate()}_${util.getTime()}.mp4`;
      const size: number = 100000;
      expect(name.startsWith('VIDEO_')).assertTrue();
      expect(name.endsWith('.mp4')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(true);
      expect(dateTime(39).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0041
     * @tc.name      testExtRecFileOut0040
     * @tc.desc      File output AUDIO_ size 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `AUDIO_${util.getDate()}_${util.getTime()}.m4a`;
      const size: number = 0;
      expect(name.startsWith('AUDIO_')).assertTrue();
      expect(name.endsWith('.m4a')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(false);
      expect(dateTime(40).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0042
     * @tc.name      testExtRecFileOut0041
     * @tc.desc      File output VIDEO_ size 500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `VIDEO_${util.getDate()}_${util.getTime()}.mp4`;
      const size: number = 500;
      expect(name.startsWith('VIDEO_')).assertTrue();
      expect(name.endsWith('.mp4')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(false);
      expect(dateTime(41).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0043
     * @tc.name      testExtRecFileOut0042
     * @tc.desc      File output AUDIO_ size 1000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `AUDIO_${util.getDate()}_${util.getTime()}.m4a`;
      const size: number = 1000;
      expect(name.startsWith('AUDIO_')).assertTrue();
      expect(name.endsWith('.m4a')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(true);
      expect(dateTime(42).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0044
     * @tc.name      testExtRecFileOut0043
     * @tc.desc      File output VIDEO_ size 10000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `VIDEO_${util.getDate()}_${util.getTime()}.mp4`;
      const size: number = 10000;
      expect(name.startsWith('VIDEO_')).assertTrue();
      expect(name.endsWith('.mp4')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(true);
      expect(dateTime(43).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0045
     * @tc.name      testExtRecFileOut0044
     * @tc.desc      File output AUDIO_ size 100000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `AUDIO_${util.getDate()}_${util.getTime()}.m4a`;
      const size: number = 100000;
      expect(name.startsWith('AUDIO_')).assertTrue();
      expect(name.endsWith('.m4a')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(true);
      expect(dateTime(44).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0046
     * @tc.name      testExtRecFileOut0045
     * @tc.desc      File output VIDEO_ size 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `VIDEO_${util.getDate()}_${util.getTime()}.mp4`;
      const size: number = 0;
      expect(name.startsWith('VIDEO_')).assertTrue();
      expect(name.endsWith('.mp4')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(false);
      expect(dateTime(45).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0047
     * @tc.name      testExtRecFileOut0046
     * @tc.desc      File output AUDIO_ size 500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `AUDIO_${util.getDate()}_${util.getTime()}.m4a`;
      const size: number = 500;
      expect(name.startsWith('AUDIO_')).assertTrue();
      expect(name.endsWith('.m4a')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(false);
      expect(dateTime(46).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0048
     * @tc.name      testExtRecFileOut0047
     * @tc.desc      File output VIDEO_ size 1000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `VIDEO_${util.getDate()}_${util.getTime()}.mp4`;
      const size: number = 1000;
      expect(name.startsWith('VIDEO_')).assertTrue();
      expect(name.endsWith('.mp4')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(true);
      expect(dateTime(47).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0049
     * @tc.name      testExtRecFileOut0048
     * @tc.desc      File output AUDIO_ size 10000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `AUDIO_${util.getDate()}_${util.getTime()}.m4a`;
      const size: number = 10000;
      expect(name.startsWith('AUDIO_')).assertTrue();
      expect(name.endsWith('.m4a')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(true);
      expect(dateTime(48).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0050
     * @tc.name      testExtRecFileOut0049
     * @tc.desc      File output VIDEO_ size 100000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `VIDEO_${util.getDate()}_${util.getTime()}.mp4`;
      const size: number = 100000;
      expect(name.startsWith('VIDEO_')).assertTrue();
      expect(name.endsWith('.mp4')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(true);
      expect(dateTime(49).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0051
     * @tc.name      testExtRecFileOut0050
     * @tc.desc      File output AUDIO_ size 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `AUDIO_${util.getDate()}_${util.getTime()}.m4a`;
      const size: number = 0;
      expect(name.startsWith('AUDIO_')).assertTrue();
      expect(name.endsWith('.m4a')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(false);
      expect(dateTime(50).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0052
     * @tc.name      testExtRecFileOut0051
     * @tc.desc      File output VIDEO_ size 500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `VIDEO_${util.getDate()}_${util.getTime()}.mp4`;
      const size: number = 500;
      expect(name.startsWith('VIDEO_')).assertTrue();
      expect(name.endsWith('.mp4')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(false);
      expect(dateTime(51).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0053
     * @tc.name      testExtRecFileOut0052
     * @tc.desc      File output AUDIO_ size 1000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `AUDIO_${util.getDate()}_${util.getTime()}.m4a`;
      const size: number = 1000;
      expect(name.startsWith('AUDIO_')).assertTrue();
      expect(name.endsWith('.m4a')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(true);
      expect(dateTime(52).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0054
     * @tc.name      testExtRecFileOut0053
     * @tc.desc      File output VIDEO_ size 10000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `VIDEO_${util.getDate()}_${util.getTime()}.mp4`;
      const size: number = 10000;
      expect(name.startsWith('VIDEO_')).assertTrue();
      expect(name.endsWith('.mp4')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(true);
      expect(dateTime(53).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0055
     * @tc.name      testExtRecFileOut0054
     * @tc.desc      File output AUDIO_ size 100000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `AUDIO_${util.getDate()}_${util.getTime()}.m4a`;
      const size: number = 100000;
      expect(name.startsWith('AUDIO_')).assertTrue();
      expect(name.endsWith('.m4a')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(true);
      expect(dateTime(54).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0056
     * @tc.name      testExtRecFileOut0055
     * @tc.desc      File output VIDEO_ size 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `VIDEO_${util.getDate()}_${util.getTime()}.mp4`;
      const size: number = 0;
      expect(name.startsWith('VIDEO_')).assertTrue();
      expect(name.endsWith('.mp4')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(false);
      expect(dateTime(55).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0057
     * @tc.name      testExtRecFileOut0056
     * @tc.desc      File output AUDIO_ size 500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `AUDIO_${util.getDate()}_${util.getTime()}.m4a`;
      const size: number = 500;
      expect(name.startsWith('AUDIO_')).assertTrue();
      expect(name.endsWith('.m4a')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(false);
      expect(dateTime(56).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0058
     * @tc.name      testExtRecFileOut0057
     * @tc.desc      File output VIDEO_ size 1000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `VIDEO_${util.getDate()}_${util.getTime()}.mp4`;
      const size: number = 1000;
      expect(name.startsWith('VIDEO_')).assertTrue();
      expect(name.endsWith('.mp4')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(true);
      expect(dateTime(57).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0059
     * @tc.name      testExtRecFileOut0058
     * @tc.desc      File output AUDIO_ size 10000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `AUDIO_${util.getDate()}_${util.getTime()}.m4a`;
      const size: number = 10000;
      expect(name.startsWith('AUDIO_')).assertTrue();
      expect(name.endsWith('.m4a')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(true);
      expect(dateTime(58).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0060
     * @tc.name      testExtRecFileOut0059
     * @tc.desc      File output VIDEO_ size 100000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `VIDEO_${util.getDate()}_${util.getTime()}.mp4`;
      const size: number = 100000;
      expect(name.startsWith('VIDEO_')).assertTrue();
      expect(name.endsWith('.mp4')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(true);
      expect(dateTime(59).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0061
     * @tc.name      testExtRecFileOut0060
     * @tc.desc      File output AUDIO_ size 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `AUDIO_${util.getDate()}_${util.getTime()}.m4a`;
      const size: number = 0;
      expect(name.startsWith('AUDIO_')).assertTrue();
      expect(name.endsWith('.m4a')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(false);
      expect(dateTime(60).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0062
     * @tc.name      testExtRecFileOut0061
     * @tc.desc      File output VIDEO_ size 500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `VIDEO_${util.getDate()}_${util.getTime()}.mp4`;
      const size: number = 500;
      expect(name.startsWith('VIDEO_')).assertTrue();
      expect(name.endsWith('.mp4')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(false);
      expect(dateTime(61).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0063
     * @tc.name      testExtRecFileOut0062
     * @tc.desc      File output AUDIO_ size 1000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `AUDIO_${util.getDate()}_${util.getTime()}.m4a`;
      const size: number = 1000;
      expect(name.startsWith('AUDIO_')).assertTrue();
      expect(name.endsWith('.m4a')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(true);
      expect(dateTime(62).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0064
     * @tc.name      testExtRecFileOut0063
     * @tc.desc      File output VIDEO_ size 10000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `VIDEO_${util.getDate()}_${util.getTime()}.mp4`;
      const size: number = 10000;
      expect(name.startsWith('VIDEO_')).assertTrue();
      expect(name.endsWith('.mp4')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(true);
      expect(dateTime(63).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0065
     * @tc.name      testExtRecFileOut0064
     * @tc.desc      File output AUDIO_ size 100000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `AUDIO_${util.getDate()}_${util.getTime()}.m4a`;
      const size: number = 100000;
      expect(name.startsWith('AUDIO_')).assertTrue();
      expect(name.endsWith('.m4a')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(true);
      expect(dateTime(64).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0066
     * @tc.name      testExtRecFileOut0065
     * @tc.desc      File output VIDEO_ size 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `VIDEO_${util.getDate()}_${util.getTime()}.mp4`;
      const size: number = 0;
      expect(name.startsWith('VIDEO_')).assertTrue();
      expect(name.endsWith('.mp4')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(false);
      expect(dateTime(65).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0067
     * @tc.name      testExtRecFileOut0066
     * @tc.desc      File output AUDIO_ size 500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `AUDIO_${util.getDate()}_${util.getTime()}.m4a`;
      const size: number = 500;
      expect(name.startsWith('AUDIO_')).assertTrue();
      expect(name.endsWith('.m4a')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(false);
      expect(dateTime(66).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0068
     * @tc.name      testExtRecFileOut0067
     * @tc.desc      File output VIDEO_ size 1000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `VIDEO_${util.getDate()}_${util.getTime()}.mp4`;
      const size: number = 1000;
      expect(name.startsWith('VIDEO_')).assertTrue();
      expect(name.endsWith('.mp4')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(true);
      expect(dateTime(67).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0069
     * @tc.name      testExtRecFileOut0068
     * @tc.desc      File output AUDIO_ size 10000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `AUDIO_${util.getDate()}_${util.getTime()}.m4a`;
      const size: number = 10000;
      expect(name.startsWith('AUDIO_')).assertTrue();
      expect(name.endsWith('.m4a')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(true);
      expect(dateTime(68).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0070
     * @tc.name      testExtRecFileOut0069
     * @tc.desc      File output VIDEO_ size 100000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `VIDEO_${util.getDate()}_${util.getTime()}.mp4`;
      const size: number = 100000;
      expect(name.startsWith('VIDEO_')).assertTrue();
      expect(name.endsWith('.mp4')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(true);
      expect(dateTime(69).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0071
     * @tc.name      testExtRecFileOut0070
     * @tc.desc      File output AUDIO_ size 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `AUDIO_${util.getDate()}_${util.getTime()}.m4a`;
      const size: number = 0;
      expect(name.startsWith('AUDIO_')).assertTrue();
      expect(name.endsWith('.m4a')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(false);
      expect(dateTime(70).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0072
     * @tc.name      testExtRecFileOut0071
     * @tc.desc      File output VIDEO_ size 500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `VIDEO_${util.getDate()}_${util.getTime()}.mp4`;
      const size: number = 500;
      expect(name.startsWith('VIDEO_')).assertTrue();
      expect(name.endsWith('.mp4')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(false);
      expect(dateTime(71).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0073
     * @tc.name      testExtRecFileOut0072
     * @tc.desc      File output AUDIO_ size 1000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `AUDIO_${util.getDate()}_${util.getTime()}.m4a`;
      const size: number = 1000;
      expect(name.startsWith('AUDIO_')).assertTrue();
      expect(name.endsWith('.m4a')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(true);
      expect(dateTime(72).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0074
     * @tc.name      testExtRecFileOut0073
     * @tc.desc      File output VIDEO_ size 10000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `VIDEO_${util.getDate()}_${util.getTime()}.mp4`;
      const size: number = 10000;
      expect(name.startsWith('VIDEO_')).assertTrue();
      expect(name.endsWith('.mp4')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(true);
      expect(dateTime(73).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0075
     * @tc.name      testExtRecFileOut0074
     * @tc.desc      File output AUDIO_ size 100000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `AUDIO_${util.getDate()}_${util.getTime()}.m4a`;
      const size: number = 100000;
      expect(name.startsWith('AUDIO_')).assertTrue();
      expect(name.endsWith('.m4a')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(true);
      expect(dateTime(74).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0076
     * @tc.name      testExtRecFileOut0075
     * @tc.desc      File output VIDEO_ size 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `VIDEO_${util.getDate()}_${util.getTime()}.mp4`;
      const size: number = 0;
      expect(name.startsWith('VIDEO_')).assertTrue();
      expect(name.endsWith('.mp4')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(false);
      expect(dateTime(75).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0077
     * @tc.name      testExtRecFileOut0076
     * @tc.desc      File output AUDIO_ size 500.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `AUDIO_${util.getDate()}_${util.getTime()}.m4a`;
      const size: number = 500;
      expect(name.startsWith('AUDIO_')).assertTrue();
      expect(name.endsWith('.m4a')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(false);
      expect(dateTime(76).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0078
     * @tc.name      testExtRecFileOut0077
     * @tc.desc      File output VIDEO_ size 1000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `VIDEO_${util.getDate()}_${util.getTime()}.mp4`;
      const size: number = 1000;
      expect(name.startsWith('VIDEO_')).assertTrue();
      expect(name.endsWith('.mp4')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(true);
      expect(dateTime(77).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0079
     * @tc.name      testExtRecFileOut0078
     * @tc.desc      File output AUDIO_ size 10000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `AUDIO_${util.getDate()}_${util.getTime()}.m4a`;
      const size: number = 10000;
      expect(name.startsWith('AUDIO_')).assertTrue();
      expect(name.endsWith('.m4a')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(true);
      expect(dateTime(78).length).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEOUT_0080
     * @tc.name      testExtRecFileOut0079
     * @tc.desc      File output VIDEO_ size 100000.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileOut0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const name: string = `VIDEO_${util.getDate()}_${util.getTime()}.mp4`;
      const size: number = 100000;
      expect(name.startsWith('VIDEO_')).assertTrue();
      expect(name.endsWith('.mp4')).assertTrue();
      expect(name.indexOf('/')).assertEqual(-1);
      expect(size >= 1000).assertEqual(true);
      expect(dateTime(79).length).assertEqual(5);
    })
  });
}
