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
import { resourceManager } from '@kit.LocalizationKit';
import { util } from '@kit.ArkTS';
import {
  ENTRY_MODULE,
  ERR_RES_ID_INVALID,
  ERR_RES_NAME_INVALID,
  entryContext,
  errorCode,
  findModule,
  selfBundle
} from './shared/HarProbe';
import { paceTurn } from './shared/TestPace';
import { logCase } from './shared/TestLog';

function resources(): resourceManager.ResourceManager {
  return entryContext().resourceManager;
}

let lightCache: resourceManager.ResourceManager | null = null;
let darkCache: resourceManager.ResourceManager | null = null;

function lightManager(): resourceManager.ResourceManager {
  const cached: resourceManager.ResourceManager | null = lightCache;
  if (cached !== null) {
    return cached;
  }
  const manager: resourceManager.ResourceManager = resources();
  const config: resourceManager.Configuration = manager.getOverrideConfiguration();
  config.colorMode = resourceManager.ColorMode.LIGHT;
  const created: resourceManager.ResourceManager = manager.getOverrideResourceManager(config);
  lightCache = created;
  return created;
}

function darkManager(): resourceManager.ResourceManager {
  const cached: resourceManager.ResourceManager | null = darkCache;
  if (cached !== null) {
    return cached;
  }
  const manager: resourceManager.ResourceManager = resources();
  const config: resourceManager.Configuration = manager.getOverrideConfiguration();
  config.colorMode = resourceManager.ColorMode.DARK;
  const created: resourceManager.ResourceManager = manager.getOverrideResourceManager(config);
  darkCache = created;
  return created;
}

