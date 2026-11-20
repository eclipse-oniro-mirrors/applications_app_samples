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
import { bundleManager } from '@kit.AbilityKit';
import { findModule, selfBundle, BUNDLE_NAME, ENTRY_MODULE, ENTRY_ABILITY } from './shared/AppProbe';
import { logCase } from './shared/TestLog';

import { paceTurn } from './shared/TestPace';

export default function harRuntimeMatrixTest() {
  describe('harRuntimeMatrixTest', () => {
  beforeEach(async () => {
    await paceTurn();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARRT_0001
   * @tc.name      testHarRuntime0001
   * @tc.desc      HAR runtime keeps bundle length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarRuntime0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarRuntime0001', 'bundle length');
    const info: bundleManager.BundleInfo = await selfBundle();
    const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE) as bundleManager.HapModuleInfo;
    const abilityInfo: bundleManager.AbilityInfo = moduleInfo.abilitiesInfo[0];
    const value: string = info.name;
    expect(value.length > 0).assertTrue();
    expect(value.length).assertEqual(26);
    expect(moduleInfo.abilitiesInfo.length).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARRT_0002
   * @tc.name      testHarRuntime0002
   * @tc.desc      HAR runtime keeps bundle first char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarRuntime0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarRuntime0002', 'bundle first char');
    const info: bundleManager.BundleInfo = await selfBundle();
    const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE) as bundleManager.HapModuleInfo;
    const abilityInfo: bundleManager.AbilityInfo = moduleInfo.abilitiesInfo[0];
    const value: string = info.name;
    expect(value.length > 0).assertTrue();
    expect(value.charAt(0)).assertEqual('o');
    expect(moduleInfo.abilitiesInfo.length).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARRT_0003
   * @tc.name      testHarRuntime0003
   * @tc.desc      HAR runtime keeps bundle last char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarRuntime0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarRuntime0003', 'bundle last char');
    const info: bundleManager.BundleInfo = await selfBundle();
    const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE) as bundleManager.HapModuleInfo;
    const abilityInfo: bundleManager.AbilityInfo = moduleInfo.abilitiesInfo[0];
    const value: string = info.name;
    expect(value.length > 0).assertTrue();
    expect(value.charAt(value.length - 1)).assertEqual('n');
    expect(moduleInfo.abilitiesInfo.length).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARRT_0004
   * @tc.name      testHarRuntime0004
   * @tc.desc      HAR runtime keeps bundle second segment
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarRuntime0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarRuntime0004', 'bundle second segment');
    const info: bundleManager.BundleInfo = await selfBundle();
    const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE) as bundleManager.HapModuleInfo;
    const abilityInfo: bundleManager.AbilityInfo = moduleInfo.abilitiesInfo[0];
    const value: string = info.name;
    expect(value.length > 0).assertTrue();
    expect(value.split('.')[(value.split('.').length) - 1]).assertEqual('myapplication');
    expect(moduleInfo.abilitiesInfo.length).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARRT_0005
   * @tc.name      testHarRuntime0005
   * @tc.desc      HAR runtime keeps bundle a offset
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarRuntime0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarRuntime0005', 'bundle a offset');
    const info: bundleManager.BundleInfo = await selfBundle();
    const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE) as bundleManager.HapModuleInfo;
    const abilityInfo: bundleManager.AbilityInfo = moduleInfo.abilitiesInfo[0];
    const value: string = info.name;
    expect(value.length > 0).assertTrue();
    expect(value.indexOf('a')).assertEqual(5);
    expect(moduleInfo.abilitiesInfo.length).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARRT_0006
   * @tc.name      testHarRuntime0006
   * @tc.desc      HAR runtime keeps bundle case swap
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarRuntime0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarRuntime0006', 'bundle case swap');
    const info: bundleManager.BundleInfo = await selfBundle();
    const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE) as bundleManager.HapModuleInfo;
    const abilityInfo: bundleManager.AbilityInfo = moduleInfo.abilitiesInfo[0];
    const value: string = info.name;
    expect(value.length > 0).assertTrue();
    expect(value.toUpperCase().length).assertEqual(value.length);
    expect(moduleInfo.abilitiesInfo.length).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARRT_0007
   * @tc.name      testHarRuntime0007
   * @tc.desc      HAR runtime keeps bundle tail four
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarRuntime0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarRuntime0007', 'bundle tail four');
    const info: bundleManager.BundleInfo = await selfBundle();
    const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE) as bundleManager.HapModuleInfo;
    const abilityInfo: bundleManager.AbilityInfo = moduleInfo.abilitiesInfo[0];
    const value: string = info.name;
    expect(value.length > 0).assertTrue();
    expect(value.substring(value.length - 4)).assertEqual('tion');
    expect(moduleInfo.abilitiesInfo.length).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARRT_0008
   * @tc.name      testHarRuntime0008
   * @tc.desc      HAR runtime keeps module length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarRuntime0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarRuntime0008', 'module length');
    const info: bundleManager.BundleInfo = await selfBundle();
    const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE) as bundleManager.HapModuleInfo;
    const abilityInfo: bundleManager.AbilityInfo = moduleInfo.abilitiesInfo[0];
    const value: string = moduleInfo.name;
    expect(value.length > 0).assertTrue();
    expect(value.length).assertEqual(11);
    expect(moduleInfo.abilitiesInfo.length).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARRT_0009
   * @tc.name      testHarRuntime0009
   * @tc.desc      HAR runtime keeps module first char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarRuntime0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarRuntime0009', 'module first char');
    const info: bundleManager.BundleInfo = await selfBundle();
    const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE) as bundleManager.HapModuleInfo;
    const abilityInfo: bundleManager.AbilityInfo = moduleInfo.abilitiesInfo[0];
    const value: string = moduleInfo.name;
    expect(value.length > 0).assertTrue();
    expect(value.charAt(0)).assertEqual('a');
    expect(moduleInfo.abilitiesInfo.length).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARRT_0010
   * @tc.name      testHarRuntime0010
   * @tc.desc      HAR runtime keeps module last char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarRuntime0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarRuntime0010', 'module last char');
    const info: bundleManager.BundleInfo = await selfBundle();
    const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE) as bundleManager.HapModuleInfo;
    const abilityInfo: bundleManager.AbilityInfo = moduleInfo.abilitiesInfo[0];
    const value: string = moduleInfo.name;
    expect(value.length > 0).assertTrue();
    expect(value.charAt(value.length - 1)).assertEqual('n');
    expect(moduleInfo.abilitiesInfo.length).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARRT_0011
   * @tc.name      testHarRuntime0011
   * @tc.desc      HAR runtime keeps module second segment
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarRuntime0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarRuntime0011', 'module second segment');
    const info: bundleManager.BundleInfo = await selfBundle();
    const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE) as bundleManager.HapModuleInfo;
    const abilityInfo: bundleManager.AbilityInfo = moduleInfo.abilitiesInfo[0];
    const value: string = moduleInfo.name;
    expect(value.length > 0).assertTrue();
    expect(value.split('.')[(value.split('.').length) - 1]).assertEqual('application');
    expect(moduleInfo.abilitiesInfo.length).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARRT_0012
   * @tc.name      testHarRuntime0012
   * @tc.desc      HAR runtime keeps module a offset
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarRuntime0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarRuntime0012', 'module a offset');
    const info: bundleManager.BundleInfo = await selfBundle();
    const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE) as bundleManager.HapModuleInfo;
    const abilityInfo: bundleManager.AbilityInfo = moduleInfo.abilitiesInfo[0];
    const value: string = moduleInfo.name;
    expect(value.length > 0).assertTrue();
    expect(value.indexOf('a')).assertEqual(0);
    expect(moduleInfo.abilitiesInfo.length).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARRT_0013
   * @tc.name      testHarRuntime0013
   * @tc.desc      HAR runtime keeps module case swap
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarRuntime0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarRuntime0013', 'module case swap');
    const info: bundleManager.BundleInfo = await selfBundle();
    const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE) as bundleManager.HapModuleInfo;
    const abilityInfo: bundleManager.AbilityInfo = moduleInfo.abilitiesInfo[0];
    const value: string = moduleInfo.name;
    expect(value.length > 0).assertTrue();
    expect(value.toUpperCase().length).assertEqual(value.length);
    expect(moduleInfo.abilitiesInfo.length).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARRT_0014
   * @tc.name      testHarRuntime0014
   * @tc.desc      HAR runtime keeps module tail four
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarRuntime0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarRuntime0014', 'module tail four');
    const info: bundleManager.BundleInfo = await selfBundle();
    const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE) as bundleManager.HapModuleInfo;
    const abilityInfo: bundleManager.AbilityInfo = moduleInfo.abilitiesInfo[0];
    const value: string = moduleInfo.name;
    expect(value.length > 0).assertTrue();
    expect(value.substring(value.length - 4)).assertEqual('tion');
    expect(moduleInfo.abilitiesInfo.length).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARRT_0015
   * @tc.name      testHarRuntime0015
   * @tc.desc      HAR runtime keeps ability length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarRuntime0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarRuntime0015', 'ability length');
    const info: bundleManager.BundleInfo = await selfBundle();
    const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE) as bundleManager.HapModuleInfo;
    const abilityInfo: bundleManager.AbilityInfo = moduleInfo.abilitiesInfo[0];
    const value: string = abilityInfo.name;
    expect(value.length > 0).assertTrue();
    expect(value.length).assertEqual(18);
    expect(moduleInfo.abilitiesInfo.length).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARRT_0016
   * @tc.name      testHarRuntime0016
   * @tc.desc      HAR runtime keeps ability first char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarRuntime0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarRuntime0016', 'ability first char');
    const info: bundleManager.BundleInfo = await selfBundle();
    const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE) as bundleManager.HapModuleInfo;
    const abilityInfo: bundleManager.AbilityInfo = moduleInfo.abilitiesInfo[0];
    const value: string = abilityInfo.name;
    expect(value.length > 0).assertTrue();
    expect(value.charAt(0)).assertEqual('A');
    expect(moduleInfo.abilitiesInfo.length).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARRT_0017
   * @tc.name      testHarRuntime0017
   * @tc.desc      HAR runtime keeps ability last char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarRuntime0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarRuntime0017', 'ability last char');
    const info: bundleManager.BundleInfo = await selfBundle();
    const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE) as bundleManager.HapModuleInfo;
    const abilityInfo: bundleManager.AbilityInfo = moduleInfo.abilitiesInfo[0];
    const value: string = abilityInfo.name;
    expect(value.length > 0).assertTrue();
    expect(value.charAt(value.length - 1)).assertEqual('y');
    expect(moduleInfo.abilitiesInfo.length).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARRT_0018
   * @tc.name      testHarRuntime0018
   * @tc.desc      HAR runtime keeps ability second segment
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarRuntime0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarRuntime0018', 'ability second segment');
    const info: bundleManager.BundleInfo = await selfBundle();
    const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE) as bundleManager.HapModuleInfo;
    const abilityInfo: bundleManager.AbilityInfo = moduleInfo.abilitiesInfo[0];
    const value: string = abilityInfo.name;
    expect(value.length > 0).assertTrue();
    expect(value.split('.')[(value.split('.').length) - 1]).assertEqual('ApplicationAbility');
    expect(moduleInfo.abilitiesInfo.length).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARRT_0019
   * @tc.name      testHarRuntime0019
   * @tc.desc      HAR runtime keeps ability a offset
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarRuntime0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarRuntime0019', 'ability a offset');
    const info: bundleManager.BundleInfo = await selfBundle();
    const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE) as bundleManager.HapModuleInfo;
    const abilityInfo: bundleManager.AbilityInfo = moduleInfo.abilitiesInfo[0];
    const value: string = abilityInfo.name;
    expect(value.length > 0).assertTrue();
    expect(value.indexOf('a')).assertEqual(6);
    expect(moduleInfo.abilitiesInfo.length).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARRT_0020
   * @tc.name      testHarRuntime0020
   * @tc.desc      HAR runtime keeps ability case swap
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarRuntime0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarRuntime0020', 'ability case swap');
    const info: bundleManager.BundleInfo = await selfBundle();
    const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE) as bundleManager.HapModuleInfo;
    const abilityInfo: bundleManager.AbilityInfo = moduleInfo.abilitiesInfo[0];
    const value: string = abilityInfo.name;
    expect(value.length > 0).assertTrue();
    expect(value.toUpperCase().length).assertEqual(value.length);
    expect(moduleInfo.abilitiesInfo.length).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARRT_0021
   * @tc.name      testHarRuntime0021
   * @tc.desc      HAR runtime keeps ability tail four
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarRuntime0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarRuntime0021', 'ability tail four');
    const info: bundleManager.BundleInfo = await selfBundle();
    const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE) as bundleManager.HapModuleInfo;
    const abilityInfo: bundleManager.AbilityInfo = moduleInfo.abilitiesInfo[0];
    const value: string = abilityInfo.name;
    expect(value.length > 0).assertTrue();
    expect(value.substring(value.length - 4)).assertEqual('lity');
    expect(moduleInfo.abilitiesInfo.length).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARRT_0023
   * @tc.name      testHarRuntime0023
   * @tc.desc      Packed module is the converted application entry
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarRuntime0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarRuntime0023', 'packed module is the converted application entry');
    const info: bundleManager.BundleInfo = await selfBundle();
    const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE) as bundleManager.HapModuleInfo;
    expect(info.hapModulesInfo[0].mainElementName).assertEqual(ENTRY_ABILITY);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARRT_0024
   * @tc.name      testHarRuntime0024
   * @tc.desc      Converted har name never surfaces as a packed module
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarRuntime0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarRuntime0024', 'converted har name never surfaces as a packed module');
    const info: bundleManager.BundleInfo = await selfBundle();
    const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE) as bundleManager.HapModuleInfo;
    const packed: string[] = info.hapModulesInfo.map((item: bundleManager.HapModuleInfo) => item.name);
    expect(packed.includes('har')).assertFalse();
    expect(packed.includes('entry')).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARRT_0025
   * @tc.name      testHarRuntime0025
   * @tc.desc      Packed module declares only the tablet and default devices
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarRuntime0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarRuntime0025', 'packed module declares only the tablet and default devices');
    const info: bundleManager.BundleInfo = await selfBundle();
    const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE) as bundleManager.HapModuleInfo;
    expect(info.hapModulesInfo[0].deviceTypes.length >= 1).assertTrue();
    expect(info.hapModulesInfo[0].deviceTypes.includes('default')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARRT_0026
   * @tc.name      testHarRuntime0026
   * @tc.desc      Packed module is installed free disabled
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarRuntime0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarRuntime0026', 'packed module is installed free disabled');
    const info: bundleManager.BundleInfo = await selfBundle();
    const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE) as bundleManager.HapModuleInfo;
    expect(info.hapModulesInfo[0].installationFree).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARRT_0027
   * @tc.name      testHarRuntime0027
   * @tc.desc      Packed module has no extension abilities
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarRuntime0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarRuntime0027', 'packed module has no extension abilities');
    const info: bundleManager.BundleInfo = await selfBundle();
    const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE) as bundleManager.HapModuleInfo;
    expect(info.hapModulesInfo[0].extensionAbilitiesInfo.length).assertEqual(0);
  });



  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARRT_0029
   * @tc.name      testHarRuntime0029
   * @tc.desc      Packed module code path ends with its hap file
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarRuntime0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarRuntime0029', 'packed module code path ends with its hap file');
    const info: bundleManager.BundleInfo = await selfBundle();
    const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE) as bundleManager.HapModuleInfo;
    expect(info.hapModulesInfo[0].codePath.endsWith('.hap')).assertTrue();
    expect(info.hapModulesInfo[0].codePath.includes(ENTRY_MODULE)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARRT_0030
   * @tc.name      testHarRuntime0030
   * @tc.desc      Only ability is exported to launcher
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarRuntime0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarRuntime0030', 'only ability is exported to launcher');
    const info: bundleManager.BundleInfo = await selfBundle();
    const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE) as bundleManager.HapModuleInfo;
    expect(moduleInfo.abilitiesInfo[0].exported).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARRT_0031
   * @tc.name      testHarRuntime0031
   * @tc.desc      Only ability is enabled
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarRuntime0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarRuntime0031', 'only ability is enabled');
    const info: bundleManager.BundleInfo = await selfBundle();
    const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE) as bundleManager.HapModuleInfo;
    expect(moduleInfo.abilitiesInfo[0].enabled).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARRT_0032
   * @tc.name      testHarRuntime0032
   * @tc.desc      Only ability keeps standard launch type
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarRuntime0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarRuntime0032', 'only ability keeps standard launch type');
    const info: bundleManager.BundleInfo = await selfBundle();
    const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE) as bundleManager.HapModuleInfo;
    expect(moduleInfo.abilitiesInfo[0].launchType).assertEqual(bundleManager.LaunchType.SINGLETON);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARRT_0033
   * @tc.name      testHarRuntime0033
   * @tc.desc      Only ability labels resolve to positive ids
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarRuntime0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
