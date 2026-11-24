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
import { BUNDLE_NAME, ENTRY_MODULE, ENTRY_ABILITY } from './shared/AppProbe';
import { logCase } from './shared/TestLog';

import { paceTurn } from './shared/TestPace';

export default function wantFactsMatrixTest() {
  describe('wantFactsMatrixTest', () => {
  beforeEach(async () => {
    await paceTurn();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0001
   * @tc.name      testWantFacts0001
   * @tc.desc      Want builder pass 1 keeps identity
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
    expect(want.moduleName as string).assertEqual(ENTRY_MODULE);
    expect(want.abilityName as string).assertEqual(ENTRY_ABILITY);
    expect((want.bundleName as string).split('.').length).assertEqual(4);
    expect((want.abilityName as string).endsWith('Ability')).assertTrue();
    expect((want.abilityName as string).length).assertEqual(18);
    expect((want.bundleName as string).startsWith('ohos')).assertTrue();
    expect((want.moduleName as string).length).assertEqual(11);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0002
   * @tc.name      testWantFacts0002
   * @tc.desc      Want builder pass 2 keeps identity
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
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
    expect(want.moduleName as string).assertEqual(ENTRY_MODULE);
    expect(want.abilityName as string).assertEqual(ENTRY_ABILITY);
    expect((want.bundleName as string).split('.').length).assertEqual(4);
    expect((want.abilityName as string).endsWith('Ability')).assertTrue();
    expect((want.abilityName as string).length).assertEqual(18);
    expect((want.bundleName as string).startsWith('ohos')).assertTrue();
    expect((want.moduleName as string).length).assertEqual(11);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0003
   * @tc.name      testWantFacts0003
   * @tc.desc      Want builder pass 3 keeps identity
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
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
    expect(want.moduleName as string).assertEqual(ENTRY_MODULE);
    expect(want.abilityName as string).assertEqual(ENTRY_ABILITY);
    expect((want.bundleName as string).split('.').length).assertEqual(4);
    expect((want.abilityName as string).endsWith('Ability')).assertTrue();
    expect((want.abilityName as string).length).assertEqual(18);
    expect((want.bundleName as string).startsWith('ohos')).assertTrue();
    expect((want.moduleName as string).length).assertEqual(11);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0004
   * @tc.name      testWantFacts0004
   * @tc.desc      Want builder pass 4 keeps identity
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
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
    expect(want.moduleName as string).assertEqual(ENTRY_MODULE);
    expect(want.abilityName as string).assertEqual(ENTRY_ABILITY);
    expect((want.bundleName as string).split('.').length).assertEqual(4);
    expect((want.abilityName as string).endsWith('Ability')).assertTrue();
    expect((want.abilityName as string).length).assertEqual(18);
    expect((want.bundleName as string).startsWith('ohos')).assertTrue();
    expect((want.moduleName as string).length).assertEqual(11);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0005
   * @tc.name      testWantFacts0005
   * @tc.desc      Want builder pass 5 keeps identity
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
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
    expect(want.moduleName as string).assertEqual(ENTRY_MODULE);
    expect(want.abilityName as string).assertEqual(ENTRY_ABILITY);
    expect((want.bundleName as string).split('.').length).assertEqual(4);
    expect((want.abilityName as string).endsWith('Ability')).assertTrue();
    expect((want.abilityName as string).length).assertEqual(18);
    expect((want.bundleName as string).startsWith('ohos')).assertTrue();
    expect((want.moduleName as string).length).assertEqual(11);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0006
   * @tc.name      testWantFacts0006
   * @tc.desc      Want builder pass 6 keeps identity
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
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
    expect(want.moduleName as string).assertEqual(ENTRY_MODULE);
    expect(want.abilityName as string).assertEqual(ENTRY_ABILITY);
    expect((want.bundleName as string).split('.').length).assertEqual(4);
    expect((want.abilityName as string).endsWith('Ability')).assertTrue();
    expect((want.abilityName as string).length).assertEqual(18);
    expect((want.bundleName as string).startsWith('ohos')).assertTrue();
    expect((want.moduleName as string).length).assertEqual(11);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0007
   * @tc.name      testWantFacts0007
   * @tc.desc      Want builder pass 7 keeps identity
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
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
    expect(want.moduleName as string).assertEqual(ENTRY_MODULE);
    expect(want.abilityName as string).assertEqual(ENTRY_ABILITY);
    expect((want.bundleName as string).split('.').length).assertEqual(4);
    expect((want.abilityName as string).endsWith('Ability')).assertTrue();
    expect((want.abilityName as string).length).assertEqual(18);
    expect((want.bundleName as string).startsWith('ohos')).assertTrue();
    expect((want.moduleName as string).length).assertEqual(11);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0008
   * @tc.name      testWantFacts0008
   * @tc.desc      Want builder pass 8 keeps identity
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
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
    expect(want.moduleName as string).assertEqual(ENTRY_MODULE);
    expect(want.abilityName as string).assertEqual(ENTRY_ABILITY);
    expect((want.bundleName as string).split('.').length).assertEqual(4);
    expect((want.abilityName as string).endsWith('Ability')).assertTrue();
    expect((want.abilityName as string).length).assertEqual(18);
    expect((want.bundleName as string).startsWith('ohos')).assertTrue();
    expect((want.moduleName as string).length).assertEqual(11);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0009
   * @tc.name      testWantFacts0009
   * @tc.desc      Want builder pass 9 keeps identity
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testWantFacts0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testWantFacts0009', 'want builder 9');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      moduleName: ENTRY_MODULE,
      abilityName: ENTRY_ABILITY
    };
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
    expect(want.moduleName as string).assertEqual(ENTRY_MODULE);
    expect(want.abilityName as string).assertEqual(ENTRY_ABILITY);
    expect((want.bundleName as string).split('.').length).assertEqual(4);
    expect((want.abilityName as string).endsWith('Ability')).assertTrue();
    expect((want.abilityName as string).length).assertEqual(18);
    expect((want.bundleName as string).startsWith('ohos')).assertTrue();
    expect((want.moduleName as string).length).assertEqual(11);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0010
   * @tc.name      testWantFacts0010
   * @tc.desc      Want builder pass 10 keeps identity
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testWantFacts0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testWantFacts0010', 'want builder 10');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      moduleName: ENTRY_MODULE,
      abilityName: ENTRY_ABILITY
    };
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
    expect(want.moduleName as string).assertEqual(ENTRY_MODULE);
    expect(want.abilityName as string).assertEqual(ENTRY_ABILITY);
    expect((want.bundleName as string).split('.').length).assertEqual(4);
    expect((want.abilityName as string).endsWith('Ability')).assertTrue();
    expect((want.abilityName as string).length).assertEqual(18);
    expect((want.bundleName as string).startsWith('ohos')).assertTrue();
    expect((want.moduleName as string).length).assertEqual(11);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0011
   * @tc.name      testWantFacts0011
   * @tc.desc      Want builder pass 11 keeps identity
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testWantFacts0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testWantFacts0011', 'want builder 11');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      moduleName: ENTRY_MODULE,
      abilityName: ENTRY_ABILITY
    };
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
    expect(want.moduleName as string).assertEqual(ENTRY_MODULE);
    expect(want.abilityName as string).assertEqual(ENTRY_ABILITY);
    expect((want.bundleName as string).split('.').length).assertEqual(4);
    expect((want.abilityName as string).endsWith('Ability')).assertTrue();
    expect((want.abilityName as string).length).assertEqual(18);
    expect((want.bundleName as string).startsWith('ohos')).assertTrue();
    expect((want.moduleName as string).length).assertEqual(11);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0012
   * @tc.name      testWantFacts0012
   * @tc.desc      Want builder pass 12 keeps identity
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testWantFacts0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testWantFacts0012', 'want builder 12');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      moduleName: ENTRY_MODULE,
      abilityName: ENTRY_ABILITY
    };
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
    expect(want.moduleName as string).assertEqual(ENTRY_MODULE);
    expect(want.abilityName as string).assertEqual(ENTRY_ABILITY);
    expect((want.bundleName as string).split('.').length).assertEqual(4);
    expect((want.abilityName as string).endsWith('Ability')).assertTrue();
    expect((want.abilityName as string).length).assertEqual(18);
    expect((want.bundleName as string).startsWith('ohos')).assertTrue();
    expect((want.moduleName as string).length).assertEqual(11);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0013
   * @tc.name      testWantFacts0013
   * @tc.desc      Want builder pass 13 keeps identity
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testWantFacts0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testWantFacts0013', 'want builder 13');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      moduleName: ENTRY_MODULE,
      abilityName: ENTRY_ABILITY
    };
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
    expect(want.moduleName as string).assertEqual(ENTRY_MODULE);
    expect(want.abilityName as string).assertEqual(ENTRY_ABILITY);
    expect((want.bundleName as string).split('.').length).assertEqual(4);
    expect((want.abilityName as string).endsWith('Ability')).assertTrue();
    expect((want.abilityName as string).length).assertEqual(18);
    expect((want.bundleName as string).startsWith('ohos')).assertTrue();
    expect((want.moduleName as string).length).assertEqual(11);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0014
   * @tc.name      testWantFacts0014
   * @tc.desc      Want builder pass 14 keeps identity
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testWantFacts0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testWantFacts0014', 'want builder 14');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      moduleName: ENTRY_MODULE,
      abilityName: ENTRY_ABILITY
    };
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
    expect(want.moduleName as string).assertEqual(ENTRY_MODULE);
    expect(want.abilityName as string).assertEqual(ENTRY_ABILITY);
    expect((want.bundleName as string).split('.').length).assertEqual(4);
    expect((want.abilityName as string).endsWith('Ability')).assertTrue();
    expect((want.abilityName as string).length).assertEqual(18);
    expect((want.bundleName as string).startsWith('ohos')).assertTrue();
    expect((want.moduleName as string).length).assertEqual(11);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0015
   * @tc.name      testWantFacts0015
   * @tc.desc      Want builder pass 15 keeps identity
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testWantFacts0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testWantFacts0015', 'want builder 15');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      moduleName: ENTRY_MODULE,
      abilityName: ENTRY_ABILITY
    };
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
    expect(want.moduleName as string).assertEqual(ENTRY_MODULE);
    expect(want.abilityName as string).assertEqual(ENTRY_ABILITY);
    expect((want.bundleName as string).split('.').length).assertEqual(4);
    expect((want.abilityName as string).endsWith('Ability')).assertTrue();
    expect((want.abilityName as string).length).assertEqual(18);
    expect((want.bundleName as string).startsWith('ohos')).assertTrue();
    expect((want.moduleName as string).length).assertEqual(11);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0016
   * @tc.name      testWantFacts0016
   * @tc.desc      Want builder pass 16 keeps identity
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testWantFacts0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testWantFacts0016', 'want builder 16');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      moduleName: ENTRY_MODULE,
      abilityName: ENTRY_ABILITY
    };
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
    expect(want.moduleName as string).assertEqual(ENTRY_MODULE);
    expect(want.abilityName as string).assertEqual(ENTRY_ABILITY);
    expect((want.bundleName as string).split('.').length).assertEqual(4);
    expect((want.abilityName as string).endsWith('Ability')).assertTrue();
    expect((want.abilityName as string).length).assertEqual(18);
    expect((want.bundleName as string).startsWith('ohos')).assertTrue();
    expect((want.moduleName as string).length).assertEqual(11);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0017
   * @tc.name      testWantFacts0017
   * @tc.desc      Want builder pass 17 keeps identity
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testWantFacts0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testWantFacts0017', 'want builder 17');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      moduleName: ENTRY_MODULE,
      abilityName: ENTRY_ABILITY
    };
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
    expect(want.moduleName as string).assertEqual(ENTRY_MODULE);
    expect(want.abilityName as string).assertEqual(ENTRY_ABILITY);
    expect((want.bundleName as string).split('.').length).assertEqual(4);
    expect((want.abilityName as string).endsWith('Ability')).assertTrue();
    expect((want.abilityName as string).length).assertEqual(18);
    expect((want.bundleName as string).startsWith('ohos')).assertTrue();
    expect((want.moduleName as string).length).assertEqual(11);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0018
   * @tc.name      testWantFacts0018
   * @tc.desc      Want builder pass 18 keeps identity
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testWantFacts0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testWantFacts0018', 'want builder 18');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      moduleName: ENTRY_MODULE,
      abilityName: ENTRY_ABILITY
    };
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
    expect(want.moduleName as string).assertEqual(ENTRY_MODULE);
    expect(want.abilityName as string).assertEqual(ENTRY_ABILITY);
    expect((want.bundleName as string).split('.').length).assertEqual(4);
    expect((want.abilityName as string).endsWith('Ability')).assertTrue();
    expect((want.abilityName as string).length).assertEqual(18);
    expect((want.bundleName as string).startsWith('ohos')).assertTrue();
    expect((want.moduleName as string).length).assertEqual(11);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0019
   * @tc.name      testWantFacts0019
   * @tc.desc      Want builder pass 19 keeps identity
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testWantFacts0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testWantFacts0019', 'want builder 19');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      moduleName: ENTRY_MODULE,
      abilityName: ENTRY_ABILITY
    };
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
    expect(want.moduleName as string).assertEqual(ENTRY_MODULE);
    expect(want.abilityName as string).assertEqual(ENTRY_ABILITY);
    expect((want.bundleName as string).split('.').length).assertEqual(4);
    expect((want.abilityName as string).endsWith('Ability')).assertTrue();
    expect((want.abilityName as string).length).assertEqual(18);
    expect((want.bundleName as string).startsWith('ohos')).assertTrue();
    expect((want.moduleName as string).length).assertEqual(11);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0020
   * @tc.name      testWantFacts0020
   * @tc.desc      Want builder pass 20 keeps identity
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testWantFacts0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testWantFacts0020', 'want builder 20');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      moduleName: ENTRY_MODULE,
      abilityName: ENTRY_ABILITY
    };
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
    expect(want.moduleName as string).assertEqual(ENTRY_MODULE);
    expect(want.abilityName as string).assertEqual(ENTRY_ABILITY);
    expect((want.bundleName as string).split('.').length).assertEqual(4);
    expect((want.abilityName as string).endsWith('Ability')).assertTrue();
    expect((want.abilityName as string).length).assertEqual(18);
    expect((want.bundleName as string).startsWith('ohos')).assertTrue();
    expect((want.moduleName as string).length).assertEqual(11);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0021
   * @tc.name      testWantFacts0021
   * @tc.desc      Want builder pass 21 keeps identity
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testWantFacts0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testWantFacts0021', 'want builder 21');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      moduleName: ENTRY_MODULE,
      abilityName: ENTRY_ABILITY
    };
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
    expect(want.moduleName as string).assertEqual(ENTRY_MODULE);
    expect(want.abilityName as string).assertEqual(ENTRY_ABILITY);
    expect((want.bundleName as string).split('.').length).assertEqual(4);
    expect((want.abilityName as string).endsWith('Ability')).assertTrue();
    expect((want.abilityName as string).length).assertEqual(18);
    expect((want.bundleName as string).startsWith('ohos')).assertTrue();
    expect((want.moduleName as string).length).assertEqual(11);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0022
   * @tc.name      testWantFacts0022
   * @tc.desc      Want builder pass 22 keeps identity
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testWantFacts0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testWantFacts0022', 'want builder 22');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      moduleName: ENTRY_MODULE,
      abilityName: ENTRY_ABILITY
    };
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
    expect(want.moduleName as string).assertEqual(ENTRY_MODULE);
    expect(want.abilityName as string).assertEqual(ENTRY_ABILITY);
    expect((want.bundleName as string).split('.').length).assertEqual(4);
    expect((want.abilityName as string).endsWith('Ability')).assertTrue();
    expect((want.abilityName as string).length).assertEqual(18);
    expect((want.bundleName as string).startsWith('ohos')).assertTrue();
    expect((want.moduleName as string).length).assertEqual(11);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0023
   * @tc.name      testWantFacts0023
   * @tc.desc      Want builder pass 23 keeps identity
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testWantFacts0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testWantFacts0023', 'want builder 23');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      moduleName: ENTRY_MODULE,
      abilityName: ENTRY_ABILITY
    };
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
    expect(want.moduleName as string).assertEqual(ENTRY_MODULE);
    expect(want.abilityName as string).assertEqual(ENTRY_ABILITY);
    expect((want.bundleName as string).split('.').length).assertEqual(4);
    expect((want.abilityName as string).endsWith('Ability')).assertTrue();
    expect((want.abilityName as string).length).assertEqual(18);
    expect((want.bundleName as string).startsWith('ohos')).assertTrue();
    expect((want.moduleName as string).length).assertEqual(11);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0024
   * @tc.name      testWantFacts0024
   * @tc.desc      Want builder pass 24 keeps identity
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testWantFacts0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testWantFacts0024', 'want builder 24');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      moduleName: ENTRY_MODULE,
      abilityName: ENTRY_ABILITY
    };
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
    expect(want.moduleName as string).assertEqual(ENTRY_MODULE);
    expect(want.abilityName as string).assertEqual(ENTRY_ABILITY);
    expect((want.bundleName as string).split('.').length).assertEqual(4);
    expect((want.abilityName as string).endsWith('Ability')).assertTrue();
    expect((want.abilityName as string).length).assertEqual(18);
    expect((want.bundleName as string).startsWith('ohos')).assertTrue();
    expect((want.moduleName as string).length).assertEqual(11);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0025
   * @tc.name      testWantFacts0025
   * @tc.desc      Want builder pass 25 keeps identity
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testWantFacts0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testWantFacts0025', 'want builder 25');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      moduleName: ENTRY_MODULE,
      abilityName: ENTRY_ABILITY
    };
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
    expect(want.moduleName as string).assertEqual(ENTRY_MODULE);
    expect(want.abilityName as string).assertEqual(ENTRY_ABILITY);
    expect((want.bundleName as string).split('.').length).assertEqual(4);
    expect((want.abilityName as string).endsWith('Ability')).assertTrue();
    expect((want.abilityName as string).length).assertEqual(18);
    expect((want.bundleName as string).startsWith('ohos')).assertTrue();
    expect((want.moduleName as string).length).assertEqual(11);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0026
   * @tc.name      testWantFacts0026
   * @tc.desc      Want builder pass 26 keeps identity
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testWantFacts0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testWantFacts0026', 'want builder 26');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      moduleName: ENTRY_MODULE,
      abilityName: ENTRY_ABILITY
    };
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
    expect(want.moduleName as string).assertEqual(ENTRY_MODULE);
    expect(want.abilityName as string).assertEqual(ENTRY_ABILITY);
    expect((want.bundleName as string).split('.').length).assertEqual(4);
    expect((want.abilityName as string).endsWith('Ability')).assertTrue();
    expect((want.abilityName as string).length).assertEqual(18);
    expect((want.bundleName as string).startsWith('ohos')).assertTrue();
    expect((want.moduleName as string).length).assertEqual(11);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0027
   * @tc.name      testWantFacts0027
   * @tc.desc      Want builder pass 27 keeps identity
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testWantFacts0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testWantFacts0027', 'want builder 27');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      moduleName: ENTRY_MODULE,
      abilityName: ENTRY_ABILITY
    };
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
    expect(want.moduleName as string).assertEqual(ENTRY_MODULE);
    expect(want.abilityName as string).assertEqual(ENTRY_ABILITY);
    expect((want.bundleName as string).split('.').length).assertEqual(4);
    expect((want.abilityName as string).endsWith('Ability')).assertTrue();
    expect((want.abilityName as string).length).assertEqual(18);
    expect((want.bundleName as string).startsWith('ohos')).assertTrue();
    expect((want.moduleName as string).length).assertEqual(11);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0028
   * @tc.name      testWantFacts0028
   * @tc.desc      Want builder pass 28 keeps identity
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testWantFacts0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testWantFacts0028', 'want builder 28');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      moduleName: ENTRY_MODULE,
      abilityName: ENTRY_ABILITY
    };
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
    expect(want.moduleName as string).assertEqual(ENTRY_MODULE);
    expect(want.abilityName as string).assertEqual(ENTRY_ABILITY);
    expect((want.bundleName as string).split('.').length).assertEqual(4);
    expect((want.abilityName as string).endsWith('Ability')).assertTrue();
    expect((want.abilityName as string).length).assertEqual(18);
    expect((want.bundleName as string).startsWith('ohos')).assertTrue();
    expect((want.moduleName as string).length).assertEqual(11);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0029
   * @tc.name      testWantFacts0029
   * @tc.desc      Want builder pass 29 keeps identity
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testWantFacts0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testWantFacts0029', 'want builder 29');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      moduleName: ENTRY_MODULE,
      abilityName: ENTRY_ABILITY
    };
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
    expect(want.moduleName as string).assertEqual(ENTRY_MODULE);
    expect(want.abilityName as string).assertEqual(ENTRY_ABILITY);
    expect((want.bundleName as string).split('.').length).assertEqual(4);
    expect((want.abilityName as string).endsWith('Ability')).assertTrue();
    expect((want.abilityName as string).length).assertEqual(18);
    expect((want.bundleName as string).startsWith('ohos')).assertTrue();
    expect((want.moduleName as string).length).assertEqual(11);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0030
   * @tc.name      testWantFacts0030
   * @tc.desc      Want builder pass 30 keeps identity
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testWantFacts0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testWantFacts0030', 'want builder 30');
    const want: Want = {
      bundleName: BUNDLE_NAME,
      moduleName: ENTRY_MODULE,
      abilityName: ENTRY_ABILITY
    };
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
    expect(want.moduleName as string).assertEqual(ENTRY_MODULE);
    expect(want.abilityName as string).assertEqual(ENTRY_ABILITY);
    expect((want.bundleName as string).split('.').length).assertEqual(4);
    expect((want.abilityName as string).endsWith('Ability')).assertTrue();
    expect((want.abilityName as string).length).assertEqual(18);
    expect((want.bundleName as string).startsWith('ohos')).assertTrue();
    expect((want.moduleName as string).length).assertEqual(11);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0031
   * @tc.name      testWantFacts0031
   * @tc.desc      Want parameters pass 1 round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testWantFacts0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testWantFacts0031', 'want params 1');
    const params: Record<string, Object> = {
      'probe': 11,
      'label': 'probe-1'
    };
    const want: Want = {
      bundleName: BUNDLE_NAME,
      abilityName: ENTRY_ABILITY,
      parameters: params
    };
    const stored: Record<string, Object> = want.parameters as Record<string, Object>;
    expect(stored['probe'] as number).assertEqual(11);
    expect(stored['label'] as string).assertEqual('probe-1');
    expect((stored['probe'] as number) / 1).assertEqual(11);
    expect((stored['label'] as string).length).assertEqual(7);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0032
   * @tc.name      testWantFacts0032
   * @tc.desc      Want parameters pass 2 round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testWantFacts0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testWantFacts0032', 'want params 2');
    const params: Record<string, Object> = {
      'probe': 22,
      'label': 'probe-2'
    };
    const want: Want = {
      bundleName: BUNDLE_NAME,
      abilityName: ENTRY_ABILITY,
      parameters: params
    };
    const stored: Record<string, Object> = want.parameters as Record<string, Object>;
    expect(stored['probe'] as number).assertEqual(22);
    expect(stored['label'] as string).assertEqual('probe-2');
    expect((stored['probe'] as number) / 2).assertEqual(11);
    expect((stored['label'] as string).length).assertEqual(7);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0033
   * @tc.name      testWantFacts0033
   * @tc.desc      Want parameters pass 3 round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testWantFacts0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testWantFacts0033', 'want params 3');
    const params: Record<string, Object> = {
      'probe': 33,
      'label': 'probe-3'
    };
    const want: Want = {
      bundleName: BUNDLE_NAME,
      abilityName: ENTRY_ABILITY,
      parameters: params
    };
    const stored: Record<string, Object> = want.parameters as Record<string, Object>;
    expect(stored['probe'] as number).assertEqual(33);
    expect(stored['label'] as string).assertEqual('probe-3');
    expect((stored['probe'] as number) / 3).assertEqual(11);
    expect((stored['label'] as string).length).assertEqual(7);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0034
   * @tc.name      testWantFacts0034
   * @tc.desc      Want parameters pass 4 round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testWantFacts0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testWantFacts0034', 'want params 4');
    const params: Record<string, Object> = {
      'probe': 44,
      'label': 'probe-4'
    };
    const want: Want = {
      bundleName: BUNDLE_NAME,
      abilityName: ENTRY_ABILITY,
      parameters: params
    };
    const stored: Record<string, Object> = want.parameters as Record<string, Object>;
    expect(stored['probe'] as number).assertEqual(44);
    expect(stored['label'] as string).assertEqual('probe-4');
    expect((stored['probe'] as number) / 4).assertEqual(11);
    expect((stored['label'] as string).length).assertEqual(7);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0035
   * @tc.name      testWantFacts0035
   * @tc.desc      Want parameters pass 5 round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testWantFacts0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testWantFacts0035', 'want params 5');
    const params: Record<string, Object> = {
      'probe': 55,
      'label': 'probe-5'
    };
    const want: Want = {
      bundleName: BUNDLE_NAME,
      abilityName: ENTRY_ABILITY,
      parameters: params
    };
    const stored: Record<string, Object> = want.parameters as Record<string, Object>;
    expect(stored['probe'] as number).assertEqual(55);
    expect(stored['label'] as string).assertEqual('probe-5');
    expect((stored['probe'] as number) / 5).assertEqual(11);
    expect((stored['label'] as string).length).assertEqual(7);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0036
   * @tc.name      testWantFacts0036
   * @tc.desc      Want parameters pass 6 round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testWantFacts0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testWantFacts0036', 'want params 6');
    const params: Record<string, Object> = {
      'probe': 66,
      'label': 'probe-6'
    };
    const want: Want = {
      bundleName: BUNDLE_NAME,
      abilityName: ENTRY_ABILITY,
      parameters: params
    };
    const stored: Record<string, Object> = want.parameters as Record<string, Object>;
    expect(stored['probe'] as number).assertEqual(66);
    expect(stored['label'] as string).assertEqual('probe-6');
    expect((stored['probe'] as number) / 6).assertEqual(11);
    expect((stored['label'] as string).length).assertEqual(7);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0037
   * @tc.name      testWantFacts0037
   * @tc.desc      Want parameters pass 7 round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testWantFacts0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testWantFacts0037', 'want params 7');
    const params: Record<string, Object> = {
      'probe': 77,
      'label': 'probe-7'
    };
    const want: Want = {
      bundleName: BUNDLE_NAME,
      abilityName: ENTRY_ABILITY,
      parameters: params
    };
    const stored: Record<string, Object> = want.parameters as Record<string, Object>;
    expect(stored['probe'] as number).assertEqual(77);
    expect(stored['label'] as string).assertEqual('probe-7');
    expect((stored['probe'] as number) / 7).assertEqual(11);
    expect((stored['label'] as string).length).assertEqual(7);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0038
   * @tc.name      testWantFacts0038
   * @tc.desc      Want parameters pass 8 round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testWantFacts0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testWantFacts0038', 'want params 8');
    const params: Record<string, Object> = {
      'probe': 88,
      'label': 'probe-8'
    };
    const want: Want = {
      bundleName: BUNDLE_NAME,
      abilityName: ENTRY_ABILITY,
      parameters: params
    };
    const stored: Record<string, Object> = want.parameters as Record<string, Object>;
    expect(stored['probe'] as number).assertEqual(88);
    expect(stored['label'] as string).assertEqual('probe-8');
    expect((stored['probe'] as number) / 8).assertEqual(11);
    expect((stored['label'] as string).length).assertEqual(7);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0039
   * @tc.name      testWantFacts0039
   * @tc.desc      Want parameters pass 9 round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testWantFacts0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testWantFacts0039', 'want params 9');
    const params: Record<string, Object> = {
      'probe': 99,
      'label': 'probe-9'
    };
    const want: Want = {
      bundleName: BUNDLE_NAME,
      abilityName: ENTRY_ABILITY,
      parameters: params
    };
    const stored: Record<string, Object> = want.parameters as Record<string, Object>;
    expect(stored['probe'] as number).assertEqual(99);
    expect(stored['label'] as string).assertEqual('probe-9');
    expect((stored['probe'] as number) / 9).assertEqual(11);
    expect((stored['label'] as string).length).assertEqual(7);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0040
   * @tc.name      testWantFacts0040
   * @tc.desc      Want parameters pass 10 round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testWantFacts0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testWantFacts0040', 'want params 10');
    const params: Record<string, Object> = {
      'probe': 110,
      'label': 'probe-10'
    };
    const want: Want = {
      bundleName: BUNDLE_NAME,
      abilityName: ENTRY_ABILITY,
      parameters: params
    };
    const stored: Record<string, Object> = want.parameters as Record<string, Object>;
    expect(stored['probe'] as number).assertEqual(110);
    expect(stored['label'] as string).assertEqual('probe-10');
    expect((stored['probe'] as number) / 10).assertEqual(11);
    expect((stored['label'] as string).length).assertEqual(8);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0041
   * @tc.name      testWantFacts0041
   * @tc.desc      Want parameters pass 11 round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testWantFacts0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testWantFacts0041', 'want params 11');
    const params: Record<string, Object> = {
      'probe': 121,
      'label': 'probe-11'
    };
    const want: Want = {
      bundleName: BUNDLE_NAME,
      abilityName: ENTRY_ABILITY,
      parameters: params
    };
    const stored: Record<string, Object> = want.parameters as Record<string, Object>;
    expect(stored['probe'] as number).assertEqual(121);
    expect(stored['label'] as string).assertEqual('probe-11');
    expect((stored['probe'] as number) / 11).assertEqual(11);
    expect((stored['label'] as string).length).assertEqual(8);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0042
   * @tc.name      testWantFacts0042
   * @tc.desc      Want parameters pass 12 round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testWantFacts0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testWantFacts0042', 'want params 12');
    const params: Record<string, Object> = {
      'probe': 132,
      'label': 'probe-12'
    };
    const want: Want = {
      bundleName: BUNDLE_NAME,
      abilityName: ENTRY_ABILITY,
      parameters: params
    };
    const stored: Record<string, Object> = want.parameters as Record<string, Object>;
    expect(stored['probe'] as number).assertEqual(132);
    expect(stored['label'] as string).assertEqual('probe-12');
    expect((stored['probe'] as number) / 12).assertEqual(11);
    expect((stored['label'] as string).length).assertEqual(8);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0043
   * @tc.name      testWantFacts0043
   * @tc.desc      Want parameters pass 13 round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testWantFacts0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testWantFacts0043', 'want params 13');
    const params: Record<string, Object> = {
      'probe': 143,
      'label': 'probe-13'
    };
    const want: Want = {
      bundleName: BUNDLE_NAME,
      abilityName: ENTRY_ABILITY,
      parameters: params
    };
    const stored: Record<string, Object> = want.parameters as Record<string, Object>;
    expect(stored['probe'] as number).assertEqual(143);
    expect(stored['label'] as string).assertEqual('probe-13');
    expect((stored['probe'] as number) / 13).assertEqual(11);
    expect((stored['label'] as string).length).assertEqual(8);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0044
   * @tc.name      testWantFacts0044
   * @tc.desc      Want parameters pass 14 round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testWantFacts0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testWantFacts0044', 'want params 14');
    const params: Record<string, Object> = {
      'probe': 154,
      'label': 'probe-14'
    };
    const want: Want = {
      bundleName: BUNDLE_NAME,
      abilityName: ENTRY_ABILITY,
      parameters: params
    };
    const stored: Record<string, Object> = want.parameters as Record<string, Object>;
    expect(stored['probe'] as number).assertEqual(154);
    expect(stored['label'] as string).assertEqual('probe-14');
    expect((stored['probe'] as number) / 14).assertEqual(11);
    expect((stored['label'] as string).length).assertEqual(8);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0045
   * @tc.name      testWantFacts0045
   * @tc.desc      Want parameters pass 15 round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testWantFacts0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testWantFacts0045', 'want params 15');
    const params: Record<string, Object> = {
      'probe': 165,
      'label': 'probe-15'
    };
    const want: Want = {
      bundleName: BUNDLE_NAME,
      abilityName: ENTRY_ABILITY,
      parameters: params
    };
    const stored: Record<string, Object> = want.parameters as Record<string, Object>;
    expect(stored['probe'] as number).assertEqual(165);
    expect(stored['label'] as string).assertEqual('probe-15');
    expect((stored['probe'] as number) / 15).assertEqual(11);
    expect((stored['label'] as string).length).assertEqual(8);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0046
   * @tc.name      testWantFacts0046
   * @tc.desc      Want parameters pass 16 round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testWantFacts0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testWantFacts0046', 'want params 16');
    const params: Record<string, Object> = {
      'probe': 176,
      'label': 'probe-16'
    };
    const want: Want = {
      bundleName: BUNDLE_NAME,
      abilityName: ENTRY_ABILITY,
      parameters: params
    };
    const stored: Record<string, Object> = want.parameters as Record<string, Object>;
    expect(stored['probe'] as number).assertEqual(176);
    expect(stored['label'] as string).assertEqual('probe-16');
    expect((stored['probe'] as number) / 16).assertEqual(11);
    expect((stored['label'] as string).length).assertEqual(8);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0047
   * @tc.name      testWantFacts0047
   * @tc.desc      Want parameters pass 17 round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testWantFacts0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testWantFacts0047', 'want params 17');
    const params: Record<string, Object> = {
      'probe': 187,
      'label': 'probe-17'
    };
    const want: Want = {
      bundleName: BUNDLE_NAME,
      abilityName: ENTRY_ABILITY,
      parameters: params
    };
    const stored: Record<string, Object> = want.parameters as Record<string, Object>;
    expect(stored['probe'] as number).assertEqual(187);
    expect(stored['label'] as string).assertEqual('probe-17');
    expect((stored['probe'] as number) / 17).assertEqual(11);
    expect((stored['label'] as string).length).assertEqual(8);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0048
   * @tc.name      testWantFacts0048
   * @tc.desc      Want parameters pass 18 round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testWantFacts0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testWantFacts0048', 'want params 18');
    const params: Record<string, Object> = {
      'probe': 198,
      'label': 'probe-18'
    };
    const want: Want = {
      bundleName: BUNDLE_NAME,
      abilityName: ENTRY_ABILITY,
      parameters: params
    };
    const stored: Record<string, Object> = want.parameters as Record<string, Object>;
    expect(stored['probe'] as number).assertEqual(198);
    expect(stored['label'] as string).assertEqual('probe-18');
    expect((stored['probe'] as number) / 18).assertEqual(11);
    expect((stored['label'] as string).length).assertEqual(8);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0049
   * @tc.name      testWantFacts0049
   * @tc.desc      Want parameters pass 19 round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testWantFacts0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testWantFacts0049', 'want params 19');
    const params: Record<string, Object> = {
      'probe': 209,
      'label': 'probe-19'
    };
    const want: Want = {
      bundleName: BUNDLE_NAME,
      abilityName: ENTRY_ABILITY,
      parameters: params
    };
    const stored: Record<string, Object> = want.parameters as Record<string, Object>;
    expect(stored['probe'] as number).assertEqual(209);
    expect(stored['label'] as string).assertEqual('probe-19');
    expect((stored['probe'] as number) / 19).assertEqual(11);
    expect((stored['label'] as string).length).assertEqual(8);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0050
   * @tc.name      testWantFacts0050
   * @tc.desc      Want parameters pass 20 round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testWantFacts0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testWantFacts0050', 'want params 20');
    const params: Record<string, Object> = {
      'probe': 220,
      'label': 'probe-20'
    };
    const want: Want = {
      bundleName: BUNDLE_NAME,
      abilityName: ENTRY_ABILITY,
      parameters: params
    };
    const stored: Record<string, Object> = want.parameters as Record<string, Object>;
    expect(stored['probe'] as number).assertEqual(220);
    expect(stored['label'] as string).assertEqual('probe-20');
    expect((stored['probe'] as number) / 20).assertEqual(11);
    expect((stored['label'] as string).length).assertEqual(8);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0051
   * @tc.name      testWantFacts0051
   * @tc.desc      Want parameters pass 21 round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testWantFacts0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testWantFacts0051', 'want params 21');
    const params: Record<string, Object> = {
      'probe': 231,
      'label': 'probe-21'
    };
    const want: Want = {
      bundleName: BUNDLE_NAME,
      abilityName: ENTRY_ABILITY,
      parameters: params
    };
    const stored: Record<string, Object> = want.parameters as Record<string, Object>;
    expect(stored['probe'] as number).assertEqual(231);
    expect(stored['label'] as string).assertEqual('probe-21');
    expect((stored['probe'] as number) / 21).assertEqual(11);
    expect((stored['label'] as string).length).assertEqual(8);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0052
   * @tc.name      testWantFacts0052
   * @tc.desc      Want parameters pass 22 round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testWantFacts0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testWantFacts0052', 'want params 22');
    const params: Record<string, Object> = {
      'probe': 242,
      'label': 'probe-22'
    };
    const want: Want = {
      bundleName: BUNDLE_NAME,
      abilityName: ENTRY_ABILITY,
      parameters: params
    };
    const stored: Record<string, Object> = want.parameters as Record<string, Object>;
    expect(stored['probe'] as number).assertEqual(242);
    expect(stored['label'] as string).assertEqual('probe-22');
    expect((stored['probe'] as number) / 22).assertEqual(11);
    expect((stored['label'] as string).length).assertEqual(8);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0053
   * @tc.name      testWantFacts0053
   * @tc.desc      Want parameters pass 23 round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testWantFacts0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testWantFacts0053', 'want params 23');
    const params: Record<string, Object> = {
      'probe': 253,
      'label': 'probe-23'
    };
    const want: Want = {
      bundleName: BUNDLE_NAME,
      abilityName: ENTRY_ABILITY,
      parameters: params
    };
    const stored: Record<string, Object> = want.parameters as Record<string, Object>;
    expect(stored['probe'] as number).assertEqual(253);
    expect(stored['label'] as string).assertEqual('probe-23');
    expect((stored['probe'] as number) / 23).assertEqual(11);
    expect((stored['label'] as string).length).assertEqual(8);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0054
   * @tc.name      testWantFacts0054
   * @tc.desc      Want parameters pass 24 round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testWantFacts0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testWantFacts0054', 'want params 24');
    const params: Record<string, Object> = {
      'probe': 264,
      'label': 'probe-24'
    };
    const want: Want = {
      bundleName: BUNDLE_NAME,
      abilityName: ENTRY_ABILITY,
      parameters: params
    };
    const stored: Record<string, Object> = want.parameters as Record<string, Object>;
    expect(stored['probe'] as number).assertEqual(264);
    expect(stored['label'] as string).assertEqual('probe-24');
    expect((stored['probe'] as number) / 24).assertEqual(11);
    expect((stored['label'] as string).length).assertEqual(8);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0055
   * @tc.name      testWantFacts0055
   * @tc.desc      Want parameters pass 25 round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testWantFacts0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testWantFacts0055', 'want params 25');
    const params: Record<string, Object> = {
      'probe': 275,
      'label': 'probe-25'
    };
    const want: Want = {
      bundleName: BUNDLE_NAME,
      abilityName: ENTRY_ABILITY,
      parameters: params
    };
    const stored: Record<string, Object> = want.parameters as Record<string, Object>;
    expect(stored['probe'] as number).assertEqual(275);
    expect(stored['label'] as string).assertEqual('probe-25');
    expect((stored['probe'] as number) / 25).assertEqual(11);
    expect((stored['label'] as string).length).assertEqual(8);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0056
   * @tc.name      testWantFacts0056
   * @tc.desc      Want parameters pass 26 round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testWantFacts0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testWantFacts0056', 'want params 26');
    const params: Record<string, Object> = {
      'probe': 286,
      'label': 'probe-26'
    };
    const want: Want = {
      bundleName: BUNDLE_NAME,
      abilityName: ENTRY_ABILITY,
      parameters: params
    };
    const stored: Record<string, Object> = want.parameters as Record<string, Object>;
    expect(stored['probe'] as number).assertEqual(286);
    expect(stored['label'] as string).assertEqual('probe-26');
    expect((stored['probe'] as number) / 26).assertEqual(11);
    expect((stored['label'] as string).length).assertEqual(8);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0057
   * @tc.name      testWantFacts0057
   * @tc.desc      Want parameters pass 27 round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testWantFacts0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testWantFacts0057', 'want params 27');
    const params: Record<string, Object> = {
      'probe': 297,
      'label': 'probe-27'
    };
    const want: Want = {
      bundleName: BUNDLE_NAME,
      abilityName: ENTRY_ABILITY,
      parameters: params
    };
    const stored: Record<string, Object> = want.parameters as Record<string, Object>;
    expect(stored['probe'] as number).assertEqual(297);
    expect(stored['label'] as string).assertEqual('probe-27');
    expect((stored['probe'] as number) / 27).assertEqual(11);
    expect((stored['label'] as string).length).assertEqual(8);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0058
   * @tc.name      testWantFacts0058
   * @tc.desc      Want parameters pass 28 round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testWantFacts0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testWantFacts0058', 'want params 28');
    const params: Record<string, Object> = {
      'probe': 308,
      'label': 'probe-28'
    };
    const want: Want = {
      bundleName: BUNDLE_NAME,
      abilityName: ENTRY_ABILITY,
      parameters: params
    };
    const stored: Record<string, Object> = want.parameters as Record<string, Object>;
    expect(stored['probe'] as number).assertEqual(308);
    expect(stored['label'] as string).assertEqual('probe-28');
    expect((stored['probe'] as number) / 28).assertEqual(11);
    expect((stored['label'] as string).length).assertEqual(8);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0059
   * @tc.name      testWantFacts0059
   * @tc.desc      Want parameters pass 29 round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testWantFacts0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testWantFacts0059', 'want params 29');
    const params: Record<string, Object> = {
      'probe': 319,
      'label': 'probe-29'
    };
    const want: Want = {
      bundleName: BUNDLE_NAME,
      abilityName: ENTRY_ABILITY,
      parameters: params
    };
    const stored: Record<string, Object> = want.parameters as Record<string, Object>;
    expect(stored['probe'] as number).assertEqual(319);
    expect(stored['label'] as string).assertEqual('probe-29');
    expect((stored['probe'] as number) / 29).assertEqual(11);
    expect((stored['label'] as string).length).assertEqual(8);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0060
   * @tc.name      testWantFacts0060
   * @tc.desc      Want parameters pass 30 round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testWantFacts0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testWantFacts0060', 'want params 30');
    const params: Record<string, Object> = {
      'probe': 330,
      'label': 'probe-30'
    };
    const want: Want = {
      bundleName: BUNDLE_NAME,
      abilityName: ENTRY_ABILITY,
      parameters: params
    };
    const stored: Record<string, Object> = want.parameters as Record<string, Object>;
    expect(stored['probe'] as number).assertEqual(330);
    expect(stored['label'] as string).assertEqual('probe-30');
    expect((stored['probe'] as number) / 30).assertEqual(11);
    expect((stored['label'] as string).length).assertEqual(8);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0061
   * @tc.name      testWantFacts0061
   * @tc.desc      Want skill pass 1 matches action
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testWantFacts0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testWantFacts0061', 'want skill 1');
    const entity: string = 'entity.system.browsable';
    const action: string = 'ohos.want.action.viewData';
    const want: Want = {
      bundleName: BUNDLE_NAME,
      entities: [entity],
      action: action
    };
    expect((want.entities as string[]).join(',')).assertEqual(entity);
    expect((want.entities as string[]).length).assertEqual(1);
    expect((want.entities as string[])[0]).assertEqual(entity);
    expect(want.action as string).assertEqual(action);
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0062
   * @tc.name      testWantFacts0062
   * @tc.desc      Want skill pass 2 matches action
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testWantFacts0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testWantFacts0062', 'want skill 2');
    const entity: string = 'entity.system.home';
    const action: string = 'ohos.want.action.home';
    const want: Want = {
      bundleName: BUNDLE_NAME,
      entities: [entity],
      action: action
    };
    expect((want.entities as string[]).join(',')).assertEqual(entity);
    expect((want.entities as string[]).length).assertEqual(1);
    expect((want.entities as string[])[0]).assertEqual(entity);
    expect(want.action as string).assertEqual(action);
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0063
   * @tc.name      testWantFacts0063
   * @tc.desc      Want skill pass 3 matches action
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testWantFacts0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testWantFacts0063', 'want skill 3');
    const entity: string = 'entity.system.browsable';
    const action: string = 'ohos.want.action.viewData';
    const want: Want = {
      bundleName: BUNDLE_NAME,
      entities: [entity],
      action: action
    };
    expect((want.entities as string[]).join(',')).assertEqual(entity);
    expect((want.entities as string[]).length).assertEqual(1);
    expect((want.entities as string[])[0]).assertEqual(entity);
    expect(want.action as string).assertEqual(action);
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0064
   * @tc.name      testWantFacts0064
   * @tc.desc      Want skill pass 4 matches action
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testWantFacts0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testWantFacts0064', 'want skill 4');
    const entity: string = 'entity.system.home';
    const action: string = 'ohos.want.action.home';
    const want: Want = {
      bundleName: BUNDLE_NAME,
      entities: [entity],
      action: action
    };
    expect((want.entities as string[]).join(',')).assertEqual(entity);
    expect((want.entities as string[]).length).assertEqual(1);
    expect((want.entities as string[])[0]).assertEqual(entity);
    expect(want.action as string).assertEqual(action);
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0065
   * @tc.name      testWantFacts0065
   * @tc.desc      Want skill pass 5 matches action
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testWantFacts0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testWantFacts0065', 'want skill 5');
    const entity: string = 'entity.system.browsable';
    const action: string = 'ohos.want.action.viewData';
    const want: Want = {
      bundleName: BUNDLE_NAME,
      entities: [entity],
      action: action
    };
    expect((want.entities as string[]).join(',')).assertEqual(entity);
    expect((want.entities as string[]).length).assertEqual(1);
    expect((want.entities as string[])[0]).assertEqual(entity);
    expect(want.action as string).assertEqual(action);
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0066
   * @tc.name      testWantFacts0066
   * @tc.desc      Want skill pass 6 matches action
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testWantFacts0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testWantFacts0066', 'want skill 6');
    const entity: string = 'entity.system.home';
    const action: string = 'ohos.want.action.home';
    const want: Want = {
      bundleName: BUNDLE_NAME,
      entities: [entity],
      action: action
    };
    expect((want.entities as string[]).join(',')).assertEqual(entity);
    expect((want.entities as string[]).length).assertEqual(1);
    expect((want.entities as string[])[0]).assertEqual(entity);
    expect(want.action as string).assertEqual(action);
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0067
   * @tc.name      testWantFacts0067
   * @tc.desc      Want skill pass 7 matches action
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testWantFacts0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testWantFacts0067', 'want skill 7');
    const entity: string = 'entity.system.browsable';
    const action: string = 'ohos.want.action.viewData';
    const want: Want = {
      bundleName: BUNDLE_NAME,
      entities: [entity],
      action: action
    };
    expect((want.entities as string[]).join(',')).assertEqual(entity);
    expect((want.entities as string[]).length).assertEqual(1);
    expect((want.entities as string[])[0]).assertEqual(entity);
    expect(want.action as string).assertEqual(action);
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0068
   * @tc.name      testWantFacts0068
   * @tc.desc      Want skill pass 8 matches action
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testWantFacts0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testWantFacts0068', 'want skill 8');
    const entity: string = 'entity.system.home';
    const action: string = 'ohos.want.action.home';
    const want: Want = {
      bundleName: BUNDLE_NAME,
      entities: [entity],
      action: action
    };
    expect((want.entities as string[]).join(',')).assertEqual(entity);
    expect((want.entities as string[]).length).assertEqual(1);
    expect((want.entities as string[])[0]).assertEqual(entity);
    expect(want.action as string).assertEqual(action);
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0069
   * @tc.name      testWantFacts0069
   * @tc.desc      Want skill pass 9 matches action
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testWantFacts0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testWantFacts0069', 'want skill 9');
    const entity: string = 'entity.system.browsable';
    const action: string = 'ohos.want.action.viewData';
    const want: Want = {
      bundleName: BUNDLE_NAME,
      entities: [entity],
      action: action
    };
    expect((want.entities as string[]).join(',')).assertEqual(entity);
    expect((want.entities as string[]).length).assertEqual(1);
    expect((want.entities as string[])[0]).assertEqual(entity);
    expect(want.action as string).assertEqual(action);
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0070
   * @tc.name      testWantFacts0070
   * @tc.desc      Want skill pass 10 matches action
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testWantFacts0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testWantFacts0070', 'want skill 10');
    const entity: string = 'entity.system.home';
    const action: string = 'ohos.want.action.home';
    const want: Want = {
      bundleName: BUNDLE_NAME,
      entities: [entity],
      action: action
    };
    expect((want.entities as string[]).join(',')).assertEqual(entity);
    expect((want.entities as string[]).length).assertEqual(1);
    expect((want.entities as string[])[0]).assertEqual(entity);
    expect(want.action as string).assertEqual(action);
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0071
   * @tc.name      testWantFacts0071
   * @tc.desc      Want skill pass 11 matches action
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testWantFacts0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testWantFacts0071', 'want skill 11');
    const entity: string = 'entity.system.browsable';
    const action: string = 'ohos.want.action.viewData';
    const want: Want = {
      bundleName: BUNDLE_NAME,
      entities: [entity],
      action: action
    };
    expect((want.entities as string[]).join(',')).assertEqual(entity);
    expect((want.entities as string[]).length).assertEqual(1);
    expect((want.entities as string[])[0]).assertEqual(entity);
    expect(want.action as string).assertEqual(action);
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0072
   * @tc.name      testWantFacts0072
   * @tc.desc      Want skill pass 12 matches action
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testWantFacts0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testWantFacts0072', 'want skill 12');
    const entity: string = 'entity.system.home';
    const action: string = 'ohos.want.action.home';
    const want: Want = {
      bundleName: BUNDLE_NAME,
      entities: [entity],
      action: action
    };
    expect((want.entities as string[]).join(',')).assertEqual(entity);
    expect((want.entities as string[]).length).assertEqual(1);
    expect((want.entities as string[])[0]).assertEqual(entity);
    expect(want.action as string).assertEqual(action);
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0073
   * @tc.name      testWantFacts0073
   * @tc.desc      Want skill pass 13 matches action
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testWantFacts0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testWantFacts0073', 'want skill 13');
    const entity: string = 'entity.system.browsable';
    const action: string = 'ohos.want.action.viewData';
    const want: Want = {
      bundleName: BUNDLE_NAME,
      entities: [entity],
      action: action
    };
    expect((want.entities as string[]).join(',')).assertEqual(entity);
    expect((want.entities as string[]).length).assertEqual(1);
    expect((want.entities as string[])[0]).assertEqual(entity);
    expect(want.action as string).assertEqual(action);
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0074
   * @tc.name      testWantFacts0074
   * @tc.desc      Want skill pass 14 matches action
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testWantFacts0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testWantFacts0074', 'want skill 14');
    const entity: string = 'entity.system.home';
    const action: string = 'ohos.want.action.home';
    const want: Want = {
      bundleName: BUNDLE_NAME,
      entities: [entity],
      action: action
    };
    expect((want.entities as string[]).join(',')).assertEqual(entity);
    expect((want.entities as string[]).length).assertEqual(1);
    expect((want.entities as string[])[0]).assertEqual(entity);
    expect(want.action as string).assertEqual(action);
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0075
   * @tc.name      testWantFacts0075
   * @tc.desc      Want skill pass 15 matches action
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testWantFacts0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testWantFacts0075', 'want skill 15');
    const entity: string = 'entity.system.browsable';
    const action: string = 'ohos.want.action.viewData';
    const want: Want = {
      bundleName: BUNDLE_NAME,
      entities: [entity],
      action: action
    };
    expect((want.entities as string[]).join(',')).assertEqual(entity);
    expect((want.entities as string[]).length).assertEqual(1);
    expect((want.entities as string[])[0]).assertEqual(entity);
    expect(want.action as string).assertEqual(action);
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0076
   * @tc.name      testWantFacts0076
   * @tc.desc      Want skill pass 16 matches action
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testWantFacts0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testWantFacts0076', 'want skill 16');
    const entity: string = 'entity.system.home';
    const action: string = 'ohos.want.action.home';
    const want: Want = {
      bundleName: BUNDLE_NAME,
      entities: [entity],
      action: action
    };
    expect((want.entities as string[]).join(',')).assertEqual(entity);
    expect((want.entities as string[]).length).assertEqual(1);
    expect((want.entities as string[])[0]).assertEqual(entity);
    expect(want.action as string).assertEqual(action);
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0077
   * @tc.name      testWantFacts0077
   * @tc.desc      Want skill pass 17 matches action
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testWantFacts0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testWantFacts0077', 'want skill 17');
    const entity: string = 'entity.system.browsable';
    const action: string = 'ohos.want.action.viewData';
    const want: Want = {
      bundleName: BUNDLE_NAME,
      entities: [entity],
      action: action
    };
    expect((want.entities as string[]).join(',')).assertEqual(entity);
    expect((want.entities as string[]).length).assertEqual(1);
    expect((want.entities as string[])[0]).assertEqual(entity);
    expect(want.action as string).assertEqual(action);
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0078
   * @tc.name      testWantFacts0078
   * @tc.desc      Want skill pass 18 matches action
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testWantFacts0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testWantFacts0078', 'want skill 18');
    const entity: string = 'entity.system.home';
    const action: string = 'ohos.want.action.home';
    const want: Want = {
      bundleName: BUNDLE_NAME,
      entities: [entity],
      action: action
    };
    expect((want.entities as string[]).join(',')).assertEqual(entity);
    expect((want.entities as string[]).length).assertEqual(1);
    expect((want.entities as string[])[0]).assertEqual(entity);
    expect(want.action as string).assertEqual(action);
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0079
   * @tc.name      testWantFacts0079
   * @tc.desc      Want skill pass 19 matches action
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testWantFacts0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testWantFacts0079', 'want skill 19');
    const entity: string = 'entity.system.browsable';
    const action: string = 'ohos.want.action.viewData';
    const want: Want = {
      bundleName: BUNDLE_NAME,
      entities: [entity],
      action: action
    };
    expect((want.entities as string[]).join(',')).assertEqual(entity);
    expect((want.entities as string[]).length).assertEqual(1);
    expect((want.entities as string[])[0]).assertEqual(entity);
    expect(want.action as string).assertEqual(action);
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0080
   * @tc.name      testWantFacts0080
   * @tc.desc      Want skill pass 20 matches action
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testWantFacts0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testWantFacts0080', 'want skill 20');
    const entity: string = 'entity.system.home';
    const action: string = 'ohos.want.action.home';
    const want: Want = {
      bundleName: BUNDLE_NAME,
      entities: [entity],
      action: action
    };
    expect((want.entities as string[]).join(',')).assertEqual(entity);
    expect((want.entities as string[]).length).assertEqual(1);
    expect((want.entities as string[])[0]).assertEqual(entity);
    expect(want.action as string).assertEqual(action);
    expect(want.bundleName as string).assertEqual(BUNDLE_NAME);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0081
   * @tc.name      testWantFacts0081
   * @tc.desc      Want uri pass 1 parses
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testWantFacts0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testWantFacts0081', 'want uri 1');
    const uri: string = 'https://example.com/page/1?index=2';
    const want: Want = {
      bundleName: BUNDLE_NAME,
      uri: uri
    };
    expect(want.uri as string).assertEqual(uri);
    expect((want.uri as string).startsWith('https://')).assertTrue();
    expect((want.uri as string).includes('page/1')).assertTrue();
    expect((want.uri as string).split('=').length).assertEqual(2);
    expect((want.uri as string).indexOf('?')).assertEqual(26);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0082
   * @tc.name      testWantFacts0082
   * @tc.desc      Want uri pass 2 parses
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testWantFacts0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testWantFacts0082', 'want uri 2');
    const uri: string = 'https://example.com/page/2?index=4';
    const want: Want = {
      bundleName: BUNDLE_NAME,
      uri: uri
    };
    expect(want.uri as string).assertEqual(uri);
    expect((want.uri as string).startsWith('https://')).assertTrue();
    expect((want.uri as string).includes('page/2')).assertTrue();
    expect((want.uri as string).split('=').length).assertEqual(2);
    expect((want.uri as string).indexOf('?')).assertEqual(26);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0083
   * @tc.name      testWantFacts0083
   * @tc.desc      Want uri pass 3 parses
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testWantFacts0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testWantFacts0083', 'want uri 3');
    const uri: string = 'https://example.com/page/3?index=6';
    const want: Want = {
      bundleName: BUNDLE_NAME,
      uri: uri
    };
    expect(want.uri as string).assertEqual(uri);
    expect((want.uri as string).startsWith('https://')).assertTrue();
    expect((want.uri as string).includes('page/3')).assertTrue();
    expect((want.uri as string).split('=').length).assertEqual(2);
    expect((want.uri as string).indexOf('?')).assertEqual(26);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0084
   * @tc.name      testWantFacts0084
   * @tc.desc      Want uri pass 4 parses
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testWantFacts0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testWantFacts0084', 'want uri 4');
    const uri: string = 'https://example.com/page/4?index=8';
    const want: Want = {
      bundleName: BUNDLE_NAME,
      uri: uri
    };
    expect(want.uri as string).assertEqual(uri);
    expect((want.uri as string).startsWith('https://')).assertTrue();
    expect((want.uri as string).includes('page/4')).assertTrue();
    expect((want.uri as string).split('=').length).assertEqual(2);
    expect((want.uri as string).indexOf('?')).assertEqual(26);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_WANT_0085
   * @tc.name      testWantFacts0085
   * @tc.desc      Want uri pass 5 parses
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testWantFacts0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testWantFacts0085', 'want uri 5');
    const uri: string = 'https://example.com/page/5?index=10';
    const want: Want = {
      bundleName: BUNDLE_NAME,
      uri: uri
    };
    expect(want.uri as string).assertEqual(uri);
    expect((want.uri as string).startsWith('https://')).assertTrue();
    expect((want.uri as string).includes('page/5')).assertTrue();
    expect((want.uri as string).split('=').length).assertEqual(2);
    expect((want.uri as string).indexOf('?')).assertEqual(26);
  });
  });
}
