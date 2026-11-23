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
    expect(Math.sign(-24)).assertEqual(-1);
    expect(Math.sign(0)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0095
   * @tc.name      testMathSense0095
   * @tc.desc      Math pair 25 and 76
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMathSense0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMathSense0095', 'pair 25-76');
    expect(Math.max(25, 76)).assertEqual(76);
    expect(Math.min(25, 76)).assertEqual(25);
    expect(Math.abs(25 - 76)).assertEqual(51);
    expect(Math.abs(-25)).assertEqual(25);
    expect(Math.sign(25)).assertEqual(1);
    expect(Math.sign(-25)).assertEqual(-1);
    expect(Math.sign(0)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0096
   * @tc.name      testMathSense0096
   * @tc.desc      Math pair 26 and 79
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMathSense0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMathSense0096', 'pair 26-79');
    expect(Math.max(26, 79)).assertEqual(79);
    expect(Math.min(26, 79)).assertEqual(26);
    expect(Math.abs(26 - 79)).assertEqual(53);
    expect(Math.abs(-26)).assertEqual(26);
    expect(Math.sign(26)).assertEqual(1);
    expect(Math.sign(-26)).assertEqual(-1);
    expect(Math.sign(0)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0097
   * @tc.name      testMathSense0097
   * @tc.desc      Math pair 27 and 82
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMathSense0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMathSense0097', 'pair 27-82');
    expect(Math.max(27, 82)).assertEqual(82);
    expect(Math.min(27, 82)).assertEqual(27);
    expect(Math.abs(27 - 82)).assertEqual(55);
    expect(Math.abs(-27)).assertEqual(27);
    expect(Math.sign(27)).assertEqual(1);
    expect(Math.sign(-27)).assertEqual(-1);
    expect(Math.sign(0)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0098
   * @tc.name      testMathSense0098
   * @tc.desc      Math pair 28 and 85
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMathSense0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMathSense0098', 'pair 28-85');
    expect(Math.max(28, 85)).assertEqual(85);
    expect(Math.min(28, 85)).assertEqual(28);
    expect(Math.abs(28 - 85)).assertEqual(57);
    expect(Math.abs(-28)).assertEqual(28);
    expect(Math.sign(28)).assertEqual(1);
    expect(Math.sign(-28)).assertEqual(-1);
    expect(Math.sign(0)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0099
   * @tc.name      testMathSense0099
   * @tc.desc      Math pair 29 and 88
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMathSense0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMathSense0099', 'pair 29-88');
    expect(Math.max(29, 88)).assertEqual(88);
    expect(Math.min(29, 88)).assertEqual(29);
    expect(Math.abs(29 - 88)).assertEqual(59);
    expect(Math.abs(-29)).assertEqual(29);
    expect(Math.sign(29)).assertEqual(1);
    expect(Math.sign(-29)).assertEqual(-1);
    expect(Math.sign(0)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0100
   * @tc.name      testMathSense0100
   * @tc.desc      Math pair 30 and 91
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMathSense0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMathSense0100', 'pair 30-91');
    expect(Math.max(30, 91)).assertEqual(91);
    expect(Math.min(30, 91)).assertEqual(30);
    expect(Math.abs(30 - 91)).assertEqual(61);
    expect(Math.abs(-30)).assertEqual(30);
    expect(Math.sign(30)).assertEqual(1);
    expect(Math.sign(-30)).assertEqual(-1);
    expect(Math.sign(0)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0101
   * @tc.name      testMathSense0101
   * @tc.desc      Math trig 0 degrees
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMathSense0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMathSense0101', 'trig 0');
    const radians: number = 0 * Math.PI / 180;
    expect(Math.abs(Math.sin(radians) - 0.0) < 0.000001).assertTrue();
    expect(Math.abs(Math.cos(radians) - 1.0) < 0.000001).assertTrue();
    expect(Math.abs(Math.sin(radians) ** 2 + Math.cos(radians) ** 2 - 1) < 0.000001).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0102
   * @tc.name      testMathSense0102
   * @tc.desc      Math trig 30 degrees
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMathSense0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMathSense0102', 'trig 30');
    const radians: number = 30 * Math.PI / 180;
    expect(Math.abs(Math.sin(radians) - 0.5) < 0.000001).assertTrue();
    expect(Math.abs(Math.cos(radians) - 0.8660254037844387) < 0.000001).assertTrue();
    expect(Math.abs(Math.sin(radians) ** 2 + Math.cos(radians) ** 2 - 1) < 0.000001).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0103
   * @tc.name      testMathSense0103
   * @tc.desc      Math trig 45 degrees
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMathSense0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMathSense0103', 'trig 45');
    const radians: number = 45 * Math.PI / 180;
    expect(Math.abs(Math.sin(radians) - 0.7071067811865476) < 0.000001).assertTrue();
    expect(Math.abs(Math.cos(radians) - 0.7071067811865476) < 0.000001).assertTrue();
    expect(Math.abs(Math.sin(radians) ** 2 + Math.cos(radians) ** 2 - 1) < 0.000001).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0104
   * @tc.name      testMathSense0104
   * @tc.desc      Math trig 60 degrees
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMathSense0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMathSense0104', 'trig 60');
    const radians: number = 60 * Math.PI / 180;
    expect(Math.abs(Math.sin(radians) - 0.8660254037844387) < 0.000001).assertTrue();
    expect(Math.abs(Math.cos(radians) - 0.5) < 0.000001).assertTrue();
    expect(Math.abs(Math.sin(radians) ** 2 + Math.cos(radians) ** 2 - 1) < 0.000001).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0105
   * @tc.name      testMathSense0105
   * @tc.desc      Math trig 90 degrees
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMathSense0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMathSense0105', 'trig 90');
    const radians: number = 90 * Math.PI / 180;
    expect(Math.abs(Math.sin(radians) - 1.0) < 0.000001).assertTrue();
    expect(Math.abs(Math.cos(radians) - 0.0) < 0.000001).assertTrue();
    expect(Math.abs(Math.sin(radians) ** 2 + Math.cos(radians) ** 2 - 1) < 0.000001).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0106
   * @tc.name      testMathSense0106
   * @tc.desc      Math trig 180 degrees
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMathSense0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMathSense0106', 'trig 180');
    const radians: number = 180 * Math.PI / 180;
    expect(Math.abs(Math.sin(radians) - 0.0) < 0.000001).assertTrue();
    expect(Math.abs(Math.cos(radians) - -1.0) < 0.000001).assertTrue();
    expect(Math.abs(Math.sin(radians) ** 2 + Math.cos(radians) ** 2 - 1) < 0.000001).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0127
   * @tc.name      testMathSense0127
   * @tc.desc      Math hypot triple 1
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMathSense0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMathSense0127', 'hypot 1');
    expect(Math.abs(Math.hypot(3, 4) - 5) < 0.000001).assertTrue();
    expect(Math.abs(Math.sqrt(9 + 16) - 5) < 0.000001).assertTrue();
    expect(3 * 3 + 4 * 4).assertEqual(25);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0128
   * @tc.name      testMathSense0128
   * @tc.desc      Math hypot triple 2
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMathSense0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMathSense0128', 'hypot 2');
    expect(Math.abs(Math.hypot(5, 12) - 13) < 0.000001).assertTrue();
    expect(Math.abs(Math.sqrt(25 + 144) - 13) < 0.000001).assertTrue();
    expect(5 * 5 + 12 * 12).assertEqual(169);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0129
   * @tc.name      testMathSense0129
   * @tc.desc      Math hypot triple 3
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMathSense0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMathSense0129', 'hypot 3');
    expect(Math.abs(Math.hypot(6, 8) - 10) < 0.000001).assertTrue();
    expect(Math.abs(Math.sqrt(36 + 64) - 10) < 0.000001).assertTrue();
    expect(6 * 6 + 8 * 8).assertEqual(100);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0130
   * @tc.name      testMathSense0130
   * @tc.desc      Math hypot triple 4
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMathSense0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMathSense0130', 'hypot 4');
    expect(Math.abs(Math.hypot(7, 24) - 25) < 0.000001).assertTrue();
    expect(Math.abs(Math.sqrt(49 + 576) - 25) < 0.000001).assertTrue();
    expect(7 * 7 + 24 * 24).assertEqual(625);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0131
   * @tc.name      testMathSense0131
   * @tc.desc      Math hypot triple 5
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMathSense0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMathSense0131', 'hypot 5');
    expect(Math.abs(Math.hypot(8, 15) - 17) < 0.000001).assertTrue();
    expect(Math.abs(Math.sqrt(64 + 225) - 17) < 0.000001).assertTrue();
    expect(8 * 8 + 15 * 15).assertEqual(289);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0132
   * @tc.name      testMathSense0132
   * @tc.desc      Math hypot triple 6
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMathSense0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMathSense0132', 'hypot 6');
    expect(Math.abs(Math.hypot(9, 12) - 15) < 0.000001).assertTrue();
    expect(Math.abs(Math.sqrt(81 + 144) - 15) < 0.000001).assertTrue();
    expect(9 * 9 + 12 * 12).assertEqual(225);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0133
   * @tc.name      testMathSense0133
   * @tc.desc      Math hypot triple 7
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMathSense0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMathSense0133', 'hypot 7');
    expect(Math.abs(Math.hypot(9, 40) - 41) < 0.000001).assertTrue();
    expect(Math.abs(Math.sqrt(81 + 1600) - 41) < 0.000001).assertTrue();
    expect(9 * 9 + 40 * 40).assertEqual(1681);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0134
   * @tc.name      testMathSense0134
   * @tc.desc      Math hypot triple 8
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMathSense0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMathSense0134', 'hypot 8');
    expect(Math.abs(Math.hypot(12, 16) - 20) < 0.000001).assertTrue();
    expect(Math.abs(Math.sqrt(144 + 256) - 20) < 0.000001).assertTrue();
    expect(12 * 12 + 16 * 16).assertEqual(400);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0135
   * @tc.name      testMathSense0135
   * @tc.desc      Math hypot triple 9
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMathSense0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMathSense0135', 'hypot 9');
    expect(Math.abs(Math.hypot(12, 35) - 37) < 0.000001).assertTrue();
    expect(Math.abs(Math.sqrt(144 + 1225) - 37) < 0.000001).assertTrue();
    expect(12 * 12 + 35 * 35).assertEqual(1369);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0136
   * @tc.name      testMathSense0136
   * @tc.desc      Math hypot triple 10
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMathSense0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMathSense0136', 'hypot 10');
    expect(Math.abs(Math.hypot(15, 20) - 25) < 0.000001).assertTrue();
    expect(Math.abs(Math.sqrt(225 + 400) - 25) < 0.000001).assertTrue();
    expect(15 * 15 + 20 * 20).assertEqual(625);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0137
   * @tc.name      testMathSense0137
   * @tc.desc      Math hypot triple 11
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMathSense0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMathSense0137', 'hypot 11');
    expect(Math.abs(Math.hypot(16, 30) - 34) < 0.000001).assertTrue();
    expect(Math.abs(Math.sqrt(256 + 900) - 34) < 0.000001).assertTrue();
    expect(16 * 16 + 30 * 30).assertEqual(1156);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0138
   * @tc.name      testMathSense0138
   * @tc.desc      Math hypot triple 12
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMathSense0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMathSense0138', 'hypot 12');
    expect(Math.abs(Math.hypot(20, 21) - 29) < 0.000001).assertTrue();
    expect(Math.abs(Math.sqrt(400 + 441) - 29) < 0.000001).assertTrue();
    expect(20 * 20 + 21 * 21).assertEqual(841);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0139
   * @tc.name      testMathSense0139
   * @tc.desc      Math hypot triple 13
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMathSense0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMathSense0139', 'hypot 13');
    expect(Math.abs(Math.hypot(24, 32) - 40) < 0.000001).assertTrue();
    expect(Math.abs(Math.sqrt(576 + 1024) - 40) < 0.000001).assertTrue();
    expect(24 * 24 + 32 * 32).assertEqual(1600);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0140
   * @tc.name      testMathSense0140
   * @tc.desc      Math hypot triple 14
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMathSense0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMathSense0140', 'hypot 14');
    expect(Math.abs(Math.hypot(28, 45) - 53) < 0.000001).assertTrue();
    expect(Math.abs(Math.sqrt(784 + 2025) - 53) < 0.000001).assertTrue();
    expect(28 * 28 + 45 * 45).assertEqual(2809);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0141
   * @tc.name      testMathSense0141
   * @tc.desc      Math hypot triple 15
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMathSense0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMathSense0141', 'hypot 15');
    expect(Math.abs(Math.hypot(33, 56) - 65) < 0.000001).assertTrue();
    expect(Math.abs(Math.sqrt(1089 + 3136) - 65) < 0.000001).assertTrue();
    expect(33 * 33 + 56 * 56).assertEqual(4225);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0142
   * @tc.name      testMathSense0142
   * @tc.desc      Math hypot triple 16
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMathSense0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMathSense0142', 'hypot 16');
    expect(Math.abs(Math.hypot(36, 48) - 60) < 0.000001).assertTrue();
    expect(Math.abs(Math.sqrt(1296 + 2304) - 60) < 0.000001).assertTrue();
    expect(36 * 36 + 48 * 48).assertEqual(3600);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0143
   * @tc.name      testMathSense0143
   * @tc.desc      Math hypot triple 17
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMathSense0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMathSense0143', 'hypot 17');
    expect(Math.abs(Math.hypot(39, 80) - 89) < 0.000001).assertTrue();
    expect(Math.abs(Math.sqrt(1521 + 6400) - 89) < 0.000001).assertTrue();
    expect(39 * 39 + 80 * 80).assertEqual(7921);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0144
   * @tc.name      testMathSense0144
   * @tc.desc      Math hypot triple 18
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMathSense0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMathSense0144', 'hypot 18');
    expect(Math.abs(Math.hypot(48, 64) - 80) < 0.000001).assertTrue();
    expect(Math.abs(Math.sqrt(2304 + 4096) - 80) < 0.000001).assertTrue();
    expect(48 * 48 + 64 * 64).assertEqual(6400);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0145
   * @tc.name      testMathSense0145
   * @tc.desc      Math clz32 scale 1
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMathSense0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMathSense0145', 'clz 1');
    expect(Math.clz32(1)).assertEqual(31);
    expect(Math.clz32(2)).assertEqual(30);
    expect(Math.clz32(0)).assertEqual(32);
    expect(Math.trunc(1 / 2)).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0146
   * @tc.name      testMathSense0146
   * @tc.desc      Math clz32 scale 2
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMathSense0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMathSense0146', 'clz 2');
    expect(Math.clz32(1)).assertEqual(31);
    expect(Math.clz32(4)).assertEqual(29);
    expect(Math.clz32(0)).assertEqual(32);
    expect(Math.trunc(2 / 2)).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0147
   * @tc.name      testMathSense0147
   * @tc.desc      Math clz32 scale 3
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMathSense0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMathSense0147', 'clz 3');
    expect(Math.clz32(1)).assertEqual(31);
    expect(Math.clz32(8)).assertEqual(28);
    expect(Math.clz32(0)).assertEqual(32);
    expect(Math.trunc(3 / 2)).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0148
   * @tc.name      testMathSense0148
   * @tc.desc      Math clz32 scale 4
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMathSense0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMathSense0148', 'clz 4');
    expect(Math.clz32(1)).assertEqual(31);
    expect(Math.clz32(16)).assertEqual(27);
    expect(Math.clz32(0)).assertEqual(32);
    expect(Math.trunc(4 / 2)).assertEqual(2);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0149
   * @tc.name      testMathSense0149
   * @tc.desc      Math clz32 scale 5
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMathSense0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMathSense0149', 'clz 5');
    expect(Math.clz32(1)).assertEqual(31);
    expect(Math.clz32(32)).assertEqual(26);
    expect(Math.clz32(0)).assertEqual(32);
    expect(Math.trunc(5 / 2)).assertEqual(2);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0150
   * @tc.name      testMathSense0150
   * @tc.desc      Math clz32 scale 6
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMathSense0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMathSense0150', 'clz 6');
    expect(Math.clz32(1)).assertEqual(31);
    expect(Math.clz32(64)).assertEqual(25);
    expect(Math.clz32(0)).assertEqual(32);
    expect(Math.trunc(6 / 2)).assertEqual(3);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0151
   * @tc.name      testMathSense0151
   * @tc.desc      Math clz32 scale 7
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMathSense0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMathSense0151', 'clz 7');
    expect(Math.clz32(1)).assertEqual(31);
    expect(Math.clz32(128)).assertEqual(24);
    expect(Math.clz32(0)).assertEqual(32);
    expect(Math.trunc(7 / 2)).assertEqual(3);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0152
   * @tc.name      testMathSense0152
   * @tc.desc      Math clz32 scale 8
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMathSense0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMathSense0152', 'clz 8');
    expect(Math.clz32(1)).assertEqual(31);
    expect(Math.clz32(256)).assertEqual(23);
    expect(Math.clz32(0)).assertEqual(32);
    expect(Math.trunc(8 / 2)).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0153
   * @tc.name      testMathSense0153
   * @tc.desc      Math clz32 scale 9
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMathSense0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMathSense0153', 'clz 9');
    expect(Math.clz32(1)).assertEqual(31);
    expect(Math.clz32(512)).assertEqual(22);
    expect(Math.clz32(0)).assertEqual(32);
    expect(Math.trunc(9 / 2)).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0154
   * @tc.name      testMathSense0154
   * @tc.desc      Math clz32 scale 10
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMathSense0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMathSense0154', 'clz 10');
    expect(Math.clz32(1)).assertEqual(31);
    expect(Math.clz32(1024)).assertEqual(21);
    expect(Math.clz32(0)).assertEqual(32);
    expect(Math.trunc(10 / 2)).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0155
   * @tc.name      testMathSense0155
   * @tc.desc      Math clz32 scale 11
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMathSense0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMathSense0155', 'clz 11');
    expect(Math.clz32(1)).assertEqual(31);
    expect(Math.clz32(2048)).assertEqual(20);
    expect(Math.clz32(0)).assertEqual(32);
    expect(Math.trunc(11 / 2)).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0156
   * @tc.name      testMathSense0156
   * @tc.desc      Math clz32 scale 12
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMathSense0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMathSense0156', 'clz 12');
    expect(Math.clz32(1)).assertEqual(31);
    expect(Math.clz32(4096)).assertEqual(19);
    expect(Math.clz32(0)).assertEqual(32);
    expect(Math.trunc(12 / 2)).assertEqual(6);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0157
   * @tc.name      testMathSense0157
   * @tc.desc      Math clz32 scale 13
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMathSense0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMathSense0157', 'clz 13');
    expect(Math.clz32(1)).assertEqual(31);
    expect(Math.clz32(8192)).assertEqual(18);
    expect(Math.clz32(0)).assertEqual(32);
    expect(Math.trunc(13 / 2)).assertEqual(6);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0158
   * @tc.name      testMathSense0158
   * @tc.desc      Math clz32 scale 14
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMathSense0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMathSense0158', 'clz 14');
    expect(Math.clz32(1)).assertEqual(31);
    expect(Math.clz32(16384)).assertEqual(17);
    expect(Math.clz32(0)).assertEqual(32);
    expect(Math.trunc(14 / 2)).assertEqual(7);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0159
   * @tc.name      testMathSense0159
   * @tc.desc      Math clz32 scale 15
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMathSense0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMathSense0159', 'clz 15');
    expect(Math.clz32(1)).assertEqual(31);
    expect(Math.clz32(32768)).assertEqual(16);
    expect(Math.clz32(0)).assertEqual(32);
    expect(Math.trunc(15 / 2)).assertEqual(7);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0160
   * @tc.name      testMathSense0160
   * @tc.desc      Math clz32 scale 16
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMathSense0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMathSense0160', 'clz 16');
    expect(Math.clz32(1)).assertEqual(31);
    expect(Math.clz32(65536)).assertEqual(15);
    expect(Math.clz32(0)).assertEqual(32);
    expect(Math.trunc(16 / 2)).assertEqual(8);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0161
   * @tc.name      testMathSense0161
   * @tc.desc      Math clz32 scale 17
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMathSense0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMathSense0161', 'clz 17');
    expect(Math.clz32(1)).assertEqual(31);
    expect(Math.clz32(131072)).assertEqual(14);
    expect(Math.clz32(0)).assertEqual(32);
    expect(Math.trunc(17 / 2)).assertEqual(8);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0162
   * @tc.name      testMathSense0162
   * @tc.desc      Math clz32 scale 18
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMathSense0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMathSense0162', 'clz 18');
    expect(Math.clz32(1)).assertEqual(31);
    expect(Math.clz32(262144)).assertEqual(13);
    expect(Math.clz32(0)).assertEqual(32);
    expect(Math.trunc(18 / 2)).assertEqual(9);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0163
   * @tc.name      testMathSense0163
   * @tc.desc      Math clz32 scale 19
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMathSense0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMathSense0163', 'clz 19');
    expect(Math.clz32(1)).assertEqual(31);
    expect(Math.clz32(524288)).assertEqual(12);
    expect(Math.clz32(0)).assertEqual(32);
    expect(Math.trunc(19 / 2)).assertEqual(9);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MATH_0164
   * @tc.name      testMathSense0164
   * @tc.desc      Math clz32 scale 20
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMathSense0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMathSense0164', 'clz 20');
    expect(Math.clz32(1)).assertEqual(31);
    expect(Math.clz32(1048576)).assertEqual(11);
    expect(Math.clz32(0)).assertEqual(32);
    expect(Math.trunc(20 / 2)).assertEqual(10);
  });
  });
}
