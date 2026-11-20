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
import { common } from '@kit.AbilityKit';
import { preferences } from '@kit.ArkData';
import { fileIo as fs } from '@kit.CoreFileKit';
import { resourceManager } from '@kit.LocalizationKit';
import { UIAbility, contextConstant } from '@kit.AbilityKit';
import { util } from '@kit.ArkTS';
import { selfBundle, findModule, moduleNames, hasModule, entryContext, entryResources, errorCode,
  PngOracle, launchHome, stopHome } from './shared/Probe';
import { ENTRY_MODULE, ERR_RES_NAME_INVALID, ERR_RES_ID_INVALID } from './shared/Probe';
import { logCase } from './shared/TestLog';

import { paceTurn } from './shared/TestPace';

export default function multiInstanceMatrixTest() {
  describe('multiInstanceMatrixTest', () => {
  beforeEach(async () => {
    await paceTurn();
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MI_0001
   * @tc.name      testMultiInstance0001
   * @tc.desc      bundle reports the first instance
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMultiInstance0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMultiInstance0001', 'bundle reports the first instance');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.appIndex).assertEqual(0);
    expect(info.appIndex >= 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MI_0002
   * @tc.name      testMultiInstance0002
   * @tc.desc      application reports the first instance
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMultiInstance0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMultiInstance0002', 'application reports the first instance');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.appInfo.appIndex).assertEqual(0);
    expect(info.appInfo.appIndex).assertEqual(info.appIndex);
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MI_0003
   * @tc.name      testMultiInstance0003
   * @tc.desc      entry ability reports the first instance
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMultiInstance0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMultiInstance0003', 'entry ability reports the first instance');
    const info: bundleManager.BundleInfo = await selfBundle();
    const entry: bundleManager.HapModuleInfo = findModule(info, 'entry') as bundleManager.HapModuleInfo;
    expect(entry.abilitiesInfo[0].appIndex).assertEqual(0);
    expect(entry.abilitiesInfo[0].appIndex).assertEqual(info.appIndex);
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MI_0004
   * @tc.name      testMultiInstance0004
   * @tc.desc      every installed ability reports the first instance
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMultiInstance0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    const info: bundleManager.BundleInfo = await selfBundle();
    let indexable: number = 0;
    let total: number = 0;
    for (const mod of info.hapModulesInfo) {
      total += mod.abilitiesInfo.length;
      for (const ability of mod.abilitiesInfo) {
        if (ability.appIndex === info.appIndex) {
          indexable += 1;
        }
      }
    }
    const entry: bundleManager.HapModuleInfo = findModule(info, 'entry') as bundleManager.HapModuleInfo;
    const test: bundleManager.HapModuleInfo = findModule(info, 'entry_test') as bundleManager.HapModuleInfo;
    logCase('testMultiInstance0004', 'all installed abilities report the queried app instance');
    expect(indexable).assertEqual(total);
    logCase('testMultiInstance0004', 'main entry belongs to the original app instance');
    expect(entry.abilitiesInfo[0].appIndex).assertEqual(0);
    logCase('testMultiInstance0004', 'test entry belongs to the original app instance');
    expect(test.abilitiesInfo[0].appIndex).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MI_0005
   * @tc.name      testMultiInstance0005
   * @tc.desc      every extension reports the first instance
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMultiInstance0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMultiInstance0005', 'every extension reports the first instance');
    const info: bundleManager.BundleInfo = await selfBundle();
    let extensions: number = 0;
    for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
      const count: number = info.hapModulesInfo[i].extensionAbilitiesInfo.length;
      for (let k: number = 0; k < count; k++) {
        expect(info.hapModulesInfo[i].extensionAbilitiesInfo[k].appIndex).assertEqual(info.appIndex);
        extensions += 1;
      }
    }
    expect(extensions).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MI_0006
   * @tc.name      testMultiInstance0006
   * @tc.desc      instance index stays inside the documented range
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMultiInstance0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMultiInstance0006', 'instance index stays inside the documented range');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.appIndex >= 0).assertTrue();
    expect(info.appIndex <= 5).assertTrue();
    expect(info.appIndex < 5).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MI_0007
   * @tc.name      testMultiInstance0007
   * @tc.desc      instance index is an integer
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMultiInstance0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMultiInstance0007', 'instance index is an integer');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(Number.isInteger(info.appIndex)).assertTrue();
    expect(info.appIndex).assertEqual(Math.floor(info.appIndex));
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MI_0008
   * @tc.name      testMultiInstance0008
   * @tc.desc      instance index survives repeated reads
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMultiInstance0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMultiInstance0008', 'instance index survives repeated reads');
    const first: bundleManager.BundleInfo = await selfBundle();
    const second: bundleManager.BundleInfo = await selfBundle();
    const third: bundleManager.BundleInfo = await selfBundle();
    expect(first.appIndex).assertEqual(second.appIndex);
    expect(second.appIndex).assertEqual(third.appIndex);
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MI_0009
   * @tc.name      testMultiInstance0009
   * @tc.desc      instance index survives ability launch
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMultiInstance0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMultiInstance0009', 'instance index survives ability launch');
    const before: number = (await selfBundle()).appIndex;
    const ability: UIAbility = await launchHome();
    expect(ability.context.abilityInfo.appIndex).assertEqual(before);
    expect((await selfBundle()).appIndex).assertEqual(before);
    await stopHome();
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MI_0010
   * @tc.name      testMultiInstance0010
   * @tc.desc      instance index survives string reads
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMultiInstance0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMultiInstance0010', 'instance index survives string reads');
    const before: number = (await selfBundle()).appIndex;
    const res: resourceManager.ResourceManager = entryResources();
    expect(res.getStringByNameSync('module_desc')).assertEqual('module description');
    expect(res.getStringByNameSync('EntryAbility_label')).assertEqual('label');
    expect((await selfBundle()).appIndex).assertEqual(before);
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MI_0011
   * @tc.name      testMultiInstance0011
   * @tc.desc      instance index survives media reads
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMultiInstance0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMultiInstance0011', 'instance index survives media reads');
    const before: number = (await selfBundle()).appIndex;
    const bytes: Uint8Array = entryResources().getMediaByNameSync('startIcon');
    expect(PngOracle.hasSignature(bytes)).assertTrue();
    expect((await selfBundle()).appIndex).assertEqual(before);
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MI_0012
   * @tc.name      testMultiInstance0012
   * @tc.desc      instance index survives file writes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMultiInstance0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMultiInstance0012', 'instance index survives file writes');
    const before: number = (await selfBundle()).appIndex;
    const path: string = entryContext().filesDir + '/instance_probe.txt';
    const file: fs.File = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
    fs.writeSync(file.fd, 'instance');
    fs.closeSync(file.fd);
    expect(fs.readTextSync(path)).assertEqual('instance');
    expect((await selfBundle()).appIndex).assertEqual(before);
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MI_0013
   * @tc.name      testMultiInstance0013
   * @tc.desc      instance index survives preference writes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMultiInstance0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMultiInstance0013', 'instance index survives preference writes');
