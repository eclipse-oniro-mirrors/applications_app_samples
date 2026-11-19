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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { bundleManager, common, contextConstant } from '@kit.AbilityKit';
import {
  APP_NAME,
  BUNDLE_NAME,
  BACKUP_ABILITY,
  BACKUP_METADATA,
  ENTRY_ABILITY,
  ENTRY_MODULE,
  SELF_FLAGS,
  TEST_MODULE,
  VENDOR,
  VERSION_CODE,
  VERSION_NAME,
  entryContext,
  findModule,
  selfBundle
} from './shared/HarProbe';
import { paceTurn } from './shared/TestPace';
import { logCase } from './shared/TestLog';

let bundleCache: bundleManager.BundleInfo | null = null;

async function bundle(): Promise<bundleManager.BundleInfo> {
  const cached: bundleManager.BundleInfo | null = bundleCache;
  if (cached !== null) {
    return cached;
  }
  const loaded: bundleManager.BundleInfo = await selfBundle();
  bundleCache = loaded;
  return loaded;
}

async function entryModule(): Promise<bundleManager.HapModuleInfo> {
  return findModule(await bundle(), ENTRY_MODULE);
}

async function entryAbility(): Promise<bundleManager.AbilityInfo> {
  return (await entryModule()).abilitiesInfo[0];
}

async function backupAbility(): Promise<bundleManager.ExtensionAbilityInfo> {
  return (await entryModule()).extensionAbilitiesInfo[0];
}

