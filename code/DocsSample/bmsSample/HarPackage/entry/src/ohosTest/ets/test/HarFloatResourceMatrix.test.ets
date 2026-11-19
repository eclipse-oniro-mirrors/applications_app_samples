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

export default function harFloatResourceMatrixTest() {
  describe('HarFloatResourceMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0001
     * @tc.name      testHarFloatResource0001
     * @tc.desc      page_text_font_size resolves to 50
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarFloatResource0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarFloatResource0001', 'float resource case 1');
      expect(resources().getNumberByName('page_text_font_size')).assertEqual(50);
      {
      logCase('testHarFloatResource0002', 'float resource case 2');
      expect(resources().getNumberByName('page_text_font_size') > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0003
     * @tc.name      testHarFloatResource0003
     * @tc.desc      page_text_font_size is an integer value
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarFloatResource0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarFloatResource0003', 'float resource case 3');
      expect(resources().getNumberByName('page_text_font_size') % 1).assertEqual(0);
      {
      logCase('testHarFloatResource0004', 'float resource case 4');
      expect(resources().getNumberByName('page_text_font_size') < 100).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0005
     * @tc.name      testHarFloatResource0005
     * @tc.desc      page_text_font_size rounds to itself
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarFloatResource0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarFloatResource0005', 'float resource case 5');
      const fontSize: number = resources().getNumberByName('page_text_font_size');
      expect(Math.round(fontSize)).assertEqual(fontSize);
      {
      logCase('testHarFloatResource0006', 'float resource case 6');
      expect(resources().getNumberByName('page_text_font_size')).assertEqual(50);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0007
     * @tc.name      testHarFloatResource0007
     * @tc.desc      page_text_font_size doubled equals 100
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarFloatResource0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarFloatResource0007', 'float resource case 7');
      expect(resources().getNumberByName('page_text_font_size') * 2).assertEqual(100);
      {
      logCase('testHarFloatResource0008', 'float resource case 8');
      expect(resources().getNumberByName('page_text_font_size') / 2).assertEqual(25);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0009
     * @tc.name      testHarFloatResource0009
     * @tc.desc      page_text_font_size plus ten equals 60
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarFloatResource0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarFloatResource0009', 'float resource case 9');
      expect(resources().getNumberByName('page_text_font_size') + 10).assertEqual(60);
      {
      logCase('testHarFloatResource0010', 'float resource case 10');
      expect(resources().getNumberByName('page_text_font_size') - 10).assertEqual(40);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0011
     * @tc.name      testHarFloatResource0011
     * @tc.desc      Adding font size 1 times reaches 50
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarFloatResource0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarFloatResource0011', 'float resource case 11');
      let total: number = 0;
      for (let round: number = 0; round < 1; round++) {
        total += resources().getNumberByName('page_text_font_size');
      }
      expect(total).assertEqual(50);
      {
      logCase('testHarFloatResource0012', 'float resource case 12');
      let total: number = 0;
      for (let round: number = 0; round < 2; round++) {
        total += resources().getNumberByName('page_text_font_size');
      }
      expect(total).assertEqual(100);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0013
     * @tc.name      testHarFloatResource0013
     * @tc.desc      Adding font size 3 times reaches 150
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarFloatResource0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarFloatResource0013', 'float resource case 13');
      let total: number = 0;
      for (let round: number = 0; round < 3; round++) {
        total += resources().getNumberByName('page_text_font_size');
      }
      expect(total).assertEqual(150);
      {
      logCase('testHarFloatResource0014', 'float resource case 14');
      let total: number = 0;
      for (let round: number = 0; round < 4; round++) {
        total += resources().getNumberByName('page_text_font_size');
      }
      expect(total).assertEqual(200);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0015
     * @tc.name      testHarFloatResource0015
