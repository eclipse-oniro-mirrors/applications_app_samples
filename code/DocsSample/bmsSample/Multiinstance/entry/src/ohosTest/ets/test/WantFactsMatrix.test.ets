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
