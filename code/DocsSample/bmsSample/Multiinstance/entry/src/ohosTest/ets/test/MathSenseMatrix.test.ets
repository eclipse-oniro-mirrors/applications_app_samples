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
   * @tc.level     LEVEL1
   */
  it('testMathSense0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMathSense0016', 'sqrt 16');
    expect(Math.sqrt(256)).assertEqual(16);
    expect(Math.sqrt(1024)).assertEqual(32);
    expect(Math.abs(Math.sqrt(257) - 16) < 0.000001).assertTrue();
    expect(Math.floor(Math.sqrt(257))).assertEqual(16);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MATH_0017
   * @tc.name      testMathSense0017
   * @tc.desc      Math sqrt square 17
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMathSense0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMathSense0017', 'sqrt 17');
    expect(Math.sqrt(289)).assertEqual(17);
    expect(Math.sqrt(1156)).assertEqual(34);
    expect(Math.abs(Math.sqrt(290) - 17) < 0.000001).assertTrue();
    expect(Math.floor(Math.sqrt(290))).assertEqual(17);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MATH_0018
   * @tc.name      testMathSense0018
   * @tc.desc      Math sqrt square 18
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMathSense0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMathSense0018', 'sqrt 18');
    expect(Math.sqrt(324)).assertEqual(18);
    expect(Math.sqrt(1296)).assertEqual(36);
    expect(Math.abs(Math.sqrt(325) - 18) < 0.000001).assertTrue();
    expect(Math.floor(Math.sqrt(325))).assertEqual(18);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MATH_0019
   * @tc.name      testMathSense0019
   * @tc.desc      Math sqrt square 19
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMathSense0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMathSense0019', 'sqrt 19');
    expect(Math.sqrt(361)).assertEqual(19);
    expect(Math.sqrt(1444)).assertEqual(38);
    expect(Math.abs(Math.sqrt(362) - 19) < 0.000001).assertTrue();
    expect(Math.floor(Math.sqrt(362))).assertEqual(19);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MATH_0020
   * @tc.name      testMathSense0020
   * @tc.desc      Math sqrt square 20
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMathSense0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMathSense0020', 'sqrt 20');
    expect(Math.sqrt(400)).assertEqual(20);
    expect(Math.sqrt(1600)).assertEqual(40);
    expect(Math.abs(Math.sqrt(401) - 20) < 0.000001).assertTrue();
    expect(Math.floor(Math.sqrt(401))).assertEqual(20);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MATH_0021
   * @tc.name      testMathSense0021
   * @tc.desc      Math sqrt square 21
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMathSense0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMathSense0021', 'sqrt 21');
    expect(Math.sqrt(441)).assertEqual(21);
    expect(Math.sqrt(1764)).assertEqual(42);
    expect(Math.abs(Math.sqrt(442) - 21) < 0.000001).assertTrue();
    expect(Math.floor(Math.sqrt(442))).assertEqual(21);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MATH_0022
   * @tc.name      testMathSense0022
   * @tc.desc      Math sqrt square 22
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMathSense0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMathSense0022', 'sqrt 22');
    expect(Math.sqrt(484)).assertEqual(22);
    expect(Math.sqrt(1936)).assertEqual(44);
    expect(Math.abs(Math.sqrt(485) - 22) < 0.000001).assertTrue();
    expect(Math.floor(Math.sqrt(485))).assertEqual(22);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MATH_0023
   * @tc.name      testMathSense0023
   * @tc.desc      Math sqrt square 23
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMathSense0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMathSense0023', 'sqrt 23');
    expect(Math.sqrt(529)).assertEqual(23);
    expect(Math.sqrt(2116)).assertEqual(46);
    expect(Math.abs(Math.sqrt(530) - 23) < 0.000001).assertTrue();
    expect(Math.floor(Math.sqrt(530))).assertEqual(23);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MATH_0024
   * @tc.name      testMathSense0024
   * @tc.desc      Math sqrt square 24
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMathSense0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMathSense0024', 'sqrt 24');
    expect(Math.sqrt(576)).assertEqual(24);
    expect(Math.sqrt(2304)).assertEqual(48);
    expect(Math.abs(Math.sqrt(577) - 24) < 0.000001).assertTrue();
    expect(Math.floor(Math.sqrt(577))).assertEqual(24);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MATH_0025
   * @tc.name      testMathSense0025
   * @tc.desc      Math sqrt square 25
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMathSense0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMathSense0025', 'sqrt 25');
    expect(Math.sqrt(625)).assertEqual(25);
    expect(Math.sqrt(2500)).assertEqual(50);
    expect(Math.abs(Math.sqrt(626) - 25) < 0.000001).assertTrue();
    expect(Math.floor(Math.sqrt(626))).assertEqual(25);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MATH_0026
   * @tc.name      testMathSense0026
   * @tc.desc      Math sqrt square 26
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMathSense0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMathSense0026', 'sqrt 26');
    expect(Math.sqrt(676)).assertEqual(26);
    expect(Math.sqrt(2704)).assertEqual(52);
    expect(Math.abs(Math.sqrt(677) - 26) < 0.000001).assertTrue();
    expect(Math.floor(Math.sqrt(677))).assertEqual(26);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MATH_0027
   * @tc.name      testMathSense0027
   * @tc.desc      Math sqrt square 27
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMathSense0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMathSense0027', 'sqrt 27');
    expect(Math.sqrt(729)).assertEqual(27);
    expect(Math.sqrt(2916)).assertEqual(54);
    expect(Math.abs(Math.sqrt(730) - 27) < 0.000001).assertTrue();
    expect(Math.floor(Math.sqrt(730))).assertEqual(27);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MATH_0028
   * @tc.name      testMathSense0028
   * @tc.desc      Math sqrt square 28
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMathSense0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMathSense0028', 'sqrt 28');
    expect(Math.sqrt(784)).assertEqual(28);
    expect(Math.sqrt(3136)).assertEqual(56);
    expect(Math.abs(Math.sqrt(785) - 28) < 0.000001).assertTrue();
    expect(Math.floor(Math.sqrt(785))).assertEqual(28);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MATH_0029
   * @tc.name      testMathSense0029
   * @tc.desc      Math sqrt square 29
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMathSense0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMathSense0029', 'sqrt 29');
    expect(Math.sqrt(841)).assertEqual(29);
    expect(Math.sqrt(3364)).assertEqual(58);
    expect(Math.abs(Math.sqrt(842) - 29) < 0.000001).assertTrue();
    expect(Math.floor(Math.sqrt(842))).assertEqual(29);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MATH_0030
   * @tc.name      testMathSense0030
   * @tc.desc      Math sqrt square 30
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMathSense0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMathSense0030', 'sqrt 30');
    expect(Math.sqrt(900)).assertEqual(30);
    expect(Math.sqrt(3600)).assertEqual(60);
    expect(Math.abs(Math.sqrt(901) - 30) < 0.000001).assertTrue();
    expect(Math.floor(Math.sqrt(901))).assertEqual(30);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MATH_0031
   * @tc.name      testMathSense0031
   * @tc.desc      Math sqrt square 31
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMathSense0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMathSense0031', 'sqrt 31');
    expect(Math.sqrt(961)).assertEqual(31);
    expect(Math.sqrt(3844)).assertEqual(62);
    expect(Math.abs(Math.sqrt(962) - 31) < 0.000001).assertTrue();
    expect(Math.floor(Math.sqrt(962))).assertEqual(31);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MATH_0032
   * @tc.name      testMathSense0032
   * @tc.desc      Math sqrt square 32
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMathSense0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMathSense0032', 'sqrt 32');
    expect(Math.sqrt(1024)).assertEqual(32);
    expect(Math.sqrt(4096)).assertEqual(64);
    expect(Math.abs(Math.sqrt(1025) - 32) < 0.000001).assertTrue();
    expect(Math.floor(Math.sqrt(1025))).assertEqual(32);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MATH_0033
   * @tc.name      testMathSense0033
   * @tc.desc      Math sqrt square 33
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMathSense0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMathSense0033', 'sqrt 33');
    expect(Math.sqrt(1089)).assertEqual(33);
    expect(Math.sqrt(4356)).assertEqual(66);
    expect(Math.abs(Math.sqrt(1090) - 33) < 0.000001).assertTrue();
    expect(Math.floor(Math.sqrt(1090))).assertEqual(33);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MATH_0034
   * @tc.name      testMathSense0034
   * @tc.desc      Math sqrt square 34
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMathSense0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMathSense0034', 'sqrt 34');
    expect(Math.sqrt(1156)).assertEqual(34);
    expect(Math.sqrt(4624)).assertEqual(68);
    expect(Math.abs(Math.sqrt(1157) - 34) < 0.000001).assertTrue();
    expect(Math.floor(Math.sqrt(1157))).assertEqual(34);
  });
  });
}
