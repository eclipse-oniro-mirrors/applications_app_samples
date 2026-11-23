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
import { UIAbility } from '@kit.AbilityKit';
import { display } from '@kit.ArkUI';
import { resourceManager } from '@kit.LocalizationKit';
import { entryContext, launchHome, stopHome } from './shared/AppProbe';
import { logCase } from './shared/TestLog';

import { paceTurn } from './shared/TestPace';

export default function harFontColorMatrixTest() {
  describe('harFontColorMatrixTest', () => {
  let launchedAbility: UIAbility;
  beforeAll(async () => {
    launchedAbility = await launchHome();
  });
  afterAll(async () => {
    await stopHome();
  });
  beforeEach(async () => {
    await paceTurn();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARFC_0001
   * @tc.name      testHarFontColor0001
   * @tc.desc      Font size keeps 50fp under direct
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarFontColor0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarFontColor0001', 'font direct');
    const ability: UIAbility = launchedAbility;
    const px: number = ability.context.resourceManager.getNumberByName('page_text_font_size');
    const density: number = display.getDefaultDisplaySync().densityPixels;
    const scale: number = ability.context.config.fontSizeScale ?? 1;
    expect(density > 0).assertTrue();
    expect(px > 0).assertTrue();
    expect(Math.round(px / (density * scale))).assertEqual(50);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARFC_0002
   * @tc.name      testHarFontColor0002
   * @tc.desc      Font size keeps 50fp under one add
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarFontColor0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarFontColor0002', 'font one add');
    const ability: UIAbility = launchedAbility;
    const px: number = ability.context.resourceManager.getNumberByName('page_text_font_size');
    const density: number = display.getDefaultDisplaySync().densityPixels;
    const scale: number = ability.context.config.fontSizeScale ?? 1;
    expect(density > 0).assertTrue();
    expect(px + density * scale > px).assertTrue();
    expect(Math.round((px + density * scale) / (density * scale))).assertEqual(51);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARFC_0003
   * @tc.name      testHarFontColor0003
   * @tc.desc      Font size keeps 50fp under one sub
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarFontColor0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarFontColor0003', 'font one sub');
    const ability: UIAbility = launchedAbility;
    const px: number = ability.context.resourceManager.getNumberByName('page_text_font_size');
    const density: number = display.getDefaultDisplaySync().densityPixels;
    const scale: number = ability.context.config.fontSizeScale ?? 1;
    expect(density > 0).assertTrue();
    expect(px - density * scale >= 0).assertTrue();
    expect(Math.round((px - density * scale) / (density * scale))).assertEqual(49);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARFC_0004
   * @tc.name      testHarFontColor0004
   * @tc.desc      Font size keeps 50fp under double
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarFontColor0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarFontColor0004', 'font double');
    const ability: UIAbility = launchedAbility;
    const px: number = ability.context.resourceManager.getNumberByName('page_text_font_size');
    const density: number = display.getDefaultDisplaySync().densityPixels;
    const scale: number = ability.context.config.fontSizeScale ?? 1;
    expect(density > 0).assertTrue();
    expect(Math.round((px * 2) / (density * scale))).assertEqual(100);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARFC_0005
   * @tc.name      testHarFontColor0005
   * @tc.desc      Font size keeps 50fp under half
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarFontColor0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarFontColor0005', 'font half');
    const ability: UIAbility = launchedAbility;
    const px: number = ability.context.resourceManager.getNumberByName('page_text_font_size');
    const density: number = display.getDefaultDisplaySync().densityPixels;
    const scale: number = ability.context.config.fontSizeScale ?? 1;
    expect(density > 0).assertTrue();
    expect(Math.round((px / 2) / (density * scale))).assertEqual(25);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARFC_0006
   * @tc.name      testHarFontColor0006
   * @tc.desc      Font size keeps 50fp under modulo
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarFontColor0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarFontColor0006', 'font modulo');
    const ability: UIAbility = launchedAbility;
    const px: number = ability.context.resourceManager.getNumberByName('page_text_font_size');
    const density: number = display.getDefaultDisplaySync().densityPixels;
    const scale: number = ability.context.config.fontSizeScale ?? 1;
    expect(density > 0).assertTrue();
    expect(Math.abs(px - 50 * density * scale) < 1).assertTrue();
    expect(px % (density * scale) < 1).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARFC_0007
   * @tc.name      testHarFontColor0007
   * @tc.desc      Font size keeps 50fp under scope divide
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarFontColor0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarFontColor0007', 'font scope divide');
    const ability: UIAbility = launchedAbility;
    const px: number = ability.context.resourceManager.getNumberByName('page_text_font_size');
    const density: number = display.getDefaultDisplaySync().densityPixels;
    const scale: number = ability.context.config.fontSizeScale ?? 1;
    expect(density > 0).assertTrue();
    const ratio: number = px / (50 * density);
    expect(Math.round(ratio)).assertEqual(Math.round(scale));
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARFC_0008
   * @tc.name      testHarFontColor0008
   * @tc.desc      Font size keeps 50fp under scope ceiling
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarFontColor0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarFontColor0008', 'font scope ceiling');
    const ability: UIAbility = launchedAbility;
    const px: number = ability.context.resourceManager.getNumberByName('page_text_font_size');
    const density: number = display.getDefaultDisplaySync().densityPixels;
    const scale: number = ability.context.config.fontSizeScale ?? 1;
    expect(density > 0).assertTrue();
    expect(Math.ceil(px / (density * scale))).assertEqual(50);
    expect(Math.floor(px / (density * scale))).assertEqual(50);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARFC_0009
   * @tc.name      testHarFontColor0009
   * @tc.desc      Font size keeps 50fp under proportion
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarFontColor0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarFontColor0009', 'font proportion');
    const ability: UIAbility = launchedAbility;
    const px: number = ability.context.resourceManager.getNumberByName('page_text_font_size');
    const density: number = display.getDefaultDisplaySync().densityPixels;
    const scale: number = ability.context.config.fontSizeScale ?? 1;
    expect(density > 0).assertTrue();
    expect(Math.abs(px / (density * scale) - 50) < 0.01).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARFC_0010
   * @tc.name      testHarFontColor0010
   * @tc.desc      Font size keeps 50fp under remaining
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarFontColor0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarFontColor0010', 'font remaining');
    const ability: UIAbility = launchedAbility;
    const px: number = ability.context.resourceManager.getNumberByName('page_text_font_size');
    const density: number = display.getDefaultDisplaySync().densityPixels;
    const scale: number = ability.context.config.fontSizeScale ?? 1;
    expect(density > 0).assertTrue();
    expect(px > 49 * density * scale).assertTrue();
    expect(px < 51 * density * scale).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARFC_0011
   * @tc.name      testHarFontColor0011
   * @tc.desc      Window background color keeps opaque
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarFontColor0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarFontColor0011', 'color opaque');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const color: number = res.getColorByNameSync('start_window_background');
    const alpha: number = (color >>> 24) & 0xFF;
    const red: number = (color >>> 16) & 0xFF;
    const green: number = (color >>> 8) & 0xFF;
    const blue: number = color & 0xFF;
    expect(alpha).assertEqual(255);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARFC_0012
   * @tc.name      testHarFontColor0012
   * @tc.desc      Window background color keeps white or black
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarFontColor0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarFontColor0012', 'color white or black');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const color: number = res.getColorByNameSync('start_window_background');
    const alpha: number = (color >>> 24) & 0xFF;
    const red: number = (color >>> 16) & 0xFF;
    const green: number = (color >>> 8) & 0xFF;
    const blue: number = color & 0xFF;
    expect(color === 0xFFFFFFFF || color === 0xFF000000).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARFC_0013
   * @tc.name      testHarFontColor0013
   * @tc.desc      Window background color keeps channels aligned
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarFontColor0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarFontColor0013', 'color channels aligned');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const color: number = res.getColorByNameSync('start_window_background');
    const alpha: number = (color >>> 24) & 0xFF;
    const red: number = (color >>> 16) & 0xFF;
    const green: number = (color >>> 8) & 0xFF;
    const blue: number = color & 0xFF;
    expect(red).assertEqual(green);
    expect(green).assertEqual(blue);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARFC_0014
   * @tc.name      testHarFontColor0014
   * @tc.desc      Window background color keeps alpha highest
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarFontColor0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarFontColor0014', 'color alpha highest');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const color: number = res.getColorByNameSync('start_window_background');
    const alpha: number = (color >>> 24) & 0xFF;
    const red: number = (color >>> 16) & 0xFF;
    const green: number = (color >>> 8) & 0xFF;
    const blue: number = color & 0xFF;
    expect(alpha).assertEqual(255);
    expect(alpha >= red && alpha >= green && alpha >= blue).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARFC_0015
   * @tc.name      testHarFontColor0015
   * @tc.desc      Window background color keeps low bits
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarFontColor0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarFontColor0015', 'color low bits');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const color: number = res.getColorByNameSync('start_window_background');
    const alpha: number = (color >>> 24) & 0xFF;
    const red: number = (color >>> 16) & 0xFF;
    const green: number = (color >>> 8) & 0xFF;
    const blue: number = color & 0xFF;
    expect(color % 0x1000000 === 0 || color % 0x1000000 === 0xFFFFFF).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARFC_0016
   * @tc.name      testHarFontColor0016
   * @tc.desc      Window background color keeps id equals name
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarFontColor0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarFontColor0016', 'color id equals name');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const color: number = res.getColorByNameSync('start_window_background');
    const alpha: number = (color >>> 24) & 0xFF;
    const red: number = (color >>> 16) & 0xFF;
    const green: number = (color >>> 8) & 0xFF;
    const blue: number = color & 0xFF;
    expect(res.getColorByNameSync('start_window_background')).assertEqual(color);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARFC_0017
   * @tc.name      testHarFontColor0017
   * @tc.desc      Window background color keeps stable reads
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarFontColor0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarFontColor0017', 'color stable reads');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const color: number = res.getColorByNameSync('start_window_background');
    const alpha: number = (color >>> 24) & 0xFF;
    const red: number = (color >>> 16) & 0xFF;
    const green: number = (color >>> 8) & 0xFF;
    const blue: number = color & 0xFF;
    const again: number = res.getColorByNameSync('start_window_background');
    expect(again).assertEqual(color);
    expect(again >>> 24).assertEqual(alpha);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARFC_0018
   * @tc.name      testHarFontColor0018
   * @tc.desc      Window background color keeps hex contains
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testHarFontColor0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testHarFontColor0018', 'color hex contains');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const color: number = res.getColorByNameSync('start_window_background');
    const alpha: number = (color >>> 24) & 0xFF;
    const red: number = (color >>> 16) & 0xFF;
    const green: number = (color >>> 8) & 0xFF;
    const blue: number = color & 0xFF;
    expect(color.toString(16).toLowerCase().length >= 6).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARFC_0019
   * @tc.name      testHarFontColor0019
   * @tc.desc      Window background color keeps not transparent
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testHarFontColor0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testHarFontColor0019', 'color not transparent');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const color: number = res.getColorByNameSync('start_window_background');
    const alpha: number = (color >>> 24) & 0xFF;
    const red: number = (color >>> 16) & 0xFF;
    const green: number = (color >>> 8) & 0xFF;
    const blue: number = color & 0xFF;
    expect(color >>> 24).assertEqual(255);
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_HARFC_0020
   * @tc.name      testHarFontColor0020
   * @tc.desc      Window background color keeps channel sum
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testHarFontColor0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testHarFontColor0020', 'color channel sum');
    const res: resourceManager.ResourceManager = entryContext().resourceManager;
    const color: number = res.getColorByNameSync('start_window_background');
    const alpha: number = (color >>> 24) & 0xFF;
    const red: number = (color >>> 16) & 0xFF;
    const green: number = (color >>> 8) & 0xFF;
    const blue: number = color & 0xFF;
    expect(red + green + blue === 0 || red + green + blue === 765).assertTrue();
  });
  });
}
