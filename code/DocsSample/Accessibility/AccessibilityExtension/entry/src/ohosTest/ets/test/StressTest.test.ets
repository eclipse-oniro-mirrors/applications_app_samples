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
    startApp, clickId, waitId, getDriver, existsId, existsText, textOfId, scrollToId, counterValue,
    runCase, addLog
} from '../testkit/SharedDriver';
import { localizeText } from '../testkit/LocaleText';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AccessibilityExtension]';
const BUNDLE_NAME: string = 'com.samples.accessibilityextension';
const ABILITY_NAME: string = 'EntryAbility';

export default function stressTest(): void {
    describe('StressTestTest', () => {
        beforeAll(() => {
            addLog('StressTestTest suite started');
        })

        beforeEach(() => {
        })

        afterEach(() => {
        })

        afterAll(() => {
            addLog('StressTestTest suite finished');
        })

        /**
         * @tc.number    SUB_A11Y_EXT_STRS_0100
         * @tc.name      testStress0001
         * @tc.desc      Verify page stability after 10 rapid clicks on button.
         * @tc.size      LargeTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testStress0001', 0, (done: Function) => {
            runCase('testStress0001', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 执行 10 次快速点击
                for (let i = 0; i < 10; i++) {
                    await clickId('clickButton');
                }

                // 断言1：按钮仍存在
                let btnExists: boolean = await existsId('clickButton');
                expect(btnExists).assertTrue();

                // 断言2：计数器文本包含 Counter
                let counterText: string = await textOfId('counterText');
                addLog('testStress0001: counter after 10 clicks: %{public}s', counterText);
                expect(counterText.includes(localizeText('Counter'))).assertTrue();

                // 断言3：页面标题仍存在
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_STRS_0200
         * @tc.name      testStress0002
         * @tc.desc      Verify counter increases by 10 after 10 rapid clicks.
         * @tc.size      LargeTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testStress0002', 0, (done: Function) => {
            runCase('testStress0002', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 记录点击前计数器数值
                let counterBefore: number = await counterValue();

                // 执行 10 次快速点击
                for (let i = 0; i < 10; i++) {
                    await clickId('clickButton');
                }

                // 断言1：计数器精确增加 10
                let counterAfter: number = await counterValue();
                addLog('testStress0002: counter %{public}d -> %{public}d', counterBefore, counterAfter);
                expect(counterAfter).assertEqual(counterBefore + 10);

                // 断言2：按钮仍存在
                let btnExists: boolean = await existsId('clickButton');
                expect(btnExists).assertTrue();

                // 断言3：页面标题仍存在
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_STRS_0300
         * @tc.name      testStress0003
         * @tc.desc      Verify input field stability after multiple text inputs.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testStress0003', 0, (done: Function) => {
            runCase('testStress0003', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 执行 3 次连续输入（先清空残留内容）
                const inputComp: Component = await waitId('textInput');
                await inputComp.clearText();
                await getDriver().waitForIdle(300, 3000);
                await inputComp.inputText('first');
                await inputComp.clearText();
                await getDriver().waitForIdle(300, 3000);
                await inputComp.inputText('second');
                await inputComp.clearText();
                await getDriver().waitForIdle(300, 3000);
                await inputComp.inputText('third');
                await getDriver().waitForIdle(300, 3000);

                // 断言1：最终输入内容为最后一次写入
                let inputText: string = await inputComp.getOriginalText();
                addLog('testStress0003: textInput content=%{public}s', inputText);
                expect(inputText).assertEqual('third');

                // 断言2：Text Input 标题仍存在
                let sectionExists: boolean = await existsText('Text Input');
                expect(sectionExists).assertTrue();

                // 断言3：页面标题仍存在
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_STRS_0400
         * @tc.name      testStress0004
         * @tc.desc      Verify page stability after 5 rapid toggle clicks.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testStress0004', 0, (done: Function) => {
            runCase('testStress0004', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 执行 5 次快速 Toggle 点击
                for (let i = 0; i < 5; i++) {
                    await clickId('toggleSwitch');
                }

                // 断言1：Toggle 仍存在
                let toggleExists: boolean = await existsId('toggleSwitch');
                expect(toggleExists).assertTrue();

                // 断言2：Toggle Switch 标题仍存在
                let sectionExists: boolean = await existsText('Toggle Switch');
                expect(sectionExists).assertTrue();

                // 断言3：页面标题仍存在
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_STRS_0500
         * @tc.name      testStress0005
         * @tc.desc      Verify page stability after clicking all list items sequentially.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testStress0005', 0, (done: Function) => {
            runCase('testStress0005', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 依次点击所有列表项
                for (let i = 0; i < 5; i++) {
                    await clickId('listItem_' + i);
                }

                // 断言1：List item 0 仍存在
                let item0Exists: boolean = await existsId('listItem_0');
                expect(item0Exists).assertTrue();

                // 断言2：Scrollable List 标题仍存在
                let listSection: boolean = await existsText('Scrollable List');
                expect(listSection).assertTrue();

                // 断言3：页面标题仍存在
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_STRS_0600
         * @tc.name      testStress0006
         * @tc.desc      Verify page stability after multiple scroll operations.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testStress0006', 0, (done: Function) => {
            runCase('testStress0006', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 执行 3 次滚动
                await scrollToId('listItem_4');
                await scrollToId('listItem_0');
                await scrollToId('listItem_4');

                // 断言1：页面标题仍存在
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();

                // 断言2：按钮仍存在
                let btnExists: boolean = await existsId('clickButton');
                expect(btnExists).assertTrue();

                // 断言3：列表区域标题仍存在
                let listSection: boolean = await existsText('Scrollable List');
                expect(listSection).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_STRS_0700
         * @tc.name      testStress0007
         * @tc.desc      Verify page stability after mixed rapid operations.
         * @tc.size      LargeTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testStress0007', 0, (done: Function) => {
            runCase('testStress0007', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 混合操作序列
                await clickId('clickButton');
                const inputComp: Component = await waitId('textInput');
                await inputComp.clearText();
                await getDriver().waitForIdle(300, 3000);
                await inputComp.inputText('stress');
                await getDriver().waitForIdle(300, 3000);
                await scrollToId('listItem_4');
                await clickId('clickButton');

                // 断言1：按钮仍存在
                let btnExists: boolean = await existsId('clickButton');
                expect(btnExists).assertTrue();

                // 断言2：输入内容未被滚动与点击操作清空（重新定位以避免不可见句柄）
                const inputAfterScroll: Component = await waitId('textInput');
                let inputText: string = await inputAfterScroll.getOriginalText();
                expect(inputText).assertEqual('stress');

                // 断言3：页面标题仍存在
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_STRS_0800
         * @tc.name      testStress0008
         * @tc.desc      Verify counter increases by 20 after 20 rapid clicks.
         * @tc.size      LargeTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testStress0008', 0, (done: Function) => {
            runCase('testStress0008', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 记录点击前计数器数值
                let counterBefore: number = await counterValue();

                // 执行 20 次快速点击
                for (let i = 0; i < 20; i++) {
                    await clickId('clickButton');
                }

                // 断言1：计数器精确增加 20
                let counterAfter: number = await counterValue();
                addLog('testStress0008: counter %{public}d -> %{public}d', counterBefore, counterAfter);
                expect(counterAfter).assertEqual(counterBefore + 20);

                // 断言2：按钮仍存在
                let btnExists: boolean = await existsId('clickButton');
                expect(btnExists).assertTrue();

                // 断言3：页面标题仍存在
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();
            }, done);
        });
    });
}
