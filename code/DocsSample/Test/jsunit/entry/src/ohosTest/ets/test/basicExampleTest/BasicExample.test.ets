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
// [Start basic_sample]
import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { UIAbility } from '@kit.AbilityKit';
import { Component, ON } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { delegator, driver, EXPECTED_BUNDLE, recoverMain, terminateMain } from '../JsUiSession';

export default function abilityTest(): void {
  describe('ActsAbilityTest', (): void => {
    beforeEach(async (): Promise<void> => {
      try {
        await recoverMain();
      } catch (error) {
        await terminateMain();
        throw error instanceof Error ? error as Error : new Error(String(error));
      }
    });

    /**
     * @tc.number testJsunitBasicHome0001
     * @tc.name testJsunitBasicHome0001
     * @tc.desc Observe the launched main ability, actual bundle and exact Hello World text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level1
     */
    it('testJsunitBasicHome0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (): Promise<void> => {
        try {
          const ability: UIAbility = await delegator.getCurrentTopAbility();
          hilog.info(0x0000, 'BasicExample', 'top name=%{public}s', ability.context.abilityInfo.name);
          expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');
          hilog.info(0x0000, 'BasicExample', 'top bundle=%{public}s', ability.context.abilityInfo.bundleName);
          expect(ability.context.abilityInfo.bundleName).assertEqual(EXPECTED_BUNDLE);
          const text: Component = await driver.waitForComponent(ON.text('Hello World').type('Text'), 3000);
          const actual: string = await text.getText();
          hilog.info(0x0000, 'BasicExample', 'main greeting=%{public}s', actual);
          expect(actual).assertEqual('Hello World');
        } finally {
          await terminateMain();
        }
      });
  });
}
// [End basic_sample]
