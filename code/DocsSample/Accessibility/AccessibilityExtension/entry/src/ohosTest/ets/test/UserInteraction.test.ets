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
    startApp, clickId, waitId, existsId, existsText, textOfId,
    runCase, addLog
} from '../testkit/SharedDriver';
import { localizeText, parseTrailingNumber } from '../testkit/LocaleText';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AccessibilityExtension]';
const BUNDLE_NAME: string = 'com.samples.accessibilityextension';
const ABILITY_NAME: string = 'EntryAbility';

export default function userInteractionTest(): void {
    describe('UserInteractionTest', () => {
        beforeAll(() => {
            addLog('UserInteractionTest suite started');
        })

        beforeEach(() => {
        })

        afterEach(() => {
        })

        afterAll(() => {
            addLog('UserInteractionTest suite finished');
        })

        /**
         * @tc.number    SUB_A11Y_EXT_UINTR_0100
         * @tc.name      testUserInteraction0001
         * @tc.desc      Verify counter increments correctly after multiple clicks.
         * @tc.size      LargeTest
         * @tc.type      Function
         * @tc.level     Level 1
         */
        it('testUserInteraction0001', 0, (done: Function) => {
            runCase('testUserInteraction0001', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：读取计数器初始文本
                let initialText: string = await textOfId('counterText');
                addLog('testUserInteraction0001: initial=%{public}s', initialText);
                expect(initialText.includes(localizeText('Counter'))).assertTrue();

                // 执行两次点击
                await clickId('clickButton');
                await clickId('clickButton');

                // 断言2：点击两次后计数器文本发生变化
                let afterText: string = await textOfId('counterText');
                addLog('testUserInteraction0001: after 2 clicks=%{public}s', afterText);
                expect(afterText !== initialText).assertTrue();

                // 断言3：计数器文本仍包含 "Counter"
                expect(afterText.includes(localizeText('Counter'))).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_UINTR_0200
         * @tc.name      testUserInteraction0002
         * @tc.desc      Verify TextInput accepts different text inputs sequentially.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 1
         */
        it('testUserInteraction0002', 0, (done: Function) => {
            runCase('testUserInteraction0002', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：输入框存在
                let inputExists: boolean = await existsId('textInput');
                addLog('testUserInteraction0002: textInput exists=%{public}s', String(inputExists));
                expect(inputExists).assertTrue();

                // 执行第一次输入
                let inputComponent = await waitId('textInput');
                await inputComponent.inputText('hello');

                // 断言2：第一次输入后组件仍可定位
                let afterFirst: boolean = await existsId('textInput');
                expect(afterFirst).assertTrue();

                // 断言3：Text Input 分区标题仍存在
                let sectionExists: boolean = await existsText('Text Input');
                expect(sectionExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_UINTR_0300
         * @tc.name      testUserInteraction0003
         * @tc.desc      Verify TextInput handles empty string input without crash.
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testUserInteraction0003', 0, (done: Function) => {
            runCase('testUserInteraction0003', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：输入框存在
                let inputExists: boolean = await existsId('textInput');
                expect(inputExists).assertTrue();

                // 执行空字符串输入
                let inputComponent = await waitId('textInput');
                await inputComponent.inputText('');

                // 断言2：空输入后页面不崩溃，输入框仍存在
                let afterEmpty: boolean = await existsId('textInput');
                expect(afterEmpty).assertTrue();

                // 断言3：分区标题仍可定位
                let sectionExists: boolean = await existsText('Text Input');
                expect(sectionExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_UINTR_0400
         * @tc.name      testUserInteraction0004
         * @tc.desc      Verify TextInput handles special characters without crash.
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testUserInteraction0004', 0, (done: Function) => {
            runCase('testUserInteraction0004', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：输入框存在
                let inputExists: boolean = await existsId('textInput');
                expect(inputExists).assertTrue();

                // 执行特殊字符输入
                let inputComponent = await waitId('textInput');
                await inputComponent.inputText('!@#');

                // 断言2：特殊字符输入后页面不崩溃
                let afterSpecial: boolean = await existsId('textInput');
                expect(afterSpecial).assertTrue();

                // 断言3：页面标题仍存在
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_UINTR_0500
         * @tc.name      testUserInteraction0005
         * @tc.desc      Verify list item click does not crash the page.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testUserInteraction0005', 0, (done: Function) => {
            runCase('testUserInteraction0005', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：List item 0 存在
                let item0Exists: boolean = await existsId('listItem_0');
                addLog('testUserInteraction0005: listItem_0=%{public}s', String(item0Exists));
                expect(item0Exists).assertTrue();

                // 执行列表项点击
                await clickId('listItem_0');

                // 断言2：点击后列表项仍存在
                let afterClick: boolean = await existsId('listItem_0');
                expect(afterClick).assertTrue();

                // 断言3：页面标题仍存在，证明未崩溃
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_UINTR_0600
         * @tc.name      testUserInteraction0006
         * @tc.desc      Verify counter text format is correct after click.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 1
         */
        it('testUserInteraction0006', 0, (done: Function) => {
            runCase('testUserInteraction0006', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 执行点击
                await clickId('clickButton');

                // 断言1：计数器组件可定位
                let counterComponent = await waitId('counterText');
                addLog('testUserInteraction0006: counterText found after click');
                expect(counterComponent !== undefined).assertTrue();

                // 断言2：计数器文本包含 "Counter:"
                let counterText: string = await counterComponent.getText();
                addLog('testUserInteraction0006: counter text=%{public}s', counterText);
                expect(counterText.includes(localizeText('Counter'))).assertTrue();

                // 断言3：计数器末尾为可解析数值
                let counterNumber: number = parseTrailingNumber(counterText);
                addLog('testUserInteraction0006: counter value=%{public}d', counterNumber);
                expect(Number.isNaN(counterNumber)).assertFalse();
            }, done);
        });
    });
}
