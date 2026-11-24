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
import { resourceManager } from '@kit.LocalizationKit';
import { UIAbility, contextConstant } from '@kit.AbilityKit';
import { util } from '@kit.ArkTS';
import { selfBundle, findModule, moduleNames, hasModule, entryResources, libraryResources, errorCode,
  PngOracle, launchHome, stopHome } from './shared/Probe';
import { ENTRY_MODULE, LIBRARY_MODULE, ERR_RES_NAME_INVALID, ERR_RES_ID_INVALID } from './shared/Probe';
import { logCase } from './shared/TestLog';

import { paceTurn } from './shared/TestPace';

export default function moduleFactsMatrixTest() {
  describe('moduleFactsMatrixTest', () => {
  beforeEach(async () => {
    await paceTurn();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MOD_0001
   * @tc.name      testModuleFacts0001
   * @tc.desc      entry module is an entry hap
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleFacts0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleFacts0001', 'entry module is an entry hap');
    const info: bundleManager.BundleInfo = await selfBundle();
    const entry: bundleManager.HapModuleInfo = findModule(info, 'entry') as bundleManager.HapModuleInfo;
    expect(entry !== undefined).assertTrue();
    expect(entry.type).assertEqual(bundleManager.ModuleType.ENTRY);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MOD_0002
   * @tc.name      testModuleFacts0002
   * @tc.desc      entry module name
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleFacts0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleFacts0002', 'entry module name');
    const info: bundleManager.BundleInfo = await selfBundle();
    const entry: bundleManager.HapModuleInfo = findModule(info, 'entry') as bundleManager.HapModuleInfo;
    expect(entry.name).assertEqual('entry');
    expect(entry.name.length).assertEqual(5);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MOD_0003
   * @tc.name      testModuleFacts0003
   * @tc.desc      test module is a feature hap
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleFacts0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleFacts0003', 'test module is a feature hap');
    const info: bundleManager.BundleInfo = await selfBundle();
    const test: bundleManager.HapModuleInfo = findModule(info, 'entry_test') as bundleManager.HapModuleInfo;
    expect(test !== undefined).assertTrue();
    expect(test.type).assertEqual(bundleManager.ModuleType.FEATURE);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MOD_0004
   * @tc.name      testModuleFacts0004
   * @tc.desc      entry main element
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleFacts0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleFacts0004', 'entry main element');
    const info: bundleManager.BundleInfo = await selfBundle();
    const entry: bundleManager.HapModuleInfo = findModule(info, 'entry') as bundleManager.HapModuleInfo;
    expect(entry.mainElementName).assertEqual('EntryAbility');
    expect(entry.mainElementName.endsWith('Ability')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MOD_0005
   * @tc.name      testModuleFacts0005
   * @tc.desc      entry describes module
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleFacts0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleFacts0005', 'entry describes module');
    const info: bundleManager.BundleInfo = await selfBundle();
    const entry: bundleManager.HapModuleInfo = findModule(info, 'entry') as bundleManager.HapModuleInfo;
    expect(entry.descriptionId > 0).assertTrue();
    expect(entry.description.length > 0).assertTrue();
    expect(entry.description === 'module description' || entry.description === '$string:module_desc').assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MOD_0006
   * @tc.name      testModuleFacts0006
   * @tc.desc      entry declares default and tablet
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleFacts0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleFacts0006', 'entry declares default and tablet');
    const info: bundleManager.BundleInfo = await selfBundle();
    const entry: bundleManager.HapModuleInfo = findModule(info, 'entry') as bundleManager.HapModuleInfo;
    expect(entry.deviceTypes.includes('default')).assertTrue();
    expect(entry.deviceTypes.includes('tablet')).assertTrue();
    expect(entry.deviceTypes.length).assertEqual(2);
  });



  /**
   * @tc.number    SUB_BMS_HARTOHSP_MOD_0008
   * @tc.name      testModuleFacts0008
   * @tc.desc      entry code path
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleFacts0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleFacts0008', 'entry code path');
    const info: bundleManager.BundleInfo = await selfBundle();
    const entry: bundleManager.HapModuleInfo = findModule(info, 'entry') as bundleManager.HapModuleInfo;
    expect(entry.codePath.length > 0).assertTrue();
    expect(entry.codePath.includes('entry')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MOD_0009
   * @tc.name      testModuleFacts0009
   * @tc.desc      entry ability count
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleFacts0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleFacts0009', 'entry ability count');
    const info: bundleManager.BundleInfo = await selfBundle();
    const entry: bundleManager.HapModuleInfo = findModule(info, 'entry') as bundleManager.HapModuleInfo;
    expect(entry.abilitiesInfo.length).assertEqual(1);
    expect(entry.abilitiesInfo[0].name).assertEqual('EntryAbility');
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MOD_0010
   * @tc.name      testModuleFacts0010
   * @tc.desc      entry ability exported
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleFacts0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleFacts0010', 'entry ability exported');
    const info: bundleManager.BundleInfo = await selfBundle();
    const entry: bundleManager.HapModuleInfo = findModule(info, 'entry') as bundleManager.HapModuleInfo;
    expect(entry.abilitiesInfo[0].exported).assertTrue();
    expect(entry.abilitiesInfo[0].enabled).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MOD_0011
   * @tc.name      testModuleFacts0011
   * @tc.desc      entry ability launch type
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleFacts0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleFacts0011', 'entry ability launch type');
    const info: bundleManager.BundleInfo = await selfBundle();
    const entry: bundleManager.HapModuleInfo = findModule(info, 'entry') as bundleManager.HapModuleInfo;
    expect(entry.abilitiesInfo[0].launchType).assertEqual(bundleManager.LaunchType.SINGLETON);
  });


  /**
   * @tc.number    SUB_BMS_HARTOHSP_MOD_0014
   * @tc.name      testModuleFacts0014
   * @tc.desc      entry ability icon and label
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleFacts0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleFacts0014', 'entry ability icon and label');
    const info: bundleManager.BundleInfo = await selfBundle();
    const entry: bundleManager.HapModuleInfo = findModule(info, 'entry') as bundleManager.HapModuleInfo;
    expect(entry.abilitiesInfo[0].iconId > 0).assertTrue();
    expect(entry.abilitiesInfo[0].labelId > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MOD_0015
   * @tc.name      testModuleFacts0015
   * @tc.desc      entry ability module binding
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleFacts0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleFacts0015', 'entry ability module binding');
    const info: bundleManager.BundleInfo = await selfBundle();
    const entry: bundleManager.HapModuleInfo = findModule(info, 'entry') as bundleManager.HapModuleInfo;
    expect(entry.abilitiesInfo[0].moduleName).assertEqual('entry');
    expect(entry.abilitiesInfo[0].bundleName).assertEqual('ohos.app.hap.myapplication');
  });


  /**
   * @tc.number    SUB_BMS_HARTOHSP_MOD_0019
   * @tc.name      testModuleFacts0019
   * @tc.desc      library module is shared when installed
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleFacts0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleFacts0019', 'library module is shared when installed');
    const info: bundleManager.BundleInfo = await selfBundle();
    const lib: bundleManager.HapModuleInfo | undefined = findModule(info, 'library');
    if (lib !== undefined) {
      expect(lib.type).assertEqual(bundleManager.ModuleType.SHARED);
      expect(lib.name).assertEqual('library');
    } else {
      expect(moduleNames(info).includes('library')).assertFalse();
    }
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MOD_0020
   * @tc.name      testModuleFacts0020
   * @tc.desc      library has no abilities when installed
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testModuleFacts0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testModuleFacts0020', 'library has no abilities when installed');
    const info: bundleManager.BundleInfo = await selfBundle();
    const lib: bundleManager.HapModuleInfo | undefined = findModule(info, 'library');
    if (lib !== undefined) {
      expect(lib.abilitiesInfo.length).assertEqual(0);
      expect(lib.extensionAbilitiesInfo.length).assertEqual(0);
    } else {
      expect(lib === undefined).assertTrue();
    }
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MOD_0021
   * @tc.name      testModuleFacts0021
   * @tc.desc      library declares default tablet and two in one
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testModuleFacts0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testModuleFacts0021', 'library declares default tablet and two in one');
    const info: bundleManager.BundleInfo = await selfBundle();
    const lib: bundleManager.HapModuleInfo | undefined = findModule(info, 'library');
    if (lib !== undefined) {
      expect(lib.deviceTypes.includes('default')).assertTrue();
      expect(lib.deviceTypes.includes('tablet')).assertTrue();
      expect(lib.deviceTypes.includes('2in1')).assertTrue();
      expect(lib.deviceTypes.length).assertEqual(3);
    } else {
      expect(moduleNames(info).includes('library')).assertFalse();
    }
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_MOD_0022
   * @tc.name      testModuleFacts0022
   * @tc.desc      test module declares default and tablet
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testModuleFacts0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testModuleFacts0022', 'test module declares default and tablet');
    const info: bundleManager.BundleInfo = await selfBundle();
    const test: bundleManager.HapModuleInfo = findModule(info, 'entry_test') as bundleManager.HapModuleInfo;
    expect(test.deviceTypes.includes('default')).assertTrue();
    expect(test.deviceTypes.includes('tablet')).assertTrue();
    expect(test.installationFree).assertFalse();
  });


  });
}
