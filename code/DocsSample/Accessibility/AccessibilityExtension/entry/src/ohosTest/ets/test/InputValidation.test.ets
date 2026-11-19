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
    startApp, clickId, waitId, getDriver, textOfId, counterValue,
    runCase, addLog
} from '../testkit/SharedDriver';
import { localizeText } from '../testkit/LocaleText';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AccessibilityExtension]';
const BUNDLE_NAME: string = 'com.samples.accessibilityextension';
const ABILITY_NAME: string = 'EntryAbility';

export default function inputValidationTest(): void {
    describe('InputValidationTest', () => {
        beforeAll(() => {
            addLog('InputValidationTest suite started');
        })

        beforeEach(() => {
        })

        afterEach(() => {
        })

        afterAll(() => {
            addLog('InputValidationTest suite finished');
        })

        /**
         * @tc.number    SUB_A11Y_EXT_INVL_0100
         * @tc.name      testInputValidation0001
         * @tc.desc      Verify pure numeric input is accepted.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testInputValidation0001', 0, (done: Function) => {
            runCase('testInputValidation0001', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);
                let inputComp: Component = await waitId('textInput');

                // 断言1：清空后输入框内容为空（用例间共享页面实例，避免残留内容干扰）
                await inputComp.clearText();
                await getDriver().waitForIdle(300, 3000);
                let initialText: string = await inputComp.getOriginalText();
                expect(initialText).assertEqual('');

                await inputComp.inputText('12345');
                let actualText: string = await inputComp.getOriginalText();
                addLog('testInputValidation0001: actual=%{public}s', actualText);

                // 断言2：数字内容完整写入
                expect(actualText).assertEqual('12345');

                // 断言3：输入长度没有截断或追加
                expect(actualText.length).assertEqual(5);
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_INVL_0200
         * @tc.name      testInputValidation0002
         * @tc.desc      Verify Chinese character input is accepted.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testInputValidation0002', 0, (done: Function) => {
            runCase('testInputValidation0002', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);
                let inputComp: Component = await waitId('textInput');

                // 断言1：清空后输入框内容为空（用例间共享页面实例，避免残留内容干扰）
                await inputComp.clearText();
                await getDriver().waitForIdle(300, 3000);
                let initialText: string = await inputComp.getOriginalText();
                expect(initialText).assertEqual('');

                await inputComp.inputText('中文测试');
                let actualText: string = await inputComp.getOriginalText();
                addLog('testInputValidation0002: actual=%{public}s', actualText);

                // 断言2：中文内容完整写入
                expect(actualText).assertEqual('中文测试');

                // 断言3：四个中文字符均保留
                expect(actualText.length).assertEqual(4);
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_INVL_0300
         * @tc.name      testInputValidation0003
         * @tc.desc      Verify space-only input is accepted without crash.
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testInputValidation0003', 0, (done: Function) => {
            runCase('testInputValidation0003', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);
                let inputComp: Component = await waitId('textInput');

                // 断言1：清空后输入框内容为空（用例间共享页面实例，避免残留内容干扰）
                await inputComp.clearText();
                await getDriver().waitForIdle(300, 3000);
                let initialText: string = await inputComp.getOriginalText();
                expect(initialText).assertEqual('');

                await inputComp.inputText('   ');
                let actualText: string = await inputComp.getOriginalText();
                addLog('testInputValidation0003: actual length=%{public}s', String(actualText.length));

                // 断言2：空格不会被 Trim 或替换
                expect(actualText).assertEqual('   ');

                // 断言3：三个空格均保留
                expect(actualText.length).assertEqual(3);
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_INVL_0400
         * @tc.name      testInputValidation0004
         * @tc.desc      Verify long string input is accepted without crash.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testInputValidation0004', 0, (done: Function) => {
            runCase('testInputValidation0004', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);
                let inputComp: Component = await waitId('textInput');
                let longStr: string = '';
                for (let i = 0; i < 200; i++) {
                    longStr = longStr + 'A';
                }
                let counterBefore: number = await counterValue();
                await inputComp.clearText();
                await getDriver().waitForIdle(300, 3000);
                await inputComp.inputText(longStr);
                await getDriver().waitForIdle(300, 3000);
                let actualText: string = await inputComp.getOriginalText();
                addLog('testInputValidation0004: actual length=%{public}s', String(actualText.length));

                // 断言1：200 字符内容完整写入
                expect(actualText).assertEqual(longStr);

                // 断言2：达到 200 字符时未发生截断
                expect(actualText.length).assertEqual(200);

                // 断言3：长文本输入不影响计数器
                expect(await counterValue()).assertEqual(counterBefore);
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_INVL_0500
         * @tc.name      testInputValidation0005
         * @tc.desc      Verify mixed character input is accepted.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testInputValidation0005', 0, (done: Function) => {
            runCase('testInputValidation0005', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);
                let inputComp: Component = await waitId('textInput');
                let counterBefore: number = await counterValue();
                await inputComp.clearText();
                await getDriver().waitForIdle(300, 3000);
                await inputComp.inputText('Hello世界123');
                await getDriver().waitForIdle(300, 3000);
                let actualText: string = await inputComp.getOriginalText();
                addLog('testInputValidation0005: actual=%{public}s', actualText);

                // 断言1：中英文与数字混合内容完整写入
                expect(actualText).assertEqual('Hello世界123');

                // 断言2：混合内容的十个字符均保留
                expect(actualText.length).assertEqual(10);

                // 断言3：文本输入不影响计数器
                expect(await counterValue()).assertEqual(counterBefore);
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_INVL_0600
         * @tc.name      testInputValidation0006
         * @tc.desc      Verify single character input is accepted.
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testInputValidation0006', 0, (done: Function) => {
            runCase('testInputValidation0006', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);
                let inputComp: Component = await waitId('textInput');

                // 断言1：清空后输入框内容为空（用例间共享页面实例，避免残留内容干扰）
                await inputComp.clearText();
                await getDriver().waitForIdle(300, 3000);
                let initialText: string = await inputComp.getOriginalText();
                expect(initialText).assertEqual('');

                await inputComp.inputText('A');

                // 断言2：单字符内容准确写入
                let singleText: string = await inputComp.getOriginalText();
                addLog('testInputValidation0006: single=%{public}s', singleText);
                expect(singleText).assertEqual('A');

                await inputComp.clearText();
                await getDriver().waitForIdle(300, 3000);

                // 断言3：clearText 可清除已有内容
                let clearedText: string = await inputComp.getOriginalText();
                expect(clearedText).assertEqual('');
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_INVL_0700
         * @tc.name      testInputValidation0007
         * @tc.desc      Verify page stability after input then click button.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testInputValidation0007', 0, (done: Function) => {
            runCase('testInputValidation0007', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);
                let inputComp: Component = await waitId('textInput');
                let counterBefore: number = await counterValue();
                await inputComp.clearText();
                await getDriver().waitForIdle(300, 3000);
                await inputComp.inputText('test');
                await getDriver().waitForIdle(300, 3000);

                // 断言1：组合操作前文本已写入
                let beforeClick: string = await inputComp.getOriginalText();
                expect(beforeClick).assertEqual('test');

                await clickId('clickButton');

                // 断言2：按钮点击只将计数器增加一次
                let counterAfter: number = await counterValue();
                addLog('testInputValidation0007: counter %{public}d -> %{public}d', counterBefore, counterAfter);
                expect(counterAfter).assertEqual(counterBefore + 1);

                // 断言3：点击按钮不会清空输入内容
                let afterClick: string = await inputComp.getOriginalText();
                expect(afterClick).assertEqual('test');
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_INVL_0800
         * @tc.name      testInputValidation0008
         * @tc.desc      Verify page stability after input then click list item.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testInputValidation0008', 0, (done: Function) => {
            runCase('testInputValidation0008', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);
                let inputComp: Component = await waitId('textInput');
                let counterBefore: number = await counterValue();
                await inputComp.clearText();
                await getDriver().waitForIdle(300, 3000);
                await inputComp.inputText('test');
                await getDriver().waitForIdle(300, 3000);

                // 断言1：组合操作前文本已写入
                let beforeClick: string = await inputComp.getOriginalText();
                expect(beforeClick).assertEqual('test');

                await clickId('listItem_0');

                // 断言2：列表项点击不改变计数器
                expect(await counterValue()).assertEqual(counterBefore);

                // 断言3：输入内容和列表项文案均保持正确
                let afterClick: string = await inputComp.getOriginalText();
                let itemText: string = await textOfId('listItem_0');
                addLog('testInputValidation0008: item=%{public}s', itemText);
                expect(afterClick).assertEqual('test');
                expect(itemText).assertEqual(localizeText('List item 1'));
            }, done);
        });
    });
}
