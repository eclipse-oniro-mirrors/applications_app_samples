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

export default function entryStringMatrixTest() {
  describe('entryStringMatrixTest', () => {
  beforeEach(async () => {
    await paceTurn();
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_STR_0001
   * @tc.name      testEntryString0001
   * @tc.desc      Entry string module_desc keeps exact text
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEntryString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEntryString0001', 'module_desc length');
    const res: resourceManager.ResourceManager = entryResources();
    const text: string = res.getStringByNameSync('module_desc');
    expect(text).assertEqual('module description');
    expect(text.length).assertEqual(18);
    expect(text.charAt(0)).assertEqual('m');
    expect(text.charAt(text.length - 1)).assertEqual('n');
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_STR_0002
   * @tc.name      testEntryString0002
   * @tc.desc      Entry string EntryAbility_desc keeps exact text
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEntryString0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEntryString0002', 'EntryAbility_desc length');
    const res: resourceManager.ResourceManager = entryResources();
    const text: string = res.getStringByNameSync('EntryAbility_desc');
    expect(text).assertEqual('description');
    expect(text.length).assertEqual(11);
    expect(text.charAt(0)).assertEqual('d');
    expect(text.charAt(text.length - 1)).assertEqual('n');
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_STR_0004
   * @tc.name      testEntryString0004
   * @tc.desc      Entry string module_desc keeps word shape
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEntryString0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEntryString0004', 'module_desc words');
    const res: resourceManager.ResourceManager = entryResources();
    const text: string = res.getStringByNameSync('module_desc');
    expect(text.split(' ').length).assertEqual(2);
    expect(text.split(' ')[0]).assertEqual('module');
    expect(text.split(' ')[text.split(' ').length - 1]).assertEqual('description');
    expect(text.toUpperCase()).assertEqual('MODULE DESCRIPTION');
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_STR_0005
   * @tc.name      testEntryString0005
   * @tc.desc      Entry string EntryAbility_desc keeps word shape
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEntryString0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEntryString0005', 'EntryAbility_desc words');
    const res: resourceManager.ResourceManager = entryResources();
    const text: string = res.getStringByNameSync('EntryAbility_desc');
    expect(text.split(' ').length).assertEqual(1);
    expect(text.split(' ')[0]).assertEqual('description');
    expect(text.split(' ')[text.split(' ').length - 1]).assertEqual('description');
    expect(text.toUpperCase()).assertEqual('DESCRIPTION');
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_STR_0022
   * @tc.name      testEntryString0022
   * @tc.desc      Entry string repeat read is stable
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEntryString0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEntryString0022', 'str repeat read is stable');
    const res: resourceManager.ResourceManager = entryResources();
    const first: string = res.getStringByNameSync('module_desc');
    const second: string = res.getStringByNameSync('module_desc');
    expect(first).assertEqual(second);
    expect(second).assertEqual('module description');
  });

  /**
   * @tc.number    SUB_BMS_PERFTEST_STR_0023
   * @tc.name      testEntryString0023
   * @tc.desc      Entry string repeated manager agrees
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEntryString0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEntryString0023', 'str repeated manager agrees');
    const res: resourceManager.ResourceManager = entryResources();
    const again: resourceManager.ResourceManager = entryResources();
    expect(again.getStringByNameSync('module_desc')).assertEqual(res.getStringByNameSync('module_desc'));
    expect(again.getStringByNameSync('EntryAbility_label')).assertEqual('perftest');
  });
  });
}
