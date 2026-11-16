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
import {
    startApp, clickId, waitId, waitText, existsId, existsText, textOfId, hintOfId,
    runCase, addLog
} from '../testkit/SharedDriver';
import { localizeText, parseTrailingNumber } from '../testkit/LocaleText';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AccessibilityExtension]';
const BUNDLE_NAME: string = 'com.samples.accessibilityextension';
const ABILITY_NAME: string = 'EntryAbility';

export default function placeholderTextTest(): void {
    describe('PlaceholderTextTest', () => {
        beforeAll(() => {
            addLog('PlaceholderTextTest suite started');
        })

        beforeEach(() => {
        })

        afterEach(() => {
        })

        afterAll(() => {
            addLog('PlaceholderTextTest suite finished');
        })

        /**
         * @tc.number    SUB_A11Y_EXT_PHLD_0100
         * @tc.name      testPlaceholderText0001
         * @tc.desc      Verify TextInput placeholder text exists on page.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testPlaceholderText0001', 0, (done: Function) => {
            runCase('testPlaceholderText0001', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：输入框占位提示为 placeholder 文案（placeholder 不是 text，需按 hint 读取）
                let placeholder: string = await hintOfId('textInput');
                addLog('testPlaceholderText0001: hint=%{public}s', placeholder);
                expect(placeholder).assertEqual(localizeText('Please input text...'));

                // 断言2：输入框 ID 存在
                let inputExists: boolean = await existsId('textInput');
                expect(inputExists).assertTrue();

                // 断言3：Text Input 标题存在
                let sectionExists: boolean = await existsText('Text Input');
                expect(sectionExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_PHLD_0200
         * @tc.name      testPlaceholderText0002
         * @tc.desc      Verify placeholder text is present before input.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testPlaceholderText0002', 0, (done: Function) => {
            runCase('testPlaceholderText0002', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：placeholder 可定位（placeholder 不是 text，需按 hint 读取）
                let placeholder: string = await hintOfId('textInput');
                addLog('testPlaceholderText0002: hint=%{public}s', placeholder);
                expect(placeholder).assertEqual(localizeText('Please input text...'));

                // 断言2：输入后输入框仍存在
                let inputComp = await waitId('textInput');
                await inputComp.inputText('hello');
                let inputExists: boolean = await existsId('textInput');
                expect(inputExists).assertTrue();

                // 断言3：页面标题仍存在
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_PHLD_0300
         * @tc.name      testPlaceholderText0003
         * @tc.desc      Verify counter label text Counter exists on page.
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testPlaceholderText0003', 0, (done: Function) => {
            runCase('testPlaceholderText0003', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：计数器文本为「Counter: N」形式（ON.text 为全等匹配，改用数值提取）
                let counterText: string = await textOfId('counterText');
                addLog('testPlaceholderText0003: counter=%{public}s', counterText);
                expect(Number.isNaN(parseTrailingNumber(counterText))).assertFalse();

                // 断言2：counterText ID 存在
                let counterId: boolean = await existsId('counterText');
                expect(counterId).assertTrue();

                // 断言3：Basic Interaction 标题存在
                let sectionExists: boolean = await existsText('Basic Interaction');
                expect(sectionExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_PHLD_0400
         * @tc.name      testPlaceholderText0004
         * @tc.desc      Verify page title text exact match.
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testPlaceholderText0004', 0, (done: Function) => {
            runCase('testPlaceholderText0004', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：页面标题精确匹配
                let titleComp = await waitText('Accessibility Sample');
                let titleText: string = await titleComp.getText();
                addLog('testPlaceholderText0004: title=%{public}s', titleText);
                expect(titleText).assertEqual(localizeText('Accessibility Sample'));

                // 断言2：标题长度大于 0
                expect(titleText.length > 0).assertTrue();

                // 断言3：按钮存在
                let btnExists: boolean = await existsId('clickButton');
                expect(btnExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_PHLD_0500
         * @tc.name      testPlaceholderText0005
         * @tc.desc      Verify all section header texts are locatable.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testPlaceholderText0005', 0, (done: Function) => {
            runCase('testPlaceholderText0005', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：Basic Interaction 标题存在
                let basic: boolean = await existsText('Basic Interaction');
                expect(basic).assertTrue();

                // 断言2：Text Input 标题存在
                let input: boolean = await existsText('Text Input');
                expect(input).assertTrue();

                // 断言3：Toggle Switch 标题存在
                let toggle: boolean = await existsText('Toggle Switch');
                expect(toggle).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_PHLD_0600
         * @tc.name      testPlaceholderText0006
         * @tc.desc      Verify Scrollable List section title and list items exist.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testPlaceholderText0006', 0, (done: Function) => {
            runCase('testPlaceholderText0006', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：Scrollable List 标题存在
                let listSection: boolean = await existsText('Scrollable List');
                expect(listSection).assertTrue();

                // 断言2：List item 0 存在
                let item0: boolean = await existsId('listItem_0');
                expect(item0).assertTrue();

                // 断言3：List item 1 文本存在
                let item1Text: boolean = await existsText('List item 1');
                expect(item1Text).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_PHLD_0700
         * @tc.name      testPlaceholderText0007
         * @tc.desc      Verify all placeholder texts remain after interactions.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testPlaceholderText0007', 0, (done: Function) => {
            runCase('testPlaceholderText0007', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);
                await clickId('clickButton');
                let inputComp = await waitId('textInput');
                await inputComp.inputText('test');

                // 断言1：输入后占位提示属性仍可读回
                let placeholder: string = await hintOfId('textInput');
                addLog('testPlaceholderText0007: hint=%{public}s', placeholder);
                expect(placeholder).assertEqual(localizeText('Please input text...'));

                // 断言2：页面标题仍存在
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();

                // 断言3：计数器文本仍可读取（ON.text 为全等匹配，"Counter: N" 需按数值提取）
                let counterText: string = await textOfId('counterText');
                addLog('testPlaceholderText0007: counter=%{public}s', counterText);
                expect(Number.isNaN(parseTrailingNumber(counterText))).assertFalse();
            }, done);
        });
    });
}
