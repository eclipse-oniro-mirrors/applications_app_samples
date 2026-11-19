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

const TAG: string = '[Sample_harExportShapeCore]';
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

export default function harExportShapeCoreTest(): void {
  describe('harExportShapeCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_EXPAND_SHAPE_0100
     * @tc.name      testExportShape0001
     * @tc.desc      Verify harExportShapeCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[0];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_0200
     * @tc.name      testExportShape0002
     * @tc.desc      Verify harExportShapeCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[1];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_0300
     * @tc.name      testExportShape0003
     * @tc.desc      Verify harExportShapeCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[2];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_0400
     * @tc.name      testExportShape0004
     * @tc.desc      Verify harExportShapeCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[3];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_0500
     * @tc.name      testExportShape0005
     * @tc.desc      Verify harExportShapeCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[4];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_0600
     * @tc.name      testExportShape0006
     * @tc.desc      Verify harExportShapeCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[0];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_0700
     * @tc.name      testExportShape0007
     * @tc.desc      Verify harExportShapeCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[1];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_0800
     * @tc.name      testExportShape0008
     * @tc.desc      Verify harExportShapeCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[2];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_0900
     * @tc.name      testExportShape0009
     * @tc.desc      Verify harExportShapeCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[3];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_1000
     * @tc.name      testExportShape0010
     * @tc.desc      Verify harExportShapeCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[4];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_1100
     * @tc.name      testExportShape0011
     * @tc.desc      Verify harExportShapeCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[0];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_1200
     * @tc.name      testExportShape0012
     * @tc.desc      Verify harExportShapeCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[1];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_1300
     * @tc.name      testExportShape0013
     * @tc.desc      Verify harExportShapeCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[2];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_1400
     * @tc.name      testExportShape0014
     * @tc.desc      Verify harExportShapeCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[3];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_1500
     * @tc.name      testExportShape0015
     * @tc.desc      Verify harExportShapeCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[4];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_1600
     * @tc.name      testExportShape0016
     * @tc.desc      Verify harExportShapeCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[0];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_1700
     * @tc.name      testExportShape0017
     * @tc.desc      Verify harExportShapeCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[1];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_1800
     * @tc.name      testExportShape0018
     * @tc.desc      Verify harExportShapeCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[2];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_1900
     * @tc.name      testExportShape0019
     * @tc.desc      Verify harExportShapeCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[3];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_2000
     * @tc.name      testExportShape0020
     * @tc.desc      Verify harExportShapeCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[4];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_2100
     * @tc.name      testExportShape0021
     * @tc.desc      Verify harExportShapeCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[0];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_2200
     * @tc.name      testExportShape0022
     * @tc.desc      Verify harExportShapeCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[1];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_2300
     * @tc.name      testExportShape0023
     * @tc.desc      Verify harExportShapeCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[2];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_2400
     * @tc.name      testExportShape0024
     * @tc.desc      Verify harExportShapeCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[3];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_2500
     * @tc.name      testExportShape0025
     * @tc.desc      Verify harExportShapeCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[4];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_2600
     * @tc.name      testExportShape0026
     * @tc.desc      Verify harExportShapeCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[0];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_2700
     * @tc.name      testExportShape0027
     * @tc.desc      Verify harExportShapeCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[1];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_2800
     * @tc.name      testExportShape0028
     * @tc.desc      Verify harExportShapeCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[2];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_2900
     * @tc.name      testExportShape0029
     * @tc.desc      Verify harExportShapeCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[3];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_3000
     * @tc.name      testExportShape0030
     * @tc.desc      Verify harExportShapeCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[4];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_3100
     * @tc.name      testExportShape0031
     * @tc.desc      Verify harExportShapeCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[0];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_3200
     * @tc.name      testExportShape0032
     * @tc.desc      Verify harExportShapeCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[1];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_3300
     * @tc.name      testExportShape0033
     * @tc.desc      Verify harExportShapeCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[2];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_3400
     * @tc.name      testExportShape0034
     * @tc.desc      Verify harExportShapeCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[3];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_3500
     * @tc.name      testExportShape0035
     * @tc.desc      Verify harExportShapeCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[4];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_3600
     * @tc.name      testExportShape0036
     * @tc.desc      Verify harExportShapeCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[0];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_3700
     * @tc.name      testExportShape0037
     * @tc.desc      Verify harExportShapeCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[1];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_3800
     * @tc.name      testExportShape0038
     * @tc.desc      Verify harExportShapeCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[2];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_3900
     * @tc.name      testExportShape0039
     * @tc.desc      Verify harExportShapeCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[3];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_4000
     * @tc.name      testExportShape0040
     * @tc.desc      Verify harExportShapeCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[4];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_4100
     * @tc.name      testExportShape0041
     * @tc.desc      Verify harExportShapeCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[0];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_4200
     * @tc.name      testExportShape0042
     * @tc.desc      Verify harExportShapeCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[1];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_4300
     * @tc.name      testExportShape0043
     * @tc.desc      Verify harExportShapeCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[2];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_4400
     * @tc.name      testExportShape0044
     * @tc.desc      Verify harExportShapeCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[3];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_4500
     * @tc.name      testExportShape0045
     * @tc.desc      Verify harExportShapeCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[4];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_4600
     * @tc.name      testExportShape0046
     * @tc.desc      Verify harExportShapeCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[0];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_4700
     * @tc.name      testExportShape0047
     * @tc.desc      Verify harExportShapeCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[1];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_4800
     * @tc.name      testExportShape0048
     * @tc.desc      Verify harExportShapeCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[2];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_4900
     * @tc.name      testExportShape0049
     * @tc.desc      Verify harExportShapeCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[3];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_5000
     * @tc.name      testExportShape0050
     * @tc.desc      Verify harExportShapeCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[4];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_5100
     * @tc.name      testExportShape0051
     * @tc.desc      Verify harExportShapeCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[0];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_5200
     * @tc.name      testExportShape0052
     * @tc.desc      Verify harExportShapeCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[1];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_5300
     * @tc.name      testExportShape0053
     * @tc.desc      Verify harExportShapeCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[2];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_5400
     * @tc.name      testExportShape0054
     * @tc.desc      Verify harExportShapeCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[3];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_5500
     * @tc.name      testExportShape0055
     * @tc.desc      Verify harExportShapeCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[4];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_5600
     * @tc.name      testExportShape0056
     * @tc.desc      Verify harExportShapeCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[0];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_5700
     * @tc.name      testExportShape0057
     * @tc.desc      Verify harExportShapeCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[1];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_5800
     * @tc.name      testExportShape0058
     * @tc.desc      Verify harExportShapeCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[2];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_5900
     * @tc.name      testExportShape0059
     * @tc.desc      Verify harExportShapeCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[3];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_6000
     * @tc.name      testExportShape0060
     * @tc.desc      Verify harExportShapeCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[4];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_6100
     * @tc.name      testExportShape0061
     * @tc.desc      Verify harExportShapeCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[0];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_6200
     * @tc.name      testExportShape0062
     * @tc.desc      Verify harExportShapeCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[1];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_6300
     * @tc.name      testExportShape0063
     * @tc.desc      Verify harExportShapeCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[2];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_6400
     * @tc.name      testExportShape0064
     * @tc.desc      Verify harExportShapeCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[3];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_6500
     * @tc.name      testExportShape0065
     * @tc.desc      Verify harExportShapeCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[4];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_6600
     * @tc.name      testExportShape0066
     * @tc.desc      Verify harExportShapeCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[0];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_6700
     * @tc.name      testExportShape0067
     * @tc.desc      Verify harExportShapeCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[1];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_6800
     * @tc.name      testExportShape0068
     * @tc.desc      Verify harExportShapeCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[2];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_6900
     * @tc.name      testExportShape0069
     * @tc.desc      Verify harExportShapeCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[3];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_7000
     * @tc.name      testExportShape0070
     * @tc.desc      Verify harExportShapeCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[4];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_7100
     * @tc.name      testExportShape0071
     * @tc.desc      Verify harExportShapeCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[0];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_7200
     * @tc.name      testExportShape0072
     * @tc.desc      Verify harExportShapeCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[1];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_7300
     * @tc.name      testExportShape0073
     * @tc.desc      Verify harExportShapeCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[2];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_7400
     * @tc.name      testExportShape0074
     * @tc.desc      Verify harExportShapeCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[3];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_7500
     * @tc.name      testExportShape0075
     * @tc.desc      Verify harExportShapeCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[4];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_7600
     * @tc.name      testExportShape0076
     * @tc.desc      Verify harExportShapeCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[0];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_7700
     * @tc.name      testExportShape0077
     * @tc.desc      Verify harExportShapeCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[1];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_7800
     * @tc.name      testExportShape0078
     * @tc.desc      Verify harExportShapeCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[2];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_7900
     * @tc.name      testExportShape0079
     * @tc.desc      Verify harExportShapeCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[3];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_8000
     * @tc.name      testExportShape0080
     * @tc.desc      Verify harExportShapeCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[4];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

    /**
     * @tc.number    SUB_EXPAND_SHAPE_8100
     * @tc.name      testExportShape0081
     * @tc.desc      Verify harExportShapeCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportShape0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const values: string[] = [har.One, har.module1, har.module2, har.module3, har.module4];
      const value: string = values[0];
      expect(value.length).assertEqual(1);
      expect(value.charAt(0)).assertEqual('1');
      expect(value.charCodeAt(0)).assertEqual(49);
      expect(value.trim()).assertEqual(value);
    });

  });
}
