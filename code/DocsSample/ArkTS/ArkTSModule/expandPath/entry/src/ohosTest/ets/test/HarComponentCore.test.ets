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
import * as har from 'expandPathHar';
import { MainPage } from 'expandPathHar';

const TAG: string = '[Sample_harComponentCore]';
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

export default function harComponentCoreTest(): void {
  describe('harComponentCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_EXPAND_COMP_0100
     * @tc.name      testComponent0001
     * @tc.desc      Verify harComponentCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_0200
     * @tc.name      testComponent0002
     * @tc.desc      Verify harComponentCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_0300
     * @tc.name      testComponent0003
     * @tc.desc      Verify harComponentCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_0400
     * @tc.name      testComponent0004
     * @tc.desc      Verify harComponentCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_0500
     * @tc.name      testComponent0005
     * @tc.desc      Verify harComponentCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_0600
     * @tc.name      testComponent0006
     * @tc.desc      Verify harComponentCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_0700
     * @tc.name      testComponent0007
     * @tc.desc      Verify harComponentCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_0800
     * @tc.name      testComponent0008
     * @tc.desc      Verify harComponentCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_0900
     * @tc.name      testComponent0009
     * @tc.desc      Verify harComponentCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_1000
     * @tc.name      testComponent0010
     * @tc.desc      Verify harComponentCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_1100
     * @tc.name      testComponent0011
     * @tc.desc      Verify harComponentCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_1200
     * @tc.name      testComponent0012
     * @tc.desc      Verify harComponentCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_1300
     * @tc.name      testComponent0013
     * @tc.desc      Verify harComponentCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_1400
     * @tc.name      testComponent0014
     * @tc.desc      Verify harComponentCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_1500
     * @tc.name      testComponent0015
     * @tc.desc      Verify harComponentCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_1600
     * @tc.name      testComponent0016
     * @tc.desc      Verify harComponentCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_1700
     * @tc.name      testComponent0017
     * @tc.desc      Verify harComponentCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_1800
     * @tc.name      testComponent0018
     * @tc.desc      Verify harComponentCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_1900
     * @tc.name      testComponent0019
     * @tc.desc      Verify harComponentCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_2000
     * @tc.name      testComponent0020
     * @tc.desc      Verify harComponentCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_2100
     * @tc.name      testComponent0021
     * @tc.desc      Verify harComponentCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_2200
     * @tc.name      testComponent0022
     * @tc.desc      Verify harComponentCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_2300
     * @tc.name      testComponent0023
     * @tc.desc      Verify harComponentCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_2400
     * @tc.name      testComponent0024
     * @tc.desc      Verify harComponentCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_2500
     * @tc.name      testComponent0025
     * @tc.desc      Verify harComponentCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_2600
     * @tc.name      testComponent0026
     * @tc.desc      Verify harComponentCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_2700
     * @tc.name      testComponent0027
     * @tc.desc      Verify harComponentCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_2800
     * @tc.name      testComponent0028
     * @tc.desc      Verify harComponentCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_2900
     * @tc.name      testComponent0029
     * @tc.desc      Verify harComponentCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_3000
     * @tc.name      testComponent0030
     * @tc.desc      Verify harComponentCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_3100
     * @tc.name      testComponent0031
     * @tc.desc      Verify harComponentCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_3200
     * @tc.name      testComponent0032
     * @tc.desc      Verify harComponentCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_3300
     * @tc.name      testComponent0033
     * @tc.desc      Verify harComponentCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_3400
     * @tc.name      testComponent0034
     * @tc.desc      Verify harComponentCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_3500
     * @tc.name      testComponent0035
     * @tc.desc      Verify harComponentCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_3600
     * @tc.name      testComponent0036
     * @tc.desc      Verify harComponentCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_3700
     * @tc.name      testComponent0037
     * @tc.desc      Verify harComponentCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_3800
     * @tc.name      testComponent0038
     * @tc.desc      Verify harComponentCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_3900
     * @tc.name      testComponent0039
     * @tc.desc      Verify harComponentCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_4000
     * @tc.name      testComponent0040
     * @tc.desc      Verify harComponentCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_4100
     * @tc.name      testComponent0041
     * @tc.desc      Verify harComponentCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_4200
     * @tc.name      testComponent0042
     * @tc.desc      Verify harComponentCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_4300
     * @tc.name      testComponent0043
     * @tc.desc      Verify harComponentCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_4400
     * @tc.name      testComponent0044
     * @tc.desc      Verify harComponentCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_4500
     * @tc.name      testComponent0045
     * @tc.desc      Verify harComponentCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_4600
     * @tc.name      testComponent0046
     * @tc.desc      Verify harComponentCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_4700
     * @tc.name      testComponent0047
     * @tc.desc      Verify harComponentCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_4800
     * @tc.name      testComponent0048
     * @tc.desc      Verify harComponentCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_4900
     * @tc.name      testComponent0049
     * @tc.desc      Verify harComponentCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_5000
     * @tc.name      testComponent0050
     * @tc.desc      Verify harComponentCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_5100
     * @tc.name      testComponent0051
     * @tc.desc      Verify harComponentCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_5200
     * @tc.name      testComponent0052
     * @tc.desc      Verify harComponentCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_5300
     * @tc.name      testComponent0053
     * @tc.desc      Verify harComponentCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_5400
     * @tc.name      testComponent0054
     * @tc.desc      Verify harComponentCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_5500
     * @tc.name      testComponent0055
     * @tc.desc      Verify harComponentCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_5600
     * @tc.name      testComponent0056
     * @tc.desc      Verify harComponentCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_5700
     * @tc.name      testComponent0057
     * @tc.desc      Verify harComponentCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_5800
     * @tc.name      testComponent0058
     * @tc.desc      Verify harComponentCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_5900
     * @tc.name      testComponent0059
     * @tc.desc      Verify harComponentCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_6000
     * @tc.name      testComponent0060
     * @tc.desc      Verify harComponentCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_6100
     * @tc.name      testComponent0061
     * @tc.desc      Verify harComponentCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_6200
     * @tc.name      testComponent0062
     * @tc.desc      Verify harComponentCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_6300
     * @tc.name      testComponent0063
     * @tc.desc      Verify harComponentCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_6400
     * @tc.name      testComponent0064
     * @tc.desc      Verify harComponentCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_6500
     * @tc.name      testComponent0065
     * @tc.desc      Verify harComponentCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_6600
     * @tc.name      testComponent0066
     * @tc.desc      Verify harComponentCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_6700
     * @tc.name      testComponent0067
     * @tc.desc      Verify harComponentCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_6800
     * @tc.name      testComponent0068
     * @tc.desc      Verify harComponentCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_6900
     * @tc.name      testComponent0069
     * @tc.desc      Verify harComponentCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_7000
     * @tc.name      testComponent0070
     * @tc.desc      Verify harComponentCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_7100
     * @tc.name      testComponent0071
     * @tc.desc      Verify harComponentCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_7200
     * @tc.name      testComponent0072
     * @tc.desc      Verify harComponentCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_7300
     * @tc.name      testComponent0073
     * @tc.desc      Verify harComponentCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_7400
     * @tc.name      testComponent0074
     * @tc.desc      Verify harComponentCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_7500
     * @tc.name      testComponent0075
     * @tc.desc      Verify harComponentCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_7600
     * @tc.name      testComponent0076
     * @tc.desc      Verify harComponentCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_7700
     * @tc.name      testComponent0077
     * @tc.desc      Verify harComponentCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_7800
     * @tc.name      testComponent0078
     * @tc.desc      Verify harComponentCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_7900
     * @tc.name      testComponent0079
     * @tc.desc      Verify harComponentCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_8000
     * @tc.name      testComponent0080
     * @tc.desc      Verify harComponentCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_8100
     * @tc.name      testComponent0081
     * @tc.desc      Verify harComponentCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponent0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(MainPage !== undefined).assertTrue();
      expect(har.MainPage !== undefined).assertTrue();
      expect(MainPage === har.MainPage).assertTrue();
    });

  });
}
