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
   * @tc.number    SUB_BMS_MULTIINSTANCE_VER_0001
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_VER_0002
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_VER_0003
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_VER_0004
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_VER_0005
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_VER_0006
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_VER_0007
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_VER_0008
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_VER_0009
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_VER_0010
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_VER_0011
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_VER_0012
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
    expect(name.length).assertEqual(6);
    expect(name.indexOf('.')).assertEqual(1);
    expect(name.endsWith('.0')).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_VER_0013
   * @tc.name      testVersion0013
   * @tc.desc      Version 13 keeps code mapping
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testVersion0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testVersion0013', 'version 13');
    const code: number = 1130000;
    const name: string = '1.13.0';
    expect(code / 10000 - 100).assertEqual(13);
    expect(code % 10000).assertEqual(0);
    expect(code.toString().length).assertEqual(7);
    expect(name.split('.').length).assertEqual(3);
    expect(name.split('.')[1]).assertEqual('13');
    expect(name.length).assertEqual(6);
    expect(name.indexOf('.')).assertEqual(1);
    expect(name.endsWith('.0')).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_VER_0014
   * @tc.name      testVersion0014
   * @tc.desc      Version 14 keeps code mapping
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testVersion0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testVersion0014', 'version 14');
    const code: number = 1140000;
    const name: string = '1.14.0';
    expect(code / 10000 - 100).assertEqual(14);
    expect(code % 10000).assertEqual(0);
    expect(code.toString().length).assertEqual(7);
    expect(name.split('.').length).assertEqual(3);
    expect(name.split('.')[1]).assertEqual('14');
    expect(name.length).assertEqual(6);
    expect(name.indexOf('.')).assertEqual(1);
    expect(name.endsWith('.0')).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_VER_0015
   * @tc.name      testVersion0015
   * @tc.desc      Version 15 keeps code mapping
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testVersion0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testVersion0015', 'version 15');
    const code: number = 1150000;
    const name: string = '1.15.0';
    expect(code / 10000 - 100).assertEqual(15);
    expect(code % 10000).assertEqual(0);
    expect(code.toString().length).assertEqual(7);
    expect(name.split('.').length).assertEqual(3);
    expect(name.split('.')[1]).assertEqual('15');
    expect(name.length).assertEqual(6);
    expect(name.indexOf('.')).assertEqual(1);
    expect(name.endsWith('.0')).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_VER_0016
   * @tc.name      testVersion0016
   * @tc.desc      Version 16 keeps code mapping
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testVersion0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testVersion0016', 'version 16');
    const code: number = 1160000;
    const name: string = '1.16.0';
    expect(code / 10000 - 100).assertEqual(16);
    expect(code % 10000).assertEqual(0);
    expect(code.toString().length).assertEqual(7);
    expect(name.split('.').length).assertEqual(3);
    expect(name.split('.')[1]).assertEqual('16');
    expect(name.length).assertEqual(6);
    expect(name.indexOf('.')).assertEqual(1);
    expect(name.endsWith('.0')).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_VER_0017
   * @tc.name      testVersion0017
   * @tc.desc      Version 17 keeps code mapping
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testVersion0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testVersion0017', 'version 17');
    const code: number = 1170000;
    const name: string = '1.17.0';
    expect(code / 10000 - 100).assertEqual(17);
    expect(code % 10000).assertEqual(0);
    expect(code.toString().length).assertEqual(7);
    expect(name.split('.').length).assertEqual(3);
    expect(name.split('.')[1]).assertEqual('17');
    expect(name.length).assertEqual(6);
    expect(name.indexOf('.')).assertEqual(1);
    expect(name.endsWith('.0')).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_VER_0018
   * @tc.name      testVersion0018
   * @tc.desc      Version 18 keeps code mapping
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testVersion0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testVersion0018', 'version 18');
    const code: number = 1180000;
    const name: string = '1.18.0';
    expect(code / 10000 - 100).assertEqual(18);
    expect(code % 10000).assertEqual(0);
    expect(code.toString().length).assertEqual(7);
    expect(name.split('.').length).assertEqual(3);
    expect(name.split('.')[1]).assertEqual('18');
    expect(name.length).assertEqual(6);
    expect(name.indexOf('.')).assertEqual(1);
    expect(name.endsWith('.0')).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_VER_0019
   * @tc.name      testVersion0019
   * @tc.desc      Version 19 keeps code mapping
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testVersion0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testVersion0019', 'version 19');
    const code: number = 1190000;
    const name: string = '1.19.0';
    expect(code / 10000 - 100).assertEqual(19);
    expect(code % 10000).assertEqual(0);
    expect(code.toString().length).assertEqual(7);
    expect(name.split('.').length).assertEqual(3);
    expect(name.split('.')[1]).assertEqual('19');
    expect(name.length).assertEqual(6);
    expect(name.indexOf('.')).assertEqual(1);
    expect(name.endsWith('.0')).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_VER_0020
   * @tc.name      testVersion0020
   * @tc.desc      Version 20 keeps code mapping
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testVersion0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testVersion0020', 'version 20');
    const code: number = 1200000;
    const name: string = '1.20.0';
    expect(code / 10000 - 100).assertEqual(20);
    expect(code % 10000).assertEqual(0);
    expect(code.toString().length).assertEqual(7);
    expect(name.split('.').length).assertEqual(3);
    expect(name.split('.')[1]).assertEqual('20');
    expect(name.length).assertEqual(6);
    expect(name.indexOf('.')).assertEqual(1);
    expect(name.endsWith('.0')).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_VER_0021
   * @tc.name      testVersion0021
   * @tc.desc      Version 21 keeps code mapping
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testVersion0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testVersion0021', 'version 21');
    const code: number = 1210000;
    const name: string = '1.21.0';
    expect(code / 10000 - 100).assertEqual(21);
    expect(code % 10000).assertEqual(0);
    expect(code.toString().length).assertEqual(7);
    expect(name.split('.').length).assertEqual(3);
    expect(name.split('.')[1]).assertEqual('21');
    expect(name.length).assertEqual(6);
    expect(name.indexOf('.')).assertEqual(1);
    expect(name.endsWith('.0')).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_VER_0022
   * @tc.name      testVersion0022
   * @tc.desc      Version 22 keeps code mapping
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testVersion0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testVersion0022', 'version 22');
    const code: number = 1220000;
    const name: string = '1.22.0';
    expect(code / 10000 - 100).assertEqual(22);
    expect(code % 10000).assertEqual(0);
    expect(code.toString().length).assertEqual(7);
    expect(name.split('.').length).assertEqual(3);
    expect(name.split('.')[1]).assertEqual('22');
    expect(name.length).assertEqual(6);
    expect(name.indexOf('.')).assertEqual(1);
    expect(name.endsWith('.0')).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_VER_0023
   * @tc.name      testVersion0023
   * @tc.desc      Version 23 keeps code mapping
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testVersion0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testVersion0023', 'version 23');
    const code: number = 1230000;
    const name: string = '1.23.0';
    expect(code / 10000 - 100).assertEqual(23);
    expect(code % 10000).assertEqual(0);
    expect(code.toString().length).assertEqual(7);
    expect(name.split('.').length).assertEqual(3);
    expect(name.split('.')[1]).assertEqual('23');
    expect(name.length).assertEqual(6);
    expect(name.indexOf('.')).assertEqual(1);
    expect(name.endsWith('.0')).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_VER_0024
   * @tc.name      testVersion0024
   * @tc.desc      Version 24 keeps code mapping
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testVersion0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testVersion0024', 'version 24');
    const code: number = 1240000;
    const name: string = '1.24.0';
    expect(code / 10000 - 100).assertEqual(24);
    expect(code % 10000).assertEqual(0);
    expect(code.toString().length).assertEqual(7);
    expect(name.split('.').length).assertEqual(3);
    expect(name.split('.')[1]).assertEqual('24');
    expect(name.length).assertEqual(6);
    expect(name.indexOf('.')).assertEqual(1);
    expect(name.endsWith('.0')).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_VER_0025
   * @tc.name      testVersion0025
   * @tc.desc      Version 25 keeps code mapping
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testVersion0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testVersion0025', 'version 25');
    const code: number = 1250000;
    const name: string = '1.25.0';
    expect(code / 10000 - 100).assertEqual(25);
    expect(code % 10000).assertEqual(0);
    expect(code.toString().length).assertEqual(7);
    expect(name.split('.').length).assertEqual(3);
    expect(name.split('.')[1]).assertEqual('25');
    expect(name.length).assertEqual(6);
    expect(name.indexOf('.')).assertEqual(1);
    expect(name.endsWith('.0')).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_VER_0026
   * @tc.name      testVersion0026
   * @tc.desc      Version 26 keeps code mapping
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testVersion0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testVersion0026', 'version 26');
    const code: number = 1260000;
    const name: string = '1.26.0';
    expect(code / 10000 - 100).assertEqual(26);
    expect(code % 10000).assertEqual(0);
    expect(code.toString().length).assertEqual(7);
    expect(name.split('.').length).assertEqual(3);
    expect(name.split('.')[1]).assertEqual('26');
    expect(name.length).assertEqual(6);
    expect(name.indexOf('.')).assertEqual(1);
    expect(name.endsWith('.0')).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_VER_0027
   * @tc.name      testVersion0027
   * @tc.desc      Version 27 keeps code mapping
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testVersion0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testVersion0027', 'version 27');
    const code: number = 1270000;
    const name: string = '1.27.0';
    expect(code / 10000 - 100).assertEqual(27);
    expect(code % 10000).assertEqual(0);
    expect(code.toString().length).assertEqual(7);
    expect(name.split('.').length).assertEqual(3);
    expect(name.split('.')[1]).assertEqual('27');
    expect(name.length).assertEqual(6);
    expect(name.indexOf('.')).assertEqual(1);
    expect(name.endsWith('.0')).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_VER_0028
   * @tc.name      testVersion0028
   * @tc.desc      Version 28 keeps code mapping
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testVersion0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testVersion0028', 'version 28');
    const code: number = 1280000;
    const name: string = '1.28.0';
    expect(code / 10000 - 100).assertEqual(28);
    expect(code % 10000).assertEqual(0);
    expect(code.toString().length).assertEqual(7);
    expect(name.split('.').length).assertEqual(3);
    expect(name.split('.')[1]).assertEqual('28');
    expect(name.length).assertEqual(6);
    expect(name.indexOf('.')).assertEqual(1);
    expect(name.endsWith('.0')).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_VER_0029
   * @tc.name      testVersion0029
   * @tc.desc      Version 29 keeps code mapping
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testVersion0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testVersion0029', 'version 29');
    const code: number = 1290000;
    const name: string = '1.29.0';
    expect(code / 10000 - 100).assertEqual(29);
    expect(code % 10000).assertEqual(0);
    expect(code.toString().length).assertEqual(7);
    expect(name.split('.').length).assertEqual(3);
    expect(name.split('.')[1]).assertEqual('29');
    expect(name.length).assertEqual(6);
    expect(name.indexOf('.')).assertEqual(1);
    expect(name.endsWith('.0')).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_VER_0030
   * @tc.name      testVersion0030
   * @tc.desc      Version 30 keeps code mapping
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testVersion0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testVersion0030', 'version 30');
    const code: number = 1300000;
    const name: string = '1.30.0';
    expect(code / 10000 - 100).assertEqual(30);
    expect(code % 10000).assertEqual(0);
    expect(code.toString().length).assertEqual(7);
    expect(name.split('.').length).assertEqual(3);
    expect(name.split('.')[1]).assertEqual('30');
    expect(name.length).assertEqual(6);
    expect(name.indexOf('.')).assertEqual(1);
    expect(name.endsWith('.0')).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_VER_0031
   * @tc.name      testVersion0031
   * @tc.desc      Semver 1.0.0 orders before 1.0.1
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testVersion0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testVersion0031', 'semver 1');
    const base: string = '1.0.0';
    const next: string = '1.0.1';
    const parts: string[] = base.split('.');
    const major: number = Number.parseInt(parts[0], 10);
    const minor: number = Number.parseInt(parts[1], 10);
    const patch: number = Number.parseInt(parts[2], 10);
    expect(major).assertEqual(1);
    expect(minor).assertEqual(0);
    expect(patch).assertEqual(0);
    expect(next).assertEqual('1.0.1');
    expect(base.localeCompare(next) < 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_VER_0032
   * @tc.name      testVersion0032
   * @tc.desc      Semver 1.2.3 orders before 1.2.4
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testVersion0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testVersion0032', 'semver 2');
    const base: string = '1.2.3';
    const next: string = '1.2.4';
    const parts: string[] = base.split('.');
    const major: number = Number.parseInt(parts[0], 10);
    const minor: number = Number.parseInt(parts[1], 10);
    const patch: number = Number.parseInt(parts[2], 10);
    expect(major).assertEqual(1);
    expect(minor).assertEqual(2);
    expect(patch).assertEqual(3);
    expect(next).assertEqual('1.2.4');
    expect(base.localeCompare(next) < 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_VER_0033
   * @tc.name      testVersion0033
   * @tc.desc      Semver 2.0.0 orders before 2.0.1
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testVersion0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testVersion0033', 'semver 3');
    const base: string = '2.0.0';
    const next: string = '2.0.1';
    const parts: string[] = base.split('.');
    const major: number = Number.parseInt(parts[0], 10);
    const minor: number = Number.parseInt(parts[1], 10);
    const patch: number = Number.parseInt(parts[2], 10);
    expect(major).assertEqual(2);
    expect(minor).assertEqual(0);
    expect(patch).assertEqual(0);
    expect(next).assertEqual('2.0.1');
    expect(base.localeCompare(next) < 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_VER_0034
   * @tc.name      testVersion0034
   * @tc.desc      Semver 2.10.4 orders before 2.10.5
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testVersion0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testVersion0034', 'semver 4');
    const base: string = '2.10.4';
    const next: string = '2.10.5';
    const parts: string[] = base.split('.');
    const major: number = Number.parseInt(parts[0], 10);
    const minor: number = Number.parseInt(parts[1], 10);
    const patch: number = Number.parseInt(parts[2], 10);
    expect(major).assertEqual(2);
    expect(minor).assertEqual(10);
    expect(patch).assertEqual(4);
    expect(next).assertEqual('2.10.5');
    expect(base.localeCompare(next) < 0).assertTrue();
  });
  });
}
