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

const TAG: string = '[Sample_concatTimeCore]';
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
export default function concatTimeCoreTest(): void {
  describe('concatTimeCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_0100
     * @tc.name      testConcatTime0001
     * @tc.desc      Verify concatTimeCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 0;
      const minute: number = 0;
      const second: number = 0;
      expect(util.concatTime(hour, minute, second)).assertEqual('000000');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_0200
     * @tc.name      testConcatTime0002
     * @tc.desc      Verify concatTimeCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 1;
      const minute: number = 1;
      const second: number = 1;
      expect(util.concatTime(hour, minute, second)).assertEqual('010101');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_0300
     * @tc.name      testConcatTime0003
     * @tc.desc      Verify concatTimeCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 2;
      const minute: number = 2;
      const second: number = 2;
      expect(util.concatTime(hour, minute, second)).assertEqual('020202');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_0400
     * @tc.name      testConcatTime0004
     * @tc.desc      Verify concatTimeCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 3;
      const minute: number = 3;
      const second: number = 3;
      expect(util.concatTime(hour, minute, second)).assertEqual('030303');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_0500
     * @tc.name      testConcatTime0005
     * @tc.desc      Verify concatTimeCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 4;
      const minute: number = 4;
      const second: number = 4;
      expect(util.concatTime(hour, minute, second)).assertEqual('040404');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_0600
     * @tc.name      testConcatTime0006
     * @tc.desc      Verify concatTimeCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 5;
      const minute: number = 5;
      const second: number = 5;
      expect(util.concatTime(hour, minute, second)).assertEqual('050505');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_0700
     * @tc.name      testConcatTime0007
     * @tc.desc      Verify concatTimeCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 6;
      const minute: number = 6;
      const second: number = 6;
      expect(util.concatTime(hour, minute, second)).assertEqual('060606');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_0800
     * @tc.name      testConcatTime0008
     * @tc.desc      Verify concatTimeCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 7;
      const minute: number = 7;
      const second: number = 7;
      expect(util.concatTime(hour, minute, second)).assertEqual('070707');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_0900
     * @tc.name      testConcatTime0009
     * @tc.desc      Verify concatTimeCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 8;
      const minute: number = 8;
      const second: number = 8;
      expect(util.concatTime(hour, minute, second)).assertEqual('080808');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_1000
     * @tc.name      testConcatTime0010
     * @tc.desc      Verify concatTimeCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 9;
      const minute: number = 9;
      const second: number = 9;
      expect(util.concatTime(hour, minute, second)).assertEqual('090909');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_1100
     * @tc.name      testConcatTime0011
     * @tc.desc      Verify concatTimeCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 10;
      const minute: number = 10;
      const second: number = 10;
      expect(util.concatTime(hour, minute, second)).assertEqual('101010');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_1200
     * @tc.name      testConcatTime0012
     * @tc.desc      Verify concatTimeCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 11;
      const minute: number = 11;
      const second: number = 11;
      expect(util.concatTime(hour, minute, second)).assertEqual('111111');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_1300
     * @tc.name      testConcatTime0013
     * @tc.desc      Verify concatTimeCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 12;
      const minute: number = 12;
      const second: number = 12;
      expect(util.concatTime(hour, minute, second)).assertEqual('121212');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_1400
     * @tc.name      testConcatTime0014
     * @tc.desc      Verify concatTimeCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 13;
      const minute: number = 13;
      const second: number = 13;
      expect(util.concatTime(hour, minute, second)).assertEqual('131313');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_1500
     * @tc.name      testConcatTime0015
     * @tc.desc      Verify concatTimeCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 14;
      const minute: number = 14;
      const second: number = 14;
      expect(util.concatTime(hour, minute, second)).assertEqual('141414');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_1600
     * @tc.name      testConcatTime0016
     * @tc.desc      Verify concatTimeCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 15;
      const minute: number = 15;
      const second: number = 15;
      expect(util.concatTime(hour, minute, second)).assertEqual('151515');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_1700
     * @tc.name      testConcatTime0017
     * @tc.desc      Verify concatTimeCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 16;
      const minute: number = 16;
      const second: number = 16;
      expect(util.concatTime(hour, minute, second)).assertEqual('161616');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_1800
     * @tc.name      testConcatTime0018
     * @tc.desc      Verify concatTimeCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 17;
      const minute: number = 17;
      const second: number = 17;
      expect(util.concatTime(hour, minute, second)).assertEqual('171717');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_1900
     * @tc.name      testConcatTime0019
     * @tc.desc      Verify concatTimeCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 18;
      const minute: number = 18;
      const second: number = 18;
      expect(util.concatTime(hour, minute, second)).assertEqual('181818');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_2000
     * @tc.name      testConcatTime0020
     * @tc.desc      Verify concatTimeCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 19;
      const minute: number = 19;
      const second: number = 19;
      expect(util.concatTime(hour, minute, second)).assertEqual('191919');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_2100
     * @tc.name      testConcatTime0021
     * @tc.desc      Verify concatTimeCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 20;
      const minute: number = 20;
      const second: number = 20;
      expect(util.concatTime(hour, minute, second)).assertEqual('202020');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_2200
     * @tc.name      testConcatTime0022
     * @tc.desc      Verify concatTimeCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 21;
      const minute: number = 21;
      const second: number = 21;
      expect(util.concatTime(hour, minute, second)).assertEqual('212121');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_2300
     * @tc.name      testConcatTime0023
     * @tc.desc      Verify concatTimeCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 22;
      const minute: number = 22;
      const second: number = 22;
      expect(util.concatTime(hour, minute, second)).assertEqual('222222');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_2400
     * @tc.name      testConcatTime0024
     * @tc.desc      Verify concatTimeCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 23;
      const minute: number = 23;
      const second: number = 23;
      expect(util.concatTime(hour, minute, second)).assertEqual('232323');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_2500
     * @tc.name      testConcatTime0025
     * @tc.desc      Verify concatTimeCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 0;
      const minute: number = 24;
      const second: number = 24;
      expect(util.concatTime(hour, minute, second)).assertEqual('002424');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_2600
     * @tc.name      testConcatTime0026
     * @tc.desc      Verify concatTimeCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 1;
      const minute: number = 25;
      const second: number = 25;
      expect(util.concatTime(hour, minute, second)).assertEqual('012525');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_2700
     * @tc.name      testConcatTime0027
     * @tc.desc      Verify concatTimeCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 2;
      const minute: number = 26;
      const second: number = 26;
      expect(util.concatTime(hour, minute, second)).assertEqual('022626');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_2800
     * @tc.name      testConcatTime0028
     * @tc.desc      Verify concatTimeCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 3;
      const minute: number = 27;
      const second: number = 27;
      expect(util.concatTime(hour, minute, second)).assertEqual('032727');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_2900
     * @tc.name      testConcatTime0029
     * @tc.desc      Verify concatTimeCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 4;
      const minute: number = 28;
      const second: number = 28;
      expect(util.concatTime(hour, minute, second)).assertEqual('042828');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_3000
     * @tc.name      testConcatTime0030
     * @tc.desc      Verify concatTimeCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 5;
      const minute: number = 29;
      const second: number = 29;
      expect(util.concatTime(hour, minute, second)).assertEqual('052929');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_3100
     * @tc.name      testConcatTime0031
     * @tc.desc      Verify concatTimeCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 6;
      const minute: number = 30;
      const second: number = 30;
      expect(util.concatTime(hour, minute, second)).assertEqual('063030');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_3200
     * @tc.name      testConcatTime0032
     * @tc.desc      Verify concatTimeCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 7;
      const minute: number = 31;
      const second: number = 31;
      expect(util.concatTime(hour, minute, second)).assertEqual('073131');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_3300
     * @tc.name      testConcatTime0033
     * @tc.desc      Verify concatTimeCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 8;
      const minute: number = 32;
      const second: number = 32;
      expect(util.concatTime(hour, minute, second)).assertEqual('083232');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_3400
     * @tc.name      testConcatTime0034
     * @tc.desc      Verify concatTimeCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 9;
      const minute: number = 33;
      const second: number = 33;
      expect(util.concatTime(hour, minute, second)).assertEqual('093333');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_3500
     * @tc.name      testConcatTime0035
     * @tc.desc      Verify concatTimeCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 10;
      const minute: number = 34;
      const second: number = 34;
      expect(util.concatTime(hour, minute, second)).assertEqual('103434');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_3600
     * @tc.name      testConcatTime0036
     * @tc.desc      Verify concatTimeCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 11;
      const minute: number = 35;
      const second: number = 35;
      expect(util.concatTime(hour, minute, second)).assertEqual('113535');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_3700
     * @tc.name      testConcatTime0037
     * @tc.desc      Verify concatTimeCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 12;
      const minute: number = 36;
      const second: number = 36;
      expect(util.concatTime(hour, minute, second)).assertEqual('123636');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_3800
     * @tc.name      testConcatTime0038
     * @tc.desc      Verify concatTimeCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 13;
      const minute: number = 37;
      const second: number = 37;
      expect(util.concatTime(hour, minute, second)).assertEqual('133737');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_3900
     * @tc.name      testConcatTime0039
     * @tc.desc      Verify concatTimeCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 14;
      const minute: number = 38;
      const second: number = 38;
      expect(util.concatTime(hour, minute, second)).assertEqual('143838');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_4000
     * @tc.name      testConcatTime0040
     * @tc.desc      Verify concatTimeCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 15;
      const minute: number = 39;
      const second: number = 39;
      expect(util.concatTime(hour, minute, second)).assertEqual('153939');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_4100
     * @tc.name      testConcatTime0041
     * @tc.desc      Verify concatTimeCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 16;
      const minute: number = 40;
      const second: number = 40;
      expect(util.concatTime(hour, minute, second)).assertEqual('164040');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_4200
     * @tc.name      testConcatTime0042
     * @tc.desc      Verify concatTimeCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 17;
      const minute: number = 41;
      const second: number = 41;
      expect(util.concatTime(hour, minute, second)).assertEqual('174141');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_4300
     * @tc.name      testConcatTime0043
     * @tc.desc      Verify concatTimeCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 18;
      const minute: number = 42;
      const second: number = 42;
      expect(util.concatTime(hour, minute, second)).assertEqual('184242');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_4400
     * @tc.name      testConcatTime0044
     * @tc.desc      Verify concatTimeCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 19;
      const minute: number = 43;
      const second: number = 43;
      expect(util.concatTime(hour, minute, second)).assertEqual('194343');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_4500
     * @tc.name      testConcatTime0045
     * @tc.desc      Verify concatTimeCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 20;
      const minute: number = 44;
      const second: number = 44;
      expect(util.concatTime(hour, minute, second)).assertEqual('204444');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_4600
     * @tc.name      testConcatTime0046
     * @tc.desc      Verify concatTimeCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 21;
      const minute: number = 45;
      const second: number = 45;
      expect(util.concatTime(hour, minute, second)).assertEqual('214545');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_4700
     * @tc.name      testConcatTime0047
     * @tc.desc      Verify concatTimeCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 22;
      const minute: number = 46;
      const second: number = 46;
      expect(util.concatTime(hour, minute, second)).assertEqual('224646');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_4800
     * @tc.name      testConcatTime0048
     * @tc.desc      Verify concatTimeCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 23;
      const minute: number = 47;
      const second: number = 47;
      expect(util.concatTime(hour, minute, second)).assertEqual('234747');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_4900
     * @tc.name      testConcatTime0049
     * @tc.desc      Verify concatTimeCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 0;
      const minute: number = 48;
      const second: number = 48;
      expect(util.concatTime(hour, minute, second)).assertEqual('004848');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_5000
     * @tc.name      testConcatTime0050
     * @tc.desc      Verify concatTimeCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 1;
      const minute: number = 49;
      const second: number = 49;
      expect(util.concatTime(hour, minute, second)).assertEqual('014949');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_5100
     * @tc.name      testConcatTime0051
     * @tc.desc      Verify concatTimeCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 2;
      const minute: number = 50;
      const second: number = 50;
      expect(util.concatTime(hour, minute, second)).assertEqual('025050');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_5200
     * @tc.name      testConcatTime0052
     * @tc.desc      Verify concatTimeCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 3;
      const minute: number = 51;
      const second: number = 51;
      expect(util.concatTime(hour, minute, second)).assertEqual('035151');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_5300
     * @tc.name      testConcatTime0053
     * @tc.desc      Verify concatTimeCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 4;
      const minute: number = 52;
      const second: number = 52;
      expect(util.concatTime(hour, minute, second)).assertEqual('045252');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_5400
     * @tc.name      testConcatTime0054
     * @tc.desc      Verify concatTimeCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 5;
      const minute: number = 53;
      const second: number = 53;
      expect(util.concatTime(hour, minute, second)).assertEqual('055353');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_5500
     * @tc.name      testConcatTime0055
     * @tc.desc      Verify concatTimeCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 6;
      const minute: number = 54;
      const second: number = 54;
      expect(util.concatTime(hour, minute, second)).assertEqual('065454');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_5600
     * @tc.name      testConcatTime0056
     * @tc.desc      Verify concatTimeCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 7;
      const minute: number = 55;
      const second: number = 55;
      expect(util.concatTime(hour, minute, second)).assertEqual('075555');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_5700
     * @tc.name      testConcatTime0057
     * @tc.desc      Verify concatTimeCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 8;
      const minute: number = 56;
      const second: number = 56;
      expect(util.concatTime(hour, minute, second)).assertEqual('085656');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_5800
     * @tc.name      testConcatTime0058
     * @tc.desc      Verify concatTimeCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 9;
      const minute: number = 57;
      const second: number = 57;
      expect(util.concatTime(hour, minute, second)).assertEqual('095757');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_5900
     * @tc.name      testConcatTime0059
     * @tc.desc      Verify concatTimeCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 10;
      const minute: number = 58;
      const second: number = 58;
      expect(util.concatTime(hour, minute, second)).assertEqual('105858');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_6000
     * @tc.name      testConcatTime0060
     * @tc.desc      Verify concatTimeCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 11;
      const minute: number = 59;
      const second: number = 59;
      expect(util.concatTime(hour, minute, second)).assertEqual('115959');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_6100
     * @tc.name      testConcatTime0061
     * @tc.desc      Verify concatTimeCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 12;
      const minute: number = 0;
      const second: number = 0;
      expect(util.concatTime(hour, minute, second)).assertEqual('120000');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_6200
     * @tc.name      testConcatTime0062
     * @tc.desc      Verify concatTimeCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 13;
      const minute: number = 1;
      const second: number = 1;
      expect(util.concatTime(hour, minute, second)).assertEqual('130101');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_6300
     * @tc.name      testConcatTime0063
     * @tc.desc      Verify concatTimeCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 14;
      const minute: number = 2;
      const second: number = 2;
      expect(util.concatTime(hour, minute, second)).assertEqual('140202');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_6400
     * @tc.name      testConcatTime0064
     * @tc.desc      Verify concatTimeCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 15;
      const minute: number = 3;
      const second: number = 3;
      expect(util.concatTime(hour, minute, second)).assertEqual('150303');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_6500
     * @tc.name      testConcatTime0065
     * @tc.desc      Verify concatTimeCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 16;
      const minute: number = 4;
      const second: number = 4;
      expect(util.concatTime(hour, minute, second)).assertEqual('160404');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_6600
     * @tc.name      testConcatTime0066
     * @tc.desc      Verify concatTimeCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 17;
      const minute: number = 5;
      const second: number = 5;
      expect(util.concatTime(hour, minute, second)).assertEqual('170505');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_6700
     * @tc.name      testConcatTime0067
     * @tc.desc      Verify concatTimeCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 18;
      const minute: number = 6;
      const second: number = 6;
      expect(util.concatTime(hour, minute, second)).assertEqual('180606');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_6800
     * @tc.name      testConcatTime0068
     * @tc.desc      Verify concatTimeCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 19;
      const minute: number = 7;
      const second: number = 7;
      expect(util.concatTime(hour, minute, second)).assertEqual('190707');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_6900
     * @tc.name      testConcatTime0069
     * @tc.desc      Verify concatTimeCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 20;
      const minute: number = 8;
      const second: number = 8;
      expect(util.concatTime(hour, minute, second)).assertEqual('200808');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_7000
     * @tc.name      testConcatTime0070
     * @tc.desc      Verify concatTimeCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 21;
      const minute: number = 9;
      const second: number = 9;
      expect(util.concatTime(hour, minute, second)).assertEqual('210909');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_7100
     * @tc.name      testConcatTime0071
     * @tc.desc      Verify concatTimeCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 22;
      const minute: number = 10;
      const second: number = 10;
      expect(util.concatTime(hour, minute, second)).assertEqual('221010');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_7200
     * @tc.name      testConcatTime0072
     * @tc.desc      Verify concatTimeCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 23;
      const minute: number = 11;
      const second: number = 11;
      expect(util.concatTime(hour, minute, second)).assertEqual('231111');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_7300
     * @tc.name      testConcatTime0073
     * @tc.desc      Verify concatTimeCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 0;
      const minute: number = 12;
      const second: number = 12;
      expect(util.concatTime(hour, minute, second)).assertEqual('001212');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_7400
     * @tc.name      testConcatTime0074
     * @tc.desc      Verify concatTimeCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 1;
      const minute: number = 13;
      const second: number = 13;
      expect(util.concatTime(hour, minute, second)).assertEqual('011313');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_7500
     * @tc.name      testConcatTime0075
     * @tc.desc      Verify concatTimeCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 2;
      const minute: number = 14;
      const second: number = 14;
      expect(util.concatTime(hour, minute, second)).assertEqual('021414');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_7600
     * @tc.name      testConcatTime0076
     * @tc.desc      Verify concatTimeCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 3;
      const minute: number = 15;
      const second: number = 15;
      expect(util.concatTime(hour, minute, second)).assertEqual('031515');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_7700
     * @tc.name      testConcatTime0077
     * @tc.desc      Verify concatTimeCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 4;
      const minute: number = 16;
      const second: number = 16;
      expect(util.concatTime(hour, minute, second)).assertEqual('041616');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_7800
     * @tc.name      testConcatTime0078
     * @tc.desc      Verify concatTimeCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 5;
      const minute: number = 17;
      const second: number = 17;
      expect(util.concatTime(hour, minute, second)).assertEqual('051717');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_7900
     * @tc.name      testConcatTime0079
     * @tc.desc      Verify concatTimeCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 6;
      const minute: number = 18;
      const second: number = 18;
      expect(util.concatTime(hour, minute, second)).assertEqual('061818');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_8000
     * @tc.name      testConcatTime0080
     * @tc.desc      Verify concatTimeCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 7;
      const minute: number = 19;
      const second: number = 19;
      expect(util.concatTime(hour, minute, second)).assertEqual('071919');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_AVREC_NDK_CTIME_8100
     * @tc.name      testConcatTime0081
     * @tc.desc      Verify concatTimeCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConcatTime0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const hour: number = 8;
      const minute: number = 20;
      const second: number = 20;
      expect(util.concatTime(hour, minute, second)).assertEqual('082020');
      expect(util.concatTime(hour, minute, second).length).assertEqual(6);
    });

  });
}
