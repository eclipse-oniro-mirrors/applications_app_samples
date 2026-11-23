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

export default function numberSenseMatrixTest() {
  describe('numberSenseMatrixTest', () => {
  beforeEach(async () => {
    await paceTurn();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0001
   * @tc.name      testNumberSense0001
   * @tc.desc      Integer parse round 1
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testNumberSense0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testNumberSense0001', 'int parse 1');
    expect(parseInt('20', 10)).assertEqual(20);
    expect(Number('20')).assertEqual(20);
    expect(parseInt('14', 16)).assertEqual(20);
    expect(parseInt('10100', 2)).assertEqual(20);
    expect((20).toString(16)).assertEqual('14');
    expect(Number.isInteger(20)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0002
   * @tc.name      testNumberSense0002
   * @tc.desc      Integer parse round 2
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testNumberSense0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testNumberSense0002', 'int parse 2');
    expect(parseInt('33', 10)).assertEqual(33);
    expect(Number('33')).assertEqual(33);
    expect(parseInt('21', 16)).assertEqual(33);
    expect(parseInt('100001', 2)).assertEqual(33);
    expect((33).toString(16)).assertEqual('21');
    expect(Number.isInteger(33)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0003
   * @tc.name      testNumberSense0003
   * @tc.desc      Integer parse round 3
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testNumberSense0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testNumberSense0003', 'int parse 3');
    expect(parseInt('46', 10)).assertEqual(46);
    expect(Number('46')).assertEqual(46);
    expect(parseInt('2e', 16)).assertEqual(46);
    expect(parseInt('101110', 2)).assertEqual(46);
    expect((46).toString(16)).assertEqual('2e');
    expect(Number.isInteger(46)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0004
   * @tc.name      testNumberSense0004
   * @tc.desc      Integer parse round 4
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testNumberSense0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testNumberSense0004', 'int parse 4');
    expect(parseInt('59', 10)).assertEqual(59);
    expect(Number('59')).assertEqual(59);
    expect(parseInt('3b', 16)).assertEqual(59);
    expect(parseInt('111011', 2)).assertEqual(59);
    expect((59).toString(16)).assertEqual('3b');
    expect(Number.isInteger(59)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0005
   * @tc.name      testNumberSense0005
   * @tc.desc      Integer parse round 5
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testNumberSense0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testNumberSense0005', 'int parse 5');
    expect(parseInt('72', 10)).assertEqual(72);
    expect(Number('72')).assertEqual(72);
    expect(parseInt('48', 16)).assertEqual(72);
    expect(parseInt('1001000', 2)).assertEqual(72);
    expect((72).toString(16)).assertEqual('48');
    expect(Number.isInteger(72)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0006
   * @tc.name      testNumberSense0006
   * @tc.desc      Integer parse round 6
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testNumberSense0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testNumberSense0006', 'int parse 6');
    expect(parseInt('85', 10)).assertEqual(85);
    expect(Number('85')).assertEqual(85);
    expect(parseInt('55', 16)).assertEqual(85);
    expect(parseInt('1010101', 2)).assertEqual(85);
    expect((85).toString(16)).assertEqual('55');
    expect(Number.isInteger(85)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0007
   * @tc.name      testNumberSense0007
   * @tc.desc      Integer parse round 7
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testNumberSense0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testNumberSense0007', 'int parse 7');
    expect(parseInt('98', 10)).assertEqual(98);
    expect(Number('98')).assertEqual(98);
    expect(parseInt('62', 16)).assertEqual(98);
    expect(parseInt('1100010', 2)).assertEqual(98);
    expect((98).toString(16)).assertEqual('62');
    expect(Number.isInteger(98)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0008
   * @tc.name      testNumberSense0008
   * @tc.desc      Integer parse round 8
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testNumberSense0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testNumberSense0008', 'int parse 8');
    expect(parseInt('111', 10)).assertEqual(111);
    expect(Number('111')).assertEqual(111);
    expect(parseInt('6f', 16)).assertEqual(111);
    expect(parseInt('1101111', 2)).assertEqual(111);
    expect((111).toString(16)).assertEqual('6f');
    expect(Number.isInteger(111)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0009
   * @tc.name      testNumberSense0009
   * @tc.desc      Integer parse round 9
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testNumberSense0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testNumberSense0009', 'int parse 9');
    expect(parseInt('124', 10)).assertEqual(124);
    expect(Number('124')).assertEqual(124);
    expect(parseInt('7c', 16)).assertEqual(124);
    expect(parseInt('1111100', 2)).assertEqual(124);
    expect((124).toString(16)).assertEqual('7c');
    expect(Number.isInteger(124)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0010
   * @tc.name      testNumberSense0010
   * @tc.desc      Integer parse round 10
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testNumberSense0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testNumberSense0010', 'int parse 10');
    expect(parseInt('137', 10)).assertEqual(137);
    expect(Number('137')).assertEqual(137);
    expect(parseInt('89', 16)).assertEqual(137);
    expect(parseInt('10001001', 2)).assertEqual(137);
    expect((137).toString(16)).assertEqual('89');
    expect(Number.isInteger(137)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0011
   * @tc.name      testNumberSense0011
   * @tc.desc      Integer parse round 11
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testNumberSense0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testNumberSense0011', 'int parse 11');
    expect(parseInt('150', 10)).assertEqual(150);
    expect(Number('150')).assertEqual(150);
    expect(parseInt('96', 16)).assertEqual(150);
    expect(parseInt('10010110', 2)).assertEqual(150);
    expect((150).toString(16)).assertEqual('96');
    expect(Number.isInteger(150)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0012
   * @tc.name      testNumberSense0012
   * @tc.desc      Integer parse round 12
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testNumberSense0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testNumberSense0012', 'int parse 12');
    expect(parseInt('163', 10)).assertEqual(163);
    expect(Number('163')).assertEqual(163);
    expect(parseInt('a3', 16)).assertEqual(163);
    expect(parseInt('10100011', 2)).assertEqual(163);
    expect((163).toString(16)).assertEqual('a3');
    expect(Number.isInteger(163)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0013
   * @tc.name      testNumberSense0013
   * @tc.desc      Integer parse round 13
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testNumberSense0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testNumberSense0013', 'int parse 13');
    expect(parseInt('176', 10)).assertEqual(176);
    expect(Number('176')).assertEqual(176);
    expect(parseInt('b0', 16)).assertEqual(176);
    expect(parseInt('10110000', 2)).assertEqual(176);
    expect((176).toString(16)).assertEqual('b0');
    expect(Number.isInteger(176)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0014
   * @tc.name      testNumberSense0014
   * @tc.desc      Integer parse round 14
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testNumberSense0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testNumberSense0014', 'int parse 14');
    expect(parseInt('189', 10)).assertEqual(189);
    expect(Number('189')).assertEqual(189);
    expect(parseInt('bd', 16)).assertEqual(189);
    expect(parseInt('10111101', 2)).assertEqual(189);
    expect((189).toString(16)).assertEqual('bd');
    expect(Number.isInteger(189)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0015
   * @tc.name      testNumberSense0015
   * @tc.desc      Integer parse round 15
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testNumberSense0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testNumberSense0015', 'int parse 15');
    expect(parseInt('202', 10)).assertEqual(202);
    expect(Number('202')).assertEqual(202);
    expect(parseInt('ca', 16)).assertEqual(202);
    expect(parseInt('11001010', 2)).assertEqual(202);
    expect((202).toString(16)).assertEqual('ca');
    expect(Number.isInteger(202)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0016
   * @tc.name      testNumberSense0016
   * @tc.desc      Integer parse round 16
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testNumberSense0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testNumberSense0016', 'int parse 16');
    expect(parseInt('215', 10)).assertEqual(215);
    expect(Number('215')).assertEqual(215);
    expect(parseInt('d7', 16)).assertEqual(215);
    expect(parseInt('11010111', 2)).assertEqual(215);
    expect((215).toString(16)).assertEqual('d7');
    expect(Number.isInteger(215)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0017
   * @tc.name      testNumberSense0017
   * @tc.desc      Integer parse round 17
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testNumberSense0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testNumberSense0017', 'int parse 17');
    expect(parseInt('228', 10)).assertEqual(228);
    expect(Number('228')).assertEqual(228);
    expect(parseInt('e4', 16)).assertEqual(228);
    expect(parseInt('11100100', 2)).assertEqual(228);
    expect((228).toString(16)).assertEqual('e4');
    expect(Number.isInteger(228)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0018
   * @tc.name      testNumberSense0018
   * @tc.desc      Integer parse round 18
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testNumberSense0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testNumberSense0018', 'int parse 18');
    expect(parseInt('241', 10)).assertEqual(241);
    expect(Number('241')).assertEqual(241);
    expect(parseInt('f1', 16)).assertEqual(241);
    expect(parseInt('11110001', 2)).assertEqual(241);
    expect((241).toString(16)).assertEqual('f1');
    expect(Number.isInteger(241)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0019
   * @tc.name      testNumberSense0019
   * @tc.desc      Integer parse round 19
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testNumberSense0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testNumberSense0019', 'int parse 19');
    expect(parseInt('254', 10)).assertEqual(254);
    expect(Number('254')).assertEqual(254);
    expect(parseInt('fe', 16)).assertEqual(254);
    expect(parseInt('11111110', 2)).assertEqual(254);
    expect((254).toString(16)).assertEqual('fe');
    expect(Number.isInteger(254)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0020
   * @tc.name      testNumberSense0020
   * @tc.desc      Integer parse round 20
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testNumberSense0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testNumberSense0020', 'int parse 20');
    expect(parseInt('267', 10)).assertEqual(267);
    expect(Number('267')).assertEqual(267);
    expect(parseInt('10b', 16)).assertEqual(267);
    expect(parseInt('100001011', 2)).assertEqual(267);
    expect((267).toString(16)).assertEqual('10b');
    expect(Number.isInteger(267)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0021
   * @tc.name      testNumberSense0021
   * @tc.desc      Integer parse round 21
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testNumberSense0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testNumberSense0021', 'int parse 21');
    expect(parseInt('280', 10)).assertEqual(280);
    expect(Number('280')).assertEqual(280);
    expect(parseInt('118', 16)).assertEqual(280);
    expect(parseInt('100011000', 2)).assertEqual(280);
    expect((280).toString(16)).assertEqual('118');
    expect(Number.isInteger(280)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0022
   * @tc.name      testNumberSense0022
   * @tc.desc      Integer parse round 22
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testNumberSense0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testNumberSense0022', 'int parse 22');
    expect(parseInt('293', 10)).assertEqual(293);
    expect(Number('293')).assertEqual(293);
    expect(parseInt('125', 16)).assertEqual(293);
    expect(parseInt('100100101', 2)).assertEqual(293);
    expect((293).toString(16)).assertEqual('125');
    expect(Number.isInteger(293)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0023
   * @tc.name      testNumberSense0023
   * @tc.desc      Integer parse round 23
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testNumberSense0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testNumberSense0023', 'int parse 23');
    expect(parseInt('306', 10)).assertEqual(306);
    expect(Number('306')).assertEqual(306);
    expect(parseInt('132', 16)).assertEqual(306);
    expect(parseInt('100110010', 2)).assertEqual(306);
    expect((306).toString(16)).assertEqual('132');
    expect(Number.isInteger(306)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0024
   * @tc.name      testNumberSense0024
   * @tc.desc      Integer parse round 24
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testNumberSense0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testNumberSense0024', 'int parse 24');
    expect(parseInt('319', 10)).assertEqual(319);
    expect(Number('319')).assertEqual(319);
    expect(parseInt('13f', 16)).assertEqual(319);
    expect(parseInt('100111111', 2)).assertEqual(319);
    expect((319).toString(16)).assertEqual('13f');
    expect(Number.isInteger(319)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0025
   * @tc.name      testNumberSense0025
   * @tc.desc      Integer parse round 25
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testNumberSense0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testNumberSense0025', 'int parse 25');
    expect(parseInt('332', 10)).assertEqual(332);
    expect(Number('332')).assertEqual(332);
    expect(parseInt('14c', 16)).assertEqual(332);
    expect(parseInt('101001100', 2)).assertEqual(332);
    expect((332).toString(16)).assertEqual('14c');
    expect(Number.isInteger(332)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0026
   * @tc.name      testNumberSense0026
   * @tc.desc      Integer parse round 26
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testNumberSense0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testNumberSense0026', 'int parse 26');
    expect(parseInt('345', 10)).assertEqual(345);
    expect(Number('345')).assertEqual(345);
    expect(parseInt('159', 16)).assertEqual(345);
    expect(parseInt('101011001', 2)).assertEqual(345);
    expect((345).toString(16)).assertEqual('159');
    expect(Number.isInteger(345)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0027
   * @tc.name      testNumberSense0027
   * @tc.desc      Integer parse round 27
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testNumberSense0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testNumberSense0027', 'int parse 27');
    expect(parseInt('358', 10)).assertEqual(358);
    expect(Number('358')).assertEqual(358);
    expect(parseInt('166', 16)).assertEqual(358);
    expect(parseInt('101100110', 2)).assertEqual(358);
    expect((358).toString(16)).assertEqual('166');
    expect(Number.isInteger(358)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0028
   * @tc.name      testNumberSense0028
   * @tc.desc      Integer parse round 28
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testNumberSense0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testNumberSense0028', 'int parse 28');
    expect(parseInt('371', 10)).assertEqual(371);
    expect(Number('371')).assertEqual(371);
    expect(parseInt('173', 16)).assertEqual(371);
    expect(parseInt('101110011', 2)).assertEqual(371);
    expect((371).toString(16)).assertEqual('173');
    expect(Number.isInteger(371)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0029
   * @tc.name      testNumberSense0029
   * @tc.desc      Integer parse round 29
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testNumberSense0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testNumberSense0029', 'int parse 29');
    expect(parseInt('384', 10)).assertEqual(384);
    expect(Number('384')).assertEqual(384);
    expect(parseInt('180', 16)).assertEqual(384);
    expect(parseInt('110000000', 2)).assertEqual(384);
    expect((384).toString(16)).assertEqual('180');
    expect(Number.isInteger(384)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0030
   * @tc.name      testNumberSense0030
   * @tc.desc      Integer parse round 30
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testNumberSense0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testNumberSense0030', 'int parse 30');
    expect(parseInt('397', 10)).assertEqual(397);
    expect(Number('397')).assertEqual(397);
    expect(parseInt('18d', 16)).assertEqual(397);
    expect(parseInt('110001101', 2)).assertEqual(397);
    expect((397).toString(16)).assertEqual('18d');
    expect(Number.isInteger(397)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0031
   * @tc.name      testNumberSense0031
   * @tc.desc      Integer parse round 31
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testNumberSense0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testNumberSense0031', 'int parse 31');
    expect(parseInt('410', 10)).assertEqual(410);
    expect(Number('410')).assertEqual(410);
    expect(parseInt('19a', 16)).assertEqual(410);
    expect(parseInt('110011010', 2)).assertEqual(410);
    expect((410).toString(16)).assertEqual('19a');
    expect(Number.isInteger(410)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0032
   * @tc.name      testNumberSense0032
   * @tc.desc      Integer parse round 32
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testNumberSense0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testNumberSense0032', 'int parse 32');
    expect(parseInt('423', 10)).assertEqual(423);
    expect(Number('423')).assertEqual(423);
    expect(parseInt('1a7', 16)).assertEqual(423);
    expect(parseInt('110100111', 2)).assertEqual(423);
    expect((423).toString(16)).assertEqual('1a7');
    expect(Number.isInteger(423)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0033
   * @tc.name      testNumberSense0033
   * @tc.desc      Integer parse round 33
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testNumberSense0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testNumberSense0033', 'int parse 33');
    expect(parseInt('436', 10)).assertEqual(436);
    expect(Number('436')).assertEqual(436);
    expect(parseInt('1b4', 16)).assertEqual(436);
    expect(parseInt('110110100', 2)).assertEqual(436);
    expect((436).toString(16)).assertEqual('1b4');
    expect(Number.isInteger(436)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0034
   * @tc.name      testNumberSense0034
   * @tc.desc      Integer parse round 34
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testNumberSense0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testNumberSense0034', 'int parse 34');
    expect(parseInt('449', 10)).assertEqual(449);
    expect(Number('449')).assertEqual(449);
    expect(parseInt('1c1', 16)).assertEqual(449);
    expect(parseInt('111000001', 2)).assertEqual(449);
    expect((449).toString(16)).assertEqual('1c1');
    expect(Number.isInteger(449)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0035
   * @tc.name      testNumberSense0035
   * @tc.desc      Integer parse round 35
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testNumberSense0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testNumberSense0035', 'int parse 35');
    expect(parseInt('462', 10)).assertEqual(462);
    expect(Number('462')).assertEqual(462);
    expect(parseInt('1ce', 16)).assertEqual(462);
    expect(parseInt('111001110', 2)).assertEqual(462);
    expect((462).toString(16)).assertEqual('1ce');
    expect(Number.isInteger(462)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0036
   * @tc.name      testNumberSense0036
   * @tc.desc      Integer parse round 36
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testNumberSense0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testNumberSense0036', 'int parse 36');
    expect(parseInt('475', 10)).assertEqual(475);
    expect(Number('475')).assertEqual(475);
    expect(parseInt('1db', 16)).assertEqual(475);
    expect(parseInt('111011011', 2)).assertEqual(475);
    expect((475).toString(16)).assertEqual('1db');
    expect(Number.isInteger(475)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0037
   * @tc.name      testNumberSense0037
   * @tc.desc      Integer parse round 37
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testNumberSense0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testNumberSense0037', 'int parse 37');
    expect(parseInt('488', 10)).assertEqual(488);
    expect(Number('488')).assertEqual(488);
    expect(parseInt('1e8', 16)).assertEqual(488);
    expect(parseInt('111101000', 2)).assertEqual(488);
    expect((488).toString(16)).assertEqual('1e8');
    expect(Number.isInteger(488)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0038
   * @tc.name      testNumberSense0038
   * @tc.desc      Integer parse round 38
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testNumberSense0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testNumberSense0038', 'int parse 38');
    expect(parseInt('501', 10)).assertEqual(501);
    expect(Number('501')).assertEqual(501);
    expect(parseInt('1f5', 16)).assertEqual(501);
    expect(parseInt('111110101', 2)).assertEqual(501);
    expect((501).toString(16)).assertEqual('1f5');
    expect(Number.isInteger(501)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0039
   * @tc.name      testNumberSense0039
   * @tc.desc      Integer parse round 39
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testNumberSense0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testNumberSense0039', 'int parse 39');
    expect(parseInt('514', 10)).assertEqual(514);
    expect(Number('514')).assertEqual(514);
    expect(parseInt('202', 16)).assertEqual(514);
    expect(parseInt('1000000010', 2)).assertEqual(514);
    expect((514).toString(16)).assertEqual('202');
    expect(Number.isInteger(514)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0040
   * @tc.name      testNumberSense0040
   * @tc.desc      Integer parse round 40
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testNumberSense0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testNumberSense0040', 'int parse 40');
    expect(parseInt('527', 10)).assertEqual(527);
    expect(Number('527')).assertEqual(527);
    expect(parseInt('20f', 16)).assertEqual(527);
    expect(parseInt('1000001111', 2)).assertEqual(527);
    expect((527).toString(16)).assertEqual('20f');
    expect(Number.isInteger(527)).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0041
   * @tc.name      testNumberSense0041
   * @tc.desc      Float parse case 1
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testNumberSense0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testNumberSense0041', 'float parse 1');
    const value: number = parseFloat('0.5');
    expect(Math.abs(value - 0.5) < 0.000001).assertTrue();
    expect(value > 0).assertTrue();
    expect(Number.isFinite(value)).assertTrue();
    expect(Number.isInteger(value)).assertFalse();
    expect(value === Number('0.5')).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0042
   * @tc.name      testNumberSense0042
   * @tc.desc      Float parse case 2
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testNumberSense0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testNumberSense0042', 'float parse 2');
    const value: number = parseFloat('1.25');
    expect(Math.abs(value - 1.25) < 0.000001).assertTrue();
    expect(value > 0).assertTrue();
    expect(Number.isFinite(value)).assertTrue();
    expect(Number.isInteger(value)).assertFalse();
    expect(value === Number('1.25')).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0043
   * @tc.name      testNumberSense0043
   * @tc.desc      Float parse case 3
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testNumberSense0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testNumberSense0043', 'float parse 3');
    const value: number = parseFloat('2.5');
    expect(Math.abs(value - 2.5) < 0.000001).assertTrue();
    expect(value > 0).assertTrue();
    expect(Number.isFinite(value)).assertTrue();
    expect(Number.isInteger(value)).assertFalse();
    expect(value === Number('2.5')).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0044
   * @tc.name      testNumberSense0044
   * @tc.desc      Float parse case 4
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testNumberSense0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testNumberSense0044', 'float parse 4');
    const value: number = parseFloat('3.75');
    expect(Math.abs(value - 3.75) < 0.000001).assertTrue();
    expect(value > 0).assertTrue();
    expect(Number.isFinite(value)).assertTrue();
    expect(Number.isInteger(value)).assertFalse();
    expect(value === Number('3.75')).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0045
   * @tc.name      testNumberSense0045
   * @tc.desc      Float parse case 5
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testNumberSense0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testNumberSense0045', 'float parse 5');
    const value: number = parseFloat('10.125');
    expect(Math.abs(value - 10.125) < 0.000001).assertTrue();
    expect(value > 0).assertTrue();
    expect(Number.isFinite(value)).assertTrue();
    expect(Number.isInteger(value)).assertFalse();
    expect(value === Number('10.125')).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0046
   * @tc.name      testNumberSense0046
   * @tc.desc      Float parse case 6
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testNumberSense0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testNumberSense0046', 'float parse 6');
    const value: number = parseFloat('12.345');
    expect(Math.abs(value - 12.345) < 0.000001).assertTrue();
    expect(value > 0).assertTrue();
    expect(Number.isFinite(value)).assertTrue();
    expect(Number.isInteger(value)).assertFalse();
    expect(value === Number('12.345')).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0047
   * @tc.name      testNumberSense0047
   * @tc.desc      Float parse case 7
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testNumberSense0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testNumberSense0047', 'float parse 7');
    const value: number = parseFloat('99.99');
    expect(Math.abs(value - 99.99) < 0.000001).assertTrue();
    expect(value > 0).assertTrue();
    expect(Number.isFinite(value)).assertTrue();
    expect(Number.isInteger(value)).assertFalse();
    expect(value === Number('99.99')).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0048
   * @tc.name      testNumberSense0048
   * @tc.desc      Float parse case 8
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testNumberSense0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testNumberSense0048', 'float parse 8');
    const value: number = parseFloat('0.001');
    expect(Math.abs(value - 0.001) < 0.000001).assertTrue();
    expect(value > 0).assertTrue();
    expect(Number.isFinite(value)).assertTrue();
    expect(Number.isInteger(value)).assertFalse();
    expect(value === Number('0.001')).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0049
   * @tc.name      testNumberSense0049
   * @tc.desc      Float parse case 9
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testNumberSense0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testNumberSense0049', 'float parse 9');
    const value: number = parseFloat('7.5');
    expect(Math.abs(value - 7.5) < 0.000001).assertTrue();
    expect(value > 0).assertTrue();
    expect(Number.isFinite(value)).assertTrue();
    expect(Number.isInteger(value)).assertFalse();
    expect(value === Number('7.5')).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0050
   * @tc.name      testNumberSense0050
   * @tc.desc      Float parse case 10
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testNumberSense0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testNumberSense0050', 'float parse 10');
    const value: number = parseFloat('8.25');
    expect(Math.abs(value - 8.25) < 0.000001).assertTrue();
    expect(value > 0).assertTrue();
    expect(Number.isFinite(value)).assertTrue();
    expect(Number.isInteger(value)).assertFalse();
    expect(value === Number('8.25')).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0051
   * @tc.name      testNumberSense0051
   * @tc.desc      Float parse case 11
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testNumberSense0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testNumberSense0051', 'float parse 11');
    const value: number = parseFloat('15.75');
    expect(Math.abs(value - 15.75) < 0.000001).assertTrue();
    expect(value > 0).assertTrue();
    expect(Number.isFinite(value)).assertTrue();
    expect(Number.isInteger(value)).assertFalse();
    expect(value === Number('15.75')).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0052
   * @tc.name      testNumberSense0052
   * @tc.desc      Float parse case 12
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testNumberSense0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testNumberSense0052', 'float parse 12');
    const value: number = parseFloat('24.99');
    expect(Math.abs(value - 24.99) < 0.000001).assertTrue();
    expect(value > 0).assertTrue();
    expect(Number.isFinite(value)).assertTrue();
    expect(Number.isInteger(value)).assertFalse();
    expect(value === Number('24.99')).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0053
   * @tc.name      testNumberSense0053
   * @tc.desc      Float parse case 13
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testNumberSense0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testNumberSense0053', 'float parse 13');
    const value: number = parseFloat('31.5');
    expect(Math.abs(value - 31.5) < 0.000001).assertTrue();
    expect(value > 0).assertTrue();
    expect(Number.isFinite(value)).assertTrue();
    expect(Number.isInteger(value)).assertFalse();
    expect(value === Number('31.5')).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0054
   * @tc.name      testNumberSense0054
   * @tc.desc      Float parse case 14
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testNumberSense0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testNumberSense0054', 'float parse 14');
    const value: number = parseFloat('45.05');
    expect(Math.abs(value - 45.05) < 0.000001).assertTrue();
    expect(value > 0).assertTrue();
    expect(Number.isFinite(value)).assertTrue();
    expect(Number.isInteger(value)).assertFalse();
    expect(value === Number('45.05')).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0055
   * @tc.name      testNumberSense0055
   * @tc.desc      Float parse case 15
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testNumberSense0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testNumberSense0055', 'float parse 15');
    const value: number = parseFloat('55.55');
    expect(Math.abs(value - 55.55) < 0.000001).assertTrue();
    expect(value > 0).assertTrue();
    expect(Number.isFinite(value)).assertTrue();
    expect(Number.isInteger(value)).assertFalse();
    expect(value === Number('55.55')).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0056
   * @tc.name      testNumberSense0056
   * @tc.desc      Float parse case 16
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testNumberSense0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testNumberSense0056', 'float parse 16');
    const value: number = parseFloat('63.125');
    expect(Math.abs(value - 63.125) < 0.000001).assertTrue();
    expect(value > 0).assertTrue();
    expect(Number.isFinite(value)).assertTrue();
    expect(Number.isInteger(value)).assertFalse();
    expect(value === Number('63.125')).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0057
   * @tc.name      testNumberSense0057
   * @tc.desc      Float parse case 17
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testNumberSense0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testNumberSense0057', 'float parse 17');
    const value: number = parseFloat('77.7');
    expect(Math.abs(value - 77.7) < 0.000001).assertTrue();
    expect(value > 0).assertTrue();
    expect(Number.isFinite(value)).assertTrue();
    expect(Number.isInteger(value)).assertFalse();
    expect(value === Number('77.7')).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0058
   * @tc.name      testNumberSense0058
   * @tc.desc      Float parse case 18
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testNumberSense0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testNumberSense0058', 'float parse 18');
    const value: number = parseFloat('88.88');
    expect(Math.abs(value - 88.88) < 0.000001).assertTrue();
    expect(value > 0).assertTrue();
    expect(Number.isFinite(value)).assertTrue();
    expect(Number.isInteger(value)).assertFalse();
    expect(value === Number('88.88')).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0059
   * @tc.name      testNumberSense0059
   * @tc.desc      Float parse case 19
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testNumberSense0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testNumberSense0059', 'float parse 19');
    const value: number = parseFloat('95.25');
    expect(Math.abs(value - 95.25) < 0.000001).assertTrue();
    expect(value > 0).assertTrue();
    expect(Number.isFinite(value)).assertTrue();
    expect(Number.isInteger(value)).assertFalse();
    expect(value === Number('95.25')).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0060
   * @tc.name      testNumberSense0060
   * @tc.desc      Float parse case 20
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testNumberSense0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testNumberSense0060', 'float parse 20');
    const value: number = parseFloat('100.01');
    expect(Math.abs(value - 100.01) < 0.000001).assertTrue();
    expect(value > 0).assertTrue();
    expect(Number.isFinite(value)).assertTrue();
    expect(Number.isInteger(value)).assertFalse();
    expect(value === Number('100.01')).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0061
   * @tc.name      testNumberSense0061
   * @tc.desc      ToFixed 1 at 0 digits
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testNumberSense0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testNumberSense0061', 'toFixed 1-0');
    const value: number = 1.3;
    expect(value.toFixed(0)).assertEqual('1');
    expect(value.toFixed(0).length >= 1).assertTrue();
    expect(Number(value.toFixed(0)) >= 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0062
   * @tc.name      testNumberSense0062
   * @tc.desc      ToFixed 1 at 1 digits
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testNumberSense0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testNumberSense0062', 'toFixed 1-1');
    const value: number = 1.3;
    expect(value.toFixed(1)).assertEqual('1.3');
    expect(value.toFixed(1).length >= 3).assertTrue();
    expect(Number(value.toFixed(1)) >= 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0063
   * @tc.name      testNumberSense0063
   * @tc.desc      ToFixed 1 at 2 digits
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testNumberSense0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testNumberSense0063', 'toFixed 1-2');
    const value: number = 1.3;
    expect(value.toFixed(2)).assertEqual('1.30');
    expect(value.toFixed(2).length >= 4).assertTrue();
    expect(Number(value.toFixed(2)) >= 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0064
   * @tc.name      testNumberSense0064
   * @tc.desc      ToFixed 2 at 0 digits
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testNumberSense0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testNumberSense0064', 'toFixed 2-0');
    const value: number = 2.6;
    expect(value.toFixed(0)).assertEqual('3');
    expect(value.toFixed(0).length >= 1).assertTrue();
    expect(Number(value.toFixed(0)) >= 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0065
   * @tc.name      testNumberSense0065
   * @tc.desc      ToFixed 2 at 1 digits
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testNumberSense0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testNumberSense0065', 'toFixed 2-1');
    const value: number = 2.6;
    expect(value.toFixed(1)).assertEqual('2.6');
    expect(value.toFixed(1).length >= 3).assertTrue();
    expect(Number(value.toFixed(1)) >= 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0066
   * @tc.name      testNumberSense0066
   * @tc.desc      ToFixed 2 at 2 digits
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testNumberSense0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testNumberSense0066', 'toFixed 2-2');
    const value: number = 2.6;
    expect(value.toFixed(2)).assertEqual('2.60');
    expect(value.toFixed(2).length >= 4).assertTrue();
    expect(Number(value.toFixed(2)) >= 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0067
   * @tc.name      testNumberSense0067
   * @tc.desc      ToFixed 3 at 0 digits
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testNumberSense0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testNumberSense0067', 'toFixed 3-0');
    const value: number = 3.9;
    expect(value.toFixed(0)).assertEqual('4');
    expect(value.toFixed(0).length >= 1).assertTrue();
    expect(Number(value.toFixed(0)) >= 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0068
   * @tc.name      testNumberSense0068
   * @tc.desc      ToFixed 3 at 1 digits
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testNumberSense0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testNumberSense0068', 'toFixed 3-1');
    const value: number = 3.9;
    expect(value.toFixed(1)).assertEqual('3.9');
    expect(value.toFixed(1).length >= 3).assertTrue();
    expect(Number(value.toFixed(1)) >= 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0069
   * @tc.name      testNumberSense0069
   * @tc.desc      ToFixed 3 at 2 digits
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testNumberSense0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testNumberSense0069', 'toFixed 3-2');
    const value: number = 3.9;
    expect(value.toFixed(2)).assertEqual('3.90');
    expect(value.toFixed(2).length >= 4).assertTrue();
    expect(Number(value.toFixed(2)) >= 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0070
   * @tc.name      testNumberSense0070
   * @tc.desc      ToFixed 4 at 0 digits
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testNumberSense0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testNumberSense0070', 'toFixed 4-0');
    const value: number = 5.2;
    expect(value.toFixed(0)).assertEqual('5');
    expect(value.toFixed(0).length >= 1).assertTrue();
    expect(Number(value.toFixed(0)) >= 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0071
   * @tc.name      testNumberSense0071
   * @tc.desc      ToFixed 4 at 1 digits
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testNumberSense0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testNumberSense0071', 'toFixed 4-1');
    const value: number = 5.2;
    expect(value.toFixed(1)).assertEqual('5.2');
    expect(value.toFixed(1).length >= 3).assertTrue();
    expect(Number(value.toFixed(1)) >= 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0072
   * @tc.name      testNumberSense0072
   * @tc.desc      ToFixed 4 at 2 digits
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testNumberSense0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testNumberSense0072', 'toFixed 4-2');
    const value: number = 5.2;
    expect(value.toFixed(2)).assertEqual('5.20');
    expect(value.toFixed(2).length >= 4).assertTrue();
    expect(Number(value.toFixed(2)) >= 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0073
   * @tc.name      testNumberSense0073
   * @tc.desc      ToFixed 5 at 0 digits
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testNumberSense0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testNumberSense0073', 'toFixed 5-0');
    const value: number = 6.6;
    expect(value.toFixed(0)).assertEqual('7');
    expect(value.toFixed(0).length >= 1).assertTrue();
    expect(Number(value.toFixed(0)) >= 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0074
   * @tc.name      testNumberSense0074
   * @tc.desc      ToFixed 5 at 1 digits
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testNumberSense0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testNumberSense0074', 'toFixed 5-1');
    const value: number = 6.6;
    expect(value.toFixed(1)).assertEqual('6.6');
    expect(value.toFixed(1).length >= 3).assertTrue();
    expect(Number(value.toFixed(1)) >= 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0075
   * @tc.name      testNumberSense0075
   * @tc.desc      ToFixed 5 at 2 digits
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testNumberSense0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testNumberSense0075', 'toFixed 5-2');
    const value: number = 6.6;
    expect(value.toFixed(2)).assertEqual('6.60');
    expect(value.toFixed(2).length >= 4).assertTrue();
    expect(Number(value.toFixed(2)) >= 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0076
   * @tc.name      testNumberSense0076
   * @tc.desc      ToFixed 6 at 0 digits
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testNumberSense0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testNumberSense0076', 'toFixed 6-0');
    const value: number = 7.8;
    expect(value.toFixed(0)).assertEqual('8');
    expect(value.toFixed(0).length >= 1).assertTrue();
    expect(Number(value.toFixed(0)) >= 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0077
   * @tc.name      testNumberSense0077
   * @tc.desc      ToFixed 6 at 1 digits
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testNumberSense0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testNumberSense0077', 'toFixed 6-1');
    const value: number = 7.8;
    expect(value.toFixed(1)).assertEqual('7.8');
    expect(value.toFixed(1).length >= 3).assertTrue();
    expect(Number(value.toFixed(1)) >= 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0078
   * @tc.name      testNumberSense0078
   * @tc.desc      ToFixed 6 at 2 digits
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testNumberSense0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testNumberSense0078', 'toFixed 6-2');
    const value: number = 7.8;
    expect(value.toFixed(2)).assertEqual('7.80');
    expect(value.toFixed(2).length >= 4).assertTrue();
    expect(Number(value.toFixed(2)) >= 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0079
   * @tc.name      testNumberSense0079
   * @tc.desc      ToFixed 7 at 0 digits
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testNumberSense0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testNumberSense0079', 'toFixed 7-0');
    const value: number = 9.1;
    expect(value.toFixed(0)).assertEqual('9');
    expect(value.toFixed(0).length >= 1).assertTrue();
    expect(Number(value.toFixed(0)) >= 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0080
   * @tc.name      testNumberSense0080
   * @tc.desc      ToFixed 7 at 1 digits
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testNumberSense0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testNumberSense0080', 'toFixed 7-1');
    const value: number = 9.1;
    expect(value.toFixed(1)).assertEqual('9.1');
    expect(value.toFixed(1).length >= 3).assertTrue();
    expect(Number(value.toFixed(1)) >= 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0081
   * @tc.name      testNumberSense0081
   * @tc.desc      ToFixed 7 at 2 digits
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testNumberSense0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testNumberSense0081', 'toFixed 7-2');
    const value: number = 9.1;
    expect(value.toFixed(2)).assertEqual('9.10');
    expect(value.toFixed(2).length >= 4).assertTrue();
    expect(Number(value.toFixed(2)) >= 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0082
   * @tc.name      testNumberSense0082
   * @tc.desc      ToFixed 8 at 0 digits
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testNumberSense0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testNumberSense0082', 'toFixed 8-0');
    const value: number = 10.4;
    expect(value.toFixed(0)).assertEqual('10');
    expect(value.toFixed(0).length >= 2).assertTrue();
    expect(Number(value.toFixed(0)) >= 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0083
   * @tc.name      testNumberSense0083
   * @tc.desc      ToFixed 8 at 1 digits
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testNumberSense0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testNumberSense0083', 'toFixed 8-1');
    const value: number = 10.4;
    expect(value.toFixed(1)).assertEqual('10.4');
    expect(value.toFixed(1).length >= 4).assertTrue();
    expect(Number(value.toFixed(1)) >= 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0084
   * @tc.name      testNumberSense0084
   * @tc.desc      ToFixed 8 at 2 digits
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testNumberSense0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testNumberSense0084', 'toFixed 8-2');
    const value: number = 10.4;
    expect(value.toFixed(2)).assertEqual('10.40');
    expect(value.toFixed(2).length >= 5).assertTrue();
    expect(Number(value.toFixed(2)) >= 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_NUM_0085
   * @tc.name      testNumberSense0085
   * @tc.desc      ToFixed 9 at 0 digits
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testNumberSense0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testNumberSense0085', 'toFixed 9-0');
    const value: number = 11.7;
    expect(value.toFixed(0)).assertEqual('12');
    expect(value.toFixed(0).length >= 2).assertTrue();
    expect(Number(value.toFixed(0)) >= 0).assertTrue();
  });
  });
}
