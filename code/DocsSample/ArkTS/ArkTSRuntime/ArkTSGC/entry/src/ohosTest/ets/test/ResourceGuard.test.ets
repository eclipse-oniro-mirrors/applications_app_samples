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
  argbFromHex,
  ENTRY_MODULE,
  entryContext,
  ERR_RES_ID_INVALID,
  ERR_RES_NAME_INVALID,
  errorCode,
  findModule,
  PngOracle,
  selfBundle
} from './shared/AppProbe';
import { paceTurn } from './shared/TestPace';
import { logCase } from './shared/TestLog';

class StringRow {
  name: string;
  value: string;

  constructor(name: string, value: string) {
    this.name = name;
    this.value = value;
  }
}

class PngRow {
  name: string;
  side: number;

  constructor(name: string, side: number) {
    this.name = name;
    this.side = side;
  }
}

const STRING_TABLE: StringRow[] = [
  new StringRow('app_name', 'ArkTSGC'),
  new StringRow('module_desc', 'module description'),
  new StringRow('EntryAbility_desc', 'description'),
  new StringRow('EntryAbility_label', 'ArkTSGC'),
  new StringRow('index_title', 'ArkTS GC垃圾回收'),
  new StringRow('hint_gc_page', 'ArkTools.hintGC() 使用示例')
];
// the build scales the 1024 px layered icon layers down to 512 px
const PNG_TABLE: PngRow[] = [
  new PngRow('startIcon', 144), new PngRow('foreground', 512), new PngRow('background', 512)
];
const MEDIA_REF: RegExp = /^\$media:(\d+)$/;
const FLOAT_NAMES: string[] = ['page_text_font_size', 'index_text_font_size'];
const FONT_SIZE_FP: number = 50;
const LIGHT_BACKGROUND: string = '#FFFFFF';
const DARK_BACKGROUND: string = '#000000';
const BACKGROUND_NAME: string = 'start_window_background';
const START_ICON_BYTES: number = 20093;
const BAD_NAMES: string[] = [
  'app_name_missing', 'App_Name', 'APP_NAME', 'app_name ', 'index-title', '方舟', 'string.app_name'
];
const BAD_IDS: number[] = [1, 0x7fffffff, 16777215];

// the build rewrites '$media:name' layer references to '$media:<id>'
function mediaRefId(reference: string): number {
  const match: RegExpMatchArray | null = reference.match(MEDIA_REF);
  return match === null ? -1 : Number(match[1]);
}

function sameBytes(a: Uint8Array, b: Uint8Array): boolean {
  return a.length === b.length && a.every((value: number, index: number) => value === b[index]);
}

function resources(): resourceManager.ResourceManager {
  return entryContext().resourceManager;
}

function darkResources(): resourceManager.ResourceManager {
  const manager: resourceManager.ResourceManager = resources();
  const config: resourceManager.Configuration = manager.getOverrideConfiguration();
  config.colorMode = resourceManager.ColorMode.DARK;
  return manager.getOverrideResourceManager(config);
}

function lightResources(): resourceManager.ResourceManager {
  const manager: resourceManager.ResourceManager = resources();
  const config: resourceManager.Configuration = manager.getOverrideConfiguration();
  config.colorMode = resourceManager.ColorMode.LIGHT;
  return manager.getOverrideResourceManager(config);
}

