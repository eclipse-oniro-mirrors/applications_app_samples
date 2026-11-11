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

const TAG: string = '[Sample_MediaSourceTimeCore]';
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

export default function mediaSourceTimeCoreTest(): void {
  describe('mediaSourceTimeCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0001
     * @tc.name      testSafeTime0001
     * @tc.desc      0ms formats as 0:00.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 0;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('0');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0002
     * @tc.name      testSafeTime0002
     * @tc.desc      1000ms formats as 0:01.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 1000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('1');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0003
     * @tc.name      testSafeTime0003
     * @tc.desc      2000ms formats as 0:02.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 2000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('2');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0004
     * @tc.name      testSafeTime0004
     * @tc.desc      3000ms formats as 0:03.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 3000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('3');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0005
     * @tc.name      testSafeTime0005
     * @tc.desc      4000ms formats as 0:04.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 4000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('4');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0006
     * @tc.name      testSafeTime0006
     * @tc.desc      5000ms formats as 0:05.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 5000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('5');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0007
     * @tc.name      testSafeTime0007
     * @tc.desc      6000ms formats as 0:06.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 6000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('6');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0008
     * @tc.name      testSafeTime0008
     * @tc.desc      7000ms formats as 0:07.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 7000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('7');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0009
     * @tc.name      testSafeTime0009
     * @tc.desc      8000ms formats as 0:08.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 8000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('8');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0010
     * @tc.name      testSafeTime0010
     * @tc.desc      9000ms formats as 0:09.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 9000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('9');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0011
     * @tc.name      testSafeTime0011
     * @tc.desc      10000ms formats as 0:10.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 10000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('10');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0012
     * @tc.name      testSafeTime0012
     * @tc.desc      11000ms formats as 0:11.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 11000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('11');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0013
     * @tc.name      testSafeTime0013
     * @tc.desc      12000ms formats as 0:12.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 12000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('12');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0014
     * @tc.name      testSafeTime0014
     * @tc.desc      13000ms formats as 0:13.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 13000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('13');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0015
     * @tc.name      testSafeTime0015
     * @tc.desc      14000ms formats as 0:14.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 14000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('14');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0016
     * @tc.name      testSafeTime0016
     * @tc.desc      15000ms formats as 0:15.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 15000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('15');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0017
     * @tc.name      testSafeTime0017
     * @tc.desc      16000ms formats as 0:16.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 16000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('16');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0018
     * @tc.name      testSafeTime0018
     * @tc.desc      17000ms formats as 0:17.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 17000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('17');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0019
     * @tc.name      testSafeTime0019
     * @tc.desc      18000ms formats as 0:18.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 18000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('18');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0020
     * @tc.name      testSafeTime0020
     * @tc.desc      19000ms formats as 0:19.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 19000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('19');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0021
     * @tc.name      testSafeTime0021
     * @tc.desc      20000ms formats as 0:20.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 20000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('20');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0022
     * @tc.name      testSafeTime0022
     * @tc.desc      21000ms formats as 0:21.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 21000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('21');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0023
     * @tc.name      testSafeTime0023
     * @tc.desc      22000ms formats as 0:22.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 22000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('22');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0024
     * @tc.name      testSafeTime0024
     * @tc.desc      23000ms formats as 0:23.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 23000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('23');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0025
     * @tc.name      testSafeTime0025
     * @tc.desc      24000ms formats as 0:24.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 24000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('24');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0026
     * @tc.name      testSafeTime0026
     * @tc.desc      25000ms formats as 0:25.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 25000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('25');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0027
     * @tc.name      testSafeTime0027
     * @tc.desc      26000ms formats as 0:26.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 26000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('26');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0028
     * @tc.name      testSafeTime0028
     * @tc.desc      27000ms formats as 0:27.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 27000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('27');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0029
     * @tc.name      testSafeTime0029
     * @tc.desc      28000ms formats as 0:28.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 28000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('28');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0030
     * @tc.name      testSafeTime0030
     * @tc.desc      29000ms formats as 0:29.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 29000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('29');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0031
     * @tc.name      testSafeTime0031
     * @tc.desc      30000ms formats as 0:30.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 30000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('30');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0032
     * @tc.name      testSafeTime0032
     * @tc.desc      31000ms formats as 0:31.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 31000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('31');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0033
     * @tc.name      testSafeTime0033
     * @tc.desc      32000ms formats as 0:32.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 32000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('32');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0034
     * @tc.name      testSafeTime0034
     * @tc.desc      33000ms formats as 0:33.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 33000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('33');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0035
     * @tc.name      testSafeTime0035
     * @tc.desc      34000ms formats as 0:34.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 34000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('34');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0036
     * @tc.name      testSafeTime0036
     * @tc.desc      35000ms formats as 0:35.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 35000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('35');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0037
     * @tc.name      testSafeTime0037
     * @tc.desc      36000ms formats as 0:36.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 36000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('36');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0038
     * @tc.name      testSafeTime0038
     * @tc.desc      37000ms formats as 0:37.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 37000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('37');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0039
     * @tc.name      testSafeTime0039
     * @tc.desc      38000ms formats as 0:38.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 38000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('38');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0040
     * @tc.name      testSafeTime0040
     * @tc.desc      39000ms formats as 0:39.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 39000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('39');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0041
     * @tc.name      testSafeTime0041
     * @tc.desc      40000ms formats as 0:40.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 40000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('40');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0042
     * @tc.name      testSafeTime0042
     * @tc.desc      41000ms formats as 0:41.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 41000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('41');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0043
     * @tc.name      testSafeTime0043
     * @tc.desc      42000ms formats as 0:42.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 42000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('42');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0044
     * @tc.name      testSafeTime0044
     * @tc.desc      43000ms formats as 0:43.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 43000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('43');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0045
     * @tc.name      testSafeTime0045
     * @tc.desc      44000ms formats as 0:44.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 44000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('44');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0046
     * @tc.name      testSafeTime0046
     * @tc.desc      45000ms formats as 0:45.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 45000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('45');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0047
     * @tc.name      testSafeTime0047
     * @tc.desc      46000ms formats as 0:46.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 46000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('46');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0048
     * @tc.name      testSafeTime0048
     * @tc.desc      47000ms formats as 0:47.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 47000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('47');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0049
     * @tc.name      testSafeTime0049
     * @tc.desc      48000ms formats as 0:48.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 48000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('48');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0050
     * @tc.name      testSafeTime0050
     * @tc.desc      49000ms formats as 0:49.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 49000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('49');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0051
     * @tc.name      testSafeTime0051
     * @tc.desc      50000ms formats as 0:50.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 50000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('50');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0052
     * @tc.name      testSafeTime0052
     * @tc.desc      51000ms formats as 0:51.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 51000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('51');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0053
     * @tc.name      testSafeTime0053
     * @tc.desc      52000ms formats as 0:52.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 52000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('52');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0054
     * @tc.name      testSafeTime0054
     * @tc.desc      53000ms formats as 0:53.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 53000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('53');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0055
     * @tc.name      testSafeTime0055
     * @tc.desc      54000ms formats as 0:54.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 54000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('54');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0056
     * @tc.name      testSafeTime0056
     * @tc.desc      55000ms formats as 0:55.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 55000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('55');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0057
     * @tc.name      testSafeTime0057
     * @tc.desc      56000ms formats as 0:56.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 56000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('56');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0058
     * @tc.name      testSafeTime0058
     * @tc.desc      57000ms formats as 0:57.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 57000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('57');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0059
     * @tc.name      testSafeTime0059
     * @tc.desc      58000ms formats as 0:58.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 58000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('58');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0060
     * @tc.name      testSafeTime0060
     * @tc.desc      59000ms formats as 0:59.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 59000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(0);
      expect(seconds).assertEqual('59');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0061
     * @tc.name      testSafeTime0061
     * @tc.desc      60000ms formats as 1:00.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 60000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual('0');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0062
     * @tc.name      testSafeTime0062
     * @tc.desc      61000ms formats as 1:01.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 61000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual('1');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0063
     * @tc.name      testSafeTime0063
     * @tc.desc      62000ms formats as 1:02.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 62000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual('2');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0064
     * @tc.name      testSafeTime0064
     * @tc.desc      63000ms formats as 1:03.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 63000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual('3');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0065
     * @tc.name      testSafeTime0065
     * @tc.desc      64000ms formats as 1:04.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 64000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual('4');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0066
     * @tc.name      testSafeTime0066
     * @tc.desc      65000ms formats as 1:05.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 65000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual('5');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0067
     * @tc.name      testSafeTime0067
     * @tc.desc      66000ms formats as 1:06.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 66000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual('6');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0068
     * @tc.name      testSafeTime0068
     * @tc.desc      67000ms formats as 1:07.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 67000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual('7');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0069
     * @tc.name      testSafeTime0069
     * @tc.desc      68000ms formats as 1:08.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 68000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual('8');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0070
     * @tc.name      testSafeTime0070
     * @tc.desc      69000ms formats as 1:09.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 69000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual('9');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0071
     * @tc.name      testSafeTime0071
     * @tc.desc      70000ms formats as 1:10.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 70000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual('10');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0072
     * @tc.name      testSafeTime0072
     * @tc.desc      71000ms formats as 1:11.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 71000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual('11');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0073
     * @tc.name      testSafeTime0073
     * @tc.desc      72000ms formats as 1:12.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 72000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual('12');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0074
     * @tc.name      testSafeTime0074
     * @tc.desc      73000ms formats as 1:13.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 73000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual('13');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0075
     * @tc.name      testSafeTime0075
     * @tc.desc      74000ms formats as 1:14.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 74000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual('14');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0076
     * @tc.name      testSafeTime0076
     * @tc.desc      75000ms formats as 1:15.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 75000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual('15');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0077
     * @tc.name      testSafeTime0077
     * @tc.desc      76000ms formats as 1:16.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 76000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual('16');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0078
     * @tc.name      testSafeTime0078
     * @tc.desc      77000ms formats as 1:17.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 77000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual('17');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0079
     * @tc.name      testSafeTime0079
     * @tc.desc      78000ms formats as 1:18.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 78000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual('18');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0080
     * @tc.name      testSafeTime0080
     * @tc.desc      79000ms formats as 1:19.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 79000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual('19');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0081
     * @tc.name      testSafeTime0081
     * @tc.desc      80000ms formats as 1:20.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 80000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual('20');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0082
     * @tc.name      testSafeTime0082
     * @tc.desc      81000ms formats as 1:21.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 81000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual('21');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0083
     * @tc.name      testSafeTime0083
     * @tc.desc      82000ms formats as 1:22.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 82000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual('22');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0084
     * @tc.name      testSafeTime0084
     * @tc.desc      83000ms formats as 1:23.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 83000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual('23');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0085
     * @tc.name      testSafeTime0085
     * @tc.desc      84000ms formats as 1:24.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 84000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual('24');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0086
     * @tc.name      testSafeTime0086
     * @tc.desc      85000ms formats as 1:25.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 85000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual('25');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0087
     * @tc.name      testSafeTime0087
     * @tc.desc      86000ms formats as 1:26.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 86000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual('26');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0088
     * @tc.name      testSafeTime0088
     * @tc.desc      87000ms formats as 1:27.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 87000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual('27');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0089
     * @tc.name      testSafeTime0089
     * @tc.desc      88000ms formats as 1:28.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 88000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual('28');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0090
     * @tc.name      testSafeTime0090
     * @tc.desc      89000ms formats as 1:29.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 89000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual('29');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0091
     * @tc.name      testSafeTime0091
     * @tc.desc      90000ms formats as 1:30.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 90000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual('30');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0092
     * @tc.name      testSafeTime0092
     * @tc.desc      91000ms formats as 1:31.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 91000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual('31');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0093
     * @tc.name      testSafeTime0093
     * @tc.desc      92000ms formats as 1:32.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 92000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual('32');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0094
     * @tc.name      testSafeTime0094
     * @tc.desc      93000ms formats as 1:33.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 93000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual('33');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0095
     * @tc.name      testSafeTime0095
     * @tc.desc      94000ms formats as 1:34.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 94000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual('34');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0096
     * @tc.name      testSafeTime0096
     * @tc.desc      95000ms formats as 1:35.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 95000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual('35');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0097
     * @tc.name      testSafeTime0097
     * @tc.desc      96000ms formats as 1:36.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 96000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual('36');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0098
     * @tc.name      testSafeTime0098
     * @tc.desc      97000ms formats as 1:37.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 97000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual('37');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0099
     * @tc.name      testSafeTime0099
     * @tc.desc      98000ms formats as 1:38.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 98000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual('38');
      expect(ms).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_SAFE_TIME_0100
     * @tc.name      testSafeTime0100
     * @tc.desc      99000ms formats as 1:39.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeTime0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ms: number = 99000;
      const minutes: number = Math.floor(ms / 60000);
      const seconds: string = ((ms % 60000) / 1000).toFixed(0);
      expect(minutes).assertEqual(1);
      expect(seconds).assertEqual('39');
      expect(ms).assertLargerOrEqual(0);
    })
  })
}
