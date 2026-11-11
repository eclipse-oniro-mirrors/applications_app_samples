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
import { beforeEach, describe, it as hypiumIt, expect as hypiumExpect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = '[Sample_MediaSourceTimeConvertEdge]';
const DOMAIN: number = 0xF812;

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

export default function mediaSourceTimeConvertEdgeTest(): void {
  describe('mediaSourceTimeConvertEdgeTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0001
     * @tc.name      testExtTimeConvert0001
     * @tc.desc      0ms formats as 0:00.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 0;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(0);
      expect(second).assertEqual('00');
      expect(text).assertEqual('0:00');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0002
     * @tc.name      testExtTimeConvert0002
     * @tc.desc      1ms formats as 0:00.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 1;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(0);
      expect(second).assertEqual('00');
      expect(text).assertEqual('0:00');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0003
     * @tc.name      testExtTimeConvert0003
     * @tc.desc      999ms formats as 0:01.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 999;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(0);
      expect(second).assertEqual('01');
      expect(text).assertEqual('0:01');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0004
     * @tc.name      testExtTimeConvert0004
     * @tc.desc      1000ms formats as 0:01.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 1000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(0);
      expect(second).assertEqual('01');
      expect(text).assertEqual('0:01');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0005
     * @tc.name      testExtTimeConvert0005
     * @tc.desc      1050ms formats as 0:01.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 1050;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(0);
      expect(second).assertEqual('01');
      expect(text).assertEqual('0:01');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0006
     * @tc.name      testExtTimeConvert0006
     * @tc.desc      59999ms formats as 0:60.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 59999;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(0);
      expect(second).assertEqual('60');
      expect(text).assertEqual('0:60');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0007
     * @tc.name      testExtTimeConvert0007
     * @tc.desc      60000ms formats as 1:00.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 60000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(1);
      expect(second).assertEqual('00');
      expect(text).assertEqual('1:00');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0008
     * @tc.name      testExtTimeConvert0008
     * @tc.desc      61000ms formats as 1:01.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 61000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(1);
      expect(second).assertEqual('01');
      expect(text).assertEqual('1:01');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0009
     * @tc.name      testExtTimeConvert0009
     * @tc.desc      119000ms formats as 1:59.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 119000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(1);
      expect(second).assertEqual('59');
      expect(text).assertEqual('1:59');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0010
     * @tc.name      testExtTimeConvert0010
     * @tc.desc      120000ms formats as 2:00.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 120000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(2);
      expect(second).assertEqual('00');
      expect(text).assertEqual('2:00');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0011
     * @tc.name      testExtTimeConvert0011
     * @tc.desc      3599000ms formats as 59:59.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 3599000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(59);
      expect(second).assertEqual('59');
      expect(text).assertEqual('59:59');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0012
     * @tc.name      testExtTimeConvert0012
     * @tc.desc      3600000ms formats as 60:00.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 3600000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(60);
      expect(second).assertEqual('00');
      expect(text).assertEqual('60:00');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0013
     * @tc.name      testExtTimeConvert0013
     * @tc.desc      756000ms formats as 12:36.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 756000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(12);
      expect(second).assertEqual('36');
      expect(text).assertEqual('12:36');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0014
     * @tc.name      testExtTimeConvert0014
     * @tc.desc      829000ms formats as 13:49.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 829000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(13);
      expect(second).assertEqual('49');
      expect(text).assertEqual('13:49');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0015
     * @tc.name      testExtTimeConvert0015
     * @tc.desc      842000ms formats as 14:02.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 842000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(14);
      expect(second).assertEqual('02');
      expect(text).assertEqual('14:02');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0016
     * @tc.name      testExtTimeConvert0016
     * @tc.desc      915000ms formats as 15:15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 915000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(15);
      expect(second).assertEqual('15');
      expect(text).assertEqual('15:15');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0017
     * @tc.name      testExtTimeConvert0017
     * @tc.desc      988000ms formats as 16:28.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 988000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(16);
      expect(second).assertEqual('28');
      expect(text).assertEqual('16:28');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0018
     * @tc.name      testExtTimeConvert0018
     * @tc.desc      1061000ms formats as 17:41.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 1061000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(17);
      expect(second).assertEqual('41');
      expect(text).assertEqual('17:41');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0019
     * @tc.name      testExtTimeConvert0019
     * @tc.desc      1134000ms formats as 18:54.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 1134000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(18);
      expect(second).assertEqual('54');
      expect(text).assertEqual('18:54');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0020
     * @tc.name      testExtTimeConvert0020
     * @tc.desc      1147000ms formats as 19:07.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 1147000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(19);
      expect(second).assertEqual('07');
      expect(text).assertEqual('19:07');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0021
     * @tc.name      testExtTimeConvert0021
     * @tc.desc      1220000ms formats as 20:20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 1220000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(20);
      expect(second).assertEqual('20');
      expect(text).assertEqual('20:20');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0022
     * @tc.name      testExtTimeConvert0022
     * @tc.desc      1293000ms formats as 21:33.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 1293000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(21);
      expect(second).assertEqual('33');
      expect(text).assertEqual('21:33');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0023
     * @tc.name      testExtTimeConvert0023
     * @tc.desc      1366000ms formats as 22:46.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 1366000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(22);
      expect(second).assertEqual('46');
      expect(text).assertEqual('22:46');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0024
     * @tc.name      testExtTimeConvert0024
     * @tc.desc      1439000ms formats as 23:59.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 1439000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(23);
      expect(second).assertEqual('59');
      expect(text).assertEqual('23:59');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0025
     * @tc.name      testExtTimeConvert0025
     * @tc.desc      1452000ms formats as 24:12.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 1452000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(24);
      expect(second).assertEqual('12');
      expect(text).assertEqual('24:12');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0026
     * @tc.name      testExtTimeConvert0026
     * @tc.desc      1525000ms formats as 25:25.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 1525000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(25);
      expect(second).assertEqual('25');
      expect(text).assertEqual('25:25');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0027
     * @tc.name      testExtTimeConvert0027
     * @tc.desc      1598000ms formats as 26:38.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 1598000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(26);
      expect(second).assertEqual('38');
      expect(text).assertEqual('26:38');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0028
     * @tc.name      testExtTimeConvert0028
     * @tc.desc      1671000ms formats as 27:51.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 1671000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(27);
      expect(second).assertEqual('51');
      expect(text).assertEqual('27:51');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0029
     * @tc.name      testExtTimeConvert0029
     * @tc.desc      1684000ms formats as 28:04.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 1684000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(28);
      expect(second).assertEqual('04');
      expect(text).assertEqual('28:04');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0030
     * @tc.name      testExtTimeConvert0030
     * @tc.desc      1757000ms formats as 29:17.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 1757000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(29);
      expect(second).assertEqual('17');
      expect(text).assertEqual('29:17');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0031
     * @tc.name      testExtTimeConvert0031
     * @tc.desc      1830000ms formats as 30:30.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 1830000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(30);
      expect(second).assertEqual('30');
      expect(text).assertEqual('30:30');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0032
     * @tc.name      testExtTimeConvert0032
     * @tc.desc      1903000ms formats as 31:43.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 1903000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(31);
      expect(second).assertEqual('43');
      expect(text).assertEqual('31:43');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0033
     * @tc.name      testExtTimeConvert0033
     * @tc.desc      1976000ms formats as 32:56.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 1976000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(32);
      expect(second).assertEqual('56');
      expect(text).assertEqual('32:56');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0034
     * @tc.name      testExtTimeConvert0034
     * @tc.desc      1989000ms formats as 33:09.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 1989000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(33);
      expect(second).assertEqual('09');
      expect(text).assertEqual('33:09');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0035
     * @tc.name      testExtTimeConvert0035
     * @tc.desc      2062000ms formats as 34:22.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 2062000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(34);
      expect(second).assertEqual('22');
      expect(text).assertEqual('34:22');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0036
     * @tc.name      testExtTimeConvert0036
     * @tc.desc      2135000ms formats as 35:35.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 2135000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(35);
      expect(second).assertEqual('35');
      expect(text).assertEqual('35:35');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0037
     * @tc.name      testExtTimeConvert0037
     * @tc.desc      2208000ms formats as 36:48.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 2208000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(36);
      expect(second).assertEqual('48');
      expect(text).assertEqual('36:48');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0038
     * @tc.name      testExtTimeConvert0038
     * @tc.desc      2221000ms formats as 37:01.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 2221000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(37);
      expect(second).assertEqual('01');
      expect(text).assertEqual('37:01');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0039
     * @tc.name      testExtTimeConvert0039
     * @tc.desc      2294000ms formats as 38:14.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 2294000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(38);
      expect(second).assertEqual('14');
      expect(text).assertEqual('38:14');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0040
     * @tc.name      testExtTimeConvert0040
     * @tc.desc      2367000ms formats as 39:27.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 2367000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(39);
      expect(second).assertEqual('27');
      expect(text).assertEqual('39:27');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0041
     * @tc.name      testExtTimeConvert0041
     * @tc.desc      2440000ms formats as 40:40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 2440000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(40);
      expect(second).assertEqual('40');
      expect(text).assertEqual('40:40');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0042
     * @tc.name      testExtTimeConvert0042
     * @tc.desc      2513000ms formats as 41:53.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 2513000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(41);
      expect(second).assertEqual('53');
      expect(text).assertEqual('41:53');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0043
     * @tc.name      testExtTimeConvert0043
     * @tc.desc      2526000ms formats as 42:06.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 2526000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(42);
      expect(second).assertEqual('06');
      expect(text).assertEqual('42:06');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0044
     * @tc.name      testExtTimeConvert0044
     * @tc.desc      2599000ms formats as 43:19.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 2599000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(43);
      expect(second).assertEqual('19');
      expect(text).assertEqual('43:19');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0045
     * @tc.name      testExtTimeConvert0045
     * @tc.desc      2672000ms formats as 44:32.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 2672000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(44);
      expect(second).assertEqual('32');
      expect(text).assertEqual('44:32');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0046
     * @tc.name      testExtTimeConvert0046
     * @tc.desc      2745000ms formats as 45:45.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 2745000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(45);
      expect(second).assertEqual('45');
      expect(text).assertEqual('45:45');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0047
     * @tc.name      testExtTimeConvert0047
     * @tc.desc      2818000ms formats as 46:58.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 2818000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(46);
      expect(second).assertEqual('58');
      expect(text).assertEqual('46:58');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0048
     * @tc.name      testExtTimeConvert0048
     * @tc.desc      2831000ms formats as 47:11.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 2831000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(47);
      expect(second).assertEqual('11');
      expect(text).assertEqual('47:11');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0049
     * @tc.name      testExtTimeConvert0049
     * @tc.desc      2904000ms formats as 48:24.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 2904000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(48);
      expect(second).assertEqual('24');
      expect(text).assertEqual('48:24');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0050
     * @tc.name      testExtTimeConvert0050
     * @tc.desc      2977000ms formats as 49:37.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 2977000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(49);
      expect(second).assertEqual('37');
      expect(text).assertEqual('49:37');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0051
     * @tc.name      testExtTimeConvert0051
     * @tc.desc      3050000ms formats as 50:50.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 3050000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(50);
      expect(second).assertEqual('50');
      expect(text).assertEqual('50:50');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0052
     * @tc.name      testExtTimeConvert0052
     * @tc.desc      3063000ms formats as 51:03.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 3063000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(51);
      expect(second).assertEqual('03');
      expect(text).assertEqual('51:03');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0053
     * @tc.name      testExtTimeConvert0053
     * @tc.desc      3136000ms formats as 52:16.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 3136000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(52);
      expect(second).assertEqual('16');
      expect(text).assertEqual('52:16');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0054
     * @tc.name      testExtTimeConvert0054
     * @tc.desc      3209000ms formats as 53:29.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 3209000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(53);
      expect(second).assertEqual('29');
      expect(text).assertEqual('53:29');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0055
     * @tc.name      testExtTimeConvert0055
     * @tc.desc      3282000ms formats as 54:42.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 3282000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(54);
      expect(second).assertEqual('42');
      expect(text).assertEqual('54:42');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0056
     * @tc.name      testExtTimeConvert0056
     * @tc.desc      3355000ms formats as 55:55.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 3355000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(55);
      expect(second).assertEqual('55');
      expect(text).assertEqual('55:55');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0057
     * @tc.name      testExtTimeConvert0057
     * @tc.desc      3368000ms formats as 56:08.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 3368000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(56);
      expect(second).assertEqual('08');
      expect(text).assertEqual('56:08');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0058
     * @tc.name      testExtTimeConvert0058
     * @tc.desc      3441000ms formats as 57:21.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 3441000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(57);
      expect(second).assertEqual('21');
      expect(text).assertEqual('57:21');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0059
     * @tc.name      testExtTimeConvert0059
     * @tc.desc      3514000ms formats as 58:34.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 3514000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(58);
      expect(second).assertEqual('34');
      expect(text).assertEqual('58:34');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0060
     * @tc.name      testExtTimeConvert0060
     * @tc.desc      3587000ms formats as 59:47.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 3587000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(59);
      expect(second).assertEqual('47');
      expect(text).assertEqual('59:47');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0061
     * @tc.name      testExtTimeConvert0061
     * @tc.desc      3600000ms formats as 60:00.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 3600000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(60);
      expect(second).assertEqual('00');
      expect(text).assertEqual('60:00');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0062
     * @tc.name      testExtTimeConvert0062
     * @tc.desc      3673000ms formats as 61:13.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 3673000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(61);
      expect(second).assertEqual('13');
      expect(text).assertEqual('61:13');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0063
     * @tc.name      testExtTimeConvert0063
     * @tc.desc      3746000ms formats as 62:26.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 3746000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(62);
      expect(second).assertEqual('26');
      expect(text).assertEqual('62:26');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0064
     * @tc.name      testExtTimeConvert0064
     * @tc.desc      3819000ms formats as 63:39.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 3819000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(63);
      expect(second).assertEqual('39');
      expect(text).assertEqual('63:39');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0065
     * @tc.name      testExtTimeConvert0065
     * @tc.desc      3892000ms formats as 64:52.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 3892000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(64);
      expect(second).assertEqual('52');
      expect(text).assertEqual('64:52');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0066
     * @tc.name      testExtTimeConvert0066
     * @tc.desc      3905000ms formats as 65:05.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 3905000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(65);
      expect(second).assertEqual('05');
      expect(text).assertEqual('65:05');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0067
     * @tc.name      testExtTimeConvert0067
     * @tc.desc      3978000ms formats as 66:18.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 3978000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(66);
      expect(second).assertEqual('18');
      expect(text).assertEqual('66:18');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0068
     * @tc.name      testExtTimeConvert0068
     * @tc.desc      4051000ms formats as 67:31.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 4051000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(67);
      expect(second).assertEqual('31');
      expect(text).assertEqual('67:31');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0069
     * @tc.name      testExtTimeConvert0069
     * @tc.desc      4124000ms formats as 68:44.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 4124000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(68);
      expect(second).assertEqual('44');
      expect(text).assertEqual('68:44');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0070
     * @tc.name      testExtTimeConvert0070
     * @tc.desc      4197000ms formats as 69:57.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 4197000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(69);
      expect(second).assertEqual('57');
      expect(text).assertEqual('69:57');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0071
     * @tc.name      testExtTimeConvert0071
     * @tc.desc      4210000ms formats as 70:10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 4210000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(70);
      expect(second).assertEqual('10');
      expect(text).assertEqual('70:10');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0072
     * @tc.name      testExtTimeConvert0072
     * @tc.desc      4283000ms formats as 71:23.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 4283000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(71);
      expect(second).assertEqual('23');
      expect(text).assertEqual('71:23');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0073
     * @tc.name      testExtTimeConvert0073
     * @tc.desc      4356000ms formats as 72:36.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 4356000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(72);
      expect(second).assertEqual('36');
      expect(text).assertEqual('72:36');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0074
     * @tc.name      testExtTimeConvert0074
     * @tc.desc      4429000ms formats as 73:49.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 4429000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(73);
      expect(second).assertEqual('49');
      expect(text).assertEqual('73:49');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0075
     * @tc.name      testExtTimeConvert0075
     * @tc.desc      4442000ms formats as 74:02.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 4442000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(74);
      expect(second).assertEqual('02');
      expect(text).assertEqual('74:02');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0076
     * @tc.name      testExtTimeConvert0076
     * @tc.desc      4515000ms formats as 75:15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 4515000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(75);
      expect(second).assertEqual('15');
      expect(text).assertEqual('75:15');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0077
     * @tc.name      testExtTimeConvert0077
     * @tc.desc      4588000ms formats as 76:28.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 4588000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(76);
      expect(second).assertEqual('28');
      expect(text).assertEqual('76:28');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0078
     * @tc.name      testExtTimeConvert0078
     * @tc.desc      4661000ms formats as 77:41.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 4661000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(77);
      expect(second).assertEqual('41');
      expect(text).assertEqual('77:41');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0079
     * @tc.name      testExtTimeConvert0079
     * @tc.desc      4734000ms formats as 78:54.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 4734000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(78);
      expect(second).assertEqual('54');
      expect(text).assertEqual('78:54');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_TIME_0080
     * @tc.name      testExtTimeConvert0080
     * @tc.desc      4747000ms formats as 79:07.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtTimeConvert0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const time: number = 4747000;
      const min: number = Math.floor(time / 60000);
      let second: string = ((time % 60000) / 1000).toFixed(0);
      second = second.padStart(2, '0');
      const text: string = `${min}:${second}`;
      expect(min).assertEqual(79);
      expect(second).assertEqual('07');
      expect(text).assertEqual('79:07');
      expect(min).assertLargerOrEqual(0);
      expect(second.length).assertEqual(2);
    })
  });
}
