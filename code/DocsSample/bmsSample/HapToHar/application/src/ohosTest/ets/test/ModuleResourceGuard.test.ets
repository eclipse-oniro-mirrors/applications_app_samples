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

import { describe, beforeAll, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { bundleManager, common } from '@kit.AbilityKit';
import { resourceManager } from '@kit.LocalizationKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  ENTRY_MODULE,
  ERR_RES_NAME_INVALID,
  ERR_RES_ID_INVALID,
  selfBundle,
  findModule,
  entryContext,
  errorCode,
  argbFromHex,
  PngOracle
} from './shared/AppProbe';
import { paceTurn } from './shared/TestPace';

const DOMAIN: number = 0xFF00;
const TAG: string = '[Sample_HapToHar]';

class StringRow {
  name: string;
  value: string;

  constructor(name: string, value: string) {
    this.name = name;
    this.value = value;
  }
}

const STRING_TABLE: StringRow[] = [
  new StringRow('module_desc', 'module description'),
  new StringRow('ApplicationAbility_desc', 'description'),
  new StringRow('ApplicationAbility_label', 'label'),
  new StringRow('app_name', 'simple007_hap_to_har')
];
const HAR_ONLY_STRINGS: string[] = ['EntryAbility_desc', 'EntryAbility_label'];
const CASE_VARIANTS: string[] = ['Module_desc', 'MODULE_DESC', 'applicationability_label', 'App_Name'];
const MEDIA_NAMES: string[] = ['startIcon', 'background', 'foreground'];

let manager: resourceManager.ResourceManager;
let info: bundleManager.BundleInfo;

function entryAbility(): bundleManager.AbilityInfo {
  return (findModule(info, ENTRY_MODULE) as bundleManager.HapModuleInfo).abilitiesInfo[0];
}

