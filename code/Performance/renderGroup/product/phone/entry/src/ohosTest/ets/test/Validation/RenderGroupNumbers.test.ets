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

import { describe, expect, it } from '@ohos/hypium';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { launchEntry, runSerializedUiOperation } from '../Shared/SharedDriver';

class NumberResource {
  public name: string;
  public expected: number;

  constructor(name: string, expected: number) {
    this.name = name;
    this.expected = expected;
  }
}

const NUMBERS: NumberResource[] = [
  new NumberResource('RenderGroup_item_image_height', 20),
  new NumberResource('RenderGroup_item_image_width', 20),
  new NumberResource('RenderGroup_item_image_margin', 15),
  new NumberResource('RenderGroup_item_text_font', 10),
  new NumberResource('RenderGroup_item_text_margin_top', 5),
  new NumberResource('RenderGroup_item_text_width', 50),
  new NumberResource('RenderGroup_item_width', 50),
  new NumberResource('RenderGroup_item_height', 50),
  new NumberResource('RenderGroup_item_borderRadius', 25),
  new NumberResource('RenderGroup_scene_back_image_size', 24),
  new NumberResource('RenderGroup_scene_title_font', 24),
  new NumberResource('RenderGroup_scene_title_lineHeight', 30),
  new NumberResource('RenderGroup_scene_title_margin_left', 16),
  new NumberResource('RenderGroup_scene_row_margin_left', 24),
  new NumberResource('RenderGroup_scene_button_fontSize', 13),
  new NumberResource('RenderGroup_scene_button_borderRadius', 8),
  new NumberResource('RenderGroup_scene_title_button_width', 160),
  new NumberResource('RenderGroup_scene_title_button_height', 30),
  new NumberResource('RenderGroup_scene_button_margin_right', 24),
  new NumberResource('RenderGroup_scene_title_row_height', 56),
  new NumberResource('RenderGroup_scene_GridCol_height', 70),
  new NumberResource('RenderGroupHomePage_title_font', 24),
  new NumberResource('RenderGroupHomePage_title_lineHeight', 30),
  new NumberResource('RenderGroupHomePage_title_height', 30),
  new NumberResource('RenderGroupHomePage_row_height', 56),
  new NumberResource('RenderGroup_scene_button_font', 18),
  new NumberResource('RenderGroup_scene_button_width', 250),
  new NumberResource('RenderGroup_scene_button_height', 60),
  new NumberResource('RenderGroup_scene_button_margin_top', 30),
  new NumberResource('RenderGroup_scene_row_height', 200)
];

export default function renderGroupNumbersTest(): void {
  describe('RenderGroupNumbers', () => {
    for (const fixture of NUMBERS) {
      it(`${fixture.name}PackagedNumberMatchesLayoutContract`, 0, async () => {
        await runSerializedUiOperation(async () => {
          await launchEntry();
          const delegator = abilityDelegatorRegistry.getAbilityDelegator();
          const entry = await delegator.getCurrentTopAbility();
          const actual = entry.context.resourceManager.getNumberByName(fixture.name);
          expect(actual).assertEqual(fixture.expected);
        });
      });
    }
  });
}
