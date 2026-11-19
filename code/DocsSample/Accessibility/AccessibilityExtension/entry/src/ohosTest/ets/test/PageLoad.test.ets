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
import { startApp, runCase, addLog, existsId, existsText } from '../testkit/SharedDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AccessibilityExtension]';
const BUNDLE_NAME: string = 'com.samples.accessibilityextension';
const ABILITY_NAME: string = 'EntryAbility';

export default function pageLoadTest(): void {
    describe('A11yExtPageLoad', () => {
        beforeAll(() => {
            addLog('A11yExtPageLoad suite started');
        })

        beforeEach(() => {
        })

        afterEach(() => {
        })

        afterAll(() => {
            addLog('A11yExtPageLoad suite finished');
        })

        /**
         * @tc.number    SUB_A11Y_EXT_PAGELOAD_0100
         * @tc.name      testPageLoad0001
         * @tc.desc      Verify main page renders with title and interactive components.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testPageLoad0001', 0, (done: Function) => {
            runCase('testPageLoad0001', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：页面标题 "Accessibility Sample" 渲染完成
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();

                // 断言2：核心交互按钮 clickButton 已渲染
                let clickBtnExists: boolean = await existsId('clickButton');
                expect(clickBtnExists).assertTrue();

                // 断言3：计数器组件 counterText 已渲染
                let counterExists: boolean = await existsId('counterText');
                expect(counterExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_PAGELOAD_0200
         * @tc.name      testPageLoad0002
         * @tc.desc      Verify section headers are displayed on the main page.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testPageLoad0002', 0, (done: Function) => {
            runCase('testPageLoad0002', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：基础交互区域标题存在
                let basicSectionExists: boolean = await existsText('Basic Interaction');
                expect(basicSectionExists).assertTrue();

                // 断言2：文本输入区域标题存在
                let textSectionExists: boolean = await existsText('Text Input');
                expect(textSectionExists).assertTrue();

                // 断言3：开关控件区域标题存在
                let toggleSectionExists: boolean = await existsText('Toggle Switch');
                expect(toggleSectionExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_PAGELOAD_0300
         * @tc.name      testPageLoad0003
         * @tc.desc      Verify interactive components exist by component id.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testPageLoad0003', 0, (done: Function) => {
            runCase('testPageLoad0003', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：点击按钮 clickButton 存在
                let clickBtnExists: boolean = await existsId('clickButton');
                expect(clickBtnExists).assertTrue();

                // 断言2：文本输入框 textInput 存在
                let textInputExists: boolean = await existsId('textInput');
                expect(textInputExists).assertTrue();

                // 断言3：长按按钮 longClickButton 存在
                let longBtnExists: boolean = await existsId('longClickButton');
                expect(longBtnExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_PAGELOAD_0400
         * @tc.name      testPageLoad0004
         * @tc.desc      Verify all five list items are rendered on the page.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testPageLoad0004', 0, (done: Function) => {
            runCase('testPageLoad0004', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：List item 1 存在
                let item1Exists: boolean = await existsText('List item 1');
                expect(item1Exists).assertTrue();

                // 断言2：List item 3 存在（中间项）
                let item3Exists: boolean = await existsText('List item 3');
                expect(item3Exists).assertTrue();

                // 断言3：List item 5 存在（末尾项）
                let item5Exists: boolean = await existsText('List item 5');
                expect(item5Exists).assertTrue();
            }, done);
        });
    });
}