export default function moduleResourceGuardTest() {
  describe('ModuleResourceGuard', () => {
    beforeAll(async () => {
      const context: common.Context = entryContext();
      manager = context.resourceManager;
      info = await selfBundle();
    });

    beforeEach(async () => {
      await paceTurn();
      hilog.info(DOMAIN, TAG, '%{public}s', 'ModuleResourceGuard case begin');
    });

    /**
     * @tc.number    SUB_BMS_HAPTOHAR_RESOURCE_0100
     * @tc.name      testModuleResourceStringTable0001
     * @tc.desc      Resolve every string declared by the application module and AppScope by name
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testModuleResourceStringTable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const seen: Set<string> = new Set<string>();
      for (const row of STRING_TABLE) {
        const value: string = manager.getStringByNameSync(row.name);
        expect(value).assertEqual(row.value);
        expect(value.length).assertEqual(row.value.length);
        seen.add(value);
      }
      expect(seen.size).assertEqual(STRING_TABLE.length);
    });

    /**
     * @tc.number    SUB_BMS_HAPTOHAR_RESOURCE_0200
     * @tc.name      testModuleResourceAppLabel0001
     * @tc.desc      Check the app label keeps the app_name reference and app_name resolves to the AppScope value
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testModuleResourceAppLabel0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(info.appInfo.label).assertEqual('$string:app_name');
      expect(info.appInfo.labelResource.id).assertEqual(info.appInfo.labelId);
      expect(info.appInfo.labelResource.moduleName).assertEqual(ENTRY_MODULE);
      expect(manager.getStringByNameSync('app_name')).assertEqual('simple007_hap_to_har');
      // the installed app labelId follows the entry main ability label, not app_name
      expect(manager.getStringSync(info.appInfo.labelId)).assertEqual('label');
    });

    /**
     * @tc.number    SUB_BMS_HAPTOHAR_RESOURCE_0300
     * @tc.name      testModuleResourceAbilityText0001
     * @tc.desc      Resolve the label and description ids of ApplicationAbility and the module description id
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testModuleResourceAbilityText0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const ability: bundleManager.AbilityInfo = entryAbility();
      const hap: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE) as bundleManager.HapModuleInfo;
      expect(manager.getStringSync(ability.labelId)).assertEqual('label');
      expect(manager.getStringSync(ability.descriptionId)).assertEqual('description');
      expect(manager.getStringSync(hap.descriptionId)).assertEqual('module description');
      expect(new Set<number>([ability.labelId, ability.descriptionId, hap.descriptionId]).size).assertEqual(3);
    });

    /**
     * @tc.number    SUB_BMS_HAPTOHAR_RESOURCE_0400
     * @tc.name      testModuleResourceStartColor0001
     * @tc.desc      Read start_window_background and compare it with an opaque white parsed from the hex value
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testModuleResourceStartColor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const color: number = manager.getColorByNameSync('start_window_background') >>> 0;
      expect(color).assertEqual(argbFromHex('#FFFFFF'));
      expect(color >>> 24).assertEqual(0xFF);
      expect(color & 0x00FFFFFF).assertEqual(0x00FFFFFF);
    });

    /**
     * @tc.number    SUB_BMS_HAPTOHAR_RESOURCE_0500
     * @tc.name      testModuleResourceIdAbsent0001
     * @tc.desc      Read strings by ids no resource owns and expect an invalid resource id error
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testModuleResourceIdAbsent0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(errorCode(() => {
        manager.getStringSync(0);
      })).assertEqual(ERR_RES_ID_INVALID);
      expect(errorCode(() => {
        manager.getStringSync(0x7FFFFFFF);
      })).assertEqual(ERR_RES_ID_INVALID);
      expect(errorCode(() => {
        manager.getStringSync(entryAbility().labelId);
      })).assertEqual(0);
    });

    /**
     * @tc.number    SUB_BMS_HAPTOHAR_RESOURCE_0600
     * @tc.name      testModuleResourceHarStringAbsent0001
     * @tc.desc      Look up the strings that only exist in the HAR source and expect an invalid resource name error
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testModuleResourceHarStringAbsent0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      for (const name of HAR_ONLY_STRINGS) {
        expect(errorCode(() => {
          manager.getStringByNameSync(name);
        })).assertEqual(ERR_RES_NAME_INVALID);
      }
      expect(errorCode(() => {
        manager.getStringByNameSync('ApplicationAbility_label');
      })).assertEqual(0);
      expect(HAR_ONLY_STRINGS.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_BMS_HAPTOHAR_RESOURCE_0700
     * @tc.name      testModuleResourceNameCase0001
     * @tc.desc      Look up declared string names with changed letter case and expect each lookup to fail
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testModuleResourceNameCase0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let failed: number = 0;
      for (const name of CASE_VARIANTS) {
        const code: number = errorCode(() => {
          manager.getStringByNameSync(name);
        });
        expect(code).assertEqual(ERR_RES_NAME_INVALID);
        failed++;
      }
      expect(failed).assertEqual(CASE_VARIANTS.length);
      expect(manager.getStringByNameSync('module_desc')).assertEqual('module description');
    });

    /**
     * @tc.number    SUB_BMS_HAPTOHAR_RESOURCE_0800
     * @tc.name      testModuleResourceTypeMismatch0001
     * @tc.desc      Read declared names through the wrong resource type and expect an invalid resource name error
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testModuleResourceTypeMismatch0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(errorCode(() => {
        manager.getColorByNameSync('page_text_font_size');
      })).assertEqual(ERR_RES_NAME_INVALID);
      expect(errorCode(() => {
        manager.getStringByNameSync('start_window_background');
      })).assertEqual(ERR_RES_NAME_INVALID);
      expect(errorCode(() => {
        manager.getColorByNameSync('start_window_background');
      })).assertEqual(0);
    });

    /**
     * @tc.number    SUB_BMS_HAPTOHAR_RESOURCE_0900
     * @tc.name      testModuleResourceMediaPng0001
     * @tc.desc      Load the PNG media of the application module and check the header with an independent PNG parser
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testModuleResourceMediaPng0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      for (const name of MEDIA_NAMES) {
        const bytes: Uint8Array = manager.getMediaByNameSync(name);
        expect(PngOracle.hasSignature(bytes)).assertTrue();
        expect(PngOracle.firstChunkType(bytes)).assertEqual('IHDR');
        expect(PngOracle.width(bytes) > 0 && PngOracle.height(bytes) > 0).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_BMS_HAPTOHAR_RESOURCE_1000
     * @tc.name      testModuleResourceLayerSize0001
     * @tc.desc      Check the background and foreground layers of the layered icon share one canvas size
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testModuleResourceLayerSize0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const back: Uint8Array = manager.getMediaByNameSync('background');
      const fore: Uint8Array = manager.getMediaByNameSync('foreground');
      expect(PngOracle.width(back)).assertEqual(PngOracle.width(fore));
      expect(PngOracle.height(back)).assertEqual(PngOracle.height(fore));
      expect(PngOracle.width(back)).assertEqual(PngOracle.height(back));
    });

    /**
     * @tc.number    SUB_BMS_HAPTOHAR_RESOURCE_1100
     * @tc.name      testModuleResourceMediaAbsent0001
     * @tc.desc      Load media names that are not declared by the application module and expect an error
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testModuleResourceMediaAbsent0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(errorCode(() => {
        manager.getMediaByNameSync('starticon');
      })).assertEqual(ERR_RES_NAME_INVALID);
      expect(errorCode(() => {
        manager.getMediaByNameSync('app_icon');
      })).assertEqual(ERR_RES_NAME_INVALID);
      expect(errorCode(() => {
        manager.getMediaByNameSync('startIcon');
      })).assertEqual(0);
    });
  });
}
