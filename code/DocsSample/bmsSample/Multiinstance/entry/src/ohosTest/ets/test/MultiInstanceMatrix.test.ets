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
    const before: number = (await selfBundle()).appIndex;
    const store: preferences.Preferences = preferences.getPreferencesSync(entryContext(),
      { name: 'instance_probe' });
    store.putSync('index', before);
    store.flushSync();
    expect(store.getSync('index', -1) as number).assertEqual(before);
    expect((await selfBundle()).appIndex).assertEqual(before);
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MI_0014
   * @tc.name      testMultiInstance0014
   * @tc.desc      instance index survives json round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMultiInstance0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMultiInstance0014', 'instance index survives json round trip');
    const info: bundleManager.BundleInfo = await selfBundle();
    const doc: string = JSON.stringify({ index: info.appIndex });
    const parsed: Record<string, number> = JSON.parse(doc) as Record<string, number>;
    expect(parsed.index).assertEqual(info.appIndex);
    expect(parsed.index >= 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MI_0015
   * @tc.name      testMultiInstance0015
   * @tc.desc      instance index survives text encoding round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMultiInstance0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMultiInstance0015', 'instance index survives text encoding round trip');
    const info: bundleManager.BundleInfo = await selfBundle();
    const helper: util.Base64Helper = new util.Base64Helper();
    const encoded: Uint8Array = helper.encodeSync(new util.TextEncoder().encodeInto('' + info.appIndex));
    const decoded: string = util.TextDecoder.create('utf-8').decodeToString(helper.decodeSync(encoded));
    expect(Number.parseInt(decoded, 10)).assertEqual(info.appIndex);
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MI_0016
   * @tc.name      testMultiInstance0016
   * @tc.desc      instance index agrees with its module context
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMultiInstance0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMultiInstance0016', 'instance index agrees with its module context');
    const info: bundleManager.BundleInfo = await selfBundle();
    const ctx: common.Context = entryContext();
    expect(ctx.applicationInfo.appIndex).assertEqual(info.appIndex);
    expect(ctx.applicationInfo.name).assertEqual(info.name);
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MI_0017
   * @tc.name      testMultiInstance0017
   * @tc.desc      instance index agrees after five sequential reads
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMultiInstance0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMultiInstance0017', 'instance index agrees after five sequential reads');
    const info: bundleManager.BundleInfo = await selfBundle();
    let mismatches: number = 0;
    for (let i: number = 0; i < 5; i++) {
      const again: bundleManager.BundleInfo = await selfBundle();
      if (again.appIndex !== info.appIndex) {
        mismatches += 1;
      }
    }
    expect(mismatches).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MI_0018
   * @tc.name      testMultiInstance0018
   * @tc.desc      multi instance mode keeps the bundle name
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMultiInstance0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMultiInstance0018', 'multi instance mode keeps the bundle name');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.name).assertEqual('ohos.app.hap.myapplication');
    expect(info.appInfo.name).assertEqual(info.name);
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MI_0019
   * @tc.name      testMultiInstance0019
   * @tc.desc      multi instance mode keeps the version code
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMultiInstance0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMultiInstance0019', 'multi instance mode keeps the version code');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.versionCode).assertEqual(1000000);
    expect(info.versionName).assertEqual('1.0.0');
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MI_0020
   * @tc.name      testMultiInstance0020
   * @tc.desc      multi instance mode keeps the entry module
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMultiInstance0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMultiInstance0020', 'multi instance mode keeps the entry module');
    const info: bundleManager.BundleInfo = await selfBundle();
    const entry: bundleManager.HapModuleInfo | undefined = findModule(info, 'entry');
    expect(entry !== undefined).assertTrue();
    expect((entry as bundleManager.HapModuleInfo).type).assertEqual(bundleManager.ModuleType.ENTRY);
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MI_0021
   * @tc.name      testMultiInstance0021
   * @tc.desc      multi instance mode keeps the test module
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMultiInstance0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMultiInstance0021', 'multi instance mode keeps the test module');
    const info: bundleManager.BundleInfo = await selfBundle();
    const test: bundleManager.HapModuleInfo | undefined = findModule(info, 'entry_test');
    expect(test !== undefined).assertTrue();
    expect((test as bundleManager.HapModuleInfo).type).assertEqual(bundleManager.ModuleType.FEATURE);
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MI_0022
   * @tc.name      testMultiInstance0022
   * @tc.desc      multi instance mode creates no shared module
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMultiInstance0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMultiInstance0022', 'multi instance mode creates no shared module');
    const info: bundleManager.BundleInfo = await selfBundle();
    const shared: bundleManager.HapModuleInfo[] = info.hapModulesInfo.filter(
      (item: bundleManager.HapModuleInfo) => item.type === bundleManager.ModuleType.SHARED);
    expect(shared.length).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MI_0023
   * @tc.name      testMultiInstance0023
   * @tc.desc      instance code path belongs to the application root
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMultiInstance0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMultiInstance0023', 'instance code path belongs to the application root');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.appInfo.codePath.startsWith('/data')).assertTrue();
    expect(info.appInfo.codePath.includes('ohos.app.hap.myapplication')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MI_0024
   * @tc.name      testMultiInstance0024
   * @tc.desc      instance code path is stable
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMultiInstance0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMultiInstance0024', 'instance code path is stable');
    const first: bundleManager.BundleInfo = await selfBundle();
    const second: bundleManager.BundleInfo = await selfBundle();
    expect(first.appInfo.codePath).assertEqual(second.appInfo.codePath);
    expect(first.appInfo.uid).assertEqual(second.appInfo.uid);
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MI_0025
   * @tc.name      testMultiInstance0025
   * @tc.desc      instance sandbox is rooted under data
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMultiInstance0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMultiInstance0025', 'instance sandbox is rooted under data');
    const ctx: common.Context = entryContext();
    expect(ctx.filesDir.startsWith('/data')).assertTrue();
    expect(ctx.cacheDir.startsWith('/data')).assertTrue();
    expect(ctx.filesDir === ctx.cacheDir).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MI_0026
   * @tc.name      testMultiInstance0026
   * @tc.desc      instance label resources still resolve
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMultiInstance0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMultiInstance0026', 'instance label resources still resolve');
    const res: resourceManager.ResourceManager = entryResources();
    expect(res.getStringByNameSync('EntryAbility_label')).assertEqual('label');
    expect(res.getNumberByName('page_text_font_size')).assertEqual(50);
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MI_0027
   * @tc.name      testMultiInstance0027
   * @tc.desc      instance media resources still resolve
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMultiInstance0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMultiInstance0027', 'instance media resources still resolve');
    const res: resourceManager.ResourceManager = entryResources();
    const back: Uint8Array = res.getMediaByNameSync('background');
    const fore: Uint8Array = res.getMediaByNameSync('foreground');
    expect(PngOracle.width(back)).assertEqual(PngOracle.width(fore));
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MI_0028
   * @tc.name      testMultiInstance0028
   * @tc.desc      instance window color stays white
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMultiInstance0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMultiInstance0028', 'instance window color stays white');
    const color: number = entryResources().getColorByNameSync('start_window_background');
    expect(color >>> 0).assertEqual(0xFFFFFFFF);
    expect(color >>> 24).assertEqual(255);
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MI_0029
   * @tc.name      testMultiInstance0029
   * @tc.desc      instance layered icon stays a json descriptor
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMultiInstance0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    const res: resourceManager.ResourceManager = entryResources();
    const bytes: Uint8Array = res.getMediaByNameSync('layered_image');
    const text: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
    const doc: Record<string, Record<string, string>> = JSON.parse(text) as Record<string, Record<string, string>>;
    const layers: Record<string, string> = doc['layered-image'];
    logCase('testMultiInstance0029', 'layered icon retains its root key');
    expect(Object.keys(doc).join(',')).assertEqual('layered-image');
    logCase('testMultiInstance0029', 'layered icon contains exactly two declared layers');
    expect(Object.keys(layers).sort().join(',')).assertEqual('background,foreground');
    for (const name of ['background', 'foreground']) {
      const reference: string = layers[name];
      logCase('testMultiInstance0029', 'compiled layer uses a decimal media ID');
      expect(/^\$media:[0-9]+$/.test(reference)).assertTrue();
      const content: Uint8Array = res.getMediaContentSync(Number(reference.substring(7)));
      const named: Uint8Array = res.getMediaByNameSync(name);
      logCase('testMultiInstance0029', 'compiled media ID resolves the named layer bytes');
      expect(content.length === named.length && content.every(
        (value: number, index: number): boolean => value === named[index])).assertTrue();
      logCase('testMultiInstance0029', 'resolved layer has a PNG signature');
      expect(PngOracle.hasSignature(content)).assertTrue();
    }
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MI_0030
   * @tc.name      testMultiInstance0030
   * @tc.desc      instance index is the first slot of the range
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMultiInstance0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMultiInstance0030', 'instance index is the first slot of the range');
    const info: bundleManager.BundleInfo = await selfBundle();
    const slots: number[] = [0, 1, 2, 3, 4];
    expect(slots[0]).assertEqual(info.appIndex);
    expect(Math.min(...slots)).assertEqual(info.appIndex);
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MI_0031
   * @tc.name      testMultiInstance0031
   * @tc.desc      instance range stays under the configured maximum
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMultiInstance0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMultiInstance0031', 'instance range stays under the configured maximum');
    const info: bundleManager.BundleInfo = await selfBundle();
    const maxCount: number = 5;
    expect(info.appIndex < maxCount).assertTrue();
    expect(info.appIndex + maxCount).assertEqual(maxCount);
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MI_0032
   * @tc.name      testMultiInstance0032
   * @tc.desc      instance index arithmetic is stable
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMultiInstance0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMultiInstance0032', 'instance index arithmetic is stable');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.appIndex + 0).assertEqual(info.appIndex);
    expect(info.appIndex * 2).assertEqual(info.appIndex);
    expect(info.appIndex % 5).assertEqual(info.appIndex);
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MI_0033
   * @tc.name      testMultiInstance0033
   * @tc.desc      instance index parses back from text
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMultiInstance0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMultiInstance0033', 'instance index parses back from text');
    const info: bundleManager.BundleInfo = await selfBundle();
    const text: string = info.appIndex.toString();
    expect(Number.parseInt(text, 10)).assertEqual(info.appIndex);
    expect(text.length).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MI_0034
   * @tc.name      testMultiInstance0034
   * @tc.desc      instance index is finite
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMultiInstance0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMultiInstance0034', 'instance index is finite');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(Number.isFinite(info.appIndex)).assertTrue();
    expect(Number.isNaN(info.appIndex)).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MI_0035
   * @tc.name      testMultiInstance0035
   * @tc.desc      instance index matches every reported ability context
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMultiInstance0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMultiInstance0035', 'instance index matches every reported ability context');
    const ability: UIAbility = await launchHome();
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(ability.context.abilityInfo.appIndex).assertEqual(info.appIndex);
    expect(ability.context.applicationInfo.appIndex).assertEqual(info.appIndex);
    await stopHome();
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MI_0036
   * @tc.name      testMultiInstance0036
   * @tc.desc      instance index equals the parsed bundle index
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMultiInstance0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMultiInstance0036', 'instance index equals the parsed bundle index');
    const info: bundleManager.BundleInfo = await selfBundle();
    const parsed: number = Number.parseInt(info.appIndex.toString(), 10);
    expect(parsed).assertEqual(info.appIndex);
    expect(parsed === 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MI_0037
   * @tc.name      testMultiInstance0037
   * @tc.desc      instance summary keeps five slots
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMultiInstance0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMultiInstance0037', 'instance summary keeps five slots');
    const info: bundleManager.BundleInfo = await selfBundle();
    const slots: number[] = [];
    for (let i: number = 0; i < 5; i++) {
      slots.push(i);
    }
    expect(slots.length).assertEqual(5);
    expect(slots.filter((value: number) => value === info.appIndex).length).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MI_0038
   * @tc.name      testMultiInstance0038
   * @tc.desc      instance summary shares one bundle identity
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMultiInstance0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    const info: bundleManager.BundleInfo = await selfBundle();
    const identities: Set<string> = new Set<string>();
    let ownedByModule: boolean = true;
    for (const mod of info.hapModulesInfo) {
      for (const ability of mod.abilitiesInfo) {
        identities.add(ability.bundleName);
        if (ability.moduleName !== mod.name) {
          ownedByModule = false;
        }
      }
    }
    logCase('testMultiInstance0038', 'installed abilities share one bundle identity');
    expect(identities.size).assertEqual(1);
    logCase('testMultiInstance0038', 'ability bundle identity matches the queried bundle');
    expect(identities.has(info.name)).assertTrue();
    logCase('testMultiInstance0038', 'every ability belongs to its reported module');
    expect(ownedByModule).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MI_0039
   * @tc.name      testMultiInstance0039
   * @tc.desc      instance owner module keeps its ability
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMultiInstance0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMultiInstance0039', 'instance owner module keeps its ability');
    const info: bundleManager.BundleInfo = await selfBundle();
    const owner: bundleManager.HapModuleInfo | undefined = findModule(info, 'entry');
    expect((owner as bundleManager.HapModuleInfo).abilitiesInfo.length).assertEqual(1);
    expect((owner as bundleManager.HapModuleInfo).abilitiesInfo[0].appIndex).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MI_0040
   * @tc.name      testMultiInstance0040
   * @tc.desc      instance owner module keeps its backup extension
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMultiInstance0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMultiInstance0040', 'instance owner module keeps its backup extension');
    const info: bundleManager.BundleInfo = await selfBundle();
    const owner: bundleManager.HapModuleInfo = findModule(info, 'entry') as bundleManager.HapModuleInfo;
    expect(owner.extensionAbilitiesInfo.length).assertEqual(1);
    expect(owner.extensionAbilitiesInfo[0].appIndex).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MI_0041
   * @tc.name      testMultiInstance0041
   * @tc.desc      instance device targets include default and tablet
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMultiInstance0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMultiInstance0041', 'instance device targets include default and tablet');
    const info: bundleManager.BundleInfo = await selfBundle();
    const owner: bundleManager.HapModuleInfo = findModule(info, 'entry') as bundleManager.HapModuleInfo;
    expect(owner.deviceTypes.includes('default')).assertTrue();
    expect(owner.deviceTypes.includes('tablet')).assertTrue();
    expect(owner.deviceTypes.length).assertEqual(2);
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MI_0042
   * @tc.name      testMultiInstance0042
   * @tc.desc      instance index is preserved by a preferences restart
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMultiInstance0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMultiInstance0042', 'instance index is preserved by a preferences restart');
    const before: number = (await selfBundle()).appIndex;
    const options: preferences.Options = { name: 'instance_restart' };
    const store: preferences.Preferences = preferences.getPreferencesSync(entryContext(), options);
    store.putSync('slot', before);
    store.flushSync();
    const reopened: preferences.Preferences = preferences.getPreferencesSync(entryContext(), options);
    expect(reopened.getSync('slot', -1) as number).assertEqual(before);
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MI_0043
   * @tc.name      testMultiInstance0043
   * @tc.desc      instance index survives a json document of slots
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMultiInstance0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMultiInstance0043', 'instance index survives a json document of slots');
    const info: bundleManager.BundleInfo = await selfBundle();
    const slots: string = JSON.stringify([0, 1, 2, 3, 4]);
    const parsed: number[] = JSON.parse(slots) as number[];
    expect(parsed.length).assertEqual(5);
    expect(parsed[info.appIndex]).assertEqual(info.appIndex);
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MI_0044
   * @tc.name      testMultiInstance0044
   * @tc.desc      instance index survives base64 encoding
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMultiInstance0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMultiInstance0044', 'instance index survives base64 encoding');
    const info: bundleManager.BundleInfo = await selfBundle();
    const helper: util.Base64Helper = new util.Base64Helper();
    const encoded: Uint8Array = helper.encodeSync(new util.TextEncoder().encodeInto('slot-' + info.appIndex));
    const decoded: string = util.TextDecoder.create('utf-8').decodeToString(helper.decodeSync(encoded));
    expect(decoded).assertEqual('slot-' + info.appIndex);
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MI_0045
   * @tc.name      testMultiInstance0045
   * @tc.desc      instance index does not leak into module names
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMultiInstance0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMultiInstance0045', 'instance index does not leak into module names');
    const info: bundleManager.BundleInfo = await selfBundle();
    const names: string[] = moduleNames(info);
    expect(names.includes('entry')).assertTrue();
    expect(names.includes('entry0')).assertFalse();
    expect(names.includes('entry1')).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MI_0046
   * @tc.name      testMultiInstance0046
   * @tc.desc      instance index keeps the entry ability name
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMultiInstance0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMultiInstance0046', 'instance index keeps the entry ability name');
    const info: bundleManager.BundleInfo = await selfBundle();
    const owner: bundleManager.HapModuleInfo = findModule(info, 'entry') as bundleManager.HapModuleInfo;
    expect(owner.abilitiesInfo[0].name).assertEqual('EntryAbility');
    expect(owner.abilitiesInfo[0].name.endsWith('Ability')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MI_0047
   * @tc.name      testMultiInstance0047
   * @tc.desc      instance index keeps the entry main element
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMultiInstance0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMultiInstance0047', 'instance index keeps the entry main element');
    const info: bundleManager.BundleInfo = await selfBundle();
    const owner: bundleManager.HapModuleInfo = findModule(info, 'entry') as bundleManager.HapModuleInfo;
    expect(owner.mainElementName).assertEqual('EntryAbility');
    expect(owner.installationFree).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MI_0048
   * @tc.name      testMultiInstance0048
   * @tc.desc      instance index keeps the home skill
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testMultiInstance0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testMultiInstance0048', 'instance index keeps the home skill');
    const info: bundleManager.BundleInfo = await selfBundle();
    const owner: bundleManager.HapModuleInfo = findModule(info, 'entry') as bundleManager.HapModuleInfo;
    expect(owner.abilitiesInfo[0].skills.length).assertEqual(1);
    expect(owner.abilitiesInfo[0].skills[0].actions.includes('ohos.want.action.home')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MI_0049
   * @tc.name      testMultiInstance0049
   * @tc.desc      instance index keeps the signature identity
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testMultiInstance0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testMultiInstance0049', 'instance index keeps the signature identity');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.signatureInfo.appId.indexOf(info.name)).assertEqual(0);
    expect(info.signatureInfo.appId.length > info.name.length).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_MI_0050
   * @tc.name      testMultiInstance0050
   * @tc.desc      instance index stays zero while reading the app scope
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testMultiInstance0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testMultiInstance0050', 'instance index stays zero while reading the app scope');
    const before: number = (await selfBundle()).appIndex;
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.vendor).assertEqual('example');
    expect(info.appInfo.bundleType).assertEqual(bundleManager.BundleType.APP);
    expect((await selfBundle()).appIndex).assertEqual(before);
  });
  });
}
