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
import { nativeAdd, func, func2 } from 'library';
import {
  APP_NAME,
  BACKUP_METADATA,
  BUNDLE_NAME,
  ENTRY_ABILITY,
  ENTRY_MODULE,
  LIB_FUNC2_RESULT,
  LIB_FUNC_RESULT,
  entryContext,
  findModule,
  selfBundle
} from './shared/HarProbe';
import { paceTurn } from './shared/TestPace';
import { logCase } from './shared/TestLog';

function res(): resourceManager.ResourceManager {
  return entryContext().resourceManager;
}

async function mod(): Promise<bundleManager.HapModuleInfo> {
  return findModule(await selfBundle(), ENTRY_MODULE);
}

async function info(): Promise<bundleManager.BundleInfo> {
  return selfBundle();
}

export default function integrationChainMatrixTest() {
  describe('IntegrationChainMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0001
     * @tc.name      testIntegration0001
     * @tc.desc      Integration chain 1 pairs I12 with I07
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testIntegration0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testIntegration0001', 'I12+I07');
      expect((await mod()).abilitiesInfo[0].name).assertEqual(ENTRY_ABILITY);
      expect(entryContext().preferencesDir.endsWith('/preferences')).assertTrue();
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual('label');
      {
      logCase('testIntegration0002', 'I23+I16');
      expect(nativeAdd(21, 34)).assertEqual(55);
      expect(res().getStringByNameSync('page_show')).assertEqual('page from package');
      expect((res().getColorByNameSync('text_color') >>> 24) & 0xFF).assertEqual(0xFF);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0003
     * @tc.name      testIntegration0003
     * @tc.desc      Integration chain 3 pairs I04 with I19
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIntegration0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      logCase('testIntegration0003', 'I04+I19');
      expect(entryContext().cacheDir.endsWith('/cache')).assertTrue();
      expect(res().getColorByNameSync('start_window_background')).assertEqual(0xFFFFFFFF);
      expect((await info()).vendor).assertEqual('example');
      {
      logCase('testIntegration0004', 'I16+I02');
      expect(res().getStringByNameSync('page_show')).assertEqual('page from package');
      expect(entryContext().bundleCodeDir.length > 0).assertTrue();
      expect((await mod()).abilitiesInfo.length >= 1).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0005
     * @tc.name      testIntegration0005
     * @tc.desc      Integration chain 5 pairs I08 with I14
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIntegration0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testIntegration0005', 'I08+I14');
      expect(entryContext().tempDir.endsWith('/temp')).assertTrue();
      expect((await mod()).abilitiesInfo[0].exported).assertTrue();
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual('label');
      {
      logCase('testIntegration0006', 'I19+I23');
      expect(res().getColorByNameSync('start_window_background')).assertEqual(0xFFFFFFFF);
      expect(nativeAdd(21, 34)).assertEqual(55);
      expect((res().getColorByNameSync('text_color') >>> 24) & 0xFF).assertEqual(0xFF);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0007
     * @tc.name      testIntegration0007
     * @tc.desc      Integration chain 7 pairs I12 with I08
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testIntegration0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testIntegration0007', 'I12+I08');
      expect((await mod()).abilitiesInfo[0].name).assertEqual(ENTRY_ABILITY);
      expect(entryContext().tempDir.endsWith('/temp')).assertTrue();
      expect((await info()).vendor).assertEqual('example');
      {
      logCase('testIntegration0008', 'I23+I17');
      expect(nativeAdd(21, 34)).assertEqual(55);
      expect(res().getColorByNameSync('page_background')).assertEqual(0xFFFFFFFF);
      expect((await mod()).abilitiesInfo.length >= 1).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0009
     * @tc.name      testIntegration0009
     * @tc.desc      Integration chain 9 pairs I04 with I20
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIntegration0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      logCase('testIntegration0009', 'I04+I20');
      expect(entryContext().cacheDir.endsWith('/cache')).assertTrue();
      expect(res().getStringByNameSync('module_desc')).assertEqual('module description');
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual('label');
      {
      logCase('testIntegration0010', 'I16+I03');
      expect(res().getStringByNameSync('page_show')).assertEqual('page from package');
      expect(entryContext().filesDir.endsWith('/files')).assertTrue();
      expect((res().getColorByNameSync('text_color') >>> 24) & 0xFF).assertEqual(0xFF);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0011
     * @tc.name      testIntegration0011
     * @tc.desc      Integration chain 11 pairs I08 with I15
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIntegration0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testIntegration0011', 'I08+I15');
      expect(entryContext().tempDir.endsWith('/temp')).assertTrue();
      expect(res().getStringByNameSync('app_name')).assertEqual(APP_NAME);
      expect((await info()).vendor).assertEqual('example');
      {
      logCase('testIntegration0012', 'I19+I24');
      expect(res().getColorByNameSync('start_window_background')).assertEqual(0xFFFFFFFF);
      expect((await info()).versionName).assertEqual('1.0.0');
      expect((await mod()).abilitiesInfo.length >= 1).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0013
     * @tc.name      testIntegration0013
     * @tc.desc      Integration chain 13 pairs I12 with I09
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testIntegration0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testIntegration0013', 'I12+I09');
      expect((await mod()).abilitiesInfo[0].name).assertEqual(ENTRY_ABILITY);
      expect(entryContext().filesDir.length > 0).assertTrue();
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual('label');
      {
      logCase('testIntegration0014', 'I23+I18');
      expect(nativeAdd(21, 34)).assertEqual(55);
      expect(res().getNumberByName('page_text_font_size')).assertEqual(50);
      expect((res().getColorByNameSync('text_color') >>> 24) & 0xFF).assertEqual(0xFF);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0015
     * @tc.name      testIntegration0015
     * @tc.desc      Integration chain 15 pairs I04 with I21
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIntegration0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      logCase('testIntegration0015', 'I04+I21');
      expect(entryContext().cacheDir.endsWith('/cache')).assertTrue();
      expect(func()).assertEqual(LIB_FUNC_RESULT);
      expect((await info()).vendor).assertEqual('example');
      {
      logCase('testIntegration0016', 'I16+I04');
      expect(res().getStringByNameSync('page_show')).assertEqual('page from package');
      expect(entryContext().cacheDir.endsWith('/cache')).assertTrue();
      expect((await mod()).abilitiesInfo.length >= 1).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0017
     * @tc.name      testIntegration0017
     * @tc.desc      Integration chain 17 pairs I08 with I16
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIntegration0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testIntegration0017', 'I08+I16');
      expect(entryContext().tempDir.endsWith('/temp')).assertTrue();
      expect(res().getStringByNameSync('page_show')).assertEqual('page from package');
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual('label');
      {
      logCase('testIntegration0018', 'I19+I25');
      expect(res().getColorByNameSync('start_window_background')).assertEqual(0xFFFFFFFF);
      expect((await info()).hapModulesInfo.length >= 1).assertTrue();
      expect((res().getColorByNameSync('text_color') >>> 24) & 0xFF).assertEqual(0xFF);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0019
     * @tc.name      testIntegration0019
     * @tc.desc      Integration chain 19 pairs I01 with I02
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testIntegration0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testIntegration0019', 'I01+I02');
      expect(entryContext().applicationInfo.name).assertEqual(BUNDLE_NAME);
      expect(entryContext().bundleCodeDir.length > 0).assertTrue();
      expect((await info()).vendor).assertEqual('example');
      {
      logCase('testIntegration0020', 'I12+I10');
      expect((await mod()).abilitiesInfo[0].name).assertEqual(ENTRY_ABILITY);
      expect(entryContext().cacheDir.length > 0).assertTrue();
      expect((await mod()).abilitiesInfo.length >= 1).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0021
     * @tc.name      testIntegration0021
     * @tc.desc      Integration chain 21 pairs I23 with I19
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIntegration0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      logCase('testIntegration0021', 'I23+I19');
      expect(nativeAdd(21, 34)).assertEqual(55);
      expect(res().getColorByNameSync('start_window_background')).assertEqual(0xFFFFFFFF);
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual('label');
      {
      logCase('testIntegration0022', 'I04+I22');
      expect(entryContext().cacheDir.endsWith('/cache')).assertTrue();
      expect(func2()).assertEqual(LIB_FUNC2_RESULT);
      expect((res().getColorByNameSync('text_color') >>> 24) & 0xFF).assertEqual(0xFF);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0023
     * @tc.name      testIntegration0023
     * @tc.desc      Integration chain 23 pairs I16 with I05
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIntegration0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testIntegration0023', 'I16+I05');
      expect(res().getStringByNameSync('page_show')).assertEqual('page from package');
      expect(typeof entryContext().resourceDir === 'string').assertTrue();
      expect((await info()).vendor).assertEqual('example');
      {
      logCase('testIntegration0024', 'I08+I17');
      expect(entryContext().tempDir.endsWith('/temp')).assertTrue();
      expect(res().getColorByNameSync('page_background')).assertEqual(0xFFFFFFFF);
      expect((await mod()).abilitiesInfo.length >= 1).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0025
     * @tc.name      testIntegration0025
     * @tc.desc      Integration chain 25 pairs I19 with I26
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testIntegration0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testIntegration0025', 'I19+I26');
      expect(res().getColorByNameSync('start_window_background')).assertEqual(0xFFFFFFFF);
      expect((await info()).appInfo.name).assertEqual(BUNDLE_NAME);
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual('label');
      {
      logCase('testIntegration0026', 'I01+I03');
      expect(entryContext().applicationInfo.name).assertEqual(BUNDLE_NAME);
      expect(entryContext().filesDir.endsWith('/files')).assertTrue();
      expect((res().getColorByNameSync('text_color') >>> 24) & 0xFF).assertEqual(0xFF);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0027
     * @tc.name      testIntegration0027
     * @tc.desc      Integration chain 27 pairs I12 with I11
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIntegration0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      logCase('testIntegration0027', 'I12+I11');
      expect((await mod()).abilitiesInfo[0].name).assertEqual(ENTRY_ABILITY);
      expect((await mod()).name).assertEqual(ENTRY_MODULE);
      expect((await info()).vendor).assertEqual('example');
      {
      logCase('testIntegration0028', 'I23+I20');
      expect(nativeAdd(21, 34)).assertEqual(55);
      expect(res().getStringByNameSync('module_desc')).assertEqual('module description');
      expect((await mod()).abilitiesInfo.length >= 1).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0029
     * @tc.name      testIntegration0029
     * @tc.desc      Integration chain 29 pairs I04 with I23
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIntegration0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testIntegration0029', 'I04+I23');
      expect(entryContext().cacheDir.endsWith('/cache')).assertTrue();
      expect(nativeAdd(21, 34)).assertEqual(55);
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual('label');
      {
      logCase('testIntegration0030', 'I16+I06');
      expect(res().getStringByNameSync('page_show')).assertEqual('page from package');
      expect(entryContext().databaseDir.endsWith('/database')).assertTrue();
      expect((res().getColorByNameSync('text_color') >>> 24) & 0xFF).assertEqual(0xFF);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0031
     * @tc.name      testIntegration0031
     * @tc.desc      Integration chain 31 pairs I08 with I18
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testIntegration0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testIntegration0031', 'I08+I18');
      expect(entryContext().tempDir.endsWith('/temp')).assertTrue();
      expect(res().getNumberByName('page_text_font_size')).assertEqual(50);
      expect((await info()).vendor).assertEqual('example');
      {
      logCase('testIntegration0032', 'I20+I01');
      expect(res().getStringByNameSync('module_desc')).assertEqual('module description');
      expect(entryContext().applicationInfo.name).assertEqual(BUNDLE_NAME);
      expect((await mod()).abilitiesInfo.length >= 1).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0033
     * @tc.name      testIntegration0033
     * @tc.desc      Integration chain 33 pairs I01 with I04
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIntegration0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      logCase('testIntegration0033', 'I01+I04');
      expect(entryContext().applicationInfo.name).assertEqual(BUNDLE_NAME);
      expect(entryContext().cacheDir.endsWith('/cache')).assertTrue();
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual('label');
      {
      logCase('testIntegration0034', 'I12+I13');
      expect((await mod()).abilitiesInfo[0].name).assertEqual(ENTRY_ABILITY);
      expect((await mod()).extensionAbilitiesInfo[0].metadata[0].name).assertEqual(BACKUP_METADATA);
      expect((res().getColorByNameSync('text_color') >>> 24) & 0xFF).assertEqual(0xFF);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0035
     * @tc.name      testIntegration0035
     * @tc.desc      Integration chain 35 pairs I23 with I21
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIntegration0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testIntegration0035', 'I23+I21');
      expect(nativeAdd(21, 34)).assertEqual(55);
      expect(func()).assertEqual(LIB_FUNC_RESULT);
      expect((await info()).vendor).assertEqual('example');
      {
      logCase('testIntegration0036', 'I04+I24');
      expect(entryContext().cacheDir.endsWith('/cache')).assertTrue();
      expect((await info()).versionName).assertEqual('1.0.0');
      expect((await mod()).abilitiesInfo.length >= 1).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0037
     * @tc.name      testIntegration0037
     * @tc.desc      Integration chain 37 pairs I16 with I07
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testIntegration0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testIntegration0037', 'I16+I07');
      expect(res().getStringByNameSync('page_show')).assertEqual('page from package');
      expect(entryContext().preferencesDir.endsWith('/preferences')).assertTrue();
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual('label');
      {
      logCase('testIntegration0038', 'I08+I19');
      expect(entryContext().tempDir.endsWith('/temp')).assertTrue();
      expect(res().getColorByNameSync('start_window_background')).assertEqual(0xFFFFFFFF);
      expect((res().getColorByNameSync('text_color') >>> 24) & 0xFF).assertEqual(0xFF);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0039
     * @tc.name      testIntegration0039
     * @tc.desc      Integration chain 39 pairs I20 with I02
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIntegration0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      logCase('testIntegration0039', 'I20+I02');
      expect(res().getStringByNameSync('module_desc')).assertEqual('module description');
      expect(entryContext().bundleCodeDir.length > 0).assertTrue();
      expect((await info()).vendor).assertEqual('example');
      {
      logCase('testIntegration0040', 'I01+I05');
      expect(entryContext().applicationInfo.name).assertEqual(BUNDLE_NAME);
      expect(typeof entryContext().resourceDir === 'string').assertTrue();
      expect((await mod()).abilitiesInfo.length >= 1).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0041
     * @tc.name      testIntegration0041
     * @tc.desc      Integration chain 41 pairs I12 with I14
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIntegration0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testIntegration0041', 'I12+I14');
      expect((await mod()).abilitiesInfo[0].name).assertEqual(ENTRY_ABILITY);
      expect((await mod()).abilitiesInfo[0].exported).assertTrue();
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual('label');
      {
      logCase('testIntegration0042', 'I23+I22');
      expect(nativeAdd(21, 34)).assertEqual(55);
      expect(func2()).assertEqual(LIB_FUNC2_RESULT);
      expect((res().getColorByNameSync('text_color') >>> 24) & 0xFF).assertEqual(0xFF);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0043
     * @tc.name      testIntegration0043
     * @tc.desc      Integration chain 43 pairs I04 with I25
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testIntegration0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testIntegration0043', 'I04+I25');
      expect(entryContext().cacheDir.endsWith('/cache')).assertTrue();
      expect((await info()).hapModulesInfo.length >= 1).assertTrue();
      expect((await info()).vendor).assertEqual('example');
      {
      logCase('testIntegration0044', 'I16+I08');
      expect(res().getStringByNameSync('page_show')).assertEqual('page from package');
      expect(entryContext().tempDir.endsWith('/temp')).assertTrue();
      expect((await mod()).abilitiesInfo.length >= 1).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0045
     * @tc.name      testIntegration0045
     * @tc.desc      Integration chain 45 pairs I08 with I20
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIntegration0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      logCase('testIntegration0045', 'I08+I20');
      expect(entryContext().tempDir.endsWith('/temp')).assertTrue();
      expect(res().getStringByNameSync('module_desc')).assertEqual('module description');
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual('label');
      {
      logCase('testIntegration0046', 'I20+I03');
      expect(res().getStringByNameSync('module_desc')).assertEqual('module description');
      expect(entryContext().filesDir.endsWith('/files')).assertTrue();
      expect((res().getColorByNameSync('text_color') >>> 24) & 0xFF).assertEqual(0xFF);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0047
     * @tc.name      testIntegration0047
     * @tc.desc      Integration chain 47 pairs I01 with I06
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIntegration0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testIntegration0047', 'I01+I06');
      expect(entryContext().applicationInfo.name).assertEqual(BUNDLE_NAME);
      expect(entryContext().databaseDir.endsWith('/database')).assertTrue();
      expect((await info()).vendor).assertEqual('example');
      {
      logCase('testIntegration0048', 'I12+I15');
      expect((await mod()).abilitiesInfo[0].name).assertEqual(ENTRY_ABILITY);
      expect(res().getStringByNameSync('app_name')).assertEqual(APP_NAME);
      expect((await mod()).abilitiesInfo.length >= 1).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0049
     * @tc.name      testIntegration0049
     * @tc.desc      Integration chain 49 pairs I23 with I24
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testIntegration0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testIntegration0049', 'I23+I24');
      expect(nativeAdd(21, 34)).assertEqual(55);
      expect((await info()).versionName).assertEqual('1.0.0');
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual('label');
      {
      logCase('testIntegration0050', 'I04+I26');
      expect(entryContext().cacheDir.endsWith('/cache')).assertTrue();
      expect((await info()).appInfo.name).assertEqual(BUNDLE_NAME);
      expect((res().getColorByNameSync('text_color') >>> 24) & 0xFF).assertEqual(0xFF);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0051
     * @tc.name      testIntegration0051
     * @tc.desc      Integration chain 51 pairs I16 with I09
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIntegration0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      logCase('testIntegration0051', 'I16+I09');
      expect(res().getStringByNameSync('page_show')).assertEqual('page from package');
      expect(entryContext().filesDir.length > 0).assertTrue();
      expect((await info()).vendor).assertEqual('example');
      {
      logCase('testIntegration0052', 'I08+I21');
      expect(entryContext().tempDir.endsWith('/temp')).assertTrue();
      expect(func()).assertEqual(LIB_FUNC_RESULT);
      expect((await mod()).abilitiesInfo.length >= 1).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0053
     * @tc.name      testIntegration0053
     * @tc.desc      Integration chain 53 pairs I20 with I04
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIntegration0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testIntegration0053', 'I20+I04');
      expect(res().getStringByNameSync('module_desc')).assertEqual('module description');
      expect(entryContext().cacheDir.endsWith('/cache')).assertTrue();
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual('label');
      {
      logCase('testIntegration0054', 'I01+I07');
      expect(entryContext().applicationInfo.name).assertEqual(BUNDLE_NAME);
      expect(entryContext().preferencesDir.endsWith('/preferences')).assertTrue();
      expect((res().getColorByNameSync('text_color') >>> 24) & 0xFF).assertEqual(0xFF);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0055
     * @tc.name      testIntegration0055
     * @tc.desc      Integration chain 55 pairs I12 with I16
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testIntegration0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testIntegration0055', 'I12+I16');
      expect((await mod()).abilitiesInfo[0].name).assertEqual(ENTRY_ABILITY);
      expect(res().getStringByNameSync('page_show')).assertEqual('page from package');
      expect((await info()).vendor).assertEqual('example');
      {
      logCase('testIntegration0056', 'I23+I25');
      expect(nativeAdd(21, 34)).assertEqual(55);
      expect((await info()).hapModulesInfo.length >= 1).assertTrue();
      expect((await mod()).abilitiesInfo.length >= 1).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0057
     * @tc.name      testIntegration0057
     * @tc.desc      Integration chain 57 pairs I05 with I01
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIntegration0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      logCase('testIntegration0057', 'I05+I01');
      expect(typeof entryContext().resourceDir === 'string').assertTrue();
      expect(entryContext().applicationInfo.name).assertEqual(BUNDLE_NAME);
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual('label');
      {
      logCase('testIntegration0058', 'I16+I10');
      expect(res().getStringByNameSync('page_show')).assertEqual('page from package');
      expect(entryContext().cacheDir.length > 0).assertTrue();
      expect((res().getColorByNameSync('text_color') >>> 24) & 0xFF).assertEqual(0xFF);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0059
     * @tc.name      testIntegration0059
     * @tc.desc      Integration chain 59 pairs I08 with I22
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIntegration0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testIntegration0059', 'I08+I22');
      expect(entryContext().tempDir.endsWith('/temp')).assertTrue();
      expect(func2()).assertEqual(LIB_FUNC2_RESULT);
      expect((await info()).vendor).assertEqual('example');
      {
      logCase('testIntegration0060', 'I20+I05');
      expect(res().getStringByNameSync('module_desc')).assertEqual('module description');
      expect(typeof entryContext().resourceDir === 'string').assertTrue();
      expect((await mod()).abilitiesInfo.length >= 1).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0061
     * @tc.name      testIntegration0061
     * @tc.desc      Integration chain 61 pairs I01 with I08
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testIntegration0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testIntegration0061', 'I01+I08');
      expect(entryContext().applicationInfo.name).assertEqual(BUNDLE_NAME);
      expect(entryContext().tempDir.endsWith('/temp')).assertTrue();
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual('label');
      {
      logCase('testIntegration0062', 'I12+I17');
      expect((await mod()).abilitiesInfo[0].name).assertEqual(ENTRY_ABILITY);
      expect(res().getColorByNameSync('page_background')).assertEqual(0xFFFFFFFF);
      expect((res().getColorByNameSync('text_color') >>> 24) & 0xFF).assertEqual(0xFF);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0063
     * @tc.name      testIntegration0063
     * @tc.desc      Integration chain 63 pairs I23 with I26
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIntegration0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      logCase('testIntegration0063', 'I23+I26');
      expect(nativeAdd(21, 34)).assertEqual(55);
      expect((await info()).appInfo.name).assertEqual(BUNDLE_NAME);
      expect((await info()).vendor).assertEqual('example');
      {
      logCase('testIntegration0064', 'I05+I02');
      expect(typeof entryContext().resourceDir === 'string').assertTrue();
      expect(entryContext().bundleCodeDir.length > 0).assertTrue();
      expect((await mod()).abilitiesInfo.length >= 1).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0065
     * @tc.name      testIntegration0065
     * @tc.desc      Integration chain 65 pairs I16 with I11
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIntegration0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testIntegration0065', 'I16+I11');
      expect(res().getStringByNameSync('page_show')).assertEqual('page from package');
      expect((await mod()).name).assertEqual(ENTRY_MODULE);
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual('label');
      {
      logCase('testIntegration0066', 'I08+I23');
      expect(entryContext().tempDir.endsWith('/temp')).assertTrue();
      expect(nativeAdd(21, 34)).assertEqual(55);
      expect((res().getColorByNameSync('text_color') >>> 24) & 0xFF).assertEqual(0xFF);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0067
     * @tc.name      testIntegration0067
     * @tc.desc      Integration chain 67 pairs I20 with I06
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testIntegration0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testIntegration0067', 'I20+I06');
      expect(res().getStringByNameSync('module_desc')).assertEqual('module description');
      expect(entryContext().databaseDir.endsWith('/database')).assertTrue();
      expect((await info()).vendor).assertEqual('example');
      {
      logCase('testIntegration0068', 'I01+I09');
      expect(entryContext().applicationInfo.name).assertEqual(BUNDLE_NAME);
      expect(entryContext().filesDir.length > 0).assertTrue();
      expect((await mod()).abilitiesInfo.length >= 1).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0069
     * @tc.name      testIntegration0069
     * @tc.desc      Integration chain 69 pairs I12 with I18
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIntegration0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      logCase('testIntegration0069', 'I12+I18');
      expect((await mod()).abilitiesInfo[0].name).assertEqual(ENTRY_ABILITY);
      expect(res().getNumberByName('page_text_font_size')).assertEqual(50);
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual('label');
      {
      logCase('testIntegration0070', 'I24+I01');
      expect((await info()).versionName).assertEqual('1.0.0');
      expect(entryContext().applicationInfo.name).assertEqual(BUNDLE_NAME);
      expect((res().getColorByNameSync('text_color') >>> 24) & 0xFF).assertEqual(0xFF);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0071
     * @tc.name      testIntegration0071
     * @tc.desc      Integration chain 71 pairs I05 with I03
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIntegration0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testIntegration0071', 'I05+I03');
      expect(typeof entryContext().resourceDir === 'string').assertTrue();
      expect(entryContext().filesDir.endsWith('/files')).assertTrue();
      expect((await info()).vendor).assertEqual('example');
      {
      logCase('testIntegration0072', 'I16+I12');
      expect(res().getStringByNameSync('page_show')).assertEqual('page from package');
      expect((await mod()).abilitiesInfo[0].name).assertEqual(ENTRY_ABILITY);
      expect((await mod()).abilitiesInfo.length >= 1).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0073
     * @tc.name      testIntegration0073
     * @tc.desc      Integration chain 73 pairs I08 with I24
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testIntegration0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testIntegration0073', 'I08+I24');
      expect(entryContext().tempDir.endsWith('/temp')).assertTrue();
      expect((await info()).versionName).assertEqual('1.0.0');
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual('label');
      {
      logCase('testIntegration0074', 'I20+I07');
      expect(res().getStringByNameSync('module_desc')).assertEqual('module description');
      expect(entryContext().preferencesDir.endsWith('/preferences')).assertTrue();
      expect((res().getColorByNameSync('text_color') >>> 24) & 0xFF).assertEqual(0xFF);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0075
     * @tc.name      testIntegration0075
     * @tc.desc      Integration chain 75 pairs I01 with I10
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIntegration0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      logCase('testIntegration0075', 'I01+I10');
      expect(entryContext().applicationInfo.name).assertEqual(BUNDLE_NAME);
      expect(entryContext().cacheDir.length > 0).assertTrue();
      expect((await info()).vendor).assertEqual('example');
      {
      logCase('testIntegration0076', 'I12+I19');
      expect((await mod()).abilitiesInfo[0].name).assertEqual(ENTRY_ABILITY);
      expect(res().getColorByNameSync('start_window_background')).assertEqual(0xFFFFFFFF);
      expect((await mod()).abilitiesInfo.length >= 1).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0077
     * @tc.name      testIntegration0077
     * @tc.desc      Integration chain 77 pairs I24 with I02
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIntegration0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testIntegration0077', 'I24+I02');
      expect((await info()).versionName).assertEqual('1.0.0');
      expect(entryContext().bundleCodeDir.length > 0).assertTrue();
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual('label');
      {
      logCase('testIntegration0078', 'I05+I04');
      expect(typeof entryContext().resourceDir === 'string').assertTrue();
      expect(entryContext().cacheDir.endsWith('/cache')).assertTrue();
      expect((res().getColorByNameSync('text_color') >>> 24) & 0xFF).assertEqual(0xFF);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0079
     * @tc.name      testIntegration0079
     * @tc.desc      Integration chain 79 pairs I16 with I13
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testIntegration0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testIntegration0079', 'I16+I13');
      expect(res().getStringByNameSync('page_show')).assertEqual('page from package');
      expect((await mod()).extensionAbilitiesInfo[0].metadata[0].name).assertEqual(BACKUP_METADATA);
      expect((await info()).vendor).assertEqual('example');
      {
      logCase('testIntegration0080', 'I08+I25');
      expect(entryContext().tempDir.endsWith('/temp')).assertTrue();
      expect((await info()).hapModulesInfo.length >= 1).assertTrue();
      expect((await mod()).abilitiesInfo.length >= 1).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0081
     * @tc.name      testIntegration0081
     * @tc.desc      Integration chain 81 pairs I20 with I08
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIntegration0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      logCase('testIntegration0081', 'I20+I08');
      expect(res().getStringByNameSync('module_desc')).assertEqual('module description');
      expect(entryContext().tempDir.endsWith('/temp')).assertTrue();
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual('label');
      {
      logCase('testIntegration0082', 'I01+I11');
      expect(entryContext().applicationInfo.name).assertEqual(BUNDLE_NAME);
      expect((await mod()).name).assertEqual(ENTRY_MODULE);
      expect((res().getColorByNameSync('text_color') >>> 24) & 0xFF).assertEqual(0xFF);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0083
     * @tc.name      testIntegration0083
     * @tc.desc      Integration chain 83 pairs I12 with I20
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIntegration0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testIntegration0083', 'I12+I20');
      expect((await mod()).abilitiesInfo[0].name).assertEqual(ENTRY_ABILITY);
      expect(res().getStringByNameSync('module_desc')).assertEqual('module description');
      expect((await info()).vendor).assertEqual('example');
      {
      logCase('testIntegration0084', 'I24+I03');
      expect((await info()).versionName).assertEqual('1.0.0');
      expect(entryContext().filesDir.endsWith('/files')).assertTrue();
      expect((await mod()).abilitiesInfo.length >= 1).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0085
     * @tc.name      testIntegration0085
     * @tc.desc      Integration chain 85 pairs I05 with I06
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testIntegration0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testIntegration0085', 'I05+I06');
      expect(typeof entryContext().resourceDir === 'string').assertTrue();
      expect(entryContext().databaseDir.endsWith('/database')).assertTrue();
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual('label');
      {
      logCase('testIntegration0086', 'I16+I14');
      expect(res().getStringByNameSync('page_show')).assertEqual('page from package');
      expect((await mod()).abilitiesInfo[0].exported).assertTrue();
      expect((res().getColorByNameSync('text_color') >>> 24) & 0xFF).assertEqual(0xFF);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0087
     * @tc.name      testIntegration0087
     * @tc.desc      Integration chain 87 pairs I08 with I26
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIntegration0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      logCase('testIntegration0087', 'I08+I26');
      expect(entryContext().tempDir.endsWith('/temp')).assertTrue();
      expect((await info()).appInfo.name).assertEqual(BUNDLE_NAME);
      expect((await info()).vendor).assertEqual('example');
      {
      logCase('testIntegration0088', 'I20+I09');
      expect(res().getStringByNameSync('module_desc')).assertEqual('module description');
      expect(entryContext().filesDir.length > 0).assertTrue();
      expect((await mod()).abilitiesInfo.length >= 1).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0089
     * @tc.name      testIntegration0089
     * @tc.desc      Integration chain 89 pairs I01 with I12
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIntegration0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testIntegration0089', 'I01+I12');
      expect(entryContext().applicationInfo.name).assertEqual(BUNDLE_NAME);
      expect((await mod()).abilitiesInfo[0].name).assertEqual(ENTRY_ABILITY);
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual('label');
      {
      logCase('testIntegration0090', 'I12+I21');
      expect((await mod()).abilitiesInfo[0].name).assertEqual(ENTRY_ABILITY);
      expect(func()).assertEqual(LIB_FUNC_RESULT);
      expect((res().getColorByNameSync('text_color') >>> 24) & 0xFF).assertEqual(0xFF);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0091
     * @tc.name      testIntegration0091
     * @tc.desc      Integration chain 91 pairs I24 with I04
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testIntegration0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testIntegration0091', 'I24+I04');
      expect((await info()).versionName).assertEqual('1.0.0');
      expect(entryContext().cacheDir.endsWith('/cache')).assertTrue();
      expect((await info()).vendor).assertEqual('example');
      {
      logCase('testIntegration0092', 'I05+I07');
      expect(typeof entryContext().resourceDir === 'string').assertTrue();
      expect(entryContext().preferencesDir.endsWith('/preferences')).assertTrue();
      expect((await mod()).abilitiesInfo.length >= 1).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0093
     * @tc.name      testIntegration0093
     * @tc.desc      Integration chain 93 pairs I16 with I15
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIntegration0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      logCase('testIntegration0093', 'I16+I15');
      expect(res().getStringByNameSync('page_show')).assertEqual('page from package');
      expect(res().getStringByNameSync('app_name')).assertEqual(APP_NAME);
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual('label');
      {
      logCase('testIntegration0094', 'I09+I01');
      expect(entryContext().filesDir.length > 0).assertTrue();
      expect(entryContext().applicationInfo.name).assertEqual(BUNDLE_NAME);
      expect((res().getColorByNameSync('text_color') >>> 24) & 0xFF).assertEqual(0xFF);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0095
     * @tc.name      testIntegration0095
     * @tc.desc      Integration chain 95 pairs I20 with I10
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIntegration0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testIntegration0095', 'I20+I10');
      expect(res().getStringByNameSync('module_desc')).assertEqual('module description');
      expect(entryContext().cacheDir.length > 0).assertTrue();
      expect((await info()).vendor).assertEqual('example');
      {
      logCase('testIntegration0096', 'I01+I13');
      expect(entryContext().applicationInfo.name).assertEqual(BUNDLE_NAME);
      expect((await mod()).extensionAbilitiesInfo[0].metadata[0].name).assertEqual(BACKUP_METADATA);
      expect((await mod()).abilitiesInfo.length >= 1).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0097
     * @tc.name      testIntegration0097
     * @tc.desc      Integration chain 97 pairs I12 with I22
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testIntegration0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testIntegration0097', 'I12+I22');
      expect((await mod()).abilitiesInfo[0].name).assertEqual(ENTRY_ABILITY);
      expect(func2()).assertEqual(LIB_FUNC2_RESULT);
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual('label');
      {
      logCase('testIntegration0098', 'I24+I05');
      expect((await info()).versionName).assertEqual('1.0.0');
      expect(typeof entryContext().resourceDir === 'string').assertTrue();
      expect((res().getColorByNameSync('text_color') >>> 24) & 0xFF).assertEqual(0xFF);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0099
     * @tc.name      testIntegration0099
     * @tc.desc      Integration chain 99 pairs I05 with I08
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIntegration0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      logCase('testIntegration0099', 'I05+I08');
      expect(typeof entryContext().resourceDir === 'string').assertTrue();
      expect(entryContext().tempDir.endsWith('/temp')).assertTrue();
      expect((await info()).vendor).assertEqual('example');
      {
      logCase('testIntegration0100', 'I16+I17');
      expect(res().getStringByNameSync('page_show')).assertEqual('page from package');
      expect(res().getColorByNameSync('page_background')).assertEqual(0xFFFFFFFF);
      expect((await mod()).abilitiesInfo.length >= 1).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0101
     * @tc.name      testIntegration0101
     * @tc.desc      Integration chain 101 pairs I09 with I02
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIntegration0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testIntegration0101', 'I09+I02');
      expect(entryContext().filesDir.length > 0).assertTrue();
      expect(entryContext().bundleCodeDir.length > 0).assertTrue();
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual('label');
      {
      logCase('testIntegration0102', 'I20+I11');
      expect(res().getStringByNameSync('module_desc')).assertEqual('module description');
      expect((await mod()).name).assertEqual(ENTRY_MODULE);
      expect((res().getColorByNameSync('text_color') >>> 24) & 0xFF).assertEqual(0xFF);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0103
     * @tc.name      testIntegration0103
     * @tc.desc      Integration chain 103 pairs I01 with I14
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testIntegration0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testIntegration0103', 'I01+I14');
      expect(entryContext().applicationInfo.name).assertEqual(BUNDLE_NAME);
      expect((await mod()).abilitiesInfo[0].exported).assertTrue();
      expect((await info()).vendor).assertEqual('example');
      {
      logCase('testIntegration0104', 'I12+I23');
      expect((await mod()).abilitiesInfo[0].name).assertEqual(ENTRY_ABILITY);
      expect(nativeAdd(21, 34)).assertEqual(55);
      expect((await mod()).abilitiesInfo.length >= 1).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0105
     * @tc.name      testIntegration0105
     * @tc.desc      Integration chain 105 pairs I24 with I06
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIntegration0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      logCase('testIntegration0105', 'I24+I06');
      expect((await info()).versionName).assertEqual('1.0.0');
      expect(entryContext().databaseDir.endsWith('/database')).assertTrue();
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual('label');
      {
      logCase('testIntegration0106', 'I05+I09');
      expect(typeof entryContext().resourceDir === 'string').assertTrue();
      expect(entryContext().filesDir.length > 0).assertTrue();
      expect((res().getColorByNameSync('text_color') >>> 24) & 0xFF).assertEqual(0xFF);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0107
     * @tc.name      testIntegration0107
     * @tc.desc      Integration chain 107 pairs I16 with I18
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIntegration0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testIntegration0107', 'I16+I18');
      expect(res().getStringByNameSync('page_show')).assertEqual('page from package');
      expect(res().getNumberByName('page_text_font_size')).assertEqual(50);
      expect((await info()).vendor).assertEqual('example');
      {
      logCase('testIntegration0108', 'I09+I03');
      expect(entryContext().filesDir.length > 0).assertTrue();
      expect(entryContext().filesDir.endsWith('/files')).assertTrue();
      expect((await mod()).abilitiesInfo.length >= 1).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0109
     * @tc.name      testIntegration0109
     * @tc.desc      Integration chain 109 pairs I20 with I12
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testIntegration0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testIntegration0109', 'I20+I12');
      expect(res().getStringByNameSync('module_desc')).assertEqual('module description');
      expect((await mod()).abilitiesInfo[0].name).assertEqual(ENTRY_ABILITY);
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual('label');
      {
      logCase('testIntegration0110', 'I01+I15');
      expect(entryContext().applicationInfo.name).assertEqual(BUNDLE_NAME);
      expect(res().getStringByNameSync('app_name')).assertEqual(APP_NAME);
      expect((res().getColorByNameSync('text_color') >>> 24) & 0xFF).assertEqual(0xFF);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0111
     * @tc.name      testIntegration0111
     * @tc.desc      Integration chain 111 pairs I12 with I24
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIntegration0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      logCase('testIntegration0111', 'I12+I24');
      expect((await mod()).abilitiesInfo[0].name).assertEqual(ENTRY_ABILITY);
      expect((await info()).versionName).assertEqual('1.0.0');
      expect((await info()).vendor).assertEqual('example');
      {
      logCase('testIntegration0112', 'I24+I07');
      expect((await info()).versionName).assertEqual('1.0.0');
      expect(entryContext().preferencesDir.endsWith('/preferences')).assertTrue();
      expect((await mod()).abilitiesInfo.length >= 1).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0113
     * @tc.name      testIntegration0113
     * @tc.desc      Integration chain 113 pairs I05 with I10
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIntegration0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testIntegration0113', 'I05+I10');
      expect(typeof entryContext().resourceDir === 'string').assertTrue();
      expect(entryContext().cacheDir.length > 0).assertTrue();
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual('label');
      {
      logCase('testIntegration0114', 'I16+I19');
      expect(res().getStringByNameSync('page_show')).assertEqual('page from package');
      expect(res().getColorByNameSync('start_window_background')).assertEqual(0xFFFFFFFF);
      expect((res().getColorByNameSync('text_color') >>> 24) & 0xFF).assertEqual(0xFF);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0115
     * @tc.name      testIntegration0115
     * @tc.desc      Integration chain 115 pairs I09 with I04
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testIntegration0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testIntegration0115', 'I09+I04');
      expect(entryContext().filesDir.length > 0).assertTrue();
      expect(entryContext().cacheDir.endsWith('/cache')).assertTrue();
      expect((await info()).vendor).assertEqual('example');
      {
      logCase('testIntegration0116', 'I20+I13');
      expect(res().getStringByNameSync('module_desc')).assertEqual('module description');
      expect((await mod()).extensionAbilitiesInfo[0].metadata[0].name).assertEqual(BACKUP_METADATA);
      expect((await mod()).abilitiesInfo.length >= 1).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0117
     * @tc.name      testIntegration0117
     * @tc.desc      Integration chain 117 pairs I01 with I16
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIntegration0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      logCase('testIntegration0117', 'I01+I16');
      expect(entryContext().applicationInfo.name).assertEqual(BUNDLE_NAME);
      expect(res().getStringByNameSync('page_show')).assertEqual('page from package');
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual('label');
      {
      logCase('testIntegration0118', 'I12+I25');
      expect((await mod()).abilitiesInfo[0].name).assertEqual(ENTRY_ABILITY);
      expect((await info()).hapModulesInfo.length >= 1).assertTrue();
      expect((res().getColorByNameSync('text_color') >>> 24) & 0xFF).assertEqual(0xFF);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0119
     * @tc.name      testIntegration0119
     * @tc.desc      Integration chain 119 pairs I24 with I08
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIntegration0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testIntegration0119', 'I24+I08');
      expect((await info()).versionName).assertEqual('1.0.0');
      expect(entryContext().tempDir.endsWith('/temp')).assertTrue();
      expect((await info()).vendor).assertEqual('example');
      {
      logCase('testIntegration0120', 'I05+I11');
      expect(typeof entryContext().resourceDir === 'string').assertTrue();
      expect((await mod()).name).assertEqual(ENTRY_MODULE);
      expect((await mod()).abilitiesInfo.length >= 1).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0121
     * @tc.name      testIntegration0121
     * @tc.desc      Integration chain 121 pairs I16 with I20
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testIntegration0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testIntegration0121', 'I16+I20');
      expect(res().getStringByNameSync('page_show')).assertEqual('page from package');
      expect(res().getStringByNameSync('module_desc')).assertEqual('module description');
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual('label');
      {
      logCase('testIntegration0122', 'I09+I05');
      expect(entryContext().filesDir.length > 0).assertTrue();
      expect(typeof entryContext().resourceDir === 'string').assertTrue();
      expect((res().getColorByNameSync('text_color') >>> 24) & 0xFF).assertEqual(0xFF);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0123
     * @tc.name      testIntegration0123
     * @tc.desc      Integration chain 123 pairs I20 with I14
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIntegration0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      logCase('testIntegration0123', 'I20+I14');
      expect(res().getStringByNameSync('module_desc')).assertEqual('module description');
      expect((await mod()).abilitiesInfo[0].exported).assertTrue();
      expect((await info()).vendor).assertEqual('example');
      {
      logCase('testIntegration0124', 'I01+I17');
      expect(entryContext().applicationInfo.name).assertEqual(BUNDLE_NAME);
      expect(res().getColorByNameSync('page_background')).assertEqual(0xFFFFFFFF);
      expect((await mod()).abilitiesInfo.length >= 1).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0125
     * @tc.name      testIntegration0125
     * @tc.desc      Integration chain 125 pairs I12 with I26
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIntegration0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testIntegration0125', 'I12+I26');
      expect((await mod()).abilitiesInfo[0].name).assertEqual(ENTRY_ABILITY);
      expect((await info()).appInfo.name).assertEqual(BUNDLE_NAME);
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual('label');
      {
      logCase('testIntegration0126', 'I24+I09');
      expect((await info()).versionName).assertEqual('1.0.0');
      expect(entryContext().filesDir.length > 0).assertTrue();
      expect((res().getColorByNameSync('text_color') >>> 24) & 0xFF).assertEqual(0xFF);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0127
     * @tc.name      testIntegration0127
     * @tc.desc      Integration chain 127 pairs I05 with I12
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testIntegration0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testIntegration0127', 'I05+I12');
      expect(typeof entryContext().resourceDir === 'string').assertTrue();
      expect((await mod()).abilitiesInfo[0].name).assertEqual(ENTRY_ABILITY);
      expect((await info()).vendor).assertEqual('example');
      {
      logCase('testIntegration0128', 'I16+I21');
      expect(res().getStringByNameSync('page_show')).assertEqual('page from package');
      expect(func()).assertEqual(LIB_FUNC_RESULT);
      expect((await mod()).abilitiesInfo.length >= 1).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0129
     * @tc.name      testIntegration0129
     * @tc.desc      Integration chain 129 pairs I09 with I06
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIntegration0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      logCase('testIntegration0129', 'I09+I06');
      expect(entryContext().filesDir.length > 0).assertTrue();
      expect(entryContext().databaseDir.endsWith('/database')).assertTrue();
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual('label');
      {
      logCase('testIntegration0130', 'I20+I15');
      expect(res().getStringByNameSync('module_desc')).assertEqual('module description');
      expect(res().getStringByNameSync('app_name')).assertEqual(APP_NAME);
      expect((res().getColorByNameSync('text_color') >>> 24) & 0xFF).assertEqual(0xFF);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0131
     * @tc.name      testIntegration0131
     * @tc.desc      Integration chain 131 pairs I01 with I18
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIntegration0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testIntegration0131', 'I01+I18');
      expect(entryContext().applicationInfo.name).assertEqual(BUNDLE_NAME);
      expect(res().getNumberByName('page_text_font_size')).assertEqual(50);
      expect((await info()).vendor).assertEqual('example');
      {
      logCase('testIntegration0132', 'I13+I01');
      expect((await mod()).extensionAbilitiesInfo[0].metadata[0].name).assertEqual(BACKUP_METADATA);
      expect(entryContext().applicationInfo.name).assertEqual(BUNDLE_NAME);
      expect((await mod()).abilitiesInfo.length >= 1).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0133
     * @tc.name      testIntegration0133
     * @tc.desc      Integration chain 133 pairs I24 with I10
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testIntegration0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testIntegration0133', 'I24+I10');
      expect((await info()).versionName).assertEqual('1.0.0');
      expect(entryContext().cacheDir.length > 0).assertTrue();
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual('label');
      {
      logCase('testIntegration0134', 'I05+I13');
      expect(typeof entryContext().resourceDir === 'string').assertTrue();
      expect((await mod()).extensionAbilitiesInfo[0].metadata[0].name).assertEqual(BACKUP_METADATA);
      expect((res().getColorByNameSync('text_color') >>> 24) & 0xFF).assertEqual(0xFF);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0135
     * @tc.name      testIntegration0135
     * @tc.desc      Integration chain 135 pairs I16 with I22
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIntegration0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      logCase('testIntegration0135', 'I16+I22');
      expect(res().getStringByNameSync('page_show')).assertEqual('page from package');
      expect(func2()).assertEqual(LIB_FUNC2_RESULT);
      expect((await info()).vendor).assertEqual('example');
      {
      logCase('testIntegration0136', 'I09+I07');
      expect(entryContext().filesDir.length > 0).assertTrue();
      expect(entryContext().preferencesDir.endsWith('/preferences')).assertTrue();
      expect((await mod()).abilitiesInfo.length >= 1).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0137
     * @tc.name      testIntegration0137
     * @tc.desc      Integration chain 137 pairs I20 with I16
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIntegration0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testIntegration0137', 'I20+I16');
      expect(res().getStringByNameSync('module_desc')).assertEqual('module description');
      expect(res().getStringByNameSync('page_show')).assertEqual('page from package');
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual('label');
      {
      logCase('testIntegration0138', 'I01+I19');
      expect(entryContext().applicationInfo.name).assertEqual(BUNDLE_NAME);
      expect(res().getColorByNameSync('start_window_background')).assertEqual(0xFFFFFFFF);
      expect((res().getColorByNameSync('text_color') >>> 24) & 0xFF).assertEqual(0xFF);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0139
     * @tc.name      testIntegration0139
     * @tc.desc      Integration chain 139 pairs I13 with I02
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testIntegration0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testIntegration0139', 'I13+I02');
      expect((await mod()).extensionAbilitiesInfo[0].metadata[0].name).assertEqual(BACKUP_METADATA);
      expect(entryContext().bundleCodeDir.length > 0).assertTrue();
      expect((await info()).vendor).assertEqual('example');
      {
      logCase('testIntegration0140', 'I24+I11');
      expect((await info()).versionName).assertEqual('1.0.0');
      expect((await mod()).name).assertEqual(ENTRY_MODULE);
      expect((await mod()).abilitiesInfo.length >= 1).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0141
     * @tc.name      testIntegration0141
     * @tc.desc      Integration chain 141 pairs I05 with I14
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIntegration0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      logCase('testIntegration0141', 'I05+I14');
      expect(typeof entryContext().resourceDir === 'string').assertTrue();
      expect((await mod()).abilitiesInfo[0].exported).assertTrue();
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual('label');
      {
      logCase('testIntegration0142', 'I16+I23');
      expect(res().getStringByNameSync('page_show')).assertEqual('page from package');
      expect(nativeAdd(21, 34)).assertEqual(55);
      expect((res().getColorByNameSync('text_color') >>> 24) & 0xFF).assertEqual(0xFF);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0143
     * @tc.name      testIntegration0143
     * @tc.desc      Integration chain 143 pairs I09 with I08
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIntegration0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testIntegration0143', 'I09+I08');
      expect(entryContext().filesDir.length > 0).assertTrue();
      expect(entryContext().tempDir.endsWith('/temp')).assertTrue();
      expect((await info()).vendor).assertEqual('example');
      {
      logCase('testIntegration0144', 'I20+I17');
      expect(res().getStringByNameSync('module_desc')).assertEqual('module description');
      expect(res().getColorByNameSync('page_background')).assertEqual(0xFFFFFFFF);
      expect((await mod()).abilitiesInfo.length >= 1).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0145
     * @tc.name      testIntegration0145
     * @tc.desc      Integration chain 145 pairs I01 with I20
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testIntegration0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testIntegration0145', 'I01+I20');
      expect(entryContext().applicationInfo.name).assertEqual(BUNDLE_NAME);
      expect(res().getStringByNameSync('module_desc')).assertEqual('module description');
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual('label');
      {
      logCase('testIntegration0146', 'I13+I03');
      expect((await mod()).extensionAbilitiesInfo[0].metadata[0].name).assertEqual(BACKUP_METADATA);
      expect(entryContext().filesDir.endsWith('/files')).assertTrue();
      expect((res().getColorByNameSync('text_color') >>> 24) & 0xFF).assertEqual(0xFF);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0147
     * @tc.name      testIntegration0147
     * @tc.desc      Integration chain 147 pairs I24 with I12
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIntegration0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      logCase('testIntegration0147', 'I24+I12');
      expect((await info()).versionName).assertEqual('1.0.0');
      expect((await mod()).abilitiesInfo[0].name).assertEqual(ENTRY_ABILITY);
      expect((await info()).vendor).assertEqual('example');
      {
      logCase('testIntegration0148', 'I05+I15');
      expect(typeof entryContext().resourceDir === 'string').assertTrue();
      expect(res().getStringByNameSync('app_name')).assertEqual(APP_NAME);
      expect((await mod()).abilitiesInfo.length >= 1).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0149
     * @tc.name      testIntegration0149
     * @tc.desc      Integration chain 149 pairs I16 with I24
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIntegration0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testIntegration0149', 'I16+I24');
      expect(res().getStringByNameSync('page_show')).assertEqual('page from package');
      expect((await info()).versionName).assertEqual('1.0.0');
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual('label');
      {
      logCase('testIntegration0150', 'I09+I10');
      expect(entryContext().filesDir.length > 0).assertTrue();
      expect(entryContext().cacheDir.length > 0).assertTrue();
      expect((res().getColorByNameSync('text_color') >>> 24) & 0xFF).assertEqual(0xFF);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0151
     * @tc.name      testIntegration0151
     * @tc.desc      Integration chain 151 pairs I20 with I18
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testIntegration0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testIntegration0151', 'I20+I18');
      expect(res().getStringByNameSync('module_desc')).assertEqual('module description');
      expect(res().getNumberByName('page_text_font_size')).assertEqual(50);
      expect((await info()).vendor).assertEqual('example');
      {
      logCase('testIntegration0152', 'I01+I21');
      expect(entryContext().applicationInfo.name).assertEqual(BUNDLE_NAME);
      expect(func()).assertEqual(LIB_FUNC_RESULT);
      expect((await mod()).abilitiesInfo.length >= 1).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0153
     * @tc.name      testIntegration0153
     * @tc.desc      Integration chain 153 pairs I13 with I04
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIntegration0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      logCase('testIntegration0153', 'I13+I04');
      expect((await mod()).extensionAbilitiesInfo[0].metadata[0].name).assertEqual(BACKUP_METADATA);
      expect(entryContext().cacheDir.endsWith('/cache')).assertTrue();
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual('label');
      {
      logCase('testIntegration0154', 'I24+I13');
      expect((await info()).versionName).assertEqual('1.0.0');
      expect((await mod()).extensionAbilitiesInfo[0].metadata[0].name).assertEqual(BACKUP_METADATA);
      expect((res().getColorByNameSync('text_color') >>> 24) & 0xFF).assertEqual(0xFF);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0155
     * @tc.name      testIntegration0155
     * @tc.desc      Integration chain 155 pairs I05 with I16
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIntegration0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testIntegration0155', 'I05+I16');
      expect(typeof entryContext().resourceDir === 'string').assertTrue();
      expect(res().getStringByNameSync('page_show')).assertEqual('page from package');
      expect((await info()).vendor).assertEqual('example');
      {
      logCase('testIntegration0156', 'I16+I25');
      expect(res().getStringByNameSync('page_show')).assertEqual('page from package');
      expect((await info()).hapModulesInfo.length >= 1).assertTrue();
      expect((await mod()).abilitiesInfo.length >= 1).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0157
     * @tc.name      testIntegration0157
     * @tc.desc      Integration chain 157 pairs I09 with I11
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testIntegration0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testIntegration0157', 'I09+I11');
      expect(entryContext().filesDir.length > 0).assertTrue();
      expect((await mod()).name).assertEqual(ENTRY_MODULE);
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual('label');
      {
      logCase('testIntegration0158', 'I20+I19');
      expect(res().getStringByNameSync('module_desc')).assertEqual('module description');
      expect(res().getColorByNameSync('start_window_background')).assertEqual(0xFFFFFFFF);
      expect((res().getColorByNameSync('text_color') >>> 24) & 0xFF).assertEqual(0xFF);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0159
     * @tc.name      testIntegration0159
     * @tc.desc      Integration chain 159 pairs I01 with I22
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIntegration0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      logCase('testIntegration0159', 'I01+I22');
      expect(entryContext().applicationInfo.name).assertEqual(BUNDLE_NAME);
      expect(func2()).assertEqual(LIB_FUNC2_RESULT);
      expect((await info()).vendor).assertEqual('example');
      {
      logCase('testIntegration0160', 'I13+I05');
      expect((await mod()).extensionAbilitiesInfo[0].metadata[0].name).assertEqual(BACKUP_METADATA);
      expect(typeof entryContext().resourceDir === 'string').assertTrue();
      expect((await mod()).abilitiesInfo.length >= 1).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0161
     * @tc.name      testIntegration0161
     * @tc.desc      Integration chain 161 pairs I24 with I14
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIntegration0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testIntegration0161', 'I24+I14');
      expect((await info()).versionName).assertEqual('1.0.0');
      expect((await mod()).abilitiesInfo[0].exported).assertTrue();
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual('label');
      {
      logCase('testIntegration0162', 'I05+I17');
      expect(typeof entryContext().resourceDir === 'string').assertTrue();
      expect(res().getColorByNameSync('page_background')).assertEqual(0xFFFFFFFF);
      expect((res().getColorByNameSync('text_color') >>> 24) & 0xFF).assertEqual(0xFF);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0163
     * @tc.name      testIntegration0163
     * @tc.desc      Integration chain 163 pairs I16 with I26
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testIntegration0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testIntegration0163', 'I16+I26');
      expect(res().getStringByNameSync('page_show')).assertEqual('page from package');
      expect((await info()).appInfo.name).assertEqual(BUNDLE_NAME);
      expect((await info()).vendor).assertEqual('example');
      {
      logCase('testIntegration0164', 'I09+I12');
      expect(entryContext().filesDir.length > 0).assertTrue();
      expect((await mod()).abilitiesInfo[0].name).assertEqual(ENTRY_ABILITY);
      expect((await mod()).abilitiesInfo.length >= 1).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0165
     * @tc.name      testIntegration0165
     * @tc.desc      Integration chain 165 pairs I20 with I21
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIntegration0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      logCase('testIntegration0165', 'I20+I21');
      expect(res().getStringByNameSync('module_desc')).assertEqual('module description');
      expect(func()).assertEqual(LIB_FUNC_RESULT);
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual('label');
      {
      logCase('testIntegration0166', 'I01+I23');
      expect(entryContext().applicationInfo.name).assertEqual(BUNDLE_NAME);
      expect(nativeAdd(21, 34)).assertEqual(55);
      expect((res().getColorByNameSync('text_color') >>> 24) & 0xFF).assertEqual(0xFF);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0167
     * @tc.name      testIntegration0167
     * @tc.desc      Integration chain 167 pairs I13 with I06
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIntegration0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testIntegration0167', 'I13+I06');
      expect((await mod()).extensionAbilitiesInfo[0].metadata[0].name).assertEqual(BACKUP_METADATA);
      expect(entryContext().databaseDir.endsWith('/database')).assertTrue();
      expect((await info()).vendor).assertEqual('example');
      {
      logCase('testIntegration0168', 'I24+I15');
      expect((await info()).versionName).assertEqual('1.0.0');
      expect(res().getStringByNameSync('app_name')).assertEqual(APP_NAME);
      expect((await mod()).abilitiesInfo.length >= 1).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0169
     * @tc.name      testIntegration0169
     * @tc.desc      Integration chain 169 pairs I05 with I18
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testIntegration0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testIntegration0169', 'I05+I18');
      expect(typeof entryContext().resourceDir === 'string').assertTrue();
      expect(res().getNumberByName('page_text_font_size')).assertEqual(50);
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual('label');
      {
      logCase('testIntegration0170', 'I17+I01');
      expect(res().getColorByNameSync('page_background')).assertEqual(0xFFFFFFFF);
      expect(entryContext().applicationInfo.name).assertEqual(BUNDLE_NAME);
      expect((res().getColorByNameSync('text_color') >>> 24) & 0xFF).assertEqual(0xFF);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0171
     * @tc.name      testIntegration0171
     * @tc.desc      Integration chain 171 pairs I09 with I13
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIntegration0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      logCase('testIntegration0171', 'I09+I13');
      expect(entryContext().filesDir.length > 0).assertTrue();
      expect((await mod()).extensionAbilitiesInfo[0].metadata[0].name).assertEqual(BACKUP_METADATA);
      expect((await info()).vendor).assertEqual('example');
      {
      logCase('testIntegration0172', 'I20+I22');
      expect(res().getStringByNameSync('module_desc')).assertEqual('module description');
      expect(func2()).assertEqual(LIB_FUNC2_RESULT);
      expect((await mod()).abilitiesInfo.length >= 1).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0173
     * @tc.name      testIntegration0173
     * @tc.desc      Integration chain 173 pairs I01 with I24
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIntegration0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testIntegration0173', 'I01+I24');
      expect(entryContext().applicationInfo.name).assertEqual(BUNDLE_NAME);
      expect((await info()).versionName).assertEqual('1.0.0');
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual('label');
      {
      logCase('testIntegration0174', 'I13+I07');
      expect((await mod()).extensionAbilitiesInfo[0].metadata[0].name).assertEqual(BACKUP_METADATA);
      expect(entryContext().preferencesDir.endsWith('/preferences')).assertTrue();
      expect((res().getColorByNameSync('text_color') >>> 24) & 0xFF).assertEqual(0xFF);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0175
     * @tc.name      testIntegration0175
     * @tc.desc      Integration chain 175 pairs I24 with I16
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testIntegration0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testIntegration0175', 'I24+I16');
      expect((await info()).versionName).assertEqual('1.0.0');
      expect(res().getStringByNameSync('page_show')).assertEqual('page from package');
      expect((await info()).vendor).assertEqual('example');
      {
      logCase('testIntegration0176', 'I05+I19');
      expect(typeof entryContext().resourceDir === 'string').assertTrue();
      expect(res().getColorByNameSync('start_window_background')).assertEqual(0xFFFFFFFF);
      expect((await mod()).abilitiesInfo.length >= 1).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0177
     * @tc.name      testIntegration0177
     * @tc.desc      Integration chain 177 pairs I17 with I02
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIntegration0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      logCase('testIntegration0177', 'I17+I02');
      expect(res().getColorByNameSync('page_background')).assertEqual(0xFFFFFFFF);
      expect(entryContext().bundleCodeDir.length > 0).assertTrue();
      expect(res().getStringByNameSync('EntryAbility_label')).assertEqual('label');
      {
      logCase('testIntegration0178', 'I09+I14');
      expect(entryContext().filesDir.length > 0).assertTrue();
      expect((await mod()).abilitiesInfo[0].exported).assertTrue();
      expect((res().getColorByNameSync('text_color') >>> 24) & 0xFF).assertEqual(0xFF);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_INTEGRATION_0179
     * @tc.name      testIntegration0179
     * @tc.desc      Integration chain 179 pairs I20 with I23
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testIntegration0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testIntegration0179', 'I20+I23');
      expect(res().getStringByNameSync('module_desc')).assertEqual('module description');
      expect(nativeAdd(21, 34)).assertEqual(55);
      expect((await info()).vendor).assertEqual('example');
      {
      logCase('testIntegration0180', 'I01+I25');
      expect(entryContext().applicationInfo.name).assertEqual(BUNDLE_NAME);
      expect((await info()).hapModulesInfo.length >= 1).assertTrue();
      expect((await mod()).abilitiesInfo.length >= 1).assertTrue();
      }
    });

  });
}

