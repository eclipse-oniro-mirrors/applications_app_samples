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

const TAG: string = '[Sample_harExportNameCore]';
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

export default function harExportNameCoreTest(): void {
  describe('harExportNameCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_EXPAND_NAME_0100
     * @tc.name      testExportName0001
     * @tc.desc      Verify harExportNameCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[0]).assertEqual(names[0]);
      expect(names.indexOf(names[0])).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_0200
     * @tc.name      testExportName0002
     * @tc.desc      Verify harExportNameCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[1]).assertEqual(names[1]);
      expect(names.indexOf(names[1])).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_0300
     * @tc.name      testExportName0003
     * @tc.desc      Verify harExportNameCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[2]).assertEqual(names[2]);
      expect(names.indexOf(names[2])).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_0400
     * @tc.name      testExportName0004
     * @tc.desc      Verify harExportNameCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[3]).assertEqual(names[3]);
      expect(names.indexOf(names[3])).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_0500
     * @tc.name      testExportName0005
     * @tc.desc      Verify harExportNameCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[4]).assertEqual(names[4]);
      expect(names.indexOf(names[4])).assertEqual(4);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_0600
     * @tc.name      testExportName0006
     * @tc.desc      Verify harExportNameCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[0]).assertEqual(names[0]);
      expect(names.indexOf(names[0])).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_0700
     * @tc.name      testExportName0007
     * @tc.desc      Verify harExportNameCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[1]).assertEqual(names[1]);
      expect(names.indexOf(names[1])).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_0800
     * @tc.name      testExportName0008
     * @tc.desc      Verify harExportNameCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[2]).assertEqual(names[2]);
      expect(names.indexOf(names[2])).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_0900
     * @tc.name      testExportName0009
     * @tc.desc      Verify harExportNameCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[3]).assertEqual(names[3]);
      expect(names.indexOf(names[3])).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_1000
     * @tc.name      testExportName0010
     * @tc.desc      Verify harExportNameCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[4]).assertEqual(names[4]);
      expect(names.indexOf(names[4])).assertEqual(4);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_1100
     * @tc.name      testExportName0011
     * @tc.desc      Verify harExportNameCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[0]).assertEqual(names[0]);
      expect(names.indexOf(names[0])).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_1200
     * @tc.name      testExportName0012
     * @tc.desc      Verify harExportNameCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[1]).assertEqual(names[1]);
      expect(names.indexOf(names[1])).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_1300
     * @tc.name      testExportName0013
     * @tc.desc      Verify harExportNameCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[2]).assertEqual(names[2]);
      expect(names.indexOf(names[2])).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_1400
     * @tc.name      testExportName0014
     * @tc.desc      Verify harExportNameCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[3]).assertEqual(names[3]);
      expect(names.indexOf(names[3])).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_1500
     * @tc.name      testExportName0015
     * @tc.desc      Verify harExportNameCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[4]).assertEqual(names[4]);
      expect(names.indexOf(names[4])).assertEqual(4);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_1600
     * @tc.name      testExportName0016
     * @tc.desc      Verify harExportNameCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[0]).assertEqual(names[0]);
      expect(names.indexOf(names[0])).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_1700
     * @tc.name      testExportName0017
     * @tc.desc      Verify harExportNameCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[1]).assertEqual(names[1]);
      expect(names.indexOf(names[1])).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_1800
     * @tc.name      testExportName0018
     * @tc.desc      Verify harExportNameCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[2]).assertEqual(names[2]);
      expect(names.indexOf(names[2])).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_1900
     * @tc.name      testExportName0019
     * @tc.desc      Verify harExportNameCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[3]).assertEqual(names[3]);
      expect(names.indexOf(names[3])).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_2000
     * @tc.name      testExportName0020
     * @tc.desc      Verify harExportNameCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[4]).assertEqual(names[4]);
      expect(names.indexOf(names[4])).assertEqual(4);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_2100
     * @tc.name      testExportName0021
     * @tc.desc      Verify harExportNameCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[0]).assertEqual(names[0]);
      expect(names.indexOf(names[0])).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_2200
     * @tc.name      testExportName0022
     * @tc.desc      Verify harExportNameCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[1]).assertEqual(names[1]);
      expect(names.indexOf(names[1])).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_2300
     * @tc.name      testExportName0023
     * @tc.desc      Verify harExportNameCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[2]).assertEqual(names[2]);
      expect(names.indexOf(names[2])).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_2400
     * @tc.name      testExportName0024
     * @tc.desc      Verify harExportNameCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[3]).assertEqual(names[3]);
      expect(names.indexOf(names[3])).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_2500
     * @tc.name      testExportName0025
     * @tc.desc      Verify harExportNameCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[4]).assertEqual(names[4]);
      expect(names.indexOf(names[4])).assertEqual(4);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_2600
     * @tc.name      testExportName0026
     * @tc.desc      Verify harExportNameCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[0]).assertEqual(names[0]);
      expect(names.indexOf(names[0])).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_2700
     * @tc.name      testExportName0027
     * @tc.desc      Verify harExportNameCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[1]).assertEqual(names[1]);
      expect(names.indexOf(names[1])).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_2800
     * @tc.name      testExportName0028
     * @tc.desc      Verify harExportNameCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[2]).assertEqual(names[2]);
      expect(names.indexOf(names[2])).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_2900
     * @tc.name      testExportName0029
     * @tc.desc      Verify harExportNameCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[3]).assertEqual(names[3]);
      expect(names.indexOf(names[3])).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_3000
     * @tc.name      testExportName0030
     * @tc.desc      Verify harExportNameCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[4]).assertEqual(names[4]);
      expect(names.indexOf(names[4])).assertEqual(4);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_3100
     * @tc.name      testExportName0031
     * @tc.desc      Verify harExportNameCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[0]).assertEqual(names[0]);
      expect(names.indexOf(names[0])).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_3200
     * @tc.name      testExportName0032
     * @tc.desc      Verify harExportNameCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[1]).assertEqual(names[1]);
      expect(names.indexOf(names[1])).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_3300
     * @tc.name      testExportName0033
     * @tc.desc      Verify harExportNameCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[2]).assertEqual(names[2]);
      expect(names.indexOf(names[2])).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_3400
     * @tc.name      testExportName0034
     * @tc.desc      Verify harExportNameCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[3]).assertEqual(names[3]);
      expect(names.indexOf(names[3])).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_3500
     * @tc.name      testExportName0035
     * @tc.desc      Verify harExportNameCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[4]).assertEqual(names[4]);
      expect(names.indexOf(names[4])).assertEqual(4);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_3600
     * @tc.name      testExportName0036
     * @tc.desc      Verify harExportNameCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[0]).assertEqual(names[0]);
      expect(names.indexOf(names[0])).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_3700
     * @tc.name      testExportName0037
     * @tc.desc      Verify harExportNameCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[1]).assertEqual(names[1]);
      expect(names.indexOf(names[1])).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_3800
     * @tc.name      testExportName0038
     * @tc.desc      Verify harExportNameCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[2]).assertEqual(names[2]);
      expect(names.indexOf(names[2])).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_3900
     * @tc.name      testExportName0039
     * @tc.desc      Verify harExportNameCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[3]).assertEqual(names[3]);
      expect(names.indexOf(names[3])).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_4000
     * @tc.name      testExportName0040
     * @tc.desc      Verify harExportNameCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[4]).assertEqual(names[4]);
      expect(names.indexOf(names[4])).assertEqual(4);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_4100
     * @tc.name      testExportName0041
     * @tc.desc      Verify harExportNameCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[0]).assertEqual(names[0]);
      expect(names.indexOf(names[0])).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_4200
     * @tc.name      testExportName0042
     * @tc.desc      Verify harExportNameCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[1]).assertEqual(names[1]);
      expect(names.indexOf(names[1])).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_4300
     * @tc.name      testExportName0043
     * @tc.desc      Verify harExportNameCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[2]).assertEqual(names[2]);
      expect(names.indexOf(names[2])).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_4400
     * @tc.name      testExportName0044
     * @tc.desc      Verify harExportNameCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[3]).assertEqual(names[3]);
      expect(names.indexOf(names[3])).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_4500
     * @tc.name      testExportName0045
     * @tc.desc      Verify harExportNameCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[4]).assertEqual(names[4]);
      expect(names.indexOf(names[4])).assertEqual(4);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_4600
     * @tc.name      testExportName0046
     * @tc.desc      Verify harExportNameCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[0]).assertEqual(names[0]);
      expect(names.indexOf(names[0])).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_4700
     * @tc.name      testExportName0047
     * @tc.desc      Verify harExportNameCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[1]).assertEqual(names[1]);
      expect(names.indexOf(names[1])).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_4800
     * @tc.name      testExportName0048
     * @tc.desc      Verify harExportNameCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[2]).assertEqual(names[2]);
      expect(names.indexOf(names[2])).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_4900
     * @tc.name      testExportName0049
     * @tc.desc      Verify harExportNameCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[3]).assertEqual(names[3]);
      expect(names.indexOf(names[3])).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_5000
     * @tc.name      testExportName0050
     * @tc.desc      Verify harExportNameCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[4]).assertEqual(names[4]);
      expect(names.indexOf(names[4])).assertEqual(4);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_5100
     * @tc.name      testExportName0051
     * @tc.desc      Verify harExportNameCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[0]).assertEqual(names[0]);
      expect(names.indexOf(names[0])).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_5200
     * @tc.name      testExportName0052
     * @tc.desc      Verify harExportNameCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[1]).assertEqual(names[1]);
      expect(names.indexOf(names[1])).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_5300
     * @tc.name      testExportName0053
     * @tc.desc      Verify harExportNameCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[2]).assertEqual(names[2]);
      expect(names.indexOf(names[2])).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_5400
     * @tc.name      testExportName0054
     * @tc.desc      Verify harExportNameCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[3]).assertEqual(names[3]);
      expect(names.indexOf(names[3])).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_5500
     * @tc.name      testExportName0055
     * @tc.desc      Verify harExportNameCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[4]).assertEqual(names[4]);
      expect(names.indexOf(names[4])).assertEqual(4);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_5600
     * @tc.name      testExportName0056
     * @tc.desc      Verify harExportNameCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[0]).assertEqual(names[0]);
      expect(names.indexOf(names[0])).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_5700
     * @tc.name      testExportName0057
     * @tc.desc      Verify harExportNameCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[1]).assertEqual(names[1]);
      expect(names.indexOf(names[1])).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_5800
     * @tc.name      testExportName0058
     * @tc.desc      Verify harExportNameCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[2]).assertEqual(names[2]);
      expect(names.indexOf(names[2])).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_5900
     * @tc.name      testExportName0059
     * @tc.desc      Verify harExportNameCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[3]).assertEqual(names[3]);
      expect(names.indexOf(names[3])).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_6000
     * @tc.name      testExportName0060
     * @tc.desc      Verify harExportNameCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[4]).assertEqual(names[4]);
      expect(names.indexOf(names[4])).assertEqual(4);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_6100
     * @tc.name      testExportName0061
     * @tc.desc      Verify harExportNameCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[0]).assertEqual(names[0]);
      expect(names.indexOf(names[0])).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_6200
     * @tc.name      testExportName0062
     * @tc.desc      Verify harExportNameCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[1]).assertEqual(names[1]);
      expect(names.indexOf(names[1])).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_6300
     * @tc.name      testExportName0063
     * @tc.desc      Verify harExportNameCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[2]).assertEqual(names[2]);
      expect(names.indexOf(names[2])).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_6400
     * @tc.name      testExportName0064
     * @tc.desc      Verify harExportNameCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[3]).assertEqual(names[3]);
      expect(names.indexOf(names[3])).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_6500
     * @tc.name      testExportName0065
     * @tc.desc      Verify harExportNameCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[4]).assertEqual(names[4]);
      expect(names.indexOf(names[4])).assertEqual(4);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_6600
     * @tc.name      testExportName0066
     * @tc.desc      Verify harExportNameCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[0]).assertEqual(names[0]);
      expect(names.indexOf(names[0])).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_6700
     * @tc.name      testExportName0067
     * @tc.desc      Verify harExportNameCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[1]).assertEqual(names[1]);
      expect(names.indexOf(names[1])).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_6800
     * @tc.name      testExportName0068
     * @tc.desc      Verify harExportNameCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[2]).assertEqual(names[2]);
      expect(names.indexOf(names[2])).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_6900
     * @tc.name      testExportName0069
     * @tc.desc      Verify harExportNameCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[3]).assertEqual(names[3]);
      expect(names.indexOf(names[3])).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_7000
     * @tc.name      testExportName0070
     * @tc.desc      Verify harExportNameCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[4]).assertEqual(names[4]);
      expect(names.indexOf(names[4])).assertEqual(4);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_7100
     * @tc.name      testExportName0071
     * @tc.desc      Verify harExportNameCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[0]).assertEqual(names[0]);
      expect(names.indexOf(names[0])).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_7200
     * @tc.name      testExportName0072
     * @tc.desc      Verify harExportNameCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[1]).assertEqual(names[1]);
      expect(names.indexOf(names[1])).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_7300
     * @tc.name      testExportName0073
     * @tc.desc      Verify harExportNameCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[2]).assertEqual(names[2]);
      expect(names.indexOf(names[2])).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_7400
     * @tc.name      testExportName0074
     * @tc.desc      Verify harExportNameCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[3]).assertEqual(names[3]);
      expect(names.indexOf(names[3])).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_7500
     * @tc.name      testExportName0075
     * @tc.desc      Verify harExportNameCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[4]).assertEqual(names[4]);
      expect(names.indexOf(names[4])).assertEqual(4);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_7600
     * @tc.name      testExportName0076
     * @tc.desc      Verify harExportNameCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[0]).assertEqual(names[0]);
      expect(names.indexOf(names[0])).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_7700
     * @tc.name      testExportName0077
     * @tc.desc      Verify harExportNameCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[1]).assertEqual(names[1]);
      expect(names.indexOf(names[1])).assertEqual(1);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_7800
     * @tc.name      testExportName0078
     * @tc.desc      Verify harExportNameCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[2]).assertEqual(names[2]);
      expect(names.indexOf(names[2])).assertEqual(2);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_7900
     * @tc.name      testExportName0079
     * @tc.desc      Verify harExportNameCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[3]).assertEqual(names[3]);
      expect(names.indexOf(names[3])).assertEqual(3);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_8000
     * @tc.name      testExportName0080
     * @tc.desc      Verify harExportNameCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[4]).assertEqual(names[4]);
      expect(names.indexOf(names[4])).assertEqual(4);
    });

    /**
     * @tc.number    SUB_EXPAND_NAME_8100
     * @tc.name      testExportName0081
     * @tc.desc      Verify harExportNameCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testExportName0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const names: string[] = ['One', 'module1', 'module2', 'module3', 'module4'];
      expect(names.length).assertEqual(5);
      expect(names[0]).assertEqual(names[0]);
      expect(names.indexOf(names[0])).assertEqual(0);
    });

  });
}
