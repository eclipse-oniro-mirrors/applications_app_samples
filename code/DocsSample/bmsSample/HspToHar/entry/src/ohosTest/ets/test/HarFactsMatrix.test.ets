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
import { selfBundle, findModule, moduleNames, hasModule, entryResources, errorCode,
  PngOracle, launchHome, stopHome } from './shared/Probe';
import { ENTRY_MODULE, LIBRARY_MODULE, ERR_RES_NAME_INVALID, ERR_RES_ID_INVALID } from './shared/Probe';
import { logCase } from './shared/TestLog';

import { paceTurn } from './shared/TestPace';

export default function harFactsMatrixTest() {
  describe('harFactsMatrixTest', () => {
  beforeEach(async () => {
    await paceTurn();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_HAR_0001
   * @tc.name      testHarFacts0001
   * @tc.desc      har is not an installed module
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarFacts0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarFacts0001', 'har is not an installed module');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(hasModule(info, 'har')).assertFalse();
    expect(moduleNames(info).every((name: string) => name !== 'har')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_HAR_0002
   * @tc.name      testHarFacts0002
   * @tc.desc      library alias is not installed
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarFacts0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarFacts0002', 'library alias is not installed');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(moduleNames(info).includes('library')).assertFalse();
    expect(moduleNames(info).filter((name: string) => name === 'library').length).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_HAR_0003
   * @tc.name      testHarFacts0003
   * @tc.desc      no shared module survives conversion
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarFacts0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarFacts0003', 'no shared module survives conversion');
    const info: bundleManager.BundleInfo = await selfBundle();
    let shared: number = 0;
    for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
      if (info.hapModulesInfo[i].type === bundleManager.ModuleType.SHARED) {
        shared += 1;
      }
    }
    expect(shared).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_HAR_0004
   * @tc.name      testHarFacts0004
   * @tc.desc      shared module type keeps its enum value
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarFacts0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarFacts0004', 'shared module type keeps its enum value');
    expect(bundleManager.ModuleType.SHARED).assertEqual(3);
    expect(bundleManager.ModuleType.ENTRY).assertEqual(1);
    expect(bundleManager.ModuleType.FEATURE).assertEqual(2);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_HAR_0005
   * @tc.name      testHarFacts0005
   * @tc.desc      installed modules are only hap modules
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarFacts0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarFacts0005', 'installed modules are only hap modules');
    const info: bundleManager.BundleInfo = await selfBundle();
    const names: string[] = moduleNames(info);
    expect(names.every((name: string) => name === 'entry' || name === 'entry_test')).assertTrue();
    expect(names.includes('entry')).assertTrue();
    expect(names.length >= 2).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_HAR_0006
   * @tc.name      testHarFacts0006
   * @tc.desc      every module is entry or feature
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarFacts0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarFacts0006', 'every module is entry or feature');
    const info: bundleManager.BundleInfo = await selfBundle();
    let hap: number = 0;
    for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
      const type: bundleManager.ModuleType = info.hapModulesInfo[i].type;
      if (type === bundleManager.ModuleType.ENTRY || type === bundleManager.ModuleType.FEATURE) {
        hap += 1;
      }
    }
    expect(hap).assertEqual(info.hapModulesInfo.length);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_HAR_0007
   * @tc.name      testHarFacts0007
   * @tc.desc      entry module remains the only entry hap
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarFacts0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarFacts0007', 'entry module remains the only entry hap');
    const info: bundleManager.BundleInfo = await selfBundle();
    const entries: bundleManager.HapModuleInfo[] =
      info.hapModulesInfo.filter((item: bundleManager.HapModuleInfo) =>
        item.type === bundleManager.ModuleType.ENTRY);
    expect(entries.length).assertEqual(1);
    expect(entries[0].name).assertEqual('entry');
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_HAR_0010
   * @tc.name      testHarFacts0010
   * @tc.desc      entry code path does not point at har
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarFacts0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarFacts0010', 'entry code path does not point at har');
    const info: bundleManager.BundleInfo = await selfBundle();
    const entry: bundleManager.HapModuleInfo = findModule(info, 'entry') as bundleManager.HapModuleInfo;
    expect(entry.codePath.includes('entry')).assertTrue();
    expect(entry.codePath.includes('/har')).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_HAR_0011
   * @tc.name      testHarFacts0011
   * @tc.desc      module code paths are unique
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarFacts0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarFacts0011', 'module code paths are unique');
    const info: bundleManager.BundleInfo = await selfBundle();
    const paths: string[] = info.hapModulesInfo.map((item: bundleManager.HapModuleInfo) => item.codePath);
    expect(new Set<string>(paths).size).assertEqual(paths.length);
  });


  /**
   * @tc.number    SUB_BMS_HSPTOHAR_HAR_0013
   * @tc.name      testHarFacts0013
   * @tc.desc      module order is stable between reads
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarFacts0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarFacts0013', 'module order is stable between reads');
    const first: bundleManager.BundleInfo = await selfBundle();
    const second: bundleManager.BundleInfo = await selfBundle();
    expect(moduleNames(first).join(',')).assertEqual(moduleNames(second).join(','));
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_HAR_0014
   * @tc.name      testHarFacts0014
   * @tc.desc      har name never appears among hashed modules
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarFacts0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarFacts0014', 'har name never appears among hashed modules');
    const info: bundleManager.BundleInfo = await selfBundle();
    let hits: number = 0;
    for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
      if (info.hapModulesInfo[i].name.indexOf('har') >= 0) {
        hits += 1;
      }
    }
    expect(hits).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_HAR_0018
   * @tc.name      testHarFacts0018
   * @tc.desc      entry font size still resolves after conversion
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarFacts0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarFacts0018', 'entry font size still resolves after conversion');
    const res: resourceManager.ResourceManager = entryResources();
    expect(res.getNumberByName('page_text_font_size')).assertEqual(50);
    expect(res.getNumberByName('page_text_font_size') > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_HAR_0019
   * @tc.name      testHarFacts0019
   * @tc.desc      entry keeps default and tablet targets
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarFacts0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarFacts0019', 'entry keeps default and tablet targets');
    const info: bundleManager.BundleInfo = await selfBundle();
    const entry: bundleManager.HapModuleInfo = findModule(info, 'entry') as bundleManager.HapModuleInfo;
    expect(entry.deviceTypes.includes('default')).assertTrue();
    expect(entry.deviceTypes.includes('tablet')).assertTrue();
    expect(entry.deviceTypes.length).assertEqual(2);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_HAR_0020
   * @tc.name      testHarFacts0020
   * @tc.desc      conversion leaves two installed modules
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarFacts0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarFacts0020', 'conversion leaves two installed modules');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.hapModulesInfo.length >= 2).assertTrue();
    expect(info.hapModulesInfo.some((item: bundleManager.HapModuleInfo) =>
      item.name === 'entry_test')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_HAR_0021
   * @tc.name      testHarFacts0021
   * @tc.desc      har artifact has no module json entry
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarFacts0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarFacts0021', 'har artifact has no module json entry');
    const info: bundleManager.BundleInfo = await selfBundle();
    const candidates: bundleManager.HapModuleInfo[] = info.hapModulesInfo.filter(
      (item: bundleManager.HapModuleInfo) => item.name === 'har' || item.name === 'library');
    expect(candidates.length).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_HSPTOHAR_HAR_0022
   * @tc.name      testHarFacts0022
   * @tc.desc      entry description survives conversion
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarFacts0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarFacts0022', 'entry description survives conversion');
    const info: bundleManager.BundleInfo = await selfBundle();
    const entry: bundleManager.HapModuleInfo = findModule(info, 'entry') as bundleManager.HapModuleInfo;
    expect(entry.description.length > 0).assertTrue();
    expect(entry.description === 'module description' ||
      entry.description === '$string:module_desc').assertTrue();
  });
  });
}
