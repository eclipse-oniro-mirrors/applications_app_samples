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

export default function moduleNameMatrixTest() {
  describe('moduleNameMatrixTest', () => {
  beforeEach(async () => {
    await paceTurn();
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_NAME_0001
   * @tc.name      testModuleName0001
   * @tc.desc      Name entry keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0001', 'entry length');
    const token: string = 'entry';
    expect(token.length).assertEqual(5);
    expect(token.length > 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_NAME_0002
   * @tc.name      testModuleName0002
   * @tc.desc      Name entry keeps first char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0002', 'entry first char');
    const token: string = 'entry';
    expect(token.charAt(0)).assertEqual('e');
    expect(token.charCodeAt(0)).assertEqual(101);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_NAME_0003
   * @tc.name      testModuleName0003
   * @tc.desc      Name entry keeps last char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0003', 'entry last char');
    const token: string = 'entry';
    expect(token.charAt(token.length - 1)).assertEqual('y');
    expect(token.charCodeAt(token.length - 1)).assertEqual(121);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_NAME_0004
   * @tc.name      testModuleName0004
   * @tc.desc      Name entry keeps index of e
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0004', 'entry index of e');
    const token: string = 'entry';
    expect(token.indexOf('e')).assertEqual(0);
    expect(token.indexOf('e') >= -1).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_NAME_0005
   * @tc.name      testModuleName0005
   * @tc.desc      Name entry keeps uppercase
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0005', 'entry uppercase');
    const token: string = 'entry';
    expect(token.toUpperCase()).assertEqual('ENTRY');
    expect(token.toUpperCase().length).assertEqual(5);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_NAME_0006
   * @tc.name      testModuleName0006
   * @tc.desc      Name entry keeps tail three
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0006', 'entry tail three');
    const token: string = 'entry';
    expect(token.substring(token.length - 3)).assertEqual('try');
    expect(token.slice(-3)).assertEqual('try');
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_NAME_0007
   * @tc.name      testModuleName0007
   * @tc.desc      Name entry keeps reverse
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0007', 'entry reverse');
    const token: string = 'entry';
    const reversed: string = token.split('').reverse().join('');
    expect(reversed).assertEqual('yrtne');
    expect(reversed.length).assertEqual(5);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_NAME_0008
   * @tc.name      testModuleName0008
   * @tc.desc      Name entry keeps underscore split
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0008', 'entry underscore split');
    const token: string = 'entry';
    expect(token.split('_').length).assertEqual(1);
    expect(token.includes('_')).assertEqual(false);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_NAME_0009
   * @tc.name      testModuleName0009
   * @tc.desc      Name entry keeps lowercase
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0009', 'entry lowercase');
    const token: string = 'entry';
    expect(token.toLowerCase()).assertEqual('entry');
    expect(token.toLowerCase().length).assertEqual(token.length);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_NAME_0010
   * @tc.name      testModuleName0010
   * @tc.desc      Name entry_test keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0010', 'entry_test length');
    const token: string = 'entry_test';
    expect(token.length).assertEqual(10);
    expect(token.length > 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_NAME_0011
   * @tc.name      testModuleName0011
   * @tc.desc      Name entry_test keeps first char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0011', 'entry_test first char');
    const token: string = 'entry_test';
    expect(token.charAt(0)).assertEqual('e');
    expect(token.charCodeAt(0)).assertEqual(101);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_NAME_0012
   * @tc.name      testModuleName0012
   * @tc.desc      Name entry_test keeps last char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0012', 'entry_test last char');
    const token: string = 'entry_test';
    expect(token.charAt(token.length - 1)).assertEqual('t');
    expect(token.charCodeAt(token.length - 1)).assertEqual(116);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_NAME_0013
   * @tc.name      testModuleName0013
   * @tc.desc      Name entry_test keeps index of e
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0013', 'entry_test index of e');
    const token: string = 'entry_test';
    expect(token.indexOf('e')).assertEqual(0);
    expect(token.indexOf('e') >= -1).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_NAME_0014
   * @tc.name      testModuleName0014
   * @tc.desc      Name entry_test keeps uppercase
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0014', 'entry_test uppercase');
    const token: string = 'entry_test';
    expect(token.toUpperCase()).assertEqual('ENTRY_TEST');
    expect(token.toUpperCase().length).assertEqual(10);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_NAME_0015
   * @tc.name      testModuleName0015
   * @tc.desc      Name entry_test keeps tail three
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0015', 'entry_test tail three');
    const token: string = 'entry_test';
    expect(token.substring(token.length - 3)).assertEqual('est');
    expect(token.slice(-3)).assertEqual('est');
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_NAME_0016
   * @tc.name      testModuleName0016
   * @tc.desc      Name entry_test keeps reverse
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0016', 'entry_test reverse');
    const token: string = 'entry_test';
    const reversed: string = token.split('').reverse().join('');
    expect(reversed).assertEqual('tset_yrtne');
    expect(reversed.length).assertEqual(10);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_NAME_0017
   * @tc.name      testModuleName0017
   * @tc.desc      Name entry_test keeps underscore split
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0017', 'entry_test underscore split');
    const token: string = 'entry_test';
    expect(token.split('_').length).assertEqual(2);
    expect(token.includes('_')).assertEqual(true);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_NAME_0018
   * @tc.name      testModuleName0018
   * @tc.desc      Name entry_test keeps lowercase
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0018', 'entry_test lowercase');
    const token: string = 'entry_test';
    expect(token.toLowerCase()).assertEqual('entry_test');
    expect(token.toLowerCase().length).assertEqual(token.length);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_NAME_0019
   * @tc.name      testModuleName0019
   * @tc.desc      Name EntryAbility keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0019', 'EntryAbility length');
    const token: string = 'EntryAbility';
    expect(token.length).assertEqual(12);
    expect(token.length > 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_NAME_0020
   * @tc.name      testModuleName0020
   * @tc.desc      Name EntryAbility keeps first char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0020', 'EntryAbility first char');
    const token: string = 'EntryAbility';
    expect(token.charAt(0)).assertEqual('E');
    expect(token.charCodeAt(0)).assertEqual(69);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_NAME_0021
   * @tc.name      testModuleName0021
   * @tc.desc      Name EntryAbility keeps last char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0021', 'EntryAbility last char');
    const token: string = 'EntryAbility';
    expect(token.charAt(token.length - 1)).assertEqual('y');
    expect(token.charCodeAt(token.length - 1)).assertEqual(121);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_NAME_0022
   * @tc.name      testModuleName0022
   * @tc.desc      Name EntryAbility keeps index of e
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0022', 'EntryAbility index of e');
    const token: string = 'EntryAbility';
    expect(token.indexOf('e')).assertEqual(-1);
    expect(token.indexOf('e') >= -1).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_NAME_0023
   * @tc.name      testModuleName0023
   * @tc.desc      Name EntryAbility keeps uppercase
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0023', 'EntryAbility uppercase');
    const token: string = 'EntryAbility';
    expect(token.toUpperCase()).assertEqual('ENTRYABILITY');
    expect(token.toUpperCase().length).assertEqual(12);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_NAME_0024
   * @tc.name      testModuleName0024
   * @tc.desc      Name EntryAbility keeps tail three
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0024', 'EntryAbility tail three');
    const token: string = 'EntryAbility';
    expect(token.substring(token.length - 3)).assertEqual('ity');
    expect(token.slice(-3)).assertEqual('ity');
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_NAME_0025
   * @tc.name      testModuleName0025
   * @tc.desc      Name EntryAbility keeps reverse
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0025', 'EntryAbility reverse');
    const token: string = 'EntryAbility';
    const reversed: string = token.split('').reverse().join('');
    expect(reversed).assertEqual('ytilibAyrtnE');
    expect(reversed.length).assertEqual(12);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_NAME_0026
   * @tc.name      testModuleName0026
   * @tc.desc      Name EntryAbility keeps underscore split
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0026', 'EntryAbility underscore split');
    const token: string = 'EntryAbility';
    expect(token.split('_').length).assertEqual(1);
    expect(token.includes('_')).assertEqual(false);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_NAME_0027
   * @tc.name      testModuleName0027
   * @tc.desc      Name EntryAbility keeps lowercase
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0027', 'EntryAbility lowercase');
    const token: string = 'EntryAbility';
    expect(token.toLowerCase()).assertEqual('entryability');
    expect(token.toLowerCase().length).assertEqual(token.length);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_NAME_0028
   * @tc.name      testModuleName0028
   * @tc.desc      Name EntryBackupAbility keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0028', 'EntryBackupAbility length');
    const token: string = 'EntryBackupAbility';
    expect(token.length).assertEqual(18);
    expect(token.length > 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_NAME_0029
   * @tc.name      testModuleName0029
   * @tc.desc      Name EntryBackupAbility keeps first char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0029', 'EntryBackupAbility first char');
    const token: string = 'EntryBackupAbility';
    expect(token.charAt(0)).assertEqual('E');
    expect(token.charCodeAt(0)).assertEqual(69);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_NAME_0030
   * @tc.name      testModuleName0030
   * @tc.desc      Name EntryBackupAbility keeps last char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0030', 'EntryBackupAbility last char');
    const token: string = 'EntryBackupAbility';
    expect(token.charAt(token.length - 1)).assertEqual('y');
    expect(token.charCodeAt(token.length - 1)).assertEqual(121);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_NAME_0031
   * @tc.name      testModuleName0031
   * @tc.desc      Name EntryBackupAbility keeps index of e
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0031', 'EntryBackupAbility index of e');
    const token: string = 'EntryBackupAbility';
    expect(token.indexOf('e')).assertEqual(-1);
    expect(token.indexOf('e') >= -1).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_NAME_0032
   * @tc.name      testModuleName0032
   * @tc.desc      Name EntryBackupAbility keeps uppercase
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0032', 'EntryBackupAbility uppercase');
    const token: string = 'EntryBackupAbility';
    expect(token.toUpperCase()).assertEqual('ENTRYBACKUPABILITY');
    expect(token.toUpperCase().length).assertEqual(18);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_NAME_0033
   * @tc.name      testModuleName0033
   * @tc.desc      Name EntryBackupAbility keeps tail three
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0033', 'EntryBackupAbility tail three');
    const token: string = 'EntryBackupAbility';
    expect(token.substring(token.length - 3)).assertEqual('ity');
    expect(token.slice(-3)).assertEqual('ity');
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_NAME_0034
   * @tc.name      testModuleName0034
   * @tc.desc      Name EntryBackupAbility keeps reverse
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0034', 'EntryBackupAbility reverse');
    const token: string = 'EntryBackupAbility';
    const reversed: string = token.split('').reverse().join('');
    expect(reversed).assertEqual('ytilibApukcaByrtnE');
    expect(reversed.length).assertEqual(18);
  });
  });
}
