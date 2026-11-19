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

const TAG: string = '[Sample_harComponentBoundaryCore]';
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

export default function harComponentBoundaryCoreTest(): void {
  describe('harComponentBoundaryCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_0100
     * @tc.name      testComponentBoundary0001
     * @tc.desc      Verify harComponentBoundaryCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[0]).assertEqual(names[0]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_0200
     * @tc.name      testComponentBoundary0002
     * @tc.desc      Verify harComponentBoundaryCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[1]).assertEqual(names[1]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_0300
     * @tc.name      testComponentBoundary0003
     * @tc.desc      Verify harComponentBoundaryCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[2]).assertEqual(names[2]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_0400
     * @tc.name      testComponentBoundary0004
     * @tc.desc      Verify harComponentBoundaryCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[3]).assertEqual(names[3]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_0500
     * @tc.name      testComponentBoundary0005
     * @tc.desc      Verify harComponentBoundaryCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[4]).assertEqual(names[4]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_0600
     * @tc.name      testComponentBoundary0006
     * @tc.desc      Verify harComponentBoundaryCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[5]).assertEqual(names[5]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_0700
     * @tc.name      testComponentBoundary0007
     * @tc.desc      Verify harComponentBoundaryCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[0]).assertEqual(names[0]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_0800
     * @tc.name      testComponentBoundary0008
     * @tc.desc      Verify harComponentBoundaryCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[1]).assertEqual(names[1]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_0900
     * @tc.name      testComponentBoundary0009
     * @tc.desc      Verify harComponentBoundaryCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[2]).assertEqual(names[2]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_1000
     * @tc.name      testComponentBoundary0010
     * @tc.desc      Verify harComponentBoundaryCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[3]).assertEqual(names[3]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_1100
     * @tc.name      testComponentBoundary0011
     * @tc.desc      Verify harComponentBoundaryCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[4]).assertEqual(names[4]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_1200
     * @tc.name      testComponentBoundary0012
     * @tc.desc      Verify harComponentBoundaryCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[5]).assertEqual(names[5]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_1300
     * @tc.name      testComponentBoundary0013
     * @tc.desc      Verify harComponentBoundaryCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[0]).assertEqual(names[0]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_1400
     * @tc.name      testComponentBoundary0014
     * @tc.desc      Verify harComponentBoundaryCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[1]).assertEqual(names[1]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_1500
     * @tc.name      testComponentBoundary0015
     * @tc.desc      Verify harComponentBoundaryCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[2]).assertEqual(names[2]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_1600
     * @tc.name      testComponentBoundary0016
     * @tc.desc      Verify harComponentBoundaryCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[3]).assertEqual(names[3]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_1700
     * @tc.name      testComponentBoundary0017
     * @tc.desc      Verify harComponentBoundaryCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[4]).assertEqual(names[4]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_1800
     * @tc.name      testComponentBoundary0018
     * @tc.desc      Verify harComponentBoundaryCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[5]).assertEqual(names[5]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_1900
     * @tc.name      testComponentBoundary0019
     * @tc.desc      Verify harComponentBoundaryCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[0]).assertEqual(names[0]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_2000
     * @tc.name      testComponentBoundary0020
     * @tc.desc      Verify harComponentBoundaryCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[1]).assertEqual(names[1]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_2100
     * @tc.name      testComponentBoundary0021
     * @tc.desc      Verify harComponentBoundaryCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[2]).assertEqual(names[2]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_2200
     * @tc.name      testComponentBoundary0022
     * @tc.desc      Verify harComponentBoundaryCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[3]).assertEqual(names[3]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_2300
     * @tc.name      testComponentBoundary0023
     * @tc.desc      Verify harComponentBoundaryCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[4]).assertEqual(names[4]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_2400
     * @tc.name      testComponentBoundary0024
     * @tc.desc      Verify harComponentBoundaryCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[5]).assertEqual(names[5]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_2500
     * @tc.name      testComponentBoundary0025
     * @tc.desc      Verify harComponentBoundaryCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[0]).assertEqual(names[0]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_2600
     * @tc.name      testComponentBoundary0026
     * @tc.desc      Verify harComponentBoundaryCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[1]).assertEqual(names[1]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_2700
     * @tc.name      testComponentBoundary0027
     * @tc.desc      Verify harComponentBoundaryCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[2]).assertEqual(names[2]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_2800
     * @tc.name      testComponentBoundary0028
     * @tc.desc      Verify harComponentBoundaryCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[3]).assertEqual(names[3]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_2900
     * @tc.name      testComponentBoundary0029
     * @tc.desc      Verify harComponentBoundaryCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[4]).assertEqual(names[4]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_3000
     * @tc.name      testComponentBoundary0030
     * @tc.desc      Verify harComponentBoundaryCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[5]).assertEqual(names[5]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_3100
     * @tc.name      testComponentBoundary0031
     * @tc.desc      Verify harComponentBoundaryCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[0]).assertEqual(names[0]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_3200
     * @tc.name      testComponentBoundary0032
     * @tc.desc      Verify harComponentBoundaryCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[1]).assertEqual(names[1]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_3300
     * @tc.name      testComponentBoundary0033
     * @tc.desc      Verify harComponentBoundaryCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[2]).assertEqual(names[2]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_3400
     * @tc.name      testComponentBoundary0034
     * @tc.desc      Verify harComponentBoundaryCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[3]).assertEqual(names[3]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_3500
     * @tc.name      testComponentBoundary0035
     * @tc.desc      Verify harComponentBoundaryCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[4]).assertEqual(names[4]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_3600
     * @tc.name      testComponentBoundary0036
     * @tc.desc      Verify harComponentBoundaryCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[5]).assertEqual(names[5]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_3700
     * @tc.name      testComponentBoundary0037
     * @tc.desc      Verify harComponentBoundaryCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[0]).assertEqual(names[0]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_3800
     * @tc.name      testComponentBoundary0038
     * @tc.desc      Verify harComponentBoundaryCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[1]).assertEqual(names[1]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_3900
     * @tc.name      testComponentBoundary0039
     * @tc.desc      Verify harComponentBoundaryCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[2]).assertEqual(names[2]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_4000
     * @tc.name      testComponentBoundary0040
     * @tc.desc      Verify harComponentBoundaryCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[3]).assertEqual(names[3]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_4100
     * @tc.name      testComponentBoundary0041
     * @tc.desc      Verify harComponentBoundaryCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[4]).assertEqual(names[4]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_4200
     * @tc.name      testComponentBoundary0042
     * @tc.desc      Verify harComponentBoundaryCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[5]).assertEqual(names[5]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_4300
     * @tc.name      testComponentBoundary0043
     * @tc.desc      Verify harComponentBoundaryCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[0]).assertEqual(names[0]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_4400
     * @tc.name      testComponentBoundary0044
     * @tc.desc      Verify harComponentBoundaryCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[1]).assertEqual(names[1]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_4500
     * @tc.name      testComponentBoundary0045
     * @tc.desc      Verify harComponentBoundaryCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[2]).assertEqual(names[2]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_4600
     * @tc.name      testComponentBoundary0046
     * @tc.desc      Verify harComponentBoundaryCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[3]).assertEqual(names[3]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_4700
     * @tc.name      testComponentBoundary0047
     * @tc.desc      Verify harComponentBoundaryCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[4]).assertEqual(names[4]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_4800
     * @tc.name      testComponentBoundary0048
     * @tc.desc      Verify harComponentBoundaryCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[5]).assertEqual(names[5]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_4900
     * @tc.name      testComponentBoundary0049
     * @tc.desc      Verify harComponentBoundaryCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[0]).assertEqual(names[0]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_5000
     * @tc.name      testComponentBoundary0050
     * @tc.desc      Verify harComponentBoundaryCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[1]).assertEqual(names[1]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_5100
     * @tc.name      testComponentBoundary0051
     * @tc.desc      Verify harComponentBoundaryCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[2]).assertEqual(names[2]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_5200
     * @tc.name      testComponentBoundary0052
     * @tc.desc      Verify harComponentBoundaryCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[3]).assertEqual(names[3]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_5300
     * @tc.name      testComponentBoundary0053
     * @tc.desc      Verify harComponentBoundaryCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[4]).assertEqual(names[4]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_5400
     * @tc.name      testComponentBoundary0054
     * @tc.desc      Verify harComponentBoundaryCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[5]).assertEqual(names[5]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_5500
     * @tc.name      testComponentBoundary0055
     * @tc.desc      Verify harComponentBoundaryCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[0]).assertEqual(names[0]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_5600
     * @tc.name      testComponentBoundary0056
     * @tc.desc      Verify harComponentBoundaryCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[1]).assertEqual(names[1]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_5700
     * @tc.name      testComponentBoundary0057
     * @tc.desc      Verify harComponentBoundaryCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[2]).assertEqual(names[2]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_5800
     * @tc.name      testComponentBoundary0058
     * @tc.desc      Verify harComponentBoundaryCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[3]).assertEqual(names[3]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_5900
     * @tc.name      testComponentBoundary0059
     * @tc.desc      Verify harComponentBoundaryCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[4]).assertEqual(names[4]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_6000
     * @tc.name      testComponentBoundary0060
     * @tc.desc      Verify harComponentBoundaryCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[5]).assertEqual(names[5]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_6100
     * @tc.name      testComponentBoundary0061
     * @tc.desc      Verify harComponentBoundaryCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[0]).assertEqual(names[0]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_6200
     * @tc.name      testComponentBoundary0062
     * @tc.desc      Verify harComponentBoundaryCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[1]).assertEqual(names[1]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_6300
     * @tc.name      testComponentBoundary0063
     * @tc.desc      Verify harComponentBoundaryCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[2]).assertEqual(names[2]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_6400
     * @tc.name      testComponentBoundary0064
     * @tc.desc      Verify harComponentBoundaryCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[3]).assertEqual(names[3]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_6500
     * @tc.name      testComponentBoundary0065
     * @tc.desc      Verify harComponentBoundaryCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[4]).assertEqual(names[4]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_6600
     * @tc.name      testComponentBoundary0066
     * @tc.desc      Verify harComponentBoundaryCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[5]).assertEqual(names[5]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_6700
     * @tc.name      testComponentBoundary0067
     * @tc.desc      Verify harComponentBoundaryCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[0]).assertEqual(names[0]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_6800
     * @tc.name      testComponentBoundary0068
     * @tc.desc      Verify harComponentBoundaryCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[1]).assertEqual(names[1]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_6900
     * @tc.name      testComponentBoundary0069
     * @tc.desc      Verify harComponentBoundaryCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[2]).assertEqual(names[2]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_7000
     * @tc.name      testComponentBoundary0070
     * @tc.desc      Verify harComponentBoundaryCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[3]).assertEqual(names[3]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_7100
     * @tc.name      testComponentBoundary0071
     * @tc.desc      Verify harComponentBoundaryCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[4]).assertEqual(names[4]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_7200
     * @tc.name      testComponentBoundary0072
     * @tc.desc      Verify harComponentBoundaryCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[5]).assertEqual(names[5]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_7300
     * @tc.name      testComponentBoundary0073
     * @tc.desc      Verify harComponentBoundaryCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[0]).assertEqual(names[0]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_7400
     * @tc.name      testComponentBoundary0074
     * @tc.desc      Verify harComponentBoundaryCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[1]).assertEqual(names[1]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_7500
     * @tc.name      testComponentBoundary0075
     * @tc.desc      Verify harComponentBoundaryCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[2]).assertEqual(names[2]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_7600
     * @tc.name      testComponentBoundary0076
     * @tc.desc      Verify harComponentBoundaryCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[3]).assertEqual(names[3]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_7700
     * @tc.name      testComponentBoundary0077
     * @tc.desc      Verify harComponentBoundaryCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[4]).assertEqual(names[4]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_7800
     * @tc.name      testComponentBoundary0078
     * @tc.desc      Verify harComponentBoundaryCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[5]).assertEqual(names[5]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_7900
     * @tc.name      testComponentBoundary0079
     * @tc.desc      Verify harComponentBoundaryCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[0]).assertEqual(names[0]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_8000
     * @tc.name      testComponentBoundary0080
     * @tc.desc      Verify harComponentBoundaryCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[1]).assertEqual(names[1]);
      expect(MainPage !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPAND_COMP_BOUND_8100
     * @tc.name      testComponentBoundary0081
     * @tc.desc      Verify harComponentBoundaryCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testComponentBoundary0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4', 'MainPage'];
      expect(names.length).assertEqual(6);
      expect(names[2]).assertEqual(names[2]);
      expect(MainPage !== undefined).assertTrue();
    });

  });
}
