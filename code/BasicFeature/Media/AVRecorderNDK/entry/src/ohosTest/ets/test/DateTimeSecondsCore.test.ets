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

const TAG: string = '[Sample_dateTimeSecondsCore]';
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
export default function dateTimeSecondsCoreTest(): void {
  describe('dateTimeSecondsCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_0100
     * @tc.name      testDateTimeSeconds0001
     * @tc.desc      Verify dateTimeSecondsCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 0;
      expect(dateTime(t)).assertEqual('00:00');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_0200
     * @tc.name      testDateTimeSeconds0002
     * @tc.desc      Verify dateTimeSecondsCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 1;
      expect(dateTime(t)).assertEqual('00:01');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_0300
     * @tc.name      testDateTimeSeconds0003
     * @tc.desc      Verify dateTimeSecondsCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 2;
      expect(dateTime(t)).assertEqual('00:02');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_0400
     * @tc.name      testDateTimeSeconds0004
     * @tc.desc      Verify dateTimeSecondsCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 3;
      expect(dateTime(t)).assertEqual('00:03');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_0500
     * @tc.name      testDateTimeSeconds0005
     * @tc.desc      Verify dateTimeSecondsCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 4;
      expect(dateTime(t)).assertEqual('00:04');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_0600
     * @tc.name      testDateTimeSeconds0006
     * @tc.desc      Verify dateTimeSecondsCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 5;
      expect(dateTime(t)).assertEqual('00:05');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_0700
     * @tc.name      testDateTimeSeconds0007
     * @tc.desc      Verify dateTimeSecondsCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 6;
      expect(dateTime(t)).assertEqual('00:06');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_0800
     * @tc.name      testDateTimeSeconds0008
     * @tc.desc      Verify dateTimeSecondsCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 7;
      expect(dateTime(t)).assertEqual('00:07');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_0900
     * @tc.name      testDateTimeSeconds0009
     * @tc.desc      Verify dateTimeSecondsCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 8;
      expect(dateTime(t)).assertEqual('00:08');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_1000
     * @tc.name      testDateTimeSeconds0010
     * @tc.desc      Verify dateTimeSecondsCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 9;
      expect(dateTime(t)).assertEqual('00:09');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_1100
     * @tc.name      testDateTimeSeconds0011
     * @tc.desc      Verify dateTimeSecondsCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 10;
      expect(dateTime(t)).assertEqual('00:10');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_1200
     * @tc.name      testDateTimeSeconds0012
     * @tc.desc      Verify dateTimeSecondsCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 11;
      expect(dateTime(t)).assertEqual('00:11');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_1300
     * @tc.name      testDateTimeSeconds0013
     * @tc.desc      Verify dateTimeSecondsCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 12;
      expect(dateTime(t)).assertEqual('00:12');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_1400
     * @tc.name      testDateTimeSeconds0014
     * @tc.desc      Verify dateTimeSecondsCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 13;
      expect(dateTime(t)).assertEqual('00:13');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_1500
     * @tc.name      testDateTimeSeconds0015
     * @tc.desc      Verify dateTimeSecondsCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 14;
      expect(dateTime(t)).assertEqual('00:14');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_1600
     * @tc.name      testDateTimeSeconds0016
     * @tc.desc      Verify dateTimeSecondsCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 15;
      expect(dateTime(t)).assertEqual('00:15');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_1700
     * @tc.name      testDateTimeSeconds0017
     * @tc.desc      Verify dateTimeSecondsCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 16;
      expect(dateTime(t)).assertEqual('00:16');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_1800
     * @tc.name      testDateTimeSeconds0018
     * @tc.desc      Verify dateTimeSecondsCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 17;
      expect(dateTime(t)).assertEqual('00:17');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_1900
     * @tc.name      testDateTimeSeconds0019
     * @tc.desc      Verify dateTimeSecondsCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 18;
      expect(dateTime(t)).assertEqual('00:18');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_2000
     * @tc.name      testDateTimeSeconds0020
     * @tc.desc      Verify dateTimeSecondsCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 19;
      expect(dateTime(t)).assertEqual('00:19');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_2100
     * @tc.name      testDateTimeSeconds0021
     * @tc.desc      Verify dateTimeSecondsCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 20;
      expect(dateTime(t)).assertEqual('00:20');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_2200
     * @tc.name      testDateTimeSeconds0022
     * @tc.desc      Verify dateTimeSecondsCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 21;
      expect(dateTime(t)).assertEqual('00:21');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_2300
     * @tc.name      testDateTimeSeconds0023
     * @tc.desc      Verify dateTimeSecondsCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 22;
      expect(dateTime(t)).assertEqual('00:22');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_2400
     * @tc.name      testDateTimeSeconds0024
     * @tc.desc      Verify dateTimeSecondsCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 23;
      expect(dateTime(t)).assertEqual('00:23');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_2500
     * @tc.name      testDateTimeSeconds0025
     * @tc.desc      Verify dateTimeSecondsCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 24;
      expect(dateTime(t)).assertEqual('00:24');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_2600
     * @tc.name      testDateTimeSeconds0026
     * @tc.desc      Verify dateTimeSecondsCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 25;
      expect(dateTime(t)).assertEqual('00:25');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_2700
     * @tc.name      testDateTimeSeconds0027
     * @tc.desc      Verify dateTimeSecondsCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 26;
      expect(dateTime(t)).assertEqual('00:26');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_2800
     * @tc.name      testDateTimeSeconds0028
     * @tc.desc      Verify dateTimeSecondsCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 27;
      expect(dateTime(t)).assertEqual('00:27');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_2900
     * @tc.name      testDateTimeSeconds0029
     * @tc.desc      Verify dateTimeSecondsCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 28;
      expect(dateTime(t)).assertEqual('00:28');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_3000
     * @tc.name      testDateTimeSeconds0030
     * @tc.desc      Verify dateTimeSecondsCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 29;
      expect(dateTime(t)).assertEqual('00:29');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_3100
     * @tc.name      testDateTimeSeconds0031
     * @tc.desc      Verify dateTimeSecondsCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 30;
      expect(dateTime(t)).assertEqual('00:30');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_3200
     * @tc.name      testDateTimeSeconds0032
     * @tc.desc      Verify dateTimeSecondsCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 31;
      expect(dateTime(t)).assertEqual('00:31');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_3300
     * @tc.name      testDateTimeSeconds0033
     * @tc.desc      Verify dateTimeSecondsCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 32;
      expect(dateTime(t)).assertEqual('00:32');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_3400
     * @tc.name      testDateTimeSeconds0034
     * @tc.desc      Verify dateTimeSecondsCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 33;
      expect(dateTime(t)).assertEqual('00:33');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_3500
     * @tc.name      testDateTimeSeconds0035
     * @tc.desc      Verify dateTimeSecondsCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 34;
      expect(dateTime(t)).assertEqual('00:34');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_3600
     * @tc.name      testDateTimeSeconds0036
     * @tc.desc      Verify dateTimeSecondsCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 35;
      expect(dateTime(t)).assertEqual('00:35');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_3700
     * @tc.name      testDateTimeSeconds0037
     * @tc.desc      Verify dateTimeSecondsCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 36;
      expect(dateTime(t)).assertEqual('00:36');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_3800
     * @tc.name      testDateTimeSeconds0038
     * @tc.desc      Verify dateTimeSecondsCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 37;
      expect(dateTime(t)).assertEqual('00:37');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_3900
     * @tc.name      testDateTimeSeconds0039
     * @tc.desc      Verify dateTimeSecondsCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 38;
      expect(dateTime(t)).assertEqual('00:38');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_4000
     * @tc.name      testDateTimeSeconds0040
     * @tc.desc      Verify dateTimeSecondsCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 39;
      expect(dateTime(t)).assertEqual('00:39');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_4100
     * @tc.name      testDateTimeSeconds0041
     * @tc.desc      Verify dateTimeSecondsCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 40;
      expect(dateTime(t)).assertEqual('00:40');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_4200
     * @tc.name      testDateTimeSeconds0042
     * @tc.desc      Verify dateTimeSecondsCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 41;
      expect(dateTime(t)).assertEqual('00:41');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_4300
     * @tc.name      testDateTimeSeconds0043
     * @tc.desc      Verify dateTimeSecondsCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 42;
      expect(dateTime(t)).assertEqual('00:42');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_4400
     * @tc.name      testDateTimeSeconds0044
     * @tc.desc      Verify dateTimeSecondsCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 43;
      expect(dateTime(t)).assertEqual('00:43');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_4500
     * @tc.name      testDateTimeSeconds0045
     * @tc.desc      Verify dateTimeSecondsCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 44;
      expect(dateTime(t)).assertEqual('00:44');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_4600
     * @tc.name      testDateTimeSeconds0046
     * @tc.desc      Verify dateTimeSecondsCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 45;
      expect(dateTime(t)).assertEqual('00:45');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_4700
     * @tc.name      testDateTimeSeconds0047
     * @tc.desc      Verify dateTimeSecondsCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 46;
      expect(dateTime(t)).assertEqual('00:46');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_4800
     * @tc.name      testDateTimeSeconds0048
     * @tc.desc      Verify dateTimeSecondsCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 47;
      expect(dateTime(t)).assertEqual('00:47');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_4900
     * @tc.name      testDateTimeSeconds0049
     * @tc.desc      Verify dateTimeSecondsCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 48;
      expect(dateTime(t)).assertEqual('00:48');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_5000
     * @tc.name      testDateTimeSeconds0050
     * @tc.desc      Verify dateTimeSecondsCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 49;
      expect(dateTime(t)).assertEqual('00:49');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_5100
     * @tc.name      testDateTimeSeconds0051
     * @tc.desc      Verify dateTimeSecondsCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 50;
      expect(dateTime(t)).assertEqual('00:50');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_5200
     * @tc.name      testDateTimeSeconds0052
     * @tc.desc      Verify dateTimeSecondsCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 51;
      expect(dateTime(t)).assertEqual('00:51');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_5300
     * @tc.name      testDateTimeSeconds0053
     * @tc.desc      Verify dateTimeSecondsCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 52;
      expect(dateTime(t)).assertEqual('00:52');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_5400
     * @tc.name      testDateTimeSeconds0054
     * @tc.desc      Verify dateTimeSecondsCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 53;
      expect(dateTime(t)).assertEqual('00:53');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_5500
     * @tc.name      testDateTimeSeconds0055
     * @tc.desc      Verify dateTimeSecondsCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 54;
      expect(dateTime(t)).assertEqual('00:54');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_5600
     * @tc.name      testDateTimeSeconds0056
     * @tc.desc      Verify dateTimeSecondsCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 55;
      expect(dateTime(t)).assertEqual('00:55');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_5700
     * @tc.name      testDateTimeSeconds0057
     * @tc.desc      Verify dateTimeSecondsCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 56;
      expect(dateTime(t)).assertEqual('00:56');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_5800
     * @tc.name      testDateTimeSeconds0058
     * @tc.desc      Verify dateTimeSecondsCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 57;
      expect(dateTime(t)).assertEqual('00:57');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_5900
     * @tc.name      testDateTimeSeconds0059
     * @tc.desc      Verify dateTimeSecondsCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 58;
      expect(dateTime(t)).assertEqual('00:58');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_6000
     * @tc.name      testDateTimeSeconds0060
     * @tc.desc      Verify dateTimeSecondsCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 59;
      expect(dateTime(t)).assertEqual('00:59');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_6100
     * @tc.name      testDateTimeSeconds0061
     * @tc.desc      Verify dateTimeSecondsCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 0;
      expect(dateTime(t)).assertEqual('00:00');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_6200
     * @tc.name      testDateTimeSeconds0062
     * @tc.desc      Verify dateTimeSecondsCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 1;
      expect(dateTime(t)).assertEqual('00:01');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_6300
     * @tc.name      testDateTimeSeconds0063
     * @tc.desc      Verify dateTimeSecondsCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 2;
      expect(dateTime(t)).assertEqual('00:02');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_6400
     * @tc.name      testDateTimeSeconds0064
     * @tc.desc      Verify dateTimeSecondsCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 3;
      expect(dateTime(t)).assertEqual('00:03');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_6500
     * @tc.name      testDateTimeSeconds0065
     * @tc.desc      Verify dateTimeSecondsCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 4;
      expect(dateTime(t)).assertEqual('00:04');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_6600
     * @tc.name      testDateTimeSeconds0066
     * @tc.desc      Verify dateTimeSecondsCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 5;
      expect(dateTime(t)).assertEqual('00:05');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_6700
     * @tc.name      testDateTimeSeconds0067
     * @tc.desc      Verify dateTimeSecondsCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 6;
      expect(dateTime(t)).assertEqual('00:06');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_6800
     * @tc.name      testDateTimeSeconds0068
     * @tc.desc      Verify dateTimeSecondsCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 7;
      expect(dateTime(t)).assertEqual('00:07');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_6900
     * @tc.name      testDateTimeSeconds0069
     * @tc.desc      Verify dateTimeSecondsCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 8;
      expect(dateTime(t)).assertEqual('00:08');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_7000
     * @tc.name      testDateTimeSeconds0070
     * @tc.desc      Verify dateTimeSecondsCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 9;
      expect(dateTime(t)).assertEqual('00:09');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_7100
     * @tc.name      testDateTimeSeconds0071
     * @tc.desc      Verify dateTimeSecondsCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 10;
      expect(dateTime(t)).assertEqual('00:10');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_7200
     * @tc.name      testDateTimeSeconds0072
     * @tc.desc      Verify dateTimeSecondsCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 11;
      expect(dateTime(t)).assertEqual('00:11');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_7300
     * @tc.name      testDateTimeSeconds0073
     * @tc.desc      Verify dateTimeSecondsCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 12;
      expect(dateTime(t)).assertEqual('00:12');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_7400
     * @tc.name      testDateTimeSeconds0074
     * @tc.desc      Verify dateTimeSecondsCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 13;
      expect(dateTime(t)).assertEqual('00:13');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_7500
     * @tc.name      testDateTimeSeconds0075
     * @tc.desc      Verify dateTimeSecondsCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 14;
      expect(dateTime(t)).assertEqual('00:14');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_7600
     * @tc.name      testDateTimeSeconds0076
     * @tc.desc      Verify dateTimeSecondsCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 15;
      expect(dateTime(t)).assertEqual('00:15');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_7700
     * @tc.name      testDateTimeSeconds0077
     * @tc.desc      Verify dateTimeSecondsCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 16;
      expect(dateTime(t)).assertEqual('00:16');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_7800
     * @tc.name      testDateTimeSeconds0078
     * @tc.desc      Verify dateTimeSecondsCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 17;
      expect(dateTime(t)).assertEqual('00:17');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_7900
     * @tc.name      testDateTimeSeconds0079
     * @tc.desc      Verify dateTimeSecondsCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 18;
      expect(dateTime(t)).assertEqual('00:18');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_8000
     * @tc.name      testDateTimeSeconds0080
     * @tc.desc      Verify dateTimeSecondsCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 19;
      expect(dateTime(t)).assertEqual('00:19');
      expect(dateTime(t).length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_SEC_8100
     * @tc.name      testDateTimeSeconds0081
     * @tc.desc      Verify dateTimeSecondsCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testDateTimeSeconds0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const t: number = 20;
      expect(dateTime(t)).assertEqual('00:20');
      expect(dateTime(t).length).assertEqual(5);
    });

  });
}
