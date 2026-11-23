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
import { describe, it, expect, beforeAll, beforeEach, afterEach } from '@ohos/hypium';
import type { UIAbility } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import type { Component as TestComponent } from '@kit.TestKit';
import type { PageTextItem, PageTextResult } from '@sample/uiagentgetpagetext';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_UIAgentGetPageText]';
const INPUT_TEXT: string = 'PageTextInput123';

function assertContent(contents: string[], target: string, expected: boolean, label: string): void {
  const actual: boolean = contents.includes(target);
  hilog.info(DOMAIN, TAG, 'assert=%{public}s actual=%{public}s expected=%{public}s targetLength=%{public}d',
    label, String(actual), String(expected), target.length);
  expect(actual).assertEqual(expected);
}

export default function pageTextTest(): void {
  describe('UIAgentGetPageText', (): void => {
    const driver: Driver = Driver.create();
    let originalText: string = '';

    const click: (id: string) => Promise<void> = async (id: string): Promise<void> => {
      const component: TestComponent = await driver.findComponent(ON.id(id));
      await component.click();
      await driver.delayMs(500);
    };

    const restoreSamplePage: (phase: string) => Promise<void> = async (phase: string): Promise<void> => {
      hilog.info(DOMAIN, TAG, 'restoreSamplePage phase=%{public}s begin', phase);
      const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      const bundleName: string = abilityDelegatorRegistry.getArguments().bundleName;
      await delegator.startAbility({ bundleName: bundleName, abilityName: 'EntryAbility' });
      await driver.delayMs(500);

      // 采集断言失败时，结果组件可能仍处于显示状态。
      const backButtons: TestComponent[] | null = await driver.findComponents(ON.id('backToSample'));
      if (backButtons !== null && backButtons.length > 0) {
        await click('backToSample');
      }
      const input: TestComponent = await driver.findComponent(ON.id('sampleInput'));
      await input.clearText();
      await input.click();
      await driver.delayMs(300);
      await driver.pressBack();
      // 没有软键盘时，返回操作可能会使 Ability 离开前台；再次将其调回前台。
      await delegator.startAbility({ bundleName: bundleName, abilityName: 'EntryAbility' });
      await driver.delayMs(500);

      const sample: TestComponent = await driver.findComponent(ON.id('sampleText'));
      const currentText: string = await sample.getText();
      if (currentText !== originalText) {
        await click('updateText');
      }
      const restoredInput: TestComponent = await driver.findComponent(ON.id('sampleInput'));
      const restoredInputText: string = await restoredInput.getText();
      hilog.info(DOMAIN, TAG, 'phase=%{public}s inputLength=%{public}d expected=0', phase, restoredInputText.length);
      expect(restoredInputText.length).assertEqual(0);
      const restoredSample: TestComponent = await driver.findComponent(ON.id('sampleText'));
      const restoredText: string = await restoredSample.getText();
      const originalRestored: boolean = restoredText === originalText;
      hilog.info(DOMAIN, TAG, 'phase=%{public}s originalRestored=%{public}s expected=true',
        phase, String(originalRestored));
      expect(originalRestored).assertTrue();
      hilog.info(DOMAIN, TAG, 'restoreSamplePage phase=%{public}s end', phase);
    };

    const collect: () => Promise<string[]> = async (): Promise<string[]> => {
      await click('collectText');
      const result: TestComponent = await driver.findComponent(ON.id('pageTextJson'));
      const json: string = await result.getText();
      // 独立于 Library 解析器进行解析，以检查 API 返回结果。
      const parsed: PageTextResult = JSON.parse(json) as PageTextResult;
      hilog.info(DOMAIN, TAG, 'schemaVersion=%{public}d expected=1', parsed.schemaVersion);
      expect(parsed.schemaVersion).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'textCount=%{public}d expectedGreaterThan=0', parsed.texts.length);
      expect(parsed.texts.length > 0).assertTrue();
      for (let index: number = 0; index < parsed.texts.length; index++) {
        const item: PageTextItem = parsed.texts[index];
        const validId: boolean = Number.isInteger(item.id);
        hilog.info(DOMAIN, TAG, 'nodeId=%{public}d isInteger=%{public}s expected=true', item.id, String(validId));
        expect(validId).assertTrue();
        hilog.info(DOMAIN, TAG, 'nodeId=%{public}d rectLength=%{public}d expected=4', item.id, item.rect.length);
        expect(item.rect.length).assertEqual(4);
        for (let coordinateIndex: number = 0; coordinateIndex < item.rect.length; coordinateIndex++) {
          const coordinate: number = item.rect[coordinateIndex];
          const finite: boolean = Number.isFinite(coordinate);
          hilog.info(DOMAIN, TAG, 'coordinate=%{public}s isFinite=%{public}s expected=true',
            String(coordinate), String(finite));
          expect(finite).assertTrue();
        }
        hilog.info(DOMAIN, TAG, 'width=%{public}s height=%{public}s expectedNonNegative=true',
          String(item.rect[2]), String(item.rect[3]));
        expect(item.rect[2] >= 0 && item.rect[3] >= 0).assertTrue();
      }
      await click('backToSample');
      return parsed.texts.map((item: PageTextItem): string => item.content);
    };

    beforeAll(async (): Promise<void> => {
      const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      const bundleName: string = abilityDelegatorRegistry.getArguments().bundleName;
      await delegator.startAbility({ bundleName: bundleName, abilityName: 'EntryAbility' });
      await driver.delayMs(1000);
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      originalText = ability.context.resourceManager.getStringByNameSync('original_text');
    });

    beforeEach(async (): Promise<void> => {
      // 当运行器跳过 afterEach 钩子时，也恢复失败用例留下的状态。
      await restoreSamplePage('beforeEach');
    });

    afterEach(async (): Promise<void> => {
      await restoreSamplePage('afterEach');
    });

    // 验证初始文本、Unicode 文本和可见占位符。
    it('UIAgentGetPageText_InitialTextAndUnicode_001', 0, async (): Promise<void> => {
      const caseName: string = 'UIAgentGetPageText_InitialTextAndUnicode_001';
      hilog.info(DOMAIN, TAG, '%{public}s begin', caseName);
      try {
        const text: TestComponent = await driver.findComponent(ON.id('sampleText'));
        const expected: string = await text.getText();
        const unicode: TestComponent = await driver.findComponent(ON.id('unicodeText'));
        const expectedUnicode: string = await unicode.getText();
        const input: TestComponent = await driver.findComponent(ON.id('sampleInput'));
        const placeholder: string = await input.getHint();
        const contents: string[] = await collect();
        assertContent(contents, expected, true, 'initialText');
        assertContent(contents, expectedUnicode, true, 'unicodeText');
        assertContent(contents, placeholder, true, 'visiblePlaceholder');
      } finally {
        hilog.info(DOMAIN, TAG, '%{public}s end', caseName);
      }
    });

    // 验证更新组件后会替换之前采集的文本。
    it('UIAgentGetPageText_UpdateText_002', 0, async (): Promise<void> => {
      const caseName: string = 'UIAgentGetPageText_UpdateText_002';
      hilog.info(DOMAIN, TAG, '%{public}s begin', caseName);
      try {
        const text: TestComponent = await driver.findComponent(ON.id('sampleText'));
        const previous: string = await text.getText();
        await click('updateText');
        const updated: TestComponent = await driver.findComponent(ON.id('sampleText'));
        const expected: string = await updated.getText();
        const contents: string[] = await collect();
        assertContent(contents, expected, true, 'updatedText');
        assertContent(contents, previous, false, 'previousText');
      } finally {
        hilog.info(DOMAIN, TAG, '%{public}s end', caseName);
      }
    });

    // 验证普通输入内容及其隐藏占位符都会被排除。
    it('UIAgentGetPageText_InputAndPlaceholderExcluded_003', 0, async (): Promise<void> => {
      const caseName: string = 'UIAgentGetPageText_InputAndPlaceholderExcluded_003';
      hilog.info(DOMAIN, TAG, '%{public}s begin', caseName);
      try {
        const input: TestComponent = await driver.findComponent(ON.id('sampleInput'));
        const placeholder: string = await input.getHint();
        await input.inputText(INPUT_TEXT);
        await driver.pressBack();
        await driver.delayMs(500);
        const inputValue: string = await input.getText();
        const inputApplied: boolean = inputValue === INPUT_TEXT;
        hilog.info(DOMAIN, TAG, 'inputApplied=%{public}s expected=true', String(inputApplied));
        expect(inputApplied).assertTrue();
        const contents: string[] = await collect();
        assertContent(contents, INPUT_TEXT, false, 'inputContent');
        assertContent(contents, placeholder, false, 'hiddenPlaceholder');
      } finally {
        hilog.info(DOMAIN, TAG, '%{public}s end', caseName);
      }
    });

    // 验证将结果组件替换为示例视图后可以重复采集。
    it('UIAgentGetPageText_RepeatedCollection_004', 0, async (): Promise<void> => {
      const caseName: string = 'UIAgentGetPageText_RepeatedCollection_004';
      hilog.info(DOMAIN, TAG, '%{public}s begin', caseName);
      try {
        for (let index: number = 0; index < 5; index++) {
          const contents: string[] = await collect();
          const hasUnicode: boolean = contents.some((content: string): boolean => content.includes('Hello ArkUI'));
          const hasResult: boolean = contents.some((content: string): boolean => content.includes('"schemaVersion"'));
          hilog.info(DOMAIN, TAG, 'iteration=%{public}d hasUnicode=%{public}s expected=true',
            index, String(hasUnicode));
          expect(hasUnicode).assertTrue();
          hilog.info(DOMAIN, TAG, 'iteration=%{public}d hasResult=%{public}s expected=false', index, String(hasResult));
          expect(hasResult).assertFalse();
        }
      } finally {
        hilog.info(DOMAIN, TAG, '%{public}s end', caseName);
      }
    });
  });
}