export default function harStringResourceMatrixTest() {
  describe('HarStringResourceMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRRES_0001
     * @tc.name      testHarStringResource0001
     * @tc.desc      Read string resource app_name by name
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarStringResource0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarStringResource0001', 'string resource case 1');
      expect(resources().getStringByNameSync('app_name')).assertEqual('simple013_har_package');
      {
      logCase('testHarStringResource0002', 'string resource case 2');
      expect(resources().getStringByNameSync('module_desc')).assertEqual('module description');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRRES_0003
     * @tc.name      testHarStringResource0003
     * @tc.desc      Read string resource EntryAbility_desc by name
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarStringResource0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarStringResource0003', 'string resource case 3');
      expect(resources().getStringByNameSync('EntryAbility_desc')).assertEqual('description');
      {
      logCase('testHarStringResource0004', 'string resource case 4');
      expect(resources().getStringByNameSync('EntryAbility_label')).assertEqual('label');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRRES_0005
     * @tc.name      testHarStringResource0005
     * @tc.desc      Read string resource button by name
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarStringResource0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarStringResource0005', 'string resource case 5');
      expect(resources().getStringByNameSync('button')).assertEqual('button');
      {
      logCase('testHarStringResource0006', 'string resource case 6');
      expect(resources().getStringByNameSync('native_add')).assertEqual('native_add');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRRES_0007
     * @tc.name      testHarStringResource0007
     * @tc.desc      Read string resource page_show by name
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarStringResource0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarStringResource0007', 'string resource case 7');
      expect(resources().getStringByNameSync('page_show')).assertEqual('page from package');
      {
      logCase('testHarStringResource0008', 'string resource case 8');
      expect(resources().getStringByNameSync('empty')).assertEqual('');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRRES_0009
     * @tc.name      testHarStringResource0009
     * @tc.desc      Read string resource hello_har by name
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarStringResource0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarStringResource0009', 'string resource case 9');
      expect(resources().getStringByNameSync('hello_har')).assertEqual('');
      {
      logCase('testHarStringResource0010', 'string resource case 10');
      expect(resources().getStringByNameSync('app_name').length).assertEqual(21);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRRES_0011
     * @tc.name      testHarStringResource0011
     * @tc.desc      First character of string resource app_name is 's'
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarStringResource0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarStringResource0011', 'string resource case 11');
      expect(resources().getStringByNameSync('app_name').charAt(0)).assertEqual('s');
      {
      logCase('testHarStringResource0012', 'string resource case 12');
      expect(resources().getStringByNameSync('app_name').charAt(indexOfLast('app_name'))).assertEqual('e');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRRES_0013
     * @tc.name      testHarStringResource0013
     * @tc.desc      First code unit of string resource app_name is 115
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarStringResource0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarStringResource0013', 'string resource case 13');
      expect(resources().getStringByNameSync('app_name').charCodeAt(0)).assertEqual(115);
      {
      logCase('testHarStringResource0014', 'string resource case 14');
      expect(resources().getStringByNameSync('app_name').toUpperCase()).assertEqual('SIMPLE013_HAR_PACKAGE');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRRES_0015
     * @tc.name      testHarStringResource0015
     * @tc.desc      Lower case of string resource app_name
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarStringResource0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarStringResource0015', 'string resource case 15');
      expect(resources().getStringByNameSync('app_name').toLowerCase()).assertEqual('simple013_har_package');
      {
      logCase('testHarStringResource0016', 'string resource case 16');
      expect(resources().getStringByNameSync('app_name').trim()).assertEqual('simple013_har_package');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRRES_0017
     * @tc.name      testHarStringResource0017
     * @tc.desc      String resource app_name read twice is stable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarStringResource0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarStringResource0017', 'string resource case 17');
      expect(resources().getStringByNameSync('app_name')).assertEqual('simple013_har_package');
      {
      logCase('testHarStringResource0018', 'string resource case 18');
      expect(resources().getStringByNameSync('module_desc').length).assertEqual(18);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRRES_0019
     * @tc.name      testHarStringResource0019
     * @tc.desc      First character of string resource module_desc is 'm'
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarStringResource0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarStringResource0019', 'string resource case 19');
      expect(resources().getStringByNameSync('module_desc').charAt(0)).assertEqual('m');
      {
      logCase('testHarStringResource0020', 'string resource case 20');
      expect(resources().getStringByNameSync('module_desc').charAt(indexOfLast('module_desc'))).assertEqual('n');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRRES_0021
     * @tc.name      testHarStringResource0021
     * @tc.desc      First code unit of string resource module_desc is 109
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarStringResource0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarStringResource0021', 'string resource case 21');
      expect(resources().getStringByNameSync('module_desc').charCodeAt(0)).assertEqual(109);
      {
      logCase('testHarStringResource0022', 'string resource case 22');
      expect(resources().getStringByNameSync('module_desc').toUpperCase()).assertEqual('MODULE DESCRIPTION');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRRES_0023
     * @tc.name      testHarStringResource0023
     * @tc.desc      Lower case of string resource module_desc
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarStringResource0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarStringResource0023', 'string resource case 23');
      expect(resources().getStringByNameSync('module_desc').toLowerCase()).assertEqual('module description');
      {
      logCase('testHarStringResource0024', 'string resource case 24');
      expect(resources().getStringByNameSync('module_desc').trim()).assertEqual('module description');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRRES_0025
     * @tc.name      testHarStringResource0025
     * @tc.desc      String resource module_desc read twice is stable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarStringResource0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarStringResource0025', 'string resource case 25');
      expect(resources().getStringByNameSync('module_desc')).assertEqual('module description');
      {
      logCase('testHarStringResource0026', 'string resource case 26');
      expect(resources().getStringByNameSync('module_desc').split(' ').length).assertEqual(2);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRRES_0027
     * @tc.name      testHarStringResource0027
     * @tc.desc      String resource module_desc contains a space at 6
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarStringResource0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarStringResource0027', 'string resource case 27');
      expect(resources().getStringByNameSync('module_desc').indexOf(' ')).assertEqual(6);
      {
      logCase('testHarStringResource0028', 'string resource case 28');
      expect(resources().getStringByNameSync('EntryAbility_desc').length).assertEqual(11);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRRES_0029
     * @tc.name      testHarStringResource0029
     * @tc.desc      First character of string resource EntryAbility_desc is 'd'
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarStringResource0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarStringResource0029', 'string resource case 29');
      expect(resources().getStringByNameSync('EntryAbility_desc').charAt(0)).assertEqual('d');
      {
      logCase('testHarStringResource0030', 'string resource case 30');
      const descText: string = resources().getStringByNameSync('EntryAbility_desc');
      expect(descText.charAt(indexOfLast('EntryAbility_desc'))).assertEqual('n');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRRES_0031
     * @tc.name      testHarStringResource0031
     * @tc.desc      First code unit of string resource EntryAbility_desc is 100
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarStringResource0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarStringResource0031', 'string resource case 31');
      expect(resources().getStringByNameSync('EntryAbility_desc').charCodeAt(0)).assertEqual(100);
      {
      logCase('testHarStringResource0032', 'string resource case 32');
      expect(resources().getStringByNameSync('EntryAbility_desc').toUpperCase()).assertEqual('DESCRIPTION');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRRES_0033
     * @tc.name      testHarStringResource0033
     * @tc.desc      Lower case of string resource EntryAbility_desc
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarStringResource0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarStringResource0033', 'string resource case 33');
      expect(resources().getStringByNameSync('EntryAbility_desc').toLowerCase()).assertEqual('description');
      {
      logCase('testHarStringResource0034', 'string resource case 34');
      expect(resources().getStringByNameSync('EntryAbility_desc').trim()).assertEqual('description');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRRES_0035
     * @tc.name      testHarStringResource0035
     * @tc.desc      String resource EntryAbility_desc read twice is stable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarStringResource0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarStringResource0035', 'string resource case 35');
      expect(resources().getStringByNameSync('EntryAbility_desc')).assertEqual('description');
      {
      logCase('testHarStringResource0036', 'string resource case 36');
      expect(resources().getStringByNameSync('EntryAbility_label').length).assertEqual(5);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRRES_0037
     * @tc.name      testHarStringResource0037
     * @tc.desc      First character of string resource EntryAbility_label is 'l'
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarStringResource0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarStringResource0037', 'string resource case 37');
      expect(resources().getStringByNameSync('EntryAbility_label').charAt(0)).assertEqual('l');
      {
      logCase('testHarStringResource0038', 'string resource case 38');
      const labelText: string = resources().getStringByNameSync('EntryAbility_label');
      expect(labelText.charAt(indexOfLast('EntryAbility_label'))).assertEqual('l');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRRES_0039
     * @tc.name      testHarStringResource0039
     * @tc.desc      First code unit of string resource EntryAbility_label is 108
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarStringResource0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarStringResource0039', 'string resource case 39');
      expect(resources().getStringByNameSync('EntryAbility_label').charCodeAt(0)).assertEqual(108);
      {
      logCase('testHarStringResource0040', 'string resource case 40');
      expect(resources().getStringByNameSync('EntryAbility_label').toUpperCase()).assertEqual('LABEL');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRRES_0041
     * @tc.name      testHarStringResource0041
     * @tc.desc      Lower case of string resource EntryAbility_label
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarStringResource0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarStringResource0041', 'string resource case 41');
      expect(resources().getStringByNameSync('EntryAbility_label').toLowerCase()).assertEqual('label');
      {
      logCase('testHarStringResource0042', 'string resource case 42');
      expect(resources().getStringByNameSync('EntryAbility_label').trim()).assertEqual('label');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRRES_0043
     * @tc.name      testHarStringResource0043
     * @tc.desc      String resource EntryAbility_label read twice is stable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarStringResource0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarStringResource0043', 'string resource case 43');
      expect(resources().getStringByNameSync('EntryAbility_label')).assertEqual('label');
      {
      logCase('testHarStringResource0044', 'string resource case 44');
      expect(resources().getStringByNameSync('button').length).assertEqual(6);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRRES_0045
     * @tc.name      testHarStringResource0045
     * @tc.desc      First character of string resource button is 'b'
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarStringResource0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarStringResource0045', 'string resource case 45');
      expect(resources().getStringByNameSync('button').charAt(0)).assertEqual('b');
      {
      logCase('testHarStringResource0046', 'string resource case 46');
      expect(resources().getStringByNameSync('button').charAt(indexOfLast('button'))).assertEqual('n');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRRES_0047
     * @tc.name      testHarStringResource0047
     * @tc.desc      First code unit of string resource button is 98
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarStringResource0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarStringResource0047', 'string resource case 47');
      expect(resources().getStringByNameSync('button').charCodeAt(0)).assertEqual(98);
      {
      logCase('testHarStringResource0048', 'string resource case 48');
      expect(resources().getStringByNameSync('button').toUpperCase()).assertEqual('BUTTON');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRRES_0049
     * @tc.name      testHarStringResource0049
     * @tc.desc      Lower case of string resource button
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarStringResource0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarStringResource0049', 'string resource case 49');
      expect(resources().getStringByNameSync('button').toLowerCase()).assertEqual('button');
      {
      logCase('testHarStringResource0050', 'string resource case 50');
      expect(resources().getStringByNameSync('button').trim()).assertEqual('button');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRRES_0051
     * @tc.name      testHarStringResource0051
     * @tc.desc      String resource button read twice is stable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarStringResource0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarStringResource0051', 'string resource case 51');
      expect(resources().getStringByNameSync('button')).assertEqual('button');
      {
      logCase('testHarStringResource0052', 'string resource case 52');
      expect(resources().getStringByNameSync('native_add').length).assertEqual(10);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARSTRRES_0053
     * @tc.name      testHarStringResource0053
     * @tc.desc      First character of string resource native_add is 'n'
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarStringResource0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarStringResource0053', 'string resource case 53');
