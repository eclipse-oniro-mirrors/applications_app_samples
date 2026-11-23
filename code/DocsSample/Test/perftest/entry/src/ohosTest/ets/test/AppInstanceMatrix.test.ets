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

export default function appInstanceMatrixTest() {
  describe('appInstanceMatrixTest', () => {
  beforeEach(async () => {
    await paceTurn();
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_INST_0001
   * @tc.name      testAppInstance0001
   * @tc.desc      bundle reports the first instance
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testAppInstance0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testAppInstance0001', 'bundle reports the first instance');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.appIndex).assertEqual(0);
    expect(info.appIndex >= 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_INST_0002
   * @tc.name      testAppInstance0002
   * @tc.desc      application reports the first instance
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testAppInstance0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testAppInstance0002', 'application reports the first instance');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.appInfo.appIndex).assertEqual(0);
    expect(info.appInfo.appIndex).assertEqual(info.appIndex);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_INST_0003
   * @tc.name      testAppInstance0003
   * @tc.desc      entry ability reports the first instance
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testAppInstance0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testAppInstance0003', 'entry ability reports the first instance');
    const info: bundleManager.BundleInfo = await selfBundle();
    const entry: bundleManager.HapModuleInfo = findModule(info, 'entry') as bundleManager.HapModuleInfo;
    expect(entry.abilitiesInfo[0].appIndex).assertEqual(0);
    expect(entry.abilitiesInfo[0].appIndex).assertEqual(info.appIndex);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_INST_0004
   * @tc.name      testAppInstance0004
   * @tc.desc      every installed ability reports the first instance
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testAppInstance0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testAppInstance0004', 'every installed ability reports the first instance');
    const info: bundleManager.BundleInfo = await selfBundle();
    let indexable: number = 0;
    for (let i: number = 0; i < info.hapModulesInfo.length; i++) {
      const count: number = info.hapModulesInfo[i].abilitiesInfo.length;
      for (let k: number = 0; k < count; k++) {
        if (info.hapModulesInfo[i].abilitiesInfo[k].appIndex === info.appIndex) {
          indexable += 1;
        }
      }
    }
    expect(indexable).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_INST_0005
   * @tc.name      testAppInstance0005
   * @tc.desc      every extension reports the first instance
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testAppInstance0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testAppInstance0005', 'every extension reports the first instance');
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
   * @tc.number    SUB_BMS_PERFTEST_INST_0006
   * @tc.name      testAppInstance0006
   * @tc.desc      app index stays below one
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testAppInstance0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testAppInstance0006', 'app index stays below one');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.appIndex >= 0).assertTrue();
    expect(info.appIndex <= 0).assertTrue();
    expect(info.appIndex < 1).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_INST_0007
   * @tc.name      testAppInstance0007
   * @tc.desc      app index is an integer
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testAppInstance0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testAppInstance0007', 'app index is an integer');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(Number.isInteger(info.appIndex)).assertTrue();
    expect(info.appIndex).assertEqual(Math.floor(info.appIndex));
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_INST_0008
   * @tc.name      testAppInstance0008
   * @tc.desc      app index survives repeated reads
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testAppInstance0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testAppInstance0008', 'app index survives repeated reads');
    const first: bundleManager.BundleInfo = await selfBundle();
    const second: bundleManager.BundleInfo = await selfBundle();
    const third: bundleManager.BundleInfo = await selfBundle();
    expect(first.appIndex).assertEqual(second.appIndex);
    expect(second.appIndex).assertEqual(third.appIndex);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_INST_0009
   * @tc.name      testAppInstance0009
   * @tc.desc      app index survives ability launch
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testAppInstance0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testAppInstance0009', 'app index survives ability launch');
    const before: number = (await selfBundle()).appIndex;
    const ability: UIAbility = await launchHome();
    expect(ability.context.abilityInfo.appIndex).assertEqual(before);
    expect((await selfBundle()).appIndex).assertEqual(before);
    await stopHome();
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_INST_0010
   * @tc.name      testAppInstance0010
   * @tc.desc      app index survives string reads
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testAppInstance0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testAppInstance0010', 'app index survives string reads');
    const before: number = (await selfBundle()).appIndex;
    const res: resourceManager.ResourceManager = entryResources();
    expect(res.getStringByNameSync('module_desc')).assertEqual('module description');
    expect(res.getStringByNameSync('EntryAbility_label')).assertEqual('perftest');
    expect((await selfBundle()).appIndex).assertEqual(before);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_INST_0011
   * @tc.name      testAppInstance0011
   * @tc.desc      app index survives media reads
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testAppInstance0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testAppInstance0011', 'app index survives media reads');
    const before: number = (await selfBundle()).appIndex;
    const bytes: Uint8Array = entryResources().getMediaByNameSync('startIcon');
    expect(PngOracle.hasSignature(bytes)).assertTrue();
    expect((await selfBundle()).appIndex).assertEqual(before);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_INST_0012
   * @tc.name      testAppInstance0012
   * @tc.desc      app index survives file writes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testAppInstance0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testAppInstance0012', 'app index survives file writes');
    const before: number = (await selfBundle()).appIndex;
    const path: string = entryContext().filesDir + '/app_probe.txt';
    const file: fs.File = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
    fs.writeSync(file.fd, 'app state');
    fs.closeSync(file.fd);
    expect(fs.readTextSync(path)).assertEqual('app state');
    expect((await selfBundle()).appIndex).assertEqual(before);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_INST_0013
   * @tc.name      testAppInstance0013
   * @tc.desc      app index survives preference writes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testAppInstance0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testAppInstance0013', 'app index survives preference writes');
    const before: number = (await selfBundle()).appIndex;
    const store: preferences.Preferences = preferences.getPreferencesSync(entryContext(),
      { name: 'app_probe' });
    store.putSync('index', before);
    store.flushSync();
    expect(store.getSync('index', -1) as number).assertEqual(before);
    expect((await selfBundle()).appIndex).assertEqual(before);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_INST_0014
   * @tc.name      testAppInstance0014
   * @tc.desc      app index survives json round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testAppInstance0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testAppInstance0014', 'app index survives json round trip');
    const info: bundleManager.BundleInfo = await selfBundle();
    const doc: string = JSON.stringify({ index: info.appIndex });
    const parsed: Record<string, number> = JSON.parse(doc) as Record<string, number>;
    expect(parsed.index).assertEqual(info.appIndex);
    expect(parsed.index >= 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_INST_0015
   * @tc.name      testAppInstance0015
   * @tc.desc      app index survives text encoding round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testAppInstance0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testAppInstance0015', 'app index survives text encoding round trip');
    const info: bundleManager.BundleInfo = await selfBundle();
    const helper: util.Base64Helper = new util.Base64Helper();
    const encoded: Uint8Array = helper.encodeSync(new util.TextEncoder().encodeInto('' + info.appIndex));
    const decoded: string = util.TextDecoder.create('utf-8').decodeToString(helper.decodeSync(encoded));
    expect(Number.parseInt(decoded, 10)).assertEqual(info.appIndex);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_INST_0016
   * @tc.name      testAppInstance0016
   * @tc.desc      app index agrees with its module context
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testAppInstance0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testAppInstance0016', 'app index agrees with its module context');
    const info: bundleManager.BundleInfo = await selfBundle();
    const ctx: common.Context = entryContext();
    expect(ctx.applicationInfo.appIndex).assertEqual(info.appIndex);
    expect(ctx.applicationInfo.name).assertEqual(info.name);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_INST_0017
   * @tc.name      testAppInstance0017
   * @tc.desc      app index agrees after five sequential reads
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testAppInstance0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testAppInstance0017', 'app index agrees after five sequential reads');
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
   * @tc.number    SUB_BMS_PERFTEST_INST_0018
   * @tc.name      testAppInstance0018
   * @tc.desc      package keeps the bundle name
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testAppInstance0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testAppInstance0018', 'package keeps the bundle name');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.name).assertEqual('com.samples.test.perftest');
    expect(info.appInfo.name).assertEqual(info.name);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_INST_0019
   * @tc.name      testAppInstance0019
   * @tc.desc      package keeps the version code
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testAppInstance0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testAppInstance0019', 'package keeps the version code');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.versionCode).assertEqual(1000000);
    expect(info.versionName).assertEqual('1.0.0');
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_INST_0020
   * @tc.name      testAppInstance0020
   * @tc.desc      package keeps the entry module
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testAppInstance0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testAppInstance0020', 'package keeps the entry module');
    const info: bundleManager.BundleInfo = await selfBundle();
    const entry: bundleManager.HapModuleInfo | undefined = findModule(info, 'entry');
    expect(entry !== undefined).assertTrue();
    expect((entry as bundleManager.HapModuleInfo).type).assertEqual(bundleManager.ModuleType.ENTRY);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_INST_0021
   * @tc.name      testAppInstance0021
   * @tc.desc      package keeps the test module
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testAppInstance0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testAppInstance0021', 'package keeps the test module');
    const info: bundleManager.BundleInfo = await selfBundle();
    const test: bundleManager.HapModuleInfo | undefined = findModule(info, 'entry_test');
    expect(test !== undefined).assertTrue();
    expect((test as bundleManager.HapModuleInfo).type).assertEqual(bundleManager.ModuleType.FEATURE);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_INST_0022
   * @tc.name      testAppInstance0022
   * @tc.desc      package creates no shared module
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testAppInstance0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testAppInstance0022', 'package creates no shared module');
    const info: bundleManager.BundleInfo = await selfBundle();
    const shared: bundleManager.HapModuleInfo[] = info.hapModulesInfo.filter(
      (item: bundleManager.HapModuleInfo) => item.type === bundleManager.ModuleType.SHARED);
    expect(shared.length).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_INST_0023
   * @tc.name      testAppInstance0023
   * @tc.desc      app code path belongs to the application root
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testAppInstance0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testAppInstance0023', 'app code path belongs to the application root');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.appInfo.codePath.startsWith('/data')).assertTrue();
    expect(info.appInfo.codePath.includes('com.samples.test.perftest')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_INST_0024
   * @tc.name      testAppInstance0024
   * @tc.desc      app code path is stable
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testAppInstance0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testAppInstance0024', 'app code path is stable');
    const first: bundleManager.BundleInfo = await selfBundle();
    const second: bundleManager.BundleInfo = await selfBundle();
    expect(first.appInfo.codePath).assertEqual(second.appInfo.codePath);
    expect(first.appInfo.uid).assertEqual(second.appInfo.uid);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_INST_0025
   * @tc.name      testAppInstance0025
   * @tc.desc      app sandbox is rooted under data
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testAppInstance0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testAppInstance0025', 'app sandbox is rooted under data');
    const ctx: common.Context = entryContext();
    expect(ctx.filesDir.startsWith('/data')).assertTrue();
    expect(ctx.cacheDir.startsWith('/data')).assertTrue();
    expect(ctx.filesDir === ctx.cacheDir).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_INST_0026
   * @tc.name      testAppInstance0026
   * @tc.desc      app label resources still resolve
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testAppInstance0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testAppInstance0026', 'app label resources still resolve');
    const res: resourceManager.ResourceManager = entryResources();
    expect(res.getStringByNameSync('EntryAbility_label')).assertEqual('perftest');
    expect(res.getNumberByName('page_text_font_size')).assertEqual(50);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_INST_0027
   * @tc.name      testAppInstance0027
   * @tc.desc      app media resources still resolve
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testAppInstance0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testAppInstance0027', 'app media resources still resolve');
    const res: resourceManager.ResourceManager = entryResources();
    const back: Uint8Array = res.getMediaByNameSync('background');
    const fore: Uint8Array = res.getMediaByNameSync('foreground');
    expect(PngOracle.width(back)).assertEqual(PngOracle.width(fore));
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_INST_0028
   * @tc.name      testAppInstance0028
   * @tc.desc      app window color matches the theme
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testAppInstance0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testAppInstance0028', 'app window color matches the theme');
    const color: number = entryResources().getColorByNameSync('start_window_background');
    expect(color >>> 24).assertEqual(255);
    expect((color >>> 0) === 0xFFFFFFFF || (color >>> 0) === 0xFF000000).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_INST_0029
   * @tc.name      testAppInstance0029
   * @tc.desc      app layered icon stays a json descriptor
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testAppInstance0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testAppInstance0029', 'app layered icon stays a json descriptor');
    const bytes: Uint8Array = entryResources().getMediaByNameSync('layered_image');
    const text: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
    expect(text.includes('layered-image')).assertTrue();
    expect(text.includes('$media:background')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_INST_0030
   * @tc.name      testAppInstance0030
   * @tc.desc      app index is the first slot of the range
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testAppInstance0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testAppInstance0030', 'app index is the first slot of the range');
    const info: bundleManager.BundleInfo = await selfBundle();
    const slots: number[] = [0];
    expect(slots[0]).assertEqual(info.appIndex);
    expect(Math.min(...slots)).assertEqual(info.appIndex);
    expect(slots.length).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_INST_0031
   * @tc.name      testAppInstance0031
   * @tc.desc      instance range stays under the configured maximum
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testAppInstance0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testAppInstance0031', 'instance range stays under the configured maximum');
    const info: bundleManager.BundleInfo = await selfBundle();
    const maxCount: number = 1;
    expect(info.appIndex < maxCount).assertTrue();
    expect(info.appIndex + maxCount).assertEqual(maxCount);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_INST_0032
   * @tc.name      testAppInstance0032
   * @tc.desc      app index arithmetic is stable
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testAppInstance0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testAppInstance0032', 'app index arithmetic is stable');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.appIndex + 0).assertEqual(info.appIndex);
    expect(info.appIndex * 2).assertEqual(info.appIndex);
    expect(info.appIndex % 1).assertEqual(info.appIndex);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_INST_0033
   * @tc.name      testAppInstance0033
   * @tc.desc      app index parses back from text
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testAppInstance0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testAppInstance0033', 'app index parses back from text');
    const info: bundleManager.BundleInfo = await selfBundle();
    const text: string = info.appIndex.toString();
    expect(Number.parseInt(text, 10)).assertEqual(info.appIndex);
    expect(text.length).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_INST_0034
   * @tc.name      testAppInstance0034
   * @tc.desc      app index is finite
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testAppInstance0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testAppInstance0034', 'app index is finite');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(Number.isFinite(info.appIndex)).assertTrue();
    expect(Number.isNaN(info.appIndex)).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_INST_0035
   * @tc.name      testAppInstance0035
   * @tc.desc      app index matches every reported ability context
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testAppInstance0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testAppInstance0035', 'app index matches every reported ability context');
    const ability: UIAbility = await launchHome();
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(ability.context.abilityInfo.appIndex).assertEqual(info.appIndex);
    expect(ability.context.applicationInfo.appIndex).assertEqual(info.appIndex);
    await stopHome();
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_INST_0036
   * @tc.name      testAppInstance0036
   * @tc.desc      app index equals the parsed bundle index
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testAppInstance0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testAppInstance0036', 'app index equals the parsed bundle index');
    const info: bundleManager.BundleInfo = await selfBundle();
    const parsed: number = Number.parseInt(info.appIndex.toString(), 10);
    expect(parsed).assertEqual(info.appIndex);
    expect(parsed === 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_INST_0037
   * @tc.name      testAppInstance0037
   * @tc.desc      app summary keeps five slots
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testAppInstance0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testAppInstance0037', 'app summary keeps five slots');
    const info: bundleManager.BundleInfo = await selfBundle();
    const slots: number[] = [];
    for (let i: number = 0; i < 1; i++) {
      slots.push(i);
    }
    expect(slots.length).assertEqual(1);
    expect(slots.filter((value: number) => value === info.appIndex).length).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_INST_0038
   * @tc.name      testAppInstance0038
   * @tc.desc      app summary shares one bundle identity
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testAppInstance0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testAppInstance0038', 'app summary shares one bundle identity');
    const info: bundleManager.BundleInfo = await selfBundle();
    const identities: string[] = info.hapModulesInfo.map(
      (item: bundleManager.HapModuleInfo) => item.abilitiesInfo.length > 0 ? item.name : '');
    expect(identities.filter((name: string) => name.length > 0).length).assertEqual(1);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_INST_0039
   * @tc.name      testAppInstance0039
   * @tc.desc      app owner module keeps its ability
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testAppInstance0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testAppInstance0039', 'app owner module keeps its ability');
    const info: bundleManager.BundleInfo = await selfBundle();
    const owner: bundleManager.HapModuleInfo | undefined = findModule(info, 'entry');
    expect((owner as bundleManager.HapModuleInfo).abilitiesInfo.length).assertEqual(1);
    expect((owner as bundleManager.HapModuleInfo).abilitiesInfo[0].appIndex).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_INST_0040
   * @tc.name      testAppInstance0040
   * @tc.desc      app owner module keeps its backup extension
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testAppInstance0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testAppInstance0040', 'app owner module keeps its backup extension');
    const info: bundleManager.BundleInfo = await selfBundle();
    const owner: bundleManager.HapModuleInfo = findModule(info, 'entry') as bundleManager.HapModuleInfo;
    expect(owner.extensionAbilitiesInfo.length).assertEqual(1);
    expect(owner.extensionAbilitiesInfo[0].appIndex).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_INST_0041
   * @tc.name      testAppInstance0041
   * @tc.desc      app device target stays tablet
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testAppInstance0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testAppInstance0041', 'app device target stays tablet');
    const info: bundleManager.BundleInfo = await selfBundle();
    const owner: bundleManager.HapModuleInfo = findModule(info, 'entry') as bundleManager.HapModuleInfo;
    expect(owner.deviceTypes.includes('tablet')).assertTrue();
    expect(owner.deviceTypes.includes('default')).assertTrue();
    expect(owner.deviceTypes.length).assertEqual(2);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_INST_0042
   * @tc.name      testAppInstance0042
   * @tc.desc      app index is preserved by a preferences restart
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testAppInstance0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testAppInstance0042', 'app index is preserved by a preferences restart');
    const before: number = (await selfBundle()).appIndex;
    const options: preferences.Options = { name: 'app_restart' };
    const store: preferences.Preferences = preferences.getPreferencesSync(entryContext(), options);
    store.putSync('slot', before);
    store.flushSync();
    const reopened: preferences.Preferences = preferences.getPreferencesSync(entryContext(), options);
    expect(reopened.getSync('slot', -1) as number).assertEqual(before);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_INST_0043
   * @tc.name      testAppInstance0043
   * @tc.desc      app index survives a json document of slots
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testAppInstance0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testAppInstance0043', 'app index survives a json document of slots');
    const info: bundleManager.BundleInfo = await selfBundle();
    const slots: string = JSON.stringify([0]);
    const parsed: number[] = JSON.parse(slots) as number[];
    expect(parsed.length).assertEqual(1);
    expect(parsed[info.appIndex]).assertEqual(info.appIndex);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_INST_0044
   * @tc.name      testAppInstance0044
   * @tc.desc      app index survives base64 encoding
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testAppInstance0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testAppInstance0044', 'app index survives base64 encoding');
    const info: bundleManager.BundleInfo = await selfBundle();
    const helper: util.Base64Helper = new util.Base64Helper();
    const encoded: Uint8Array = helper.encodeSync(new util.TextEncoder().encodeInto('slot-' + info.appIndex));
    const decoded: string = util.TextDecoder.create('utf-8').decodeToString(helper.decodeSync(encoded));
    expect(decoded).assertEqual('slot-' + info.appIndex);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_INST_0045
   * @tc.name      testAppInstance0045
   * @tc.desc      app index does not leak into module names
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testAppInstance0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testAppInstance0045', 'app index does not leak into module names');
    const info: bundleManager.BundleInfo = await selfBundle();
    const names: string[] = moduleNames(info);
    expect(names.includes('entry')).assertTrue();
    expect(names.includes('entry0')).assertFalse();
    expect(names.includes('entry1')).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_INST_0046
   * @tc.name      testAppInstance0046
   * @tc.desc      app index keeps the entry ability name
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testAppInstance0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testAppInstance0046', 'app index keeps the entry ability name');
    const info: bundleManager.BundleInfo = await selfBundle();
    const owner: bundleManager.HapModuleInfo = findModule(info, 'entry') as bundleManager.HapModuleInfo;
    expect(owner.abilitiesInfo[0].name).assertEqual('EntryAbility');
    expect(owner.abilitiesInfo[0].name.endsWith('Ability')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_INST_0047
   * @tc.name      testAppInstance0047
   * @tc.desc      app index keeps the entry main element
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testAppInstance0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testAppInstance0047', 'app index keeps the entry main element');
    const info: bundleManager.BundleInfo = await selfBundle();
    const owner: bundleManager.HapModuleInfo = findModule(info, 'entry') as bundleManager.HapModuleInfo;
    expect(owner.mainElementName).assertEqual('EntryAbility');
    expect(owner.installationFree).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_INST_0048
   * @tc.name      testAppInstance0048
   * @tc.desc      app index keeps the home skill
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testAppInstance0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testAppInstance0048', 'app index keeps the home skill');
    const info: bundleManager.BundleInfo = await selfBundle();
    const owner: bundleManager.HapModuleInfo = findModule(info, 'entry') as bundleManager.HapModuleInfo;
    expect(owner.abilitiesInfo[0].skills.length).assertEqual(1);
    expect(owner.abilitiesInfo[0].skills[0].actions.includes('action.system.home')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_INST_0049
   * @tc.name      testAppInstance0049
   * @tc.desc      app index keeps the signature identity
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testAppInstance0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testAppInstance0049', 'app index keeps the signature identity');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.signatureInfo.appId.indexOf(info.name)).assertEqual(0);
    expect(info.signatureInfo.appId.length > info.name.length).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_INST_0050
   * @tc.name      testAppInstance0050
   * @tc.desc      app index stays zero while reading the app scope
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testAppInstance0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testAppInstance0050', 'app index stays zero while reading the app scope');
    const before: number = (await selfBundle()).appIndex;
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.vendor).assertEqual('example');
    expect(info.appInfo.bundleType).assertEqual(bundleManager.BundleType.APP);
    expect((await selfBundle()).appIndex).assertEqual(before);
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_INST_0051
   * @tc.name      testAppInstance0051
   * @tc.desc      app label id is resolvable
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testAppInstance0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testAppInstance0051', 'app label id is resolvable');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.appInfo.labelId > 0).assertTrue();
    expect(info.appInfo.iconId > 0).assertTrue();
    expect(info.appInfo.enabled).assertTrue();
  });
  });
}
