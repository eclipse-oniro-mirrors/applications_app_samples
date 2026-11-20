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

const FLAGS: number = 0x00000002 | 0x00000004 | 0x00000008 | 0x00000020 | 0x00000040;

export default function bundleFactsMatrixTest() {
  describe('bundleFactsMatrixTest', () => {
  beforeEach(async () => {
    await paceTurn();
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_BND_0001
   * @tc.name      testBundleFacts0001
   * @tc.desc      Bundle keeps domain
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testBundleFacts0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testBundleFacts0001', 'bundle domain');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.name.split('.')[0]).assertEqual('ohos');
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_BND_0002
   * @tc.name      testBundleFacts0002
   * @tc.desc      Bundle keeps sub domain
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testBundleFacts0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testBundleFacts0002', 'bundle sub domain');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.name.split('.')[1]).assertEqual('app');
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_BND_0003
   * @tc.name      testBundleFacts0003
   * @tc.desc      Bundle keeps group
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testBundleFacts0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testBundleFacts0003', 'bundle group');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.name.split('.')[2]).assertEqual('hap');
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_BND_0004
   * @tc.name      testBundleFacts0004
   * @tc.desc      Bundle keeps leaf
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testBundleFacts0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testBundleFacts0004', 'bundle leaf');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.name.split('.')[3]).assertEqual('myapplication');
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_BND_0005
   * @tc.name      testBundleFacts0005
   * @tc.desc      Bundle keeps length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testBundleFacts0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testBundleFacts0005', 'bundle length');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.name.length).assertEqual(26);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_BND_0006
   * @tc.name      testBundleFacts0006
   * @tc.desc      Bundle keeps dot count
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testBundleFacts0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testBundleFacts0006', 'bundle dot count');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.name.split('.').length).assertEqual(4);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_BND_0007
   * @tc.name      testBundleFacts0007
   * @tc.desc      Bundle keeps first char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testBundleFacts0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testBundleFacts0007', 'bundle first char');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.name.charAt(0)).assertEqual('o');
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_BND_0008
   * @tc.name      testBundleFacts0008
   * @tc.desc      Bundle keeps last char
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testBundleFacts0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testBundleFacts0008', 'bundle last char');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.name.charAt(info.name.length - 1)).assertEqual('n');
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_BND_0009
   * @tc.name      testBundleFacts0009
   * @tc.desc      Bundle keeps uppercase
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testBundleFacts0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testBundleFacts0009', 'bundle uppercase');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.name.toUpperCase()).assertEqual('OHOS.APP.HAP.MYAPPLICATION');
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_BND_0010
   * @tc.name      testBundleFacts0010
   * @tc.desc      Bundle keeps version code
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testBundleFacts0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testBundleFacts0010', 'bundle version code');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.versionCode).assertEqual(1000000);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_BND_0011
   * @tc.name      testBundleFacts0011
   * @tc.desc      Bundle keeps version name
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testBundleFacts0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testBundleFacts0011', 'bundle version name');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.versionName).assertEqual('1.0.0');
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_BND_0012
   * @tc.name      testBundleFacts0012
   * @tc.desc      Bundle keeps version name length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testBundleFacts0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testBundleFacts0012', 'bundle version name length');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.versionName.length).assertEqual(5);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_BND_0013
   * @tc.name      testBundleFacts0013
   * @tc.desc      Bundle keeps vendor
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testBundleFacts0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testBundleFacts0013', 'bundle vendor');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.vendor).assertEqual('example');
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_BND_0014
   * @tc.name      testBundleFacts0014
   * @tc.desc      Bundle keeps vendor length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testBundleFacts0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testBundleFacts0014', 'bundle vendor length');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.vendor.length).assertEqual(7);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_BND_0015
   * @tc.name      testBundleFacts0015
   * @tc.desc      Bundle keeps min compatible range
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testBundleFacts0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testBundleFacts0015', 'bundle min compatible range');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.minCompatibleVersionCode >= 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_BND_0016
   * @tc.name      testBundleFacts0016
   * @tc.desc      Bundle keeps target version range
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testBundleFacts0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testBundleFacts0016', 'bundle target version range');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.targetVersion > 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_BND_0017
   * @tc.name      testBundleFacts0017
   * @tc.desc      Bundle keeps application name
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testBundleFacts0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testBundleFacts0017', 'bundle application name');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.appInfo.name).assertEqual('ohos.app.hap.myapplication');
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_BND_0018
   * @tc.name      testBundleFacts0018
   * @tc.desc      Bundle keeps application label
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testBundleFacts0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testBundleFacts0018', 'bundle application label');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.appInfo.labelId > 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_BND_0019
   * @tc.name      testBundleFacts0019
   * @tc.desc      Bundle keeps application icon
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testBundleFacts0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testBundleFacts0019', 'bundle application icon');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.appInfo.iconId > 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_BND_0020
   * @tc.name      testBundleFacts0020
   * @tc.desc      Bundle keeps application enabled
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testBundleFacts0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testBundleFacts0020', 'bundle application enabled');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.appInfo.enabled).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_BND_0021
   * @tc.name      testBundleFacts0021
   * @tc.desc      Bundle keeps application removable
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testBundleFacts0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testBundleFacts0021', 'bundle application removable');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.appInfo.removable).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_BND_0022
   * @tc.name      testBundleFacts0022
   * @tc.desc      Bundle keeps application code path
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testBundleFacts0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testBundleFacts0022', 'bundle application code path');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.appInfo.codePath.length > 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_BND_0023
   * @tc.name      testBundleFacts0023
   * @tc.desc      Bundle keeps application name prefix
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testBundleFacts0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testBundleFacts0023', 'bundle application name prefix');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.appInfo.name.indexOf('ohos')).assertEqual(0);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_BND_0024
   * @tc.name      testBundleFacts0024
   * @tc.desc      Bundle keeps application uid
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testBundleFacts0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testBundleFacts0024', 'bundle application uid');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.appInfo.uid >= 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_BND_0025
   * @tc.name      testBundleFacts0025
   * @tc.desc      Bundle keeps application token
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testBundleFacts0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testBundleFacts0025', 'bundle application token');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.appInfo.accessTokenId >= 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_BND_0026
   * @tc.name      testBundleFacts0026
   * @tc.desc      Bundle keeps application bundle type
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testBundleFacts0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testBundleFacts0026', 'bundle application bundle type');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.appInfo.bundleType).assertEqual(bundleManager.BundleType.APP);
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_BND_0027
   * @tc.name      testBundleFacts0027
   * @tc.desc      Bundle keeps signature app id
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testBundleFacts0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testBundleFacts0027', 'bundle signature app id');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.signatureInfo.appId.length > 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_BND_0028
   * @tc.name      testBundleFacts0028
   * @tc.desc      Bundle keeps signature fingerprint
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testBundleFacts0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testBundleFacts0028', 'bundle signature fingerprint');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.signatureInfo.fingerprint.length > 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_BND_0029
   * @tc.name      testBundleFacts0029
   * @tc.desc      Bundle keeps install time
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testBundleFacts0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testBundleFacts0029', 'bundle install time');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.installTime >= 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_BND_0030
   * @tc.name      testBundleFacts0030
   * @tc.desc      Bundle keeps update time
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testBundleFacts0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testBundleFacts0030', 'bundle update time');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.updateTime >= info.installTime).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_BND_0031
   * @tc.name      testBundleFacts0031
   * @tc.desc      Bundle keeps app index
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testBundleFacts0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testBundleFacts0031', 'bundle app index');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.appIndex >= 0).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_BND_0032
   * @tc.name      testBundleFacts0032
   * @tc.desc      App id contains bundle name
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testBundleFacts0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testBundleFacts0032', 'app id contains bundle name');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.signatureInfo.appId.startsWith('ohos.app.hap.myapplication')).assertEqual(true);
    expect(info.signatureInfo.appId.includes('ohos.app.hap.myapplication')).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_BND_0033
   * @tc.name      testBundleFacts0033
   * @tc.desc      Version name has three parts
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testBundleFacts0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testBundleFacts0033', 'version name has three parts');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.versionName.split('.').length).assertEqual(3);
    expect(info.versionName.split('.')[0]).assertEqual('1');
    expect(info.versionName.split('.')[1]).assertEqual('0');
    expect(info.versionName.split('.')[2]).assertEqual('0');
  });
  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_BND_0034
   * @tc.name      testBundleFacts0034
   * @tc.desc      Vendor is ascii
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testBundleFacts0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testBundleFacts0034', 'vendor is ascii');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.vendor.length).assertEqual(7);
    expect(info.vendor.charCodeAt(0)).assertEqual(101);
    expect(info.vendor.charCodeAt(6)).assertEqual(101);
  });
  });
}
