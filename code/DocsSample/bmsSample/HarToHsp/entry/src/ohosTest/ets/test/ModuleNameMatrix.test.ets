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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0001
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0002
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0003
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0004
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0005
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0006
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0007
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0008
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0009
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0010
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0011
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0012
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0013
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0014
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0015
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0016
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0017
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0018
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0019
   * @tc.name      testModuleName0019
   * @tc.desc      Name library keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0019', 'library length');
    const token: string = 'library';
    expect(token.length).assertEqual(7);
    expect(token.length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0020
   * @tc.name      testModuleName0020
   * @tc.desc      Name library keeps first char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0020', 'library first char');
    const token: string = 'library';
    expect(token.charAt(0)).assertEqual('l');
    expect(token.charCodeAt(0)).assertEqual(108);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0021
   * @tc.name      testModuleName0021
   * @tc.desc      Name library keeps last char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0021', 'library last char');
    const token: string = 'library';
    expect(token.charAt(token.length - 1)).assertEqual('y');
    expect(token.charCodeAt(token.length - 1)).assertEqual(121);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0022
   * @tc.name      testModuleName0022
   * @tc.desc      Name library keeps index of e
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0022', 'library index of e');
    const token: string = 'library';
    expect(token.indexOf('e')).assertEqual(-1);
    expect(token.indexOf('e') >= -1).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0023
   * @tc.name      testModuleName0023
   * @tc.desc      Name library keeps uppercase
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0023', 'library uppercase');
    const token: string = 'library';
    expect(token.toUpperCase()).assertEqual('LIBRARY');
    expect(token.toUpperCase().length).assertEqual(7);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0024
   * @tc.name      testModuleName0024
   * @tc.desc      Name library keeps tail three
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0024', 'library tail three');
    const token: string = 'library';
    expect(token.substring(token.length - 3)).assertEqual('ary');
    expect(token.slice(-3)).assertEqual('ary');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0025
   * @tc.name      testModuleName0025
   * @tc.desc      Name library keeps reverse
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0025', 'library reverse');
    const token: string = 'library';
    const reversed: string = token.split('').reverse().join('');
    expect(reversed).assertEqual('yrarbil');
    expect(reversed.length).assertEqual(7);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0026
   * @tc.name      testModuleName0026
   * @tc.desc      Name library keeps underscore split
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0026', 'library underscore split');
    const token: string = 'library';
    expect(token.split('_').length).assertEqual(1);
    expect(token.includes('_')).assertEqual(false);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0027
   * @tc.name      testModuleName0027
   * @tc.desc      Name library keeps lowercase
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0027', 'library lowercase');
    const token: string = 'library';
    expect(token.toLowerCase()).assertEqual('library');
    expect(token.toLowerCase().length).assertEqual(token.length);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0028
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0029
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0030
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0031
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0032
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0033
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0034
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0035
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0036
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0037
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0038
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0039
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0040
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0041
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0042
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0043
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0044
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0045
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0046
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0047
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0048
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0049
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0050
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0051
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0052
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0053
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0054
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0055
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0056
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0057
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0058
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0059
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0060
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0061
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0062
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0063
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0064
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0065
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0066
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0067
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0068
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0069
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0070
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0071
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0072
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
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0073
   * @tc.name      testModuleName0073
   * @tc.desc      Name page_show keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0073', 'page_show length');
    const token: string = 'page_show';
    expect(token.length).assertEqual(9);
    expect(token.length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0074
   * @tc.name      testModuleName0074
   * @tc.desc      Name page_show keeps first char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0074', 'page_show first char');
    const token: string = 'page_show';
    expect(token.charAt(0)).assertEqual('p');
    expect(token.charCodeAt(0)).assertEqual(112);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0075
   * @tc.name      testModuleName0075
   * @tc.desc      Name page_show keeps last char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0075', 'page_show last char');
    const token: string = 'page_show';
    expect(token.charAt(token.length - 1)).assertEqual('w');
    expect(token.charCodeAt(token.length - 1)).assertEqual(119);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0076
   * @tc.name      testModuleName0076
   * @tc.desc      Name page_show keeps index of e
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0076', 'page_show index of e');
    const token: string = 'page_show';
    expect(token.indexOf('e')).assertEqual(3);
    expect(token.indexOf('e') >= -1).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0077
   * @tc.name      testModuleName0077
   * @tc.desc      Name page_show keeps uppercase
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0077', 'page_show uppercase');
    const token: string = 'page_show';
    expect(token.toUpperCase()).assertEqual('PAGE_SHOW');
    expect(token.toUpperCase().length).assertEqual(9);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0078
   * @tc.name      testModuleName0078
   * @tc.desc      Name page_show keeps tail three
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0078', 'page_show tail three');
    const token: string = 'page_show';
    expect(token.substring(token.length - 3)).assertEqual('how');
    expect(token.slice(-3)).assertEqual('how');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0079
   * @tc.name      testModuleName0079
   * @tc.desc      Name page_show keeps reverse
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0079', 'page_show reverse');
    const token: string = 'page_show';
    const reversed: string = token.split('').reverse().join('');
    expect(reversed).assertEqual('wohs_egap');
    expect(reversed.length).assertEqual(9);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0080
   * @tc.name      testModuleName0080
   * @tc.desc      Name page_show keeps underscore split
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0080', 'page_show underscore split');
    const token: string = 'page_show';
    expect(token.split('_').length).assertEqual(2);
    expect(token.includes('_')).assertEqual(true);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0081
   * @tc.name      testModuleName0081
   * @tc.desc      Name page_show keeps lowercase
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0081', 'page_show lowercase');
    const token: string = 'page_show';
    expect(token.toLowerCase()).assertEqual('page_show');
    expect(token.toLowerCase().length).assertEqual(token.length);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0082
   * @tc.name      testModuleName0082
   * @tc.desc      Name page_text_font_size keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0082', 'page_text_font_size length');
    const token: string = 'page_text_font_size';
    expect(token.length).assertEqual(19);
    expect(token.length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0083
   * @tc.name      testModuleName0083
   * @tc.desc      Name page_text_font_size keeps first char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0083', 'page_text_font_size first char');
    const token: string = 'page_text_font_size';
    expect(token.charAt(0)).assertEqual('p');
    expect(token.charCodeAt(0)).assertEqual(112);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0084
   * @tc.name      testModuleName0084
   * @tc.desc      Name page_text_font_size keeps last char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0084', 'page_text_font_size last char');
    const token: string = 'page_text_font_size';
    expect(token.charAt(token.length - 1)).assertEqual('e');
    expect(token.charCodeAt(token.length - 1)).assertEqual(101);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0085
   * @tc.name      testModuleName0085
   * @tc.desc      Name page_text_font_size keeps index of e
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0085', 'page_text_font_size index of e');
    const token: string = 'page_text_font_size';
    expect(token.indexOf('e')).assertEqual(3);
    expect(token.indexOf('e') >= -1).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0086
   * @tc.name      testModuleName0086
   * @tc.desc      Name page_text_font_size keeps uppercase
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0086', 'page_text_font_size uppercase');
    const token: string = 'page_text_font_size';
    expect(token.toUpperCase()).assertEqual('PAGE_TEXT_FONT_SIZE');
    expect(token.toUpperCase().length).assertEqual(19);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0087
   * @tc.name      testModuleName0087
   * @tc.desc      Name page_text_font_size keeps tail three
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0087', 'page_text_font_size tail three');
    const token: string = 'page_text_font_size';
    expect(token.substring(token.length - 3)).assertEqual('ize');
    expect(token.slice(-3)).assertEqual('ize');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0088
   * @tc.name      testModuleName0088
   * @tc.desc      Name page_text_font_size keeps reverse
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0088', 'page_text_font_size reverse');
    const token: string = 'page_text_font_size';
    const reversed: string = token.split('').reverse().join('');
    expect(reversed).assertEqual('ezis_tnof_txet_egap');
    expect(reversed.length).assertEqual(19);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0089
   * @tc.name      testModuleName0089
   * @tc.desc      Name page_text_font_size keeps underscore split
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0089', 'page_text_font_size underscore split');
    const token: string = 'page_text_font_size';
    expect(token.split('_').length).assertEqual(4);
    expect(token.includes('_')).assertEqual(true);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0090
   * @tc.name      testModuleName0090
   * @tc.desc      Name page_text_font_size keeps lowercase
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0090', 'page_text_font_size lowercase');
    const token: string = 'page_text_font_size';
    expect(token.toLowerCase()).assertEqual('page_text_font_size');
    expect(token.toLowerCase().length).assertEqual(token.length);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0091
   * @tc.name      testModuleName0091
   * @tc.desc      Name start_window_background keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0091', 'start_window_background length');
    const token: string = 'start_window_background';
    expect(token.length).assertEqual(23);
    expect(token.length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0092
   * @tc.name      testModuleName0092
   * @tc.desc      Name start_window_background keeps first char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0092', 'start_window_background first char');
    const token: string = 'start_window_background';
    expect(token.charAt(0)).assertEqual('s');
    expect(token.charCodeAt(0)).assertEqual(115);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0093
   * @tc.name      testModuleName0093
   * @tc.desc      Name start_window_background keeps last char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0093', 'start_window_background last char');
    const token: string = 'start_window_background';
    expect(token.charAt(token.length - 1)).assertEqual('d');
    expect(token.charCodeAt(token.length - 1)).assertEqual(100);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0094
   * @tc.name      testModuleName0094
   * @tc.desc      Name start_window_background keeps index of e
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0094', 'start_window_background index of e');
    const token: string = 'start_window_background';
    expect(token.indexOf('e')).assertEqual(-1);
    expect(token.indexOf('e') >= -1).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0095
   * @tc.name      testModuleName0095
   * @tc.desc      Name start_window_background keeps uppercase
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0095', 'start_window_background uppercase');
    const token: string = 'start_window_background';
    expect(token.toUpperCase()).assertEqual('START_WINDOW_BACKGROUND');
    expect(token.toUpperCase().length).assertEqual(23);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0096
   * @tc.name      testModuleName0096
   * @tc.desc      Name start_window_background keeps tail three
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0096', 'start_window_background tail three');
    const token: string = 'start_window_background';
    expect(token.substring(token.length - 3)).assertEqual('und');
    expect(token.slice(-3)).assertEqual('und');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0097
   * @tc.name      testModuleName0097
   * @tc.desc      Name start_window_background keeps reverse
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0097', 'start_window_background reverse');
    const token: string = 'start_window_background';
    const reversed: string = token.split('').reverse().join('');
    expect(reversed).assertEqual('dnuorgkcab_wodniw_trats');
    expect(reversed.length).assertEqual(23);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0098
   * @tc.name      testModuleName0098
   * @tc.desc      Name start_window_background keeps underscore split
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0098', 'start_window_background underscore split');
    const token: string = 'start_window_background';
    expect(token.split('_').length).assertEqual(3);
    expect(token.includes('_')).assertEqual(true);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0099
   * @tc.name      testModuleName0099
   * @tc.desc      Name start_window_background keeps lowercase
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0099', 'start_window_background lowercase');
    const token: string = 'start_window_background';
    expect(token.toLowerCase()).assertEqual('start_window_background');
    expect(token.toLowerCase().length).assertEqual(token.length);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0100
   * @tc.name      testModuleName0100
   * @tc.desc      Name background keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0100', 'background length');
    const token: string = 'background';
    expect(token.length).assertEqual(10);
    expect(token.length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0101
   * @tc.name      testModuleName0101
   * @tc.desc      Name background keeps first char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0101', 'background first char');
    const token: string = 'background';
    expect(token.charAt(0)).assertEqual('b');
    expect(token.charCodeAt(0)).assertEqual(98);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0102
   * @tc.name      testModuleName0102
   * @tc.desc      Name background keeps last char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0102', 'background last char');
    const token: string = 'background';
    expect(token.charAt(token.length - 1)).assertEqual('d');
    expect(token.charCodeAt(token.length - 1)).assertEqual(100);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0103
   * @tc.name      testModuleName0103
   * @tc.desc      Name background keeps index of e
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0103', 'background index of e');
    const token: string = 'background';
    expect(token.indexOf('e')).assertEqual(-1);
    expect(token.indexOf('e') >= -1).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0104
   * @tc.name      testModuleName0104
   * @tc.desc      Name background keeps uppercase
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0104', 'background uppercase');
    const token: string = 'background';
    expect(token.toUpperCase()).assertEqual('BACKGROUND');
    expect(token.toUpperCase().length).assertEqual(10);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0105
   * @tc.name      testModuleName0105
   * @tc.desc      Name background keeps tail three
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0105', 'background tail three');
    const token: string = 'background';
    expect(token.substring(token.length - 3)).assertEqual('und');
    expect(token.slice(-3)).assertEqual('und');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0106
   * @tc.name      testModuleName0106
   * @tc.desc      Name background keeps reverse
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0106', 'background reverse');
    const token: string = 'background';
    const reversed: string = token.split('').reverse().join('');
    expect(reversed).assertEqual('dnuorgkcab');
    expect(reversed.length).assertEqual(10);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0107
   * @tc.name      testModuleName0107
   * @tc.desc      Name background keeps underscore split
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0107', 'background underscore split');
    const token: string = 'background';
    expect(token.split('_').length).assertEqual(1);
    expect(token.includes('_')).assertEqual(false);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0108
   * @tc.name      testModuleName0108
   * @tc.desc      Name background keeps lowercase
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0108', 'background lowercase');
    const token: string = 'background';
    expect(token.toLowerCase()).assertEqual('background');
    expect(token.toLowerCase().length).assertEqual(token.length);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0109
   * @tc.name      testModuleName0109
   * @tc.desc      Name foreground keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0109', 'foreground length');
    const token: string = 'foreground';
    expect(token.length).assertEqual(10);
    expect(token.length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0110
   * @tc.name      testModuleName0110
   * @tc.desc      Name foreground keeps first char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0110', 'foreground first char');
    const token: string = 'foreground';
    expect(token.charAt(0)).assertEqual('f');
    expect(token.charCodeAt(0)).assertEqual(102);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0111
   * @tc.name      testModuleName0111
   * @tc.desc      Name foreground keeps last char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0111', 'foreground last char');
    const token: string = 'foreground';
    expect(token.charAt(token.length - 1)).assertEqual('d');
    expect(token.charCodeAt(token.length - 1)).assertEqual(100);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0112
   * @tc.name      testModuleName0112
   * @tc.desc      Name foreground keeps index of e
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0112', 'foreground index of e');
    const token: string = 'foreground';
    expect(token.indexOf('e')).assertEqual(3);
    expect(token.indexOf('e') >= -1).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0113
   * @tc.name      testModuleName0113
   * @tc.desc      Name foreground keeps uppercase
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0113', 'foreground uppercase');
    const token: string = 'foreground';
    expect(token.toUpperCase()).assertEqual('FOREGROUND');
    expect(token.toUpperCase().length).assertEqual(10);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0114
   * @tc.name      testModuleName0114
   * @tc.desc      Name foreground keeps tail three
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0114', 'foreground tail three');
    const token: string = 'foreground';
    expect(token.substring(token.length - 3)).assertEqual('und');
    expect(token.slice(-3)).assertEqual('und');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0115
   * @tc.name      testModuleName0115
   * @tc.desc      Name foreground keeps reverse
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0115', 'foreground reverse');
    const token: string = 'foreground';
    const reversed: string = token.split('').reverse().join('');
    expect(reversed).assertEqual('dnuorgerof');
    expect(reversed.length).assertEqual(10);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0116
   * @tc.name      testModuleName0116
   * @tc.desc      Name foreground keeps underscore split
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0116', 'foreground underscore split');
    const token: string = 'foreground';
    expect(token.split('_').length).assertEqual(1);
    expect(token.includes('_')).assertEqual(false);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0117
   * @tc.name      testModuleName0117
   * @tc.desc      Name foreground keeps lowercase
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0117', 'foreground lowercase');
    const token: string = 'foreground';
    expect(token.toLowerCase()).assertEqual('foreground');
    expect(token.toLowerCase().length).assertEqual(token.length);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0118
   * @tc.name      testModuleName0118
   * @tc.desc      Name startIcon keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0118', 'startIcon length');
    const token: string = 'startIcon';
    expect(token.length).assertEqual(9);
    expect(token.length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0119
   * @tc.name      testModuleName0119
   * @tc.desc      Name startIcon keeps first char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0119', 'startIcon first char');
    const token: string = 'startIcon';
    expect(token.charAt(0)).assertEqual('s');
    expect(token.charCodeAt(0)).assertEqual(115);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0120
   * @tc.name      testModuleName0120
   * @tc.desc      Name startIcon keeps last char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0120', 'startIcon last char');
    const token: string = 'startIcon';
    expect(token.charAt(token.length - 1)).assertEqual('n');
    expect(token.charCodeAt(token.length - 1)).assertEqual(110);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0121
   * @tc.name      testModuleName0121
   * @tc.desc      Name startIcon keeps index of e
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0121', 'startIcon index of e');
    const token: string = 'startIcon';
    expect(token.indexOf('e')).assertEqual(-1);
    expect(token.indexOf('e') >= -1).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0122
   * @tc.name      testModuleName0122
   * @tc.desc      Name startIcon keeps uppercase
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0122', 'startIcon uppercase');
    const token: string = 'startIcon';
    expect(token.toUpperCase()).assertEqual('STARTICON');
    expect(token.toUpperCase().length).assertEqual(9);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0123
   * @tc.name      testModuleName0123
   * @tc.desc      Name startIcon keeps tail three
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0123', 'startIcon tail three');
    const token: string = 'startIcon';
    expect(token.substring(token.length - 3)).assertEqual('con');
    expect(token.slice(-3)).assertEqual('con');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0124
   * @tc.name      testModuleName0124
   * @tc.desc      Name startIcon keeps reverse
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0124', 'startIcon reverse');
    const token: string = 'startIcon';
    const reversed: string = token.split('').reverse().join('');
    expect(reversed).assertEqual('nocItrats');
    expect(reversed.length).assertEqual(9);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0125
   * @tc.name      testModuleName0125
   * @tc.desc      Name startIcon keeps underscore split
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0125', 'startIcon underscore split');
    const token: string = 'startIcon';
    expect(token.split('_').length).assertEqual(1);
    expect(token.includes('_')).assertEqual(false);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0126
   * @tc.name      testModuleName0126
   * @tc.desc      Name startIcon keeps lowercase
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0126', 'startIcon lowercase');
    const token: string = 'startIcon';
    expect(token.toLowerCase()).assertEqual('starticon');
    expect(token.toLowerCase().length).assertEqual(token.length);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0127
   * @tc.name      testModuleName0127
   * @tc.desc      Name layered_image keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0127', 'layered_image length');
    const token: string = 'layered_image';
    expect(token.length).assertEqual(13);
    expect(token.length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0128
   * @tc.name      testModuleName0128
   * @tc.desc      Name layered_image keeps first char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0128', 'layered_image first char');
    const token: string = 'layered_image';
    expect(token.charAt(0)).assertEqual('l');
    expect(token.charCodeAt(0)).assertEqual(108);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0129
   * @tc.name      testModuleName0129
   * @tc.desc      Name layered_image keeps last char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0129', 'layered_image last char');
    const token: string = 'layered_image';
    expect(token.charAt(token.length - 1)).assertEqual('e');
    expect(token.charCodeAt(token.length - 1)).assertEqual(101);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0130
   * @tc.name      testModuleName0130
   * @tc.desc      Name layered_image keeps index of e
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0130', 'layered_image index of e');
    const token: string = 'layered_image';
    expect(token.indexOf('e')).assertEqual(3);
    expect(token.indexOf('e') >= -1).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0131
   * @tc.name      testModuleName0131
   * @tc.desc      Name layered_image keeps uppercase
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0131', 'layered_image uppercase');
    const token: string = 'layered_image';
    expect(token.toUpperCase()).assertEqual('LAYERED_IMAGE');
    expect(token.toUpperCase().length).assertEqual(13);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0132
   * @tc.name      testModuleName0132
   * @tc.desc      Name layered_image keeps tail three
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0132', 'layered_image tail three');
    const token: string = 'layered_image';
    expect(token.substring(token.length - 3)).assertEqual('age');
    expect(token.slice(-3)).assertEqual('age');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0133
   * @tc.name      testModuleName0133
   * @tc.desc      Name layered_image keeps reverse
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0133', 'layered_image reverse');
    const token: string = 'layered_image';
    const reversed: string = token.split('').reverse().join('');
    expect(reversed).assertEqual('egami_dereyal');
    expect(reversed.length).assertEqual(13);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0134
   * @tc.name      testModuleName0134
   * @tc.desc      Name layered_image keeps underscore split
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0134', 'layered_image underscore split');
    const token: string = 'layered_image';
    expect(token.split('_').length).assertEqual(2);
    expect(token.includes('_')).assertEqual(true);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0135
   * @tc.name      testModuleName0135
   * @tc.desc      Name layered_image keeps lowercase
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0135', 'layered_image lowercase');
    const token: string = 'layered_image';
    expect(token.toLowerCase()).assertEqual('layered_image');
    expect(token.toLowerCase().length).assertEqual(token.length);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0136
   * @tc.name      testModuleName0136
   * @tc.desc      Name simple009_har_to_hsp keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0136', 'simple009_har_to_hsp length');
    const token: string = 'simple009_har_to_hsp';
    expect(token.length).assertEqual(20);
    expect(token.length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0137
   * @tc.name      testModuleName0137
   * @tc.desc      Name simple009_har_to_hsp keeps first char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0137', 'simple009_har_to_hsp first char');
    const token: string = 'simple009_har_to_hsp';
    expect(token.charAt(0)).assertEqual('s');
    expect(token.charCodeAt(0)).assertEqual(115);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0138
   * @tc.name      testModuleName0138
   * @tc.desc      Name simple009_har_to_hsp keeps last char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0138', 'simple009_har_to_hsp last char');
    const token: string = 'simple009_har_to_hsp';
    expect(token.charAt(token.length - 1)).assertEqual('p');
    expect(token.charCodeAt(token.length - 1)).assertEqual(112);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0139
   * @tc.name      testModuleName0139
   * @tc.desc      Name simple009_har_to_hsp keeps index of e
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0139', 'simple009_har_to_hsp index of e');
    const token: string = 'simple009_har_to_hsp';
    expect(token.indexOf('e')).assertEqual(5);
    expect(token.indexOf('e') >= -1).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0140
   * @tc.name      testModuleName0140
   * @tc.desc      Name simple009_har_to_hsp keeps uppercase
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0140', 'simple009_har_to_hsp uppercase');
    const token: string = 'simple009_har_to_hsp';
    expect(token.toUpperCase()).assertEqual('SIMPLE009_HAR_TO_HSP');
    expect(token.toUpperCase().length).assertEqual(20);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0141
   * @tc.name      testModuleName0141
   * @tc.desc      Name simple009_har_to_hsp keeps tail three
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0141', 'simple009_har_to_hsp tail three');
    const token: string = 'simple009_har_to_hsp';
    expect(token.substring(token.length - 3)).assertEqual('hsp');
    expect(token.slice(-3)).assertEqual('hsp');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0142
   * @tc.name      testModuleName0142
   * @tc.desc      Name simple009_har_to_hsp keeps reverse
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0142', 'simple009_har_to_hsp reverse');
    const token: string = 'simple009_har_to_hsp';
    const reversed: string = token.split('').reverse().join('');
    expect(reversed).assertEqual('psh_ot_rah_900elpmis');
    expect(reversed.length).assertEqual(20);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0143
   * @tc.name      testModuleName0143
   * @tc.desc      Name simple009_har_to_hsp keeps underscore split
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0143', 'simple009_har_to_hsp underscore split');
    const token: string = 'simple009_har_to_hsp';
    expect(token.split('_').length).assertEqual(4);
    expect(token.includes('_')).assertEqual(true);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0144
   * @tc.name      testModuleName0144
   * @tc.desc      Name simple009_har_to_hsp keeps lowercase
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0144', 'simple009_har_to_hsp lowercase');
    const token: string = 'simple009_har_to_hsp';
    expect(token.toLowerCase()).assertEqual('simple009_har_to_hsp');
    expect(token.toLowerCase().length).assertEqual(token.length);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0145
   * @tc.name      testModuleName0145
   * @tc.desc      Name ohos keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0145', 'ohos length');
    const token: string = 'ohos';
    expect(token.length).assertEqual(4);
    expect(token.length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0146
   * @tc.name      testModuleName0146
   * @tc.desc      Name ohos keeps first char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0146', 'ohos first char');
    const token: string = 'ohos';
    expect(token.charAt(0)).assertEqual('o');
    expect(token.charCodeAt(0)).assertEqual(111);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0147
   * @tc.name      testModuleName0147
   * @tc.desc      Name ohos keeps last char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0147', 'ohos last char');
    const token: string = 'ohos';
    expect(token.charAt(token.length - 1)).assertEqual('s');
    expect(token.charCodeAt(token.length - 1)).assertEqual(115);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0148
   * @tc.name      testModuleName0148
   * @tc.desc      Name ohos keeps index of e
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0148', 'ohos index of e');
    const token: string = 'ohos';
    expect(token.indexOf('e')).assertEqual(-1);
    expect(token.indexOf('e') >= -1).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0149
   * @tc.name      testModuleName0149
   * @tc.desc      Name ohos keeps uppercase
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0149', 'ohos uppercase');
    const token: string = 'ohos';
    expect(token.toUpperCase()).assertEqual('OHOS');
    expect(token.toUpperCase().length).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0150
   * @tc.name      testModuleName0150
   * @tc.desc      Name ohos keeps tail three
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0150', 'ohos tail three');
    const token: string = 'ohos';
    expect(token.substring(token.length - 3)).assertEqual('hos');
    expect(token.slice(-3)).assertEqual('hos');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0151
   * @tc.name      testModuleName0151
   * @tc.desc      Name ohos keeps reverse
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0151', 'ohos reverse');
    const token: string = 'ohos';
    const reversed: string = token.split('').reverse().join('');
    expect(reversed).assertEqual('soho');
    expect(reversed.length).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0152
   * @tc.name      testModuleName0152
   * @tc.desc      Name ohos keeps underscore split
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0152', 'ohos underscore split');
    const token: string = 'ohos';
    expect(token.split('_').length).assertEqual(1);
    expect(token.includes('_')).assertEqual(false);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0153
   * @tc.name      testModuleName0153
   * @tc.desc      Name ohos keeps lowercase
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0153', 'ohos lowercase');
    const token: string = 'ohos';
    expect(token.toLowerCase()).assertEqual('ohos');
    expect(token.toLowerCase().length).assertEqual(token.length);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0154
   * @tc.name      testModuleName0154
   * @tc.desc      Name app keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0154', 'app length');
    const token: string = 'app';
    expect(token.length).assertEqual(3);
    expect(token.length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0155
   * @tc.name      testModuleName0155
   * @tc.desc      Name app keeps first char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0155', 'app first char');
    const token: string = 'app';
    expect(token.charAt(0)).assertEqual('a');
    expect(token.charCodeAt(0)).assertEqual(97);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0156
   * @tc.name      testModuleName0156
   * @tc.desc      Name app keeps last char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0156', 'app last char');
    const token: string = 'app';
    expect(token.charAt(token.length - 1)).assertEqual('p');
    expect(token.charCodeAt(token.length - 1)).assertEqual(112);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0157
   * @tc.name      testModuleName0157
   * @tc.desc      Name app keeps index of e
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0157', 'app index of e');
    const token: string = 'app';
    expect(token.indexOf('e')).assertEqual(-1);
    expect(token.indexOf('e') >= -1).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0158
   * @tc.name      testModuleName0158
   * @tc.desc      Name app keeps uppercase
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0158', 'app uppercase');
    const token: string = 'app';
    expect(token.toUpperCase()).assertEqual('APP');
    expect(token.toUpperCase().length).assertEqual(3);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0159
   * @tc.name      testModuleName0159
   * @tc.desc      Name app keeps tail three
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0159', 'app tail three');
    const token: string = 'app';
    expect(token.substring(token.length - 3)).assertEqual('app');
    expect(token.slice(-3)).assertEqual('app');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0160
   * @tc.name      testModuleName0160
   * @tc.desc      Name app keeps reverse
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0160', 'app reverse');
    const token: string = 'app';
    const reversed: string = token.split('').reverse().join('');
    expect(reversed).assertEqual('ppa');
    expect(reversed.length).assertEqual(3);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0161
   * @tc.name      testModuleName0161
   * @tc.desc      Name app keeps underscore split
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0161', 'app underscore split');
    const token: string = 'app';
    expect(token.split('_').length).assertEqual(1);
    expect(token.includes('_')).assertEqual(false);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0162
   * @tc.name      testModuleName0162
   * @tc.desc      Name app keeps lowercase
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0162', 'app lowercase');
    const token: string = 'app';
    expect(token.toLowerCase()).assertEqual('app');
    expect(token.toLowerCase().length).assertEqual(token.length);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0163
   * @tc.name      testModuleName0163
   * @tc.desc      Name hap keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0163', 'hap length');
    const token: string = 'hap';
    expect(token.length).assertEqual(3);
    expect(token.length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0164
   * @tc.name      testModuleName0164
   * @tc.desc      Name hap keeps first char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0164', 'hap first char');
    const token: string = 'hap';
    expect(token.charAt(0)).assertEqual('h');
    expect(token.charCodeAt(0)).assertEqual(104);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0165
   * @tc.name      testModuleName0165
   * @tc.desc      Name hap keeps last char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0165', 'hap last char');
    const token: string = 'hap';
    expect(token.charAt(token.length - 1)).assertEqual('p');
    expect(token.charCodeAt(token.length - 1)).assertEqual(112);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0166
   * @tc.name      testModuleName0166
   * @tc.desc      Name hap keeps index of e
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0166', 'hap index of e');
    const token: string = 'hap';
    expect(token.indexOf('e')).assertEqual(-1);
    expect(token.indexOf('e') >= -1).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0167
   * @tc.name      testModuleName0167
   * @tc.desc      Name hap keeps uppercase
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0167', 'hap uppercase');
    const token: string = 'hap';
    expect(token.toUpperCase()).assertEqual('HAP');
    expect(token.toUpperCase().length).assertEqual(3);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0168
   * @tc.name      testModuleName0168
   * @tc.desc      Name hap keeps tail three
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0168', 'hap tail three');
    const token: string = 'hap';
    expect(token.substring(token.length - 3)).assertEqual('hap');
    expect(token.slice(-3)).assertEqual('hap');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0169
   * @tc.name      testModuleName0169
   * @tc.desc      Name hap keeps reverse
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0169', 'hap reverse');
    const token: string = 'hap';
    const reversed: string = token.split('').reverse().join('');
    expect(reversed).assertEqual('pah');
    expect(reversed.length).assertEqual(3);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0170
   * @tc.name      testModuleName0170
   * @tc.desc      Name hap keeps underscore split
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0170', 'hap underscore split');
    const token: string = 'hap';
    expect(token.split('_').length).assertEqual(1);
    expect(token.includes('_')).assertEqual(false);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0171
   * @tc.name      testModuleName0171
   * @tc.desc      Name hap keeps lowercase
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0171', 'hap lowercase');
    const token: string = 'hap';
    expect(token.toLowerCase()).assertEqual('hap');
    expect(token.toLowerCase().length).assertEqual(token.length);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0172
   * @tc.name      testModuleName0172
   * @tc.desc      Name myapplication keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0172', 'myapplication length');
    const token: string = 'myapplication';
    expect(token.length).assertEqual(13);
    expect(token.length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0173
   * @tc.name      testModuleName0173
   * @tc.desc      Name myapplication keeps first char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0173', 'myapplication first char');
    const token: string = 'myapplication';
    expect(token.charAt(0)).assertEqual('m');
    expect(token.charCodeAt(0)).assertEqual(109);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0174
   * @tc.name      testModuleName0174
   * @tc.desc      Name myapplication keeps last char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0174', 'myapplication last char');
    const token: string = 'myapplication';
    expect(token.charAt(token.length - 1)).assertEqual('n');
    expect(token.charCodeAt(token.length - 1)).assertEqual(110);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0175
   * @tc.name      testModuleName0175
   * @tc.desc      Name myapplication keeps index of e
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0175', 'myapplication index of e');
    const token: string = 'myapplication';
    expect(token.indexOf('e')).assertEqual(-1);
    expect(token.indexOf('e') >= -1).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0176
   * @tc.name      testModuleName0176
   * @tc.desc      Name myapplication keeps uppercase
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleName0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleName0176', 'myapplication uppercase');
    const token: string = 'myapplication';
    expect(token.toUpperCase()).assertEqual('MYAPPLICATION');
    expect(token.toUpperCase().length).assertEqual(13);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0177
   * @tc.name      testModuleName0177
   * @tc.desc      Name myapplication keeps tail three
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleName0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleName0177', 'myapplication tail three');
    const token: string = 'myapplication';
    expect(token.substring(token.length - 3)).assertEqual('ion');
    expect(token.slice(-3)).assertEqual('ion');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_NAME_0178
   * @tc.name      testModuleName0178
   * @tc.desc      Name myapplication keeps reverse
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleName0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleName0178', 'myapplication reverse');
    const token: string = 'myapplication';
    const reversed: string = token.split('').reverse().join('');
    expect(reversed).assertEqual('noitacilppaym');
    expect(reversed.length).assertEqual(13);
  });