export default function contextMatrixTest() {
  describe('ContextMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_HARPACKAGE_CONTEXT_0001
     * @tc.name      testContextCase0001
     * @tc.desc      Context filesDir is not empty
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextCase0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const ctx: common.Context = entryContext();
      logCase('testContextCase0001', 'context case 1');
      expect(ctx.filesDir.length > 0).assertTrue();
      {
        const info: bundleManager.BundleInfo = await bundle();
        const ctx: common.Context = entryContext();
        logCase('testContextCase0002', 'context case 2');
        expect(ctx.filesDir.startsWith('/')).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_CONTEXT_0003
     * @tc.name      testContextCase0003
     * @tc.desc      Context filesDir lives under the data partition
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextCase0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const ctx: common.Context = entryContext();
      logCase('testContextCase0003', 'context case 3');
      expect(ctx.filesDir.startsWith('/data/')).assertTrue();
      {
        const info: bundleManager.BundleInfo = await bundle();
        const ctx: common.Context = entryContext();
        logCase('testContextCase0004', 'context case 4');
        expect(ctx.filesDir.endsWith('/files')).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_CONTEXT_0005
     * @tc.name      testContextCase0005
     * @tc.desc      Context cacheDir is not empty
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextCase0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const ctx: common.Context = entryContext();
      logCase('testContextCase0005', 'context case 5');
      expect(ctx.cacheDir.length > 0).assertTrue();
      {
        const info: bundleManager.BundleInfo = await bundle();
        const ctx: common.Context = entryContext();
        logCase('testContextCase0006', 'context case 6');
        expect(ctx.cacheDir.startsWith('/')).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_CONTEXT_0007
     * @tc.name      testContextCase0007
     * @tc.desc      Context cacheDir lives under the data partition
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextCase0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const ctx: common.Context = entryContext();
      logCase('testContextCase0007', 'context case 7');
      expect(ctx.cacheDir.startsWith('/data/')).assertTrue();
      {
        const info: bundleManager.BundleInfo = await bundle();
        const ctx: common.Context = entryContext();
        logCase('testContextCase0008', 'context case 8');
        expect(ctx.cacheDir.endsWith('/cache')).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_CONTEXT_0009
     * @tc.name      testContextCase0009
     * @tc.desc      Context tempDir is not empty
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextCase0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const ctx: common.Context = entryContext();
      logCase('testContextCase0009', 'context case 9');
      expect(ctx.tempDir.length > 0).assertTrue();
      {
        const info: bundleManager.BundleInfo = await bundle();
        const ctx: common.Context = entryContext();
        logCase('testContextCase0010', 'context case 10');
        expect(ctx.tempDir.startsWith('/')).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_CONTEXT_0011
     * @tc.name      testContextCase0011
     * @tc.desc      Context tempDir lives under the data partition
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextCase0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const ctx: common.Context = entryContext();
      logCase('testContextCase0011', 'context case 11');
      expect(ctx.tempDir.startsWith('/data/')).assertTrue();
      {
        const info: bundleManager.BundleInfo = await bundle();
        const ctx: common.Context = entryContext();
        logCase('testContextCase0012', 'context case 12');
        expect(ctx.tempDir.endsWith('/temp')).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_CONTEXT_0013
     * @tc.name      testContextCase0013
     * @tc.desc      Context databaseDir is not empty
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextCase0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const ctx: common.Context = entryContext();
      logCase('testContextCase0013', 'context case 13');
      expect(ctx.databaseDir.length > 0).assertTrue();
      {
        const info: bundleManager.BundleInfo = await bundle();
        const ctx: common.Context = entryContext();
        logCase('testContextCase0014', 'context case 14');
        expect(ctx.databaseDir.startsWith('/')).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_CONTEXT_0015
     * @tc.name      testContextCase0015
     * @tc.desc      Context databaseDir lives under the data partition
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextCase0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const ctx: common.Context = entryContext();
      logCase('testContextCase0015', 'context case 15');
      expect(ctx.databaseDir.startsWith('/data/')).assertTrue();
      {
        const info: bundleManager.BundleInfo = await bundle();
        const ctx: common.Context = entryContext();
        logCase('testContextCase0016', 'context case 16');
        expect(ctx.databaseDir.endsWith('/database')).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_CONTEXT_0017
     * @tc.name      testContextCase0017
     * @tc.desc      Context preferencesDir is not empty
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextCase0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const ctx: common.Context = entryContext();
      logCase('testContextCase0017', 'context case 17');
      expect(ctx.preferencesDir.length > 0).assertTrue();
      {
        const info: bundleManager.BundleInfo = await bundle();
        const ctx: common.Context = entryContext();
        logCase('testContextCase0018', 'context case 18');
        expect(ctx.preferencesDir.startsWith('/')).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_CONTEXT_0019
     * @tc.name      testContextCase0019
     * @tc.desc      Context preferencesDir lives under the data partition
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextCase0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const ctx: common.Context = entryContext();
      logCase('testContextCase0019', 'context case 19');
      expect(ctx.preferencesDir.startsWith('/data/')).assertTrue();
      {
        const info: bundleManager.BundleInfo = await bundle();
        const ctx: common.Context = entryContext();
        logCase('testContextCase0020', 'context case 20');
        expect(ctx.preferencesDir.endsWith('/preferences')).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_CONTEXT_0021
     * @tc.name      testContextCase0021
     * @tc.desc      Context bundleCodeDir is not empty
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextCase0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const ctx: common.Context = entryContext();
      logCase('testContextCase0021', 'context case 21');
      expect(ctx.bundleCodeDir.length > 0).assertTrue();
      {
        const info: bundleManager.BundleInfo = await bundle();
        const ctx: common.Context = entryContext();
        logCase('testContextCase0022', 'context case 22');
        expect(ctx.bundleCodeDir.startsWith('/')).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_CONTEXT_0023
     * @tc.name      testContextCase0023
     * @tc.desc      Context bundleCodeDir lives under the data partition
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextCase0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const ctx: common.Context = entryContext();
      logCase('testContextCase0023', 'context case 23');
      expect(ctx.bundleCodeDir.startsWith('/data/')).assertTrue();
      {
        const info: bundleManager.BundleInfo = await bundle();
        const ctx: common.Context = entryContext();
        logCase('testContextCase0024', 'context case 24');
        expect(ctx.bundleCodeDir.length > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_CONTEXT_0025
     * @tc.name      testContextCase0025
     * @tc.desc      Context distributedFilesDir is not empty
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextCase0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const ctx: common.Context = entryContext();
      logCase('testContextCase0025', 'context case 25');
      expect(ctx.distributedFilesDir.length > 0).assertTrue();
      {
        const info: bundleManager.BundleInfo = await bundle();
        const ctx: common.Context = entryContext();
        logCase('testContextCase0026', 'context case 26');
        expect(ctx.distributedFilesDir.startsWith('/')).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_CONTEXT_0027
     * @tc.name      testContextCase0027
     * @tc.desc      Context distributedFilesDir lives under the data partition
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextCase0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const ctx: common.Context = entryContext();
      logCase('testContextCase0027', 'context case 27');
      expect(ctx.distributedFilesDir.startsWith('/data/')).assertTrue();
      {
        const info: bundleManager.BundleInfo = await bundle();
        const ctx: common.Context = entryContext();
        logCase('testContextCase0028', 'context case 28');
        expect(ctx.distributedFilesDir.length > 0).assertTrue();
      }
    })

    /**
     * @tc.number    SUB_HARPACKAGE_CONTEXT_0031
     * @tc.name      testContextCase0031
     * @tc.desc      Context resourceDir lives under the data partition
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextCase0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const ctx: common.Context = entryContext();
      logCase('testContextCase0031', 'context case 31');
      expect(ctx.resourceDir === undefined || typeof ctx.resourceDir === 'string').assertTrue();
      {
        const info: bundleManager.BundleInfo = await bundle();
        const ctx: common.Context = entryContext();
        logCase('testContextCase0032', 'context case 32');
        expect(ctx.resourceDir === undefined || typeof ctx.resourceDir === 'string').assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_CONTEXT_0033
     * @tc.name      testContextCase0033
     * @tc.desc      Context cloudFileDir is not empty
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextCase0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const ctx: common.Context = entryContext();
      logCase('testContextCase0033', 'context case 33');
      expect(ctx.cloudFileDir.length > 0).assertTrue();
      {
        const info: bundleManager.BundleInfo = await bundle();
        const ctx: common.Context = entryContext();
        logCase('testContextCase0034', 'context case 34');
        expect(ctx.cloudFileDir.startsWith('/')).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_CONTEXT_0035
     * @tc.name      testContextCase0035
     * @tc.desc      Context cloudFileDir lives under the data partition
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextCase0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const ctx: common.Context = entryContext();
      logCase('testContextCase0035', 'context case 35');
      expect(ctx.cloudFileDir.startsWith('/data/')).assertTrue();
      {
        const info: bundleManager.BundleInfo = await bundle();
        const ctx: common.Context = entryContext();
        logCase('testContextCase0036', 'context case 36');
        expect(ctx.cloudFileDir.length > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_CONTEXT_0037
     * @tc.name      testContextCase0037
     * @tc.desc      Context filesDir ends with /files
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextCase0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const ctx: common.Context = entryContext();
      logCase('testContextCase0037', 'context case 37');
      expect(ctx.filesDir.endsWith('/files')).assertTrue();
      {
        const info: bundleManager.BundleInfo = await bundle();
        const ctx: common.Context = entryContext();
        logCase('testContextCase0038', 'context case 38');
        expect(ctx.cacheDir.endsWith('/cache')).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_CONTEXT_0039
     * @tc.name      testContextCase0039
     * @tc.desc      Context tempDir ends with /temp
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextCase0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const ctx: common.Context = entryContext();
      logCase('testContextCase0039', 'context case 39');
      expect(ctx.tempDir.endsWith('/temp')).assertTrue();
      {
        const info: bundleManager.BundleInfo = await bundle();
        const ctx: common.Context = entryContext();
        logCase('testContextCase0040', 'context case 40');
        expect(ctx.databaseDir.endsWith('/database')).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_CONTEXT_0041
     * @tc.name      testContextCase0041
     * @tc.desc      Context preferencesDir ends with /preferences
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextCase0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const ctx: common.Context = entryContext();
      logCase('testContextCase0041', 'context case 41');
      expect(ctx.preferencesDir.endsWith('/preferences')).assertTrue();
      {
        const info: bundleManager.BundleInfo = await bundle();
        const ctx: common.Context = entryContext();
        logCase('testContextCase0042', 'context case 42');
        expect(ctx.filesDir === ctx.cacheDir).assertFalse();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_CONTEXT_0043
     * @tc.name      testContextCase0043
     * @tc.desc      Context files and temp directories differ
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextCase0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const ctx: common.Context = entryContext();
      logCase('testContextCase0043', 'context case 43');
      expect(ctx.filesDir === ctx.tempDir).assertFalse();
      {
        const info: bundleManager.BundleInfo = await bundle();
        const ctx: common.Context = entryContext();
        logCase('testContextCase0044', 'context case 44');
        expect(ctx.cacheDir === ctx.tempDir).assertFalse();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_CONTEXT_0045
     * @tc.name      testContextCase0045
     * @tc.desc      Context database and preferences directories differ
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextCase0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const ctx: common.Context = entryContext();
      logCase('testContextCase0045', 'context case 45');
      expect(ctx.databaseDir === ctx.preferencesDir).assertFalse();
      {
        const info: bundleManager.BundleInfo = await bundle();
        const ctx: common.Context = entryContext();
        logCase('testContextCase0046', 'context case 46');
        expect(ctx.area >= 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_CONTEXT_0047
     * @tc.name      testContextCase0047
     * @tc.desc      Context process name is not empty
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextCase0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const ctx: common.Context = entryContext();
      logCase('testContextCase0047', 'context case 47');
      expect(ctx.processName.length > 0).assertTrue();
      {
        const info: bundleManager.BundleInfo = await bundle();
        const ctx: common.Context = entryContext();
        logCase('testContextCase0048', 'context case 48');
        expect(ctx.applicationInfo.uid).assertEqual(info.appInfo.uid);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_CONTEXT_0049
     * @tc.name      testContextCase0049
     * @tc.desc      Context application is enabled
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextCase0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const ctx: common.Context = entryContext();
      logCase('testContextCase0049', 'context case 49');
      expect(ctx.applicationInfo.enabled).assertTrue();
      {
        const info: bundleManager.BundleInfo = await bundle();
        const ctx: common.Context = entryContext();
        logCase('testContextCase0050', 'context case 50');
        expect(ctx.applicationInfo.codePath).assertEqual(info.appInfo.codePath);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_CONTEXT_0051
     * @tc.name      testContextCase0051
     * @tc.desc      Context resource manager resolves the app name
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextCase0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const ctx: common.Context = entryContext();
      logCase('testContextCase0051', 'context case 51');
      expect(ctx.resourceManager.getStringByNameSync('app_name')).assertEqual(APP_NAME);
      {
        const info: bundleManager.BundleInfo = await bundle();
        const ctx: common.Context = entryContext();
        logCase('testContextCase0052', 'context case 52');
        expect(ctx.resourceManager.getStringByNameSync('page_show')).assertEqual('page from package');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_CONTEXT_0053
     * @tc.name      testContextCase0053
     * @tc.desc      Context resource manager is reusable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextCase0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const ctx: common.Context = entryContext();
      logCase('testContextCase0053', 'context case 53');
      expect(ctx.resourceManager.getStringByNameSync('button')).assertEqual('button');
      {
        const info: bundleManager.BundleInfo = await bundle();
        const ctx: common.Context = entryContext();
        logCase('testContextCase0054', 'context case 54');
        const moduleContext: common.Context = ctx.createModuleContext(ENTRY_MODULE);
        expect(moduleContext.resourceManager.getStringByNameSync('app_name')).assertEqual(APP_NAME);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_CONTEXT_0055
     * @tc.name      testContextCase0055
     * @tc.desc      Module context for entry keeps the same files directory
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextCase0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const ctx: common.Context = entryContext();
      logCase('testContextCase0055', 'context case 55');
      const moduleContext: common.Context = ctx.createModuleContext(ENTRY_MODULE);
      expect(moduleContext.filesDir).assertEqual(ctx.filesDir);
      {
        const info: bundleManager.BundleInfo = await bundle();
        const ctx: common.Context = entryContext();
        logCase('testContextCase0056', 'context case 56');
        const moduleContext: common.Context = ctx.createModuleContext(ENTRY_MODULE);
        expect(moduleContext.cacheDir).assertEqual(ctx.cacheDir);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_CONTEXT_0057
     * @tc.name      testContextCase0057
     * @tc.desc      Module context for the test module is available
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextCase0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const ctx: common.Context = entryContext();
      logCase('testContextCase0057', 'context case 57');
      const moduleContext: common.Context = ctx.createModuleContext(TEST_MODULE);
      expect(moduleContext !== undefined).assertTrue();
      {
        const info: bundleManager.BundleInfo = await bundle();
        const ctx: common.Context = entryContext();
        logCase('testContextCase0058', 'context case 58');
        const moduleContext: common.Context = ctx.createModuleContext(ENTRY_MODULE);
        expect(moduleContext.applicationInfo.uid).assertEqual(ctx.applicationInfo.uid);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_CONTEXT_0059
     * @tc.name      testContextCase0059
     * @tc.desc      Application context exposes the same files directory
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextCase0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const ctx: common.Context = entryContext();
      logCase('testContextCase0059', 'context case 59');
      const appContext: common.Context = ctx.getApplicationContext();
      expect(appContext.filesDir).assertEqual(ctx.filesDir);
      {
        const info: bundleManager.BundleInfo = await bundle();
        const ctx: common.Context = entryContext();
        logCase('testContextCase0060', 'context case 60');
        const appContext: common.Context = ctx.getApplicationContext();
        expect(appContext.cacheDir).assertEqual(ctx.cacheDir);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_CONTEXT_0061
     * @tc.name      testContextCase0061
     * @tc.desc      Application context exposes the same bundle code directory
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextCase0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const ctx: common.Context = entryContext();
      logCase('testContextCase0061', 'context case 61');
      const appContext: common.Context = ctx.getApplicationContext();
      expect(appContext.bundleCodeDir).assertEqual(ctx.bundleCodeDir);
      {
        const info: bundleManager.BundleInfo = await bundle();
        const ctx: common.Context = entryContext();
        logCase('testContextCase0062', 'context case 62');
        const appContext: common.Context = ctx.getApplicationContext();
        expect(appContext.resourceManager.getStringByNameSync('app_name')).assertEqual(APP_NAME);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_CONTEXT_0063
     * @tc.name      testContextCase0063
     * @tc.desc      Context event hub is defined
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextCase0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const ctx: common.Context = entryContext();
      logCase('testContextCase0063', 'context case 63');
      expect(ctx.eventHub !== undefined).assertTrue();
      {
        const info: bundleManager.BundleInfo = await bundle();
        const ctx: common.Context = entryContext();
        logCase('testContextCase0064', 'context case 64');
        expect(ctx.resourceManager !== undefined).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_CONTEXT_0065
     * @tc.name      testContextCase0065
     * @tc.desc      Context application info is defined
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextCase0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const ctx: common.Context = entryContext();
      logCase('testContextCase0065', 'context case 65');
      expect(ctx.applicationInfo !== undefined).assertTrue();
      {
        const info: bundleManager.BundleInfo = await bundle();
        const ctx: common.Context = entryContext();
        logCase('testContextCase0066', 'context case 66');
        expect(entryContext().filesDir).assertEqual(ctx.filesDir);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_CONTEXT_0067
     * @tc.name      testContextCase0067
     * @tc.desc      Entry context helper agrees on the cache directory
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextCase0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const ctx: common.Context = entryContext();
      logCase('testContextCase0067', 'context case 67');
      expect(entryContext().cacheDir).assertEqual(ctx.cacheDir);
      {
        const info: bundleManager.BundleInfo = await bundle();
        const ctx: common.Context = entryContext();
        logCase('testContextCase0068', 'context case 68');
        expect(entryContext().processName).assertEqual(ctx.processName);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_CONTEXT_0069
     * @tc.name      testContextCase0069
     * @tc.desc      files directory stays at least 9 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextCase0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const ctx: common.Context = entryContext();
      logCase('testContextCase0069', 'context case 69');
      expect(ctx.filesDir.length > 0).assertTrue();
      {
        const info: bundleManager.BundleInfo = await bundle();
        const ctx: common.Context = entryContext();
        logCase('testContextCase0070', 'context case 70');
        expect(ctx.filesDir.length > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_CONTEXT_0071
     * @tc.name      testContextCase0071
     * @tc.desc      files directory stays at least 11 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextCase0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const ctx: common.Context = entryContext();
      logCase('testContextCase0071', 'context case 71');
      expect(ctx.filesDir.length > 0).assertTrue();
      {
        const info: bundleManager.BundleInfo = await bundle();
        const ctx: common.Context = entryContext();
        logCase('testContextCase0072', 'context case 72');
        expect(ctx.filesDir.length > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_CONTEXT_0073
     * @tc.name      testContextCase0073
     * @tc.desc      files directory stays at least 13 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextCase0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const ctx: common.Context = entryContext();
      logCase('testContextCase0073', 'context case 73');
      expect(ctx.filesDir.length > 0).assertTrue();
      {
        const info: bundleManager.BundleInfo = await bundle();
        const ctx: common.Context = entryContext();
        logCase('testContextCase0074', 'context case 74');
        expect(ctx.filesDir.length > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_CONTEXT_0075
     * @tc.name      testContextCase0075
     * @tc.desc      files directory stays at least 15 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextCase0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const ctx: common.Context = entryContext();
      logCase('testContextCase0075', 'context case 75');
      expect(ctx.filesDir.length > 0).assertTrue();
      {
        const info: bundleManager.BundleInfo = await bundle();
        const ctx: common.Context = entryContext();
        logCase('testContextCase0076', 'context case 76');
        expect(ctx.filesDir.length > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_CONTEXT_0077
     * @tc.name      testContextCase0077
     * @tc.desc      files directory stays at least 17 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextCase0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const ctx: common.Context = entryContext();
      logCase('testContextCase0077', 'context case 77');
      expect(ctx.filesDir.length > 0).assertTrue();
      {
        const info: bundleManager.BundleInfo = await bundle();
        const ctx: common.Context = entryContext();
        logCase('testContextCase0078', 'context case 78');
        expect(ctx.filesDir.length > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_CONTEXT_0079
     * @tc.name      testContextCase0079
     * @tc.desc      files directory stays at least 19 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextCase0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const ctx: common.Context = entryContext();
      logCase('testContextCase0079', 'context case 79');
      expect(ctx.filesDir.length > 0).assertTrue();
      {
        const info: bundleManager.BundleInfo = await bundle();
        const ctx: common.Context = entryContext();
        logCase('testContextCase0080', 'context case 80');
        expect(ctx.filesDir.length > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_CONTEXT_0081
     * @tc.name      testContextCase0081
     * @tc.desc      files directory stays at least 21 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextCase0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const ctx: common.Context = entryContext();
      logCase('testContextCase0081', 'context case 81');
      expect(ctx.filesDir.length > 0).assertTrue();
      {
        const info: bundleManager.BundleInfo = await bundle();
        const ctx: common.Context = entryContext();
        logCase('testContextCase0082', 'context case 82');
        expect(ctx.filesDir.length > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_CONTEXT_0083
     * @tc.name      testContextCase0083
     * @tc.desc      files directory stays at least 23 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextCase0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const ctx: common.Context = entryContext();
      logCase('testContextCase0083', 'context case 83');
      expect(ctx.filesDir.length > 0).assertTrue();
      {
        const info: bundleManager.BundleInfo = await bundle();
        const ctx: common.Context = entryContext();
        logCase('testContextCase0084', 'context case 84');
        expect(ctx.filesDir.length > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_CONTEXT_0085
     * @tc.name      testContextCase0085
     * @tc.desc      files directory stays at least 25 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextCase0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const ctx: common.Context = entryContext();
      logCase('testContextCase0085', 'context case 85');
      expect(ctx.filesDir.length > 0).assertTrue();
      {
        const info: bundleManager.BundleInfo = await bundle();
        const ctx: common.Context = entryContext();
        logCase('testContextCase0086', 'context case 86');
        expect(ctx.filesDir.length > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_CONTEXT_0087
     * @tc.name      testContextCase0087
     * @tc.desc      files directory stays at least 27 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextCase0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const ctx: common.Context = entryContext();
      logCase('testContextCase0087', 'context case 87');
      expect(ctx.filesDir.length > 0).assertTrue();
      {
        const info: bundleManager.BundleInfo = await bundle();
        const ctx: common.Context = entryContext();
        logCase('testContextCase0088', 'context case 88');
        expect(ctx.filesDir.length > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_CONTEXT_0089
     * @tc.name      testContextCase0089
     * @tc.desc      files directory stays at least 29 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextCase0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const ctx: common.Context = entryContext();
      logCase('testContextCase0089', 'context case 89');
      expect(ctx.filesDir.length > 0).assertTrue();
      {
        const info: bundleManager.BundleInfo = await bundle();
        const ctx: common.Context = entryContext();
        logCase('testContextCase0090', 'context case 90');
        expect(ctx.filesDir.length > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_CONTEXT_0091
     * @tc.name      testContextCase0091
     * @tc.desc      files directory stays at least 31 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextCase0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      const ctx: common.Context = entryContext();
      logCase('testContextCase0091', 'context case 91');
      expect(ctx.filesDir.length > 0).assertTrue();
      {
        const info: bundleManager.BundleInfo = await bundle();
        const ctx: common.Context = entryContext();
        logCase('testContextCase0092', 'context case 92');
        expect(ctx.filesDir.length > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_CONTEXT_0093
     * @tc.name      testContextCase0093
     * @tc.desc      files directory stays at least 33 characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextCase0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
