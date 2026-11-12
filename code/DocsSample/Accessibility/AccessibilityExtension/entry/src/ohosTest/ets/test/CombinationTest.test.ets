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
    startApp, clickId, waitId, getDriver, existsId, existsText, counterValue,
    runCase, addLog
} from '../testkit/SharedDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AccessibilityExtension]';
const BUNDLE_NAME: string = 'com.samples.accessibilityextension';
const ABILITY_NAME: string = 'EntryAbility';

export default function combinationTest(): void {
    describe('CombinationTest', () => {
        beforeAll(() => {
            addLog('CombinationTest suite started');
        })

        beforeEach(() => {
        })

        afterEach(() => {
        })

        afterAll(() => {
            addLog('CombinationTest suite finished');
        })

        /**
         * @tc.number    SUB_A11Y_EXT_COMB_0100
         * @tc.name      testCombination0001
         * @tc.desc      Verify button click followed by text input maintains page stability.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testCombination0001', 0, (done: Function) => {
            runCase('testCombination0001', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 记录点击前的计数器数值
                let counterBefore: number = await counterValue();

                // 执行点击
                await clickId('clickButton');

                // 断言1：计数器精确加一
                let counterAfter: number = await counterValue();
                addLog('testCombination0001: counter %{public}d -> %{public}d', counterBefore, counterAfter);
                expect(counterAfter).assertEqual(counterBefore + 1);

                // 执行输入（先清空残留内容）
                const inputComponent: Component = await waitId('textInput');
                await inputComponent.clearText();
                await getDriver().waitForIdle(300, 3000);
                await inputComponent.inputText('combo test');
                await getDriver().waitForIdle(300, 3000);

                // 断言2：输入内容写入且计数器未被影响
                expect(await inputComponent.getOriginalText()).assertEqual('combo test');
                expect(await counterValue()).assertEqual(counterAfter);

                // 断言3：页面标题仍存在
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_COMB_0200
         * @tc.name      testCombination0002
         * @tc.desc      Verify multiple button clicks followed by text input.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testCombination0002', 0, (done: Function) => {
            runCase('testCombination0002', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 记录点击前的计数器数值
                let counterBefore: number = await counterValue();

                // 执行两次点击
                await clickId('clickButton');
                await clickId('clickButton');

                // 断言1：计数器精确增加 2
                let counterAfter: number = await counterValue();
                addLog('testCombination0002: counter %{public}d -> %{public}d', counterBefore, counterAfter);
                expect(counterAfter).assertEqual(counterBefore + 2);

                // 执行输入
                const inputComponent: Component = await waitId('textInput');
                await inputComponent.clearText();
                await getDriver().waitForIdle(300, 3000);
                await inputComponent.inputText('after clicks');
                await getDriver().waitForIdle(300, 3000);

                // 断言2：输入后计数器值未变
                expect(await counterValue()).assertEqual(counterAfter);

                // 断言3：输入框仍可定位
                let inputExists: boolean = await existsId('textInput');
                expect(inputExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_COMB_0300
         * @tc.name      testCombination0003
         * @tc.desc      Verify sequential list item clicks maintain page stability.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testCombination0003', 0, (done: Function) => {
            runCase('testCombination0003', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 点击第一个列表项
                await clickId('listItem_0');

                // 断言1：List item 0 仍存在
                let item0Exists: boolean = await existsId('listItem_0');
                addLog('testCombination0003: listItem_0 after click=%{public}s', String(item0Exists));
                expect(item0Exists).assertTrue();

                // 点击最后一个列表项
                await clickId('listItem_4');

                // 断言2：List item 4 仍存在
                let item4Exists: boolean = await existsId('listItem_4');
                expect(item4Exists).assertTrue();

                // 断言3：页面标题仍存在
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_COMB_0400
         * @tc.name      testCombination0004
         * @tc.desc      Verify text input followed by button click preserves both states.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testCombination0004', 0, (done: Function) => {
            runCase('testCombination0004', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 先输入文本（先清空残留内容）
                const inputComponent: Component = await waitId('textInput');
                await inputComponent.clearText();
                await getDriver().waitForIdle(300, 3000);
                await inputComponent.inputText('first action');
                await getDriver().waitForIdle(300, 3000);

                // 断言1：输入内容写入
                let inputText: string = await inputComponent.getOriginalText();
                addLog('testCombination0004: textInput content=%{public}s', inputText);
                expect(inputText).assertEqual('first action');

                // 再点击按钮
                let counterBefore: number = await counterValue();
                await clickId('clickButton');

                // 断言2：计数器精确加一
                expect(await counterValue()).assertEqual(counterBefore + 1);

                // 断言3：输入内容未被点击操作清空
                expect(await inputComponent.getOriginalText()).assertEqual('first action');
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_COMB_0500
         * @tc.name      testCombination0005
         * @tc.desc      Verify button click then list item click maintains page integrity.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testCombination0005', 0, (done: Function) => {
            runCase('testCombination0005', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 点击按钮
                let counterBefore: number = await counterValue();
                await clickId('clickButton');

                // 断言1：计数器精确加一
                let counterAfter: number = await counterValue();
                addLog('testCombination0005: counter %{public}d -> %{public}d', counterBefore, counterAfter);
                expect(counterAfter).assertEqual(counterBefore + 1);

                // 点击列表项
                await clickId('listItem_1');

                // 断言2：List item 1 仍存在
                let item1Exists: boolean = await existsId('listItem_1');
                expect(item1Exists).assertTrue();

                // 断言3：计数器值未变
                expect(await counterValue()).assertEqual(counterAfter);
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_COMB_0600
         * @tc.name      testCombination0006
         * @tc.desc      Verify multiple text inputs sequentially maintain page stability.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testCombination0006', 0, (done: Function) => {
            runCase('testCombination0006', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 第一次输入
                const inputComponent: Component = await waitId('textInput');
                await inputComponent.clearText();
                await getDriver().waitForIdle(300, 3000);
                await inputComponent.inputText('first');
                await getDriver().waitForIdle(300, 3000);

                // 断言1：首次输入内容正确
                let after1: string = await inputComponent.getOriginalText();
                addLog('testCombination0006: after first input=%{public}s', after1);
                expect(after1).assertEqual('first');

                // 第二次输入
                await inputComponent.clearText();
                await getDriver().waitForIdle(300, 3000);
                await inputComponent.inputText('second');
                await getDriver().waitForIdle(300, 3000);

                // 断言2：二次输入覆盖为最新内容
                let after2: string = await inputComponent.getOriginalText();
                expect(after2).assertEqual('second');

                // 断言3：页面标题仍存在
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_COMB_0700
         * @tc.name      testCombination0007
         * @tc.desc      Verify click, input, and list click combined interaction.
         * @tc.size      LargeTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testCombination0007', 0, (done: Function) => {
            runCase('testCombination0007', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 步骤1：点击按钮
                let counterBefore: number = await counterValue();
                await clickId('clickButton');
                let counterAfter: number = await counterValue();
                addLog('testCombination0007: counter %{public}d -> %{public}d', counterBefore, counterAfter);
                expect(counterAfter).assertEqual(counterBefore + 1);

                // 步骤2：输入文本
                const inputComponent: Component = await waitId('textInput');
                await inputComponent.clearText();
                await getDriver().waitForIdle(300, 3000);
                await inputComponent.inputText('combined');
                await getDriver().waitForIdle(300, 3000);
                let inputExists: boolean = await existsId('textInput');
                expect(inputExists).assertTrue();

                // 步骤3：点击列表项
                await clickId('listItem_2');
                let item2Exists: boolean = await existsId('listItem_2');
                expect(item2Exists).assertTrue();

                // 断言：计数器值未受后续操作影响
                expect(await counterValue()).assertEqual(counterAfter);
            }, done);
        });
    });
}
