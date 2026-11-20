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

export default function versionMatrixTest() {
  describe('versionMatrixTest', () => {
  beforeEach(async () => {
    await paceTurn();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_VER_0001
   * @tc.name      testVersion0001
   * @tc.desc      Version 1 keeps code mapping
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testVersion0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testVersion0001', 'version 1');
    const code: number = 1010000;
    const name: string = '1.1.0';
    expect(code / 10000 - 100).assertEqual(1);
    expect(code % 10000).assertEqual(0);
    expect(code.toString().length).assertEqual(7);
    expect(name.split('.').length).assertEqual(3);
    expect(name.split('.')[1]).assertEqual('1');
    expect(name.length).assertEqual(5);
    expect(name.indexOf('.')).assertEqual(1);
    expect(name.endsWith('.0')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_VER_0002
   * @tc.name      testVersion0002
   * @tc.desc      Version 2 keeps code mapping
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testVersion0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testVersion0002', 'version 2');
    const code: number = 1020000;
    const name: string = '1.2.0';
    expect(code / 10000 - 100).assertEqual(2);
    expect(code % 10000).assertEqual(0);
    expect(code.toString().length).assertEqual(7);
    expect(name.split('.').length).assertEqual(3);
    expect(name.split('.')[1]).assertEqual('2');
    expect(name.length).assertEqual(5);
    expect(name.indexOf('.')).assertEqual(1);
    expect(name.endsWith('.0')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_VER_0003
   * @tc.name      testVersion0003
   * @tc.desc      Version 3 keeps code mapping
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testVersion0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testVersion0003', 'version 3');
    const code: number = 1030000;
    const name: string = '1.3.0';
    expect(code / 10000 - 100).assertEqual(3);
    expect(code % 10000).assertEqual(0);
    expect(code.toString().length).assertEqual(7);
    expect(name.split('.').length).assertEqual(3);
    expect(name.split('.')[1]).assertEqual('3');
    expect(name.length).assertEqual(5);
    expect(name.indexOf('.')).assertEqual(1);
    expect(name.endsWith('.0')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_VER_0004
   * @tc.name      testVersion0004
   * @tc.desc      Version 4 keeps code mapping
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testVersion0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testVersion0004', 'version 4');
    const code: number = 1040000;
    const name: string = '1.4.0';
    expect(code / 10000 - 100).assertEqual(4);
    expect(code % 10000).assertEqual(0);
    expect(code.toString().length).assertEqual(7);
    expect(name.split('.').length).assertEqual(3);
    expect(name.split('.')[1]).assertEqual('4');
    expect(name.length).assertEqual(5);
    expect(name.indexOf('.')).assertEqual(1);
    expect(name.endsWith('.0')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_VER_0005
   * @tc.name      testVersion0005
   * @tc.desc      Version 5 keeps code mapping
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testVersion0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testVersion0005', 'version 5');
    const code: number = 1050000;
    const name: string = '1.5.0';
    expect(code / 10000 - 100).assertEqual(5);
    expect(code % 10000).assertEqual(0);
    expect(code.toString().length).assertEqual(7);
    expect(name.split('.').length).assertEqual(3);
    expect(name.split('.')[1]).assertEqual('5');
    expect(name.length).assertEqual(5);
    expect(name.indexOf('.')).assertEqual(1);
    expect(name.endsWith('.0')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_VER_0006
   * @tc.name      testVersion0006
   * @tc.desc      Version 6 keeps code mapping
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testVersion0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testVersion0006', 'version 6');
    const code: number = 1060000;
    const name: string = '1.6.0';
    expect(code / 10000 - 100).assertEqual(6);
    expect(code % 10000).assertEqual(0);
    expect(code.toString().length).assertEqual(7);
    expect(name.split('.').length).assertEqual(3);
    expect(name.split('.')[1]).assertEqual('6');
    expect(name.length).assertEqual(5);
    expect(name.indexOf('.')).assertEqual(1);
    expect(name.endsWith('.0')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_VER_0007
   * @tc.name      testVersion0007
   * @tc.desc      Version 7 keeps code mapping
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testVersion0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testVersion0007', 'version 7');
    const code: number = 1070000;
    const name: string = '1.7.0';
    expect(code / 10000 - 100).assertEqual(7);
    expect(code % 10000).assertEqual(0);
    expect(code.toString().length).assertEqual(7);
    expect(name.split('.').length).assertEqual(3);
    expect(name.split('.')[1]).assertEqual('7');
    expect(name.length).assertEqual(5);
    expect(name.indexOf('.')).assertEqual(1);
    expect(name.endsWith('.0')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_VER_0008
   * @tc.name      testVersion0008
   * @tc.desc      Version 8 keeps code mapping
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testVersion0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testVersion0008', 'version 8');
    const code: number = 1080000;
    const name: string = '1.8.0';
    expect(code / 10000 - 100).assertEqual(8);
    expect(code % 10000).assertEqual(0);
    expect(code.toString().length).assertEqual(7);
    expect(name.split('.').length).assertEqual(3);
    expect(name.split('.')[1]).assertEqual('8');
    expect(name.length).assertEqual(5);
    expect(name.indexOf('.')).assertEqual(1);
    expect(name.endsWith('.0')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_VER_0009
   * @tc.name      testVersion0009
   * @tc.desc      Version 9 keeps code mapping
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testVersion0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testVersion0009', 'version 9');
    const code: number = 1090000;
    const name: string = '1.9.0';
    expect(code / 10000 - 100).assertEqual(9);
    expect(code % 10000).assertEqual(0);
    expect(code.toString().length).assertEqual(7);
    expect(name.split('.').length).assertEqual(3);
    expect(name.split('.')[1]).assertEqual('9');
    expect(name.length).assertEqual(5);
    expect(name.indexOf('.')).assertEqual(1);
    expect(name.endsWith('.0')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_VER_0010
   * @tc.name      testVersion0010
   * @tc.desc      Version 10 keeps code mapping
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testVersion0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testVersion0010', 'version 10');
    const code: number = 1100000;
    const name: string = '1.10.0';
    expect(code / 10000 - 100).assertEqual(10);
    expect(code % 10000).assertEqual(0);
    expect(code.toString().length).assertEqual(7);
    expect(name.split('.').length).assertEqual(3);
    expect(name.split('.')[1]).assertEqual('10');
    expect(name.length).assertEqual(6);
    expect(name.indexOf('.')).assertEqual(1);
    expect(name.endsWith('.0')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_VER_0011
   * @tc.name      testVersion0011
   * @tc.desc      Version 11 keeps code mapping
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testVersion0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testVersion0011', 'version 11');
    const code: number = 1110000;
    const name: string = '1.11.0';
    expect(code / 10000 - 100).assertEqual(11);
    expect(code % 10000).assertEqual(0);
    expect(code.toString().length).assertEqual(7);
    expect(name.split('.').length).assertEqual(3);
    expect(name.split('.')[1]).assertEqual('11');
    expect(name.length).assertEqual(6);
    expect(name.indexOf('.')).assertEqual(1);
    expect(name.endsWith('.0')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_VER_0012
   * @tc.name      testVersion0012
   * @tc.desc      Version 12 keeps code mapping
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testVersion0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testVersion0012', 'version 12');
    const code: number = 1120000;
    const name: string = '1.12.0';
    expect(code / 10000 - 100).assertEqual(12);
    expect(code % 10000).assertEqual(0);
    expect(code.toString().length).assertEqual(7);
    expect(name.split('.').length).assertEqual(3);
    expect(name.split('.')[1]).assertEqual('12');
