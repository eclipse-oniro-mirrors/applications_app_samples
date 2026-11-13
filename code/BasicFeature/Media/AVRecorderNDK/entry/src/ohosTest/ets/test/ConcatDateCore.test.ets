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

const TAG: string = '[Sample_concatDateCore]';
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
export default function concatDateCoreTest(): void {
  describe('concatDateCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_0100
     * @tc.name      testConcatDate0001
     * @tc.desc      Verify concatDateCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 1;
      const day: number = 1;
      expect(util.concatDate(2026, month, day)).assertEqual('202611');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_0200
     * @tc.name      testConcatDate0002
     * @tc.desc      Verify concatDateCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 2;
      const day: number = 2;
      expect(util.concatDate(2026, month, day)).assertEqual('202622');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_0300
     * @tc.name      testConcatDate0003
     * @tc.desc      Verify concatDateCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 3;
      const day: number = 3;
      expect(util.concatDate(2026, month, day)).assertEqual('202633');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_0400
     * @tc.name      testConcatDate0004
     * @tc.desc      Verify concatDateCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 4;
      const day: number = 4;
      expect(util.concatDate(2026, month, day)).assertEqual('202644');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_0500
     * @tc.name      testConcatDate0005
     * @tc.desc      Verify concatDateCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 5;
      const day: number = 5;
      expect(util.concatDate(2026, month, day)).assertEqual('202655');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_0600
     * @tc.name      testConcatDate0006
     * @tc.desc      Verify concatDateCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 6;
      const day: number = 6;
      expect(util.concatDate(2026, month, day)).assertEqual('202666');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_0700
     * @tc.name      testConcatDate0007
     * @tc.desc      Verify concatDateCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 7;
      const day: number = 7;
      expect(util.concatDate(2026, month, day)).assertEqual('202677');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_0800
     * @tc.name      testConcatDate0008
     * @tc.desc      Verify concatDateCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 8;
      const day: number = 8;
      expect(util.concatDate(2026, month, day)).assertEqual('202688');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_0900
     * @tc.name      testConcatDate0009
     * @tc.desc      Verify concatDateCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 9;
      const day: number = 9;
      expect(util.concatDate(2026, month, day)).assertEqual('202699');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_1000
     * @tc.name      testConcatDate0010
     * @tc.desc      Verify concatDateCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 10;
      const day: number = 10;
      expect(util.concatDate(2026, month, day)).assertEqual('20261010');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_1100
     * @tc.name      testConcatDate0011
     * @tc.desc      Verify concatDateCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 11;
      const day: number = 11;
      expect(util.concatDate(2026, month, day)).assertEqual('20261111');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_1200
     * @tc.name      testConcatDate0012
     * @tc.desc      Verify concatDateCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 12;
      const day: number = 12;
      expect(util.concatDate(2026, month, day)).assertEqual('20261212');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_1300
     * @tc.name      testConcatDate0013
     * @tc.desc      Verify concatDateCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 1;
      const day: number = 13;
      expect(util.concatDate(2026, month, day)).assertEqual('2026113');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_1400
     * @tc.name      testConcatDate0014
     * @tc.desc      Verify concatDateCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 2;
      const day: number = 14;
      expect(util.concatDate(2026, month, day)).assertEqual('2026214');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_1500
     * @tc.name      testConcatDate0015
     * @tc.desc      Verify concatDateCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 3;
      const day: number = 15;
      expect(util.concatDate(2026, month, day)).assertEqual('2026315');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_1600
     * @tc.name      testConcatDate0016
     * @tc.desc      Verify concatDateCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 4;
      const day: number = 16;
      expect(util.concatDate(2026, month, day)).assertEqual('2026416');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_1700
     * @tc.name      testConcatDate0017
     * @tc.desc      Verify concatDateCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 5;
      const day: number = 17;
      expect(util.concatDate(2026, month, day)).assertEqual('2026517');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_1800
     * @tc.name      testConcatDate0018
     * @tc.desc      Verify concatDateCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 6;
      const day: number = 18;
      expect(util.concatDate(2026, month, day)).assertEqual('2026618');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_1900
     * @tc.name      testConcatDate0019
     * @tc.desc      Verify concatDateCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 7;
      const day: number = 19;
      expect(util.concatDate(2026, month, day)).assertEqual('2026719');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_2000
     * @tc.name      testConcatDate0020
     * @tc.desc      Verify concatDateCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 8;
      const day: number = 20;
      expect(util.concatDate(2026, month, day)).assertEqual('2026820');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_2100
     * @tc.name      testConcatDate0021
     * @tc.desc      Verify concatDateCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 9;
      const day: number = 21;
      expect(util.concatDate(2026, month, day)).assertEqual('2026921');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_2200
     * @tc.name      testConcatDate0022
     * @tc.desc      Verify concatDateCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 10;
      const day: number = 22;
      expect(util.concatDate(2026, month, day)).assertEqual('20261022');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_2300
     * @tc.name      testConcatDate0023
     * @tc.desc      Verify concatDateCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 11;
      const day: number = 23;
      expect(util.concatDate(2026, month, day)).assertEqual('20261123');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_2400
     * @tc.name      testConcatDate0024
     * @tc.desc      Verify concatDateCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 12;
      const day: number = 24;
      expect(util.concatDate(2026, month, day)).assertEqual('20261224');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_2500
     * @tc.name      testConcatDate0025
     * @tc.desc      Verify concatDateCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 1;
      const day: number = 25;
      expect(util.concatDate(2026, month, day)).assertEqual('2026125');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_2600
     * @tc.name      testConcatDate0026
     * @tc.desc      Verify concatDateCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 2;
      const day: number = 26;
      expect(util.concatDate(2026, month, day)).assertEqual('2026226');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_2700
     * @tc.name      testConcatDate0027
     * @tc.desc      Verify concatDateCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 3;
      const day: number = 27;
      expect(util.concatDate(2026, month, day)).assertEqual('2026327');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_2800
     * @tc.name      testConcatDate0028
     * @tc.desc      Verify concatDateCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 4;
      const day: number = 28;
      expect(util.concatDate(2026, month, day)).assertEqual('2026428');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_2900
     * @tc.name      testConcatDate0029
     * @tc.desc      Verify concatDateCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 5;
      const day: number = 1;
      expect(util.concatDate(2026, month, day)).assertEqual('202651');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_3000
     * @tc.name      testConcatDate0030
     * @tc.desc      Verify concatDateCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 6;
      const day: number = 2;
      expect(util.concatDate(2026, month, day)).assertEqual('202662');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_3100
     * @tc.name      testConcatDate0031
     * @tc.desc      Verify concatDateCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 7;
      const day: number = 3;
      expect(util.concatDate(2026, month, day)).assertEqual('202673');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_3200
     * @tc.name      testConcatDate0032
     * @tc.desc      Verify concatDateCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 8;
      const day: number = 4;
      expect(util.concatDate(2026, month, day)).assertEqual('202684');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_3300
     * @tc.name      testConcatDate0033
     * @tc.desc      Verify concatDateCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 9;
      const day: number = 5;
      expect(util.concatDate(2026, month, day)).assertEqual('202695');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_3400
     * @tc.name      testConcatDate0034
     * @tc.desc      Verify concatDateCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 10;
      const day: number = 6;
      expect(util.concatDate(2026, month, day)).assertEqual('2026106');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_3500
     * @tc.name      testConcatDate0035
     * @tc.desc      Verify concatDateCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 11;
      const day: number = 7;
      expect(util.concatDate(2026, month, day)).assertEqual('2026117');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_3600
     * @tc.name      testConcatDate0036
     * @tc.desc      Verify concatDateCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 12;
      const day: number = 8;
      expect(util.concatDate(2026, month, day)).assertEqual('2026128');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_3700
     * @tc.name      testConcatDate0037
     * @tc.desc      Verify concatDateCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 1;
      const day: number = 9;
      expect(util.concatDate(2026, month, day)).assertEqual('202619');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_3800
     * @tc.name      testConcatDate0038
     * @tc.desc      Verify concatDateCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 2;
      const day: number = 10;
      expect(util.concatDate(2026, month, day)).assertEqual('2026210');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_3900
     * @tc.name      testConcatDate0039
     * @tc.desc      Verify concatDateCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 3;
      const day: number = 11;
      expect(util.concatDate(2026, month, day)).assertEqual('2026311');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_4000
     * @tc.name      testConcatDate0040
     * @tc.desc      Verify concatDateCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 4;
      const day: number = 12;
      expect(util.concatDate(2026, month, day)).assertEqual('2026412');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_4100
     * @tc.name      testConcatDate0041
     * @tc.desc      Verify concatDateCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 5;
      const day: number = 13;
      expect(util.concatDate(2026, month, day)).assertEqual('2026513');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_4200
     * @tc.name      testConcatDate0042
     * @tc.desc      Verify concatDateCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 6;
      const day: number = 14;
      expect(util.concatDate(2026, month, day)).assertEqual('2026614');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_4300
     * @tc.name      testConcatDate0043
     * @tc.desc      Verify concatDateCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 7;
      const day: number = 15;
      expect(util.concatDate(2026, month, day)).assertEqual('2026715');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_4400
     * @tc.name      testConcatDate0044
     * @tc.desc      Verify concatDateCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 8;
      const day: number = 16;
      expect(util.concatDate(2026, month, day)).assertEqual('2026816');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_4500
     * @tc.name      testConcatDate0045
     * @tc.desc      Verify concatDateCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 9;
      const day: number = 17;
      expect(util.concatDate(2026, month, day)).assertEqual('2026917');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_4600
     * @tc.name      testConcatDate0046
     * @tc.desc      Verify concatDateCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 10;
      const day: number = 18;
      expect(util.concatDate(2026, month, day)).assertEqual('20261018');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_4700
     * @tc.name      testConcatDate0047
     * @tc.desc      Verify concatDateCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 11;
      const day: number = 19;
      expect(util.concatDate(2026, month, day)).assertEqual('20261119');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_4800
     * @tc.name      testConcatDate0048
     * @tc.desc      Verify concatDateCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 12;
      const day: number = 20;
      expect(util.concatDate(2026, month, day)).assertEqual('20261220');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_4900
     * @tc.name      testConcatDate0049
     * @tc.desc      Verify concatDateCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 1;
      const day: number = 21;
      expect(util.concatDate(2026, month, day)).assertEqual('2026121');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_5000
     * @tc.name      testConcatDate0050
     * @tc.desc      Verify concatDateCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 2;
      const day: number = 22;
      expect(util.concatDate(2026, month, day)).assertEqual('2026222');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_5100
     * @tc.name      testConcatDate0051
     * @tc.desc      Verify concatDateCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 3;
      const day: number = 23;
      expect(util.concatDate(2026, month, day)).assertEqual('2026323');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_5200
     * @tc.name      testConcatDate0052
     * @tc.desc      Verify concatDateCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 4;
      const day: number = 24;
      expect(util.concatDate(2026, month, day)).assertEqual('2026424');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_5300
     * @tc.name      testConcatDate0053
     * @tc.desc      Verify concatDateCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 5;
      const day: number = 25;
      expect(util.concatDate(2026, month, day)).assertEqual('2026525');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_5400
     * @tc.name      testConcatDate0054
     * @tc.desc      Verify concatDateCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 6;
      const day: number = 26;
      expect(util.concatDate(2026, month, day)).assertEqual('2026626');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_5500
     * @tc.name      testConcatDate0055
     * @tc.desc      Verify concatDateCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 7;
      const day: number = 27;
      expect(util.concatDate(2026, month, day)).assertEqual('2026727');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_5600
     * @tc.name      testConcatDate0056
     * @tc.desc      Verify concatDateCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 8;
      const day: number = 28;
      expect(util.concatDate(2026, month, day)).assertEqual('2026828');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_5700
     * @tc.name      testConcatDate0057
     * @tc.desc      Verify concatDateCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 9;
      const day: number = 1;
      expect(util.concatDate(2026, month, day)).assertEqual('202691');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_5800
     * @tc.name      testConcatDate0058
     * @tc.desc      Verify concatDateCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 10;
      const day: number = 2;
      expect(util.concatDate(2026, month, day)).assertEqual('2026102');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_5900
     * @tc.name      testConcatDate0059
     * @tc.desc      Verify concatDateCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 11;
      const day: number = 3;
      expect(util.concatDate(2026, month, day)).assertEqual('2026113');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_6000
     * @tc.name      testConcatDate0060
     * @tc.desc      Verify concatDateCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 12;
      const day: number = 4;
      expect(util.concatDate(2026, month, day)).assertEqual('2026124');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_6100
     * @tc.name      testConcatDate0061
     * @tc.desc      Verify concatDateCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 1;
      const day: number = 5;
      expect(util.concatDate(2026, month, day)).assertEqual('202615');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_6200
     * @tc.name      testConcatDate0062
     * @tc.desc      Verify concatDateCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 2;
      const day: number = 6;
      expect(util.concatDate(2026, month, day)).assertEqual('202626');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_6300
     * @tc.name      testConcatDate0063
     * @tc.desc      Verify concatDateCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 3;
      const day: number = 7;
      expect(util.concatDate(2026, month, day)).assertEqual('202637');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_6400
     * @tc.name      testConcatDate0064
     * @tc.desc      Verify concatDateCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 4;
      const day: number = 8;
      expect(util.concatDate(2026, month, day)).assertEqual('202648');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_6500
     * @tc.name      testConcatDate0065
     * @tc.desc      Verify concatDateCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 5;
      const day: number = 9;
      expect(util.concatDate(2026, month, day)).assertEqual('202659');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_6600
     * @tc.name      testConcatDate0066
     * @tc.desc      Verify concatDateCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 6;
      const day: number = 10;
      expect(util.concatDate(2026, month, day)).assertEqual('2026610');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_6700
     * @tc.name      testConcatDate0067
     * @tc.desc      Verify concatDateCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 7;
      const day: number = 11;
      expect(util.concatDate(2026, month, day)).assertEqual('2026711');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_6800
     * @tc.name      testConcatDate0068
     * @tc.desc      Verify concatDateCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 8;
      const day: number = 12;
      expect(util.concatDate(2026, month, day)).assertEqual('2026812');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_6900
     * @tc.name      testConcatDate0069
     * @tc.desc      Verify concatDateCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 9;
      const day: number = 13;
      expect(util.concatDate(2026, month, day)).assertEqual('2026913');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_7000
     * @tc.name      testConcatDate0070
     * @tc.desc      Verify concatDateCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 10;
      const day: number = 14;
      expect(util.concatDate(2026, month, day)).assertEqual('20261014');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_7100
     * @tc.name      testConcatDate0071
     * @tc.desc      Verify concatDateCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 11;
      const day: number = 15;
      expect(util.concatDate(2026, month, day)).assertEqual('20261115');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_7200
     * @tc.name      testConcatDate0072
     * @tc.desc      Verify concatDateCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 12;
      const day: number = 16;
      expect(util.concatDate(2026, month, day)).assertEqual('20261216');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_7300
     * @tc.name      testConcatDate0073
     * @tc.desc      Verify concatDateCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 1;
      const day: number = 17;
      expect(util.concatDate(2026, month, day)).assertEqual('2026117');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_7400
     * @tc.name      testConcatDate0074
     * @tc.desc      Verify concatDateCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 2;
      const day: number = 18;
      expect(util.concatDate(2026, month, day)).assertEqual('2026218');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_7500
     * @tc.name      testConcatDate0075
     * @tc.desc      Verify concatDateCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 3;
      const day: number = 19;
      expect(util.concatDate(2026, month, day)).assertEqual('2026319');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_7600
     * @tc.name      testConcatDate0076
     * @tc.desc      Verify concatDateCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 4;
      const day: number = 20;
      expect(util.concatDate(2026, month, day)).assertEqual('2026420');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_7700
     * @tc.name      testConcatDate0077
     * @tc.desc      Verify concatDateCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 5;
      const day: number = 21;
      expect(util.concatDate(2026, month, day)).assertEqual('2026521');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_7800
     * @tc.name      testConcatDate0078
     * @tc.desc      Verify concatDateCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 6;
      const day: number = 22;
      expect(util.concatDate(2026, month, day)).assertEqual('2026622');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_7900
     * @tc.name      testConcatDate0079
     * @tc.desc      Verify concatDateCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 7;
      const day: number = 23;
      expect(util.concatDate(2026, month, day)).assertEqual('2026723');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_8000
     * @tc.name      testConcatDate0080
     * @tc.desc      Verify concatDateCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 8;
      const day: number = 24;
      expect(util.concatDate(2026, month, day)).assertEqual('2026824');
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CDATE_8100
     * @tc.name      testConcatDate0081
     * @tc.desc      Verify concatDateCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatDate0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const month: number = 9;
      const day: number = 25;
      expect(util.concatDate(2026, month, day)).assertEqual('2026925');
    });

  });
}
