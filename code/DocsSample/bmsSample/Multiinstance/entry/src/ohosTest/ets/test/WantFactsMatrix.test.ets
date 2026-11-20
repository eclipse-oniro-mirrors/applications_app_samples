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
   * @tc.number    SUB_BMS_MULTIINSTANCE_WANT_0001
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_WANT_0002
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_WANT_0003
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_WANT_0004
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_WANT_0005
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_WANT_0006
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_WANT_0007
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_WANT_0008
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_WANT_0009
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_WANT_0010
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_WANT_0011
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_WANT_0012
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_WANT_0013
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_WANT_0014
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_WANT_0015
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_WANT_0016
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_WANT_0017
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_WANT_0018
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_WANT_0019
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_WANT_0020
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_WANT_0021
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_WANT_0022
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_WANT_0023
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_WANT_0024
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_WANT_0025
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_WANT_0026
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_WANT_0027
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_WANT_0028
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_WANT_0029
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_WANT_0030
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_WANT_0031
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_WANT_0032
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_WANT_0033
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_WANT_0034
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
  });
}
