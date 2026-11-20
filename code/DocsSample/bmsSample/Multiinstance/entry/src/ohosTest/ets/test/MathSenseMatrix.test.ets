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
import { logCase } from './shared/TestLog';

import { paceTurn } from './shared/TestPace';

export default function mathSenseMatrixTest() {
  describe('mathSenseMatrixTest', () => {
  beforeEach(async () => {
    await paceTurn();
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MATH_0001
   * @tc.name      testMathSense0001
   * @tc.desc      Math sqrt square 1
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMathSense0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMathSense0001', 'sqrt 1');
    expect(Math.sqrt(1)).assertEqual(1);
    expect(Math.sqrt(4)).assertEqual(2);
    expect(Math.abs(Math.sqrt(2) - 1) < 0.000001).assertTrue();
    expect(Math.floor(Math.sqrt(2))).assertEqual(1);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MATH_0002
   * @tc.name      testMathSense0002
   * @tc.desc      Math sqrt square 2
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMathSense0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMathSense0002', 'sqrt 2');
    expect(Math.sqrt(4)).assertEqual(2);
    expect(Math.sqrt(16)).assertEqual(4);
    expect(Math.abs(Math.sqrt(5) - 2) < 0.000001).assertTrue();
    expect(Math.floor(Math.sqrt(5))).assertEqual(2);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MATH_0003
   * @tc.name      testMathSense0003
   * @tc.desc      Math sqrt square 3
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMathSense0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMathSense0003', 'sqrt 3');
    expect(Math.sqrt(9)).assertEqual(3);
    expect(Math.sqrt(36)).assertEqual(6);
    expect(Math.abs(Math.sqrt(10) - 3) < 0.000001).assertTrue();
    expect(Math.floor(Math.sqrt(10))).assertEqual(3);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MATH_0004
   * @tc.name      testMathSense0004
   * @tc.desc      Math sqrt square 4
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMathSense0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMathSense0004', 'sqrt 4');
    expect(Math.sqrt(16)).assertEqual(4);
    expect(Math.sqrt(64)).assertEqual(8);
    expect(Math.abs(Math.sqrt(17) - 4) < 0.000001).assertTrue();
    expect(Math.floor(Math.sqrt(17))).assertEqual(4);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MATH_0005
   * @tc.name      testMathSense0005
   * @tc.desc      Math sqrt square 5
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMathSense0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMathSense0005', 'sqrt 5');
    expect(Math.sqrt(25)).assertEqual(5);
    expect(Math.sqrt(100)).assertEqual(10);
    expect(Math.abs(Math.sqrt(26) - 5) < 0.000001).assertTrue();
    expect(Math.floor(Math.sqrt(26))).assertEqual(5);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MATH_0006
   * @tc.name      testMathSense0006
   * @tc.desc      Math sqrt square 6
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMathSense0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMathSense0006', 'sqrt 6');
    expect(Math.sqrt(36)).assertEqual(6);
    expect(Math.sqrt(144)).assertEqual(12);
    expect(Math.abs(Math.sqrt(37) - 6) < 0.000001).assertTrue();
    expect(Math.floor(Math.sqrt(37))).assertEqual(6);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MATH_0007
   * @tc.name      testMathSense0007
   * @tc.desc      Math sqrt square 7
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMathSense0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMathSense0007', 'sqrt 7');
    expect(Math.sqrt(49)).assertEqual(7);
    expect(Math.sqrt(196)).assertEqual(14);
    expect(Math.abs(Math.sqrt(50) - 7) < 0.000001).assertTrue();
    expect(Math.floor(Math.sqrt(50))).assertEqual(7);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MATH_0008
   * @tc.name      testMathSense0008
   * @tc.desc      Math sqrt square 8
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMathSense0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMathSense0008', 'sqrt 8');
    expect(Math.sqrt(64)).assertEqual(8);
    expect(Math.sqrt(256)).assertEqual(16);
    expect(Math.abs(Math.sqrt(65) - 8) < 0.000001).assertTrue();
    expect(Math.floor(Math.sqrt(65))).assertEqual(8);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MATH_0009
   * @tc.name      testMathSense0009
   * @tc.desc      Math sqrt square 9
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMathSense0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMathSense0009', 'sqrt 9');
    expect(Math.sqrt(81)).assertEqual(9);
    expect(Math.sqrt(324)).assertEqual(18);
    expect(Math.abs(Math.sqrt(82) - 9) < 0.000001).assertTrue();
    expect(Math.floor(Math.sqrt(82))).assertEqual(9);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MATH_0010
   * @tc.name      testMathSense0010
   * @tc.desc      Math sqrt square 10
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMathSense0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMathSense0010', 'sqrt 10');
    expect(Math.sqrt(100)).assertEqual(10);
    expect(Math.sqrt(400)).assertEqual(20);
    expect(Math.abs(Math.sqrt(101) - 10) < 0.000001).assertTrue();
    expect(Math.floor(Math.sqrt(101))).assertEqual(10);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MATH_0011
   * @tc.name      testMathSense0011
   * @tc.desc      Math sqrt square 11
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMathSense0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMathSense0011', 'sqrt 11');
    expect(Math.sqrt(121)).assertEqual(11);
    expect(Math.sqrt(484)).assertEqual(22);
    expect(Math.abs(Math.sqrt(122) - 11) < 0.000001).assertTrue();
    expect(Math.floor(Math.sqrt(122))).assertEqual(11);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MATH_0012
   * @tc.name      testMathSense0012
   * @tc.desc      Math sqrt square 12
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMathSense0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMathSense0012', 'sqrt 12');
    expect(Math.sqrt(144)).assertEqual(12);
    expect(Math.sqrt(576)).assertEqual(24);
    expect(Math.abs(Math.sqrt(145) - 12) < 0.000001).assertTrue();
    expect(Math.floor(Math.sqrt(145))).assertEqual(12);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MATH_0013
   * @tc.name      testMathSense0013
   * @tc.desc      Math sqrt square 13
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMathSense0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMathSense0013', 'sqrt 13');
    expect(Math.sqrt(169)).assertEqual(13);
    expect(Math.sqrt(676)).assertEqual(26);
    expect(Math.abs(Math.sqrt(170) - 13) < 0.000001).assertTrue();
    expect(Math.floor(Math.sqrt(170))).assertEqual(13);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MATH_0014
   * @tc.name      testMathSense0014
   * @tc.desc      Math sqrt square 14
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMathSense0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMathSense0014', 'sqrt 14');
    expect(Math.sqrt(196)).assertEqual(14);
    expect(Math.sqrt(784)).assertEqual(28);
    expect(Math.abs(Math.sqrt(197) - 14) < 0.000001).assertTrue();
    expect(Math.floor(Math.sqrt(197))).assertEqual(14);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MATH_0015
   * @tc.name      testMathSense0015
   * @tc.desc      Math sqrt square 15
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMathSense0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMathSense0015', 'sqrt 15');
    expect(Math.sqrt(225)).assertEqual(15);
    expect(Math.sqrt(900)).assertEqual(30);
    expect(Math.abs(Math.sqrt(226) - 15) < 0.000001).assertTrue();
    expect(Math.floor(Math.sqrt(226))).assertEqual(15);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MATH_0016
   * @tc.name      testMathSense0016
   * @tc.desc      Math sqrt square 16
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
