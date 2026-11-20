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
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0041
   * @tc.name      testMathSense0041
   * @tc.desc      Math pow pass 1
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMathSense0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMathSense0041', 'pow 1');
    expect(Math.pow(2, 1)).assertEqual(2);
    expect(Math.pow(3, 2)).assertEqual(9);
    expect(Math.pow(1, 3)).assertEqual(1);
    expect(Math.pow(1, 1)).assertEqual(1);
    expect(Math.pow(1, 0)).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0042
   * @tc.name      testMathSense0042
   * @tc.desc      Math pow pass 2
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMathSense0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMathSense0042', 'pow 2');
    expect(Math.pow(2, 2)).assertEqual(4);
    expect(Math.pow(3, 3)).assertEqual(27);
    expect(Math.pow(2, 3)).assertEqual(8);
    expect(Math.pow(2, 1)).assertEqual(2);
    expect(Math.pow(2, 0)).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0043
   * @tc.name      testMathSense0043
   * @tc.desc      Math pow pass 3
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMathSense0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMathSense0043', 'pow 3');
    expect(Math.pow(2, 3)).assertEqual(8);
    expect(Math.pow(3, 4)).assertEqual(81);
    expect(Math.pow(3, 3)).assertEqual(27);
    expect(Math.pow(3, 1)).assertEqual(3);
    expect(Math.pow(3, 0)).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0044
   * @tc.name      testMathSense0044
   * @tc.desc      Math pow pass 4
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMathSense0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMathSense0044', 'pow 4');
    expect(Math.pow(2, 4)).assertEqual(16);
    expect(Math.pow(3, 5)).assertEqual(243);
    expect(Math.pow(4, 3)).assertEqual(64);
    expect(Math.pow(4, 1)).assertEqual(4);
    expect(Math.pow(4, 0)).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0045
   * @tc.name      testMathSense0045
   * @tc.desc      Math pow pass 5
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMathSense0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMathSense0045', 'pow 5');
    expect(Math.pow(2, 5)).assertEqual(32);
    expect(Math.pow(3, 6)).assertEqual(729);
    expect(Math.pow(5, 3)).assertEqual(125);
    expect(Math.pow(5, 1)).assertEqual(5);
    expect(Math.pow(5, 0)).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0046
   * @tc.name      testMathSense0046
   * @tc.desc      Math pow pass 6
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMathSense0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMathSense0046', 'pow 6');
    expect(Math.pow(2, 6)).assertEqual(64);
    expect(Math.pow(3, 7)).assertEqual(2187);
    expect(Math.pow(6, 3)).assertEqual(216);
    expect(Math.pow(6, 1)).assertEqual(6);
    expect(Math.pow(6, 0)).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0047
   * @tc.name      testMathSense0047
   * @tc.desc      Math pow pass 7
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMathSense0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMathSense0047', 'pow 7');
    expect(Math.pow(2, 7)).assertEqual(128);
    expect(Math.pow(3, 8)).assertEqual(6561);
    expect(Math.pow(7, 3)).assertEqual(343);
    expect(Math.pow(7, 1)).assertEqual(7);
    expect(Math.pow(7, 0)).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0048
   * @tc.name      testMathSense0048
   * @tc.desc      Math pow pass 8
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMathSense0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMathSense0048', 'pow 8');
    expect(Math.pow(2, 8)).assertEqual(256);
    expect(Math.pow(3, 9)).assertEqual(19683);
    expect(Math.pow(8, 3)).assertEqual(512);
    expect(Math.pow(8, 1)).assertEqual(8);
    expect(Math.pow(8, 0)).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0049
   * @tc.name      testMathSense0049
   * @tc.desc      Math pow pass 9
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMathSense0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMathSense0049', 'pow 9');
    expect(Math.pow(2, 9)).assertEqual(512);
    expect(Math.pow(3, 10)).assertEqual(59049);
    expect(Math.pow(9, 3)).assertEqual(729);
    expect(Math.pow(9, 1)).assertEqual(9);
    expect(Math.pow(9, 0)).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0050
   * @tc.name      testMathSense0050
   * @tc.desc      Math pow pass 10
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMathSense0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMathSense0050', 'pow 10');
    expect(Math.pow(2, 10)).assertEqual(1024);
    expect(Math.pow(3, 1)).assertEqual(3);
    expect(Math.pow(10, 3)).assertEqual(1000);
    expect(Math.pow(10, 1)).assertEqual(10);
    expect(Math.pow(10, 0)).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0051
   * @tc.name      testMathSense0051
   * @tc.desc      Math pow pass 11
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMathSense0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMathSense0051', 'pow 11');
    expect(Math.pow(2, 11)).assertEqual(2048);
    expect(Math.pow(3, 2)).assertEqual(9);
    expect(Math.pow(11, 3)).assertEqual(1331);
    expect(Math.pow(11, 1)).assertEqual(11);
    expect(Math.pow(11, 0)).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0052
   * @tc.name      testMathSense0052
   * @tc.desc      Math pow pass 12
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMathSense0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMathSense0052', 'pow 12');
    expect(Math.pow(2, 12)).assertEqual(4096);
    expect(Math.pow(3, 3)).assertEqual(27);
    expect(Math.pow(12, 3)).assertEqual(1728);
    expect(Math.pow(12, 1)).assertEqual(12);
    expect(Math.pow(12, 0)).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0053
   * @tc.name      testMathSense0053
   * @tc.desc      Math pow pass 13
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMathSense0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMathSense0053', 'pow 13');
    expect(Math.pow(2, 13)).assertEqual(8192);
    expect(Math.pow(3, 4)).assertEqual(81);
    expect(Math.pow(13, 3)).assertEqual(2197);
    expect(Math.pow(13, 1)).assertEqual(13);
    expect(Math.pow(13, 0)).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0054
   * @tc.name      testMathSense0054
   * @tc.desc      Math pow pass 14
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMathSense0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMathSense0054', 'pow 14');
    expect(Math.pow(2, 14)).assertEqual(16384);
    expect(Math.pow(3, 5)).assertEqual(243);
    expect(Math.pow(14, 3)).assertEqual(2744);
    expect(Math.pow(14, 1)).assertEqual(14);
    expect(Math.pow(14, 0)).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0055
   * @tc.name      testMathSense0055
   * @tc.desc      Math pow pass 15
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMathSense0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMathSense0055', 'pow 15');
    expect(Math.pow(2, 15)).assertEqual(32768);
    expect(Math.pow(3, 6)).assertEqual(729);
    expect(Math.pow(15, 3)).assertEqual(3375);
    expect(Math.pow(15, 1)).assertEqual(15);
    expect(Math.pow(15, 0)).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0056
   * @tc.name      testMathSense0056
   * @tc.desc      Math pow pass 16
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMathSense0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMathSense0056', 'pow 16');
    expect(Math.pow(2, 16)).assertEqual(65536);
    expect(Math.pow(3, 7)).assertEqual(2187);
    expect(Math.pow(16, 3)).assertEqual(4096);
    expect(Math.pow(16, 1)).assertEqual(16);
    expect(Math.pow(16, 0)).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0057
   * @tc.name      testMathSense0057
   * @tc.desc      Math pow pass 17
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMathSense0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMathSense0057', 'pow 17');
    expect(Math.pow(2, 17)).assertEqual(131072);
    expect(Math.pow(3, 8)).assertEqual(6561);
    expect(Math.pow(17, 3)).assertEqual(4913);
    expect(Math.pow(17, 1)).assertEqual(17);
    expect(Math.pow(17, 0)).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0058
   * @tc.name      testMathSense0058
   * @tc.desc      Math pow pass 18
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMathSense0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMathSense0058', 'pow 18');
    expect(Math.pow(2, 18)).assertEqual(262144);
    expect(Math.pow(3, 9)).assertEqual(19683);
    expect(Math.pow(18, 3)).assertEqual(5832);
    expect(Math.pow(18, 1)).assertEqual(18);
    expect(Math.pow(18, 0)).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0059
   * @tc.name      testMathSense0059
   * @tc.desc      Math pow pass 19
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMathSense0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMathSense0059', 'pow 19');
    expect(Math.pow(2, 19)).assertEqual(524288);
    expect(Math.pow(3, 10)).assertEqual(59049);
    expect(Math.pow(19, 3)).assertEqual(6859);
    expect(Math.pow(19, 1)).assertEqual(19);
    expect(Math.pow(19, 0)).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0060
   * @tc.name      testMathSense0060
   * @tc.desc      Math pow pass 20
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMathSense0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMathSense0060', 'pow 20');
    expect(Math.pow(2, 20)).assertEqual(1048576);
    expect(Math.pow(3, 1)).assertEqual(3);
    expect(Math.pow(20, 3)).assertEqual(8000);
    expect(Math.pow(20, 1)).assertEqual(20);
    expect(Math.pow(20, 0)).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0061
   * @tc.name      testMathSense0061
   * @tc.desc      Math pow pass 21
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMathSense0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMathSense0061', 'pow 21');
    expect(Math.pow(2, 21)).assertEqual(2097152);
    expect(Math.pow(3, 2)).assertEqual(9);
    expect(Math.pow(21, 3)).assertEqual(9261);
    expect(Math.pow(21, 1)).assertEqual(21);
    expect(Math.pow(21, 0)).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0062
   * @tc.name      testMathSense0062
   * @tc.desc      Math pow pass 22
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMathSense0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMathSense0062', 'pow 22');
    expect(Math.pow(2, 22)).assertEqual(4194304);
    expect(Math.pow(3, 3)).assertEqual(27);
    expect(Math.pow(22, 3)).assertEqual(10648);
    expect(Math.pow(22, 1)).assertEqual(22);
    expect(Math.pow(22, 0)).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0063
   * @tc.name      testMathSense0063
   * @tc.desc      Math pow pass 23
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMathSense0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMathSense0063', 'pow 23');
    expect(Math.pow(2, 23)).assertEqual(8388608);
    expect(Math.pow(3, 4)).assertEqual(81);
    expect(Math.pow(23, 3)).assertEqual(12167);
    expect(Math.pow(23, 1)).assertEqual(23);
    expect(Math.pow(23, 0)).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0064
   * @tc.name      testMathSense0064
   * @tc.desc      Math pow pass 24
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMathSense0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMathSense0064', 'pow 24');
    expect(Math.pow(2, 24)).assertEqual(16777216);
    expect(Math.pow(3, 5)).assertEqual(243);
    expect(Math.pow(24, 3)).assertEqual(13824);
    expect(Math.pow(24, 1)).assertEqual(24);
    expect(Math.pow(24, 0)).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0065
   * @tc.name      testMathSense0065
   * @tc.desc      Math pow pass 25
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMathSense0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMathSense0065', 'pow 25');
    expect(Math.pow(2, 25)).assertEqual(33554432);
    expect(Math.pow(3, 6)).assertEqual(729);
    expect(Math.pow(25, 3)).assertEqual(15625);
    expect(Math.pow(25, 1)).assertEqual(25);
    expect(Math.pow(25, 0)).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0066
   * @tc.name      testMathSense0066
   * @tc.desc      Math pow pass 26
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMathSense0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMathSense0066', 'pow 26');
    expect(Math.pow(2, 26)).assertEqual(67108864);
    expect(Math.pow(3, 7)).assertEqual(2187);
    expect(Math.pow(26, 3)).assertEqual(17576);
    expect(Math.pow(26, 1)).assertEqual(26);
    expect(Math.pow(26, 0)).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0067
   * @tc.name      testMathSense0067
   * @tc.desc      Math pow pass 27
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMathSense0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMathSense0067', 'pow 27');
    expect(Math.pow(2, 27)).assertEqual(134217728);
    expect(Math.pow(3, 8)).assertEqual(6561);
    expect(Math.pow(27, 3)).assertEqual(19683);
    expect(Math.pow(27, 1)).assertEqual(27);
    expect(Math.pow(27, 0)).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0068
   * @tc.name      testMathSense0068
   * @tc.desc      Math pow pass 28
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMathSense0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMathSense0068', 'pow 28');
    expect(Math.pow(2, 28)).assertEqual(268435456);
    expect(Math.pow(3, 9)).assertEqual(19683);
    expect(Math.pow(28, 3)).assertEqual(21952);
    expect(Math.pow(28, 1)).assertEqual(28);
    expect(Math.pow(28, 0)).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0069
   * @tc.name      testMathSense0069
   * @tc.desc      Math pow pass 29
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMathSense0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMathSense0069', 'pow 29');
    expect(Math.pow(2, 29)).assertEqual(536870912);
    expect(Math.pow(3, 10)).assertEqual(59049);
    expect(Math.pow(29, 3)).assertEqual(24389);
    expect(Math.pow(29, 1)).assertEqual(29);
    expect(Math.pow(29, 0)).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0070
   * @tc.name      testMathSense0070
   * @tc.desc      Math pow pass 30
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMathSense0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMathSense0070', 'pow 30');
    expect(Math.pow(2, 30)).assertEqual(1073741824);
    expect(Math.pow(3, 1)).assertEqual(3);
    expect(Math.pow(30, 3)).assertEqual(27000);
    expect(Math.pow(30, 1)).assertEqual(30);
    expect(Math.pow(30, 0)).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0071
   * @tc.name      testMathSense0071
   * @tc.desc      Math pair 1 and 4
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMathSense0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMathSense0071', 'pair 1-4');
    expect(Math.max(1, 4)).assertEqual(4);
    expect(Math.min(1, 4)).assertEqual(1);
    expect(Math.abs(1 - 4)).assertEqual(3);
    expect(Math.abs(-1)).assertEqual(1);
    expect(Math.sign(1)).assertEqual(1);
    expect(Math.sign(-1)).assertEqual(-1);
    expect(Math.sign(0)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0072
   * @tc.name      testMathSense0072
   * @tc.desc      Math pair 2 and 7
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMathSense0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMathSense0072', 'pair 2-7');
    expect(Math.max(2, 7)).assertEqual(7);
    expect(Math.min(2, 7)).assertEqual(2);
    expect(Math.abs(2 - 7)).assertEqual(5);
    expect(Math.abs(-2)).assertEqual(2);
    expect(Math.sign(2)).assertEqual(1);
    expect(Math.sign(-2)).assertEqual(-1);
    expect(Math.sign(0)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0073
   * @tc.name      testMathSense0073
   * @tc.desc      Math pair 3 and 10
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMathSense0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMathSense0073', 'pair 3-10');
    expect(Math.max(3, 10)).assertEqual(10);
    expect(Math.min(3, 10)).assertEqual(3);
    expect(Math.abs(3 - 10)).assertEqual(7);
    expect(Math.abs(-3)).assertEqual(3);
    expect(Math.sign(3)).assertEqual(1);
    expect(Math.sign(-3)).assertEqual(-1);
    expect(Math.sign(0)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0074
   * @tc.name      testMathSense0074
   * @tc.desc      Math pair 4 and 13
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMathSense0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMathSense0074', 'pair 4-13');
    expect(Math.max(4, 13)).assertEqual(13);
    expect(Math.min(4, 13)).assertEqual(4);
    expect(Math.abs(4 - 13)).assertEqual(9);
    expect(Math.abs(-4)).assertEqual(4);
    expect(Math.sign(4)).assertEqual(1);
    expect(Math.sign(-4)).assertEqual(-1);
    expect(Math.sign(0)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0075
   * @tc.name      testMathSense0075
   * @tc.desc      Math pair 5 and 16
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMathSense0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMathSense0075', 'pair 5-16');
    expect(Math.max(5, 16)).assertEqual(16);
    expect(Math.min(5, 16)).assertEqual(5);
    expect(Math.abs(5 - 16)).assertEqual(11);
    expect(Math.abs(-5)).assertEqual(5);
    expect(Math.sign(5)).assertEqual(1);
    expect(Math.sign(-5)).assertEqual(-1);
    expect(Math.sign(0)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0076
   * @tc.name      testMathSense0076
   * @tc.desc      Math pair 6 and 19
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMathSense0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMathSense0076', 'pair 6-19');
    expect(Math.max(6, 19)).assertEqual(19);
    expect(Math.min(6, 19)).assertEqual(6);
    expect(Math.abs(6 - 19)).assertEqual(13);
    expect(Math.abs(-6)).assertEqual(6);
    expect(Math.sign(6)).assertEqual(1);
    expect(Math.sign(-6)).assertEqual(-1);
    expect(Math.sign(0)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0077
   * @tc.name      testMathSense0077
   * @tc.desc      Math pair 7 and 22
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMathSense0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMathSense0077', 'pair 7-22');
    expect(Math.max(7, 22)).assertEqual(22);
    expect(Math.min(7, 22)).assertEqual(7);
    expect(Math.abs(7 - 22)).assertEqual(15);
    expect(Math.abs(-7)).assertEqual(7);
    expect(Math.sign(7)).assertEqual(1);
    expect(Math.sign(-7)).assertEqual(-1);
    expect(Math.sign(0)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0078
   * @tc.name      testMathSense0078
   * @tc.desc      Math pair 8 and 25
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMathSense0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMathSense0078', 'pair 8-25');
    expect(Math.max(8, 25)).assertEqual(25);
    expect(Math.min(8, 25)).assertEqual(8);
    expect(Math.abs(8 - 25)).assertEqual(17);
    expect(Math.abs(-8)).assertEqual(8);
    expect(Math.sign(8)).assertEqual(1);
    expect(Math.sign(-8)).assertEqual(-1);
    expect(Math.sign(0)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0079
   * @tc.name      testMathSense0079
   * @tc.desc      Math pair 9 and 28
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMathSense0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMathSense0079', 'pair 9-28');
    expect(Math.max(9, 28)).assertEqual(28);
    expect(Math.min(9, 28)).assertEqual(9);
    expect(Math.abs(9 - 28)).assertEqual(19);
    expect(Math.abs(-9)).assertEqual(9);
    expect(Math.sign(9)).assertEqual(1);
    expect(Math.sign(-9)).assertEqual(-1);
    expect(Math.sign(0)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0080
   * @tc.name      testMathSense0080
   * @tc.desc      Math pair 10 and 31
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMathSense0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMathSense0080', 'pair 10-31');
    expect(Math.max(10, 31)).assertEqual(31);
    expect(Math.min(10, 31)).assertEqual(10);
    expect(Math.abs(10 - 31)).assertEqual(21);
    expect(Math.abs(-10)).assertEqual(10);
    expect(Math.sign(10)).assertEqual(1);
    expect(Math.sign(-10)).assertEqual(-1);
    expect(Math.sign(0)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0081
   * @tc.name      testMathSense0081
   * @tc.desc      Math pair 11 and 34
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMathSense0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMathSense0081', 'pair 11-34');
    expect(Math.max(11, 34)).assertEqual(34);
    expect(Math.min(11, 34)).assertEqual(11);
    expect(Math.abs(11 - 34)).assertEqual(23);
    expect(Math.abs(-11)).assertEqual(11);
    expect(Math.sign(11)).assertEqual(1);
    expect(Math.sign(-11)).assertEqual(-1);
    expect(Math.sign(0)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0082
   * @tc.name      testMathSense0082
   * @tc.desc      Math pair 12 and 37
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMathSense0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMathSense0082', 'pair 12-37');
    expect(Math.max(12, 37)).assertEqual(37);
    expect(Math.min(12, 37)).assertEqual(12);
    expect(Math.abs(12 - 37)).assertEqual(25);
    expect(Math.abs(-12)).assertEqual(12);
    expect(Math.sign(12)).assertEqual(1);
    expect(Math.sign(-12)).assertEqual(-1);
    expect(Math.sign(0)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0083
   * @tc.name      testMathSense0083
   * @tc.desc      Math pair 13 and 40
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMathSense0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMathSense0083', 'pair 13-40');
    expect(Math.max(13, 40)).assertEqual(40);
    expect(Math.min(13, 40)).assertEqual(13);
    expect(Math.abs(13 - 40)).assertEqual(27);
    expect(Math.abs(-13)).assertEqual(13);
    expect(Math.sign(13)).assertEqual(1);
    expect(Math.sign(-13)).assertEqual(-1);
    expect(Math.sign(0)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0084
   * @tc.name      testMathSense0084
   * @tc.desc      Math pair 14 and 43
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMathSense0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMathSense0084', 'pair 14-43');
    expect(Math.max(14, 43)).assertEqual(43);
    expect(Math.min(14, 43)).assertEqual(14);
    expect(Math.abs(14 - 43)).assertEqual(29);
    expect(Math.abs(-14)).assertEqual(14);
    expect(Math.sign(14)).assertEqual(1);
    expect(Math.sign(-14)).assertEqual(-1);
    expect(Math.sign(0)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0085
   * @tc.name      testMathSense0085
   * @tc.desc      Math pair 15 and 46
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMathSense0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMathSense0085', 'pair 15-46');
    expect(Math.max(15, 46)).assertEqual(46);
    expect(Math.min(15, 46)).assertEqual(15);
    expect(Math.abs(15 - 46)).assertEqual(31);
    expect(Math.abs(-15)).assertEqual(15);
    expect(Math.sign(15)).assertEqual(1);
    expect(Math.sign(-15)).assertEqual(-1);
    expect(Math.sign(0)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0086
   * @tc.name      testMathSense0086
   * @tc.desc      Math pair 16 and 49
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMathSense0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMathSense0086', 'pair 16-49');
    expect(Math.max(16, 49)).assertEqual(49);
    expect(Math.min(16, 49)).assertEqual(16);
    expect(Math.abs(16 - 49)).assertEqual(33);
    expect(Math.abs(-16)).assertEqual(16);
    expect(Math.sign(16)).assertEqual(1);
    expect(Math.sign(-16)).assertEqual(-1);
    expect(Math.sign(0)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0087
   * @tc.name      testMathSense0087
   * @tc.desc      Math pair 17 and 52
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMathSense0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMathSense0087', 'pair 17-52');
    expect(Math.max(17, 52)).assertEqual(52);
    expect(Math.min(17, 52)).assertEqual(17);
    expect(Math.abs(17 - 52)).assertEqual(35);
    expect(Math.abs(-17)).assertEqual(17);
    expect(Math.sign(17)).assertEqual(1);
    expect(Math.sign(-17)).assertEqual(-1);
    expect(Math.sign(0)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0088
   * @tc.name      testMathSense0088
   * @tc.desc      Math pair 18 and 55
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMathSense0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMathSense0088', 'pair 18-55');
    expect(Math.max(18, 55)).assertEqual(55);
    expect(Math.min(18, 55)).assertEqual(18);
    expect(Math.abs(18 - 55)).assertEqual(37);
    expect(Math.abs(-18)).assertEqual(18);
    expect(Math.sign(18)).assertEqual(1);
    expect(Math.sign(-18)).assertEqual(-1);
    expect(Math.sign(0)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0089
   * @tc.name      testMathSense0089
   * @tc.desc      Math pair 19 and 58
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMathSense0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMathSense0089', 'pair 19-58');
    expect(Math.max(19, 58)).assertEqual(58);
    expect(Math.min(19, 58)).assertEqual(19);
    expect(Math.abs(19 - 58)).assertEqual(39);
    expect(Math.abs(-19)).assertEqual(19);
    expect(Math.sign(19)).assertEqual(1);
    expect(Math.sign(-19)).assertEqual(-1);
    expect(Math.sign(0)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0090
   * @tc.name      testMathSense0090
   * @tc.desc      Math pair 20 and 61
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMathSense0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMathSense0090', 'pair 20-61');
    expect(Math.max(20, 61)).assertEqual(61);
    expect(Math.min(20, 61)).assertEqual(20);
    expect(Math.abs(20 - 61)).assertEqual(41);
    expect(Math.abs(-20)).assertEqual(20);
    expect(Math.sign(20)).assertEqual(1);
    expect(Math.sign(-20)).assertEqual(-1);
    expect(Math.sign(0)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0091
   * @tc.name      testMathSense0091
   * @tc.desc      Math pair 21 and 64
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMathSense0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMathSense0091', 'pair 21-64');
    expect(Math.max(21, 64)).assertEqual(64);
    expect(Math.min(21, 64)).assertEqual(21);
    expect(Math.abs(21 - 64)).assertEqual(43);
    expect(Math.abs(-21)).assertEqual(21);
    expect(Math.sign(21)).assertEqual(1);
    expect(Math.sign(-21)).assertEqual(-1);
    expect(Math.sign(0)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0092
   * @tc.name      testMathSense0092
   * @tc.desc      Math pair 22 and 67
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMathSense0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMathSense0092', 'pair 22-67');
    expect(Math.max(22, 67)).assertEqual(67);
    expect(Math.min(22, 67)).assertEqual(22);
    expect(Math.abs(22 - 67)).assertEqual(45);
    expect(Math.abs(-22)).assertEqual(22);
    expect(Math.sign(22)).assertEqual(1);
    expect(Math.sign(-22)).assertEqual(-1);
    expect(Math.sign(0)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0093
   * @tc.name      testMathSense0093
   * @tc.desc      Math pair 23 and 70
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMathSense0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMathSense0093', 'pair 23-70');
    expect(Math.max(23, 70)).assertEqual(70);
    expect(Math.min(23, 70)).assertEqual(23);
    expect(Math.abs(23 - 70)).assertEqual(47);
    expect(Math.abs(-23)).assertEqual(23);
    expect(Math.sign(23)).assertEqual(1);
    expect(Math.sign(-23)).assertEqual(-1);
    expect(Math.sign(0)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0094
   * @tc.name      testMathSense0094
   * @tc.desc      Math pair 24 and 73
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMathSense0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMathSense0094', 'pair 24-73');
    expect(Math.max(24, 73)).assertEqual(73);
    expect(Math.min(24, 73)).assertEqual(24);
    expect(Math.abs(24 - 73)).assertEqual(49);
    expect(Math.abs(-24)).assertEqual(24);
    expect(Math.sign(24)).assertEqual(1);
