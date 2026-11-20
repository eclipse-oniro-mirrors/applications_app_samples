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

const TAG: string = '[Sample_harExportTypeCore]';
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

export default function harExportTypeCoreTest(): void {
  describe('harExportTypeCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_EXPAND_TYPE_0100
     * @tc.name      testExportType0001
     * @tc.desc      Verify harExportTypeCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[0]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_0200
     * @tc.name      testExportType0002
     * @tc.desc      Verify harExportTypeCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[1]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_0300
     * @tc.name      testExportType0003
     * @tc.desc      Verify harExportTypeCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[2]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_0400
     * @tc.name      testExportType0004
     * @tc.desc      Verify harExportTypeCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[3]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_0500
     * @tc.name      testExportType0005
     * @tc.desc      Verify harExportTypeCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[4]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_0600
     * @tc.name      testExportType0006
     * @tc.desc      Verify harExportTypeCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[0]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_0700
     * @tc.name      testExportType0007
     * @tc.desc      Verify harExportTypeCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[1]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_0800
     * @tc.name      testExportType0008
     * @tc.desc      Verify harExportTypeCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[2]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_0900
     * @tc.name      testExportType0009
     * @tc.desc      Verify harExportTypeCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[3]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_1000
     * @tc.name      testExportType0010
     * @tc.desc      Verify harExportTypeCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[4]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_1100
     * @tc.name      testExportType0011
     * @tc.desc      Verify harExportTypeCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[0]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_1200
     * @tc.name      testExportType0012
     * @tc.desc      Verify harExportTypeCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[1]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_1300
     * @tc.name      testExportType0013
     * @tc.desc      Verify harExportTypeCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[2]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_1400
     * @tc.name      testExportType0014
     * @tc.desc      Verify harExportTypeCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[3]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_1500
     * @tc.name      testExportType0015
     * @tc.desc      Verify harExportTypeCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[4]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_1600
     * @tc.name      testExportType0016
     * @tc.desc      Verify harExportTypeCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[0]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_1700
     * @tc.name      testExportType0017
     * @tc.desc      Verify harExportTypeCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[1]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_1800
     * @tc.name      testExportType0018
     * @tc.desc      Verify harExportTypeCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[2]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_1900
     * @tc.name      testExportType0019
     * @tc.desc      Verify harExportTypeCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[3]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_2000
     * @tc.name      testExportType0020
     * @tc.desc      Verify harExportTypeCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[4]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_2100
     * @tc.name      testExportType0021
     * @tc.desc      Verify harExportTypeCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[0]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_2200
     * @tc.name      testExportType0022
     * @tc.desc      Verify harExportTypeCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[1]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_2300
     * @tc.name      testExportType0023
     * @tc.desc      Verify harExportTypeCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[2]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_2400
     * @tc.name      testExportType0024
     * @tc.desc      Verify harExportTypeCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[3]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_2500
     * @tc.name      testExportType0025
     * @tc.desc      Verify harExportTypeCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[4]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_2600
     * @tc.name      testExportType0026
     * @tc.desc      Verify harExportTypeCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[0]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_2700
     * @tc.name      testExportType0027
     * @tc.desc      Verify harExportTypeCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[1]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_2800
     * @tc.name      testExportType0028
     * @tc.desc      Verify harExportTypeCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[2]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_2900
     * @tc.name      testExportType0029
     * @tc.desc      Verify harExportTypeCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[3]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_3000
     * @tc.name      testExportType0030
     * @tc.desc      Verify harExportTypeCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[4]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_3100
     * @tc.name      testExportType0031
     * @tc.desc      Verify harExportTypeCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[0]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_3200
     * @tc.name      testExportType0032
     * @tc.desc      Verify harExportTypeCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[1]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_3300
     * @tc.name      testExportType0033
     * @tc.desc      Verify harExportTypeCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[2]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_3400
     * @tc.name      testExportType0034
     * @tc.desc      Verify harExportTypeCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[3]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_3500
     * @tc.name      testExportType0035
     * @tc.desc      Verify harExportTypeCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[4]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_3600
     * @tc.name      testExportType0036
     * @tc.desc      Verify harExportTypeCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[0]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_3700
     * @tc.name      testExportType0037
     * @tc.desc      Verify harExportTypeCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[1]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_3800
     * @tc.name      testExportType0038
     * @tc.desc      Verify harExportTypeCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[2]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_3900
     * @tc.name      testExportType0039
     * @tc.desc      Verify harExportTypeCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[3]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_4000
     * @tc.name      testExportType0040
     * @tc.desc      Verify harExportTypeCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[4]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_4100
     * @tc.name      testExportType0041
     * @tc.desc      Verify harExportTypeCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[0]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_4200
     * @tc.name      testExportType0042
     * @tc.desc      Verify harExportTypeCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[1]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_4300
     * @tc.name      testExportType0043
     * @tc.desc      Verify harExportTypeCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[2]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_4400
     * @tc.name      testExportType0044
     * @tc.desc      Verify harExportTypeCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[3]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_4500
     * @tc.name      testExportType0045
     * @tc.desc      Verify harExportTypeCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[4]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_4600
     * @tc.name      testExportType0046
     * @tc.desc      Verify harExportTypeCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[0]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_4700
     * @tc.name      testExportType0047
     * @tc.desc      Verify harExportTypeCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[1]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_4800
     * @tc.name      testExportType0048
     * @tc.desc      Verify harExportTypeCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[2]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_4900
     * @tc.name      testExportType0049
     * @tc.desc      Verify harExportTypeCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[3]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_5000
     * @tc.name      testExportType0050
     * @tc.desc      Verify harExportTypeCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[4]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_5100
     * @tc.name      testExportType0051
     * @tc.desc      Verify harExportTypeCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[0]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_5200
     * @tc.name      testExportType0052
     * @tc.desc      Verify harExportTypeCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[1]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_5300
     * @tc.name      testExportType0053
     * @tc.desc      Verify harExportTypeCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[2]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_5400
     * @tc.name      testExportType0054
     * @tc.desc      Verify harExportTypeCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[3]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_5500
     * @tc.name      testExportType0055
     * @tc.desc      Verify harExportTypeCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[4]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_5600
     * @tc.name      testExportType0056
     * @tc.desc      Verify harExportTypeCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[0]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_5700
     * @tc.name      testExportType0057
     * @tc.desc      Verify harExportTypeCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[1]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_5800
     * @tc.name      testExportType0058
     * @tc.desc      Verify harExportTypeCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[2]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_5900
     * @tc.name      testExportType0059
     * @tc.desc      Verify harExportTypeCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[3]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_6000
     * @tc.name      testExportType0060
     * @tc.desc      Verify harExportTypeCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[4]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_6100
     * @tc.name      testExportType0061
     * @tc.desc      Verify harExportTypeCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[0]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_6200
     * @tc.name      testExportType0062
     * @tc.desc      Verify harExportTypeCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[1]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_6300
     * @tc.name      testExportType0063
     * @tc.desc      Verify harExportTypeCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[2]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_6400
     * @tc.name      testExportType0064
     * @tc.desc      Verify harExportTypeCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[3]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_6500
     * @tc.name      testExportType0065
     * @tc.desc      Verify harExportTypeCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[4]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_6600
     * @tc.name      testExportType0066
     * @tc.desc      Verify harExportTypeCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[0]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_6700
     * @tc.name      testExportType0067
     * @tc.desc      Verify harExportTypeCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[1]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_6800
     * @tc.name      testExportType0068
     * @tc.desc      Verify harExportTypeCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[2]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_6900
     * @tc.name      testExportType0069
     * @tc.desc      Verify harExportTypeCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[3]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_7000
     * @tc.name      testExportType0070
     * @tc.desc      Verify harExportTypeCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[4]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_7100
     * @tc.name      testExportType0071
     * @tc.desc      Verify harExportTypeCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[0]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_7200
     * @tc.name      testExportType0072
     * @tc.desc      Verify harExportTypeCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[1]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_7300
     * @tc.name      testExportType0073
     * @tc.desc      Verify harExportTypeCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[2]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_7400
     * @tc.name      testExportType0074
     * @tc.desc      Verify harExportTypeCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[3]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_7500
     * @tc.name      testExportType0075
     * @tc.desc      Verify harExportTypeCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[4]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_7600
     * @tc.name      testExportType0076
     * @tc.desc      Verify harExportTypeCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[0]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_7700
     * @tc.name      testExportType0077
     * @tc.desc      Verify harExportTypeCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[1]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_7800
     * @tc.name      testExportType0078
     * @tc.desc      Verify harExportTypeCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[2]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_7900
     * @tc.name      testExportType0079
     * @tc.desc      Verify harExportTypeCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[3]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_8000
     * @tc.name      testExportType0080
     * @tc.desc      Verify harExportTypeCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[4]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

    /**
     * @tc.number    SUB_EXPAND_TYPE_8100
     * @tc.name      testExportType0081
     * @tc.desc      Verify harExportTypeCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportType0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      expect(typeof values[0]).assertEqual('string');
      expect(typeof har.One).assertEqual('string');
    });

  });
}
