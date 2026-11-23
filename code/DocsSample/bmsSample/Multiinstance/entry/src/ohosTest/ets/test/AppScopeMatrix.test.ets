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

export default function appScopeMatrixTest() {
  describe('appScopeMatrixTest', () => {
  beforeEach(async () => {
    await paceTurn();
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_APP_0001
   * @tc.name      testAppScope0001
   * @tc.desc      Application keeps vendor
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testAppScope0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testAppScope0001', 'app vendor');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.vendor).assertEqual('example');
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_APP_0002
   * @tc.name      testAppScope0002
   * @tc.desc      Application keeps version code
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testAppScope0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testAppScope0002', 'app version code');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.versionCode).assertEqual(1000000);
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_APP_0003
   * @tc.name      testAppScope0003
   * @tc.desc      Application keeps version name
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testAppScope0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testAppScope0003', 'app version name');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.versionName).assertEqual('1.0.0');
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_APP_0004
   * @tc.name      testAppScope0004
   * @tc.desc      Application keeps icon id
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testAppScope0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testAppScope0004', 'app icon id');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.appInfo.iconId > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_APP_0005
   * @tc.name      testAppScope0005
   * @tc.desc      Application keeps label id
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testAppScope0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testAppScope0005', 'app label id');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.appInfo.labelId > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_APP_0006
   * @tc.name      testAppScope0006
   * @tc.desc      Application keeps description id
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testAppScope0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testAppScope0006', 'app description id');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.appInfo.descriptionId >= 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_APP_0007
   * @tc.name      testAppScope0007
   * @tc.desc      Application keeps process name
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testAppScope0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testAppScope0007', 'app process name');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.appInfo.process.length > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_APP_0008
   * @tc.name      testAppScope0008
   * @tc.desc      Application keeps bundle type
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testAppScope0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testAppScope0008', 'app bundle type');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.appInfo.bundleType).assertEqual(bundleManager.BundleType.APP);
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_APP_0009
   * @tc.name      testAppScope0009
   * @tc.desc      Application keeps permissions empty
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testAppScope0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testAppScope0009', 'app permissions empty');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.appInfo.permissions.length).assertEqual(0);
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_APP_0010
   * @tc.name      testAppScope0010
   * @tc.desc      Application keeps enabled true
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testAppScope0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testAppScope0010', 'app enabled true');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.appInfo.enabled).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_APP_0011
   * @tc.name      testAppScope0011
   * @tc.desc      Application keeps removable true
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testAppScope0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testAppScope0011', 'app removable true');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.appInfo.removable).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_APP_0012
   * @tc.name      testAppScope0012
   * @tc.desc      Application keeps code path absolute
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testAppScope0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testAppScope0012', 'app code path absolute');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.appInfo.codePath.startsWith('/data')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_APP_0013
   * @tc.name      testAppScope0013
   * @tc.desc      Application keeps code path contains bundle
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testAppScope0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testAppScope0013', 'app code path contains bundle');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.appInfo.codePath.includes('ohos.app.hap.myapplication')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_APP_0014
   * @tc.name      testAppScope0014
   * @tc.desc      Application keeps token id present
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testAppScope0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testAppScope0014', 'app token id present');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.appInfo.accessTokenId > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_APP_0015
   * @tc.name      testAppScope0015
   * @tc.desc      Application keeps uid present
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testAppScope0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testAppScope0015', 'app uid present');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.appInfo.uid > 0).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_APP_0016
   * @tc.name      testAppScope0016
   * @tc.desc      Application keeps app name matches bundle
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testAppScope0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testAppScope0016', 'app app name matches bundle');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.appInfo.name).assertEqual(info.name);
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_APP_0017
   * @tc.name      testAppScope0017
   * @tc.desc      Application keeps app name length
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testAppScope0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testAppScope0017', 'app app name length');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.appInfo.name.length).assertEqual(26);
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_APP_0018
   * @tc.name      testAppScope0018
   * @tc.desc      Application keeps code path ends with bundle
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testAppScope0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testAppScope0018', 'app code path ends with bundle');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.appInfo.codePath.endsWith('ohos.app.hap.myapplication')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_APP_0019
   * @tc.name      testAppScope0019
   * @tc.desc      Application keeps code path has depth
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testAppScope0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testAppScope0019', 'app code path has depth');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.appInfo.codePath.split('/').length >= 3).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_APP_0020
   * @tc.name      testAppScope0020
   * @tc.desc      Application keeps app scope metadata array
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testAppScope0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testAppScope0020', 'app app scope metadata array');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(Array.isArray(info.appInfo.metadataArray)).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_APP_0021
   * @tc.name      testAppScope0021
   * @tc.desc      Application code path is stable
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testAppScope0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testAppScope0021', 'app paths');
    const first: bundleManager.BundleInfo = await selfBundle();
    const second: bundleManager.BundleInfo = await selfBundle();
    expect(first.appInfo.codePath).assertEqual(second.appInfo.codePath);
    expect(first.appInfo.codePath.includes('ohos.app.hap.myapplication')).assertTrue();
    expect(second.appInfo.codePath.startsWith('/data')).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_APP_0022
   * @tc.name      testAppScope0022
   * @tc.desc      Application uses the debug signature
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testAppScope0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testAppScope0022', 'app signature');
    const info: bundleManager.BundleInfo = await selfBundle();
    expect(info.signatureInfo.appId.startsWith(info.name)).assertTrue();
    expect(info.signatureInfo.fingerprint.length).assertEqual(64);
    const hexChars: string = '0123456789abcdefABCDEF';
    expect(info.signatureInfo.fingerprint.split('').every((ch: string) => hexChars.includes(ch))).assertTrue();
  });
  });
}
