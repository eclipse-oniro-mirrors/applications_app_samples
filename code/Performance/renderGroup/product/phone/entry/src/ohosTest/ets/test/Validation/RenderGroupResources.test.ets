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

import { describe, it, expect } from '@ohos/hypium';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import resourceManager from '@ohos.resourceManager';
import util from '@ohos.util';
import image from '@ohos.multimedia.image';
import { BusinessError } from '@ohos.base';
import {
  HOME_TITLE, PROFIT, NON_PROFIT, ON_LABEL, OFF_LABEL, launchEntry, runSerializedUiOperation
} from '../Shared/SharedDriver';

class StringResource {
  public name: string;
  public expected: string;

  constructor(name: string, expected: string) {
    this.name = name;
    this.expected = expected;
  }
}

const STRINGS: StringResource[] = [
  new StringResource('RenderGroupHomePage_title', HOME_TITLE),
  new StringResource('RenderGroup_profit_scene_button_title', PROFIT.title),
  new StringResource('RenderGroup_nonProfit_scene_button_title', NON_PROFIT.title),
  new StringResource('RenderGroup_profit_scene_title', PROFIT.title),
  new StringResource('RenderGroup_nonProfit_scene_title', NON_PROFIT.title),
  new StringResource('RenderGroup_button_on', ON_LABEL),
  new StringResource('RenderGroup_button_off', OFF_LABEL),
  new StringResource('layout_100_percent', '100%'),
  new StringResource('layout_17_percent', '17%')
];

class IconResource {
  public name: string;
  public width: number;
  public height: number;

  constructor(name: string, width: number, height: number) {
    this.name = name;
    this.width = width;
    this.height = height;
  }
}

const ICONS: IconResource[] = [
  new IconResource('back', 20, 18),
  new IconResource('album', 22, 22),
  new IconResource('applet', 22, 22),
  new IconResource('cards', 22, 22),
  new IconResource('nearby', 18, 22),
  new IconResource('scan', 20, 20),
  new IconResource('shop', 20, 20)
];

const MISSING_RESOURCE: string = 'renderGroup_test_missing_resource';
const RESOURCE_NAME_ERROR_CODES: number[] = [9001003, 9001004];

class ColorResource {
  public name: string;
  public argb: number;

  constructor(name: string, argb: number) {
    this.name = name;
    this.argb = argb;
  }
}

const COLORS: ColorResource[] = [
  new ColorResource('RenderGroup_item_text_fontColor', 0xff182431),
  new ColorResource('RenderGroup_item_backgroundColor', 0xffe3e3e3),
  new ColorResource('RenderGroup_scene_button_backgroundColor', 0xff317aff)
];

async function assertMissingResource(lookup: () => Promise<void>): Promise<void> {
  let errorCode = 0;
  try {
    await lookup();
  } catch (error) {
    errorCode = (error as BusinessError).code;
  }
  expect(RESOURCE_NAME_ERROR_CODES).assertContain(errorCode);
}

async function withEntryResources(check: (manager: resourceManager.ResourceManager) => Promise<void>): Promise<void> {
  await runSerializedUiOperation(async () => {
    await launchEntry();
    const delegator = abilityDelegatorRegistry.getAbilityDelegator();
    const entry = await delegator.getCurrentTopAbility();
    await check(entry.context.resourceManager);
  });
}

