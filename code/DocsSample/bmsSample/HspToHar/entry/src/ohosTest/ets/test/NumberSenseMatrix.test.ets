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
   * @tc.number    SUB_BMS_HSPTOHAR_NUM_0001
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
   * @tc.number    SUB_BMS_HSPTOHAR_NUM_0002
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
   * @tc.number    SUB_BMS_HSPTOHAR_NUM_0003
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
   * @tc.number    SUB_BMS_HSPTOHAR_NUM_0004
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
   * @tc.number    SUB_BMS_HSPTOHAR_NUM_0005
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
   * @tc.number    SUB_BMS_HSPTOHAR_NUM_0006
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
   * @tc.number    SUB_BMS_HSPTOHAR_NUM_0007
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
   * @tc.number    SUB_BMS_HSPTOHAR_NUM_0008
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
   * @tc.number    SUB_BMS_HSPTOHAR_NUM_0009
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
   * @tc.number    SUB_BMS_HSPTOHAR_NUM_0010
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
   * @tc.number    SUB_BMS_HSPTOHAR_NUM_0011
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
   * @tc.number    SUB_BMS_HSPTOHAR_NUM_0012
   * @tc.name      testNumberSense0012
   * @tc.desc      Integer parse round 12
   * @tc.size      MEDIUMTEST
