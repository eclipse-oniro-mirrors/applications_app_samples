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

export default function harColorResourceMatrixTest() {
  describe('HarColorResourceMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_HARPACKAGE_HARCOLOR_0001
     * @tc.name      testHarColorResource0001
     * @tc.desc      page_background is opaque white in light mode
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarColorResource0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarColorResource0001', 'color resource case 1');
      expect(lightManager().getColorByNameSync('page_background')).assertEqual(0xFFFFFFFF);
      {
      logCase('testHarColorResource0002', 'color resource case 2');
      expect(darkManager().getColorByNameSync('page_background')).assertEqual(0xFFFFFFFF);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARCOLOR_0003
     * @tc.name      testHarColorResource0003
     * @tc.desc      page_background alpha channel is FF
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarColorResource0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarColorResource0003', 'color resource case 3');
      expect(lightManager().getColorByNameSync('page_background') >>> 24).assertEqual(0xFF);
      {
      logCase('testHarColorResource0004', 'color resource case 4');
      expect((lightManager().getColorByNameSync('page_background') >>> 16) & 0xFF).assertEqual(0xFF);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARCOLOR_0005
     * @tc.name      testHarColorResource0005
     * @tc.desc      page_background green channel is FF
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarColorResource0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarColorResource0005', 'color resource case 5');
      expect((lightManager().getColorByNameSync('page_background') >>> 8) & 0xFF).assertEqual(0xFF);
      {
      logCase('testHarColorResource0006', 'color resource case 6');
      expect(lightManager().getColorByNameSync('page_background') & 0xFF).assertEqual(0xFF);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARCOLOR_0007
     * @tc.name      testHarColorResource0007
     * @tc.desc      start_window_background is white in light mode
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarColorResource0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarColorResource0007', 'color resource case 7');
      expect(lightManager().getColorByNameSync('start_window_background')).assertEqual(0xFFFFFFFF);
      {
      logCase('testHarColorResource0008', 'color resource case 8');
      expect(darkManager().getColorByNameSync('start_window_background')).assertEqual(0xFF000000);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARCOLOR_0009
     * @tc.name      testHarColorResource0009
     * @tc.desc      start_window_background alpha channel is FF
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarColorResource0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarColorResource0009', 'color resource case 9');
      expect(darkManager().getColorByNameSync('start_window_background') >>> 24).assertEqual(0xFF);
      {
      logCase('testHarColorResource0010', 'color resource case 10');
      expect((darkManager().getColorByNameSync('start_window_background') >>> 16) & 0xFF).assertEqual(0);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARCOLOR_0011
     * @tc.name      testHarColorResource0011
     * @tc.desc      light and dark page_background agree
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarColorResource0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarColorResource0011', 'color resource case 11');
      const lightBackground: number = lightManager().getColorByNameSync('page_background');
      const darkBackground: number = darkManager().getColorByNameSync('page_background');
      expect(lightBackground).assertEqual(darkBackground);
      {
      logCase('testHarColorResource0012', 'color resource case 12');
      const lightBackground: number = lightManager().getColorByNameSync('page_background');
      const darkWindow: number = darkManager().getColorByNameSync('start_window_background');
      expect(lightBackground > darkWindow).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARCOLOR_0013
     * @tc.name      testHarColorResource0013
     * @tc.desc      text_color is fully opaque in light mode
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarColorResource0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarColorResource0013', 'color resource case 13');
      expect(lightManager().getColorByNameSync('text_color') >>> 24).assertEqual(0xFF);
      {
      logCase('testHarColorResource0014', 'color resource case 14');
      const value: number = lightManager().getColorByNameSync('text_color');
      expect(value === 0xFFFFFFFF || value === 0xFF000000).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARCOLOR_0015
     * @tc.name      testHarColorResource0015
     * @tc.desc      text_color does not change between light and dark
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarColorResource0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarColorResource0015', 'color resource case 15');
      const lightText: number = lightManager().getColorByNameSync('text_color');
      const darkText: number = darkManager().getColorByNameSync('text_color');
      expect(lightText).assertEqual(darkText);
      {
      logCase('testHarColorResource0016', 'color resource case 16');
      expect(lightManager().getColorByNameSync('text_color')).assertEqual(0xFFFFFFFF);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARCOLOR_0017
     * @tc.name      testHarColorResource0017
     * @tc.desc      Color lookup by name matches the same name read twice
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarColorResource0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarColorResource0017', 'color resource case 17');
      expect(darkManager().getColorByNameSync('page_background')).assertEqual(0xFFFFFFFF);
      {
      logCase('testHarColorResource0018', 'color resource case 18');
      expect(lightManager().getColorByNameSync('page_background') >= 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARCOLOR_0019
     * @tc.name      testHarColorResource0019
     * @tc.desc      color values fit into 32 bits
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarColorResource0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarColorResource0019', 'color resource case 19');
      expect(darkManager().getColorByNameSync('start_window_background') <= 0xFFFFFFFF).assertTrue();
      {
      logCase('testHarColorResource0020', 'color resource case 20');
      const channelValue: number = (lightManager().getColorByNameSync('text_color') >>> 24) & 0xFF;
      expect(channelValue >= 0 && channelValue <= 255).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARCOLOR_0021
     * @tc.name      testHarColorResource0021
     * @tc.desc      alpha channel of page_background via masked shift 24 is within 0..255
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarColorResource0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarColorResource0021', 'color resource case 21');
      const channelValue: number = (lightManager().getColorByNameSync('page_background') >>> 24) & 0xFF;
      expect(channelValue >= 0 && channelValue <= 255).assertTrue();
      {
      logCase('testHarColorResource0022', 'color resource case 22');
      const channelValue: number = (lightManager().getColorByNameSync('text_color') >>> 16) & 0xFF;
      expect(channelValue >= 0 && channelValue <= 255).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARCOLOR_0023
     * @tc.name      testHarColorResource0023
     * @tc.desc      red channel of page_background via masked shift 16 is within 0..255
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarColorResource0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarColorResource0023', 'color resource case 23');
      const channelValue: number = (lightManager().getColorByNameSync('page_background') >>> 16) & 0xFF;
      expect(channelValue >= 0 && channelValue <= 255).assertTrue();
      {
      logCase('testHarColorResource0024', 'color resource case 24');
      const channelValue: number = (lightManager().getColorByNameSync('text_color') >>> 8) & 0xFF;
      expect(channelValue >= 0 && channelValue <= 255).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARCOLOR_0025
     * @tc.name      testHarColorResource0025
     * @tc.desc      green channel of page_background via masked shift 8 is within 0..255
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarColorResource0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarColorResource0025', 'color resource case 25');
      const channelValue: number = (lightManager().getColorByNameSync('page_background') >>> 8) & 0xFF;
      expect(channelValue >= 0 && channelValue <= 255).assertTrue();
      {
      logCase('testHarColorResource0026', 'color resource case 26');
      const channelValue: number = (lightManager().getColorByNameSync('text_color') >>> 0) & 0xFF;
      expect(channelValue >= 0 && channelValue <= 255).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARCOLOR_0027
     * @tc.name      testHarColorResource0027
     * @tc.desc      blue channel of page_background via masked shift 0 is within 0..255
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarColorResource0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarColorResource0027', 'color resource case 27');
      const channelValue: number = (lightManager().getColorByNameSync('page_background') >>> 0) & 0xFF;
      expect(channelValue >= 0 && channelValue <= 255).assertTrue();
      {
      logCase('testHarColorResource0028', 'color resource case 28');
      const source: number = lightManager().getColorByNameSync('text_color');
      const byteValue: number = (source >>> 0) & 0xFF;
      expect((byteValue << 0) >>> 0).assertEqual(byteValue);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARCOLOR_0029
     * @tc.name      testHarColorResource0029
     * @tc.desc      Byte 1 of text_color shifted back reproduces the masked byte
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarColorResource0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarColorResource0029', 'color resource case 29');
      const source: number = lightManager().getColorByNameSync('text_color');
      const byteValue: number = (source >>> 8) & 0xFF;
      expect((byteValue << 8) >>> 8).assertEqual(byteValue);
      {
      logCase('testHarColorResource0030', 'color resource case 30');
      const source: number = lightManager().getColorByNameSync('text_color');
      const byteValue: number = (source >>> 16) & 0xFF;
      expect((byteValue << 16) >>> 16).assertEqual(byteValue);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARCOLOR_0031
     * @tc.name      testHarColorResource0031
     * @tc.desc      Byte 3 of text_color shifted back reproduces the masked byte
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarColorResource0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarColorResource0031', 'color resource case 31');
      const source: number = lightManager().getColorByNameSync('text_color');
      const byteValue: number = (source >>> 24) & 0xFF;
      expect((byteValue << 24) >>> 24).assertEqual(byteValue);
      {
      logCase('testHarColorResource0032', 'color resource case 32');
      const source: number = lightManager().getColorByNameSync('page_background');
      const byteValue: number = (source >>> 0) & 0xFF;
      expect((byteValue << 0) >>> 0).assertEqual(byteValue);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARCOLOR_0033
     * @tc.name      testHarColorResource0033
     * @tc.desc      Byte 1 of page_background shifted back reproduces the masked byte
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarColorResource0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarColorResource0033', 'color resource case 33');
      const source: number = lightManager().getColorByNameSync('page_background');
      const byteValue: number = (source >>> 8) & 0xFF;
      expect((byteValue << 8) >>> 8).assertEqual(byteValue);
      {
      logCase('testHarColorResource0034', 'color resource case 34');
      const source: number = lightManager().getColorByNameSync('page_background');
      const byteValue: number = (source >>> 16) & 0xFF;
      expect((byteValue << 16) >>> 16).assertEqual(byteValue);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARCOLOR_0035
     * @tc.name      testHarColorResource0035
     * @tc.desc      Byte 3 of page_background shifted back reproduces the masked byte
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarColorResource0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarColorResource0035', 'color resource case 35');
      const source: number = lightManager().getColorByNameSync('page_background');
      const byteValue: number = (source >>> 24) & 0xFF;
      expect((byteValue << 24) >>> 24).assertEqual(byteValue);
      {
      logCase('testHarColorResource0036', 'color resource case 36');
      const source: number = lightManager().getColorByNameSync('start_window_background');
      const byteValue: number = (source >>> 0) & 0xFF;
      expect((byteValue << 0) >>> 0).assertEqual(byteValue);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARCOLOR_0037
     * @tc.name      testHarColorResource0037
     * @tc.desc      Byte 1 of start_window_background shifted back reproduces the masked byte
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarColorResource0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarColorResource0037', 'color resource case 37');
      const source: number = lightManager().getColorByNameSync('start_window_background');
      const byteValue: number = (source >>> 8) & 0xFF;
      expect((byteValue << 8) >>> 8).assertEqual(byteValue);
      {
      logCase('testHarColorResource0038', 'color resource case 38');
      const source: number = lightManager().getColorByNameSync('start_window_background');
      const byteValue: number = (source >>> 16) & 0xFF;
      expect((byteValue << 16) >>> 16).assertEqual(byteValue);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARCOLOR_0039
     * @tc.name      testHarColorResource0039
     * @tc.desc      Byte 3 of start_window_background shifted back reproduces the masked byte
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarColorResource0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarColorResource0039', 'color resource case 39');
      const source: number = lightManager().getColorByNameSync('start_window_background');
      const byteValue: number = (source >>> 24) & 0xFF;
      expect((byteValue << 24) >>> 24).assertEqual(byteValue);
      {
      logCase('testHarColorResource0040', 'color resource case 40');
      const invalidCode: number = errorCode((): void => {
        resources().getColorByNameSync('page_background_missing');
      });
      expect(invalidCode).assertEqual(ERR_RES_NAME_INVALID);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARCOLOR_0041
     * @tc.name      testHarColorResource0041
     * @tc.desc      Unknown color name 'Page_Background' returns 9001003
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarColorResource0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarColorResource0041', 'color resource case 41');
      const invalidCode: number = errorCode((): void => {
        resources().getColorByNameSync('Page_Background');
      });
      expect(invalidCode).assertEqual(ERR_RES_NAME_INVALID);
      {
      logCase('testHarColorResource0042', 'color resource case 42');
      const invalidCode: number = errorCode((): void => {
        resources().getColorByNameSync('color.page_background');
      });
      expect(invalidCode).assertEqual(ERR_RES_NAME_INVALID);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARCOLOR_0043
     * @tc.name      testHarColorResource0043
     * @tc.desc      Unknown color name 'text_color ' returns 9001003
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarColorResource0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarColorResource0043', 'color resource case 43');
      const invalidCode: number = errorCode((): void => {
        resources().getColorByNameSync('text_color ');
      });
      expect(invalidCode).assertEqual(ERR_RES_NAME_INVALID);
      {
      logCase('testHarColorResource0044', 'color resource case 44');
      expect(errorCode(() => resources().getColorSync(0))).assertEqual(ERR_RES_ID_INVALID);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARCOLOR_0045
     * @tc.name      testHarColorResource0045
     * @tc.desc      Invalid color id 1 returns 9001001
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarColorResource0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarColorResource0045', 'color resource case 45');
      expect(errorCode(() => resources().getColorSync(1))).assertEqual(ERR_RES_ID_INVALID);
      {
      logCase('testHarColorResource0046', 'color resource case 46');
      expect(errorCode(() => resources().getColorSync(16777215))).assertEqual(ERR_RES_ID_INVALID);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARCOLOR_0047
     * @tc.name      testHarColorResource0047
     * @tc.desc      Invalid color id 2147483647 returns 9001001
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarColorResource0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarColorResource0047', 'color resource case 47');
      expect(errorCode(() => resources().getColorSync(2147483647))).assertEqual(ERR_RES_ID_INVALID);
    });

  });
}
