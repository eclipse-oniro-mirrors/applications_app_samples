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

export default function harMediaResourceMatrixTest() {
  describe('HarMediaResourceMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_HARPACKAGE_HARMEDIA_0001
     * @tc.name      testHarMediaResource0001
     * @tc.desc      icon_har media starts with the PNG signature
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarMediaResource0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarMediaResource0001', 'media resource case 1');
      expect(PngProbe.hasSignature(resources().getMediaByNameSync('icon_har'))).assertTrue();
      {
      logCase('testHarMediaResource0002', 'media resource case 2');
      expect(PngProbe.chunkType(resources().getMediaByNameSync('icon_har'))).assertEqual('IHDR');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARMEDIA_0003
     * @tc.name      testHarMediaResource0003
     * @tc.desc      icon_har media width is positive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarMediaResource0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarMediaResource0003', 'media resource case 3');
      expect(PngProbe.width(resources().getMediaByNameSync('icon_har')) > 0).assertTrue();
      {
      logCase('testHarMediaResource0004', 'media resource case 4');
      expect(PngProbe.height(resources().getMediaByNameSync('icon_har')) > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARMEDIA_0005
     * @tc.name      testHarMediaResource0005
     * @tc.desc      icon_har media width fits in 8192 pixels
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarMediaResource0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarMediaResource0005', 'media resource case 5');
      expect(PngProbe.width(resources().getMediaByNameSync('icon_har')) <= 8192).assertTrue();
      {
      logCase('testHarMediaResource0006', 'media resource case 6');
      expect(PngProbe.height(resources().getMediaByNameSync('icon_har')) <= 8192).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARMEDIA_0007
     * @tc.name      testHarMediaResource0007
     * @tc.desc      icon_har media bit depth is 8
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarMediaResource0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarMediaResource0007', 'media resource case 7');
      expect(PngProbe.bitDepth(resources().getMediaByNameSync('icon_har'))).assertEqual(8);
      {
      logCase('testHarMediaResource0008', 'media resource case 8');
      const colourType: number = PngProbe.colourType(resources().getMediaByNameSync('icon_har'));
      const isColourTypeValid: boolean = colourType === 0 || colourType === 2 ||
        colourType === 3 || colourType === 4 || colourType === 6;
      expect(isColourTypeValid).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARMEDIA_0009
     * @tc.name      testHarMediaResource0009
     * @tc.desc      icon_har media length exceeds the header size
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarMediaResource0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarMediaResource0009', 'media resource case 9');
      expect(resources().getMediaByNameSync('icon_har').length > 32).assertTrue();
      {
      logCase('testHarMediaResource0010', 'media resource case 10');
      expect(resources().getMediaByNameSync('icon_har').length > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARMEDIA_0011
     * @tc.name      testHarMediaResource0011
     * @tc.desc      icon_har media ends with an IEND chunk marker
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarMediaResource0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarMediaResource0011', 'media resource case 11');
      const bytes: Uint8Array = resources().getMediaByNameSync('icon_har');
      expect(PngProbe.chunkTypeAt(bytes, bytes.length - 8)).assertEqual('IEND');
      {
      logCase('testHarMediaResource0012', 'media resource case 12');
      expect(PngProbe.hasSignature(resources().getMediaByNameSync('icon_har'))).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARMEDIA_0013
     * @tc.name      testHarMediaResource0013
     * @tc.desc      icon_har media byte 1 is the PNG P character
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarMediaResource0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarMediaResource0013', 'media resource case 13');
      expect(resources().getMediaByNameSync('icon_har')[1]).assertEqual(0x50);
      {
      logCase('testHarMediaResource0014', 'media resource case 14');
      expect(resources().getMediaByNameSync('icon_har')[2]).assertEqual(0x4E);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARMEDIA_0015
     * @tc.name      testHarMediaResource0015
     * @tc.desc      pic_empty media starts with the PNG signature
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarMediaResource0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarMediaResource0015', 'media resource case 15');
      expect(PngProbe.hasSignature(resources().getMediaByNameSync('pic_empty'))).assertTrue();
      {
      logCase('testHarMediaResource0016', 'media resource case 16');
      expect(PngProbe.chunkType(resources().getMediaByNameSync('pic_empty'))).assertEqual('IHDR');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARMEDIA_0017
     * @tc.name      testHarMediaResource0017
     * @tc.desc      pic_empty media width is positive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarMediaResource0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarMediaResource0017', 'media resource case 17');
      expect(PngProbe.width(resources().getMediaByNameSync('pic_empty')) > 0).assertTrue();
      {
      logCase('testHarMediaResource0018', 'media resource case 18');
      expect(PngProbe.height(resources().getMediaByNameSync('pic_empty')) > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARMEDIA_0019
     * @tc.name      testHarMediaResource0019
     * @tc.desc      pic_empty media width fits in 8192 pixels
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarMediaResource0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarMediaResource0019', 'media resource case 19');
      expect(PngProbe.width(resources().getMediaByNameSync('pic_empty')) <= 8192).assertTrue();
      {
      logCase('testHarMediaResource0020', 'media resource case 20');
      expect(PngProbe.height(resources().getMediaByNameSync('pic_empty')) <= 8192).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARMEDIA_0021
     * @tc.name      testHarMediaResource0021
     * @tc.desc      pic_empty media bit depth is 8
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarMediaResource0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarMediaResource0021', 'media resource case 21');
      expect(PngProbe.bitDepth(resources().getMediaByNameSync('pic_empty'))).assertEqual(8);
      {
      logCase('testHarMediaResource0022', 'media resource case 22');
      const colourType: number = PngProbe.colourType(resources().getMediaByNameSync('pic_empty'));
      const isColourTypeValid: boolean = colourType === 0 || colourType === 2 ||
        colourType === 3 || colourType === 4 || colourType === 6;
      expect(isColourTypeValid).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARMEDIA_0023
     * @tc.name      testHarMediaResource0023
     * @tc.desc      pic_empty media length exceeds the header size
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarMediaResource0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarMediaResource0023', 'media resource case 23');
      expect(resources().getMediaByNameSync('pic_empty').length > 32).assertTrue();
      {
      logCase('testHarMediaResource0024', 'media resource case 24');
      expect(resources().getMediaByNameSync('pic_empty').length > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARMEDIA_0025
     * @tc.name      testHarMediaResource0025
     * @tc.desc      pic_empty media ends with an IEND chunk marker
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarMediaResource0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarMediaResource0025', 'media resource case 25');
      const bytes: Uint8Array = resources().getMediaByNameSync('pic_empty');
      expect(PngProbe.chunkTypeAt(bytes, bytes.length - 8)).assertEqual('IEND');
      {
      logCase('testHarMediaResource0026', 'media resource case 26');
      expect(PngProbe.hasSignature(resources().getMediaByNameSync('pic_empty'))).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARMEDIA_0027
     * @tc.name      testHarMediaResource0027
     * @tc.desc      pic_empty media byte 1 is the PNG P character
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarMediaResource0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarMediaResource0027', 'media resource case 27');
      expect(resources().getMediaByNameSync('pic_empty')[1]).assertEqual(0x50);
      {
      logCase('testHarMediaResource0028', 'media resource case 28');
      expect(resources().getMediaByNameSync('pic_empty')[2]).assertEqual(0x4E);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARMEDIA_0029
     * @tc.name      testHarMediaResource0029
     * @tc.desc      background media starts with the PNG signature
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarMediaResource0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarMediaResource0029', 'media resource case 29');
      expect(PngProbe.hasSignature(resources().getMediaByNameSync('background'))).assertTrue();
      {
      logCase('testHarMediaResource0030', 'media resource case 30');
      expect(PngProbe.chunkType(resources().getMediaByNameSync('background'))).assertEqual('IHDR');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARMEDIA_0031
     * @tc.name      testHarMediaResource0031
     * @tc.desc      background media width is positive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarMediaResource0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarMediaResource0031', 'media resource case 31');
      expect(PngProbe.width(resources().getMediaByNameSync('background')) > 0).assertTrue();
      {
      logCase('testHarMediaResource0032', 'media resource case 32');
      expect(PngProbe.height(resources().getMediaByNameSync('background')) > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARMEDIA_0033
     * @tc.name      testHarMediaResource0033
     * @tc.desc      background media width fits in 8192 pixels
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarMediaResource0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarMediaResource0033', 'media resource case 33');
      expect(PngProbe.width(resources().getMediaByNameSync('background')) <= 8192).assertTrue();
      {
      logCase('testHarMediaResource0034', 'media resource case 34');
      expect(PngProbe.height(resources().getMediaByNameSync('background')) <= 8192).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARMEDIA_0035
     * @tc.name      testHarMediaResource0035
     * @tc.desc      background media bit depth is 8
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarMediaResource0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarMediaResource0035', 'media resource case 35');
      expect(PngProbe.bitDepth(resources().getMediaByNameSync('background'))).assertEqual(8);
      {
      logCase('testHarMediaResource0036', 'media resource case 36');
      const colourType: number = PngProbe.colourType(resources().getMediaByNameSync('background'));
      const isColourTypeValid: boolean = colourType === 0 || colourType === 2 ||
        colourType === 3 || colourType === 4 || colourType === 6;
      expect(isColourTypeValid).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARMEDIA_0037
     * @tc.name      testHarMediaResource0037
     * @tc.desc      background media length exceeds the header size
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarMediaResource0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarMediaResource0037', 'media resource case 37');
      expect(resources().getMediaByNameSync('background').length > 32).assertTrue();
      {
      logCase('testHarMediaResource0038', 'media resource case 38');
      expect(resources().getMediaByNameSync('background').length > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARMEDIA_0039
     * @tc.name      testHarMediaResource0039
     * @tc.desc      background media ends with an IEND chunk marker
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarMediaResource0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarMediaResource0039', 'media resource case 39');
      const bytes: Uint8Array = resources().getMediaByNameSync('background');
      expect(PngProbe.chunkTypeAt(bytes, bytes.length - 8)).assertEqual('IEND');
      {
      logCase('testHarMediaResource0040', 'media resource case 40');
      expect(PngProbe.hasSignature(resources().getMediaByNameSync('background'))).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARMEDIA_0041
     * @tc.name      testHarMediaResource0041
     * @tc.desc      background media byte 1 is the PNG P character
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarMediaResource0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarMediaResource0041', 'media resource case 41');
      expect(resources().getMediaByNameSync('background')[1]).assertEqual(0x50);
      {
      logCase('testHarMediaResource0042', 'media resource case 42');
      expect(resources().getMediaByNameSync('background')[2]).assertEqual(0x4E);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARMEDIA_0043
     * @tc.name      testHarMediaResource0043
     * @tc.desc      foreground media starts with the PNG signature
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarMediaResource0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarMediaResource0043', 'media resource case 43');
      expect(PngProbe.hasSignature(resources().getMediaByNameSync('foreground'))).assertTrue();
      {
      logCase('testHarMediaResource0044', 'media resource case 44');
      expect(PngProbe.chunkType(resources().getMediaByNameSync('foreground'))).assertEqual('IHDR');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARMEDIA_0045
     * @tc.name      testHarMediaResource0045
     * @tc.desc      foreground media width is positive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHarMediaResource0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logCase('testHarMediaResource0045', 'media resource case 45');
      expect(PngProbe.width(resources().getMediaByNameSync('foreground')) > 0).assertTrue();
      {
      logCase('testHarMediaResource0046', 'media resource case 46');
      expect(PngProbe.height(resources().getMediaByNameSync('foreground')) > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARMEDIA_0047
     * @tc.name      testHarMediaResource0047
     * @tc.desc      foreground media width fits in 8192 pixels
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarMediaResource0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarMediaResource0047', 'media resource case 47');
      expect(PngProbe.width(resources().getMediaByNameSync('foreground')) <= 8192).assertTrue();
      {
      logCase('testHarMediaResource0048', 'media resource case 48');
      expect(PngProbe.height(resources().getMediaByNameSync('foreground')) <= 8192).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARMEDIA_0049
     * @tc.name      testHarMediaResource0049
     * @tc.desc      foreground media bit depth is 8
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarMediaResource0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarMediaResource0049', 'media resource case 49');
      expect(PngProbe.bitDepth(resources().getMediaByNameSync('foreground'))).assertEqual(8);
      {
      logCase('testHarMediaResource0050', 'media resource case 50');
      const colourType: number = PngProbe.colourType(resources().getMediaByNameSync('foreground'));
      const isColourTypeValid: boolean = colourType === 0 || colourType === 2 ||
        colourType === 3 || colourType === 4 || colourType === 6;
      expect(isColourTypeValid).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARMEDIA_0051
     * @tc.name      testHarMediaResource0051
     * @tc.desc      foreground media length exceeds the header size
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarMediaResource0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarMediaResource0051', 'media resource case 51');
      expect(resources().getMediaByNameSync('foreground').length > 32).assertTrue();
      {
      logCase('testHarMediaResource0052', 'media resource case 52');
      expect(resources().getMediaByNameSync('foreground').length > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARMEDIA_0053
     * @tc.name      testHarMediaResource0053
     * @tc.desc      foreground media ends with an IEND chunk marker
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarMediaResource0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarMediaResource0053', 'media resource case 53');
      const bytes: Uint8Array = resources().getMediaByNameSync('foreground');
      expect(PngProbe.chunkTypeAt(bytes, bytes.length - 8)).assertEqual('IEND');
      {
      logCase('testHarMediaResource0054', 'media resource case 54');
      expect(PngProbe.hasSignature(resources().getMediaByNameSync('foreground'))).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARMEDIA_0055
     * @tc.name      testHarMediaResource0055
     * @tc.desc      foreground media byte 1 is the PNG P character
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarMediaResource0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarMediaResource0055', 'media resource case 55');
      expect(resources().getMediaByNameSync('foreground')[1]).assertEqual(0x50);
      {
      logCase('testHarMediaResource0056', 'media resource case 56');
      expect(resources().getMediaByNameSync('foreground')[2]).assertEqual(0x4E);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARMEDIA_0057
     * @tc.name      testHarMediaResource0057
     * @tc.desc      startIcon media starts with the PNG signature
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarMediaResource0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarMediaResource0057', 'media resource case 57');
      expect(PngProbe.hasSignature(resources().getMediaByNameSync('startIcon'))).assertTrue();
      {
      logCase('testHarMediaResource0058', 'media resource case 58');
      expect(PngProbe.chunkType(resources().getMediaByNameSync('startIcon'))).assertEqual('IHDR');
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARMEDIA_0059
     * @tc.name      testHarMediaResource0059
     * @tc.desc      startIcon media width is positive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarMediaResource0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarMediaResource0059', 'media resource case 59');
      expect(PngProbe.width(resources().getMediaByNameSync('startIcon')) > 0).assertTrue();
      {
      logCase('testHarMediaResource0060', 'media resource case 60');
      expect(PngProbe.height(resources().getMediaByNameSync('startIcon')) > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARMEDIA_0061
     * @tc.name      testHarMediaResource0061
     * @tc.desc      startIcon media width fits in 8192 pixels
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarMediaResource0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarMediaResource0061', 'media resource case 61');
      expect(PngProbe.width(resources().getMediaByNameSync('startIcon')) <= 8192).assertTrue();
      {
      logCase('testHarMediaResource0062', 'media resource case 62');
      expect(PngProbe.height(resources().getMediaByNameSync('startIcon')) <= 8192).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARMEDIA_0063
     * @tc.name      testHarMediaResource0063
     * @tc.desc      startIcon media bit depth is 8
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarMediaResource0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarMediaResource0063', 'media resource case 63');
      expect(PngProbe.bitDepth(resources().getMediaByNameSync('startIcon'))).assertEqual(8);
      {
      logCase('testHarMediaResource0064', 'media resource case 64');
      const colourType: number = PngProbe.colourType(resources().getMediaByNameSync('startIcon'));
      const isColourTypeValid: boolean = colourType === 0 || colourType === 2 ||
        colourType === 3 || colourType === 4 || colourType === 6;
      expect(isColourTypeValid).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARMEDIA_0065
     * @tc.name      testHarMediaResource0065
     * @tc.desc      startIcon media length exceeds the header size
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarMediaResource0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarMediaResource0065', 'media resource case 65');
      expect(resources().getMediaByNameSync('startIcon').length > 32).assertTrue();
      {
      logCase('testHarMediaResource0066', 'media resource case 66');
      expect(resources().getMediaByNameSync('startIcon').length > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARMEDIA_0067
     * @tc.name      testHarMediaResource0067
     * @tc.desc      startIcon media ends with an IEND chunk marker
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarMediaResource0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarMediaResource0067', 'media resource case 67');
      const bytes: Uint8Array = resources().getMediaByNameSync('startIcon');
      expect(PngProbe.chunkTypeAt(bytes, bytes.length - 8)).assertEqual('IEND');
      {
      logCase('testHarMediaResource0068', 'media resource case 68');
      expect(PngProbe.hasSignature(resources().getMediaByNameSync('startIcon'))).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARMEDIA_0069
     * @tc.name      testHarMediaResource0069
     * @tc.desc      startIcon media byte 1 is the PNG P character
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarMediaResource0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarMediaResource0069', 'media resource case 69');
      expect(resources().getMediaByNameSync('startIcon')[1]).assertEqual(0x50);
      {
      logCase('testHarMediaResource0070', 'media resource case 70');
      expect(resources().getMediaByNameSync('startIcon')[2]).assertEqual(0x4E);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARMEDIA_0071
     * @tc.name      testHarMediaResource0071
     * @tc.desc      layered_image media decodes to a layered image descriptor
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarMediaResource0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarMediaResource0071', 'media resource case 71');
      const decoder: util.TextDecoder = util.TextDecoder.create('utf-8');
      const text: string = decoder.decodeToString(resources().getMediaByNameSync('layered_image'));
      expect(text.includes('layered-image')).assertTrue();
      {
      logCase('testHarMediaResource0072', 'media resource case 72');
      const decoder: util.TextDecoder = util.TextDecoder.create('utf-8');
      const text: string = decoder.decodeToString(resources().getMediaByNameSync('layered_image'));
      expect(text.includes('background')).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARMEDIA_0073
     * @tc.name      testHarMediaResource0073
     * @tc.desc      layered_image media mentions a foreground layer
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarMediaResource0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarMediaResource0073', 'media resource case 73');
      const decoder: util.TextDecoder = util.TextDecoder.create('utf-8');
      const text: string = decoder.decodeToString(resources().getMediaByNameSync('layered_image'));
      expect(text.includes('foreground')).assertTrue();
      {
      logCase('testHarMediaResource0074', 'media resource case 74');
      expect(PngProbe.hasSignature(resources().getMediaByNameSync('layered_image'))).assertFalse();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARMEDIA_0075
     * @tc.name      testHarMediaResource0075
     * @tc.desc      icon_har pixel data length stays above 1010 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarMediaResource0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarMediaResource0075', 'media resource case 75');
      expect(resources().getMediaByNameSync('icon_har').length > 1010).assertTrue();
      {
      logCase('testHarMediaResource0076', 'media resource case 76');
      expect(resources().getMediaByNameSync('icon_har').length > 1020).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARMEDIA_0077
     * @tc.name      testHarMediaResource0077
     * @tc.desc      icon_har pixel data length stays above 1030 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarMediaResource0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarMediaResource0077', 'media resource case 77');
      expect(resources().getMediaByNameSync('icon_har').length > 1030).assertTrue();
      {
      logCase('testHarMediaResource0078', 'media resource case 78');
      expect(resources().getMediaByNameSync('icon_har').length > 1040).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARMEDIA_0079
     * @tc.name      testHarMediaResource0079
     * @tc.desc      icon_har pixel data length stays above 1050 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarMediaResource0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarMediaResource0079', 'media resource case 79');
      expect(resources().getMediaByNameSync('icon_har').length > 1050).assertTrue();
      {
      logCase('testHarMediaResource0080', 'media resource case 80');
      expect(resources().getMediaByNameSync('icon_har').length > 1060).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARMEDIA_0081
     * @tc.name      testHarMediaResource0081
     * @tc.desc      icon_har pixel data length stays above 1070 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarMediaResource0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarMediaResource0081', 'media resource case 81');
      expect(resources().getMediaByNameSync('icon_har').length > 1070).assertTrue();
      {
      logCase('testHarMediaResource0082', 'media resource case 82');
      expect(resources().getMediaByNameSync('icon_har').length > 1080).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARMEDIA_0083
     * @tc.name      testHarMediaResource0083
     * @tc.desc      icon_har pixel data length stays above 1090 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarMediaResource0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarMediaResource0083', 'media resource case 83');
      expect(resources().getMediaByNameSync('icon_har').length > 1090).assertTrue();
      {
      logCase('testHarMediaResource0084', 'media resource case 84');
      expect(resources().getMediaByNameSync('icon_har').length > 1100).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARMEDIA_0085
     * @tc.name      testHarMediaResource0085
     * @tc.desc      icon_har pixel data length stays above 1110 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarMediaResource0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarMediaResource0085', 'media resource case 85');
      expect(resources().getMediaByNameSync('icon_har').length > 1110).assertTrue();
      {
      logCase('testHarMediaResource0086', 'media resource case 86');
      expect(resources().getMediaByNameSync('icon_har').length > 1120).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARMEDIA_0087
     * @tc.name      testHarMediaResource0087
     * @tc.desc      icon_har pixel data length stays above 1130 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarMediaResource0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarMediaResource0087', 'media resource case 87');
      expect(resources().getMediaByNameSync('icon_har').length > 1130).assertTrue();
      {
      logCase('testHarMediaResource0088', 'media resource case 88');
      expect(resources().getMediaByNameSync('icon_har').length > 1140).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARMEDIA_0089
     * @tc.name      testHarMediaResource0089
     * @tc.desc      icon_har pixel data length stays above 1150 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarMediaResource0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarMediaResource0089', 'media resource case 89');
      expect(resources().getMediaByNameSync('icon_har').length > 1150).assertTrue();
      {
      logCase('testHarMediaResource0090', 'media resource case 90');
      expect(resources().getMediaByNameSync('icon_har').length > 1160).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARMEDIA_0091
     * @tc.name      testHarMediaResource0091
     * @tc.desc      icon_har pixel data length stays above 1170 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarMediaResource0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarMediaResource0091', 'media resource case 91');
      expect(resources().getMediaByNameSync('icon_har').length > 1170).assertTrue();
      {
      logCase('testHarMediaResource0092', 'media resource case 92');
      expect(resources().getMediaByNameSync('icon_har').length > 1180).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARMEDIA_0093
     * @tc.name      testHarMediaResource0093
     * @tc.desc      icon_har pixel data length stays above 1190 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarMediaResource0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarMediaResource0093', 'media resource case 93');
      expect(resources().getMediaByNameSync('icon_har').length > 1190).assertTrue();
      {
      logCase('testHarMediaResource0094', 'media resource case 94');
      expect(resources().getMediaByNameSync('icon_har').length > 1200).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARMEDIA_0095
     * @tc.name      testHarMediaResource0095
     * @tc.desc      Unknown media name 'icon_har_missing' returns 9001003
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarMediaResource0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarMediaResource0095', 'media resource case 95');
      expect(errorCode(() => resources().getMediaByNameSync('icon_har_missing'))).assertEqual(ERR_RES_NAME_INVALID);
      {
      logCase('testHarMediaResource0096', 'media resource case 96');
      expect(errorCode(() => resources().getMediaByNameSync('Icon_Har'))).assertEqual(ERR_RES_NAME_INVALID);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARMEDIA_0097
     * @tc.name      testHarMediaResource0097
     * @tc.desc      Unknown media name 'media.icon_har' returns 9001003
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarMediaResource0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarMediaResource0097', 'media resource case 97');
      expect(errorCode(() => resources().getMediaByNameSync('media.icon_har'))).assertEqual(ERR_RES_NAME_INVALID);
      {
      logCase('testHarMediaResource0098', 'media resource case 98');
      expect(errorCode(() => resources().getMediaByNameSync('icon_har '))).assertEqual(ERR_RES_NAME_INVALID);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARMEDIA_0099
     * @tc.name      testHarMediaResource0099
     * @tc.desc      Unknown media name 'icon-har' returns 9001003
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarMediaResource0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarMediaResource0099', 'media resource case 99');
      expect(errorCode(() => resources().getMediaByNameSync('icon-har'))).assertEqual(ERR_RES_NAME_INVALID);
      {
      logCase('testHarMediaResource0100', 'media resource case 100');
      expect(errorCode(() => resources().getMediaContentSync(0))).assertEqual(ERR_RES_ID_INVALID);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARMEDIA_0101
     * @tc.name      testHarMediaResource0101
     * @tc.desc      Invalid media id 1 returns 9001001
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarMediaResource0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarMediaResource0101', 'media resource case 101');
      expect(errorCode(() => resources().getMediaContentSync(1))).assertEqual(ERR_RES_ID_INVALID);
      {
      logCase('testHarMediaResource0102', 'media resource case 102');
      expect(errorCode(() => resources().getMediaContentSync(16777215))).assertEqual(ERR_RES_ID_INVALID);
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARMEDIA_0103
     * @tc.name      testHarMediaResource0103
     * @tc.desc      Invalid media id 2147483647 returns 9001001
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarMediaResource0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logCase('testHarMediaResource0103', 'media resource case 103');
      expect(errorCode(() => resources().getMediaContentSync(2147483647))).assertEqual(ERR_RES_ID_INVALID);
      {
      const info: bundleManager.BundleInfo = await selfBundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      const ability: bundleManager.AbilityInfo = moduleInfo.abilitiesInfo[0];
      logCase('testHarMediaResource0104', 'media id case 104');
      expect(PngProbe.hasSignature(resources().getMediaContentSync(info.appInfo.iconId))).assertFalse();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARMEDIA_0105
     * @tc.name      testHarMediaResource0105
     * @tc.desc      ability iconId resolves the layered image
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarMediaResource0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      const ability: bundleManager.AbilityInfo = moduleInfo.abilitiesInfo[0];
      logCase('testHarMediaResource0105', 'media id case 105');
      expect(PngProbe.hasSignature(resources().getMediaContentSync(ability.iconId))).assertFalse();
      {
      const info: bundleManager.BundleInfo = await selfBundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      const ability: bundleManager.AbilityInfo = moduleInfo.abilitiesInfo[0];
      logCase('testHarMediaResource0106', 'media id case 106');
      expect(info.appInfo.iconId > 0).assertTrue();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_HARMEDIA_0107
     * @tc.name      testHarMediaResource0107
     * @tc.desc      ability iconId is positive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHarMediaResource0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      const ability: bundleManager.AbilityInfo = moduleInfo.abilitiesInfo[0];
      logCase('testHarMediaResource0107', 'media id case 107');
      expect(ability.iconId > 0).assertTrue();
      {
      const info: bundleManager.BundleInfo = await selfBundle();
      const moduleInfo: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      const ability: bundleManager.AbilityInfo = moduleInfo.abilitiesInfo[0];
      logCase('testHarMediaResource0108', 'media id case 108');
      expect(resources().getMediaContentSync(info.appInfo.iconId).length > 16).assertTrue();
      expect(resources().getMediaContentSync(ability.iconId).length > 16).assertTrue();
      }
    });

  });
}

class PngProbe {
  static hasSignature(bytes: Uint8Array): boolean {
    const signature: number[] = [0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A];
    if (bytes.length < signature.length) {
      return false;
    }
    return signature.every((value: number, index: number) => bytes[index] === value);
  }

  static chunkType(bytes: Uint8Array): string {
    return PngProbe.chunkTypeAt(bytes, 12);
  }

  static chunkTypeAt(bytes: Uint8Array, offset: number): string {
    if (offset + 4 > bytes.length) {
      return '';
    }
    return String.fromCharCode(bytes[offset], bytes[offset + 1], bytes[offset + 2], bytes[offset + 3]);
  }

  static width(bytes: Uint8Array): number {
    return PngProbe.readUint32(bytes, 16);
  }

  static height(bytes: Uint8Array): number {
    return PngProbe.readUint32(bytes, 20);
  }

  static bitDepth(bytes: Uint8Array): number {
    return bytes[24];
  }

  static colourType(bytes: Uint8Array): number {
    return bytes[25];
  }

  static readUint32(bytes: Uint8Array, offset: number): number {
    return ((bytes[offset] << 24) >>> 0) + (bytes[offset + 1] << 16) + (bytes[offset + 2] << 8) + bytes[offset + 3];
  }
}
