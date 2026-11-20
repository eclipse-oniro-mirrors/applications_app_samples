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
