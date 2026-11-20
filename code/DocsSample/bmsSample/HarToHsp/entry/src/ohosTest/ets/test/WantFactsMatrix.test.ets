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
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0001
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
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0002
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
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0003
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
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0004
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
    expect((want.bundleName as string).startsWith('ohos')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0005
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
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0006
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
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0007
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
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0008
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
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0009
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
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0010
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
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0011
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
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0012
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
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0013
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
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0014
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
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0015
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
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0016
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
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0017
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
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0018
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
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0019
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
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0020
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
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0021
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
    expect(uri.endsWith('/91')).assertTrue();
    expect(uri.split('://').length).assertEqual(2);
    expect(uri.indexOf('://')).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0022
   * @tc.name      testWantFacts0022
   * @tc.desc      Want uri pass 14 keeps scheme
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testWantFacts0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testWantFacts0022', 'want uri 14');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      uri: 'ftp://node14.example.org/item/98'
    };
    const uri: string = want.uri as string;
    expect(uri.startsWith('ftp://')).assertTrue();
    expect(uri.includes('node14.example.org')).assertTrue();
    expect(uri.endsWith('/98')).assertTrue();
    expect(uri.split('://').length).assertEqual(2);
    expect(uri.indexOf('://')).assertEqual(3);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0023
   * @tc.name      testWantFacts0023
   * @tc.desc      Want uri pass 15 keeps scheme
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testWantFacts0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testWantFacts0023', 'want uri 15');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      uri: 'https://node15.example.org/item/105'
    };
    const uri: string = want.uri as string;
    expect(uri.startsWith('https://')).assertTrue();
    expect(uri.includes('node15.example.org')).assertTrue();
    expect(uri.endsWith('/105')).assertTrue();
    expect(uri.split('://').length).assertEqual(2);
    expect(uri.indexOf('://')).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0024
   * @tc.name      testWantFacts0024
   * @tc.desc      Want uri pass 16 keeps scheme
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testWantFacts0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testWantFacts0024', 'want uri 16');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      uri: 'http://node16.example.org/item/112'
    };
    const uri: string = want.uri as string;
    expect(uri.startsWith('http://')).assertTrue();
    expect(uri.includes('node16.example.org')).assertTrue();
    expect(uri.endsWith('/112')).assertTrue();
    expect(uri.split('://').length).assertEqual(2);
    expect(uri.indexOf('://')).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0025
   * @tc.name      testWantFacts0025
   * @tc.desc      Want uri pass 17 keeps scheme
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testWantFacts0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testWantFacts0025', 'want uri 17');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      uri: 'file://node17.example.org/item/119'
    };
    const uri: string = want.uri as string;
    expect(uri.startsWith('file://')).assertTrue();
    expect(uri.includes('node17.example.org')).assertTrue();
    expect(uri.endsWith('/119')).assertTrue();
    expect(uri.split('://').length).assertEqual(2);
    expect(uri.indexOf('://')).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0026
   * @tc.name      testWantFacts0026
   * @tc.desc      Want uri pass 18 keeps scheme
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testWantFacts0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testWantFacts0026', 'want uri 18');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      uri: 'data://node18.example.org/item/126'
    };
    const uri: string = want.uri as string;
    expect(uri.startsWith('data://')).assertTrue();
    expect(uri.includes('node18.example.org')).assertTrue();
    expect(uri.endsWith('/126')).assertTrue();
    expect(uri.split('://').length).assertEqual(2);
    expect(uri.indexOf('://')).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0027
   * @tc.name      testWantFacts0027
   * @tc.desc      Want uri pass 19 keeps scheme
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testWantFacts0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testWantFacts0027', 'want uri 19');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      uri: 'ftp://node19.example.org/item/133'
    };
    const uri: string = want.uri as string;
    expect(uri.startsWith('ftp://')).assertTrue();
    expect(uri.includes('node19.example.org')).assertTrue();
    expect(uri.endsWith('/133')).assertTrue();
    expect(uri.split('://').length).assertEqual(2);
    expect(uri.indexOf('://')).assertEqual(3);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0028
   * @tc.name      testWantFacts0028
   * @tc.desc      Want uri pass 20 keeps scheme
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testWantFacts0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testWantFacts0028', 'want uri 20');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      uri: 'https://node20.example.org/item/140'
    };
    const uri: string = want.uri as string;
    expect(uri.startsWith('https://')).assertTrue();
    expect(uri.includes('node20.example.org')).assertTrue();
    expect(uri.endsWith('/140')).assertTrue();
    expect(uri.split('://').length).assertEqual(2);
    expect(uri.indexOf('://')).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0029
   * @tc.name      testWantFacts0029
   * @tc.desc      Want uri pass 21 keeps scheme
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testWantFacts0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testWantFacts0029', 'want uri 21');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      uri: 'http://node21.example.org/item/147'
    };
    const uri: string = want.uri as string;
    expect(uri.startsWith('http://')).assertTrue();
    expect(uri.includes('node21.example.org')).assertTrue();
    expect(uri.endsWith('/147')).assertTrue();
    expect(uri.split('://').length).assertEqual(2);
    expect(uri.indexOf('://')).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0030
   * @tc.name      testWantFacts0030
   * @tc.desc      Want uri pass 22 keeps scheme
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testWantFacts0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testWantFacts0030', 'want uri 22');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      uri: 'file://node22.example.org/item/154'
    };
    const uri: string = want.uri as string;
    expect(uri.startsWith('file://')).assertTrue();
    expect(uri.includes('node22.example.org')).assertTrue();
    expect(uri.endsWith('/154')).assertTrue();
    expect(uri.split('://').length).assertEqual(2);
    expect(uri.indexOf('://')).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0031
   * @tc.name      testWantFacts0031
   * @tc.desc      Want uri pass 23 keeps scheme
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testWantFacts0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testWantFacts0031', 'want uri 23');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      uri: 'data://node23.example.org/item/161'
    };
    const uri: string = want.uri as string;
    expect(uri.startsWith('data://')).assertTrue();
    expect(uri.includes('node23.example.org')).assertTrue();
    expect(uri.endsWith('/161')).assertTrue();
    expect(uri.split('://').length).assertEqual(2);
    expect(uri.indexOf('://')).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0032
   * @tc.name      testWantFacts0032
   * @tc.desc      Want uri pass 24 keeps scheme
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testWantFacts0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testWantFacts0032', 'want uri 24');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      uri: 'ftp://node24.example.org/item/168'
    };
    const uri: string = want.uri as string;
    expect(uri.startsWith('ftp://')).assertTrue();
    expect(uri.includes('node24.example.org')).assertTrue();
    expect(uri.endsWith('/168')).assertTrue();
    expect(uri.split('://').length).assertEqual(2);
    expect(uri.indexOf('://')).assertEqual(3);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0033
   * @tc.name      testWantFacts0033
   * @tc.desc      Want uri pass 25 keeps scheme
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testWantFacts0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testWantFacts0033', 'want uri 25');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      uri: 'https://node25.example.org/item/175'
    };
    const uri: string = want.uri as string;
    expect(uri.startsWith('https://')).assertTrue();
    expect(uri.includes('node25.example.org')).assertTrue();
    expect(uri.endsWith('/175')).assertTrue();
    expect(uri.split('://').length).assertEqual(2);
    expect(uri.indexOf('://')).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0034
   * @tc.name      testWantFacts0034
   * @tc.desc      Want uri pass 26 keeps scheme
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testWantFacts0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testWantFacts0034', 'want uri 26');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      uri: 'http://node26.example.org/item/182'
    };
    const uri: string = want.uri as string;
    expect(uri.startsWith('http://')).assertTrue();
    expect(uri.includes('node26.example.org')).assertTrue();
    expect(uri.endsWith('/182')).assertTrue();
    expect(uri.split('://').length).assertEqual(2);
    expect(uri.indexOf('://')).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0035
   * @tc.name      testWantFacts0035
   * @tc.desc      Want uri pass 27 keeps scheme
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testWantFacts0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testWantFacts0035', 'want uri 27');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      uri: 'file://node27.example.org/item/189'
    };
    const uri: string = want.uri as string;
    expect(uri.startsWith('file://')).assertTrue();
    expect(uri.includes('node27.example.org')).assertTrue();
    expect(uri.endsWith('/189')).assertTrue();
    expect(uri.split('://').length).assertEqual(2);
    expect(uri.indexOf('://')).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0036
   * @tc.name      testWantFacts0036
   * @tc.desc      Want uri pass 28 keeps scheme
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testWantFacts0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testWantFacts0036', 'want uri 28');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      uri: 'data://node28.example.org/item/196'
    };
    const uri: string = want.uri as string;
    expect(uri.startsWith('data://')).assertTrue();
    expect(uri.includes('node28.example.org')).assertTrue();
    expect(uri.endsWith('/196')).assertTrue();
    expect(uri.split('://').length).assertEqual(2);
    expect(uri.indexOf('://')).assertEqual(4);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0037
   * @tc.name      testWantFacts0037
   * @tc.desc      Want uri pass 29 keeps scheme
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testWantFacts0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testWantFacts0037', 'want uri 29');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      uri: 'ftp://node29.example.org/item/203'
    };
    const uri: string = want.uri as string;
    expect(uri.startsWith('ftp://')).assertTrue();
    expect(uri.includes('node29.example.org')).assertTrue();
    expect(uri.endsWith('/203')).assertTrue();
    expect(uri.split('://').length).assertEqual(2);
    expect(uri.indexOf('://')).assertEqual(3);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0038
   * @tc.name      testWantFacts0038
   * @tc.desc      Want uri pass 30 keeps scheme
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testWantFacts0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testWantFacts0038', 'want uri 30');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      uri: 'https://node30.example.org/item/210'
    };
    const uri: string = want.uri as string;
    expect(uri.startsWith('https://')).assertTrue();
    expect(uri.includes('node30.example.org')).assertTrue();
    expect(uri.endsWith('/210')).assertTrue();
    expect(uri.split('://').length).assertEqual(2);
    expect(uri.indexOf('://')).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0039
   * @tc.name      testWantFacts0039
   * @tc.desc      Want parameters 1 round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testWantFacts0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testWantFacts0039', 'want params 1');
    const params: Record<string, Object> = {
      'probe': 13,
      'label': 'alpha'
    };
    const want: Want = {
      bundleName: BUNDLE_NAME,
      abilityName: ENTRY_ABILITY,
      parameters: params
    };
    const stored: Record<string, Object> = want.parameters as Record<string, Object>;
    expect(stored['probe'] as number).assertEqual(13);
    expect(stored['label'] as string).assertEqual('alpha');
    expect((stored['label'] as string).length).assertEqual(5);
    expect((stored['label'] as string).charAt(0)).assertEqual('a');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0040
   * @tc.name      testWantFacts0040
   * @tc.desc      Want parameters 2 round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testWantFacts0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testWantFacts0040', 'want params 2');
    const params: Record<string, Object> = {
      'probe': 26,
      'label': 'bravo'
    };
    const want: Want = {
      bundleName: BUNDLE_NAME,
      abilityName: ENTRY_ABILITY,
      parameters: params
    };
    const stored: Record<string, Object> = want.parameters as Record<string, Object>;
    expect(stored['probe'] as number).assertEqual(26);
    expect(stored['label'] as string).assertEqual('bravo');
    expect((stored['label'] as string).length).assertEqual(5);
    expect((stored['label'] as string).charAt(0)).assertEqual('b');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0041
   * @tc.name      testWantFacts0041
   * @tc.desc      Want parameters 3 round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testWantFacts0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testWantFacts0041', 'want params 3');
    const params: Record<string, Object> = {
      'probe': 39,
      'label': 'charlie'
    };
    const want: Want = {
      bundleName: BUNDLE_NAME,
      abilityName: ENTRY_ABILITY,
      parameters: params
    };
    const stored: Record<string, Object> = want.parameters as Record<string, Object>;
    expect(stored['probe'] as number).assertEqual(39);
    expect(stored['label'] as string).assertEqual('charlie');
    expect((stored['label'] as string).length).assertEqual(7);
    expect((stored['label'] as string).charAt(0)).assertEqual('c');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0042
   * @tc.name      testWantFacts0042
   * @tc.desc      Want parameters 4 round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testWantFacts0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testWantFacts0042', 'want params 4');
    const params: Record<string, Object> = {
      'probe': 52,
      'label': 'delta'
    };
    const want: Want = {
      bundleName: BUNDLE_NAME,
      abilityName: ENTRY_ABILITY,
      parameters: params
    };
    const stored: Record<string, Object> = want.parameters as Record<string, Object>;
    expect(stored['probe'] as number).assertEqual(52);
    expect(stored['label'] as string).assertEqual('delta');
    expect((stored['label'] as string).length).assertEqual(5);
    expect((stored['label'] as string).charAt(0)).assertEqual('d');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0043
   * @tc.name      testWantFacts0043
   * @tc.desc      Want parameters 5 round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testWantFacts0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testWantFacts0043', 'want params 5');
    const params: Record<string, Object> = {
      'probe': 65,
      'label': 'echo'
    };
    const want: Want = {
      bundleName: BUNDLE_NAME,
      abilityName: ENTRY_ABILITY,
      parameters: params
    };
    const stored: Record<string, Object> = want.parameters as Record<string, Object>;
    expect(stored['probe'] as number).assertEqual(65);
    expect(stored['label'] as string).assertEqual('echo');
    expect((stored['label'] as string).length).assertEqual(4);
    expect((stored['label'] as string).charAt(0)).assertEqual('e');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0044
   * @tc.name      testWantFacts0044
   * @tc.desc      Want parameters 6 round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testWantFacts0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testWantFacts0044', 'want params 6');
    const params: Record<string, Object> = {
      'probe': 78,
      'label': 'foxtrot'
    };
    const want: Want = {
      bundleName: BUNDLE_NAME,
      abilityName: ENTRY_ABILITY,
      parameters: params
    };
    const stored: Record<string, Object> = want.parameters as Record<string, Object>;
    expect(stored['probe'] as number).assertEqual(78);
    expect(stored['label'] as string).assertEqual('foxtrot');
    expect((stored['label'] as string).length).assertEqual(7);
    expect((stored['label'] as string).charAt(0)).assertEqual('f');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0045
   * @tc.name      testWantFacts0045
   * @tc.desc      Want parameters 7 round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testWantFacts0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testWantFacts0045', 'want params 7');
    const params: Record<string, Object> = {
      'probe': 91,
      'label': 'golf'
    };
    const want: Want = {
      bundleName: BUNDLE_NAME,
      abilityName: ENTRY_ABILITY,
      parameters: params
    };
    const stored: Record<string, Object> = want.parameters as Record<string, Object>;
    expect(stored['probe'] as number).assertEqual(91);
    expect(stored['label'] as string).assertEqual('golf');
    expect((stored['label'] as string).length).assertEqual(4);
    expect((stored['label'] as string).charAt(0)).assertEqual('g');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0046
   * @tc.name      testWantFacts0046
   * @tc.desc      Want parameters 8 round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testWantFacts0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testWantFacts0046', 'want params 8');
    const params: Record<string, Object> = {
      'probe': 104,
      'label': 'hotel'
    };
    const want: Want = {
      bundleName: BUNDLE_NAME,
      abilityName: ENTRY_ABILITY,
      parameters: params
    };
    const stored: Record<string, Object> = want.parameters as Record<string, Object>;
    expect(stored['probe'] as number).assertEqual(104);
    expect(stored['label'] as string).assertEqual('hotel');
    expect((stored['label'] as string).length).assertEqual(5);
    expect((stored['label'] as string).charAt(0)).assertEqual('h');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0047
   * @tc.name      testWantFacts0047
   * @tc.desc      Want parameters 9 round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testWantFacts0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testWantFacts0047', 'want params 9');
    const params: Record<string, Object> = {
      'probe': 117,
      'label': 'india'
    };
    const want: Want = {
      bundleName: BUNDLE_NAME,
      abilityName: ENTRY_ABILITY,
      parameters: params
    };
    const stored: Record<string, Object> = want.parameters as Record<string, Object>;
    expect(stored['probe'] as number).assertEqual(117);
    expect(stored['label'] as string).assertEqual('india');
    expect((stored['label'] as string).length).assertEqual(5);
    expect((stored['label'] as string).charAt(0)).assertEqual('i');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0048
   * @tc.name      testWantFacts0048
   * @tc.desc      Want parameters 10 round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testWantFacts0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testWantFacts0048', 'want params 10');
    const params: Record<string, Object> = {
      'probe': 130,
      'label': 'juliet'
    };
    const want: Want = {
      bundleName: BUNDLE_NAME,
      abilityName: ENTRY_ABILITY,
      parameters: params
    };
    const stored: Record<string, Object> = want.parameters as Record<string, Object>;
    expect(stored['probe'] as number).assertEqual(130);
    expect(stored['label'] as string).assertEqual('juliet');
    expect((stored['label'] as string).length).assertEqual(6);
    expect((stored['label'] as string).charAt(0)).assertEqual('j');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0049
   * @tc.name      testWantFacts0049
   * @tc.desc      Want parameters 11 round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testWantFacts0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testWantFacts0049', 'want params 11');
    const params: Record<string, Object> = {
      'probe': 143,
      'label': 'kilo'
    };
    const want: Want = {
      bundleName: BUNDLE_NAME,
      abilityName: ENTRY_ABILITY,
      parameters: params
    };
    const stored: Record<string, Object> = want.parameters as Record<string, Object>;
    expect(stored['probe'] as number).assertEqual(143);
    expect(stored['label'] as string).assertEqual('kilo');
    expect((stored['label'] as string).length).assertEqual(4);
    expect((stored['label'] as string).charAt(0)).assertEqual('k');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0050
   * @tc.name      testWantFacts0050
   * @tc.desc      Want parameters 12 round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testWantFacts0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testWantFacts0050', 'want params 12');
    const params: Record<string, Object> = {
      'probe': 156,
      'label': 'lima'
    };
    const want: Want = {
      bundleName: BUNDLE_NAME,
      abilityName: ENTRY_ABILITY,
      parameters: params
    };
    const stored: Record<string, Object> = want.parameters as Record<string, Object>;
    expect(stored['probe'] as number).assertEqual(156);
    expect(stored['label'] as string).assertEqual('lima');
    expect((stored['label'] as string).length).assertEqual(4);
    expect((stored['label'] as string).charAt(0)).assertEqual('l');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0051
   * @tc.name      testWantFacts0051
   * @tc.desc      Want parameters 13 round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testWantFacts0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testWantFacts0051', 'want params 13');
    const params: Record<string, Object> = {
      'probe': 169,
      'label': 'mike'
    };
    const want: Want = {
      bundleName: BUNDLE_NAME,
      abilityName: ENTRY_ABILITY,
      parameters: params
    };
    const stored: Record<string, Object> = want.parameters as Record<string, Object>;
    expect(stored['probe'] as number).assertEqual(169);
    expect(stored['label'] as string).assertEqual('mike');
    expect((stored['label'] as string).length).assertEqual(4);
    expect((stored['label'] as string).charAt(0)).assertEqual('m');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0052
   * @tc.name      testWantFacts0052
   * @tc.desc      Want parameters 14 round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testWantFacts0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testWantFacts0052', 'want params 14');
    const params: Record<string, Object> = {
      'probe': 182,
      'label': 'november'
    };
    const want: Want = {
      bundleName: BUNDLE_NAME,
      abilityName: ENTRY_ABILITY,
      parameters: params
    };
    const stored: Record<string, Object> = want.parameters as Record<string, Object>;
    expect(stored['probe'] as number).assertEqual(182);
    expect(stored['label'] as string).assertEqual('november');
    expect((stored['label'] as string).length).assertEqual(8);
    expect((stored['label'] as string).charAt(0)).assertEqual('n');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0053
   * @tc.name      testWantFacts0053
   * @tc.desc      Want parameters 15 round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testWantFacts0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testWantFacts0053', 'want params 15');
    const params: Record<string, Object> = {
      'probe': 195,
      'label': 'oscar'
    };
    const want: Want = {
      bundleName: BUNDLE_NAME,
      abilityName: ENTRY_ABILITY,
      parameters: params
    };
    const stored: Record<string, Object> = want.parameters as Record<string, Object>;
    expect(stored['probe'] as number).assertEqual(195);
    expect(stored['label'] as string).assertEqual('oscar');
    expect((stored['label'] as string).length).assertEqual(5);
    expect((stored['label'] as string).charAt(0)).assertEqual('o');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0054
   * @tc.name      testWantFacts0054
   * @tc.desc      Want parameters 16 round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testWantFacts0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testWantFacts0054', 'want params 16');
    const params: Record<string, Object> = {
      'probe': 208,
      'label': 'papa'
    };
    const want: Want = {
      bundleName: BUNDLE_NAME,
      abilityName: ENTRY_ABILITY,
      parameters: params
    };
    const stored: Record<string, Object> = want.parameters as Record<string, Object>;
    expect(stored['probe'] as number).assertEqual(208);
    expect(stored['label'] as string).assertEqual('papa');
    expect((stored['label'] as string).length).assertEqual(4);
    expect((stored['label'] as string).charAt(0)).assertEqual('p');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0055
   * @tc.name      testWantFacts0055
   * @tc.desc      Want skill 1 pairs entity.system.home with ohos.want.action.home
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testWantFacts0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testWantFacts0055', 'want skill 1');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      entities: ['entity.system.home', 'ohos.want.action.home'],
      action: 'ohos.want.action.home'
    };
    const wantEntities: string[] = want.entities as string[];
    expect(wantEntities.length).assertEqual(2);
    expect(wantEntities[0]).assertEqual('entity.system.home');
    expect(wantEntities[1]).assertEqual('ohos.want.action.home');
    expect(wantEntities.join('|')).assertEqual('entity.system.home|ohos.want.action.home');
    expect(want.action as string).assertEqual('ohos.want.action.home');
    expect((want.action as string).startsWith('ohos.want.action.')).assertTrue();
    expect((wantEntities[0] as string).startsWith('entity.system.')).assertTrue();
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0056
   * @tc.name      testWantFacts0056
   * @tc.desc      Want skill 2 pairs entity.system.home with ohos.want.action.viewData
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testWantFacts0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testWantFacts0056', 'want skill 2');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      entities: ['entity.system.home', 'ohos.want.action.viewData'],
      action: 'ohos.want.action.viewData'
    };
    const wantEntities: string[] = want.entities as string[];
    expect(wantEntities.length).assertEqual(2);
    expect(wantEntities[0]).assertEqual('entity.system.home');
    expect(wantEntities[1]).assertEqual('ohos.want.action.viewData');
    expect(wantEntities.join('|')).assertEqual('entity.system.home|ohos.want.action.viewData');
    expect(want.action as string).assertEqual('ohos.want.action.viewData');
    expect((want.action as string).startsWith('ohos.want.action.')).assertTrue();
    expect((wantEntities[0] as string).startsWith('entity.system.')).assertTrue();
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0057
   * @tc.name      testWantFacts0057
   * @tc.desc      Want skill 3 pairs entity.system.home with ohos.want.action.sendData
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testWantFacts0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testWantFacts0057', 'want skill 3');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      entities: ['entity.system.home', 'ohos.want.action.sendData'],
      action: 'ohos.want.action.sendData'
    };
    const wantEntities: string[] = want.entities as string[];
    expect(wantEntities.length).assertEqual(2);
    expect(wantEntities[0]).assertEqual('entity.system.home');
    expect(wantEntities[1]).assertEqual('ohos.want.action.sendData');
    expect(wantEntities.join('|')).assertEqual('entity.system.home|ohos.want.action.sendData');
    expect(want.action as string).assertEqual('ohos.want.action.sendData');
    expect((want.action as string).startsWith('ohos.want.action.')).assertTrue();
    expect((wantEntities[0] as string).startsWith('entity.system.')).assertTrue();
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0058
   * @tc.name      testWantFacts0058
   * @tc.desc      Want skill 4 pairs entity.system.home with ohos.want.action.openDocument
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testWantFacts0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testWantFacts0058', 'want skill 4');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      entities: ['entity.system.home', 'ohos.want.action.openDocument'],
      action: 'ohos.want.action.openDocument'
    };
    const wantEntities: string[] = want.entities as string[];
    expect(wantEntities.length).assertEqual(2);
    expect(wantEntities[0]).assertEqual('entity.system.home');
    expect(wantEntities[1]).assertEqual('ohos.want.action.openDocument');
    expect(wantEntities.join('|')).assertEqual('entity.system.home|ohos.want.action.openDocument');
    expect(want.action as string).assertEqual('ohos.want.action.openDocument');
    expect((want.action as string).startsWith('ohos.want.action.')).assertTrue();
    expect((wantEntities[0] as string).startsWith('entity.system.')).assertTrue();
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0059
   * @tc.name      testWantFacts0059
   * @tc.desc      Want skill 5 pairs entity.system.browsable with ohos.want.action.home
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testWantFacts0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testWantFacts0059', 'want skill 5');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      entities: ['entity.system.browsable', 'ohos.want.action.home'],
      action: 'ohos.want.action.home'
    };
    const wantEntities: string[] = want.entities as string[];
    expect(wantEntities.length).assertEqual(2);
    expect(wantEntities[0]).assertEqual('entity.system.browsable');
    expect(wantEntities[1]).assertEqual('ohos.want.action.home');
    expect(wantEntities.join('|')).assertEqual('entity.system.browsable|ohos.want.action.home');
    expect(want.action as string).assertEqual('ohos.want.action.home');
    expect((want.action as string).startsWith('ohos.want.action.')).assertTrue();
    expect((wantEntities[0] as string).startsWith('entity.system.')).assertTrue();
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0060
   * @tc.name      testWantFacts0060
   * @tc.desc      Want skill 6 pairs entity.system.browsable with ohos.want.action.viewData
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testWantFacts0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testWantFacts0060', 'want skill 6');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      entities: ['entity.system.browsable', 'ohos.want.action.viewData'],
      action: 'ohos.want.action.viewData'
    };
    const wantEntities: string[] = want.entities as string[];
    expect(wantEntities.length).assertEqual(2);
    expect(wantEntities[0]).assertEqual('entity.system.browsable');
    expect(wantEntities[1]).assertEqual('ohos.want.action.viewData');
    expect(wantEntities.join('|')).assertEqual('entity.system.browsable|ohos.want.action.viewData');
    expect(want.action as string).assertEqual('ohos.want.action.viewData');
    expect((want.action as string).startsWith('ohos.want.action.')).assertTrue();
    expect((wantEntities[0] as string).startsWith('entity.system.')).assertTrue();
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0061
   * @tc.name      testWantFacts0061
   * @tc.desc      Want skill 7 pairs entity.system.browsable with ohos.want.action.sendData
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testWantFacts0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testWantFacts0061', 'want skill 7');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      entities: ['entity.system.browsable', 'ohos.want.action.sendData'],
      action: 'ohos.want.action.sendData'
    };
    const wantEntities: string[] = want.entities as string[];
    expect(wantEntities.length).assertEqual(2);
    expect(wantEntities[0]).assertEqual('entity.system.browsable');
    expect(wantEntities[1]).assertEqual('ohos.want.action.sendData');
    expect(wantEntities.join('|')).assertEqual('entity.system.browsable|ohos.want.action.sendData');
    expect(want.action as string).assertEqual('ohos.want.action.sendData');
    expect((want.action as string).startsWith('ohos.want.action.')).assertTrue();
    expect((wantEntities[0] as string).startsWith('entity.system.')).assertTrue();
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0062
   * @tc.name      testWantFacts0062
   * @tc.desc      Want skill 8 pairs entity.system.browsable with ohos.want.action.openDocument
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testWantFacts0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testWantFacts0062', 'want skill 8');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      entities: ['entity.system.browsable', 'ohos.want.action.openDocument'],
      action: 'ohos.want.action.openDocument'
    };
    const wantEntities: string[] = want.entities as string[];
    expect(wantEntities.length).assertEqual(2);
    expect(wantEntities[0]).assertEqual('entity.system.browsable');
    expect(wantEntities[1]).assertEqual('ohos.want.action.openDocument');
    expect(wantEntities.join('|')).assertEqual('entity.system.browsable|ohos.want.action.openDocument');
    expect(want.action as string).assertEqual('ohos.want.action.openDocument');
    expect((want.action as string).startsWith('ohos.want.action.')).assertTrue();
    expect((wantEntities[0] as string).startsWith('entity.system.')).assertTrue();
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0063
   * @tc.name      testWantFacts0063
   * @tc.desc      Want skill 9 pairs entity.system.default with ohos.want.action.home
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testWantFacts0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testWantFacts0063', 'want skill 9');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      entities: ['entity.system.default', 'ohos.want.action.home'],
      action: 'ohos.want.action.home'
    };
    const wantEntities: string[] = want.entities as string[];
    expect(wantEntities.length).assertEqual(2);
    expect(wantEntities[0]).assertEqual('entity.system.default');
    expect(wantEntities[1]).assertEqual('ohos.want.action.home');
    expect(wantEntities.join('|')).assertEqual('entity.system.default|ohos.want.action.home');
    expect(want.action as string).assertEqual('ohos.want.action.home');
    expect((want.action as string).startsWith('ohos.want.action.')).assertTrue();
    expect((wantEntities[0] as string).startsWith('entity.system.')).assertTrue();
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0064
   * @tc.name      testWantFacts0064
   * @tc.desc      Want skill 10 pairs entity.system.default with ohos.want.action.viewData
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testWantFacts0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testWantFacts0064', 'want skill 10');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      entities: ['entity.system.default', 'ohos.want.action.viewData'],
      action: 'ohos.want.action.viewData'
    };
    const wantEntities: string[] = want.entities as string[];
    expect(wantEntities.length).assertEqual(2);
    expect(wantEntities[0]).assertEqual('entity.system.default');
    expect(wantEntities[1]).assertEqual('ohos.want.action.viewData');
    expect(wantEntities.join('|')).assertEqual('entity.system.default|ohos.want.action.viewData');
    expect(want.action as string).assertEqual('ohos.want.action.viewData');
    expect((want.action as string).startsWith('ohos.want.action.')).assertTrue();
    expect((wantEntities[0] as string).startsWith('entity.system.')).assertTrue();
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0065
   * @tc.name      testWantFacts0065
   * @tc.desc      Want skill 11 pairs entity.system.default with ohos.want.action.sendData
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testWantFacts0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testWantFacts0065', 'want skill 11');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      entities: ['entity.system.default', 'ohos.want.action.sendData'],
      action: 'ohos.want.action.sendData'
    };
    const wantEntities: string[] = want.entities as string[];
    expect(wantEntities.length).assertEqual(2);
    expect(wantEntities[0]).assertEqual('entity.system.default');
    expect(wantEntities[1]).assertEqual('ohos.want.action.sendData');
    expect(wantEntities.join('|')).assertEqual('entity.system.default|ohos.want.action.sendData');
    expect(want.action as string).assertEqual('ohos.want.action.sendData');
    expect((want.action as string).startsWith('ohos.want.action.')).assertTrue();
    expect((wantEntities[0] as string).startsWith('entity.system.')).assertTrue();
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0066
   * @tc.name      testWantFacts0066
   * @tc.desc      Want skill 12 pairs entity.system.default with ohos.want.action.openDocument
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testWantFacts0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testWantFacts0066', 'want skill 12');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      entities: ['entity.system.default', 'ohos.want.action.openDocument'],
      action: 'ohos.want.action.openDocument'
    };
    const wantEntities: string[] = want.entities as string[];
    expect(wantEntities.length).assertEqual(2);
    expect(wantEntities[0]).assertEqual('entity.system.default');
    expect(wantEntities[1]).assertEqual('ohos.want.action.openDocument');
    expect(wantEntities.join('|')).assertEqual('entity.system.default|ohos.want.action.openDocument');
    expect(want.action as string).assertEqual('ohos.want.action.openDocument');
    expect((want.action as string).startsWith('ohos.want.action.')).assertTrue();
    expect((wantEntities[0] as string).startsWith('entity.system.')).assertTrue();
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0067
   * @tc.name      testWantFacts0067
   * @tc.desc      Want skill 13 pairs entity.system.voip with ohos.want.action.home
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testWantFacts0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testWantFacts0067', 'want skill 13');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      entities: ['entity.system.voip', 'ohos.want.action.home'],
      action: 'ohos.want.action.home'
    };
    const wantEntities: string[] = want.entities as string[];
    expect(wantEntities.length).assertEqual(2);
    expect(wantEntities[0]).assertEqual('entity.system.voip');
    expect(wantEntities[1]).assertEqual('ohos.want.action.home');
    expect(wantEntities.join('|')).assertEqual('entity.system.voip|ohos.want.action.home');
    expect(want.action as string).assertEqual('ohos.want.action.home');
    expect((want.action as string).startsWith('ohos.want.action.')).assertTrue();
    expect((wantEntities[0] as string).startsWith('entity.system.')).assertTrue();
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0068
   * @tc.name      testWantFacts0068
   * @tc.desc      Want skill 14 pairs entity.system.voip with ohos.want.action.viewData
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testWantFacts0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testWantFacts0068', 'want skill 14');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      entities: ['entity.system.voip', 'ohos.want.action.viewData'],
      action: 'ohos.want.action.viewData'
    };
    const wantEntities: string[] = want.entities as string[];
    expect(wantEntities.length).assertEqual(2);
    expect(wantEntities[0]).assertEqual('entity.system.voip');
    expect(wantEntities[1]).assertEqual('ohos.want.action.viewData');
    expect(wantEntities.join('|')).assertEqual('entity.system.voip|ohos.want.action.viewData');
    expect(want.action as string).assertEqual('ohos.want.action.viewData');
    expect((want.action as string).startsWith('ohos.want.action.')).assertTrue();
    expect((wantEntities[0] as string).startsWith('entity.system.')).assertTrue();
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0069
   * @tc.name      testWantFacts0069
   * @tc.desc      Want skill 15 pairs entity.system.voip with ohos.want.action.sendData
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testWantFacts0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testWantFacts0069', 'want skill 15');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      entities: ['entity.system.voip', 'ohos.want.action.sendData'],
      action: 'ohos.want.action.sendData'
    };
    const wantEntities: string[] = want.entities as string[];
    expect(wantEntities.length).assertEqual(2);
    expect(wantEntities[0]).assertEqual('entity.system.voip');
    expect(wantEntities[1]).assertEqual('ohos.want.action.sendData');
    expect(wantEntities.join('|')).assertEqual('entity.system.voip|ohos.want.action.sendData');
    expect(want.action as string).assertEqual('ohos.want.action.sendData');
    expect((want.action as string).startsWith('ohos.want.action.')).assertTrue();
    expect((wantEntities[0] as string).startsWith('entity.system.')).assertTrue();
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0070
   * @tc.name      testWantFacts0070
   * @tc.desc      Want skill 16 pairs entity.system.voip with ohos.want.action.openDocument
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testWantFacts0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testWantFacts0070', 'want skill 16');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      entities: ['entity.system.voip', 'ohos.want.action.openDocument'],
      action: 'ohos.want.action.openDocument'
    };
    const wantEntities: string[] = want.entities as string[];
    expect(wantEntities.length).assertEqual(2);
    expect(wantEntities[0]).assertEqual('entity.system.voip');
    expect(wantEntities[1]).assertEqual('ohos.want.action.openDocument');
    expect(wantEntities.join('|')).assertEqual('entity.system.voip|ohos.want.action.openDocument');
    expect(want.action as string).assertEqual('ohos.want.action.openDocument');
    expect((want.action as string).startsWith('ohos.want.action.')).assertTrue();
    expect((wantEntities[0] as string).startsWith('entity.system.')).assertTrue();
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0071
   * @tc.name      testWantFacts0071
   * @tc.desc      Want skill 17 pairs entity.system.media with ohos.want.action.home
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testWantFacts0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testWantFacts0071', 'want skill 17');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      entities: ['entity.system.media', 'ohos.want.action.home'],
      action: 'ohos.want.action.home'
    };
    const wantEntities: string[] = want.entities as string[];
    expect(wantEntities.length).assertEqual(2);
    expect(wantEntities[0]).assertEqual('entity.system.media');
    expect(wantEntities[1]).assertEqual('ohos.want.action.home');
    expect(wantEntities.join('|')).assertEqual('entity.system.media|ohos.want.action.home');
    expect(want.action as string).assertEqual('ohos.want.action.home');
    expect((want.action as string).startsWith('ohos.want.action.')).assertTrue();
    expect((wantEntities[0] as string).startsWith('entity.system.')).assertTrue();
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0072
   * @tc.name      testWantFacts0072
   * @tc.desc      Want skill 18 pairs entity.system.media with ohos.want.action.viewData
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testWantFacts0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testWantFacts0072', 'want skill 18');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      entities: ['entity.system.media', 'ohos.want.action.viewData'],
      action: 'ohos.want.action.viewData'
    };
    const wantEntities: string[] = want.entities as string[];
    expect(wantEntities.length).assertEqual(2);
    expect(wantEntities[0]).assertEqual('entity.system.media');
    expect(wantEntities[1]).assertEqual('ohos.want.action.viewData');
    expect(wantEntities.join('|')).assertEqual('entity.system.media|ohos.want.action.viewData');
    expect(want.action as string).assertEqual('ohos.want.action.viewData');
    expect((want.action as string).startsWith('ohos.want.action.')).assertTrue();
    expect((wantEntities[0] as string).startsWith('entity.system.')).assertTrue();
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0073
   * @tc.name      testWantFacts0073
   * @tc.desc      Want skill 19 pairs entity.system.media with ohos.want.action.sendData
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testWantFacts0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testWantFacts0073', 'want skill 19');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      entities: ['entity.system.media', 'ohos.want.action.sendData'],
      action: 'ohos.want.action.sendData'
    };
    const wantEntities: string[] = want.entities as string[];
    expect(wantEntities.length).assertEqual(2);
    expect(wantEntities[0]).assertEqual('entity.system.media');
    expect(wantEntities[1]).assertEqual('ohos.want.action.sendData');
    expect(wantEntities.join('|')).assertEqual('entity.system.media|ohos.want.action.sendData');
    expect(want.action as string).assertEqual('ohos.want.action.sendData');
    expect((want.action as string).startsWith('ohos.want.action.')).assertTrue();
    expect((wantEntities[0] as string).startsWith('entity.system.')).assertTrue();
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0074
   * @tc.name      testWantFacts0074
   * @tc.desc      Want skill 20 pairs entity.system.media with ohos.want.action.openDocument
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testWantFacts0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testWantFacts0074', 'want skill 20');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      entities: ['entity.system.media', 'ohos.want.action.openDocument'],
      action: 'ohos.want.action.openDocument'
    };
    const wantEntities: string[] = want.entities as string[];
    expect(wantEntities.length).assertEqual(2);
    expect(wantEntities[0]).assertEqual('entity.system.media');
    expect(wantEntities[1]).assertEqual('ohos.want.action.openDocument');
    expect(wantEntities.join('|')).assertEqual('entity.system.media|ohos.want.action.openDocument');
    expect(want.action as string).assertEqual('ohos.want.action.openDocument');
    expect((want.action as string).startsWith('ohos.want.action.')).assertTrue();
    expect((wantEntities[0] as string).startsWith('entity.system.')).assertTrue();
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0075
   * @tc.name      testWantFacts0075
   * @tc.desc      Empty want 1 keeps only module only
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testWantFacts0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testWantFacts0075', 'want empty 1');
    const want: Want = {
      moduleName: 'library'
    };
    expect(want.moduleName as string).assertEqual('library');
    expect((want.moduleName as string).length).assertEqual(7);
    expect(want.bundleName === undefined).assertTrue();
    expect(want.abilityName === undefined).assertTrue();
    expect(want.parameters === undefined).assertTrue();
    expect(want.uri === undefined).assertTrue();
    expect(want.action === undefined).assertTrue();
    expect(want.entities === undefined).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0076
   * @tc.name      testWantFacts0076
   * @tc.desc      Empty want 2 keeps only ability only
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testWantFacts0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testWantFacts0076', 'want empty 2');
    const want: Want = {
      abilityName: BACKUP_ABILITY
    };
    expect(want.abilityName as string).assertEqual(BACKUP_ABILITY);
    expect((want.abilityName as string).endsWith('Ability')).assertTrue();
    expect(want.bundleName === undefined).assertTrue();
    expect(want.moduleName === undefined).assertTrue();
    expect(want.parameters === undefined).assertTrue();
    expect(want.uri === undefined).assertTrue();
    expect(want.action === undefined).assertTrue();
    expect(want.entities === undefined).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0077
   * @tc.name      testWantFacts0077
   * @tc.desc      Empty want 3 keeps only bundle only
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testWantFacts0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testWantFacts0077', 'want empty 3');
    const want: Want = {
      bundleName: BUNDLE_NAME
    };
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
    expect((want.bundleName as string).split('.').length).assertEqual(4);
    expect(want.moduleName === undefined).assertTrue();
    expect(want.abilityName === undefined).assertTrue();
    expect(want.parameters === undefined).assertTrue();
    expect(want.uri === undefined).assertTrue();
    expect(want.action === undefined).assertTrue();
    expect(want.entities === undefined).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0078
   * @tc.name      testWantFacts0078
   * @tc.desc      Empty want 4 keeps only uri only
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testWantFacts0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testWantFacts0078', 'want empty 4');
    const want: Want = {
      uri: 'https://probe.example.org/empty/1'
    };
    expect((want.uri as string).startsWith('https://')).assertTrue();
    expect((want.uri as string).endsWith('/1')).assertTrue();
    expect(want.bundleName === undefined).assertTrue();
    expect(want.moduleName === undefined).assertTrue();
    expect(want.abilityName === undefined).assertTrue();
    expect(want.parameters === undefined).assertTrue();
    expect(want.action === undefined).assertTrue();
    expect(want.entities === undefined).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0079
   * @tc.name      testWantFacts0079
   * @tc.desc      Empty want 5 keeps only action only
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testWantFacts0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testWantFacts0079', 'want empty 5');
    const want: Want = {
      action: 'ohos.want.action.viewData'
    };
    expect(want.action as string).assertEqual('ohos.want.action.viewData');
    expect((want.action as string).includes('viewData')).assertTrue();
    expect(want.bundleName === undefined).assertTrue();
    expect(want.moduleName === undefined).assertTrue();
    expect(want.abilityName === undefined).assertTrue();
    expect(want.parameters === undefined).assertTrue();
    expect(want.uri === undefined).assertTrue();
    expect(want.entities === undefined).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_WANT_0080
   * @tc.name      testWantFacts0080
   * @tc.desc      Empty want 6 keeps only entities only
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testWantFacts0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testWantFacts0080', 'want empty 6');
    const want: Want = {
      entities: ['entity.system.default']
    };
    expect((want.entities as string[]).length).assertEqual(1);
    expect((want.entities as string[])[0]).assertEqual('entity.system.default');
    expect(want.bundleName === undefined).assertTrue();
    expect(want.moduleName === undefined).assertTrue();
    expect(want.abilityName === undefined).assertTrue();
    expect(want.parameters === undefined).assertTrue();
    expect(want.uri === undefined).assertTrue();
    expect(want.action === undefined).assertTrue();
  });
  });
}
