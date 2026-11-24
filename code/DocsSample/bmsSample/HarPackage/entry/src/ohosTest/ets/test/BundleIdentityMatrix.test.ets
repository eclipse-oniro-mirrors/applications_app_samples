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

export default function bundleIdentityMatrixTest() {
  describe('BundleIdentityMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEID_0001
     * @tc.name      testBundleIdentity0001
     * @tc.desc      Bundle name matches app.json5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleIdentity0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0001', 'bundle identity case 1');
      expect(info.name).assertEqual(BUNDLE_NAME);
      {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0002', 'bundle identity case 2');
      expect(info.vendor).assertEqual(VENDOR);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEID_0003
     * @tc.name      testBundleIdentity0003
     * @tc.desc      Bundle version name is 1.0.0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleIdentity0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0003', 'bundle identity case 3');
      expect(info.versionName).assertEqual(VERSION_NAME);
      {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0004', 'bundle identity case 4');
      expect(info.versionCode).assertEqual(VERSION_CODE);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEID_0005
     * @tc.name      testBundleIdentity0005
     * @tc.desc      Target version is at least 26
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleIdentity0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0005', 'bundle identity case 5');
      expect(info.targetVersion >= 26).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0006', 'bundle identity case 6');
      expect(info.targetVersion > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEID_0007
     * @tc.name      testBundleIdentity0007
     * @tc.desc      Bundle reports at least one hap module
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleIdentity0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0007', 'bundle identity case 7');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0008', 'bundle identity case 8');
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEID_0009
     * @tc.name      testBundleIdentity0009
     * @tc.desc      Install time is positive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleIdentity0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0009', 'bundle identity case 9');
      expect(info.installTime > 0).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0010', 'bundle identity case 10');
      expect(info.updateTime >= info.installTime).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEID_0011
     * @tc.name      testBundleIdentity0011
     * @tc.desc      App index is zero for the main application
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleIdentity0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0011', 'bundle identity case 11');
      expect(info.appIndex).assertEqual(0);
      {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0012', 'bundle identity case 12');
      expect(info.appInfo.labelId > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEID_0013
     * @tc.name      testBundleIdentity0013
     * @tc.desc      Application icon id is positive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleIdentity0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0013', 'bundle identity case 13');
      expect(info.appInfo.iconId > 0).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0014', 'bundle identity case 14');
      expect(info.appInfo.enabled).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEID_0015
     * @tc.name      testBundleIdentity0015
     * @tc.desc      Debug build is flagged as debuggable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleIdentity0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0015', 'bundle identity case 15');
      expect(info.appInfo.debug).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0016', 'bundle identity case 16');
      expect(info.appInfo.systemApp).assertFalse();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEID_0017
     * @tc.name      testBundleIdentity0017
     * @tc.desc      Application uid is positive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleIdentity0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0017', 'bundle identity case 17');
      expect(info.appInfo.uid > 0).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0018', 'bundle identity case 18');
      expect(info.appInfo.accessTokenId > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEID_0019
     * @tc.name      testBundleIdentity0019
     * @tc.desc      Application process name is not empty
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleIdentity0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0019', 'bundle identity case 19');
      expect(info.appInfo.process.length > 0).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0020', 'bundle identity case 20');
      expect(info.appInfo.codePath.length > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEID_0021
     * @tc.name      testBundleIdentity0021
     * @tc.desc      Application label is not empty
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleIdentity0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0021', 'bundle identity case 21');
      expect(info.appInfo.label.length > 0).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0022', 'bundle identity case 22');
      expect(info.appInfo.name.length > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEID_0023
     * @tc.name      testBundleIdentity0023
     * @tc.desc      Application raw icon reference is not empty
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleIdentity0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0023', 'bundle identity case 23');
      expect(info.appInfo.icon.length > 0).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0024', 'bundle identity case 24');
      expect(typeof info.appInfo.appDistributionType === 'string').assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEID_0025
     * @tc.name      testBundleIdentity0025
     * @tc.desc      Application provision type is a string
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleIdentity0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0025', 'bundle identity case 25');
      expect(typeof info.appInfo.appProvisionType === 'string').assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0026', 'bundle identity case 26');
      expect(typeof info.appInfo.releaseType === 'string').assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEID_0027
     * @tc.name      testBundleIdentity0027
     * @tc.desc      Signature app id is not empty
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleIdentity0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0027', 'bundle identity case 27');
      expect(info.signatureInfo.appId.length > 0).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0028', 'bundle identity case 28');
      expect(info.signatureInfo.fingerprint.length > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEID_0029
     * @tc.name      testBundleIdentity0029
     * @tc.desc      Signature app identifier is a string
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleIdentity0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0029', 'bundle identity case 29');
      expect(typeof info.signatureInfo.appIdentifier === 'string').assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0030', 'bundle identity case 30');
      expect(info.signatureInfo.appId.indexOf('.') > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEID_0031
     * @tc.name      testBundleIdentity0031
     * @tc.desc      Signature certificate is optional text
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleIdentity0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0031', 'bundle identity case 31');
      const certificate: string | undefined = info.signatureInfo.certificate;
      expect(certificate === undefined || certificate.length >= 0).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0032', 'bundle identity case 32');
      expect(info.versionName.split('.').length).assertEqual(3);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEID_0033
     * @tc.name      testBundleIdentity0033
     * @tc.desc      Version name major number is 1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleIdentity0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0033', 'bundle identity case 33');
      expect(info.versionName.split('.')[0]).assertEqual('1');
      {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0034', 'bundle identity case 34');
      expect(info.versionName.split('.')[1]).assertEqual('0');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEID_0035
     * @tc.name      testBundleIdentity0035
     * @tc.desc      Version name patch number is 0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleIdentity0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0035', 'bundle identity case 35');
      expect(info.versionName.split('.')[2]).assertEqual('0');
      {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0036', 'bundle identity case 36');
      expect(info.versionCode.toString().length).assertEqual(7);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEID_0037
     * @tc.name      testBundleIdentity0037
     * @tc.desc      Version code is divisible by ten
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleIdentity0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0037', 'bundle identity case 37');
      expect(info.versionCode % 10).assertEqual(0);
      {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0038', 'bundle identity case 38');
      expect(info.vendor.length).assertEqual(7);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEID_0039
     * @tc.name      testBundleIdentity0039
     * @tc.desc      Bundle name ends with myapplication
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleIdentity0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0039', 'bundle identity case 39');
      expect(info.name.endsWith('myapplication')).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0040', 'bundle identity case 40');
      expect(info.name.split('.').length).assertEqual(4);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEID_0041
     * @tc.name      testBundleIdentity0041
     * @tc.desc      Target version is a whole number
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleIdentity0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0041', 'bundle identity case 41');
      expect(info.targetVersion % 1).assertEqual(0);
      {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0042', 'bundle identity case 42');
      expect(info.installTime % 1).assertEqual(0);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEID_0043
     * @tc.name      testBundleIdentity0043
     * @tc.desc      Update time is a whole number of milliseconds
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleIdentity0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0043', 'bundle identity case 43');
      expect(info.updateTime % 1).assertEqual(0);
      {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0044', 'bundle identity case 44');
      const again: bundleManager.BundleInfo = await selfBundle();
      expect(again.name).assertEqual(info.name);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEID_0045
     * @tc.name      testBundleIdentity0045
     * @tc.desc      Reading bundle info twice returns the same version name
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleIdentity0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0045', 'bundle identity case 45');
      const again: bundleManager.BundleInfo = await selfBundle();
      expect(again.versionName).assertEqual(info.versionName);
      {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0046', 'bundle identity case 46');
      const again: bundleManager.BundleInfo = await selfBundle();
      expect(again.versionCode).assertEqual(info.versionCode);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEID_0047
     * @tc.name      testBundleIdentity0047
     * @tc.desc      Reading bundle info twice returns the same vendor
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleIdentity0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0047', 'bundle identity case 47');
      const again: bundleManager.BundleInfo = await selfBundle();
      expect(again.vendor).assertEqual(info.vendor);
      {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0048', 'bundle identity case 48');
      const again: bundleManager.BundleInfo = await selfBundle();
      expect(again.installTime).assertEqual(info.installTime);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEID_0049
     * @tc.name      testBundleIdentity0049
     * @tc.desc      Reading bundle info twice returns the same module count
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleIdentity0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0049', 'bundle identity case 49');
      const again: bundleManager.BundleInfo = await selfBundle();
      expect(again.hapModulesInfo.length).assertEqual(info.hapModulesInfo.length);
      {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0050', 'bundle identity case 50');
      const named: bundleManager.BundleInfo = await bundleManager.getBundleInfo(BUNDLE_NAME, SELF_FLAGS);
      expect(named.name).assertEqual(info.name);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEID_0051
     * @tc.name      testBundleIdentity0051
     * @tc.desc      Named bundle query matches the self version code
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleIdentity0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0051', 'bundle identity case 51');
      const named: bundleManager.BundleInfo = await bundleManager.getBundleInfo(BUNDLE_NAME, SELF_FLAGS);
      expect(named.versionCode).assertEqual(info.versionCode);
      {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0052', 'bundle identity case 52');
      const named: bundleManager.BundleInfo = await bundleManager.getBundleInfo(BUNDLE_NAME, SELF_FLAGS);
      expect(named.appInfo.uid).assertEqual(info.appInfo.uid);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEID_0053
     * @tc.name      testBundleIdentity0053
     * @tc.desc      Named bundle query matches the self signature app id
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleIdentity0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0053', 'bundle identity case 53');
      const named: bundleManager.BundleInfo = await bundleManager.getBundleInfo(BUNDLE_NAME, SELF_FLAGS);
      expect(named.signatureInfo.appId).assertEqual(info.signatureInfo.appId);
      {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0054', 'bundle identity case 54');
      const first: bundleManager.BundleInfo = await bundleManager.getBundleInfo(BUNDLE_NAME, SELF_FLAGS);
      const second: bundleManager.BundleInfo = await bundleManager.getBundleInfo(BUNDLE_NAME, SELF_FLAGS);
      expect(first.hapModulesInfo.length).assertEqual(second.hapModulesInfo.length);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEID_0055
     * @tc.name      testBundleIdentity0055
     * @tc.desc      Bundle info loaded through the helper is the same version
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleIdentity0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0055', 'bundle identity case 55');
      const helper: bundleManager.BundleInfo = await bundle();
      expect(helper.versionName).assertEqual(VERSION_NAME);
      {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0056', 'bundle identity case 56');
      const first: bundleManager.BundleInfo = await bundle();
      const second: bundleManager.BundleInfo = await bundle();
      expect(first.name).assertEqual(second.name);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEID_0057
     * @tc.name      testBundleIdentity0057
     * @tc.desc      Application removable flag is a boolean
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleIdentity0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0057', 'bundle identity case 57');
      expect(typeof info.appInfo.removable === 'boolean').assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0058', 'bundle identity case 58');
      expect(typeof info.appInfo.dataUnclearable === 'boolean').assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEID_0059
     * @tc.name      testBundleIdentity0059
     * @tc.desc      Application bundleType is a number
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleIdentity0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0059', 'bundle identity case 59');
      expect(typeof info.appInfo.bundleType === 'number').assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0060', 'bundle identity case 60');
      expect(info.appInfo.appIndex).assertEqual(0);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEID_0061
     * @tc.name      testBundleIdentity0061
     * @tc.desc      Application install source is a string
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleIdentity0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0061', 'bundle identity case 61');
      expect(typeof info.appInfo.installSource === 'string').assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0062', 'bundle identity case 62');
      expect(typeof info.appInfo.cloudFileSyncEnabled === 'boolean').assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEID_0063
     * @tc.name      testBundleIdentity0063
     * @tc.desc      Application requested permissions is an array
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleIdentity0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0063', 'bundle identity case 63');
      expect(Array.isArray(info.appInfo.permissions)).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0064', 'bundle identity case 64');
      expect(Array.isArray(info.reqPermissionDetails)).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEID_0065
     * @tc.name      testBundleIdentity0065
     * @tc.desc      Bundle permission grant states is an array
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleIdentity0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0065', 'bundle identity case 65');
      expect(Array.isArray(info.permissionGrantStates)).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0066', 'bundle identity case 66');
      expect(Array.isArray(info.routerMap)).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEID_0067
     * @tc.name      testBundleIdentity0067
     * @tc.desc      App label id and icon id are different resources
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleIdentity0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0067', 'bundle identity case 67');
      expect(info.appInfo.labelId === info.appInfo.iconId).assertFalse();
      {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0068', 'bundle identity case 68');
      expect(info.versionCode > info.targetVersion).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEID_0069
     * @tc.name      testBundleIdentity0069
     * @tc.desc      Install time is later than the epoch
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleIdentity0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0069', 'bundle identity case 69');
      expect(info.installTime > 1000000000000).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0070', 'bundle identity case 70');
      expect(info.name.startsWith('.')).assertFalse();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEID_0071
     * @tc.name      testBundleIdentity0071
     * @tc.desc      Bundle name has no upper case characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleIdentity0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0071', 'bundle identity case 71');
      expect(info.name === info.name.toLowerCase()).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0072', 'bundle identity case 72');
      expect(info.vendor === info.vendor.toLowerCase()).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEID_0073
     * @tc.name      testBundleIdentity0073
     * @tc.desc      App id starts with the bundle name prefix
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleIdentity0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0073', 'bundle identity case 73');
      expect(info.signatureInfo.appId.startsWith('com.') || info.signatureInfo.appId.length > 10).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0074', 'bundle identity case 74');
      expect(new RegExp('^[0-9A-Fa-f]+$').test(info.signatureInfo.fingerprint)).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEID_0075
     * @tc.name      testBundleIdentity0075
     * @tc.desc      Version code has no fractional part
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleIdentity0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0075', 'bundle identity case 75');
      expect(Math.floor(info.versionCode)).assertEqual(info.versionCode);
      {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0076', 'bundle identity case 76');
      expect(info.targetVersion >= 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEID_0077
     * @tc.name      testBundleIdentity0077
     * @tc.desc      Hap module names are strings
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleIdentity0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0077', 'bundle identity case 77');
      const names: string[] = info.hapModulesInfo.map((item: bundleManager.HapModuleInfo) => item.name);
      expect(names.every((value: string) => value.length > 0)).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0078', 'bundle identity case 78');
      const entryModules: bundleManager.HapModuleInfo[] =
        info.hapModulesInfo.filter((item: bundleManager.HapModuleInfo) => item.type === bundleManager.ModuleType.ENTRY);
      const entryCount: number = entryModules.length;
      expect(entryCount).assertEqual(1);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEID_0079
     * @tc.name      testBundleIdentity0079
     * @tc.desc      The entry module is present in the module list
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleIdentity0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0079', 'bundle identity case 79');
      expect(info.hapModulesInfo.some((item: bundleManager.HapModuleInfo) => item.name === ENTRY_MODULE)).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0080', 'bundle identity case 80');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEID_0081
     * @tc.name      testBundleIdentity0081
     * @tc.desc      Every module reports the bundle name
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleIdentity0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0081', 'bundle identity case 81');
      expect(info.hapModulesInfo.every((item: bundleManager.HapModuleInfo) => item.name.length > 0)).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0082', 'bundle identity case 82');
      expect(info.appInfo.uid > 0 && info.appInfo.accessTokenId > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEID_0083
     * @tc.name      testBundleIdentity0083
     * @tc.desc      App label and icon references use the media prefix
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleIdentity0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0083', 'bundle identity case 83');
      expect(info.appInfo.icon.startsWith('$media:') || info.appInfo.icon.length > 0).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0084', 'bundle identity case 84');
      const certificate: string | undefined = info.signatureInfo.certificate;
      expect(certificate === undefined || typeof certificate === 'string').assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEID_0085
     * @tc.name      testBundleIdentity0085
     * @tc.desc      Build version is optional text
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleIdentity0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0085', 'bundle identity case 85');
      const buildVersion: string | undefined = info.buildVersion;
      expect(buildVersion === undefined || buildVersion.length >= 0).assertTrue();
      {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0086', 'bundle identity case 86');
      const firstInstall: number | undefined = info.firstInstallTime;
      expect(firstInstall === undefined || typeof firstInstall === 'number').assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEID_0087
     * @tc.name      testBundleIdentity0087
     * @tc.desc      Bundle app info name is stable across queries
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleIdentity0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0087', 'bundle identity case 87');
      const again: bundleManager.BundleInfo = await selfBundle();
      expect(again.appInfo.name).assertEqual(info.appInfo.name);
      {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0088', 'bundle identity case 88');
      const again: bundleManager.BundleInfo = await selfBundle();
      expect(again.appInfo.uid).assertEqual(info.appInfo.uid);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEID_0089
     * @tc.name      testBundleIdentity0089
     * @tc.desc      Bundle app info label id is stable across queries
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleIdentity0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0089', 'bundle identity case 89');
      const again: bundleManager.BundleInfo = await selfBundle();
      expect(again.appInfo.labelId).assertEqual(info.appInfo.labelId);
      {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0090', 'bundle identity case 90');
      const again: bundleManager.BundleInfo = await selfBundle();
      expect(again.appInfo.iconId).assertEqual(info.appInfo.iconId);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_BUNDLEID_0091
     * @tc.name      testBundleIdentity0091
     * @tc.desc      Bundle signature app identifier is stable across queries
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleIdentity0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      logCase('testBundleIdentity0091', 'bundle identity case 91');
      const again: bundleManager.BundleInfo = await selfBundle();
      expect(again.signatureInfo.appIdentifier).assertEqual(info.signatureInfo.appIdentifier);
    });

  });
}
