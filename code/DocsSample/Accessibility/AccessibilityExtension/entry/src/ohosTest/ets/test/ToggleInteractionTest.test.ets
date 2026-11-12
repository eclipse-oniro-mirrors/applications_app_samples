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
import { Component } from '@kit.TestKit';
import {
    startApp, clickId, waitId, existsId, existsText, existsDescription, counterValue,
    runCase, addLog
} from '../testkit/SharedDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AccessibilityExtension]';
const BUNDLE_NAME: string = 'com.samples.accessibilityextension';
const ABILITY_NAME: string = 'EntryAbility';

export default function toggleInteractionTest(): void {
    describe('ToggleInteractionTest', () => {
        beforeAll(() => {
            addLog('ToggleInteractionTest suite started');
        })

        beforeEach(() => {
        })

        afterEach(() => {
        })

        afterAll(() => {
            addLog('ToggleInteractionTest suite finished');
        })

        /**
         * @tc.number    SUB_A11Y_EXT_TOGGL_0100
         * @tc.name      testToggleInteraction0001
         * @tc.desc      Verify Toggle switch component ID exists on page.
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testToggleInteraction0001', 0, (done: Function) => {
            runCase('testToggleInteraction0001', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：Toggle 组件 ID 可定位
                let toggleExists: boolean = await existsId('toggleSwitch');
                addLog('testToggleInteraction0001: toggleSwitch exists=%{public}s', String(toggleExists));
                expect(toggleExists).assertTrue();

                // 断言2：Toggle 分区标题存在
                let sectionExists: boolean = await existsText('Toggle Switch');
                expect(sectionExists).assertTrue();

                // 断言3：页面标题存在
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_TOGGL_0200
         * @tc.name      testToggleInteraction0002
         * @tc.desc      Verify Toggle switch accessibility description is rendered.
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testToggleInteraction0002', 0, (done: Function) => {
            runCase('testToggleInteraction0002', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：Toggle 无障碍描述文本存在（accessibilityText 不被测试框架暴露，改验 description）
                let toggleDescExists: boolean = await existsDescription('Toggle switch that triggers select accessibility event');
                addLog('testToggleInteraction0002: toggle description exists=%{public}s', String(toggleDescExists));
                expect(toggleDescExists).assertTrue();

                // 断言2：Toggle 分区标题存在
                let sectionExists: boolean = await existsText('Toggle Switch');
                expect(sectionExists).assertTrue();

                // 断言3：Toggle 组件 ID 可定位
                let toggleExists: boolean = await existsId('toggleSwitch');
                expect(toggleExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_TOGGL_0300
         * @tc.name      testToggleInteraction0003
         * @tc.desc      Verify clicking Toggle does not change counter value.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testToggleInteraction0003', 0, (done: Function) => {
            runCase('testToggleInteraction0003', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                let toggle: Component = await waitId('toggleSwitch');

                // 断言1：记录操作前的开关状态（用例间共享页面实例，不假设初始值）
                let initialState: boolean = await toggle.isChecked();
                addLog('testToggleInteraction0003: initial checked=%{public}s', String(initialState));
                let counterBefore: number = await counterValue();

                await clickId('toggleSwitch');

                // 断言2：点击后 Toggle 真实状态翻转
                let selectedState: boolean = await toggle.isChecked();
                addLog('testToggleInteraction0003: checked after click=%{public}s', String(selectedState));
                expect(selectedState).assertEqual(!initialState);

                // 断言3：Toggle 状态变化不影响计数器
                let counterAfter: number = await counterValue();
                addLog('testToggleInteraction0003: counter before=%{public}d after=%{public}d', counterBefore, counterAfter);
                expect(counterAfter).assertEqual(counterBefore);
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_TOGGL_0400
         * @tc.name      testToggleInteraction0004
         * @tc.desc      Verify Toggle click does not crash the page.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testToggleInteraction0004', 0, (done: Function) => {
            runCase('testToggleInteraction0004', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                let toggle: Component = await waitId('toggleSwitch');

                // 断言1：记录操作前的开关状态
                let initialState: boolean = await toggle.isChecked();
                addLog('testToggleInteraction0004: initial checked=%{public}s', String(initialState));

                await clickId('toggleSwitch');

                // 断言2：第一次点击后状态翻转
                let selectedState: boolean = await toggle.isChecked();
                addLog('testToggleInteraction0004: checked after first click=%{public}s', String(selectedState));
                expect(selectedState).assertEqual(!initialState);

                await clickId('toggleSwitch');

                // 断言3：第二次点击后回到操作前状态
                expect(await toggle.isChecked()).assertEqual(initialState);
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_TOGGL_0500
         * @tc.name      testToggleInteraction0005
         * @tc.desc      Verify multiple Toggle clicks maintain page stability.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testToggleInteraction0005', 0, (done: Function) => {
            runCase('testToggleInteraction0005', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                let toggle: Component = await waitId('toggleSwitch');

                // 断言1：记录连续操作前的开关状态与计数器
                let initialState: boolean = await toggle.isChecked();
                let counterBefore: number = await counterValue();

                await clickId('toggleSwitch');
                await clickId('toggleSwitch');
                await clickId('toggleSwitch');

                // 断言2：奇数次点击后状态与操作前相反
                let finalState: boolean = await toggle.isChecked();
                addLog('testToggleInteraction0005: checked after 3 clicks=%{public}s', String(finalState));
                expect(finalState).assertEqual(!initialState);

                // 断言3：连续切换不影响计数器
                let counterAfter: number = await counterValue();
                expect(counterAfter).assertEqual(counterBefore);
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_TOGGL_0600
         * @tc.name      testToggleInteraction0006
         * @tc.desc      Verify Toggle accessibility description text is rendered.
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testToggleInteraction0006', 0, (done: Function) => {
            runCase('testToggleInteraction0006', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：Toggle 无障碍描述文本存在
                let toggleDescExists: boolean = await existsDescription('Toggle switch that triggers select accessibility event');
                addLog('testToggleInteraction0006: toggle description exists=%{public}s', String(toggleDescExists));
                expect(toggleDescExists).assertTrue();

                // 断言2：Toggle 组件 ID 存在
                let toggleExists: boolean = await existsId('toggleSwitch');
                expect(toggleExists).assertTrue();

                // 断言3：Text Input 分区也存在（证明页面完整）
                let inputSectionExists: boolean = await existsText('Text Input');
                expect(inputSectionExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_TOGGL_0700
         * @tc.name      testToggleInteraction0007
         * @tc.desc      Verify Toggle click followed by button click preserves both states.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testToggleInteraction0007', 0, (done: Function) => {
            runCase('testToggleInteraction0007', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                let toggle: Component = await waitId('toggleSwitch');
                let initialState: boolean = await toggle.isChecked();
                await clickId('toggleSwitch');

                // 断言1：Toggle 点击后状态翻转
                let selectedState: boolean = await toggle.isChecked();
                addLog('testToggleInteraction0007: checked after click=%{public}s', String(selectedState));
                expect(selectedState).assertEqual(!initialState);

                let counterBefore: number = await counterValue();
                await clickId('clickButton');

                // 断言2：普通按钮独立地将计数器加一
                let counterAfter: number = await counterValue();
                addLog('testToggleInteraction0007: counter before=%{public}d after=%{public}d', counterBefore, counterAfter);
                expect(counterAfter).assertEqual(counterBefore + 1);

                // 断言3：计数器更新不会重置 Toggle 状态
                expect(await toggle.isChecked()).assertEqual(selectedState);
            }, done);
        });
    });
}