export default function renderGroupResourcesTest(): void {
  describe('RenderGroupResources', () => {
    it('packagedHomeTitleFitsItsLineAndToolbar', 0, async () => {
      await withEntryResources(async (manager: resourceManager.ResourceManager) => {
        const font = manager.getNumberByName('RenderGroupHomePage_title_font');
        const line = manager.getNumberByName('RenderGroupHomePage_title_lineHeight');
        const height = manager.getNumberByName('RenderGroupHomePage_title_height');
        const toolbar = manager.getNumberByName('RenderGroupHomePage_row_height');
        expect(font > 0).assertTrue();
        expect(line >= font).assertTrue();
        expect(height >= line).assertTrue();
        expect(toolbar >= height).assertTrue();
      });
    });

    it('packagedSceneTitleFitsItsLineAndToolbar', 0, async () => {
      await withEntryResources(async (manager: resourceManager.ResourceManager) => {
        const font = manager.getNumberByName('RenderGroup_scene_title_font');
        const line = manager.getNumberByName('RenderGroup_scene_title_lineHeight');
        const toolbar = manager.getNumberByName('RenderGroup_scene_title_row_height');
        expect(font > 0).assertTrue();
        expect(line >= font).assertTrue();
        expect(toolbar >= line).assertTrue();
      });
    });

    it('packagedCircularItemRadiusMatchesBothDimensions', 0, async () => {
      await withEntryResources(async (manager: resourceManager.ResourceManager) => {
        const width = manager.getNumberByName('RenderGroup_item_width');
        const height = manager.getNumberByName('RenderGroup_item_height');
        const radius = manager.getNumberByName('RenderGroup_item_borderRadius');
        expect(radius > 0).assertTrue();
        expect(width).assertEqual(radius * 2);
        expect(height).assertEqual(radius * 2);
      });
    });

    for (const fixture of STRINGS) {
      it(`${fixture.name}ResolvesFromEntry`, 0, async () => {
        await withEntryResources(async (manager: resourceManager.ResourceManager) => {
          const actual = manager.getStringByNameSync(fixture.name);
          expect(actual).assertEqual(fixture.expected);
        });
      });
    }

    for (const fixture of COLORS) {
      it(`${fixture.name}ResolvesToExpectedArgb`, 0, async () => {
        await withEntryResources(async (manager: resourceManager.ResourceManager) => {
          const actual = manager.getColorByNameSync(fixture.name) >>> 0;
          expect(actual).assertEqual(fixture.argb);
        });
      });
    }

    it('missingColorDoesNotFallBackToGridBackground', 0, async () => {
      await withEntryResources(async (manager: resourceManager.ResourceManager) => {
        await assertMissingResource(async () => {
          manager.getColorByNameSync(MISSING_RESOURCE);
        });
        const actual = manager.getColorByNameSync('RenderGroup_item_backgroundColor') >>> 0;
        expect(actual).assertEqual(0xffe3e3e3);
      });
    });

    it('missingStringDoesNotFallBackToSwitchLabel', 0, async () => {
      await withEntryResources(async (manager: resourceManager.ResourceManager) => {
        await assertMissingResource(async () => {
          manager.getStringByNameSync(MISSING_RESOURCE);
        });
        const actual = manager.getStringByNameSync('RenderGroup_button_off');
        expect(actual).assertEqual(OFF_LABEL);
      });
    });

    it('missingNumberDoesNotFallBackToGridCellHeight', 0, async () => {
      await withEntryResources(async (manager: resourceManager.ResourceManager) => {
        await assertMissingResource(async () => {
          manager.getNumberByName(MISSING_RESOURCE);
        });
        const actual = manager.getNumberByName('RenderGroup_scene_GridCol_height');
        expect(actual).assertEqual(70);
      });
    });

    it('missingMediaRejectsWithoutInvalidatingPackagedBackIcon', 0, async () => {
      await withEntryResources(async (manager: resourceManager.ResourceManager) => {
        await assertMissingResource(async () => {
          await manager.getMediaByName(MISSING_RESOURCE);
        });
        const actual = await manager.getMediaByName('back');
        expect(actual.byteLength > 0).assertTrue();
      });
    });

    for (const icon of ICONS) {
      it(`${icon.name}SvgDecodesToExpectedDimensions`, 0, async () => {
        await withEntryResources(async (manager: resourceManager.ResourceManager) => {
          const bytes = await manager.getMediaByName(icon.name);
          const decoder = new util.TextDecoder('utf-8');
          const svg = decoder.decodeWithStream(bytes);
          expect(/<svg\b/.test(svg)).assertTrue();
          const source = image.createImageSource(bytes.buffer.slice(bytes.byteOffset, bytes.byteOffset + bytes.byteLength));
          try {
            const pixels = await source.createPixelMap();
            try {
              const info = await pixels.getImageInfo();
              expect(info.size.width).assertEqual(icon.width);
              expect(info.size.height).assertEqual(icon.height);
            } finally {
              await pixels.release();
            }
          } finally {
            await source.release();
          }
        });
      });
    }

    it('packagedGridCellFitsIconContent', 0, async () => {
      await withEntryResources(async (manager: resourceManager.ResourceManager) => {
        const cell = manager.getNumberByName('RenderGroup_scene_GridCol_height');
        const item = manager.getNumberByName('RenderGroup_item_height');
        const imageHeight = manager.getNumberByName('RenderGroup_item_image_height');
        const textMargin = manager.getNumberByName('RenderGroup_item_text_margin_top');
        const textFont = manager.getNumberByName('RenderGroup_item_text_font');
        expect(cell).assertEqual(70);
        expect(item).assertEqual(50);
        expect(imageHeight > 0 && textFont > 0 && textMargin >= 0).assertTrue();
        expect(item >= imageHeight + textMargin + textFont).assertTrue();
        expect(cell >= item).assertTrue();
      });
    });

    it('packagedToolbarFitsSwitchAndBackImage', 0, async () => {
      await withEntryResources(async (manager: resourceManager.ResourceManager) => {
        const toolbar = manager.getNumberByName('RenderGroup_scene_title_row_height');
        const button = manager.getNumberByName('RenderGroup_scene_title_button_height');
        const back = manager.getNumberByName('RenderGroup_scene_back_image_size');
        expect(toolbar).assertEqual(56);
        expect(button).assertEqual(30);
        expect(back).assertEqual(24);
        expect(toolbar >= button && toolbar >= back).assertTrue();
      });
    });

    it('packagedIconWidthFitsItemAndText', 0, async () => {
      await withEntryResources(async (manager: resourceManager.ResourceManager) => {
        const item = manager.getNumberByName('RenderGroup_item_width');
        const icon = manager.getNumberByName('RenderGroup_item_image_width');
        const margin = manager.getNumberByName('RenderGroup_item_image_margin');
        const text = manager.getNumberByName('RenderGroup_item_text_width');
        expect(item).assertEqual(50);
        expect(icon).assertEqual(20);
        expect(text).assertEqual(50);
        expect(margin >= 0 && item >= icon + margin).assertTrue();
        expect(item >= text).assertTrue();
      });
    });
  });
}
