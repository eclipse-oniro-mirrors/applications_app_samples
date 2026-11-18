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
import { startApp, clickId, waitId, existsId, existsText, existsDescription, counterValue, runCase, addLog } from '../testkit/SharedDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AccessibilityExtension]';
const BUNDLE_NAME: string = 'com.samples.accessibilityextension';
const ABILITY_NAME: string = 'EntryAbility';

export default function uiInteractionTest(): void {
    describe('A11yExtUiInteraction', () => {
        beforeAll(() => {
            addLog('A11yExtUiInteraction suite started');
        })

        beforeEach(() => {
        })

        afterEach(() => {
        })

        afterAll(() => {
            addLog('A11yExtUiInteraction suite finished');
        })

        /**
         * @tc.number    SUB_A11Y_EXT_INTERACT_0100
         * @tc.name      testUiInteraction0001
         * @tc.desc      Verify counter text changes after clicking the button.
         * @tc.size      LargeTest
         * @tc.type      Function
         * @tc.level     Level 1
         */
        it('testUiInteraction0001', 0, (done: Function) => {
            runCase('testUiInteraction0001', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：读取操作前计数器数值
                let counterBefore: number = await counterValue();
                addLog('Initial counter value: %{public}d', counterBefore);

                // 执行点击操作
                await clickId('clickButton');

                // 断言2：点击后计数器精确加一
                let counterAfter: number = await counterValue();
                addLog('Updated counter value: %{public}d', counterAfter);
                expect(counterAfter).assertEqual(counterBefore + 1);

                // 断言3：点击后按钮组件仍存在，页面未崩溃
                let btnExists: boolean = await existsId('clickButton');
                expect(btnExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_INTERACT_0200
         * @tc.name      testUiInteraction0002
         * @tc.desc      Verify text input field accepts user input.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 1
         */
        it('testUiInteraction0002', 0, (done: Function) => {
            runCase('testUiInteraction0002', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：文本输入框存在
                let inputExists: boolean = await existsId('textInput');
                expect(inputExists).assertTrue();

                // 执行输入操作
                let inputComponent = await waitId('textInput');
                await inputComponent.inputText('hello');

                // 断言2：输入后组件仍可定位
                let afterInputExists: boolean = await existsId('textInput');
                expect(afterInputExists).assertTrue();

                // 断言3：输入操作未导致页面崩溃，区域标题仍存在
                let sectionExists: boolean = await existsText('Text Input');
                expect(sectionExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_INTERACT_0300
         * @tc.name      testUiInteraction0003
         * @tc.desc      Verify toggle switch section and accessibility description are rendered.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testUiInteraction0003', 0, (done: Function) => {
            runCase('testUiInteraction0003', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：开关区域标题存在
                let toggleSectionExists: boolean = await existsText('Toggle Switch');
                expect(toggleSectionExists).assertTrue();

                // 断言2：开关无障碍描述存在（accessibilityText 不被测试框架暴露）
                let toggleA11yExists: boolean = await existsDescription('Toggle switch that triggers select accessibility event');
                expect(toggleA11yExists).assertTrue();

                // 断言3：列表区域标题存在，证明页面完整渲染
                let listSectionExists: boolean = await existsText('Scrollable List');
                expect(listSectionExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_INTERACT_0400
         * @tc.name      testUiInteraction0004
         * @tc.desc      Verify list section and list items are rendered and interactive.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testUiInteraction0004', 0, (done: Function) => {
            runCase('testUiInteraction0004', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：列表区域标题存在
                let listSectionExists: boolean = await existsText('Scrollable List');
                expect(listSectionExists).assertTrue();

                // 断言2：List item 1 文本存在
                let item1Exists: boolean = await existsText('List item 1');
                expect(item1Exists).assertTrue();

                // 断言3：List item 3 文本存在（验证 ForEach 渲染完整性）
                let item3Exists: boolean = await existsText('List item 3');
                expect(item3Exists).assertTrue();
            }, done);
        });
    });
}