export default function resourceGuardTest() {
  describe('ResourceGuard', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESOURCE_0100
     * @tc.name      testResourceStringTable0001
     * @tc.desc      Read every string declared by the app and the entry module by name and compare each with
     *               string.json
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testResourceStringTable0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const wrong: string[] = STRING_TABLE
        .filter((row: StringRow) => resources().getStringByNameSync(row.name) !== row.value)
        .map((row: StringRow) => row.name);
      logCase('testResourceStringTable0001', `wrongCount=${wrong.length} wrong=${wrong.join(',')}`);
      expect(resources().getStringByNameSync('app_name'))
        .assertEqual(resources().getStringByNameSync('EntryAbility_label'));
      expect(wrong.length).assertEqual(0);
      expect(resources().getStringByNameSync('index_title').indexOf('GC') > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESOURCE_0200
     * @tc.name      testResourceAsyncSame0001
     * @tc.desc      Read the strings with the promise API and check every value matches the synchronous read
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResourceAsyncSame0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const asyncValues: string[] = [];
      for (const row of STRING_TABLE) {
        asyncValues.push(await resources().getStringByName(row.name));
      }
      const syncValues: string[] = STRING_TABLE.map((row: StringRow) => resources().getStringByNameSync(row.name));
      logCase('testResourceAsyncSame0001', `asyncCount=${asyncValues.length} syncCount=${syncValues.length} ` +
        `async=${asyncValues.join('|')} sync=${syncValues.join('|')}`);
      expect(new Set<string>(asyncValues).size).assertEqual(STRING_TABLE.length - 1);
      expect(asyncValues.join('|')).assertEqual(syncValues.join('|'));
      expect(asyncValues.join('|')).assertEqual(STRING_TABLE.map((row: StringRow) => row.value).join('|'));
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESOURCE_0300
     * @tc.name      testResourceIdMatchesName0001
     * @tc.desc      Read the label and description by the ids from bundle info and check they match the reads by name
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResourceIdMatchesName0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      const ability: bundleManager.AbilityInfo = entry.abilitiesInfo[0];
      logCase('testResourceIdMatchesName0001', `labelId=${info.appInfo.labelId} moduleDescId=${entry.descriptionId} ` +
        `abilityDescId=${ability.descriptionId} abilityLabelId=${ability.labelId}`);
      expect(resources().getStringSync(info.appInfo.labelId)).assertEqual(resources().getStringByNameSync('app_name'));
      expect(resources().getStringSync(entry.descriptionId))
        .assertEqual(resources().getStringByNameSync('module_desc'));
      expect(resources().getStringSync(ability.descriptionId))
        .assertEqual(resources().getStringByNameSync('EntryAbility_desc'));
      expect(resources().getStringSync(ability.labelId))
        .assertEqual(resources().getStringByNameSync('EntryAbility_label'));
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESOURCE_0400
     * @tc.name      testResourceFloats0001
     * @tc.desc      Read both font size floats and check they equal the 50fp value and match each other
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResourceFloats0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const values: number[] = FLOAT_NAMES.map((name: string) => resources().getNumberByName(name));
      logCase('testResourceFloats0001', `names=${FLOAT_NAMES.join(',')} values=${values.join(',')} ` +
        `expected=${FONT_SIZE_FP}`);
      expect(values.every((value: number) => value === FONT_SIZE_FP)).assertTrue();
      expect(errorCode(() => resources().getColorByNameSync(FLOAT_NAMES[1]))).assertEqual(ERR_RES_NAME_INVALID);
      expect(errorCode(() => resources().getStringByNameSync(FLOAT_NAMES[0]))).assertEqual(ERR_RES_NAME_INVALID);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESOURCE_0500
     * @tc.name      testResourceColorModes0001
     * @tc.desc      Read the start window background under light and dark overrides and check white and black are
     *               returned
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResourceColorModes0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const light: number = lightResources().getColorByNameSync(BACKGROUND_NAME);
      const dark: number = darkResources().getColorByNameSync(BACKGROUND_NAME);
      logCase('testResourceColorModes0001', `light=${light} dark=${dark} name=${BACKGROUND_NAME}`);
      expect(light).assertEqual(argbFromHex(LIGHT_BACKGROUND));
      expect(dark).assertEqual(argbFromHex(DARK_BACKGROUND));
      expect(light === dark).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESOURCE_0600
     * @tc.name      testResourceColorCurrent0001
     * @tc.desc      Check the background color under the current configuration matches the color mode the device
     *               reports
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testResourceColorCurrent0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const config: resourceManager.Configuration = resources().getConfigurationSync();
      const current: number = resources().getColorByNameSync(BACKGROUND_NAME);
      const expected: string = config.colorMode === resourceManager.ColorMode.DARK ? DARK_BACKGROUND : LIGHT_BACKGROUND;
      logCase('testResourceColorCurrent0001', `colorMode=${config.colorMode} deviceType=${config.deviceType} ` +
        `current=${current} expected=${expected}`);
      expect(current).assertEqual(argbFromHex(expected));
      expect(config.deviceType).assertEqual(resourceManager.DeviceType.DEVICE_TYPE_PHONE);
      expect(current >>> 24).assertEqual(0xFF);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESOURCE_0700
     * @tc.name      testResourcePngTable0001
     * @tc.desc      Decode the header of every png media and check signature, IHDR chunk, square size, bit depth and
     *               RGBA type
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResourcePngTable0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const broken: string[] = [];
      for (const row of PNG_TABLE) {
        const bytes: Uint8Array = resources().getMediaByNameSync(row.name);
        const valid: boolean = PngOracle.hasSignature(bytes) && PngOracle.firstChunkType(bytes) === 'IHDR' &&
          PngOracle.width(bytes) === row.side && PngOracle.height(bytes) === row.side &&
          PngOracle.bitDepth(bytes) === 8 && PngOracle.colorType(bytes) === 6;
        if (!valid) {
          broken.push(`${row.name}:${PngOracle.firstChunkType(bytes)}:` +
            `${PngOracle.width(bytes)}x${PngOracle.height(bytes)}:` +
            `${PngOracle.bitDepth(bytes)}:${PngOracle.colorType(bytes)}:${bytes.length}`);
        }
      }
      logCase('testResourcePngTable0001', `brokenCount=${broken.length} broken=${broken.join(',')}`);
      expect(sameBytes(resources().getMediaByNameSync('foreground'), resources().getMediaByNameSync('background')))
        .assertFalse();
      expect(broken.join(',')).assertEqual('');
      expect(resources().getMediaByNameSync('startIcon').length).assertEqual(START_ICON_BYTES);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESOURCE_0800
     * @tc.name      testResourceLayeredImage0001
     * @tc.desc      Read the layered image json and check its two layer ids resolve to the background and foreground
     *               pngs
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResourceLayeredImage0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bytes: Uint8Array = resources().getMediaByNameSync('layered_image');
      const text: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      const parsed: Record<string, Record<string, string>> = JSON.parse(text) as Record<string, Record<string, string>>;
      const layers: Record<string, string> = parsed['layered-image'];
      const backgroundId: number = mediaRefId(layers['background']);
      const foregroundId: number = mediaRefId(layers['foreground']);
      logCase('testResourceLayeredImage0001', `bytesLength=${bytes.length} textLength=${text.length} ` +
        `backgroundId=${backgroundId} foregroundId=${foregroundId}`);
      expect(Object.keys(parsed).join(',')).assertEqual('layered-image');
      expect(backgroundId > 0 && foregroundId > 0 && backgroundId !== foregroundId).assertTrue();
      expect(sameBytes(resources().getMediaContentSync(backgroundId), resources().getMediaByNameSync('background')))
        .assertTrue();
      expect(sameBytes(resources().getMediaContentSync(foregroundId), resources().getMediaByNameSync('foreground')))
        .assertTrue();
      expect(PngOracle.hasSignature(bytes)).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESOURCE_0900
     * @tc.name      testResourceBadNames0001
     * @tc.desc      Ask for strings, colors and media with misspelled names and check each is rejected with 9001003
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testResourceBadNames0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const stringCodes: number[] =
        BAD_NAMES.map((name: string) => errorCode(() => resources().getStringByNameSync(name)));
      const colorCodes: number[] =
        BAD_NAMES.map((name: string) => errorCode(() => resources().getColorByNameSync(name)));
      const mediaCodes: number[] =
        BAD_NAMES.map((name: string) => errorCode(() => resources().getMediaByNameSync(name)));
      logCase('testResourceBadNames0001', `stringCodes=${stringCodes.join(',')} colorCodes=${colorCodes.join(',')} ` +
        `mediaCodes=${mediaCodes.join(',')}`);
      expect(stringCodes.every((code: number) => code === ERR_RES_NAME_INVALID)).assertTrue();
      expect(colorCodes.every((code: number) => code === ERR_RES_NAME_INVALID)).assertTrue();
      expect(mediaCodes.every((code: number) => code === ERR_RES_NAME_INVALID)).assertTrue();
      expect(errorCode(() => resources().getStringByNameSync('app_name'))).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESOURCE_1000
     * @tc.name      testResourceBadIds0001
     * @tc.desc      Ask for strings with ids that belong to no resource and check each is rejected with 9001001
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testResourceBadIds0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const labelId: number = (await selfBundle()).appInfo.labelId;
      const codes: number[] = BAD_IDS.map((id: number) => errorCode(() => resources().getStringSync(id)));
      logCase('testResourceBadIds0001', `labelId=${labelId} badIds=${BAD_IDS.join(',')} codes=${codes.join(',')}`);
      expect(errorCode(() => resources().getMediaContentSync(BAD_IDS[1]))).assertEqual(ERR_RES_ID_INVALID);
      expect(codes.every((code: number) => code === ERR_RES_ID_INVALID)).assertTrue();
      expect(errorCode(() => resources().getStringSync(labelId))).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESOURCE_1100
     * @tc.name      testResourceWrongType0001
     * @tc.desc      Read a string resource as a color and a color as a string and check both reads are rejected
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testResourceWrongType0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const colorAsString: number = errorCode(() => resources().getStringByNameSync(BACKGROUND_NAME));
      const stringAsColor: number = errorCode(() => resources().getColorByNameSync('app_name'));
      logCase('testResourceWrongType0001', `colorAsString=${colorAsString} stringAsColor=${stringAsColor}`);
      expect(colorAsString).assertEqual(ERR_RES_NAME_INVALID);
      expect(stringAsColor).assertEqual(ERR_RES_NAME_INVALID);
      expect(resources().getColorByNameSync(BACKGROUND_NAME) !== 0).assertTrue();
    });
  });
}
