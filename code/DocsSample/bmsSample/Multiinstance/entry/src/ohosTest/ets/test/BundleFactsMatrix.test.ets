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
