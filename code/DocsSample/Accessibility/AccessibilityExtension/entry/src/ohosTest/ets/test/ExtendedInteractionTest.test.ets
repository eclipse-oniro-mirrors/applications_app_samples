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

export default function extendedInteractionTest(): void {
    describe('ExtendedInteractionTest', () => {
        beforeAll(() => {
            addLog('ExtendedInteractionTest suite started');
        })

        beforeEach(() => {
        })

        afterEach(() => {
        })

        afterAll(() => {
            addLog('ExtendedInteractionTest suite finished');
        })

        /**
         * @tc.number    SUB_A11Y_EXT_EXINT_0100
         * @tc.name      testExtendedInteraction0001
         * @tc.desc      Verify counter increases by five after 5 clicks.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 1
         */
        it('testExtendedInteraction0001', 0, (done: Function) => {
            runCase('testExtendedInteraction0001', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 记录点击前计数器数值
                let counterBefore: number = await counterValue();

                // 执行 5 次点击
                await clickId('clickButton');
                await clickId('clickButton');
                await clickId('clickButton');
                await clickId('clickButton');
                await clickId('clickButton');

                // 断言1：计数器精确增加 5
                let counterAfter: number = await counterValue();
                addLog('testExtendedInteraction0001: counter %{public}d -> %{public}d', counterBefore, counterAfter);
                expect(counterAfter).assertEqual(counterBefore + 5);

                // 断言2：计数器包含标签
                let counterLabel: string = await textOfId('counterText');
                expect(counterLabel.includes(localizeText('Counter'))).assertTrue();

                // 断言3：按钮仍存在
                let btnExists: boolean = await existsId('clickButton');
                expect(btnExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_EXINT_0200
         * @tc.name      testExtendedInteraction0002
         * @tc.desc      Verify text input followed by button click preserves both states.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testExtendedInteraction0002', 0, (done: Function) => {
            runCase('testExtendedInteraction0002', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 先输入文本（先清空残留内容）
                const inputComponent: Component = await waitId('textInput');
                await inputComponent.clearText();
                await getDriver().waitForIdle(300, 3000);
                await inputComponent.inputText('extended test');
                await getDriver().waitForIdle(300, 3000);

                // 断言1：输入内容写入
                let inputText: string = await inputComponent.getOriginalText();
                addLog('testExtendedInteraction0002: textInput content=%{public}s', inputText);
                expect(inputText).assertEqual('extended test');

                // 再点击按钮
                let counterBefore: number = await counterValue();
                await clickId('clickButton');

                // 断言2：计数器精确加一
                expect(await counterValue()).assertEqual(counterBefore + 1);

                // 断言3：输入内容未被点击清空
                expect(await inputComponent.getOriginalText()).assertEqual('extended test');
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_EXINT_0300
         * @tc.name      testExtendedInteraction0003
         * @tc.desc      Verify sequential clicks on different list items maintain stability.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testExtendedInteraction0003', 0, (done: Function) => {
            runCase('testExtendedInteraction0003', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 依次点击不同列表项
                await clickId('listItem_0');
                await clickId('listItem_2');
                await clickId('listItem_4');

                // 断言1：List item 0 仍存在
                let item0Exists: boolean = await existsId('listItem_0');
                addLog('testExtendedInteraction0003: listItem_0=%{public}s', String(item0Exists));
                expect(item0Exists).assertTrue();

                // 断言2：List item 2 仍存在
                let item2Exists: boolean = await existsId('listItem_2');
                expect(item2Exists).assertTrue();

                // 断言3：页面标题仍存在
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_EXINT_0400
         * @tc.name      testExtendedInteraction0004
         * @tc.desc      Verify special character input followed by button click.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testExtendedInteraction0004', 0, (done: Function) => {
            runCase('testExtendedInteraction0004', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 输入特殊字符（先清空残留内容）
                const inputComponent: Component = await waitId('textInput');
                await inputComponent.clearText();
                await getDriver().waitForIdle(300, 3000);
                await inputComponent.inputText('!@#$%^&*()');
                await getDriver().waitForIdle(300, 3000);

                // 断言1：特殊字符完整写入
                let inputText: string = await inputComponent.getOriginalText();
                addLog('testExtendedInteraction0004: textInput content=%{public}s', inputText);
                expect(inputText).assertEqual('!@#$%^&*()');

                // 点击按钮
                let counterBefore: number = await counterValue();
                await clickId('clickButton');

                // 断言2：计数器精确加一
                expect(await counterValue()).assertEqual(counterBefore + 1);

                // 断言3：页面标题存在
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_EXINT_0500
         * @tc.name      testExtendedInteraction0005
         * @tc.desc      Verify multiple text inputs followed by list item click.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testExtendedInteraction0005', 0, (done: Function) => {
            runCase('testExtendedInteraction0005', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 多次输入（先清空残留内容）
                const inputComponent: Component = await waitId('textInput');
                await inputComponent.clearText();
                await getDriver().waitForIdle(300, 3000);
                await inputComponent.inputText('first');
                await getDriver().waitForIdle(300, 3000);
                await inputComponent.clearText();
                await getDriver().waitForIdle(300, 3000);
                await inputComponent.inputText('second');
                await getDriver().waitForIdle(300, 3000);

                // 断言1：最终输入内容为最后一次写入
                let inputText: string = await inputComponent.getOriginalText();
                addLog('testExtendedInteraction0005: textInput content=%{public}s', inputText);
                expect(inputText).assertEqual('second');

                // 点击列表项
                await clickId('listItem_1');

                // 断言2：List item 1 仍存在
                let item1Exists: boolean = await existsId('listItem_1');
                expect(item1Exists).assertTrue();

                // 断言3：页面标题存在
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_EXINT_0600
         * @tc.name      testExtendedInteraction0006
         * @tc.desc      Verify button click then toggle click then list click sequence.
         * @tc.size      LargeTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testExtendedInteraction0006', 0, (done: Function) => {
            runCase('testExtendedInteraction0006', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 步骤1：点击按钮
                let counterBefore: number = await counterValue();
                await clickId('clickButton');
                let counterAfter: number = await counterValue();
                addLog('testExtendedInteraction0006: counter %{public}d -> %{public}d', counterBefore, counterAfter);
                expect(counterAfter).assertEqual(counterBefore + 1);

                // 步骤2：点击 Toggle
                await clickId('toggleSwitch');
                let toggleExists: boolean = await existsId('toggleSwitch');
                expect(toggleExists).assertTrue();

                // 步骤3：点击列表项
                await clickId('listItem_3');
                let item3Exists: boolean = await existsId('listItem_3');
                expect(item3Exists).assertTrue();

                // 断言：计数器值未受后续操作影响
                expect(await counterValue()).assertEqual(counterAfter);
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_EXINT_0700
         * @tc.name      testExtendedInteraction0007
         * @tc.desc      Verify all components remain locatable after complex interaction sequence.
         * @tc.size      LargeTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testExtendedInteraction0007', 0, (done: Function) => {
            runCase('testExtendedInteraction0007', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 复杂交互序列
                let counterBefore: number = await counterValue();
                await clickId('clickButton');
                await clickId('clickButton');
                const inputComponent: Component = await waitId('textInput');
                await inputComponent.clearText();
                await getDriver().waitForIdle(300, 3000);
                await inputComponent.inputText('complex');
                await getDriver().waitForIdle(300, 3000);
                await clickId('toggleSwitch');
                await clickId('listItem_0');

                // 断言1：所有核心组件仍可定位
                let btnExists: boolean = await existsId('clickButton');
                let inputExists: boolean = await existsId('textInput');
                let toggleExists: boolean = await existsId('toggleSwitch');
                addLog('testExtendedInteraction0007: btn=%{public}s input=%{public}s toggle=%{public}s',
                    String(btnExists), String(inputExists), String(toggleExists));
                expect(btnExists && inputExists && toggleExists).assertTrue();

                // 断言2：计数器精确增加 2
                let counterAfter: number = await counterValue();
                addLog('testExtendedInteraction0007: counter %{public}d -> %{public}d', counterBefore, counterAfter);
                expect(counterAfter).assertEqual(counterBefore + 2);

                // 断言3：页面标题存在
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();
            }, done);
        });
    });
}
