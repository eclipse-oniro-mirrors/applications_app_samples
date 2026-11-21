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
import { Want } from '@kit.AbilityKit';
import { BUNDLE_NAME, ENTRY_MODULE, ENTRY_ABILITY, BACKUP_ABILITY } from './shared/Probe';
import { logCase } from './shared/TestLog';

import { paceTurn } from './shared/TestPace';

export default function wantFactsMatrixTest() {
  describe('wantFactsMatrixTest', () => {
  beforeEach(async () => {
    await paceTurn();
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_WANT_0001
   * @tc.name      testWantFacts0001
   * @tc.desc      Want builder 1 checks bundle name literal
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testWantFacts0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testWantFacts0001', 'want builder 1');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      moduleName: ENTRY_MODULE,
      abilityName: ENTRY_ABILITY
    };
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_WANT_0002
   * @tc.name      testWantFacts0002
   * @tc.desc      Want builder 2 checks module name literal
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testWantFacts0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testWantFacts0002', 'want builder 2');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      moduleName: ENTRY_MODULE,
      abilityName: ENTRY_ABILITY
    };
    expect(want.moduleName as string).assertEqual(ENTRY_MODULE);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_WANT_0003
   * @tc.name      testWantFacts0003
   * @tc.desc      Want builder 3 checks ability name literal
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testWantFacts0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testWantFacts0003', 'want builder 3');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      moduleName: ENTRY_MODULE,
      abilityName: ENTRY_ABILITY
    };
    expect(want.abilityName as string).assertEqual(ENTRY_ABILITY);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_WANT_0004
   * @tc.name      testWantFacts0004
   * @tc.desc      Want builder 4 checks bundle segments
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testWantFacts0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testWantFacts0004', 'want builder 4');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      moduleName: ENTRY_MODULE,
      abilityName: ENTRY_ABILITY
    };
    expect((want.bundleName as string).split('.').length).assertEqual(4);
    expect((want.bundleName as string).startsWith('com')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_WANT_0005
   * @tc.name      testWantFacts0005
   * @tc.desc      Want builder 5 checks ability suffix
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testWantFacts0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testWantFacts0005', 'want builder 5');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      moduleName: ENTRY_MODULE,
      abilityName: ENTRY_ABILITY
    };
    expect((want.abilityName as string).endsWith('Ability')).assertTrue();
    expect((want.abilityName as string).length).assertEqual(12);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_WANT_0006
   * @tc.name      testWantFacts0006
   * @tc.desc      Want builder 6 checks ability head
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testWantFacts0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testWantFacts0006', 'want builder 6');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      moduleName: ENTRY_MODULE,
      abilityName: ENTRY_ABILITY
    };
    expect((want.abilityName as string).charAt(0)).assertEqual('E');
    expect((want.abilityName as string).indexOf('Ability')).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_WANT_0007
   * @tc.name      testWantFacts0007
   * @tc.desc      Want builder 7 checks module short name
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testWantFacts0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testWantFacts0007', 'want builder 7');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      moduleName: ENTRY_MODULE,
      abilityName: ENTRY_ABILITY
    };
    expect((want.moduleName as string).length).assertEqual(5);
    expect((want.moduleName as string).toLowerCase()).assertEqual('entry');
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_WANT_0008
   * @tc.name      testWantFacts0008
   * @tc.desc      Want builder 8 checks all fields set
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testWantFacts0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testWantFacts0008', 'want builder 8');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      moduleName: ENTRY_MODULE,
      abilityName: ENTRY_ABILITY
    };
    expect(want.bundleName !== undefined).assertTrue();
    expect(want.moduleName !== undefined).assertTrue();
    expect(want.abilityName !== undefined).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_WANT_0009
   * @tc.name      testWantFacts0009
   * @tc.desc      Want uri pass 1 keeps scheme
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testWantFacts0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testWantFacts0009', 'want uri 1');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      uri: 'http://node1.example.org/item/7'
    };
    const uri: string = want.uri as string;
    expect(uri.startsWith('http://')).assertTrue();
    expect(uri.includes('node1.example.org')).assertTrue();
    expect(uri.endsWith('/7')).assertTrue();
    expect(uri.split('://').length).assertEqual(2);
    expect(uri.indexOf('://')).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_WANT_0010
   * @tc.name      testWantFacts0010
   * @tc.desc      Want uri pass 2 keeps scheme
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testWantFacts0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testWantFacts0010', 'want uri 2');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      uri: 'file://node2.example.org/item/14'
    };
    const uri: string = want.uri as string;
    expect(uri.startsWith('file://')).assertTrue();
    expect(uri.includes('node2.example.org')).assertTrue();
    expect(uri.endsWith('/14')).assertTrue();
    expect(uri.split('://').length).assertEqual(2);
    expect(uri.indexOf('://')).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_WANT_0011
   * @tc.name      testWantFacts0011
   * @tc.desc      Want uri pass 3 keeps scheme
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testWantFacts0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testWantFacts0011', 'want uri 3');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      uri: 'data://node3.example.org/item/21'
    };
    const uri: string = want.uri as string;
    expect(uri.startsWith('data://')).assertTrue();
    expect(uri.includes('node3.example.org')).assertTrue();
    expect(uri.endsWith('/21')).assertTrue();
    expect(uri.split('://').length).assertEqual(2);
    expect(uri.indexOf('://')).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_WANT_0012
   * @tc.name      testWantFacts0012
   * @tc.desc      Want uri pass 4 keeps scheme
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testWantFacts0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testWantFacts0012', 'want uri 4');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      uri: 'ftp://node4.example.org/item/28'
    };
    const uri: string = want.uri as string;
    expect(uri.startsWith('ftp://')).assertTrue();
    expect(uri.includes('node4.example.org')).assertTrue();
    expect(uri.endsWith('/28')).assertTrue();
    expect(uri.split('://').length).assertEqual(2);
    expect(uri.indexOf('://')).assertEqual(3);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_WANT_0013
   * @tc.name      testWantFacts0013
   * @tc.desc      Want uri pass 5 keeps scheme
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testWantFacts0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testWantFacts0013', 'want uri 5');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      uri: 'https://node5.example.org/item/35'
    };
    const uri: string = want.uri as string;
    expect(uri.startsWith('https://')).assertTrue();
    expect(uri.includes('node5.example.org')).assertTrue();
    expect(uri.endsWith('/35')).assertTrue();
    expect(uri.split('://').length).assertEqual(2);
    expect(uri.indexOf('://')).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_WANT_0014
   * @tc.name      testWantFacts0014
   * @tc.desc      Want uri pass 6 keeps scheme
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testWantFacts0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testWantFacts0014', 'want uri 6');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      uri: 'http://node6.example.org/item/42'
    };
    const uri: string = want.uri as string;
    expect(uri.startsWith('http://')).assertTrue();
    expect(uri.includes('node6.example.org')).assertTrue();
    expect(uri.endsWith('/42')).assertTrue();
    expect(uri.split('://').length).assertEqual(2);
    expect(uri.indexOf('://')).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_WANT_0015
   * @tc.name      testWantFacts0015
   * @tc.desc      Want uri pass 7 keeps scheme
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testWantFacts0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testWantFacts0015', 'want uri 7');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      uri: 'file://node7.example.org/item/49'
    };
    const uri: string = want.uri as string;
    expect(uri.startsWith('file://')).assertTrue();
    expect(uri.includes('node7.example.org')).assertTrue();
    expect(uri.endsWith('/49')).assertTrue();
    expect(uri.split('://').length).assertEqual(2);
    expect(uri.indexOf('://')).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_WANT_0016
   * @tc.name      testWantFacts0016
   * @tc.desc      Want uri pass 8 keeps scheme
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testWantFacts0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testWantFacts0016', 'want uri 8');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      uri: 'data://node8.example.org/item/56'
    };
    const uri: string = want.uri as string;
    expect(uri.startsWith('data://')).assertTrue();
    expect(uri.includes('node8.example.org')).assertTrue();
    expect(uri.endsWith('/56')).assertTrue();
    expect(uri.split('://').length).assertEqual(2);
    expect(uri.indexOf('://')).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_WANT_0017
   * @tc.name      testWantFacts0017
   * @tc.desc      Want uri pass 9 keeps scheme
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testWantFacts0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testWantFacts0017', 'want uri 9');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      uri: 'ftp://node9.example.org/item/63'
    };
    const uri: string = want.uri as string;
    expect(uri.startsWith('ftp://')).assertTrue();
    expect(uri.includes('node9.example.org')).assertTrue();
    expect(uri.endsWith('/63')).assertTrue();
    expect(uri.split('://').length).assertEqual(2);
    expect(uri.indexOf('://')).assertEqual(3);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_WANT_0018
   * @tc.name      testWantFacts0018
   * @tc.desc      Want uri pass 10 keeps scheme
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testWantFacts0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testWantFacts0018', 'want uri 10');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      uri: 'https://node10.example.org/item/70'
    };
    const uri: string = want.uri as string;
    expect(uri.startsWith('https://')).assertTrue();
    expect(uri.includes('node10.example.org')).assertTrue();
    expect(uri.endsWith('/70')).assertTrue();
    expect(uri.split('://').length).assertEqual(2);
    expect(uri.indexOf('://')).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_WANT_0019
   * @tc.name      testWantFacts0019
   * @tc.desc      Want uri pass 11 keeps scheme
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testWantFacts0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testWantFacts0019', 'want uri 11');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      uri: 'http://node11.example.org/item/77'
    };
    const uri: string = want.uri as string;
    expect(uri.startsWith('http://')).assertTrue();
    expect(uri.includes('node11.example.org')).assertTrue();
    expect(uri.endsWith('/77')).assertTrue();
    expect(uri.split('://').length).assertEqual(2);
    expect(uri.indexOf('://')).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_WANT_0020
   * @tc.name      testWantFacts0020
   * @tc.desc      Want uri pass 12 keeps scheme
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testWantFacts0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testWantFacts0020', 'want uri 12');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      uri: 'file://node12.example.org/item/84'
    };
    const uri: string = want.uri as string;
    expect(uri.startsWith('file://')).assertTrue();
    expect(uri.includes('node12.example.org')).assertTrue();
    expect(uri.endsWith('/84')).assertTrue();
    expect(uri.split('://').length).assertEqual(2);
    expect(uri.indexOf('://')).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_WANT_0021
   * @tc.name      testWantFacts0021
   * @tc.desc      Want uri pass 13 keeps scheme
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testWantFacts0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testWantFacts0021', 'want uri 13');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      uri: 'data://node13.example.org/item/91'
    };
    const uri: string = want.uri as string;
    expect(uri.startsWith('data://')).assertTrue();
    expect(uri.includes('node13.example.org')).assertTrue();
