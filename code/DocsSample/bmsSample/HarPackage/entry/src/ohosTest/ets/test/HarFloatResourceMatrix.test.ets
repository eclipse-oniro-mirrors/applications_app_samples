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
     * @tc.desc      Adding font size 5 times reaches 250
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarFloatResource0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarFloatResource0015', 'float resource case 15');
      let total: number = 0;
      for (let round: number = 0; round < 5; round++) {
        total += resources().getNumberByName('page_text_font_size');
      }
      expect(total).assertEqual(250);
      {
      logCase('testHarFloatResource0016', 'float resource case 16');
      let total: number = 0;
      for (let round: number = 0; round < 6; round++) {
        total += resources().getNumberByName('page_text_font_size');
      }
      expect(total).assertEqual(300);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0017
     * @tc.name      testHarFloatResource0017
     * @tc.desc      Adding font size 7 times reaches 350
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarFloatResource0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarFloatResource0017', 'float resource case 17');
      let total: number = 0;
      for (let round: number = 0; round < 7; round++) {
        total += resources().getNumberByName('page_text_font_size');
      }
      expect(total).assertEqual(350);
      {
      logCase('testHarFloatResource0018', 'float resource case 18');
      let total: number = 0;
      for (let round: number = 0; round < 8; round++) {
        total += resources().getNumberByName('page_text_font_size');
      }
      expect(total).assertEqual(400);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0019
     * @tc.name      testHarFloatResource0019
     * @tc.desc      Adding font size 9 times reaches 450
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarFloatResource0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarFloatResource0019', 'float resource case 19');
      let total: number = 0;
      for (let round: number = 0; round < 9; round++) {
        total += resources().getNumberByName('page_text_font_size');
      }
      expect(total).assertEqual(450);
      {
      logCase('testHarFloatResource0020', 'float resource case 20');
      let total: number = 0;
      for (let round: number = 0; round < 10; round++) {
        total += resources().getNumberByName('page_text_font_size');
      }
      expect(total).assertEqual(500);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0021
     * @tc.name      testHarFloatResource0021
     * @tc.desc      Adding font size 11 times reaches 550
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarFloatResource0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarFloatResource0021', 'float resource case 21');
      let total: number = 0;
      for (let round: number = 0; round < 11; round++) {
        total += resources().getNumberByName('page_text_font_size');
      }
      expect(total).assertEqual(550);
      {
      logCase('testHarFloatResource0022', 'float resource case 22');
      let total: number = 0;
      for (let round: number = 0; round < 12; round++) {
        total += resources().getNumberByName('page_text_font_size');
      }
      expect(total).assertEqual(600);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0023
     * @tc.name      testHarFloatResource0023
     * @tc.desc      Adding font size 13 times reaches 650
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarFloatResource0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarFloatResource0023', 'float resource case 23');
      let total: number = 0;
      for (let round: number = 0; round < 13; round++) {
        total += resources().getNumberByName('page_text_font_size');
      }
      expect(total).assertEqual(650);
      {
      logCase('testHarFloatResource0024', 'float resource case 24');
      let total: number = 0;
      for (let round: number = 0; round < 14; round++) {
        total += resources().getNumberByName('page_text_font_size');
      }
      expect(total).assertEqual(700);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0025
     * @tc.name      testHarFloatResource0025
     * @tc.desc      Adding font size 15 times reaches 750
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarFloatResource0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarFloatResource0025', 'float resource case 25');
      let total: number = 0;
      for (let round: number = 0; round < 15; round++) {
        total += resources().getNumberByName('page_text_font_size');
      }
      expect(total).assertEqual(750);
      {
      logCase('testHarFloatResource0026', 'float resource case 26');
      let total: number = 0;
      for (let round: number = 0; round < 16; round++) {
        total += resources().getNumberByName('page_text_font_size');
      }
      expect(total).assertEqual(800);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0027
     * @tc.name      testHarFloatResource0027
     * @tc.desc      Adding font size 17 times reaches 850
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarFloatResource0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarFloatResource0027', 'float resource case 27');
      let total: number = 0;
      for (let round: number = 0; round < 17; round++) {
        total += resources().getNumberByName('page_text_font_size');
      }
      expect(total).assertEqual(850);
      {
      logCase('testHarFloatResource0028', 'float resource case 28');
      let total: number = 0;
      for (let round: number = 0; round < 18; round++) {
        total += resources().getNumberByName('page_text_font_size');
      }
      expect(total).assertEqual(900);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0029
     * @tc.name      testHarFloatResource0029
     * @tc.desc      Adding font size 19 times reaches 950
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarFloatResource0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarFloatResource0029', 'float resource case 29');
      let total: number = 0;
      for (let round: number = 0; round < 19; round++) {
        total += resources().getNumberByName('page_text_font_size');
      }
      expect(total).assertEqual(950);
      {
      logCase('testHarFloatResource0030', 'float resource case 30');
      let total: number = 0;
      for (let round: number = 0; round < 20; round++) {
        total += resources().getNumberByName('page_text_font_size');
      }
      expect(total).assertEqual(1000);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0031
     * @tc.name      testHarFloatResource0031
     * @tc.desc      Adding font size 21 times reaches 1050
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarFloatResource0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarFloatResource0031', 'float resource case 31');
      let total: number = 0;
      for (let round: number = 0; round < 21; round++) {
        total += resources().getNumberByName('page_text_font_size');
      }
      expect(total).assertEqual(1050);
      {
      logCase('testHarFloatResource0032', 'float resource case 32');
      let total: number = 0;
      for (let round: number = 0; round < 22; round++) {
        total += resources().getNumberByName('page_text_font_size');
      }
      expect(total).assertEqual(1100);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0033
     * @tc.name      testHarFloatResource0033
     * @tc.desc      Adding font size 23 times reaches 1150
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarFloatResource0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarFloatResource0033', 'float resource case 33');
      let total: number = 0;
      for (let round: number = 0; round < 23; round++) {
        total += resources().getNumberByName('page_text_font_size');
      }
      expect(total).assertEqual(1150);
      {
      logCase('testHarFloatResource0034', 'float resource case 34');
      let total: number = 0;
      for (let round: number = 0; round < 24; round++) {
        total += resources().getNumberByName('page_text_font_size');
      }
      expect(total).assertEqual(1200);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0035
     * @tc.name      testHarFloatResource0035
     * @tc.desc      Adding font size 25 times reaches 1250
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarFloatResource0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarFloatResource0035', 'float resource case 35');
      let total: number = 0;
      for (let round: number = 0; round < 25; round++) {
        total += resources().getNumberByName('page_text_font_size');
      }
      expect(total).assertEqual(1250);
      {
      logCase('testHarFloatResource0036', 'float resource case 36');
      let total: number = 0;
      for (let round: number = 0; round < 26; round++) {
        total += resources().getNumberByName('page_text_font_size');
      }
      expect(total).assertEqual(1300);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0037
     * @tc.name      testHarFloatResource0037
     * @tc.desc      Adding font size 27 times reaches 1350
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarFloatResource0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarFloatResource0037', 'float resource case 37');
      let total: number = 0;
      for (let round: number = 0; round < 27; round++) {
        total += resources().getNumberByName('page_text_font_size');
      }
      expect(total).assertEqual(1350);
      {
      logCase('testHarFloatResource0038', 'float resource case 38');
      let total: number = 0;
      for (let round: number = 0; round < 28; round++) {
        total += resources().getNumberByName('page_text_font_size');
      }
      expect(total).assertEqual(1400);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0039
     * @tc.name      testHarFloatResource0039
     * @tc.desc      Adding font size 29 times reaches 1450
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarFloatResource0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarFloatResource0039', 'float resource case 39');
      let total: number = 0;
      for (let round: number = 0; round < 29; round++) {
        total += resources().getNumberByName('page_text_font_size');
      }
      expect(total).assertEqual(1450);
      {
      logCase('testHarFloatResource0040', 'float resource case 40');
      let total: number = 0;
      for (let round: number = 0; round < 30; round++) {
        total += resources().getNumberByName('page_text_font_size');
      }
      expect(total).assertEqual(1500);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0041
     * @tc.name      testHarFloatResource0041
     * @tc.desc      Font size stays above literal 1
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarFloatResource0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarFloatResource0041', 'float resource case 41');
      expect(resources().getNumberByName('page_text_font_size') > 1).assertTrue();
      {
      logCase('testHarFloatResource0042', 'float resource case 42');
      expect(resources().getNumberByName('page_text_font_size') > 2).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0043
     * @tc.name      testHarFloatResource0043
     * @tc.desc      Font size stays above literal 3
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarFloatResource0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarFloatResource0043', 'float resource case 43');
      expect(resources().getNumberByName('page_text_font_size') > 3).assertTrue();
      {
      logCase('testHarFloatResource0044', 'float resource case 44');
      expect(resources().getNumberByName('page_text_font_size') > 4).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0045
     * @tc.name      testHarFloatResource0045
     * @tc.desc      Font size stays above literal 5
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarFloatResource0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarFloatResource0045', 'float resource case 45');
      expect(resources().getNumberByName('page_text_font_size') > 5).assertTrue();
      {
      logCase('testHarFloatResource0046', 'float resource case 46');
      expect(resources().getNumberByName('page_text_font_size') > 6).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0047
     * @tc.name      testHarFloatResource0047
     * @tc.desc      Font size stays above literal 7
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarFloatResource0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarFloatResource0047', 'float resource case 47');
      expect(resources().getNumberByName('page_text_font_size') > 7).assertTrue();
      {
      logCase('testHarFloatResource0048', 'float resource case 48');
      expect(resources().getNumberByName('page_text_font_size') > 8).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0049
     * @tc.name      testHarFloatResource0049
     * @tc.desc      Font size stays above literal 9
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarFloatResource0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarFloatResource0049', 'float resource case 49');
      expect(resources().getNumberByName('page_text_font_size') > 9).assertTrue();
      {
      logCase('testHarFloatResource0050', 'float resource case 50');
      expect(resources().getNumberByName('page_text_font_size') > 10).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0051
     * @tc.name      testHarFloatResource0051
     * @tc.desc      Font size stays above literal 11
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarFloatResource0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarFloatResource0051', 'float resource case 51');
      expect(resources().getNumberByName('page_text_font_size') > 11).assertTrue();
      {
      logCase('testHarFloatResource0052', 'float resource case 52');
      expect(resources().getNumberByName('page_text_font_size') > 12).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0053
     * @tc.name      testHarFloatResource0053
     * @tc.desc      Font size stays above literal 13
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarFloatResource0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarFloatResource0053', 'float resource case 53');
      expect(resources().getNumberByName('page_text_font_size') > 13).assertTrue();
      {
      logCase('testHarFloatResource0054', 'float resource case 54');
      expect(resources().getNumberByName('page_text_font_size') > 14).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0055
     * @tc.name      testHarFloatResource0055
     * @tc.desc      Font size stays above literal 15
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarFloatResource0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarFloatResource0055', 'float resource case 55');
      expect(resources().getNumberByName('page_text_font_size') > 15).assertTrue();
      {
      logCase('testHarFloatResource0056', 'float resource case 56');
      expect(resources().getNumberByName('page_text_font_size') > 16).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0057
     * @tc.name      testHarFloatResource0057
     * @tc.desc      Font size stays above literal 17
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarFloatResource0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarFloatResource0057', 'float resource case 57');
      expect(resources().getNumberByName('page_text_font_size') > 17).assertTrue();
      {
      logCase('testHarFloatResource0058', 'float resource case 58');
      expect(resources().getNumberByName('page_text_font_size') > 18).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0059
     * @tc.name      testHarFloatResource0059
     * @tc.desc      Font size stays above literal 19
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarFloatResource0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarFloatResource0059', 'float resource case 59');
      expect(resources().getNumberByName('page_text_font_size') > 19).assertTrue();
      {
      logCase('testHarFloatResource0060', 'float resource case 60');
      expect(resources().getNumberByName('page_text_font_size') > 20).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0061
     * @tc.name      testHarFloatResource0061
     * @tc.desc      Font size stays above literal 21
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarFloatResource0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarFloatResource0061', 'float resource case 61');
      expect(resources().getNumberByName('page_text_font_size') > 21).assertTrue();
      {
      logCase('testHarFloatResource0062', 'float resource case 62');
      expect(resources().getNumberByName('page_text_font_size') > 22).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0063
     * @tc.name      testHarFloatResource0063
     * @tc.desc      Font size stays above literal 23
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarFloatResource0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarFloatResource0063', 'float resource case 63');
      expect(resources().getNumberByName('page_text_font_size') > 23).assertTrue();
      {
      logCase('testHarFloatResource0064', 'float resource case 64');
      expect(resources().getNumberByName('page_text_font_size') > 24).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0065
     * @tc.name      testHarFloatResource0065
     * @tc.desc      Font size stays above literal 25
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarFloatResource0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarFloatResource0065', 'float resource case 65');
      expect(resources().getNumberByName('page_text_font_size') > 25).assertTrue();
      {
      logCase('testHarFloatResource0066', 'float resource case 66');
      expect(resources().getNumberByName('page_text_font_size') > 26).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0067
     * @tc.name      testHarFloatResource0067
     * @tc.desc      Font size stays above literal 27
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarFloatResource0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarFloatResource0067', 'float resource case 67');
      expect(resources().getNumberByName('page_text_font_size') > 27).assertTrue();
      {
      logCase('testHarFloatResource0068', 'float resource case 68');
      expect(resources().getNumberByName('page_text_font_size') > 28).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0069
     * @tc.name      testHarFloatResource0069
     * @tc.desc      Font size stays above literal 29
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarFloatResource0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarFloatResource0069', 'float resource case 69');
      expect(resources().getNumberByName('page_text_font_size') > 29).assertTrue();
      {
      logCase('testHarFloatResource0070', 'float resource case 70');
      expect(resources().getNumberByName('page_text_font_size') > 30).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0071
     * @tc.name      testHarFloatResource0071
     * @tc.desc      Font size stays above literal 31
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarFloatResource0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarFloatResource0071', 'float resource case 71');
      expect(resources().getNumberByName('page_text_font_size') > 31).assertTrue();
      {
      logCase('testHarFloatResource0072', 'float resource case 72');
      expect(resources().getNumberByName('page_text_font_size') > 32).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0073
     * @tc.name      testHarFloatResource0073
     * @tc.desc      Font size stays above literal 33
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarFloatResource0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarFloatResource0073', 'float resource case 73');
      expect(resources().getNumberByName('page_text_font_size') > 33).assertTrue();
      {
      logCase('testHarFloatResource0074', 'float resource case 74');
      expect(resources().getNumberByName('page_text_font_size') > 34).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0075
     * @tc.name      testHarFloatResource0075
     * @tc.desc      Font size stays above literal 35
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarFloatResource0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarFloatResource0075', 'float resource case 75');
      expect(resources().getNumberByName('page_text_font_size') > 35).assertTrue();
      {
      logCase('testHarFloatResource0076', 'float resource case 76');
      expect(resources().getNumberByName('page_text_font_size') > 36).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0077
     * @tc.name      testHarFloatResource0077
     * @tc.desc      Font size stays above literal 37
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarFloatResource0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarFloatResource0077', 'float resource case 77');
      expect(resources().getNumberByName('page_text_font_size') > 37).assertTrue();
      {
      logCase('testHarFloatResource0078', 'float resource case 78');
      expect(resources().getNumberByName('page_text_font_size') > 38).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0079
     * @tc.name      testHarFloatResource0079
     * @tc.desc      Font size stays above literal 39
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarFloatResource0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarFloatResource0079', 'float resource case 79');
      expect(resources().getNumberByName('page_text_font_size') > 39).assertTrue();
      {
      logCase('testHarFloatResource0080', 'float resource case 80');
      expect(resources().getNumberByName('page_text_font_size') > 40).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0081
     * @tc.name      testHarFloatResource0081
     * @tc.desc      Font size stays below literal 51
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarFloatResource0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarFloatResource0081', 'float resource case 81');
      expect(resources().getNumberByName('page_text_font_size') < 51).assertTrue();
      {
      logCase('testHarFloatResource0082', 'float resource case 82');
      expect(resources().getNumberByName('page_text_font_size') < 52).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0083
     * @tc.name      testHarFloatResource0083
     * @tc.desc      Font size stays below literal 53
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarFloatResource0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarFloatResource0083', 'float resource case 83');
      expect(resources().getNumberByName('page_text_font_size') < 53).assertTrue();
      {
      logCase('testHarFloatResource0084', 'float resource case 84');
      expect(resources().getNumberByName('page_text_font_size') < 54).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0085
     * @tc.name      testHarFloatResource0085
     * @tc.desc      Font size stays below literal 55
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarFloatResource0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarFloatResource0085', 'float resource case 85');
      expect(resources().getNumberByName('page_text_font_size') < 55).assertTrue();
      {
      logCase('testHarFloatResource0086', 'float resource case 86');
      expect(resources().getNumberByName('page_text_font_size') < 56).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0087
     * @tc.name      testHarFloatResource0087
     * @tc.desc      Font size stays below literal 57
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarFloatResource0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarFloatResource0087', 'float resource case 87');
      expect(resources().getNumberByName('page_text_font_size') < 57).assertTrue();
      {
      logCase('testHarFloatResource0088', 'float resource case 88');
      expect(resources().getNumberByName('page_text_font_size') < 58).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0089
     * @tc.name      testHarFloatResource0089
     * @tc.desc      Font size stays below literal 59
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarFloatResource0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarFloatResource0089', 'float resource case 89');
      expect(resources().getNumberByName('page_text_font_size') < 59).assertTrue();
      {
      logCase('testHarFloatResource0090', 'float resource case 90');
      expect(resources().getNumberByName('page_text_font_size') < 60).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0091
     * @tc.name      testHarFloatResource0091
     * @tc.desc      Font size stays below literal 61
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarFloatResource0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarFloatResource0091', 'float resource case 91');
      expect(resources().getNumberByName('page_text_font_size') < 61).assertTrue();
      {
      logCase('testHarFloatResource0092', 'float resource case 92');
      expect(resources().getNumberByName('page_text_font_size') < 62).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0093
     * @tc.name      testHarFloatResource0093
     * @tc.desc      Font size stays below literal 63
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarFloatResource0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarFloatResource0093', 'float resource case 93');
      expect(resources().getNumberByName('page_text_font_size') < 63).assertTrue();
      {
      logCase('testHarFloatResource0094', 'float resource case 94');
      expect(resources().getNumberByName('page_text_font_size') < 64).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0095
     * @tc.name      testHarFloatResource0095
     * @tc.desc      Font size stays below literal 65
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarFloatResource0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarFloatResource0095', 'float resource case 95');
      expect(resources().getNumberByName('page_text_font_size') < 65).assertTrue();
      {
      logCase('testHarFloatResource0096', 'float resource case 96');
      expect(resources().getNumberByName('page_text_font_size') < 66).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0097
     * @tc.name      testHarFloatResource0097
     * @tc.desc      Font size stays below literal 67
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarFloatResource0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarFloatResource0097', 'float resource case 97');
      expect(resources().getNumberByName('page_text_font_size') < 67).assertTrue();
      {
      logCase('testHarFloatResource0098', 'float resource case 98');
      expect(resources().getNumberByName('page_text_font_size') < 68).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0099
     * @tc.name      testHarFloatResource0099
     * @tc.desc      Font size stays below literal 69
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarFloatResource0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarFloatResource0099', 'float resource case 99');
      expect(resources().getNumberByName('page_text_font_size') < 69).assertTrue();
      {
      logCase('testHarFloatResource0100', 'float resource case 100');
      expect(resources().getNumberByName('page_text_font_size') < 70).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0101
     * @tc.name      testHarFloatResource0101
     * @tc.desc      Font size stays below literal 71
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarFloatResource0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarFloatResource0101', 'float resource case 101');
      expect(resources().getNumberByName('page_text_font_size') < 71).assertTrue();
      {
      logCase('testHarFloatResource0102', 'float resource case 102');
      expect(resources().getNumberByName('page_text_font_size') < 72).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0103
     * @tc.name      testHarFloatResource0103
     * @tc.desc      Font size stays below literal 73
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarFloatResource0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarFloatResource0103', 'float resource case 103');
      expect(resources().getNumberByName('page_text_font_size') < 73).assertTrue();
      {
      logCase('testHarFloatResource0104', 'float resource case 104');
      expect(resources().getNumberByName('page_text_font_size') < 74).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0105
     * @tc.name      testHarFloatResource0105
     * @tc.desc      Font size stays below literal 75
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarFloatResource0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarFloatResource0105', 'float resource case 105');
      expect(resources().getNumberByName('page_text_font_size') < 75).assertTrue();
      {
      logCase('testHarFloatResource0106', 'float resource case 106');
      expect(resources().getNumberByName('page_text_font_size') < 76).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0107
     * @tc.name      testHarFloatResource0107
     * @tc.desc      Font size stays below literal 77
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarFloatResource0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarFloatResource0107', 'float resource case 107');
      expect(resources().getNumberByName('page_text_font_size') < 77).assertTrue();
      {
      logCase('testHarFloatResource0108', 'float resource case 108');
      expect(resources().getNumberByName('page_text_font_size') < 78).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0109
     * @tc.name      testHarFloatResource0109
     * @tc.desc      Font size stays below literal 79
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarFloatResource0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarFloatResource0109', 'float resource case 109');
      expect(resources().getNumberByName('page_text_font_size') < 79).assertTrue();
      {
      logCase('testHarFloatResource0110', 'float resource case 110');
      expect(resources().getNumberByName('page_text_font_size') < 80).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0111
     * @tc.name      testHarFloatResource0111
     * @tc.desc      Font size stays below literal 81
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHarFloatResource0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      logCase('testHarFloatResource0111', 'float resource case 111');
      expect(resources().getNumberByName('page_text_font_size') < 81).assertTrue();
      {
      logCase('testHarFloatResource0112', 'float resource case 112');
      expect(resources().getNumberByName('page_text_font_size') < 82).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0113
     * @tc.name      testHarFloatResource0113
     * @tc.desc      Font size stays below literal 83
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHarFloatResource0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      logCase('testHarFloatResource0113', 'float resource case 113');
      expect(resources().getNumberByName('page_text_font_size') < 83).assertTrue();
      {
      logCase('testHarFloatResource0114', 'float resource case 114');
      expect(resources().getNumberByName('page_text_font_size') < 84).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0115
     * @tc.name      testHarFloatResource0115
     * @tc.desc      Font size stays below literal 85
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHarFloatResource0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      logCase('testHarFloatResource0115', 'float resource case 115');
      expect(resources().getNumberByName('page_text_font_size') < 85).assertTrue();
      {
      logCase('testHarFloatResource0116', 'float resource case 116');
      expect(resources().getNumberByName('page_text_font_size') < 86).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0117
     * @tc.name      testHarFloatResource0117
     * @tc.desc      Font size stays below literal 87
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHarFloatResource0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      logCase('testHarFloatResource0117', 'float resource case 117');
      expect(resources().getNumberByName('page_text_font_size') < 87).assertTrue();
      {
      logCase('testHarFloatResource0118', 'float resource case 118');
      expect(resources().getNumberByName('page_text_font_size') < 88).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0119
     * @tc.name      testHarFloatResource0119
     * @tc.desc      Font size stays below literal 89
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHarFloatResource0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      logCase('testHarFloatResource0119', 'float resource case 119');
      expect(resources().getNumberByName('page_text_font_size') < 89).assertTrue();
      {
      logCase('testHarFloatResource0120', 'float resource case 120');
      const invalidCode: number = errorCode((): void => {
        resources().getNumberByName('page_text_font_size_missing');
      });
      expect(invalidCode).assertEqual(ERR_RES_NAME_INVALID);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0121
     * @tc.name      testHarFloatResource0121
     * @tc.desc      Unknown float name 'Page_Text_Font_Size' returns 9001003
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHarFloatResource0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      logCase('testHarFloatResource0121', 'float resource case 121');
      const invalidCode: number = errorCode((): void => {
        resources().getNumberByName('Page_Text_Font_Size');
      });
      expect(invalidCode).assertEqual(ERR_RES_NAME_INVALID);
      {
      logCase('testHarFloatResource0122', 'float resource case 122');
      const invalidCode: number = errorCode((): void => {
        resources().getNumberByName('float.page_text_font_size');
      });
      expect(invalidCode).assertEqual(ERR_RES_NAME_INVALID);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0123
     * @tc.name      testHarFloatResource0123
     * @tc.desc      Unknown float name 'page_text_font_size ' returns 9001003
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHarFloatResource0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      logCase('testHarFloatResource0123', 'float resource case 123');
      const invalidCode: number = errorCode((): void => {
        resources().getNumberByName('page_text_font_size ');
      });
      expect(invalidCode).assertEqual(ERR_RES_NAME_INVALID);
      {
      logCase('testHarFloatResource0124', 'float resource case 124');
      const invalidCode: number = errorCode((): void => {
        resources().getNumberByName('index_text_font_size');
      });
      expect(invalidCode).assertEqual(ERR_RES_NAME_INVALID);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0125
     * @tc.name      testHarFloatResource0125
     * @tc.desc      Invalid float id 0 returns 9001001
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHarFloatResource0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      logCase('testHarFloatResource0125', 'float resource case 125');
      expect(errorCode(() => resources().getNumber(0))).assertEqual(ERR_RES_ID_INVALID);
      {
      logCase('testHarFloatResource0126', 'float resource case 126');
      expect(errorCode(() => resources().getNumber(1))).assertEqual(ERR_RES_ID_INVALID);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARFLOAT_0127
     * @tc.name      testHarFloatResource0127
     * @tc.desc      Invalid float id 16777215 returns 9001001
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHarFloatResource0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      logCase('testHarFloatResource0127', 'float resource case 127');
      expect(errorCode(() => resources().getNumber(16777215))).assertEqual(ERR_RES_ID_INVALID);
      {
      logCase('testHarFloatResource0128', 'float resource case 128');
      expect(errorCode(() => resources().getNumber(2147483647))).assertEqual(ERR_RES_ID_INVALID);
      }
    });

  });
}
