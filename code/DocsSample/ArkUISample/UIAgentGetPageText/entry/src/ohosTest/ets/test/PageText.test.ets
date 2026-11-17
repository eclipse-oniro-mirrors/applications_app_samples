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
import { describe, it, expect, beforeAll } from '@ohos/hypium';
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import { PageTextResult } from '../../../main/ets/common/PageText';

export default function pageTextTest(): void {
  describe('UIAgentGetPageText', () => {
    const driver = Driver.create();

    const click = async (id: string): Promise<void> => {
      const component = await driver.findComponent(ON.id(id));
      await component.click();
      await driver.delayMs(500);
    };

    const collect = async (): Promise<string[]> => {
      await click('collectText');
      const result = await driver.findComponent(ON.id('pageTextJson'));
      const json = await result.getText();
      // Parse independently so a non-JSON success string cannot pass the test.
      const parsed = JSON.parse(json) as PageTextResult;
      expect(parsed.schemaVersion).assertEqual(1);
      expect(parsed.texts.length > 0).assertTrue();
      for (const item of parsed.texts) {
        expect(Number.isInteger(item.id)).assertTrue();
        expect(item.rect.length).assertEqual(4);
        for (const coordinate of item.rect) {
          expect(Number.isFinite(coordinate)).assertTrue();
        }
        expect(item.rect[2] >= 0 && item.rect[3] >= 0).assertTrue();
      }
      await click('backToSample');
      return parsed.texts.map(item => item.content);
    };

    beforeAll(async () => {
      const delegator = abilityDelegatorRegistry.getAbilityDelegator();
      const bundleName = abilityDelegatorRegistry.getArguments().bundleName;
      await delegator.startAbility({ bundleName: bundleName, abilityName: 'EntryAbility' });
      await driver.delayMs(1000);
    });

    it('initial_text_and_unicode', 0, async () => {
      const text = await driver.findComponent(ON.id('sampleText'));
      const expected = await text.getText();
      const unicode = await driver.findComponent(ON.id('unicodeText'));
      const expectedUnicode = await unicode.getText();
      const input = await driver.findComponent(ON.id('sampleInput'));
      const placeholder = await input.getHint();
      const json = await collect();
      expect(json.includes(expected)).assertTrue();
      expect(json.includes(expectedUnicode)).assertTrue();
      expect(json.includes(placeholder)).assertTrue();
    });

    it('updated_text_replaces_previous_text', 0, async () => {
      const text = await driver.findComponent(ON.id('sampleText'));
      const previous = await text.getText();
      await click('updateText');
      const updated = await driver.findComponent(ON.id('sampleText'));
      const expected = await updated.getText();
      const json = await collect();
      expect(json.includes(expected)).assertTrue();
      expect(json.includes(previous)).assertFalse();
    });

    it('ordinary_input_text_is_excluded', 0, async () => {
      const input = await driver.findComponent(ON.id('sampleInput'));
      await input.inputText('PageTextInput123');
      await driver.pressBack();
      await driver.delayMs(500);
      const json = await collect();
      expect(json.includes('PageTextInput123')).assertFalse();
    });

    it('repeated_collection_excludes_result_page', 0, async () => {
      for (let index = 0; index < 5; index++) {
        const json = await collect();
        expect(json.some(content => content.includes('Hello ArkUI'))).assertTrue();
        expect(json.some(content => content.includes('"schemaVersion"'))).assertFalse();
      }
    });
  });
}
