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
import { bundleManager } from '@kit.AbilityKit';
import {
  BACKUP_ABILITY,
  BACKUP_METADATA,
  BUNDLE_NAME,
  ENTRY_ABILITY,
  ENTRY_MODULE,
  SELF_FLAGS,
  VENDOR,
  VERSION_CODE,
  VERSION_NAME,
  findModule
} from './shared/Probe';
import { paceTurn } from './shared/TestPace';
import { logCase } from './shared/TestLog';

let bundleCache: bundleManager.BundleInfo | null = null;

async function bundle(): Promise<bundleManager.BundleInfo> {
  const cached: bundleManager.BundleInfo | null = bundleCache;
  if (cached !== null) {
    return cached;
  }
  const loaded: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(SELF_FLAGS);
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

export default function bundleModuleMatrixTest() {
  describe('BundleModuleMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0001
     * @tc.name      testBundleModule0001
     * @tc.desc      Bundle name matches app.json5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      expect(info.name).assertEqual(BUNDLE_NAME);
      logCase('testBundleModule0001', 'bundle module check 1');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0002
     * @tc.name      testBundleModule0002
     * @tc.desc      Bundle name keeps the app profile segment count
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      expect(info.name.split('.').length).assertEqual(BUNDLE_NAME.split('.').length);
      logCase('testBundleModule0002', 'bundle module check 2');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0003
     * @tc.name      testBundleModule0003
     * @tc.desc      Bundle name starts with the com.example prefix
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      expect(info.name.startsWith('com.example.')).assertTrue();
      logCase('testBundleModule0003', 'bundle module check 3');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0004
     * @tc.name      testBundleModule0004
     * @tc.desc      Bundle name ends with httprequest
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      expect(info.name.endsWith('httprequest')).assertTrue();
      logCase('testBundleModule0004', 'bundle module check 4');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0005
     * @tc.name      testBundleModule0005
     * @tc.desc      Bundle name is lower case
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      expect(info.name.toLowerCase()).assertEqual(info.name);
      logCase('testBundleModule0005', 'bundle module check 5');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0006
     * @tc.name      testBundleModule0006
     * @tc.desc      Bundle name length is stable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      expect(info.name.length).assertEqual(BUNDLE_NAME.length);
      logCase('testBundleModule0006', 'bundle module check 6');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0007
     * @tc.name      testBundleModule0007
     * @tc.desc      Bundle name first segment is com
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      expect(info.name.substring(0, 3)).assertEqual('com');
      logCase('testBundleModule0007', 'bundle module check 7');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0008
     * @tc.name      testBundleModule0008
     * @tc.desc      Bundle name second segment is example
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      expect(info.name.split('.')[1]).assertEqual('example');
      logCase('testBundleModule0008', 'bundle module check 8');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0009
     * @tc.name      testBundleModule0009
     * @tc.desc      Bundle vendor matches app.json5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      expect(info.vendor).assertEqual(VENDOR);
      logCase('testBundleModule0009', 'bundle module check 9');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0010
     * @tc.name      testBundleModule0010
     * @tc.desc      Bundle vendor has no spaces
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      expect(info.vendor.indexOf(' ')).assertEqual(-1);
      logCase('testBundleModule0010', 'bundle module check 10');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0011
     * @tc.name      testBundleModule0011
     * @tc.desc      Bundle vendor is lower case
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      expect(info.vendor.toLowerCase()).assertEqual(VENDOR);
      logCase('testBundleModule0011', 'bundle module check 11');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0012
     * @tc.name      testBundleModule0012
     * @tc.desc      Bundle version name is 1.0.0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      expect(info.versionName).assertEqual(VERSION_NAME);
      logCase('testBundleModule0012', 'bundle module check 12');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0013
     * @tc.name      testBundleModule0013
     * @tc.desc      Bundle version name has three parts
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      expect(info.versionName.split('.').length).assertEqual(3);
      logCase('testBundleModule0013', 'bundle module check 13');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0014
     * @tc.name      testBundleModule0014
     * @tc.desc      Bundle version name starts with 1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      expect(info.versionName.charAt(0)).assertEqual('1');
      logCase('testBundleModule0014', 'bundle module check 14');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0015
     * @tc.name      testBundleModule0015
     * @tc.desc      Bundle version name last part is 0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      expect(info.versionName.charAt(info.versionName.length - 1)).assertEqual('0');
      logCase('testBundleModule0015', 'bundle module check 15');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0016
     * @tc.name      testBundleModule0016
     * @tc.desc      Bundle version code is 1000000
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      expect(info.versionCode).assertEqual(VERSION_CODE);
      logCase('testBundleModule0016', 'bundle module check 16');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0017
     * @tc.name      testBundleModule0017
     * @tc.desc      Bundle version code is positive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      expect(info.versionCode > 0).assertTrue();
      logCase('testBundleModule0017', 'bundle module check 17');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0018
     * @tc.name      testBundleModule0018
     * @tc.desc      Bundle version code fits in seven digits
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      expect(info.versionCode.toString().length).assertEqual(7);
      logCase('testBundleModule0018', 'bundle module check 18');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0019
     * @tc.name      testBundleModule0019
     * @tc.desc      Bundle version code is a multiple of one thousand
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      expect(info.versionCode % 1000).assertEqual(0);
      logCase('testBundleModule0019', 'bundle module check 19');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0020
     * @tc.name      testBundleModule0020
     * @tc.desc      Application uid is assigned
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      expect(info.appInfo.uid > 0).assertTrue();
      logCase('testBundleModule0020', 'bundle module check 20');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0021
     * @tc.name      testBundleModule0021
     * @tc.desc      Application uid is a whole number
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      expect(info.appInfo.uid % 1).assertEqual(0);
      logCase('testBundleModule0021', 'bundle module check 21');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0022
     * @tc.name      testBundleModule0022
     * @tc.desc      Application uid is an integer
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      expect(Number.isInteger(info.appInfo.uid)).assertTrue();
      logCase('testBundleModule0022', 'bundle module check 22');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0023
     * @tc.name      testBundleModule0023
     * @tc.desc      Application access token is assigned
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      expect(info.appInfo.accessTokenId > 0).assertTrue();
      logCase('testBundleModule0023', 'bundle module check 23');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0024
     * @tc.name      testBundleModule0024
     * @tc.desc      Application access token is numeric
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      expect(typeof info.appInfo.accessTokenId).assertEqual('number');
      logCase('testBundleModule0024', 'bundle module check 24');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0025
     * @tc.name      testBundleModule0025
     * @tc.desc      Application is enabled
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      expect(info.appInfo.enabled).assertTrue();
      logCase('testBundleModule0025', 'bundle module check 25');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0026
     * @tc.name      testBundleModule0026
     * @tc.desc      Application name mirrors bundle name
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      expect(info.appInfo.name).assertEqual(BUNDLE_NAME);
      logCase('testBundleModule0026', 'bundle module check 26');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0027
     * @tc.name      testBundleModule0027
     * @tc.desc      Application name length mirrors bundle name length
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      expect(info.appInfo.name.length).assertEqual(info.name.length);
      logCase('testBundleModule0027', 'bundle module check 27');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0028
     * @tc.name      testBundleModule0028
     * @tc.desc      Application name starts like the bundle name
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      expect(info.appInfo.name.startsWith('com.')).assertTrue();
      logCase('testBundleModule0028', 'bundle module check 28');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0029
     * @tc.name      testBundleModule0029
     * @tc.desc      Application icon id is positive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      expect(info.appInfo.iconId > 0).assertTrue();
      logCase('testBundleModule0029', 'bundle module check 29');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0030
     * @tc.name      testBundleModule0030
     * @tc.desc      Application label id is positive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      expect(info.appInfo.labelId > 0).assertTrue();
      logCase('testBundleModule0030', 'bundle module check 30');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0031
     * @tc.name      testBundleModule0031
     * @tc.desc      Application code path is present
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      expect(info.appInfo.codePath.length > 0).assertTrue();
      logCase('testBundleModule0031', 'bundle module check 31');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0032
     * @tc.name      testBundleModule0032
     * @tc.desc      Application code path stays under the system data root
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      expect(info.appInfo.codePath.startsWith('/data/')).assertTrue();
      logCase('testBundleModule0032', 'bundle module check 32');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0033
     * @tc.name      testBundleModule0033
     * @tc.desc      Application code path is absolute
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      expect(info.appInfo.codePath.startsWith('/')).assertTrue();
      logCase('testBundleModule0033', 'bundle module check 33');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0034
     * @tc.name      testBundleModule0034
     * @tc.desc      Application process name is set
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      expect(info.appInfo.process.length > 0).assertTrue();
      logCase('testBundleModule0034', 'bundle module check 34');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0035
     * @tc.name      testBundleModule0035
     * @tc.desc      Application removable flag is a boolean
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      expect(typeof info.appInfo.removable).assertEqual('boolean');
      logCase('testBundleModule0035', 'bundle module check 35');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0036
     * @tc.name      testBundleModule0036
     * @tc.desc      Application debug flag is boolean
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      expect(typeof info.appInfo.debug).assertEqual('boolean');
      logCase('testBundleModule0036', 'bundle module check 36');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0037
     * @tc.name      testBundleModule0037
     * @tc.desc      Application is not a system app
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      expect(info.appInfo.systemApp).assertFalse();
      logCase('testBundleModule0037', 'bundle module check 37');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0038
     * @tc.name      testBundleModule0038
     * @tc.desc      Application index is numeric
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      expect(typeof info.appInfo.appIndex).assertEqual('number');
      logCase('testBundleModule0038', 'bundle module check 38');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0039
     * @tc.name      testBundleModule0039
     * @tc.desc      Bundle declares at least one hap module
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      expect(info.hapModulesInfo.length >= 1).assertTrue();
      logCase('testBundleModule0039', 'bundle module check 39');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0040
     * @tc.name      testBundleModule0040
     * @tc.desc      Bundle module lookup finds entry
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      expect(findModule(info, ENTRY_MODULE).name).assertEqual(ENTRY_MODULE);
      logCase('testBundleModule0040', 'bundle module check 40');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0041
     * @tc.name      testBundleModule0041
     * @tc.desc      Bundle uid is below the signed integer limit
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const info: bundleManager.BundleInfo = await bundle();
      expect(info.appInfo.uid < 2147483647).assertTrue();
      logCase('testBundleModule0041', 'bundle module check 41');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0042
     * @tc.name      testBundleModule0042
     * @tc.desc      Entry module keeps its name
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const mod: bundleManager.HapModuleInfo = await entryModule();
      expect(mod.name).assertEqual(ENTRY_MODULE);
      logCase('testBundleModule0042', 'bundle module check 42');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0043
     * @tc.name      testBundleModule0043
     * @tc.desc      Entry module name has five characters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const mod: bundleManager.HapModuleInfo = await entryModule();
      expect(mod.name.length).assertEqual(5);
      logCase('testBundleModule0043', 'bundle module check 43');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0044
     * @tc.name      testBundleModule0044
     * @tc.desc      Entry module name is lower case
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const mod: bundleManager.HapModuleInfo = await entryModule();
      expect(mod.name.toLowerCase()).assertEqual(mod.name);
      logCase('testBundleModule0044', 'bundle module check 44');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0045
     * @tc.name      testBundleModule0045
     * @tc.desc      Entry module description id is positive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const mod: bundleManager.HapModuleInfo = await entryModule();
      expect(mod.descriptionId > 0).assertTrue();
      logCase('testBundleModule0045', 'bundle module check 45');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0046
     * @tc.name      testBundleModule0046
     * @tc.desc      Entry module ability module name matches module name
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const mod: bundleManager.HapModuleInfo = await entryModule();
      expect(mod.abilitiesInfo[0].moduleName).assertEqual(mod.name);
      logCase('testBundleModule0046', 'bundle module check 46');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0047
     * @tc.name      testBundleModule0047
     * @tc.desc      Entry module extension module name matches module name
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const mod: bundleManager.HapModuleInfo = await entryModule();
      expect(mod.extensionAbilitiesInfo[0].moduleName).assertEqual(mod.name);
      logCase('testBundleModule0047', 'bundle module check 47');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0048
     * @tc.name      testBundleModule0048
     * @tc.desc      Entry module device list has a single entry
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const mod: bundleManager.HapModuleInfo = await entryModule();
      expect(mod.deviceTypes.length).assertEqual(1);
      logCase('testBundleModule0048', 'bundle module check 48');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0049
     * @tc.name      testBundleModule0049
     * @tc.desc      Entry module supports the default device
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const mod: bundleManager.HapModuleInfo = await entryModule();
      expect(mod.deviceTypes.indexOf('default') >= 0).assertTrue();
      logCase('testBundleModule0049', 'bundle module check 49');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0050
     * @tc.name      testBundleModule0050
     * @tc.desc      Entry module declares at least one device
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const mod: bundleManager.HapModuleInfo = await entryModule();
      expect(mod.deviceTypes.length >= 1).assertTrue();
      logCase('testBundleModule0050', 'bundle module check 50');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0051
     * @tc.name      testBundleModule0051
     * @tc.desc      Entry module device list is strings
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const mod: bundleManager.HapModuleInfo = await entryModule();
      expect(typeof mod.deviceTypes[0]).assertEqual('string');
      logCase('testBundleModule0051', 'bundle module check 51');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0052
     * @tc.name      testBundleModule0052
     * @tc.desc      Entry module device list has no duplicates
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const mod: bundleManager.HapModuleInfo = await entryModule();
      expect(mod.deviceTypes.length).assertEqual(new Set<string>(mod.deviceTypes).size);
      logCase('testBundleModule0052', 'bundle module check 52');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0053
     * @tc.name      testBundleModule0053
     * @tc.desc      Entry module description id is an integer
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const mod: bundleManager.HapModuleInfo = await entryModule();
      expect(Number.isInteger(mod.descriptionId)).assertTrue();
      logCase('testBundleModule0053', 'bundle module check 53');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0054
     * @tc.name      testBundleModule0054
     * @tc.desc      Entry module icon id is an integer
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const mod: bundleManager.HapModuleInfo = await entryModule();
      expect(Number.isInteger(mod.iconId)).assertTrue();
      logCase('testBundleModule0054', 'bundle module check 54');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0055
     * @tc.name      testBundleModule0055
     * @tc.desc      Entry module declares one ability
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const mod: bundleManager.HapModuleInfo = await entryModule();
      expect(mod.abilitiesInfo.length).assertEqual(1);
      logCase('testBundleModule0055', 'bundle module check 55');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0056
     * @tc.name      testBundleModule0056
     * @tc.desc      Entry module ability is the entry ability
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const mod: bundleManager.HapModuleInfo = await entryModule();
      expect(mod.abilitiesInfo[0].name).assertEqual(ENTRY_ABILITY);
      logCase('testBundleModule0056', 'bundle module check 56');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0057
     * @tc.name      testBundleModule0057
     * @tc.desc      Entry module declares one extension ability
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const mod: bundleManager.HapModuleInfo = await entryModule();
      expect(mod.extensionAbilitiesInfo.length).assertEqual(1);
      logCase('testBundleModule0057', 'bundle module check 57');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0058
     * @tc.name      testBundleModule0058
     * @tc.desc      Entry module extension is the backup ability
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const mod: bundleManager.HapModuleInfo = await entryModule();
      expect(mod.extensionAbilitiesInfo[0].name).assertEqual(BACKUP_ABILITY);
      logCase('testBundleModule0058', 'bundle module check 58');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0059
     * @tc.name      testBundleModule0059
     * @tc.desc      Entry module icon id is positive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const mod: bundleManager.HapModuleInfo = await entryModule();
      expect(mod.iconId > 0).assertTrue();
      logCase('testBundleModule0059', 'bundle module check 59');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0060
     * @tc.name      testBundleModule0060
     * @tc.desc      Entry module name matches the ability module name
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const mod: bundleManager.HapModuleInfo = await entryModule();
      expect(mod.name).assertEqual(mod.abilitiesInfo[0].moduleName);
      logCase('testBundleModule0060', 'bundle module check 60');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0061
     * @tc.name      testBundleModule0061
     * @tc.desc      Entry ability name matches module.json5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ability: bundleManager.AbilityInfo = await entryAbility();
      expect(ability.name).assertEqual(ENTRY_ABILITY);
      logCase('testBundleModule0061', 'bundle module check 61');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0062
     * @tc.name      testBundleModule0062
     * @tc.desc      Entry ability name length is twelve
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ability: bundleManager.AbilityInfo = await entryAbility();
      expect(ability.name.length).assertEqual(12);
      logCase('testBundleModule0062', 'bundle module check 62');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0063
     * @tc.name      testBundleModule0063
     * @tc.desc      Entry ability name starts upper case
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ability: bundleManager.AbilityInfo = await entryAbility();
      expect(ability.name.charAt(0)).assertEqual('E');
      logCase('testBundleModule0063', 'bundle module check 63');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0064
     * @tc.name      testBundleModule0064
     * @tc.desc      Entry ability belongs to the entry module
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ability: bundleManager.AbilityInfo = await entryAbility();
      expect(ability.moduleName).assertEqual(ENTRY_MODULE);
      logCase('testBundleModule0064', 'bundle module check 64');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0065
     * @tc.name      testBundleModule0065
     * @tc.desc      Entry ability module name length is five
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ability: bundleManager.AbilityInfo = await entryAbility();
      expect(ability.moduleName.length).assertEqual(5);
      logCase('testBundleModule0065', 'bundle module check 65');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0066
     * @tc.name      testBundleModule0066
     * @tc.desc      Entry ability is exported
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ability: bundleManager.AbilityInfo = await entryAbility();
      expect(ability.exported).assertTrue();
      logCase('testBundleModule0066', 'bundle module check 66');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0067
     * @tc.name      testBundleModule0067
     * @tc.desc      Entry ability label id is positive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ability: bundleManager.AbilityInfo = await entryAbility();
      expect(ability.labelId > 0).assertTrue();
      logCase('testBundleModule0067', 'bundle module check 67');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0068
     * @tc.name      testBundleModule0068
     * @tc.desc      Entry ability icon id is positive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ability: bundleManager.AbilityInfo = await entryAbility();
      expect(ability.iconId > 0).assertTrue();
      logCase('testBundleModule0068', 'bundle module check 68');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0069
     * @tc.name      testBundleModule0069
     * @tc.desc      Entry ability launch type is numeric
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ability: bundleManager.AbilityInfo = await entryAbility();
      expect(typeof ability.launchType).assertEqual('number');
      logCase('testBundleModule0069', 'bundle module check 69');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0070
     * @tc.name      testBundleModule0070
     * @tc.desc      Entry ability is enabled
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ability: bundleManager.AbilityInfo = await entryAbility();
      expect(ability.enabled).assertTrue();
      logCase('testBundleModule0070', 'bundle module check 70');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0071
     * @tc.name      testBundleModule0071
     * @tc.desc      Entry ability description id is positive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ability: bundleManager.AbilityInfo = await entryAbility();
      expect(ability.descriptionId > 0).assertTrue();
      logCase('testBundleModule0071', 'bundle module check 71');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0072
     * @tc.name      testBundleModule0072
     * @tc.desc      Entry ability declares one skill
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ability: bundleManager.AbilityInfo = await entryAbility();
      expect(ability.skills.length).assertEqual(1);
      logCase('testBundleModule0072', 'bundle module check 72');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0073
     * @tc.name      testBundleModule0073
     * @tc.desc      Entry ability skill declares home entity
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ability: bundleManager.AbilityInfo = await entryAbility();
      expect(ability.skills[0].entities.indexOf('entity.system.home') >= 0).assertTrue();
      logCase('testBundleModule0073', 'bundle module check 73');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0074
     * @tc.name      testBundleModule0074
     * @tc.desc      Entry ability skill declares home action
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ability: bundleManager.AbilityInfo = await entryAbility();
      expect(ability.skills[0].actions.indexOf('action.system.home') >= 0).assertTrue();
      logCase('testBundleModule0074', 'bundle module check 74');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0075
     * @tc.name      testBundleModule0075
     * @tc.desc      Entry ability launch type is singleton
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ability: bundleManager.AbilityInfo = await entryAbility();
      expect(ability.launchType).assertEqual(bundleManager.LaunchType.SINGLETON);
      logCase('testBundleModule0075', 'bundle module check 75');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0076
     * @tc.name      testBundleModule0076
     * @tc.desc      Entry ability skill exposes entities
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ability: bundleManager.AbilityInfo = await entryAbility();
      expect(ability.skills[0].entities.length >= 1).assertTrue();
      logCase('testBundleModule0076', 'bundle module check 76');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0077
     * @tc.name      testBundleModule0077
     * @tc.desc      Entry ability requests no private permission
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ability: bundleManager.AbilityInfo = await entryAbility();
      expect(ability.permissions.length).assertEqual(0);
      logCase('testBundleModule0077', 'bundle module check 77');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0078
     * @tc.name      testBundleModule0078
     * @tc.desc      Entry ability declares no metadata
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ability: bundleManager.AbilityInfo = await entryAbility();
      expect(ability.metadata.length).assertEqual(0);
      logCase('testBundleModule0078', 'bundle module check 78');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0079
     * @tc.name      testBundleModule0079
     * @tc.desc      Entry ability name differs from the module name
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ability: bundleManager.AbilityInfo = await entryAbility();
      expect(ability.name !== ability.moduleName).assertTrue();
      logCase('testBundleModule0079', 'bundle module check 79');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0080
     * @tc.name      testBundleModule0080
     * @tc.desc      Entry ability label id is numeric
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBundleModule0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ability: bundleManager.AbilityInfo = await entryAbility();
      expect(typeof ability.labelId).assertEqual('number');
      logCase('testBundleModule0080', 'bundle module check 80');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0081
     * @tc.name      testBundleModule0081
     * @tc.desc      Backup extension keeps its name
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleModule0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const backup: bundleManager.ExtensionAbilityInfo = await backupAbility();
      expect(backup.name).assertEqual(BACKUP_ABILITY);
      logCase('testBundleModule0081', 'bundle module check 81');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0082
     * @tc.name      testBundleModule0082
     * @tc.desc      Backup extension name length matches the profile value
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleModule0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const backup: bundleManager.ExtensionAbilityInfo = await backupAbility();
      expect(backup.name.length).assertEqual(BACKUP_ABILITY.length);
      logCase('testBundleModule0082', 'bundle module check 82');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0083
     * @tc.name      testBundleModule0083
     * @tc.desc      Backup extension is not exported
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleModule0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const backup: bundleManager.ExtensionAbilityInfo = await backupAbility();
      expect(backup.exported).assertFalse();
      logCase('testBundleModule0083', 'bundle module check 83');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0084
     * @tc.name      testBundleModule0084
     * @tc.desc      Backup extension metadata name is a string
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleModule0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const backup: bundleManager.ExtensionAbilityInfo = await backupAbility();
      expect(typeof backup.metadata[0].name).assertEqual('string');
      logCase('testBundleModule0084', 'bundle module check 84');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0085
     * @tc.name      testBundleModule0085
     * @tc.desc      Backup extension publishes metadata
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleModule0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const backup: bundleManager.ExtensionAbilityInfo = await backupAbility();
      expect(backup.metadata.length >= 1).assertTrue();
      logCase('testBundleModule0085', 'bundle module check 85');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0086
     * @tc.name      testBundleModule0086
     * @tc.desc      Backup extension metadata name matches
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleModule0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const backup: bundleManager.ExtensionAbilityInfo = await backupAbility();
      expect(backup.metadata[0].name).assertEqual(BACKUP_METADATA);
      logCase('testBundleModule0086', 'bundle module check 86');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0087
     * @tc.name      testBundleModule0087
     * @tc.desc      Backup extension belongs to entry
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleModule0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const backup: bundleManager.ExtensionAbilityInfo = await backupAbility();
      expect(backup.moduleName).assertEqual(ENTRY_MODULE);
      logCase('testBundleModule0087', 'bundle module check 87');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0088
     * @tc.name      testBundleModule0088
     * @tc.desc      Backup extension name differs from the entry ability
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBundleModule0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const backup: bundleManager.ExtensionAbilityInfo = await backupAbility();
      expect(backup.name !== ENTRY_ABILITY).assertTrue();
      logCase('testBundleModule0088', 'bundle module check 88');
    });
    /**
     * @tc.number    SUB_PREHTTP_BUNDLE_0089
     * @tc.name      testBundleModule0089
     * @tc.desc      Module list exposes the entry module exactly once
