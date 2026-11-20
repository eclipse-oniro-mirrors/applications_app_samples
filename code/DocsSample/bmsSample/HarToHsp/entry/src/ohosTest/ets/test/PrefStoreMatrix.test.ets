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
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0001
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
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0002
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
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0003
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
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0004
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
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0005
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
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0006
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
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0007
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
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0008
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
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0009
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
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0010
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
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0011
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
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0012
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
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0013
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
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0014
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
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0015
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
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0016
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
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0017
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
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0018
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
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0019
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
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0020
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
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0021
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
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0022
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
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0023
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
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0024
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
    pref.putSync('key_08', 'value-store_gamma-8');
    expect(pref.hasSync('key_08')).assertTrue();
    expect(pref.getSync('key_08', 'missing') as string).assertEqual('value-store_gamma-8');
    expect((pref.getSync('key_08', 'missing') as string).length).assertEqual(19);
    await pref.flush();
    expect((pref.getSync('key_08', '') as string).charAt(0)).assertEqual('v');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0025
   * @tc.name      testPrefStore0025
   * @tc.desc      Preference store_delta keeps string key_01
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testPrefStore0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testPrefStore0025', 'store_delta key_01');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'store_delta' });
    pref.putSync('key_01', 'value-store_delta-1');
    expect(pref.hasSync('key_01')).assertTrue();
    expect(pref.getSync('key_01', 'missing') as string).assertEqual('value-store_delta-1');
    expect((pref.getSync('key_01', 'missing') as string).length).assertEqual(19);
    await pref.flush();
    expect((pref.getSync('key_01', '') as string).charAt(0)).assertEqual('v');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0026
   * @tc.name      testPrefStore0026
   * @tc.desc      Preference store_delta keeps string key_02
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testPrefStore0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testPrefStore0026', 'store_delta key_02');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'store_delta' });
    pref.putSync('key_02', 'value-store_delta-2');
    expect(pref.hasSync('key_02')).assertTrue();
    expect(pref.getSync('key_02', 'missing') as string).assertEqual('value-store_delta-2');
    expect((pref.getSync('key_02', 'missing') as string).length).assertEqual(19);
    await pref.flush();
    expect((pref.getSync('key_02', '') as string).charAt(0)).assertEqual('v');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0027
   * @tc.name      testPrefStore0027
   * @tc.desc      Preference store_delta keeps string key_03
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testPrefStore0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testPrefStore0027', 'store_delta key_03');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'store_delta' });
    pref.putSync('key_03', 'value-store_delta-3');
    expect(pref.hasSync('key_03')).assertTrue();
    expect(pref.getSync('key_03', 'missing') as string).assertEqual('value-store_delta-3');
    expect((pref.getSync('key_03', 'missing') as string).length).assertEqual(19);
    await pref.flush();
    expect((pref.getSync('key_03', '') as string).charAt(0)).assertEqual('v');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0028
   * @tc.name      testPrefStore0028
   * @tc.desc      Preference store_delta keeps string key_04
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testPrefStore0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testPrefStore0028', 'store_delta key_04');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'store_delta' });
    pref.putSync('key_04', 'value-store_delta-4');
    expect(pref.hasSync('key_04')).assertTrue();
    expect(pref.getSync('key_04', 'missing') as string).assertEqual('value-store_delta-4');
    expect((pref.getSync('key_04', 'missing') as string).length).assertEqual(19);
    await pref.flush();
    expect((pref.getSync('key_04', '') as string).charAt(0)).assertEqual('v');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0029
   * @tc.name      testPrefStore0029
   * @tc.desc      Preference store_delta keeps string key_05
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testPrefStore0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testPrefStore0029', 'store_delta key_05');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'store_delta' });
    pref.putSync('key_05', 'value-store_delta-5');
    expect(pref.hasSync('key_05')).assertTrue();
    expect(pref.getSync('key_05', 'missing') as string).assertEqual('value-store_delta-5');
    expect((pref.getSync('key_05', 'missing') as string).length).assertEqual(19);
    await pref.flush();
    expect((pref.getSync('key_05', '') as string).charAt(0)).assertEqual('v');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0030
   * @tc.name      testPrefStore0030
   * @tc.desc      Preference store_delta keeps string key_06
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testPrefStore0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testPrefStore0030', 'store_delta key_06');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'store_delta' });
    pref.putSync('key_06', 'value-store_delta-6');
    expect(pref.hasSync('key_06')).assertTrue();
    expect(pref.getSync('key_06', 'missing') as string).assertEqual('value-store_delta-6');
    expect((pref.getSync('key_06', 'missing') as string).length).assertEqual(19);
    await pref.flush();
    expect((pref.getSync('key_06', '') as string).charAt(0)).assertEqual('v');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0031
   * @tc.name      testPrefStore0031
   * @tc.desc      Preference store_delta keeps string key_07
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testPrefStore0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testPrefStore0031', 'store_delta key_07');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'store_delta' });
    pref.putSync('key_07', 'value-store_delta-7');
    expect(pref.hasSync('key_07')).assertTrue();
    expect(pref.getSync('key_07', 'missing') as string).assertEqual('value-store_delta-7');
    expect((pref.getSync('key_07', 'missing') as string).length).assertEqual(19);
    await pref.flush();
    expect((pref.getSync('key_07', '') as string).charAt(0)).assertEqual('v');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0032
   * @tc.name      testPrefStore0032
   * @tc.desc      Preference store_delta keeps string key_08
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testPrefStore0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testPrefStore0032', 'store_delta key_08');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'store_delta' });
    pref.putSync('key_08', 'value-store_delta-8');
    expect(pref.hasSync('key_08')).assertTrue();
    expect(pref.getSync('key_08', 'missing') as string).assertEqual('value-store_delta-8');
    expect((pref.getSync('key_08', 'missing') as string).length).assertEqual(19);
    await pref.flush();
    expect((pref.getSync('key_08', '') as string).charAt(0)).assertEqual('v');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0033
   * @tc.name      testPrefStore0033
   * @tc.desc      Preference typed number round 1
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testPrefStore0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testPrefStore0033', 'number 1');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'typed_store' });
    pref.putSync('num_01', 7);
    expect(pref.hasSync('num_01')).assertTrue();
    expect(pref.getSync('num_01', -1) as number).assertEqual(7);
    await pref.flush();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0034
   * @tc.name      testPrefStore0034
   * @tc.desc      Preference typed number round 2
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testPrefStore0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testPrefStore0034', 'number 2');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'typed_store' });
    pref.putSync('num_02', 14);
    expect(pref.hasSync('num_02')).assertTrue();
    expect(pref.getSync('num_02', -1) as number).assertEqual(14);
    await pref.flush();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0035
   * @tc.name      testPrefStore0035
   * @tc.desc      Preference typed number round 3
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testPrefStore0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testPrefStore0035', 'number 3');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'typed_store' });
    pref.putSync('num_03', 21);
    expect(pref.hasSync('num_03')).assertTrue();
    expect(pref.getSync('num_03', -1) as number).assertEqual(21);
    await pref.flush();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0036
   * @tc.name      testPrefStore0036
   * @tc.desc      Preference typed number round 4
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testPrefStore0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testPrefStore0036', 'number 4');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'typed_store' });
    pref.putSync('num_04', 28);
    expect(pref.hasSync('num_04')).assertTrue();
    expect(pref.getSync('num_04', -1) as number).assertEqual(28);
    await pref.flush();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0037
   * @tc.name      testPrefStore0037
   * @tc.desc      Preference typed number round 5
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testPrefStore0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testPrefStore0037', 'number 5');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'typed_store' });
    pref.putSync('num_05', 35);
    expect(pref.hasSync('num_05')).assertTrue();
    expect(pref.getSync('num_05', -1) as number).assertEqual(35);
    await pref.flush();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0038
   * @tc.name      testPrefStore0038
   * @tc.desc      Preference typed number round 6
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testPrefStore0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testPrefStore0038', 'number 6');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'typed_store' });
    pref.putSync('num_06', 42);
    expect(pref.hasSync('num_06')).assertTrue();
    expect(pref.getSync('num_06', -1) as number).assertEqual(42);
    await pref.flush();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0039
   * @tc.name      testPrefStore0039
   * @tc.desc      Preference typed number round 7
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testPrefStore0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testPrefStore0039', 'number 7');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'typed_store' });
    pref.putSync('num_07', 49);
    expect(pref.hasSync('num_07')).assertTrue();
    expect(pref.getSync('num_07', -1) as number).assertEqual(49);
    await pref.flush();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0040
   * @tc.name      testPrefStore0040
   * @tc.desc      Preference typed number round 8
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testPrefStore0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testPrefStore0040', 'number 8');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'typed_store' });
    pref.putSync('num_08', 56);
    expect(pref.hasSync('num_08')).assertTrue();
    expect(pref.getSync('num_08', -1) as number).assertEqual(56);
    await pref.flush();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0041
   * @tc.name      testPrefStore0041
   * @tc.desc      Preference typed number round 9
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testPrefStore0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testPrefStore0041', 'number 9');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'typed_store' });
    pref.putSync('num_09', 63);
    expect(pref.hasSync('num_09')).assertTrue();
    expect(pref.getSync('num_09', -1) as number).assertEqual(63);
    await pref.flush();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0042
   * @tc.name      testPrefStore0042
   * @tc.desc      Preference typed number round 10
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testPrefStore0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testPrefStore0042', 'number 10');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'typed_store' });
    pref.putSync('num_10', 70);
    expect(pref.hasSync('num_10')).assertTrue();
    expect(pref.getSync('num_10', -1) as number).assertEqual(70);
    await pref.flush();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0043
   * @tc.name      testPrefStore0043
   * @tc.desc      Preference typed number round 11
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testPrefStore0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testPrefStore0043', 'number 11');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'typed_store' });
    pref.putSync('num_11', 77);
    expect(pref.hasSync('num_11')).assertTrue();
    expect(pref.getSync('num_11', -1) as number).assertEqual(77);
    await pref.flush();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0044
   * @tc.name      testPrefStore0044
   * @tc.desc      Preference typed number round 12
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testPrefStore0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testPrefStore0044', 'number 12');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'typed_store' });
    pref.putSync('num_12', 84);
    expect(pref.hasSync('num_12')).assertTrue();
    expect(pref.getSync('num_12', -1) as number).assertEqual(84);
    await pref.flush();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0045
   * @tc.name      testPrefStore0045
   * @tc.desc      Preference typed number round 13
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testPrefStore0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testPrefStore0045', 'number 13');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'typed_store' });
    pref.putSync('num_13', 91);
    expect(pref.hasSync('num_13')).assertTrue();
    expect(pref.getSync('num_13', -1) as number).assertEqual(91);
    await pref.flush();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0046
   * @tc.name      testPrefStore0046
   * @tc.desc      Preference typed number round 14
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testPrefStore0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testPrefStore0046', 'number 14');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'typed_store' });
    pref.putSync('num_14', 98);
    expect(pref.hasSync('num_14')).assertTrue();
    expect(pref.getSync('num_14', -1) as number).assertEqual(98);
    await pref.flush();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0047
   * @tc.name      testPrefStore0047
   * @tc.desc      Preference typed number round 15
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testPrefStore0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testPrefStore0047', 'number 15');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'typed_store' });
    pref.putSync('num_15', 105);
    expect(pref.hasSync('num_15')).assertTrue();
    expect(pref.getSync('num_15', -1) as number).assertEqual(105);
    await pref.flush();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0048
   * @tc.name      testPrefStore0048
   * @tc.desc      Preference typed boolean round 1
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testPrefStore0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testPrefStore0048', 'boolean 1');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'typed_store' });
    pref.putSync('flag_01', false);
    expect(pref.hasSync('flag_01')).assertTrue();
    expect(pref.getSync('flag_01', !false) as boolean).assertEqual(false);
    await pref.flush();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0049
   * @tc.name      testPrefStore0049
   * @tc.desc      Preference typed boolean round 2
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testPrefStore0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testPrefStore0049', 'boolean 2');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'typed_store' });
    pref.putSync('flag_02', true);
    expect(pref.hasSync('flag_02')).assertTrue();
    expect(pref.getSync('flag_02', !true) as boolean).assertEqual(true);
    await pref.flush();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0050
   * @tc.name      testPrefStore0050
   * @tc.desc      Preference typed boolean round 3
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testPrefStore0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testPrefStore0050', 'boolean 3');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'typed_store' });
    pref.putSync('flag_03', false);
    expect(pref.hasSync('flag_03')).assertTrue();
    expect(pref.getSync('flag_03', !false) as boolean).assertEqual(false);
    await pref.flush();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0051
   * @tc.name      testPrefStore0051
   * @tc.desc      Preference typed boolean round 4
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testPrefStore0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testPrefStore0051', 'boolean 4');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'typed_store' });
    pref.putSync('flag_04', true);
    expect(pref.hasSync('flag_04')).assertTrue();
    expect(pref.getSync('flag_04', !true) as boolean).assertEqual(true);
    await pref.flush();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0052
   * @tc.name      testPrefStore0052
   * @tc.desc      Preference typed boolean round 5
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testPrefStore0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testPrefStore0052', 'boolean 5');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'typed_store' });
    pref.putSync('flag_05', false);
    expect(pref.hasSync('flag_05')).assertTrue();
    expect(pref.getSync('flag_05', !false) as boolean).assertEqual(false);
    await pref.flush();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0053
   * @tc.name      testPrefStore0053
   * @tc.desc      Preference typed boolean round 6
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testPrefStore0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testPrefStore0053', 'boolean 6');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'typed_store' });
    pref.putSync('flag_06', true);
    expect(pref.hasSync('flag_06')).assertTrue();
    expect(pref.getSync('flag_06', !true) as boolean).assertEqual(true);
    await pref.flush();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0054
   * @tc.name      testPrefStore0054
   * @tc.desc      Preference typed boolean round 7
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testPrefStore0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testPrefStore0054', 'boolean 7');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'typed_store' });
    pref.putSync('flag_07', false);
    expect(pref.hasSync('flag_07')).assertTrue();
    expect(pref.getSync('flag_07', !false) as boolean).assertEqual(false);
    await pref.flush();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0055
   * @tc.name      testPrefStore0055
   * @tc.desc      Preference typed boolean round 8
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testPrefStore0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testPrefStore0055', 'boolean 8');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'typed_store' });
    pref.putSync('flag_08', true);
    expect(pref.hasSync('flag_08')).assertTrue();
    expect(pref.getSync('flag_08', !true) as boolean).assertEqual(true);
    await pref.flush();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0056
   * @tc.name      testPrefStore0056
   * @tc.desc      Preference typed boolean round 9
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testPrefStore0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testPrefStore0056', 'boolean 9');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'typed_store' });
    pref.putSync('flag_09', false);
    expect(pref.hasSync('flag_09')).assertTrue();
    expect(pref.getSync('flag_09', !false) as boolean).assertEqual(false);
    await pref.flush();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0057
   * @tc.name      testPrefStore0057
   * @tc.desc      Preference typed boolean round 10
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testPrefStore0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testPrefStore0057', 'boolean 10');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'typed_store' });
    pref.putSync('flag_10', true);
    expect(pref.hasSync('flag_10')).assertTrue();
    expect(pref.getSync('flag_10', !true) as boolean).assertEqual(true);
    await pref.flush();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0058
   * @tc.name      testPrefStore0058
   * @tc.desc      Preference typed boolean round 11
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testPrefStore0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testPrefStore0058', 'boolean 11');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'typed_store' });
    pref.putSync('flag_11', false);
    expect(pref.hasSync('flag_11')).assertTrue();
    expect(pref.getSync('flag_11', !false) as boolean).assertEqual(false);
    await pref.flush();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0059
   * @tc.name      testPrefStore0059
   * @tc.desc      Preference typed boolean round 12
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testPrefStore0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testPrefStore0059', 'boolean 12');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'typed_store' });
    pref.putSync('flag_12', true);
    expect(pref.hasSync('flag_12')).assertTrue();
    expect(pref.getSync('flag_12', !true) as boolean).assertEqual(true);
    await pref.flush();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0060
   * @tc.name      testPrefStore0060
   * @tc.desc      Preference typed boolean round 13
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testPrefStore0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testPrefStore0060', 'boolean 13');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'typed_store' });
    pref.putSync('flag_13', false);
    expect(pref.hasSync('flag_13')).assertTrue();
    expect(pref.getSync('flag_13', !false) as boolean).assertEqual(false);
    await pref.flush();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0061
   * @tc.name      testPrefStore0061
   * @tc.desc      Preference typed boolean round 14
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testPrefStore0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testPrefStore0061', 'boolean 14');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'typed_store' });
    pref.putSync('flag_14', true);
    expect(pref.hasSync('flag_14')).assertTrue();
    expect(pref.getSync('flag_14', !true) as boolean).assertEqual(true);
    await pref.flush();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0062
   * @tc.name      testPrefStore0062
   * @tc.desc      Preference typed boolean round 15
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testPrefStore0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testPrefStore0062', 'boolean 15');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'typed_store' });
    pref.putSync('flag_15', false);
    expect(pref.hasSync('flag_15')).assertTrue();
    expect(pref.getSync('flag_15', !false) as boolean).assertEqual(false);
    await pref.flush();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0063
   * @tc.name      testPrefStore0063
   * @tc.desc      Preference typed strings round 1
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testPrefStore0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testPrefStore0063', 'strings 1');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'typed_store' });
    pref.putSync('list_01', ['item-1', 'item-2']);
    expect(pref.hasSync('list_01')).assertTrue();
    const list_01: Array<string> = pref.getSync('list_01', []) as Array<string>;
    expect(list_01.length).assertEqual(2);
    await pref.flush();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0064
   * @tc.name      testPrefStore0064
   * @tc.desc      Preference typed strings round 2
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testPrefStore0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testPrefStore0064', 'strings 2');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'typed_store' });
    pref.putSync('list_02', ['item-1', 'item-2', 'item-3']);
    expect(pref.hasSync('list_02')).assertTrue();
    const list_02: Array<string> = pref.getSync('list_02', []) as Array<string>;
    expect(list_02.length).assertEqual(3);
    await pref.flush();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0065
   * @tc.name      testPrefStore0065
   * @tc.desc      Preference typed strings round 3
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testPrefStore0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testPrefStore0065', 'strings 3');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'typed_store' });
    pref.putSync('list_03', ['item-1', 'item-2', 'item-3', 'item-4']);
    expect(pref.hasSync('list_03')).assertTrue();
    const list_03: Array<string> = pref.getSync('list_03', []) as Array<string>;
    expect(list_03.length).assertEqual(4);
    await pref.flush();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0066
   * @tc.name      testPrefStore0066
   * @tc.desc      Preference typed strings round 4
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testPrefStore0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testPrefStore0066', 'strings 4');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'typed_store' });
    pref.putSync('list_04', ['item-1', 'item-2', 'item-3', 'item-4', 'item-5']);
    expect(pref.hasSync('list_04')).assertTrue();
    const list_04: Array<string> = pref.getSync('list_04', []) as Array<string>;
    expect(list_04.length).assertEqual(5);
    await pref.flush();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0067
   * @tc.name      testPrefStore0067
   * @tc.desc      Preference typed strings round 5
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testPrefStore0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testPrefStore0067', 'strings 5');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'typed_store' });
    pref.putSync('list_05', ['item-1']);
    expect(pref.hasSync('list_05')).assertTrue();
    const list_05: Array<string> = pref.getSync('list_05', []) as Array<string>;
    expect(list_05.length).assertEqual(1);
    await pref.flush();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0068
   * @tc.name      testPrefStore0068
   * @tc.desc      Preference typed strings round 6
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testPrefStore0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testPrefStore0068', 'strings 6');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'typed_store' });
    pref.putSync('list_06', ['item-1', 'item-2']);
    expect(pref.hasSync('list_06')).assertTrue();
    const list_06: Array<string> = pref.getSync('list_06', []) as Array<string>;
    expect(list_06.length).assertEqual(2);
    await pref.flush();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0069
   * @tc.name      testPrefStore0069
   * @tc.desc      Preference typed strings round 7
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testPrefStore0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testPrefStore0069', 'strings 7');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'typed_store' });
    pref.putSync('list_07', ['item-1', 'item-2', 'item-3']);
    expect(pref.hasSync('list_07')).assertTrue();
    const list_07: Array<string> = pref.getSync('list_07', []) as Array<string>;
    expect(list_07.length).assertEqual(3);
    await pref.flush();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0070
   * @tc.name      testPrefStore0070
   * @tc.desc      Preference typed strings round 8
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testPrefStore0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testPrefStore0070', 'strings 8');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'typed_store' });
    pref.putSync('list_08', ['item-1', 'item-2', 'item-3', 'item-4']);
    expect(pref.hasSync('list_08')).assertTrue();
    const list_08: Array<string> = pref.getSync('list_08', []) as Array<string>;
    expect(list_08.length).assertEqual(4);
    await pref.flush();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0071
   * @tc.name      testPrefStore0071
   * @tc.desc      Preference typed strings round 9
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testPrefStore0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testPrefStore0071', 'strings 9');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'typed_store' });
    pref.putSync('list_09', ['item-1', 'item-2', 'item-3', 'item-4', 'item-5']);
    expect(pref.hasSync('list_09')).assertTrue();
    const list_09: Array<string> = pref.getSync('list_09', []) as Array<string>;
    expect(list_09.length).assertEqual(5);
    await pref.flush();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0072
   * @tc.name      testPrefStore0072
   * @tc.desc      Preference typed strings round 10
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testPrefStore0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testPrefStore0072', 'strings 10');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'typed_store' });
    pref.putSync('list_10', ['item-1']);
    expect(pref.hasSync('list_10')).assertTrue();
    const list_10: Array<string> = pref.getSync('list_10', []) as Array<string>;
    expect(list_10.length).assertEqual(1);
    await pref.flush();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0073
   * @tc.name      testPrefStore0073
   * @tc.desc      Preference typed strings round 11
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testPrefStore0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testPrefStore0073', 'strings 11');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'typed_store' });
    pref.putSync('list_11', ['item-1', 'item-2']);
    expect(pref.hasSync('list_11')).assertTrue();
    const list_11: Array<string> = pref.getSync('list_11', []) as Array<string>;
    expect(list_11.length).assertEqual(2);
    await pref.flush();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0074
   * @tc.name      testPrefStore0074
   * @tc.desc      Preference typed strings round 12
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testPrefStore0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testPrefStore0074', 'strings 12');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'typed_store' });
    pref.putSync('list_12', ['item-1', 'item-2', 'item-3']);
    expect(pref.hasSync('list_12')).assertTrue();
    const list_12: Array<string> = pref.getSync('list_12', []) as Array<string>;
    expect(list_12.length).assertEqual(3);
    await pref.flush();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0075
   * @tc.name      testPrefStore0075
   * @tc.desc      Preference typed strings round 13
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testPrefStore0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testPrefStore0075', 'strings 13');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'typed_store' });
    pref.putSync('list_13', ['item-1', 'item-2', 'item-3', 'item-4']);
    expect(pref.hasSync('list_13')).assertTrue();
    const list_13: Array<string> = pref.getSync('list_13', []) as Array<string>;
    expect(list_13.length).assertEqual(4);
    await pref.flush();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0076
   * @tc.name      testPrefStore0076
   * @tc.desc      Preference typed strings round 14
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testPrefStore0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testPrefStore0076', 'strings 14');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'typed_store' });
    pref.putSync('list_14', ['item-1', 'item-2', 'item-3', 'item-4', 'item-5']);
    expect(pref.hasSync('list_14')).assertTrue();
    const list_14: Array<string> = pref.getSync('list_14', []) as Array<string>;
    expect(list_14.length).assertEqual(5);
    await pref.flush();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0077
   * @tc.name      testPrefStore0077
   * @tc.desc      Preference typed strings round 15
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testPrefStore0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testPrefStore0077', 'strings 15');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'typed_store' });
    pref.putSync('list_15', ['item-1']);
    expect(pref.hasSync('list_15')).assertTrue();
    const list_15: Array<string> = pref.getSync('list_15', []) as Array<string>;
    expect(list_15.length).assertEqual(1);
    await pref.flush();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0078
   * @tc.name      testPrefStore0078
   * @tc.desc      Preference absent key 1 falls back
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testPrefStore0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testPrefStore0078', 'default 1');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'default_store' });
    const absent: string = 'absent_01';
    pref.deleteSync(absent);
    expect(pref.hasSync(absent)).assertFalse();
    expect(pref.getSync(absent, 'fallback-1') as string).assertEqual('fallback-1');
    expect((pref.getSync(absent, 'fallback-1') as string).endsWith('1')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0079
   * @tc.name      testPrefStore0079
   * @tc.desc      Preference absent key 2 falls back
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testPrefStore0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testPrefStore0079', 'default 2');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'default_store' });
    const absent: string = 'absent_02';
    pref.deleteSync(absent);
    expect(pref.hasSync(absent)).assertFalse();
    expect(pref.getSync(absent, 'fallback-2') as string).assertEqual('fallback-2');
    expect((pref.getSync(absent, 'fallback-2') as string).endsWith('2')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0080
   * @tc.name      testPrefStore0080
   * @tc.desc      Preference absent key 3 falls back
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testPrefStore0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testPrefStore0080', 'default 3');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'default_store' });
    const absent: string = 'absent_03';
    pref.deleteSync(absent);
    expect(pref.hasSync(absent)).assertFalse();
    expect(pref.getSync(absent, 'fallback-3') as string).assertEqual('fallback-3');
    expect((pref.getSync(absent, 'fallback-3') as string).endsWith('3')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0081
   * @tc.name      testPrefStore0081
   * @tc.desc      Preference absent key 4 falls back
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testPrefStore0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testPrefStore0081', 'default 4');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'default_store' });
    const absent: string = 'absent_04';
    pref.deleteSync(absent);
    expect(pref.hasSync(absent)).assertFalse();
    expect(pref.getSync(absent, 'fallback-4') as string).assertEqual('fallback-4');
    expect((pref.getSync(absent, 'fallback-4') as string).endsWith('4')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0082
   * @tc.name      testPrefStore0082
   * @tc.desc      Preference absent key 5 falls back
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testPrefStore0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testPrefStore0082', 'default 5');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'default_store' });
    const absent: string = 'absent_05';
    pref.deleteSync(absent);
    expect(pref.hasSync(absent)).assertFalse();
    expect(pref.getSync(absent, 'fallback-5') as string).assertEqual('fallback-5');
    expect((pref.getSync(absent, 'fallback-5') as string).endsWith('5')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0083
   * @tc.name      testPrefStore0083
   * @tc.desc      Preference absent key 6 falls back
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testPrefStore0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testPrefStore0083', 'default 6');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'default_store' });
    const absent: string = 'absent_06';
    pref.deleteSync(absent);
    expect(pref.hasSync(absent)).assertFalse();
    expect(pref.getSync(absent, 'fallback-6') as string).assertEqual('fallback-6');
    expect((pref.getSync(absent, 'fallback-6') as string).endsWith('6')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0084
   * @tc.name      testPrefStore0084
   * @tc.desc      Preference absent key 7 falls back
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testPrefStore0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testPrefStore0084', 'default 7');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'default_store' });
    const absent: string = 'absent_07';
    pref.deleteSync(absent);
    expect(pref.hasSync(absent)).assertFalse();
    expect(pref.getSync(absent, 'fallback-7') as string).assertEqual('fallback-7');
    expect((pref.getSync(absent, 'fallback-7') as string).endsWith('7')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0085
   * @tc.name      testPrefStore0085
   * @tc.desc      Preference absent key 8 falls back
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testPrefStore0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testPrefStore0085', 'default 8');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'default_store' });
    const absent: string = 'absent_08';
    pref.deleteSync(absent);
    expect(pref.hasSync(absent)).assertFalse();
    expect(pref.getSync(absent, 'fallback-8') as string).assertEqual('fallback-8');
    expect((pref.getSync(absent, 'fallback-8') as string).endsWith('8')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0086
   * @tc.name      testPrefStore0086
   * @tc.desc      Preference absent key 9 falls back
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testPrefStore0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testPrefStore0086', 'default 9');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'default_store' });
    const absent: string = 'absent_09';
    pref.deleteSync(absent);
    expect(pref.hasSync(absent)).assertFalse();
    expect(pref.getSync(absent, 'fallback-9') as string).assertEqual('fallback-9');
    expect((pref.getSync(absent, 'fallback-9') as string).endsWith('9')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0087
   * @tc.name      testPrefStore0087
   * @tc.desc      Preference absent key 10 falls back
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testPrefStore0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testPrefStore0087', 'default 10');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'default_store' });
    const absent: string = 'absent_10';
    pref.deleteSync(absent);
    expect(pref.hasSync(absent)).assertFalse();
    expect(pref.getSync(absent, 'fallback-10') as string).assertEqual('fallback-10');
    expect((pref.getSync(absent, 'fallback-10') as string).endsWith('10')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0088
   * @tc.name      testPrefStore0088
   * @tc.desc      Preference absent key 11 falls back
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testPrefStore0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testPrefStore0088', 'default 11');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'default_store' });
    const absent: string = 'absent_11';
    pref.deleteSync(absent);
    expect(pref.hasSync(absent)).assertFalse();
    expect(pref.getSync(absent, 'fallback-11') as string).assertEqual('fallback-11');
    expect((pref.getSync(absent, 'fallback-11') as string).endsWith('11')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0089
   * @tc.name      testPrefStore0089
   * @tc.desc      Preference absent key 12 falls back
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testPrefStore0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testPrefStore0089', 'default 12');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'default_store' });
    const absent: string = 'absent_12';
    pref.deleteSync(absent);
    expect(pref.hasSync(absent)).assertFalse();
    expect(pref.getSync(absent, 'fallback-12') as string).assertEqual('fallback-12');
    expect((pref.getSync(absent, 'fallback-12') as string).endsWith('12')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0090
   * @tc.name      testPrefStore0090
   * @tc.desc      Preference absent key 13 falls back
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testPrefStore0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testPrefStore0090', 'default 13');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'default_store' });
    const absent: string = 'absent_13';
    pref.deleteSync(absent);
    expect(pref.hasSync(absent)).assertFalse();
    expect(pref.getSync(absent, 'fallback-13') as string).assertEqual('fallback-13');
    expect((pref.getSync(absent, 'fallback-13') as string).endsWith('13')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0091
   * @tc.name      testPrefStore0091
   * @tc.desc      Preference absent key 14 falls back
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testPrefStore0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testPrefStore0091', 'default 14');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'default_store' });
    const absent: string = 'absent_14';
    pref.deleteSync(absent);
    expect(pref.hasSync(absent)).assertFalse();
    expect(pref.getSync(absent, 'fallback-14') as string).assertEqual('fallback-14');
    expect((pref.getSync(absent, 'fallback-14') as string).endsWith('14')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0092
   * @tc.name      testPrefStore0092
   * @tc.desc      Preference absent key 15 falls back
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testPrefStore0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testPrefStore0092', 'default 15');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'default_store' });
    const absent: string = 'absent_15';
    pref.deleteSync(absent);
    expect(pref.hasSync(absent)).assertFalse();
    expect(pref.getSync(absent, 'fallback-15') as string).assertEqual('fallback-15');
    expect((pref.getSync(absent, 'fallback-15') as string).endsWith('15')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0093
   * @tc.name      testPrefStore0093
   * @tc.desc      Preference absent key 16 falls back
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testPrefStore0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testPrefStore0093', 'default 16');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'default_store' });
    const absent: string = 'absent_16';
    pref.deleteSync(absent);
    expect(pref.hasSync(absent)).assertFalse();
    expect(pref.getSync(absent, 'fallback-16') as string).assertEqual('fallback-16');
    expect((pref.getSync(absent, 'fallback-16') as string).endsWith('16')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0094
   * @tc.name      testPrefStore0094
   * @tc.desc      Preference absent key 17 falls back
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testPrefStore0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testPrefStore0094', 'default 17');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'default_store' });
    const absent: string = 'absent_17';
    pref.deleteSync(absent);
    expect(pref.hasSync(absent)).assertFalse();
    expect(pref.getSync(absent, 'fallback-17') as string).assertEqual('fallback-17');
    expect((pref.getSync(absent, 'fallback-17') as string).endsWith('17')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0095
   * @tc.name      testPrefStore0095
   * @tc.desc      Preference absent key 18 falls back
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testPrefStore0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testPrefStore0095', 'default 18');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'default_store' });
    const absent: string = 'absent_18';
    pref.deleteSync(absent);
    expect(pref.hasSync(absent)).assertFalse();
    expect(pref.getSync(absent, 'fallback-18') as string).assertEqual('fallback-18');
    expect((pref.getSync(absent, 'fallback-18') as string).endsWith('18')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0096
   * @tc.name      testPrefStore0096
   * @tc.desc      Preference absent key 19 falls back
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testPrefStore0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testPrefStore0096', 'default 19');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'default_store' });
    const absent: string = 'absent_19';
    pref.deleteSync(absent);
    expect(pref.hasSync(absent)).assertFalse();
    expect(pref.getSync(absent, 'fallback-19') as string).assertEqual('fallback-19');
    expect((pref.getSync(absent, 'fallback-19') as string).endsWith('19')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0097
   * @tc.name      testPrefStore0097
   * @tc.desc      Preference absent key 20 falls back
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testPrefStore0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testPrefStore0097', 'default 20');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'default_store' });
    const absent: string = 'absent_20';
    pref.deleteSync(absent);
    expect(pref.hasSync(absent)).assertFalse();
    expect(pref.getSync(absent, 'fallback-20') as string).assertEqual('fallback-20');
    expect((pref.getSync(absent, 'fallback-20') as string).endsWith('20')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0098
   * @tc.name      testPrefStore0098
   * @tc.desc      Preference overwrite pass 1
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testPrefStore0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testPrefStore0098', 'overwrite 1');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'overwrite_store' });
    pref.putSync('slot_01', 'first-1');
    expect(pref.getSync('slot_01', '') as string).assertEqual('first-1');
    pref.putSync('slot_01', 'second-1');
    expect(pref.getSync('slot_01', '') as string).assertEqual('second-1');
    await pref.flush();
    pref.deleteSync('slot_01');
    expect(pref.hasSync('slot_01')).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0099
   * @tc.name      testPrefStore0099
   * @tc.desc      Preference overwrite pass 2
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testPrefStore0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testPrefStore0099', 'overwrite 2');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'overwrite_store' });
    pref.putSync('slot_02', 'first-2');
    expect(pref.getSync('slot_02', '') as string).assertEqual('first-2');
    pref.putSync('slot_02', 'second-2');
    expect(pref.getSync('slot_02', '') as string).assertEqual('second-2');
    await pref.flush();
    pref.deleteSync('slot_02');
    expect(pref.hasSync('slot_02')).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0100
   * @tc.name      testPrefStore0100
   * @tc.desc      Preference overwrite pass 3
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testPrefStore0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testPrefStore0100', 'overwrite 3');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'overwrite_store' });
    pref.putSync('slot_03', 'first-3');
    expect(pref.getSync('slot_03', '') as string).assertEqual('first-3');
    pref.putSync('slot_03', 'second-3');
    expect(pref.getSync('slot_03', '') as string).assertEqual('second-3');
    await pref.flush();
    pref.deleteSync('slot_03');
    expect(pref.hasSync('slot_03')).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_PREF_0101
   * @tc.name      testPrefStore0101
   * @tc.desc      Preference overwrite pass 4
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testPrefStore0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testPrefStore0101', 'overwrite 4');
    const context: common.Context = entryContext();
    const pref: preferences.Preferences = preferences.getPreferencesSync(context, { name: 'overwrite_store' });
    pref.putSync('slot_04', 'first-4');
    expect(pref.getSync('slot_04', '') as string).assertEqual('first-4');
    pref.putSync('slot_04', 'second-4');
    expect(pref.getSync('slot_04', '') as string).assertEqual('second-4');
    await pref.flush();
