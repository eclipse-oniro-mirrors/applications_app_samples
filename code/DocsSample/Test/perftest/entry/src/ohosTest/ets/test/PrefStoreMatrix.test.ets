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
import { common } from '@kit.AbilityKit';
import { preferences } from '@kit.ArkData';
import { entryContext } from './shared/Probe';
import { logCase } from './shared/TestLog';

import { paceTurn } from './shared/TestPace';

export default function prefStoreMatrixTest() {
  describe('prefStoreMatrixTest', () => {
  beforeEach(async () => {
    await paceTurn();
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_PREF_0001
   * @tc.name      testPrefStore0001
   * @tc.desc      Preference store_alpha keeps string key_01
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testPrefStore0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testPrefStore0001', 'store_alpha key_01');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'store_alpha' });
    pref.putSync('key_01', 'value-store_alpha-1');
    expect(pref.hasSync('key_01')).assertTrue();
    expect(pref.getSync('key_01', 'missing') as string).assertEqual('value-store_alpha-1');
    expect((pref.getSync('key_01', 'missing') as string).length).assertEqual(19);
    await pref.flush();
    expect((pref.getSync('key_01', '') as string).charAt(0)).assertEqual('v');
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_PREF_0002
   * @tc.name      testPrefStore0002
   * @tc.desc      Preference store_alpha keeps string key_02
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testPrefStore0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testPrefStore0002', 'store_alpha key_02');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'store_alpha' });
    pref.putSync('key_02', 'value-store_alpha-2');
    expect(pref.hasSync('key_02')).assertTrue();
    expect(pref.getSync('key_02', 'missing') as string).assertEqual('value-store_alpha-2');
    expect((pref.getSync('key_02', 'missing') as string).length).assertEqual(19);
    await pref.flush();
    expect((pref.getSync('key_02', '') as string).charAt(0)).assertEqual('v');
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_PREF_0003
   * @tc.name      testPrefStore0003
   * @tc.desc      Preference store_alpha keeps string key_03
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testPrefStore0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testPrefStore0003', 'store_alpha key_03');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'store_alpha' });
    pref.putSync('key_03', 'value-store_alpha-3');
    expect(pref.hasSync('key_03')).assertTrue();
    expect(pref.getSync('key_03', 'missing') as string).assertEqual('value-store_alpha-3');
    expect((pref.getSync('key_03', 'missing') as string).length).assertEqual(19);
    await pref.flush();
    expect((pref.getSync('key_03', '') as string).charAt(0)).assertEqual('v');
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_PREF_0004
   * @tc.name      testPrefStore0004
   * @tc.desc      Preference store_alpha keeps string key_04
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testPrefStore0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testPrefStore0004', 'store_alpha key_04');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'store_alpha' });
    pref.putSync('key_04', 'value-store_alpha-4');
    expect(pref.hasSync('key_04')).assertTrue();
    expect(pref.getSync('key_04', 'missing') as string).assertEqual('value-store_alpha-4');
    expect((pref.getSync('key_04', 'missing') as string).length).assertEqual(19);
    await pref.flush();
    expect((pref.getSync('key_04', '') as string).charAt(0)).assertEqual('v');
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_PREF_0005
   * @tc.name      testPrefStore0005
   * @tc.desc      Preference store_alpha keeps string key_05
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testPrefStore0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testPrefStore0005', 'store_alpha key_05');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'store_alpha' });
    pref.putSync('key_05', 'value-store_alpha-5');
    expect(pref.hasSync('key_05')).assertTrue();
    expect(pref.getSync('key_05', 'missing') as string).assertEqual('value-store_alpha-5');
    expect((pref.getSync('key_05', 'missing') as string).length).assertEqual(19);
    await pref.flush();
    expect((pref.getSync('key_05', '') as string).charAt(0)).assertEqual('v');
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_PREF_0006
   * @tc.name      testPrefStore0006
   * @tc.desc      Preference store_alpha keeps string key_06
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testPrefStore0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testPrefStore0006', 'store_alpha key_06');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'store_alpha' });
    pref.putSync('key_06', 'value-store_alpha-6');
    expect(pref.hasSync('key_06')).assertTrue();
    expect(pref.getSync('key_06', 'missing') as string).assertEqual('value-store_alpha-6');
    expect((pref.getSync('key_06', 'missing') as string).length).assertEqual(19);
    await pref.flush();
    expect((pref.getSync('key_06', '') as string).charAt(0)).assertEqual('v');
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_PREF_0007
   * @tc.name      testPrefStore0007
   * @tc.desc      Preference store_alpha keeps string key_07
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testPrefStore0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testPrefStore0007', 'store_alpha key_07');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'store_alpha' });
    pref.putSync('key_07', 'value-store_alpha-7');
    expect(pref.hasSync('key_07')).assertTrue();
    expect(pref.getSync('key_07', 'missing') as string).assertEqual('value-store_alpha-7');
    expect((pref.getSync('key_07', 'missing') as string).length).assertEqual(19);
    await pref.flush();
    expect((pref.getSync('key_07', '') as string).charAt(0)).assertEqual('v');
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_PREF_0008
   * @tc.name      testPrefStore0008
   * @tc.desc      Preference store_alpha keeps string key_08
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testPrefStore0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testPrefStore0008', 'store_alpha key_08');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'store_alpha' });
    pref.putSync('key_08', 'value-store_alpha-8');
    expect(pref.hasSync('key_08')).assertTrue();
    expect(pref.getSync('key_08', 'missing') as string).assertEqual('value-store_alpha-8');
    expect((pref.getSync('key_08', 'missing') as string).length).assertEqual(19);
    await pref.flush();
    expect((pref.getSync('key_08', '') as string).charAt(0)).assertEqual('v');
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_PREF_0009
   * @tc.name      testPrefStore0009
   * @tc.desc      Preference store_beta keeps string key_01
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testPrefStore0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testPrefStore0009', 'store_beta key_01');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'store_beta' });
    pref.putSync('key_01', 'value-store_beta-1');
    expect(pref.hasSync('key_01')).assertTrue();
    expect(pref.getSync('key_01', 'missing') as string).assertEqual('value-store_beta-1');
    expect((pref.getSync('key_01', 'missing') as string).length).assertEqual(18);
    await pref.flush();
    expect((pref.getSync('key_01', '') as string).charAt(0)).assertEqual('v');
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_PREF_0010
   * @tc.name      testPrefStore0010
   * @tc.desc      Preference store_beta keeps string key_02
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testPrefStore0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testPrefStore0010', 'store_beta key_02');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'store_beta' });
    pref.putSync('key_02', 'value-store_beta-2');
    expect(pref.hasSync('key_02')).assertTrue();
    expect(pref.getSync('key_02', 'missing') as string).assertEqual('value-store_beta-2');
    expect((pref.getSync('key_02', 'missing') as string).length).assertEqual(18);
    await pref.flush();
    expect((pref.getSync('key_02', '') as string).charAt(0)).assertEqual('v');
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_PREF_0011
   * @tc.name      testPrefStore0011
   * @tc.desc      Preference store_beta keeps string key_03
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testPrefStore0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testPrefStore0011', 'store_beta key_03');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'store_beta' });
    pref.putSync('key_03', 'value-store_beta-3');
    expect(pref.hasSync('key_03')).assertTrue();
    expect(pref.getSync('key_03', 'missing') as string).assertEqual('value-store_beta-3');
    expect((pref.getSync('key_03', 'missing') as string).length).assertEqual(18);
    await pref.flush();
    expect((pref.getSync('key_03', '') as string).charAt(0)).assertEqual('v');
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_PREF_0012
   * @tc.name      testPrefStore0012
   * @tc.desc      Preference store_beta keeps string key_04
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testPrefStore0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testPrefStore0012', 'store_beta key_04');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'store_beta' });
    pref.putSync('key_04', 'value-store_beta-4');
    expect(pref.hasSync('key_04')).assertTrue();
    expect(pref.getSync('key_04', 'missing') as string).assertEqual('value-store_beta-4');
    expect((pref.getSync('key_04', 'missing') as string).length).assertEqual(18);
    await pref.flush();
    expect((pref.getSync('key_04', '') as string).charAt(0)).assertEqual('v');
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_PREF_0013
   * @tc.name      testPrefStore0013
   * @tc.desc      Preference store_beta keeps string key_05
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testPrefStore0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testPrefStore0013', 'store_beta key_05');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'store_beta' });
    pref.putSync('key_05', 'value-store_beta-5');
    expect(pref.hasSync('key_05')).assertTrue();
    expect(pref.getSync('key_05', 'missing') as string).assertEqual('value-store_beta-5');
    expect((pref.getSync('key_05', 'missing') as string).length).assertEqual(18);
    await pref.flush();
    expect((pref.getSync('key_05', '') as string).charAt(0)).assertEqual('v');
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_PREF_0014
   * @tc.name      testPrefStore0014
   * @tc.desc      Preference store_beta keeps string key_06
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testPrefStore0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testPrefStore0014', 'store_beta key_06');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'store_beta' });
    pref.putSync('key_06', 'value-store_beta-6');
    expect(pref.hasSync('key_06')).assertTrue();
    expect(pref.getSync('key_06', 'missing') as string).assertEqual('value-store_beta-6');
    expect((pref.getSync('key_06', 'missing') as string).length).assertEqual(18);
    await pref.flush();
    expect((pref.getSync('key_06', '') as string).charAt(0)).assertEqual('v');
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_PREF_0015
   * @tc.name      testPrefStore0015
   * @tc.desc      Preference store_beta keeps string key_07
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testPrefStore0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testPrefStore0015', 'store_beta key_07');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'store_beta' });
    pref.putSync('key_07', 'value-store_beta-7');
    expect(pref.hasSync('key_07')).assertTrue();
    expect(pref.getSync('key_07', 'missing') as string).assertEqual('value-store_beta-7');
    expect((pref.getSync('key_07', 'missing') as string).length).assertEqual(18);
    await pref.flush();
    expect((pref.getSync('key_07', '') as string).charAt(0)).assertEqual('v');
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_PREF_0016
   * @tc.name      testPrefStore0016
   * @tc.desc      Preference store_beta keeps string key_08
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testPrefStore0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testPrefStore0016', 'store_beta key_08');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'store_beta' });
    pref.putSync('key_08', 'value-store_beta-8');
    expect(pref.hasSync('key_08')).assertTrue();
    expect(pref.getSync('key_08', 'missing') as string).assertEqual('value-store_beta-8');
    expect((pref.getSync('key_08', 'missing') as string).length).assertEqual(18);
    await pref.flush();
    expect((pref.getSync('key_08', '') as string).charAt(0)).assertEqual('v');
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_PREF_0017
   * @tc.name      testPrefStore0017
   * @tc.desc      Preference store_gamma keeps string key_01
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testPrefStore0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testPrefStore0017', 'store_gamma key_01');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'store_gamma' });
    pref.putSync('key_01', 'value-store_gamma-1');
    expect(pref.hasSync('key_01')).assertTrue();
    expect(pref.getSync('key_01', 'missing') as string).assertEqual('value-store_gamma-1');
    expect((pref.getSync('key_01', 'missing') as string).length).assertEqual(19);
    await pref.flush();
    expect((pref.getSync('key_01', '') as string).charAt(0)).assertEqual('v');
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_PREF_0018
   * @tc.name      testPrefStore0018
   * @tc.desc      Preference store_gamma keeps string key_02
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testPrefStore0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testPrefStore0018', 'store_gamma key_02');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'store_gamma' });
    pref.putSync('key_02', 'value-store_gamma-2');
    expect(pref.hasSync('key_02')).assertTrue();
    expect(pref.getSync('key_02', 'missing') as string).assertEqual('value-store_gamma-2');
    expect((pref.getSync('key_02', 'missing') as string).length).assertEqual(19);
    await pref.flush();
    expect((pref.getSync('key_02', '') as string).charAt(0)).assertEqual('v');
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_PREF_0019
   * @tc.name      testPrefStore0019
   * @tc.desc      Preference store_gamma keeps string key_03
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testPrefStore0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testPrefStore0019', 'store_gamma key_03');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'store_gamma' });
    pref.putSync('key_03', 'value-store_gamma-3');
    expect(pref.hasSync('key_03')).assertTrue();
    expect(pref.getSync('key_03', 'missing') as string).assertEqual('value-store_gamma-3');
    expect((pref.getSync('key_03', 'missing') as string).length).assertEqual(19);
    await pref.flush();
    expect((pref.getSync('key_03', '') as string).charAt(0)).assertEqual('v');
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_PREF_0020
   * @tc.name      testPrefStore0020
   * @tc.desc      Preference store_gamma keeps string key_04
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testPrefStore0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testPrefStore0020', 'store_gamma key_04');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'store_gamma' });
    pref.putSync('key_04', 'value-store_gamma-4');
    expect(pref.hasSync('key_04')).assertTrue();
    expect(pref.getSync('key_04', 'missing') as string).assertEqual('value-store_gamma-4');
    expect((pref.getSync('key_04', 'missing') as string).length).assertEqual(19);
    await pref.flush();
    expect((pref.getSync('key_04', '') as string).charAt(0)).assertEqual('v');
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_PREF_0021
   * @tc.name      testPrefStore0021
   * @tc.desc      Preference store_gamma keeps string key_05
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testPrefStore0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testPrefStore0021', 'store_gamma key_05');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'store_gamma' });
    pref.putSync('key_05', 'value-store_gamma-5');
    expect(pref.hasSync('key_05')).assertTrue();
    expect(pref.getSync('key_05', 'missing') as string).assertEqual('value-store_gamma-5');
    expect((pref.getSync('key_05', 'missing') as string).length).assertEqual(19);
    await pref.flush();
    expect((pref.getSync('key_05', '') as string).charAt(0)).assertEqual('v');
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_PREF_0022
   * @tc.name      testPrefStore0022
   * @tc.desc      Preference store_gamma keeps string key_06
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testPrefStore0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testPrefStore0022', 'store_gamma key_06');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'store_gamma' });
    pref.putSync('key_06', 'value-store_gamma-6');
    expect(pref.hasSync('key_06')).assertTrue();
    expect(pref.getSync('key_06', 'missing') as string).assertEqual('value-store_gamma-6');
    expect((pref.getSync('key_06', 'missing') as string).length).assertEqual(19);
    await pref.flush();
    expect((pref.getSync('key_06', '') as string).charAt(0)).assertEqual('v');
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_PREF_0023
   * @tc.name      testPrefStore0023
   * @tc.desc      Preference store_gamma keeps string key_07
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testPrefStore0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testPrefStore0023', 'store_gamma key_07');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'store_gamma' });
    pref.putSync('key_07', 'value-store_gamma-7');
    expect(pref.hasSync('key_07')).assertTrue();
    expect(pref.getSync('key_07', 'missing') as string).assertEqual('value-store_gamma-7');
    expect((pref.getSync('key_07', 'missing') as string).length).assertEqual(19);
    await pref.flush();
    expect((pref.getSync('key_07', '') as string).charAt(0)).assertEqual('v');
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_PREF_0024
   * @tc.name      testPrefStore0024
   * @tc.desc      Preference store_gamma keeps string key_08
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testPrefStore0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testPrefStore0024', 'store_gamma key_08');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'store_gamma' });
