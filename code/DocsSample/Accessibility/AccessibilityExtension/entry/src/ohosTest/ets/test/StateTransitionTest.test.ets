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
    startApp, clickId, waitId, getDriver, existsId, existsText, textOfId, counterValue,
    runCase, addLog
} from '../testkit/SharedDriver';
import { localizeText } from '../testkit/LocaleText';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AccessibilityExtension]';
const BUNDLE_NAME: string = 'com.samples.accessibilityextension';
const ABILITY_NAME: string = 'EntryAbility';

export default function stateTransitionTest(): void {
    describe('StateTransitionTest', () => {
        beforeAll(() => {
            addLog('StateTransitionTest suite started');
        })

        beforeEach(() => {
        })

        afterEach(() => {
        })

        afterAll(() => {
            addLog('StateTransitionTest suite finished');
        })

        /**
         * @tc.number    SUB_A11Y_EXT_STATE_0100
         * @tc.name      testStateTransition0001
         * @tc.desc      Verify counter increments by one after single click.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 1
         */
        it('testStateTransition0001', 0, (done: Function) => {
            runCase('testStateTransition0001', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：记录点击前的计数器数值（用例间共享页面实例，不假设初始值）
                let counterBefore: number = await counterValue();
                addLog('testStateTransition0001: initial=%{public}d', counterBefore);

                // 执行点击
                await clickId('clickButton');

                // 断言2：点击后计数器精确加一
                let counterAfter: number = await counterValue();
                addLog('testStateTransition0001: after click=%{public}d', counterAfter);
                expect(counterAfter).assertEqual(counterBefore + 1);

                // 断言3：计数器文本仍保留标签
                let afterText: string = await textOfId('counterText');
                expect(afterText.includes(localizeText('Counter'))).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_STATE_0200
         * @tc.name      testStateTransition0002
         * @tc.desc      Verify counter increments sequentially through multiple clicks.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 1
         */
        it('testStateTransition0002', 0, (done: Function) => {
            runCase('testStateTransition0002', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：记录初始计数器数值
                let value0: number = await counterValue();
                addLog('testStateTransition0002: value0=%{public}d', value0);

                // 第一次点击
                await clickId('clickButton');
                let value1: number = await counterValue();

                // 断言2：第一次点击后递增 1
                expect(value1).assertEqual(value0 + 1);

                // 第二次点击
                await clickId('clickButton');
                let value2: number = await counterValue();

                // 断言3：第二次点击后继续递增 1
                expect(value2).assertEqual(value1 + 1);
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_STATE_0300
         * @tc.name      testStateTransition0003
         * @tc.desc      Verify TextInput content updates after inputText call.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 1
         */
        it('testStateTransition0003', 0, (done: Function) => {
            runCase('testStateTransition0003', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：输入框组件可定位
                const inputComponent: Component = await waitId('textInput');
                addLog('testStateTransition0003: textInput found');
                expect(inputComponent !== null).assertTrue();

                // 执行输入（先清空残留内容，避免用例间输入框状态相互影响）
                await inputComponent.clearText();
                await getDriver().waitForIdle(300, 3000);
                await inputComponent.inputText('test input');
                await getDriver().waitForIdle(300, 3000);

                // 断言2：输入框内容为本次输入值
                const typed: string = await inputComponent.getOriginalText();
                addLog('testStateTransition0003: input text=%{public}s', typed);
                expect(typed).assertEqual('test input');

                // 断言3：Text Input 分区标题仍存在
                let sectionExists: boolean = await existsText('Text Input');
                expect(sectionExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_STATE_0400
         * @tc.name      testStateTransition0004
         * @tc.desc      Verify TextInput accepts long text input without crash.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testStateTransition0004', 0, (done: Function) => {
            runCase('testStateTransition0004', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：输入框存在
                let inputExists: boolean = await existsId('textInput');
                expect(inputExists).assertTrue();

                // 执行长文本输入（先清空残留内容）
                const inputComponent: Component = await waitId('textInput');
                await inputComponent.clearText();
                await getDriver().waitForIdle(300, 3000);
                const longText: string = 'This is a long text input for testing purposes';
                await inputComponent.inputText(longText);
                await getDriver().waitForIdle(300, 3000);

                // 断言2：长文本完整写入输入框
                const typed: string = await inputComponent.getOriginalText();
                addLog('testStateTransition0004: long text length=%{public}d', typed.length);
                expect(typed).assertEqual(longText);

                // 断言3：页面标题仍存在
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_STATE_0500
         * @tc.name      testStateTransition0005
         * @tc.desc      Verify list item click maintains page stability.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testStateTransition0005', 0, (done: Function) => {
            runCase('testStateTransition0005', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：List item 2 存在
                let item2Exists: boolean = await existsId('listItem_2');
                addLog('testStateTransition0005: listItem_2=%{public}s', String(item2Exists));
                expect(item2Exists).assertTrue();

                // 执行列表项点击
                await clickId('listItem_2');

                // 断言2：点击后List item 2 仍存在
                let afterClick: boolean = await existsId('listItem_2');
                expect(afterClick).assertTrue();

                // 断言3：页面标题仍存在
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_STATE_0600
         * @tc.name      testStateTransition0006
         * @tc.desc      Verify counter state increments by three across multiple interactions.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 1
         */
        it('testStateTransition0006', 0, (done: Function) => {
            runCase('testStateTransition0006', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 记录点击前计数器数值
                let counterBefore: number = await counterValue();

                // 执行三次点击
                await clickId('clickButton');
                await clickId('clickButton');
                await clickId('clickButton');

                // 断言1：三次点击后计数器精确增加 3
                let counterAfter: number = await counterValue();
                addLog('testStateTransition0006: before=%{public}d after=%{public}d', counterBefore, counterAfter);
                expect(counterAfter).assertEqual(counterBefore + 3);

                // 断言2：计数器文本包含标签
                let afterText: string = await textOfId('counterText');
                expect(afterText.includes(localizeText('Counter'))).assertTrue();

                // 断言3：按钮仍存在
                let btnExists: boolean = await existsId('clickButton');
                expect(btnExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_STATE_0700
         * @tc.name      testStateTransition0007
         * @tc.desc      Verify page state remains stable after TextInput and button click sequence.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testStateTransition0007', 0, (done: Function) => {
            runCase('testStateTransition0007', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 执行输入
                const inputComponent: Component = await waitId('textInput');
                await inputComponent.clearText();
                await getDriver().waitForIdle(300, 3000);
                await inputComponent.inputText('state test');
                await getDriver().waitForIdle(300, 3000);

                let counterBefore: number = await counterValue();

                // 执行点击
                await clickId('clickButton');

                // 断言1：计数器精确加一
                let counterAfter: number = await counterValue();
                addLog('testStateTransition0007: counter %{public}d -> %{public}d', counterBefore, counterAfter);
                expect(counterAfter).assertEqual(counterBefore + 1);

                // 断言2：输入内容未被点击操作清空
                const typed: string = await inputComponent.getOriginalText();
                expect(typed).assertEqual('state test');

                // 断言3：页面标题仍存在
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();
            }, done);
        });
    });
}
