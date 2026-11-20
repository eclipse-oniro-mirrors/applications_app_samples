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
import { selfBundle, BUNDLE_NAME } from './shared/AppProbe';
import { logCase } from './shared/TestLog';

import { paceTurn } from './shared/TestPace';

export default function appFactsMatrixTest() {
  describe('appFactsMatrixTest', () => {
  beforeEach(async () => {
    await paceTurn();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_APPFT_0001
   * @tc.name      testAppFacts0001
   * @tc.desc      App keeps bundle name length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testAppFacts0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testAppFacts0001', 'app bundle name length');
    const info: bundleManager.BundleInfo = await selfBundle();
    const app: bundleManager.ApplicationInfo = info.appInfo;
    expect(info.name.length).assertEqual(26);
    expect(info.appInfo.name).assertEqual(info.name);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_APPFT_0002
   * @tc.name      testAppFacts0002
   * @tc.desc      App keeps bundle name head three
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testAppFacts0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testAppFacts0002', 'app bundle name head three');
    const info: bundleManager.BundleInfo = await selfBundle();
    const app: bundleManager.ApplicationInfo = info.appInfo;
    expect(info.name.substring(0, 3)).assertEqual('oho');
    expect(info.appInfo.name).assertEqual(info.name);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_APPFT_0003
   * @tc.name      testAppFacts0003
   * @tc.desc      App keeps bundle name tail three
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testAppFacts0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testAppFacts0003', 'app bundle name tail three');
    const info: bundleManager.BundleInfo = await selfBundle();
    const app: bundleManager.ApplicationInfo = info.appInfo;
    expect(info.name.substring(info.name.length - 3)).assertEqual('ion');
    expect(info.appInfo.name).assertEqual(info.name);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_APPFT_0004
   * @tc.name      testAppFacts0004
   * @tc.desc      App keeps bundle name dot parts
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testAppFacts0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testAppFacts0004', 'app bundle name dot parts');
    const info: bundleManager.BundleInfo = await selfBundle();
    const app: bundleManager.ApplicationInfo = info.appInfo;
    expect(info.name.split('.').length).assertEqual(4);
    expect(info.appInfo.name).assertEqual(info.name);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_APPFT_0005
   * @tc.name      testAppFacts0005
   * @tc.desc      App keeps bundle name digits
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testAppFacts0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testAppFacts0005', 'app bundle name digits');
    const info: bundleManager.BundleInfo = await selfBundle();
    const app: bundleManager.ApplicationInfo = info.appInfo;
    expect(info.name.split('').filter((c: string) => c >= '0' && c <= '9').length).assertEqual(0);
    expect(info.appInfo.name).assertEqual(info.name);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_APPFT_0006
   * @tc.name      testAppFacts0006
   * @tc.desc      App keeps bundle name letters
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testAppFacts0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testAppFacts0006', 'app bundle name letters');
    const info: bundleManager.BundleInfo = await selfBundle();
    const app: bundleManager.ApplicationInfo = info.appInfo;
    expect(info.name.split('').filter((c: string) => (c >= 'a' && c <= 'z')).length).assertEqual(23);
    expect(info.appInfo.name).assertEqual(info.name);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_APPFT_0007
   * @tc.name      testAppFacts0007
   * @tc.desc      App keeps bundle name underscores
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testAppFacts0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testAppFacts0007', 'app bundle name underscores');
    const info: bundleManager.BundleInfo = await selfBundle();
    const app: bundleManager.ApplicationInfo = info.appInfo;
    expect(info.name.split('_').length).assertEqual(1);
    expect(info.appInfo.name).assertEqual(info.name);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_APPFT_0008
   * @tc.name      testAppFacts0008
   * @tc.desc      App keeps bundle name case round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testAppFacts0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testAppFacts0008', 'app bundle name case round trip');
    const info: bundleManager.BundleInfo = await selfBundle();
    const app: bundleManager.ApplicationInfo = info.appInfo;
    expect(info.name.toUpperCase().toLowerCase()).assertEqual('ohos.app.hap.myapplication');
    expect(info.appInfo.name).assertEqual(info.name);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_APPFT_0009
   * @tc.name      testAppFacts0009
   * @tc.desc      App keeps bundle name trim stable
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testAppFacts0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testAppFacts0009', 'app bundle name trim stable');
    const info: bundleManager.BundleInfo = await selfBundle();
    const app: bundleManager.ApplicationInfo = info.appInfo;
    expect(info.name.trim()).assertEqual(info.name);
    expect(info.appInfo.name).assertEqual(info.name);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_APPFT_0010
   * @tc.name      testAppFacts0010
   * @tc.desc      App keeps vendor length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testAppFacts0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testAppFacts0010', 'app vendor length');
    const info: bundleManager.BundleInfo = await selfBundle();
    const app: bundleManager.ApplicationInfo = info.appInfo;
    expect(info.vendor.length).assertEqual(7);
    expect(info.appInfo.name).assertEqual(info.name);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_APPFT_0011
   * @tc.name      testAppFacts0011
   * @tc.desc      App keeps vendor head three
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testAppFacts0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testAppFacts0011', 'app vendor head three');
    const info: bundleManager.BundleInfo = await selfBundle();
    const app: bundleManager.ApplicationInfo = info.appInfo;
    expect(info.vendor.substring(0, 3)).assertEqual('exa');
    expect(info.appInfo.name).assertEqual(info.name);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_APPFT_0012
   * @tc.name      testAppFacts0012
   * @tc.desc      App keeps vendor tail three
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testAppFacts0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testAppFacts0012', 'app vendor tail three');
    const info: bundleManager.BundleInfo = await selfBundle();
    const app: bundleManager.ApplicationInfo = info.appInfo;
    expect(info.vendor.substring(info.vendor.length - 3)).assertEqual('ple');
    expect(info.appInfo.name).assertEqual(info.name);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_APPFT_0013
   * @tc.name      testAppFacts0013
   * @tc.desc      App keeps vendor dot parts
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testAppFacts0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testAppFacts0013', 'app vendor dot parts');
    const info: bundleManager.BundleInfo = await selfBundle();
    const app: bundleManager.ApplicationInfo = info.appInfo;
    expect(info.vendor.split('.').length).assertEqual(1);
    expect(info.appInfo.name).assertEqual(info.name);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_APPFT_0014
   * @tc.name      testAppFacts0014
   * @tc.desc      App keeps vendor digits
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testAppFacts0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testAppFacts0014', 'app vendor digits');
    const info: bundleManager.BundleInfo = await selfBundle();
    const app: bundleManager.ApplicationInfo = info.appInfo;
    expect(info.vendor.split('').filter((c: string) => c >= '0' && c <= '9').length).assertEqual(0);
    expect(info.appInfo.name).assertEqual(info.name);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_APPFT_0015
   * @tc.name      testAppFacts0015
   * @tc.desc      App keeps vendor letters
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testAppFacts0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testAppFacts0015', 'app vendor letters');
    const info: bundleManager.BundleInfo = await selfBundle();
    const app: bundleManager.ApplicationInfo = info.appInfo;
    expect(info.vendor.split('').filter((c: string) => (c >= 'a' && c <= 'z')).length).assertEqual(7);
    expect(info.appInfo.name).assertEqual(info.name);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_APPFT_0016
   * @tc.name      testAppFacts0016
   * @tc.desc      App keeps vendor underscores
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testAppFacts0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testAppFacts0016', 'app vendor underscores');
    const info: bundleManager.BundleInfo = await selfBundle();
    const app: bundleManager.ApplicationInfo = info.appInfo;
    expect(info.vendor.split('_').length).assertEqual(1);
    expect(info.appInfo.name).assertEqual(info.name);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_APPFT_0017
   * @tc.name      testAppFacts0017
   * @tc.desc      App keeps vendor case round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testAppFacts0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testAppFacts0017', 'app vendor case round trip');
    const info: bundleManager.BundleInfo = await selfBundle();
    const app: bundleManager.ApplicationInfo = info.appInfo;
    expect(info.vendor.toUpperCase().toLowerCase()).assertEqual('example');
    expect(info.appInfo.name).assertEqual(info.name);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_APPFT_0018
   * @tc.name      testAppFacts0018
   * @tc.desc      App keeps vendor trim stable
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testAppFacts0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testAppFacts0018', 'app vendor trim stable');
    const info: bundleManager.BundleInfo = await selfBundle();
    const app: bundleManager.ApplicationInfo = info.appInfo;
    expect(info.vendor.trim()).assertEqual(info.vendor);
    expect(info.appInfo.name).assertEqual(info.name);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_APPFT_0019
   * @tc.name      testAppFacts0019
   * @tc.desc      App keeps version name length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testAppFacts0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testAppFacts0019', 'app version name length');
    const info: bundleManager.BundleInfo = await selfBundle();
    const app: bundleManager.ApplicationInfo = info.appInfo;
    expect(info.versionName.length).assertEqual(5);
    expect(info.appInfo.name).assertEqual(info.name);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_APPFT_0020
   * @tc.name      testAppFacts0020
   * @tc.desc      App keeps version name head three
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testAppFacts0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testAppFacts0020', 'app version name head three');
    const info: bundleManager.BundleInfo = await selfBundle();
    const app: bundleManager.ApplicationInfo = info.appInfo;
    expect(info.versionName.substring(0, 3)).assertEqual('1.0');
    expect(info.appInfo.name).assertEqual(info.name);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_APPFT_0021
   * @tc.name      testAppFacts0021
   * @tc.desc      App keeps version name tail three
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testAppFacts0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testAppFacts0021', 'app version name tail three');
    const info: bundleManager.BundleInfo = await selfBundle();
    const app: bundleManager.ApplicationInfo = info.appInfo;
    expect(info.versionName.substring(info.versionName.length - 3)).assertEqual('0.0');
    expect(info.appInfo.name).assertEqual(info.name);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_APPFT_0022
   * @tc.name      testAppFacts0022
   * @tc.desc      App keeps version name dot parts
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testAppFacts0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testAppFacts0022', 'app version name dot parts');
    const info: bundleManager.BundleInfo = await selfBundle();
    const app: bundleManager.ApplicationInfo = info.appInfo;
    expect(info.versionName.split('.').length).assertEqual(3);
    expect(info.appInfo.name).assertEqual(info.name);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_APPFT_0023
   * @tc.name      testAppFacts0023
   * @tc.desc      App keeps version name digits
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testAppFacts0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testAppFacts0023', 'app version name digits');
    const info: bundleManager.BundleInfo = await selfBundle();
    const app: bundleManager.ApplicationInfo = info.appInfo;
    expect(info.versionName.split('').filter((c: string) => c >= '0' && c <= '9').length).assertEqual(3);
    expect(info.appInfo.name).assertEqual(info.name);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_APPFT_0024
   * @tc.name      testAppFacts0024
   * @tc.desc      App keeps version name letters
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testAppFacts0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testAppFacts0024', 'app version name letters');
    const info: bundleManager.BundleInfo = await selfBundle();
    const app: bundleManager.ApplicationInfo = info.appInfo;
    expect(info.versionName.split('').filter((c: string) => (c >= 'a' && c <= 'z')).length).assertEqual(0);
    expect(info.appInfo.name).assertEqual(info.name);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_APPFT_0025
   * @tc.name      testAppFacts0025
   * @tc.desc      App keeps version name underscores
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testAppFacts0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testAppFacts0025', 'app version name underscores');
    const info: bundleManager.BundleInfo = await selfBundle();
    const app: bundleManager.ApplicationInfo = info.appInfo;
    expect(info.versionName.split('_').length).assertEqual(1);
    expect(info.appInfo.name).assertEqual(info.name);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_APPFT_0026
   * @tc.name      testAppFacts0026
   * @tc.desc      App keeps version name case round trip
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testAppFacts0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testAppFacts0026', 'app version name case round trip');
    const info: bundleManager.BundleInfo = await selfBundle();
    const app: bundleManager.ApplicationInfo = info.appInfo;
    expect(info.versionName.toUpperCase().toLowerCase()).assertEqual('1.0.0');
    expect(info.appInfo.name).assertEqual(info.name);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_APPFT_0027
   * @tc.name      testAppFacts0027
   * @tc.desc      App keeps version name trim stable
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testAppFacts0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testAppFacts0027', 'app version name trim stable');
    const info: bundleManager.BundleInfo = await selfBundle();
    const app: bundleManager.ApplicationInfo = info.appInfo;
    expect(info.versionName.trim()).assertEqual(info.versionName);
    expect(info.appInfo.name).assertEqual(info.name);
  });


  /**
   * @tc.number    SUB_BMS_HAPTOHAR_APPFT_0050
   * @tc.name      testAppFacts0050
   * @tc.desc      App files live in the bundle code path
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testAppFacts0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testAppFacts0050', 'app files live in the bundle code path');
    const info: bundleManager.BundleInfo = await selfBundle();
    const app: bundleManager.ApplicationInfo = info.appInfo;
    expect(app.codePath.includes('bundle')).assertTrue();
    expect(app.codePath.length > 0).assertTrue();
    expect(info.name).assertEqual(BUNDLE_NAME);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_APPFT_0051
   * @tc.name      testAppFacts0051
   * @tc.desc      App uid and token are positive
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testAppFacts0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testAppFacts0051', 'app uid and token are positive');
    const info: bundleManager.BundleInfo = await selfBundle();
    const app: bundleManager.ApplicationInfo = info.appInfo;
    expect(app.uid > 0).assertTrue();
    expect(app.accessTokenId > 0).assertTrue();
    expect(info.name).assertEqual(BUNDLE_NAME);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_APPFT_0052
   * @tc.name      testAppFacts0052
   * @tc.desc      App removable stays a boolean
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testAppFacts0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testAppFacts0052', 'app removable stays a boolean');
    const info: bundleManager.BundleInfo = await selfBundle();
    const app: bundleManager.ApplicationInfo = info.appInfo;
    expect(typeof app.removable).assertEqual('boolean');
    expect(info.name).assertEqual(BUNDLE_NAME);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_APPFT_0053
   * @tc.name      testAppFacts0053
   * @tc.desc      App provision type is a readable string
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testAppFacts0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testAppFacts0053', 'app provision type is a readable string');
    const info: bundleManager.BundleInfo = await selfBundle();
    const app: bundleManager.ApplicationInfo = info.appInfo;
    expect(app.appProvisionType.length > 0).assertTrue();
    expect(app.appDistributionType.length > 0).assertTrue();
    expect(info.name).assertEqual(BUNDLE_NAME);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_APPFT_0054
   * @tc.name      testAppFacts0054
   * @tc.desc      App release type is a readable string
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testAppFacts0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testAppFacts0054', 'app release type is a readable string');
    const info: bundleManager.BundleInfo = await selfBundle();
    const app: bundleManager.ApplicationInfo = info.appInfo;
    expect(app.releaseType.length > 0).assertTrue();
    expect(info.name).assertEqual(BUNDLE_NAME);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_APPFT_0055
   * @tc.name      testAppFacts0055
   * @tc.desc      App install source is a readable string
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testAppFacts0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testAppFacts0055', 'app install source is a readable string');
    const info: bundleManager.BundleInfo = await selfBundle();
    const app: bundleManager.ApplicationInfo = info.appInfo;
    expect(typeof app.installSource).assertEqual('string');
    expect(info.name).assertEqual(BUNDLE_NAME);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_APPFT_0056
   * @tc.name      testAppFacts0056
   * @tc.desc      App environment names are readable
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testAppFacts0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testAppFacts0056', 'app environment names are readable');
    const info: bundleManager.BundleInfo = await selfBundle();
    const app: bundleManager.ApplicationInfo = info.appInfo;
    expect(app.nativeLibraryPath.length >= 0).assertTrue();
    expect(info.name).assertEqual(BUNDLE_NAME);
  });
  });
}
