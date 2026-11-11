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

const TAG: string = '[Sample_avRecorderDateTimeCore]';
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

export default function avRecorderDateTimeCoreTest(): void {
  describe('avRecorderDateTimeCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0001
     * @tc.name      testExtRecTimeUtil0000
     * @tc.desc      DateTimeUtil fill/concat case 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(0)).assertEqual('00');
      expect(util.concatDate(2020, 1, 1)).assertEqual('202011');
      expect(util.concatTime(0, 0, 0)).assertEqual('000000');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0002
     * @tc.name      testExtRecTimeUtil0001
     * @tc.desc      DateTimeUtil fill/concat case 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(1)).assertEqual('01');
      expect(util.concatDate(2021, 2, 2)).assertEqual('202122');
      expect(util.concatTime(0, 0, 0)).assertEqual('000000');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0003
     * @tc.name      testExtRecTimeUtil0002
     * @tc.desc      DateTimeUtil fill/concat case 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(9)).assertEqual('09');
      expect(util.concatDate(2022, 3, 3)).assertEqual('202233');
      expect(util.concatTime(1, 0, 0)).assertEqual('010000');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0004
     * @tc.name      testExtRecTimeUtil0003
     * @tc.desc      DateTimeUtil fill/concat case 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(10)).assertEqual('10');
      expect(util.concatDate(2023, 4, 4)).assertEqual('202344');
      expect(util.concatTime(1, 1, 0)).assertEqual('010100');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0005
     * @tc.name      testExtRecTimeUtil0004
     * @tc.desc      DateTimeUtil fill/concat case 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(11)).assertEqual('11');
      expect(util.concatDate(2024, 5, 5)).assertEqual('202455');
      expect(util.concatTime(9, 1, 1)).assertEqual('090101');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0006
     * @tc.name      testExtRecTimeUtil0005
     * @tc.desc      DateTimeUtil fill/concat case 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(59)).assertEqual('59');
      expect(util.concatDate(2025, 6, 6)).assertEqual('202566');
      expect(util.concatTime(9, 1, 1)).assertEqual('090101');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0007
     * @tc.name      testExtRecTimeUtil0006
     * @tc.desc      DateTimeUtil fill/concat case 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(60)).assertEqual('60');
      expect(util.concatDate(2026, 7, 7)).assertEqual('202677');
      expect(util.concatTime(10, 9, 1)).assertEqual('100901');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0008
     * @tc.name      testExtRecTimeUtil0007
     * @tc.desc      DateTimeUtil fill/concat case 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(99)).assertEqual('99');
      expect(util.concatDate(2020, 8, 8)).assertEqual('202088');
      expect(util.concatTime(10, 9, 1)).assertEqual('100901');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0009
     * @tc.name      testExtRecTimeUtil0008
     * @tc.desc      DateTimeUtil fill/concat case 9.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(0)).assertEqual('00');
      expect(util.concatDate(2021, 9, 9)).assertEqual('202199');
      expect(util.concatTime(11, 9, 9)).assertEqual('110909');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0010
     * @tc.name      testExtRecTimeUtil0009
     * @tc.desc      DateTimeUtil fill/concat case 10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(1)).assertEqual('01');
      expect(util.concatDate(2022, 10, 10)).assertEqual('20221010');
      expect(util.concatTime(11, 10, 9)).assertEqual('111009');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0011
     * @tc.name      testExtRecTimeUtil0010
     * @tc.desc      DateTimeUtil fill/concat case 11.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(9)).assertEqual('09');
      expect(util.concatDate(2023, 11, 11)).assertEqual('20231111');
      expect(util.concatTime(59, 10, 9)).assertEqual('591009');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0012
     * @tc.name      testExtRecTimeUtil0011
     * @tc.desc      DateTimeUtil fill/concat case 12.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(10)).assertEqual('10');
      expect(util.concatDate(2024, 12, 12)).assertEqual('20241212');
      expect(util.concatTime(59, 10, 9)).assertEqual('591009');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0013
     * @tc.name      testExtRecTimeUtil0012
     * @tc.desc      DateTimeUtil fill/concat case 13.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(11)).assertEqual('11');
      expect(util.concatDate(2025, 1, 13)).assertEqual('2025113');
      expect(util.concatTime(60, 11, 10)).assertEqual('601110');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0014
     * @tc.name      testExtRecTimeUtil0013
     * @tc.desc      DateTimeUtil fill/concat case 14.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(59)).assertEqual('59');
      expect(util.concatDate(2026, 2, 14)).assertEqual('2026214');
      expect(util.concatTime(60, 11, 10)).assertEqual('601110');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0015
     * @tc.name      testExtRecTimeUtil0014
     * @tc.desc      DateTimeUtil fill/concat case 15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(60)).assertEqual('60');
      expect(util.concatDate(2020, 3, 15)).assertEqual('2020315');
      expect(util.concatTime(99, 11, 10)).assertEqual('991110');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0016
     * @tc.name      testExtRecTimeUtil0015
     * @tc.desc      DateTimeUtil fill/concat case 16.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(99)).assertEqual('99');
      expect(util.concatDate(2021, 4, 16)).assertEqual('2021416');
      expect(util.concatTime(99, 59, 10)).assertEqual('995910');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0017
     * @tc.name      testExtRecTimeUtil0016
     * @tc.desc      DateTimeUtil fill/concat case 17.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(0)).assertEqual('00');
      expect(util.concatDate(2022, 5, 17)).assertEqual('2022517');
      expect(util.concatTime(0, 59, 11)).assertEqual('005911');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0018
     * @tc.name      testExtRecTimeUtil0017
     * @tc.desc      DateTimeUtil fill/concat case 18.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(1)).assertEqual('01');
      expect(util.concatDate(2023, 6, 18)).assertEqual('2023618');
      expect(util.concatTime(0, 59, 11)).assertEqual('005911');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0019
     * @tc.name      testExtRecTimeUtil0018
     * @tc.desc      DateTimeUtil fill/concat case 19.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(9)).assertEqual('09');
      expect(util.concatDate(2024, 7, 19)).assertEqual('2024719');
      expect(util.concatTime(1, 60, 11)).assertEqual('016011');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0020
     * @tc.name      testExtRecTimeUtil0019
     * @tc.desc      DateTimeUtil fill/concat case 20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(10)).assertEqual('10');
      expect(util.concatDate(2025, 8, 20)).assertEqual('2025820');
      expect(util.concatTime(1, 60, 11)).assertEqual('016011');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0021
     * @tc.name      testExtRecTimeUtil0020
     * @tc.desc      DateTimeUtil fill/concat case 21.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(11)).assertEqual('11');
      expect(util.concatDate(2026, 9, 21)).assertEqual('2026921');
      expect(util.concatTime(9, 60, 59)).assertEqual('096059');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0022
     * @tc.name      testExtRecTimeUtil0021
     * @tc.desc      DateTimeUtil fill/concat case 22.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(59)).assertEqual('59');
      expect(util.concatDate(2020, 10, 22)).assertEqual('20201022');
      expect(util.concatTime(9, 99, 59)).assertEqual('099959');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0023
     * @tc.name      testExtRecTimeUtil0022
     * @tc.desc      DateTimeUtil fill/concat case 23.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(60)).assertEqual('60');
      expect(util.concatDate(2021, 11, 23)).assertEqual('20211123');
      expect(util.concatTime(10, 99, 59)).assertEqual('109959');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0024
     * @tc.name      testExtRecTimeUtil0023
     * @tc.desc      DateTimeUtil fill/concat case 24.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(99)).assertEqual('99');
      expect(util.concatDate(2022, 12, 24)).assertEqual('20221224');
      expect(util.concatTime(10, 99, 59)).assertEqual('109959');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0025
     * @tc.name      testExtRecTimeUtil0024
     * @tc.desc      DateTimeUtil fill/concat case 25.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(0)).assertEqual('00');
      expect(util.concatDate(2023, 1, 25)).assertEqual('2023125');
      expect(util.concatTime(11, 0, 60)).assertEqual('110060');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0026
     * @tc.name      testExtRecTimeUtil0025
     * @tc.desc      DateTimeUtil fill/concat case 26.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(1)).assertEqual('01');
      expect(util.concatDate(2024, 2, 26)).assertEqual('2024226');
      expect(util.concatTime(11, 0, 60)).assertEqual('110060');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0027
     * @tc.name      testExtRecTimeUtil0026
     * @tc.desc      DateTimeUtil fill/concat case 27.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(9)).assertEqual('09');
      expect(util.concatDate(2025, 3, 27)).assertEqual('2025327');
      expect(util.concatTime(59, 0, 60)).assertEqual('590060');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0028
     * @tc.name      testExtRecTimeUtil0027
     * @tc.desc      DateTimeUtil fill/concat case 28.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(10)).assertEqual('10');
      expect(util.concatDate(2026, 4, 28)).assertEqual('2026428');
      expect(util.concatTime(59, 1, 60)).assertEqual('590160');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0029
     * @tc.name      testExtRecTimeUtil0028
     * @tc.desc      DateTimeUtil fill/concat case 29.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(11)).assertEqual('11');
      expect(util.concatDate(2020, 5, 1)).assertEqual('202051');
      expect(util.concatTime(60, 1, 99)).assertEqual('600199');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0030
     * @tc.name      testExtRecTimeUtil0029
     * @tc.desc      DateTimeUtil fill/concat case 30.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(59)).assertEqual('59');
      expect(util.concatDate(2021, 6, 2)).assertEqual('202162');
      expect(util.concatTime(60, 1, 99)).assertEqual('600199');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0031
     * @tc.name      testExtRecTimeUtil0030
     * @tc.desc      DateTimeUtil fill/concat case 31.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(60)).assertEqual('60');
      expect(util.concatDate(2022, 7, 3)).assertEqual('202273');
      expect(util.concatTime(99, 9, 99)).assertEqual('990999');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0032
     * @tc.name      testExtRecTimeUtil0031
     * @tc.desc      DateTimeUtil fill/concat case 32.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(99)).assertEqual('99');
      expect(util.concatDate(2023, 8, 4)).assertEqual('202384');
      expect(util.concatTime(99, 9, 99)).assertEqual('990999');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0033
     * @tc.name      testExtRecTimeUtil0032
     * @tc.desc      DateTimeUtil fill/concat case 33.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(0)).assertEqual('00');
      expect(util.concatDate(2024, 9, 5)).assertEqual('202495');
      expect(util.concatTime(0, 9, 0)).assertEqual('000900');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0034
     * @tc.name      testExtRecTimeUtil0033
     * @tc.desc      DateTimeUtil fill/concat case 34.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(1)).assertEqual('01');
      expect(util.concatDate(2025, 10, 6)).assertEqual('2025106');
      expect(util.concatTime(0, 10, 0)).assertEqual('001000');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0035
     * @tc.name      testExtRecTimeUtil0034
     * @tc.desc      DateTimeUtil fill/concat case 35.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(9)).assertEqual('09');
      expect(util.concatDate(2026, 11, 7)).assertEqual('2026117');
      expect(util.concatTime(1, 10, 0)).assertEqual('011000');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0036
     * @tc.name      testExtRecTimeUtil0035
     * @tc.desc      DateTimeUtil fill/concat case 36.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(10)).assertEqual('10');
      expect(util.concatDate(2020, 12, 8)).assertEqual('2020128');
      expect(util.concatTime(1, 10, 0)).assertEqual('011000');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0037
     * @tc.name      testExtRecTimeUtil0036
     * @tc.desc      DateTimeUtil fill/concat case 37.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(11)).assertEqual('11');
      expect(util.concatDate(2021, 1, 9)).assertEqual('202119');
      expect(util.concatTime(9, 11, 1)).assertEqual('091101');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0038
     * @tc.name      testExtRecTimeUtil0037
     * @tc.desc      DateTimeUtil fill/concat case 38.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(59)).assertEqual('59');
      expect(util.concatDate(2022, 2, 10)).assertEqual('2022210');
      expect(util.concatTime(9, 11, 1)).assertEqual('091101');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0039
     * @tc.name      testExtRecTimeUtil0038
     * @tc.desc      DateTimeUtil fill/concat case 39.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(60)).assertEqual('60');
      expect(util.concatDate(2023, 3, 11)).assertEqual('2023311');
      expect(util.concatTime(10, 11, 1)).assertEqual('101101');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0040
     * @tc.name      testExtRecTimeUtil0039
     * @tc.desc      DateTimeUtil fill/concat case 40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(99)).assertEqual('99');
      expect(util.concatDate(2024, 4, 12)).assertEqual('2024412');
      expect(util.concatTime(10, 59, 1)).assertEqual('105901');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0041
     * @tc.name      testExtRecTimeUtil0040
     * @tc.desc      DateTimeUtil fill/concat case 41.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(0)).assertEqual('00');
      expect(util.concatDate(2025, 5, 13)).assertEqual('2025513');
      expect(util.concatTime(11, 59, 9)).assertEqual('115909');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0042
     * @tc.name      testExtRecTimeUtil0041
     * @tc.desc      DateTimeUtil fill/concat case 42.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(1)).assertEqual('01');
      expect(util.concatDate(2026, 6, 14)).assertEqual('2026614');
      expect(util.concatTime(11, 59, 9)).assertEqual('115909');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0043
     * @tc.name      testExtRecTimeUtil0042
     * @tc.desc      DateTimeUtil fill/concat case 43.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(9)).assertEqual('09');
      expect(util.concatDate(2020, 7, 15)).assertEqual('2020715');
      expect(util.concatTime(59, 60, 9)).assertEqual('596009');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0044
     * @tc.name      testExtRecTimeUtil0043
     * @tc.desc      DateTimeUtil fill/concat case 44.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(10)).assertEqual('10');
      expect(util.concatDate(2021, 8, 16)).assertEqual('2021816');
      expect(util.concatTime(59, 60, 9)).assertEqual('596009');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0045
     * @tc.name      testExtRecTimeUtil0044
     * @tc.desc      DateTimeUtil fill/concat case 45.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(11)).assertEqual('11');
      expect(util.concatDate(2022, 9, 17)).assertEqual('2022917');
      expect(util.concatTime(60, 60, 10)).assertEqual('606010');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0046
     * @tc.name      testExtRecTimeUtil0045
     * @tc.desc      DateTimeUtil fill/concat case 46.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(59)).assertEqual('59');
      expect(util.concatDate(2023, 10, 18)).assertEqual('20231018');
      expect(util.concatTime(60, 99, 10)).assertEqual('609910');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0047
     * @tc.name      testExtRecTimeUtil0046
     * @tc.desc      DateTimeUtil fill/concat case 47.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(60)).assertEqual('60');
      expect(util.concatDate(2024, 11, 19)).assertEqual('20241119');
      expect(util.concatTime(99, 99, 10)).assertEqual('999910');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0048
     * @tc.name      testExtRecTimeUtil0047
     * @tc.desc      DateTimeUtil fill/concat case 48.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(99)).assertEqual('99');
      expect(util.concatDate(2025, 12, 20)).assertEqual('20251220');
      expect(util.concatTime(99, 99, 10)).assertEqual('999910');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0049
     * @tc.name      testExtRecTimeUtil0048
     * @tc.desc      DateTimeUtil fill/concat case 49.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(0)).assertEqual('00');
      expect(util.concatDate(2026, 1, 21)).assertEqual('2026121');
      expect(util.concatTime(0, 0, 11)).assertEqual('000011');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0050
     * @tc.name      testExtRecTimeUtil0049
     * @tc.desc      DateTimeUtil fill/concat case 50.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(1)).assertEqual('01');
      expect(util.concatDate(2020, 2, 22)).assertEqual('2020222');
      expect(util.concatTime(0, 0, 11)).assertEqual('000011');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0051
     * @tc.name      testExtRecTimeUtil0050
     * @tc.desc      DateTimeUtil fill/concat case 51.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(9)).assertEqual('09');
      expect(util.concatDate(2021, 3, 23)).assertEqual('2021323');
      expect(util.concatTime(1, 0, 11)).assertEqual('010011');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0052
     * @tc.name      testExtRecTimeUtil0051
     * @tc.desc      DateTimeUtil fill/concat case 52.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(10)).assertEqual('10');
      expect(util.concatDate(2022, 4, 24)).assertEqual('2022424');
      expect(util.concatTime(1, 1, 11)).assertEqual('010111');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0053
     * @tc.name      testExtRecTimeUtil0052
     * @tc.desc      DateTimeUtil fill/concat case 53.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(11)).assertEqual('11');
      expect(util.concatDate(2023, 5, 25)).assertEqual('2023525');
      expect(util.concatTime(9, 1, 59)).assertEqual('090159');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0054
     * @tc.name      testExtRecTimeUtil0053
     * @tc.desc      DateTimeUtil fill/concat case 54.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(59)).assertEqual('59');
      expect(util.concatDate(2024, 6, 26)).assertEqual('2024626');
      expect(util.concatTime(9, 1, 59)).assertEqual('090159');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0055
     * @tc.name      testExtRecTimeUtil0054
     * @tc.desc      DateTimeUtil fill/concat case 55.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(60)).assertEqual('60');
      expect(util.concatDate(2025, 7, 27)).assertEqual('2025727');
      expect(util.concatTime(10, 9, 59)).assertEqual('100959');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0056
     * @tc.name      testExtRecTimeUtil0055
     * @tc.desc      DateTimeUtil fill/concat case 56.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(99)).assertEqual('99');
      expect(util.concatDate(2026, 8, 28)).assertEqual('2026828');
      expect(util.concatTime(10, 9, 59)).assertEqual('100959');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0057
     * @tc.name      testExtRecTimeUtil0056
     * @tc.desc      DateTimeUtil fill/concat case 57.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(0)).assertEqual('00');
      expect(util.concatDate(2020, 9, 1)).assertEqual('202091');
      expect(util.concatTime(11, 9, 60)).assertEqual('110960');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0058
     * @tc.name      testExtRecTimeUtil0057
     * @tc.desc      DateTimeUtil fill/concat case 58.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(1)).assertEqual('01');
      expect(util.concatDate(2021, 10, 2)).assertEqual('2021102');
      expect(util.concatTime(11, 10, 60)).assertEqual('111060');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0059
     * @tc.name      testExtRecTimeUtil0058
     * @tc.desc      DateTimeUtil fill/concat case 59.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(9)).assertEqual('09');
      expect(util.concatDate(2022, 11, 3)).assertEqual('2022113');
      expect(util.concatTime(59, 10, 60)).assertEqual('591060');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0060
     * @tc.name      testExtRecTimeUtil0059
     * @tc.desc      DateTimeUtil fill/concat case 60.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(10)).assertEqual('10');
      expect(util.concatDate(2023, 12, 4)).assertEqual('2023124');
      expect(util.concatTime(59, 10, 60)).assertEqual('591060');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0061
     * @tc.name      testExtRecTimeUtil0060
     * @tc.desc      DateTimeUtil fill/concat case 61.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(11)).assertEqual('11');
      expect(util.concatDate(2024, 1, 5)).assertEqual('202415');
      expect(util.concatTime(60, 11, 99)).assertEqual('601199');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0062
     * @tc.name      testExtRecTimeUtil0061
     * @tc.desc      DateTimeUtil fill/concat case 62.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(59)).assertEqual('59');
      expect(util.concatDate(2025, 2, 6)).assertEqual('202526');
      expect(util.concatTime(60, 11, 99)).assertEqual('601199');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0063
     * @tc.name      testExtRecTimeUtil0062
     * @tc.desc      DateTimeUtil fill/concat case 63.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(60)).assertEqual('60');
      expect(util.concatDate(2026, 3, 7)).assertEqual('202637');
      expect(util.concatTime(99, 11, 99)).assertEqual('991199');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0064
     * @tc.name      testExtRecTimeUtil0063
     * @tc.desc      DateTimeUtil fill/concat case 64.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(99)).assertEqual('99');
      expect(util.concatDate(2020, 4, 8)).assertEqual('202048');
      expect(util.concatTime(99, 59, 99)).assertEqual('995999');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0065
     * @tc.name      testExtRecTimeUtil0064
     * @tc.desc      DateTimeUtil fill/concat case 65.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(0)).assertEqual('00');
      expect(util.concatDate(2021, 5, 9)).assertEqual('202159');
      expect(util.concatTime(0, 59, 0)).assertEqual('005900');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0066
     * @tc.name      testExtRecTimeUtil0065
     * @tc.desc      DateTimeUtil fill/concat case 66.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(1)).assertEqual('01');
      expect(util.concatDate(2022, 6, 10)).assertEqual('2022610');
      expect(util.concatTime(0, 59, 0)).assertEqual('005900');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0067
     * @tc.name      testExtRecTimeUtil0066
     * @tc.desc      DateTimeUtil fill/concat case 67.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(9)).assertEqual('09');
      expect(util.concatDate(2023, 7, 11)).assertEqual('2023711');
      expect(util.concatTime(1, 60, 0)).assertEqual('016000');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0068
     * @tc.name      testExtRecTimeUtil0067
     * @tc.desc      DateTimeUtil fill/concat case 68.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(10)).assertEqual('10');
      expect(util.concatDate(2024, 8, 12)).assertEqual('2024812');
      expect(util.concatTime(1, 60, 0)).assertEqual('016000');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0069
     * @tc.name      testExtRecTimeUtil0068
     * @tc.desc      DateTimeUtil fill/concat case 69.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(11)).assertEqual('11');
      expect(util.concatDate(2025, 9, 13)).assertEqual('2025913');
      expect(util.concatTime(9, 60, 1)).assertEqual('096001');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0070
     * @tc.name      testExtRecTimeUtil0069
     * @tc.desc      DateTimeUtil fill/concat case 70.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(59)).assertEqual('59');
      expect(util.concatDate(2026, 10, 14)).assertEqual('20261014');
      expect(util.concatTime(9, 99, 1)).assertEqual('099901');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0071
     * @tc.name      testExtRecTimeUtil0070
     * @tc.desc      DateTimeUtil fill/concat case 71.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(60)).assertEqual('60');
      expect(util.concatDate(2020, 11, 15)).assertEqual('20201115');
      expect(util.concatTime(10, 99, 1)).assertEqual('109901');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0072
     * @tc.name      testExtRecTimeUtil0071
     * @tc.desc      DateTimeUtil fill/concat case 72.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(99)).assertEqual('99');
      expect(util.concatDate(2021, 12, 16)).assertEqual('20211216');
      expect(util.concatTime(10, 99, 1)).assertEqual('109901');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0073
     * @tc.name      testExtRecTimeUtil0072
     * @tc.desc      DateTimeUtil fill/concat case 73.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(0)).assertEqual('00');
      expect(util.concatDate(2022, 1, 17)).assertEqual('2022117');
      expect(util.concatTime(11, 0, 9)).assertEqual('110009');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0074
     * @tc.name      testExtRecTimeUtil0073
     * @tc.desc      DateTimeUtil fill/concat case 74.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(1)).assertEqual('01');
      expect(util.concatDate(2023, 2, 18)).assertEqual('2023218');
      expect(util.concatTime(11, 0, 9)).assertEqual('110009');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0075
     * @tc.name      testExtRecTimeUtil0074
     * @tc.desc      DateTimeUtil fill/concat case 75.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(9)).assertEqual('09');
      expect(util.concatDate(2024, 3, 19)).assertEqual('2024319');
      expect(util.concatTime(59, 0, 9)).assertEqual('590009');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0076
     * @tc.name      testExtRecTimeUtil0075
     * @tc.desc      DateTimeUtil fill/concat case 76.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(10)).assertEqual('10');
      expect(util.concatDate(2025, 4, 20)).assertEqual('2025420');
      expect(util.concatTime(59, 1, 9)).assertEqual('590109');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0077
     * @tc.name      testExtRecTimeUtil0076
     * @tc.desc      DateTimeUtil fill/concat case 77.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(11)).assertEqual('11');
      expect(util.concatDate(2026, 5, 21)).assertEqual('2026521');
      expect(util.concatTime(60, 1, 10)).assertEqual('600110');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0078
     * @tc.name      testExtRecTimeUtil0077
     * @tc.desc      DateTimeUtil fill/concat case 78.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(59)).assertEqual('59');
      expect(util.concatDate(2020, 6, 22)).assertEqual('2020622');
      expect(util.concatTime(60, 1, 10)).assertEqual('600110');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0079
     * @tc.name      testExtRecTimeUtil0078
     * @tc.desc      DateTimeUtil fill/concat case 79.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(60)).assertEqual('60');
      expect(util.concatDate(2021, 7, 23)).assertEqual('2021723');
      expect(util.concatTime(99, 9, 10)).assertEqual('990910');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DATETIME_0080
     * @tc.name      testExtRecTimeUtil0079
     * @tc.desc      DateTimeUtil fill/concat case 80.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecTimeUtil0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const util: DateTimeUtil = new DateTimeUtil();
      expect(util.fill(99)).assertEqual('99');
      expect(util.concatDate(2022, 8, 24)).assertEqual('2022824');
      expect(util.concatTime(99, 9, 10)).assertEqual('990910');
      expect(util.getDate().length).assertLargerOrEqual(6);
      expect(util.getTime().length).assertEqual(6);
    })
  });
}
