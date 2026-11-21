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

import { describe, beforeAll, afterAll, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Utils } from '../../../main/ets/utils/Utils';
import { logCase } from './shared/TestLog';

import { paceTurn } from './shared/TestPace';

export default function utilsMatrixTest() {
  describe('utilsMatrixTest', () => {
  beforeEach(async () => {
    await paceTurn();
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_UTIL_0001
   * @tc.name      testUtils0001
   * @tc.desc      Utils max count is ten thousand
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testUtils0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testUtils0001', 'utils max');
    expect(Utils.maxNum).assertEqual(10000);
    expect(Number.isInteger(Utils.maxNum)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_UTIL_0002
   * @tc.name      testUtils0002
   * @tc.desc      Utils counter starts from zero after reset
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testUtils0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testUtils0002', 'utils reset');
    Utils.Reset();
    expect(Utils.num).assertEqual(0);
    expect(typeof Utils.num).assertEqual('number');
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_UTIL_0003
   * @tc.name      testUtils0003
   * @tc.desc      Utils calculation reaches the max count
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testUtils0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testUtils0003', 'utils once');
    Utils.Reset();
    Utils.CalculateTest();
    expect(Utils.num).assertEqual(10000);
    expect(Number.isInteger(Utils.num)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_UTIL_0004
   * @tc.name      testUtils0004
   * @tc.desc      Utils calculation 2 times accumulates
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testUtils0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testUtils0004', 'utils run 2');
    Utils.Reset();
    for (let i: number = 0; i < 2; i++) {
      Utils.CalculateTest();
    }
    expect(Utils.num).assertEqual(20000);
    expect(Utils.num / 10000).assertEqual(2);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_UTIL_0005
   * @tc.name      testUtils0005
   * @tc.desc      Utils calculation 3 times accumulates
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testUtils0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testUtils0005', 'utils run 3');
    Utils.Reset();
    for (let i: number = 0; i < 3; i++) {
      Utils.CalculateTest();
    }
    expect(Utils.num).assertEqual(30000);
    expect(Utils.num / 10000).assertEqual(3);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_UTIL_0006
   * @tc.name      testUtils0006
   * @tc.desc      Utils calculation 4 times accumulates
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testUtils0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testUtils0006', 'utils run 4');
    Utils.Reset();
    for (let i: number = 0; i < 4; i++) {
      Utils.CalculateTest();
    }
    expect(Utils.num).assertEqual(40000);
    expect(Utils.num / 10000).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_UTIL_0007
   * @tc.name      testUtils0007
   * @tc.desc      Utils calculation 5 times accumulates
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testUtils0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testUtils0007', 'utils run 5');
    Utils.Reset();
    for (let i: number = 0; i < 5; i++) {
      Utils.CalculateTest();
    }
    expect(Utils.num).assertEqual(50000);
    expect(Utils.num / 10000).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_UTIL_0008
   * @tc.name      testUtils0008
   * @tc.desc      Utils calculation 6 times accumulates
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testUtils0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testUtils0008', 'utils run 6');
    Utils.Reset();
    for (let i: number = 0; i < 6; i++) {
      Utils.CalculateTest();
    }
    expect(Utils.num).assertEqual(60000);
    expect(Utils.num / 10000).assertEqual(6);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_UTIL_0009
   * @tc.name      testUtils0009
   * @tc.desc      Utils calculation 7 times accumulates
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testUtils0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testUtils0009', 'utils run 7');
    Utils.Reset();
    for (let i: number = 0; i < 7; i++) {
      Utils.CalculateTest();
    }
    expect(Utils.num).assertEqual(70000);
    expect(Utils.num / 10000).assertEqual(7);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_UTIL_0010
   * @tc.name      testUtils0010
   * @tc.desc      Utils reset clears a partial run
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testUtils0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testUtils0010', 'utils partial');
    Utils.Reset();
    Utils.CalculateTest();
    Utils.Reset();
    expect(Utils.num).assertEqual(0);
    expect(Utils.maxNum).assertEqual(10000);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_UTIL_0011
   * @tc.name      testUtils0011
   * @tc.desc      Utils reset is idempotent
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testUtils0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testUtils0011', 'utils idempotent');
    Utils.Reset();
    Utils.Reset();
    Utils.Reset();
    expect(Utils.num).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_UTIL_0012
   * @tc.name      testUtils0012
   * @tc.desc      Utils counter stays integral after calculation
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testUtils0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testUtils0012', 'utils integral');
    Utils.Reset();
    Utils.CalculateTest();
    expect(Utils.num % 1).assertEqual(0);
    expect(Math.floor(Utils.num)).assertEqual(Utils.num);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_UTIL_0013
   * @tc.name      testUtils0013
   * @tc.desc      Utils counter survives a stable read
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testUtils0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testUtils0013', 'utils stable');
    Utils.Reset();
    Utils.CalculateTest();
    const first: number = Utils.num;
    const second: number = Utils.num;
    expect(first).assertEqual(second);
    expect(first).assertEqual(10000);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_UTIL_0014
   * @tc.name      testUtils0014
   * @tc.desc      Utils max count is unchanged by calculation
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testUtils0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testUtils0014', 'utils max stable');
    Utils.Reset();
    Utils.CalculateTest();
    expect(Utils.maxNum).assertEqual(10000);
    expect(Utils.maxNum - Utils.num).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_UTIL_0015
   * @tc.name      testUtils0015
   * @tc.desc      Utils counter divides by one thousand
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testUtils0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testUtils0015', 'utils divide');
    Utils.Reset();
    Utils.CalculateTest();
    expect(Utils.num / 1000).assertEqual(10);
    expect(Utils.num % 1000).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_UTIL_0016
   * @tc.name      testUtils0016
   * @tc.desc      Utils counter renders as five digits
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testUtils0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testUtils0016', 'utils text');
    Utils.Reset();
    Utils.CalculateTest();
    expect(Utils.num.toString()).assertEqual('10000');
    expect(Utils.num.toString().length).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_UTIL_0017
   * @tc.name      testUtils0017
   * @tc.desc      Utils counter subtracts back to zero
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testUtils0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testUtils0017', 'utils subtract');
    Utils.Reset();
    Utils.CalculateTest();
    expect(Utils.num - 10000).assertEqual(0);
    expect(10000 - Utils.num).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_UTIL_0018
   * @tc.name      testUtils0018
   * @tc.desc      Utils counter compares with max count
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testUtils0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testUtils0018', 'utils compare');
    Utils.Reset();
    Utils.CalculateTest();
    expect(Utils.num === Utils.maxNum).assertTrue();
    expect(Utils.num > Utils.maxNum - 1).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_UTIL_0019
   * @tc.name      testUtils0019
   * @tc.desc      Utils reset then rerun keeps the same total
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testUtils0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testUtils0019', 'utils rerun');
    Utils.Reset();
    Utils.CalculateTest();
    Utils.Reset();
    Utils.CalculateTest();
    expect(Utils.num).assertEqual(10000);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_UTIL_0020
   * @tc.name      testUtils0020
   * @tc.desc      Utils run after double reset restarts cleanly
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testUtils0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testUtils0020', 'utils restart');
    Utils.Reset();
    Utils.Reset();
    Utils.CalculateTest();
    expect(Utils.num).assertEqual(10000);
    expect(Utils.maxNum).assertEqual(10000);
  });
  });
}
