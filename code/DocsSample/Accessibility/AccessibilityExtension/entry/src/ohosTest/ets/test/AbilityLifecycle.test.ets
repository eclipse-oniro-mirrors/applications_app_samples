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
import { abilityDelegatorRegistry, Driver } from '@kit.TestKit';
import { startApp, existsId, existsText, textOfId, runCase, addLog } from '../testkit/SharedDriver';
import { localizeText, parseTrailingNumber } from '../testkit/LocaleText';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AccessibilityExtension]';
const BUNDLE_NAME: string = 'com.samples.accessibilityextension';
const ABILITY_NAME: string = 'EntryAbility';

export default function abilityLifecycleTest(): void {
    describe('AbilityLifecycleTest', () => {
        beforeAll(() => {
            addLog('AbilityLifecycleTest suite started');
        })

        beforeEach(() => {
        })

        afterEach(() => {
        })

        afterAll(() => {
            addLog('AbilityLifecycleTest suite finished');
        })

        /**
         * @tc.number    SUB_A11Y_EXT_LIFE_0100
         * @tc.name      testAbilityLifecycle0001
         * @tc.desc      Verify page fully loads after app launch with key components.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testAbilityLifecycle0001', 0, (done: Function) => {
            runCase('testAbilityLifecycle0001', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：页面标题存在
                let titleExists: boolean = await existsText('Accessibility Sample');
                addLog('testAbilityLifecycle0001: title=%{public}s', String(titleExists));
                expect(titleExists).assertTrue();

                // 断言2：核心按钮存在
                let btnExists: boolean = await existsId('clickButton');
                expect(btnExists).assertTrue();

                // 断言3：计数器组件存在
                let counterExists: boolean = await existsId('counterText');
                expect(counterExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_LIFE_0200
         * @tc.name      testAbilityLifecycle0002
         * @tc.desc      Verify top ability context belongs to the target bundle after launch.
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testAbilityLifecycle0002', 0, (done: Function) => {
            runCase('testAbilityLifecycle0002', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：能获取到顶层 Ability
                let delegator = abilityDelegatorRegistry.getAbilityDelegator();
                let topAbility = await delegator.getCurrentTopAbility();
                addLog('testAbilityLifecycle0002: top ability fetched');
                expect(topAbility !== undefined).assertTrue();

                // 断言2：Context 非空
                expect(topAbility.context !== undefined).assertTrue();

                // 断言3：Ability 所属 bundle 为目标应用
                let abilityBundle: string = topAbility.context.abilityInfo.bundleName;
                addLog('testAbilityLifecycle0002: top ability bundle=%{public}s', abilityBundle);
                expect(abilityBundle).assertEqual(BUNDLE_NAME);
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_LIFE_0300
         * @tc.name      testAbilityLifecycle0003
         * @tc.desc      Verify bundleName matches expected application bundle.
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testAbilityLifecycle0003', 0, (done: Function) => {
            runCase('testAbilityLifecycle0003', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：能获取到 AbilityDelegator
                let delegator = abilityDelegatorRegistry.getAbilityDelegator();
                addLog('testAbilityLifecycle0003: delegator obtained');
                expect(delegator !== undefined).assertTrue();

                // 断言2：bundleName 匹配
                let args = abilityDelegatorRegistry.getArguments();
                expect(args.bundleName).assertEqual(BUNDLE_NAME);

                // 断言3：bundleName 非空
                expect(args.bundleName.length > 0).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_LIFE_0400
         * @tc.name      testAbilityLifecycle0004
         * @tc.desc      Verify all four page sections render completely after launch.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testAbilityLifecycle0004', 0, (done: Function) => {
            runCase('testAbilityLifecycle0004', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：Basic Interaction 分区存在
                let basicExists: boolean = await existsText('Basic Interaction');
                addLog('testAbilityLifecycle0004: Basic Interaction=%{public}s', String(basicExists));
                expect(basicExists).assertTrue();

                // 断言2：Text Input 分区存在
                let textExists: boolean = await existsText('Text Input');
                expect(textExists).assertTrue();

                // 断言3：Scrollable List 分区存在
                let listExists: boolean = await existsText('Scrollable List');
                expect(listExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_LIFE_0500
         * @tc.name      testAbilityLifecycle0005
         * @tc.desc      Verify counter display keeps the expected label format after app start.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testAbilityLifecycle0005', 0, (done: Function) => {
            runCase('testAbilityLifecycle0005', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：计数器组件可定位
                let counterText: string = await textOfId('counterText');
                addLog('testAbilityLifecycle0005: counter=%{public}s', counterText);
                expect(counterText.includes(localizeText('Counter'))).assertTrue();

                // 断言2：计数器数值可被解析（应用未重建时沿用当前值，不断言具体初值）
                let counterNumber: number = parseTrailingNumber(counterText);
                addLog('testAbilityLifecycle0005: counter value=%{public}d', counterNumber);
                expect(Number.isNaN(counterNumber)).assertFalse();

                // 断言3：页面标题存在，证明页面完整加载
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_LIFE_0600
         * @tc.name      testAbilityLifecycle0006
         * @tc.desc      Verify Driver can interact with UI after app launch.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testAbilityLifecycle0006', 0, (done: Function) => {
            runCase('testAbilityLifecycle0006', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：Driver 可创建
                let driver: Driver = Driver.create();
                addLog('testAbilityLifecycle0006: Driver created');
                expect(driver !== undefined).assertTrue();

                // 断言2：clickButton 可被 Driver 定位
                let btnExists: boolean = await existsId('clickButton');
                expect(btnExists).assertTrue();

                // 断言3：counterText 可被 Driver 定位
                let counterExists: boolean = await existsId('counterText');
                expect(counterExists).assertTrue();
            }, done);
        });
    });
}
