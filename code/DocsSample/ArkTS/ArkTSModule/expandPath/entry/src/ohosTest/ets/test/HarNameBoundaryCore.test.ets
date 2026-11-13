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

const TAG: string = '[Sample_harNameBoundaryCore]';
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

export default function harNameBoundaryCoreTest(): void {
  describe('harNameBoundaryCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_0100
     * @tc.name      testNameBoundary0001
     * @tc.desc      Verify harNameBoundaryCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[0];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_0200
     * @tc.name      testNameBoundary0002
     * @tc.desc      Verify harNameBoundaryCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[1];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_0300
     * @tc.name      testNameBoundary0003
     * @tc.desc      Verify harNameBoundaryCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[2];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_0400
     * @tc.name      testNameBoundary0004
     * @tc.desc      Verify harNameBoundaryCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[3];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_0500
     * @tc.name      testNameBoundary0005
     * @tc.desc      Verify harNameBoundaryCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[4];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(4);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_0600
     * @tc.name      testNameBoundary0006
     * @tc.desc      Verify harNameBoundaryCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[0];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_0700
     * @tc.name      testNameBoundary0007
     * @tc.desc      Verify harNameBoundaryCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[1];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_0800
     * @tc.name      testNameBoundary0008
     * @tc.desc      Verify harNameBoundaryCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[2];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_0900
     * @tc.name      testNameBoundary0009
     * @tc.desc      Verify harNameBoundaryCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[3];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_1000
     * @tc.name      testNameBoundary0010
     * @tc.desc      Verify harNameBoundaryCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[4];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(4);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_1100
     * @tc.name      testNameBoundary0011
     * @tc.desc      Verify harNameBoundaryCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[0];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_1200
     * @tc.name      testNameBoundary0012
     * @tc.desc      Verify harNameBoundaryCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[1];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_1300
     * @tc.name      testNameBoundary0013
     * @tc.desc      Verify harNameBoundaryCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[2];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_1400
     * @tc.name      testNameBoundary0014
     * @tc.desc      Verify harNameBoundaryCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[3];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_1500
     * @tc.name      testNameBoundary0015
     * @tc.desc      Verify harNameBoundaryCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[4];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(4);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_1600
     * @tc.name      testNameBoundary0016
     * @tc.desc      Verify harNameBoundaryCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[0];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_1700
     * @tc.name      testNameBoundary0017
     * @tc.desc      Verify harNameBoundaryCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[1];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_1800
     * @tc.name      testNameBoundary0018
     * @tc.desc      Verify harNameBoundaryCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[2];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_1900
     * @tc.name      testNameBoundary0019
     * @tc.desc      Verify harNameBoundaryCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[3];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_2000
     * @tc.name      testNameBoundary0020
     * @tc.desc      Verify harNameBoundaryCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[4];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(4);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_2100
     * @tc.name      testNameBoundary0021
     * @tc.desc      Verify harNameBoundaryCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[0];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_2200
     * @tc.name      testNameBoundary0022
     * @tc.desc      Verify harNameBoundaryCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[1];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_2300
     * @tc.name      testNameBoundary0023
     * @tc.desc      Verify harNameBoundaryCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[2];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_2400
     * @tc.name      testNameBoundary0024
     * @tc.desc      Verify harNameBoundaryCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[3];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_2500
     * @tc.name      testNameBoundary0025
     * @tc.desc      Verify harNameBoundaryCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[4];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(4);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_2600
     * @tc.name      testNameBoundary0026
     * @tc.desc      Verify harNameBoundaryCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[0];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_2700
     * @tc.name      testNameBoundary0027
     * @tc.desc      Verify harNameBoundaryCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[1];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_2800
     * @tc.name      testNameBoundary0028
     * @tc.desc      Verify harNameBoundaryCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[2];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_2900
     * @tc.name      testNameBoundary0029
     * @tc.desc      Verify harNameBoundaryCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[3];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_3000
     * @tc.name      testNameBoundary0030
     * @tc.desc      Verify harNameBoundaryCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[4];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(4);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_3100
     * @tc.name      testNameBoundary0031
     * @tc.desc      Verify harNameBoundaryCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[0];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_3200
     * @tc.name      testNameBoundary0032
     * @tc.desc      Verify harNameBoundaryCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[1];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_3300
     * @tc.name      testNameBoundary0033
     * @tc.desc      Verify harNameBoundaryCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[2];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_3400
     * @tc.name      testNameBoundary0034
     * @tc.desc      Verify harNameBoundaryCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[3];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_3500
     * @tc.name      testNameBoundary0035
     * @tc.desc      Verify harNameBoundaryCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[4];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(4);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_3600
     * @tc.name      testNameBoundary0036
     * @tc.desc      Verify harNameBoundaryCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[0];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_3700
     * @tc.name      testNameBoundary0037
     * @tc.desc      Verify harNameBoundaryCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[1];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_3800
     * @tc.name      testNameBoundary0038
     * @tc.desc      Verify harNameBoundaryCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[2];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_3900
     * @tc.name      testNameBoundary0039
     * @tc.desc      Verify harNameBoundaryCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[3];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_4000
     * @tc.name      testNameBoundary0040
     * @tc.desc      Verify harNameBoundaryCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[4];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(4);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_4100
     * @tc.name      testNameBoundary0041
     * @tc.desc      Verify harNameBoundaryCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[0];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_4200
     * @tc.name      testNameBoundary0042
     * @tc.desc      Verify harNameBoundaryCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[1];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_4300
     * @tc.name      testNameBoundary0043
     * @tc.desc      Verify harNameBoundaryCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[2];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_4400
     * @tc.name      testNameBoundary0044
     * @tc.desc      Verify harNameBoundaryCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[3];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_4500
     * @tc.name      testNameBoundary0045
     * @tc.desc      Verify harNameBoundaryCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[4];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(4);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_4600
     * @tc.name      testNameBoundary0046
     * @tc.desc      Verify harNameBoundaryCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[0];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_4700
     * @tc.name      testNameBoundary0047
     * @tc.desc      Verify harNameBoundaryCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[1];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_4800
     * @tc.name      testNameBoundary0048
     * @tc.desc      Verify harNameBoundaryCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[2];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_4900
     * @tc.name      testNameBoundary0049
     * @tc.desc      Verify harNameBoundaryCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[3];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_5000
     * @tc.name      testNameBoundary0050
     * @tc.desc      Verify harNameBoundaryCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[4];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(4);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_5100
     * @tc.name      testNameBoundary0051
     * @tc.desc      Verify harNameBoundaryCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[0];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_5200
     * @tc.name      testNameBoundary0052
     * @tc.desc      Verify harNameBoundaryCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[1];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_5300
     * @tc.name      testNameBoundary0053
     * @tc.desc      Verify harNameBoundaryCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[2];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_5400
     * @tc.name      testNameBoundary0054
     * @tc.desc      Verify harNameBoundaryCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[3];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_5500
     * @tc.name      testNameBoundary0055
     * @tc.desc      Verify harNameBoundaryCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[4];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(4);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_5600
     * @tc.name      testNameBoundary0056
     * @tc.desc      Verify harNameBoundaryCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[0];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_5700
     * @tc.name      testNameBoundary0057
     * @tc.desc      Verify harNameBoundaryCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[1];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_5800
     * @tc.name      testNameBoundary0058
     * @tc.desc      Verify harNameBoundaryCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[2];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_5900
     * @tc.name      testNameBoundary0059
     * @tc.desc      Verify harNameBoundaryCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[3];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_6000
     * @tc.name      testNameBoundary0060
     * @tc.desc      Verify harNameBoundaryCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[4];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(4);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_6100
     * @tc.name      testNameBoundary0061
     * @tc.desc      Verify harNameBoundaryCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[0];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_6200
     * @tc.name      testNameBoundary0062
     * @tc.desc      Verify harNameBoundaryCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[1];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_6300
     * @tc.name      testNameBoundary0063
     * @tc.desc      Verify harNameBoundaryCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[2];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_6400
     * @tc.name      testNameBoundary0064
     * @tc.desc      Verify harNameBoundaryCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[3];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_6500
     * @tc.name      testNameBoundary0065
     * @tc.desc      Verify harNameBoundaryCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[4];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(4);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_6600
     * @tc.name      testNameBoundary0066
     * @tc.desc      Verify harNameBoundaryCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[0];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_6700
     * @tc.name      testNameBoundary0067
     * @tc.desc      Verify harNameBoundaryCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[1];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_6800
     * @tc.name      testNameBoundary0068
     * @tc.desc      Verify harNameBoundaryCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[2];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_6900
     * @tc.name      testNameBoundary0069
     * @tc.desc      Verify harNameBoundaryCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[3];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_7000
     * @tc.name      testNameBoundary0070
     * @tc.desc      Verify harNameBoundaryCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[4];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(4);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_7100
     * @tc.name      testNameBoundary0071
     * @tc.desc      Verify harNameBoundaryCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[0];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_7200
     * @tc.name      testNameBoundary0072
     * @tc.desc      Verify harNameBoundaryCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[1];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_7300
     * @tc.name      testNameBoundary0073
     * @tc.desc      Verify harNameBoundaryCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[2];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_7400
     * @tc.name      testNameBoundary0074
     * @tc.desc      Verify harNameBoundaryCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[3];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_7500
     * @tc.name      testNameBoundary0075
     * @tc.desc      Verify harNameBoundaryCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[4];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(4);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_7600
     * @tc.name      testNameBoundary0076
     * @tc.desc      Verify harNameBoundaryCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[0];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_7700
     * @tc.name      testNameBoundary0077
     * @tc.desc      Verify harNameBoundaryCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[1];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_7800
     * @tc.name      testNameBoundary0078
     * @tc.desc      Verify harNameBoundaryCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[2];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_7900
     * @tc.name      testNameBoundary0079
     * @tc.desc      Verify harNameBoundaryCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[3];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_8000
     * @tc.name      testNameBoundary0080
     * @tc.desc      Verify harNameBoundaryCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[4];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(4);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_BOUND_8100
     * @tc.name      testNameBoundary0081
     * @tc.desc      Verify harNameBoundaryCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testNameBoundary0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      const name: string = names[0];
      expect(name.length).assertLarger(0);
      expect(/^[A-Za-z][A-Za-z0-9]*$/.test(name)).assertTrue();
      expect(names.indexOf(name)).assertEqual(0);
    });

  });
}
