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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { startApp, runCase, addLog, existsId } from '../testkit/SharedDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AccessibilityExtension]';
const BUNDLE_NAME: string = 'com.samples.accessibilityextension';
const ABILITY_NAME: string = 'EntryAbility';

export default function abilityTest(): void {
    describe('AbilityTest', () => {
        beforeAll(() => {
            addLog('AbilityTest suite started');
        })

        beforeEach(() => {
        })

        afterEach(() => {
        })

        afterAll(() => {
            addLog('AbilityTest suite finished');
        })

        /**
         * @tc.number    SUB_A11Y_EXT_ABILITY_0100
         * @tc.name      testAbilityLaunch0001
         * @tc.desc      Verify EntryAbility launches and becomes the top ability.
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testAbilityLaunch0001', 0, (done: Function) => {
            runCase('testAbilityLaunch0001', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);
                let delegator = abilityDelegatorRegistry.getAbilityDelegator();
                let topAbility = await delegator.getCurrentTopAbility();
                let abilityName: string = topAbility.context.abilityInfo.name;
                addLog('Top ability: %{public}s', abilityName);

                // 断言1：顶层 Ability 为 EntryAbility
                expect(abilityName).assertEqual('EntryAbility');
                // 断言2：Ability 名称非空
                expect(abilityName.length > 0).assertTrue();
                // 断言3：Context 有效
                expect(topAbility.context !== undefined).assertTrue();
            }, done);
        });
    });
}
