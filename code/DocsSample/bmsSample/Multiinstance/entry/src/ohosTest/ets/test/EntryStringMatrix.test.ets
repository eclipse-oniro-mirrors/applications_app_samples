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
   * @tc.number    SUB_BMS_MULTIINSTANCE_STR_0001
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_STR_0002
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_STR_0003
   * @tc.name      testEntryString0003
   * @tc.desc      Entry string EntryAbility_label keeps exact text
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEntryString0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEntryString0003', 'EntryAbility_label length');
    const res: resourceManager.ResourceManager = entryResources();
    const text: string = res.getStringByNameSync('EntryAbility_label');
    expect(text).assertEqual('label');
    expect(text.length).assertEqual(5);
    expect(text.charAt(0)).assertEqual('l');
    expect(text.charAt(text.length - 1)).assertEqual('l');
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_STR_0004
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_STR_0005
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_STR_0006
   * @tc.name      testEntryString0006
   * @tc.desc      Entry string EntryAbility_label keeps word shape
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEntryString0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEntryString0006', 'EntryAbility_label words');
    const res: resourceManager.ResourceManager = entryResources();
    const text: string = res.getStringByNameSync('EntryAbility_label');
    expect(text.split(' ').length).assertEqual(1);
    expect(text.split(' ')[0]).assertEqual('label');
    expect(text.split(' ')[text.split(' ').length - 1]).assertEqual('label');
    expect(text.toUpperCase()).assertEqual('LABEL');
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_STR_0007
   * @tc.name      testEntryString0007
   * @tc.desc      Entry string lookup rejects uppercase variant
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEntryString0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEntryString0007', 'string reject uppercase variant');
    const res: resourceManager.ResourceManager = entryResources();
    expect(errorCode(() => {
      res.getStringByNameSync('MODULE_DESC');
    })).assertEqual(ERR_RES_NAME_INVALID);
    expect(res.getStringByNameSync('module_desc').length).assertEqual(18);
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_STR_0008
   * @tc.name      testEntryString0008
   * @tc.desc      Entry string lookup rejects camel variant
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEntryString0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEntryString0008', 'string reject camel variant');
    const res: resourceManager.ResourceManager = entryResources();
    expect(errorCode(() => {
      res.getStringByNameSync('moduleDesc');
    })).assertEqual(ERR_RES_NAME_INVALID);
    expect(res.getStringByNameSync('module_desc').length).assertEqual(18);
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_STR_0009
   * @tc.name      testEntryString0009
   * @tc.desc      Entry string lookup rejects dash variant
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEntryString0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEntryString0009', 'string reject dash variant');
    const res: resourceManager.ResourceManager = entryResources();
    expect(errorCode(() => {
      res.getStringByNameSync('module-desc');
    })).assertEqual(ERR_RES_NAME_INVALID);
    expect(res.getStringByNameSync('module_desc').length).assertEqual(18);
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_STR_0010
   * @tc.name      testEntryString0010
   * @tc.desc      Entry string lookup rejects missing suffix
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEntryString0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEntryString0010', 'string reject missing suffix');
    const res: resourceManager.ResourceManager = entryResources();
    expect(errorCode(() => {
      res.getStringByNameSync('EntryAbility_descx');
    })).assertEqual(ERR_RES_NAME_INVALID);
    expect(res.getStringByNameSync('module_desc').length).assertEqual(18);
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_STR_0011
   * @tc.name      testEntryString0011
   * @tc.desc      Entry string lookup rejects empty name
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEntryString0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEntryString0011', 'string reject empty name');
    const res: resourceManager.ResourceManager = entryResources();
    expect(errorCode(() => {
      res.getStringByNameSync('');
    })).assertEqual(ERR_RES_NAME_INVALID);
    expect(res.getStringByNameSync('module_desc').length).assertEqual(18);
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_STR_0012
   * @tc.name      testEntryString0012
   * @tc.desc      Entry string lookup rejects space padded
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEntryString0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEntryString0012', 'string reject space padded');
    const res: resourceManager.ResourceManager = entryResources();
    expect(errorCode(() => {
      res.getStringByNameSync(' module_desc');
    })).assertEqual(ERR_RES_NAME_INVALID);
    expect(res.getStringByNameSync('module_desc').length).assertEqual(18);
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_STR_0013
   * @tc.name      testEntryString0013
   * @tc.desc      Entry string lookup rejects unknown prefix
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEntryString0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEntryString0013', 'string reject unknown prefix');
    const res: resourceManager.ResourceManager = entryResources();
    expect(errorCode(() => {
      res.getStringByNameSync('unknown_desc');
    })).assertEqual(ERR_RES_NAME_INVALID);
    expect(res.getStringByNameSync('module_desc').length).assertEqual(18);
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_STR_0014
   * @tc.name      testEntryString0014
   * @tc.desc      Entry string module desc by id
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEntryString0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEntryString0014', 'str module desc by id');
    const res: resourceManager.ResourceManager = entryResources();
    expect(res.getStringSync($r('app.string.module_desc').id)).assertEqual('module description');
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_STR_0015
   * @tc.name      testEntryString0015
   * @tc.desc      Entry string entry desc by id
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEntryString0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEntryString0015', 'str entry desc by id');
    const res: resourceManager.ResourceManager = entryResources();
    expect(res.getStringSync($r('app.string.EntryAbility_desc').id)).assertEqual('description');
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_STR_0016
   * @tc.name      testEntryString0016
   * @tc.desc      Entry string entry label by id
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEntryString0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEntryString0016', 'str entry label by id');
    const res: resourceManager.ResourceManager = entryResources();
    expect(res.getStringSync($r('app.string.EntryAbility_label').id)).assertEqual('label');
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_STR_0017
   * @tc.name      testEntryString0017
   * @tc.desc      Entry string cross id and name module desc
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEntryString0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEntryString0017', 'str cross id and name module desc');
    const res: resourceManager.ResourceManager = entryResources();
    const byId: string = res.getStringSync($r('app.string.module_desc').id);
    const byName: string = res.getStringByNameSync('module_desc');
    expect(byId).assertEqual(byName);
    expect(byId.length).assertEqual(18);
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_STR_0018
   * @tc.name      testEntryString0018
   * @tc.desc      Entry string cross id and name entry desc
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEntryString0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEntryString0018', 'str cross id and name entry desc');
    const res: resourceManager.ResourceManager = entryResources();
    const byId: string = res.getStringSync($r('app.string.EntryAbility_desc').id);
    const byName: string = res.getStringByNameSync('EntryAbility_desc');
    expect(byId).assertEqual(byName);
    expect(byName.charAt(0)).assertEqual('d');
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_STR_0019
   * @tc.name      testEntryString0019
   * @tc.desc      Entry string absent id throws
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testEntryString0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testEntryString0019', 'str absent id throws');
    const res: resourceManager.ResourceManager = entryResources();
    const missing: number = errorCode(() => {
      res.getStringSync(0x7FFFFFFF);
    });
    expect(missing === ERR_RES_ID_INVALID || missing === 9001002).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_STR_0020
   * @tc.name      testEntryString0020
   * @tc.desc      Entry string zero id throws
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testEntryString0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testEntryString0020', 'str zero id throws');
    const res: resourceManager.ResourceManager = entryResources();
    expect(errorCode(() => {
      res.getStringSync(0);
    })).assertEqual(ERR_RES_ID_INVALID);
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_STR_0021
   * @tc.name      testEntryString0021
   * @tc.desc      Entry string negative id throws
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testEntryString0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testEntryString0021', 'str negative id throws');
    const res: resourceManager.ResourceManager = entryResources();
    expect(errorCode(() => {
      res.getStringSync(-1);
    })).assertEqual(ERR_RES_ID_INVALID);
  });

  /**
   * @tc.number    SUB_BMS_MULTIINSTANCE_STR_0022
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
   * @tc.number    SUB_BMS_MULTIINSTANCE_STR_0023
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
    expect(again.getStringByNameSync('EntryAbility_label')).assertEqual('label');
  });
  });
}
