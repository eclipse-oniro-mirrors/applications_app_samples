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
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0001
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
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0002
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
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0003
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
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0004
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
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0005
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
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0006
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
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0007
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
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0008
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
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0009
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
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0010
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
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0011
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
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0012
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
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0013
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
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0014
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
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0015
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
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0016
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
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0017
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
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0018
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
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0019
   * @tc.name      testModuleName0019
   * @tc.desc      Name har keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0019', 'har length');
    const token: string = 'har';
    expect(token.length).assertEqual(3);
    expect(token.length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0020
   * @tc.name      testModuleName0020
   * @tc.desc      Name har keeps first char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0020', 'har first char');
    const token: string = 'har';
    expect(token.charAt(0)).assertEqual('h');
    expect(token.charCodeAt(0)).assertEqual(104);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0021
   * @tc.name      testModuleName0021
   * @tc.desc      Name har keeps last char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0021', 'har last char');
    const token: string = 'har';
    expect(token.charAt(token.length - 1)).assertEqual('r');
    expect(token.charCodeAt(token.length - 1)).assertEqual(114);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0022
   * @tc.name      testModuleName0022
   * @tc.desc      Name har keeps index of e
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0022', 'har index of e');
    const token: string = 'har';
    expect(token.indexOf('e')).assertEqual(-1);
    expect(token.indexOf('e') >= -1).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0023
   * @tc.name      testModuleName0023
   * @tc.desc      Name har keeps uppercase
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0023', 'har uppercase');
    const token: string = 'har';
    expect(token.toUpperCase()).assertEqual('HAR');
    expect(token.toUpperCase().length).assertEqual(3);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0024
   * @tc.name      testModuleName0024
   * @tc.desc      Name har keeps tail three
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0024', 'har tail three');
    const token: string = 'har';
    expect(token.substring(token.length - 3)).assertEqual('har');
    expect(token.slice(-3)).assertEqual('har');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0025
   * @tc.name      testModuleName0025
   * @tc.desc      Name har keeps reverse
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0025', 'har reverse');
    const token: string = 'har';
    const reversed: string = token.split('').reverse().join('');
    expect(reversed).assertEqual('rah');
    expect(reversed.length).assertEqual(3);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0026
   * @tc.name      testModuleName0026
   * @tc.desc      Name har keeps underscore split
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0026', 'har underscore split');
    const token: string = 'har';
    expect(token.split('_').length).assertEqual(1);
    expect(token.includes('_')).assertEqual(false);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0027
   * @tc.name      testModuleName0027
   * @tc.desc      Name har keeps lowercase
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0027', 'har lowercase');
    const token: string = 'har';
    expect(token.toLowerCase()).assertEqual('har');
    expect(token.toLowerCase().length).assertEqual(token.length);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0028
   * @tc.name      testModuleName0028
   * @tc.desc      Name EntryAbility keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0028', 'EntryAbility length');
    const token: string = 'EntryAbility';
    expect(token.length).assertEqual(12);
    expect(token.length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0029
   * @tc.name      testModuleName0029
   * @tc.desc      Name EntryAbility keeps first char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0029', 'EntryAbility first char');
    const token: string = 'EntryAbility';
    expect(token.charAt(0)).assertEqual('E');
    expect(token.charCodeAt(0)).assertEqual(69);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0030
   * @tc.name      testModuleName0030
   * @tc.desc      Name EntryAbility keeps last char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0030', 'EntryAbility last char');
    const token: string = 'EntryAbility';
    expect(token.charAt(token.length - 1)).assertEqual('y');
    expect(token.charCodeAt(token.length - 1)).assertEqual(121);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0031
   * @tc.name      testModuleName0031
   * @tc.desc      Name EntryAbility keeps index of e
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0031', 'EntryAbility index of e');
    const token: string = 'EntryAbility';
    expect(token.indexOf('e')).assertEqual(-1);
    expect(token.indexOf('e') >= -1).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0032
   * @tc.name      testModuleName0032
   * @tc.desc      Name EntryAbility keeps uppercase
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0032', 'EntryAbility uppercase');
    const token: string = 'EntryAbility';
    expect(token.toUpperCase()).assertEqual('ENTRYABILITY');
    expect(token.toUpperCase().length).assertEqual(12);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0033
   * @tc.name      testModuleName0033
   * @tc.desc      Name EntryAbility keeps tail three
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0033', 'EntryAbility tail three');
    const token: string = 'EntryAbility';
    expect(token.substring(token.length - 3)).assertEqual('ity');
    expect(token.slice(-3)).assertEqual('ity');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0034
   * @tc.name      testModuleName0034
   * @tc.desc      Name EntryAbility keeps reverse
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0034', 'EntryAbility reverse');
    const token: string = 'EntryAbility';
    const reversed: string = token.split('').reverse().join('');
    expect(reversed).assertEqual('ytilibAyrtnE');
    expect(reversed.length).assertEqual(12);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0035
   * @tc.name      testModuleName0035
   * @tc.desc      Name EntryAbility keeps underscore split
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0035', 'EntryAbility underscore split');
    const token: string = 'EntryAbility';
    expect(token.split('_').length).assertEqual(1);
    expect(token.includes('_')).assertEqual(false);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0036
   * @tc.name      testModuleName0036
   * @tc.desc      Name EntryAbility keeps lowercase
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0036', 'EntryAbility lowercase');
    const token: string = 'EntryAbility';
    expect(token.toLowerCase()).assertEqual('entryability');
    expect(token.toLowerCase().length).assertEqual(token.length);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0037
   * @tc.name      testModuleName0037
   * @tc.desc      Name EntryBackupAbility keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0037', 'EntryBackupAbility length');
    const token: string = 'EntryBackupAbility';
    expect(token.length).assertEqual(18);
    expect(token.length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0038
   * @tc.name      testModuleName0038
   * @tc.desc      Name EntryBackupAbility keeps first char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0038', 'EntryBackupAbility first char');
    const token: string = 'EntryBackupAbility';
    expect(token.charAt(0)).assertEqual('E');
    expect(token.charCodeAt(0)).assertEqual(69);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0039
   * @tc.name      testModuleName0039
   * @tc.desc      Name EntryBackupAbility keeps last char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0039', 'EntryBackupAbility last char');
    const token: string = 'EntryBackupAbility';
    expect(token.charAt(token.length - 1)).assertEqual('y');
    expect(token.charCodeAt(token.length - 1)).assertEqual(121);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0040
   * @tc.name      testModuleName0040
   * @tc.desc      Name EntryBackupAbility keeps index of e
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0040', 'EntryBackupAbility index of e');
    const token: string = 'EntryBackupAbility';
    expect(token.indexOf('e')).assertEqual(-1);
    expect(token.indexOf('e') >= -1).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0041
   * @tc.name      testModuleName0041
   * @tc.desc      Name EntryBackupAbility keeps uppercase
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0041', 'EntryBackupAbility uppercase');
    const token: string = 'EntryBackupAbility';
    expect(token.toUpperCase()).assertEqual('ENTRYBACKUPABILITY');
    expect(token.toUpperCase().length).assertEqual(18);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0042
   * @tc.name      testModuleName0042
   * @tc.desc      Name EntryBackupAbility keeps tail three
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0042', 'EntryBackupAbility tail three');
    const token: string = 'EntryBackupAbility';
    expect(token.substring(token.length - 3)).assertEqual('ity');
    expect(token.slice(-3)).assertEqual('ity');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0043
   * @tc.name      testModuleName0043
   * @tc.desc      Name EntryBackupAbility keeps reverse
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0043', 'EntryBackupAbility reverse');
    const token: string = 'EntryBackupAbility';
    const reversed: string = token.split('').reverse().join('');
    expect(reversed).assertEqual('ytilibApukcaByrtnE');
    expect(reversed.length).assertEqual(18);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0044
   * @tc.name      testModuleName0044
   * @tc.desc      Name EntryBackupAbility keeps underscore split
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0044', 'EntryBackupAbility underscore split');
    const token: string = 'EntryBackupAbility';
    expect(token.split('_').length).assertEqual(1);
    expect(token.includes('_')).assertEqual(false);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0045
   * @tc.name      testModuleName0045
   * @tc.desc      Name EntryBackupAbility keeps lowercase
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0045', 'EntryBackupAbility lowercase');
    const token: string = 'EntryBackupAbility';
    expect(token.toLowerCase()).assertEqual('entrybackupability');
    expect(token.toLowerCase().length).assertEqual(token.length);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0046
   * @tc.name      testModuleName0046
   * @tc.desc      Name module_desc keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0046', 'module_desc length');
    const token: string = 'module_desc';
    expect(token.length).assertEqual(11);
    expect(token.length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0047
   * @tc.name      testModuleName0047
   * @tc.desc      Name module_desc keeps first char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0047', 'module_desc first char');
    const token: string = 'module_desc';
    expect(token.charAt(0)).assertEqual('m');
    expect(token.charCodeAt(0)).assertEqual(109);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0048
   * @tc.name      testModuleName0048
   * @tc.desc      Name module_desc keeps last char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0048', 'module_desc last char');
    const token: string = 'module_desc';
    expect(token.charAt(token.length - 1)).assertEqual('c');
    expect(token.charCodeAt(token.length - 1)).assertEqual(99);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0049
   * @tc.name      testModuleName0049
   * @tc.desc      Name module_desc keeps index of e
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0049', 'module_desc index of e');
    const token: string = 'module_desc';
    expect(token.indexOf('e')).assertEqual(5);
    expect(token.indexOf('e') >= -1).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0050
   * @tc.name      testModuleName0050
   * @tc.desc      Name module_desc keeps uppercase
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0050', 'module_desc uppercase');
    const token: string = 'module_desc';
    expect(token.toUpperCase()).assertEqual('MODULE_DESC');
    expect(token.toUpperCase().length).assertEqual(11);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0051
   * @tc.name      testModuleName0051
   * @tc.desc      Name module_desc keeps tail three
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0051', 'module_desc tail three');
    const token: string = 'module_desc';
    expect(token.substring(token.length - 3)).assertEqual('esc');
    expect(token.slice(-3)).assertEqual('esc');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0052
   * @tc.name      testModuleName0052
   * @tc.desc      Name module_desc keeps reverse
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0052', 'module_desc reverse');
    const token: string = 'module_desc';
    const reversed: string = token.split('').reverse().join('');
    expect(reversed).assertEqual('csed_eludom');
    expect(reversed.length).assertEqual(11);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0053
   * @tc.name      testModuleName0053
   * @tc.desc      Name module_desc keeps underscore split
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0053', 'module_desc underscore split');
    const token: string = 'module_desc';
    expect(token.split('_').length).assertEqual(2);
    expect(token.includes('_')).assertEqual(true);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0054
   * @tc.name      testModuleName0054
   * @tc.desc      Name module_desc keeps lowercase
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0054', 'module_desc lowercase');
    const token: string = 'module_desc';
    expect(token.toLowerCase()).assertEqual('module_desc');
    expect(token.toLowerCase().length).assertEqual(token.length);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0055
   * @tc.name      testModuleName0055
   * @tc.desc      Name EntryAbility_desc keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0055', 'EntryAbility_desc length');
    const token: string = 'EntryAbility_desc';
    expect(token.length).assertEqual(17);
    expect(token.length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0056
   * @tc.name      testModuleName0056
   * @tc.desc      Name EntryAbility_desc keeps first char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0056', 'EntryAbility_desc first char');
    const token: string = 'EntryAbility_desc';
    expect(token.charAt(0)).assertEqual('E');
    expect(token.charCodeAt(0)).assertEqual(69);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0057
   * @tc.name      testModuleName0057
   * @tc.desc      Name EntryAbility_desc keeps last char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0057', 'EntryAbility_desc last char');
    const token: string = 'EntryAbility_desc';
    expect(token.charAt(token.length - 1)).assertEqual('c');
    expect(token.charCodeAt(token.length - 1)).assertEqual(99);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0058
   * @tc.name      testModuleName0058
   * @tc.desc      Name EntryAbility_desc keeps index of e
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0058', 'EntryAbility_desc index of e');
    const token: string = 'EntryAbility_desc';
    expect(token.indexOf('e')).assertEqual(14);
    expect(token.indexOf('e') >= -1).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0059
   * @tc.name      testModuleName0059
   * @tc.desc      Name EntryAbility_desc keeps uppercase
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0059', 'EntryAbility_desc uppercase');
    const token: string = 'EntryAbility_desc';
    expect(token.toUpperCase()).assertEqual('ENTRYABILITY_DESC');
    expect(token.toUpperCase().length).assertEqual(17);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0060
   * @tc.name      testModuleName0060
   * @tc.desc      Name EntryAbility_desc keeps tail three
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0060', 'EntryAbility_desc tail three');
    const token: string = 'EntryAbility_desc';
    expect(token.substring(token.length - 3)).assertEqual('esc');
    expect(token.slice(-3)).assertEqual('esc');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0061
   * @tc.name      testModuleName0061
   * @tc.desc      Name EntryAbility_desc keeps reverse
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0061', 'EntryAbility_desc reverse');
    const token: string = 'EntryAbility_desc';
    const reversed: string = token.split('').reverse().join('');
    expect(reversed).assertEqual('csed_ytilibAyrtnE');
    expect(reversed.length).assertEqual(17);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0062
   * @tc.name      testModuleName0062
   * @tc.desc      Name EntryAbility_desc keeps underscore split
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0062', 'EntryAbility_desc underscore split');
    const token: string = 'EntryAbility_desc';
    expect(token.split('_').length).assertEqual(2);
    expect(token.includes('_')).assertEqual(true);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0063
   * @tc.name      testModuleName0063
   * @tc.desc      Name EntryAbility_desc keeps lowercase
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0063', 'EntryAbility_desc lowercase');
    const token: string = 'EntryAbility_desc';
    expect(token.toLowerCase()).assertEqual('entryability_desc');
    expect(token.toLowerCase().length).assertEqual(token.length);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0064
   * @tc.name      testModuleName0064
   * @tc.desc      Name EntryAbility_label keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0064', 'EntryAbility_label length');
    const token: string = 'EntryAbility_label';
    expect(token.length).assertEqual(18);
    expect(token.length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0065
   * @tc.name      testModuleName0065
   * @tc.desc      Name EntryAbility_label keeps first char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0065', 'EntryAbility_label first char');
    const token: string = 'EntryAbility_label';
    expect(token.charAt(0)).assertEqual('E');
    expect(token.charCodeAt(0)).assertEqual(69);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0066
   * @tc.name      testModuleName0066
   * @tc.desc      Name EntryAbility_label keeps last char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0066', 'EntryAbility_label last char');
    const token: string = 'EntryAbility_label';
    expect(token.charAt(token.length - 1)).assertEqual('l');
    expect(token.charCodeAt(token.length - 1)).assertEqual(108);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0067
   * @tc.name      testModuleName0067
   * @tc.desc      Name EntryAbility_label keeps index of e
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0067', 'EntryAbility_label index of e');
    const token: string = 'EntryAbility_label';
    expect(token.indexOf('e')).assertEqual(16);
    expect(token.indexOf('e') >= -1).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0068
   * @tc.name      testModuleName0068
   * @tc.desc      Name EntryAbility_label keeps uppercase
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0068', 'EntryAbility_label uppercase');
    const token: string = 'EntryAbility_label';
    expect(token.toUpperCase()).assertEqual('ENTRYABILITY_LABEL');
    expect(token.toUpperCase().length).assertEqual(18);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0069
   * @tc.name      testModuleName0069
   * @tc.desc      Name EntryAbility_label keeps tail three
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0069', 'EntryAbility_label tail three');
    const token: string = 'EntryAbility_label';
    expect(token.substring(token.length - 3)).assertEqual('bel');
    expect(token.slice(-3)).assertEqual('bel');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0070
   * @tc.name      testModuleName0070
   * @tc.desc      Name EntryAbility_label keeps reverse
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0070', 'EntryAbility_label reverse');
    const token: string = 'EntryAbility_label';
    const reversed: string = token.split('').reverse().join('');
    expect(reversed).assertEqual('lebal_ytilibAyrtnE');
    expect(reversed.length).assertEqual(18);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0071
   * @tc.name      testModuleName0071
   * @tc.desc      Name EntryAbility_label keeps underscore split
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0071', 'EntryAbility_label underscore split');
    const token: string = 'EntryAbility_label';
    expect(token.split('_').length).assertEqual(2);
    expect(token.includes('_')).assertEqual(true);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0072
   * @tc.name      testModuleName0072
   * @tc.desc      Name EntryAbility_label keeps lowercase
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0072', 'EntryAbility_label lowercase');
    const token: string = 'EntryAbility_label';
    expect(token.toLowerCase()).assertEqual('entryability_label');
    expect(token.toLowerCase().length).assertEqual(token.length);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0073
   * @tc.name      testModuleName0073
   * @tc.desc      Name shared_desc keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0073', 'shared_desc length');
    const token: string = 'shared_desc';
    expect(token.length).assertEqual(11);
    expect(token.length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0074
   * @tc.name      testModuleName0074
   * @tc.desc      Name shared_desc keeps first char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0074', 'shared_desc first char');
    const token: string = 'shared_desc';
    expect(token.charAt(0)).assertEqual('s');
    expect(token.charCodeAt(0)).assertEqual(115);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0075
   * @tc.name      testModuleName0075
   * @tc.desc      Name shared_desc keeps last char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0075', 'shared_desc last char');
    const token: string = 'shared_desc';
    expect(token.charAt(token.length - 1)).assertEqual('c');
    expect(token.charCodeAt(token.length - 1)).assertEqual(99);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0076
   * @tc.name      testModuleName0076
   * @tc.desc      Name shared_desc keeps index of e
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0076', 'shared_desc index of e');
    const token: string = 'shared_desc';
    expect(token.indexOf('e')).assertEqual(4);
    expect(token.indexOf('e') >= -1).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0077
   * @tc.name      testModuleName0077
   * @tc.desc      Name shared_desc keeps uppercase
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0077', 'shared_desc uppercase');
    const token: string = 'shared_desc';
    expect(token.toUpperCase()).assertEqual('SHARED_DESC');
    expect(token.toUpperCase().length).assertEqual(11);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0078
   * @tc.name      testModuleName0078
   * @tc.desc      Name shared_desc keeps tail three
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0078', 'shared_desc tail three');
    const token: string = 'shared_desc';
    expect(token.substring(token.length - 3)).assertEqual('esc');
    expect(token.slice(-3)).assertEqual('esc');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0079
   * @tc.name      testModuleName0079
   * @tc.desc      Name shared_desc keeps reverse
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0079', 'shared_desc reverse');
    const token: string = 'shared_desc';
    const reversed: string = token.split('').reverse().join('');
    expect(reversed).assertEqual('csed_derahs');
    expect(reversed.length).assertEqual(11);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_NAME_0080
   * @tc.name      testModuleName0080
   * @tc.desc      Name shared_desc keeps underscore split
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
