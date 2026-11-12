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
    startApp, clickId, existsId, existsText, existsDescription, counterValue,
    runCase, addLog
} from '../testkit/SharedDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AccessibilityExtension]';
const BUNDLE_NAME: string = 'com.samples.accessibilityextension';
const ABILITY_NAME: string = 'EntryAbility';

export default function multiStartConsistencyTest(): void {
    describe('MultiStartConsistencyTest', () => {
        beforeAll(() => {
            addLog('MultiStartConsistencyTest suite started');
        })

        beforeEach(() => {
        })

        afterEach(() => {
        })

        afterAll(() => {
            addLog('MultiStartConsistencyTest suite finished');
        })

        /**
         * @tc.number    SUB_A11Y_EXT_MSC_0100
         * @tc.name      testMultiStartConsistency0001
         * @tc.desc      Verify page renders completely on second launch.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testMultiStartConsistency0001', 0, (done: Function) => {
            runCase('testMultiStartConsistency0001', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：页面标题存在
                let title: boolean = await existsText('Accessibility Sample');
                expect(title).assertTrue();

                // 断言2：按钮存在
                let btn: boolean = await existsId('clickButton');
                expect(btn).assertTrue();

                // 断言3：输入框存在
                let input: boolean = await existsId('textInput');
                expect(input).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_MSC_0200
         * @tc.name      testMultiStartConsistency0002
         * @tc.desc      Verify counter value is preserved after relaunch.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testMultiStartConsistency0002', 0, (done: Function) => {
            runCase('testMultiStartConsistency0002', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);
                let counterBefore: number = await counterValue();
                await clickId('clickButton');
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：再次拉起后计数器保留点击结果（startAbility 复用已有页面实例，不重建）
                let counterAfter: number = await counterValue();
                addLog('testMultiStartConsistency0002: before=%{public}d after=%{public}d', counterBefore, counterAfter);
                expect(counterAfter).assertEqual(counterBefore + 1);

                // 断言2：计数器组件存在
                let counterExists: boolean = await existsId('counterText');
                expect(counterExists).assertTrue();

                // 断言3：页面标题存在
                let title: boolean = await existsText('Accessibility Sample');
                expect(title).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_MSC_0300
         * @tc.name      testMultiStartConsistency0003
         * @tc.desc      Verify all components locatable on third launch.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testMultiStartConsistency0003', 0, (done: Function) => {
            runCase('testMultiStartConsistency0003', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);
                await startApp(BUNDLE_NAME, ABILITY_NAME);
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：clickButton 和 textInput 存在
                let btn: boolean = await existsId('clickButton');
                let input: boolean = await existsId('textInput');
                expect(btn && input).assertTrue();

                // 断言2：toggleSwitch 存在
                let toggle: boolean = await existsId('toggleSwitch');
                expect(toggle).assertTrue();

                // 断言3：counterText 存在
                let counter: boolean = await existsId('counterText');
                expect(counter).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_MSC_0400
         * @tc.name      testMultiStartConsistency0004
         * @tc.desc      Verify all texts locatable after fresh launch.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testMultiStartConsistency0004', 0, (done: Function) => {
            runCase('testMultiStartConsistency0004', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：Click Me 和 Long Press 文本存在
                let clickMe: boolean = await existsText('Click Me');
                let longPress: boolean = await existsText('Long Press');
                expect(clickMe && longPress).assertTrue();

                // 断言2：Toggle Switch 标题存在
                let toggleSection: boolean = await existsText('Toggle Switch');
                expect(toggleSection).assertTrue();

                // 断言3：页面标题存在
                let title: boolean = await existsText('Accessibility Sample');
                expect(title).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_MSC_0500
         * @tc.name      testMultiStartConsistency0005
         * @tc.desc      Verify list items complete after fresh launch.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testMultiStartConsistency0005', 0, (done: Function) => {
            runCase('testMultiStartConsistency0005', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：listItem_0 和 listItem_4 存在
                let item0: boolean = await existsId('listItem_0');
                let item4: boolean = await existsId('listItem_4');
                expect(item0 && item4).assertTrue();

                // 断言2：List item 1 文本存在
                let text1: boolean = await existsText('List item 1');
                expect(text1).assertTrue();

                // 断言3：Scrollable List 标题存在
                let listSection: boolean = await existsText('Scrollable List');
                expect(listSection).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_MSC_0600
         * @tc.name      testMultiStartConsistency0006
         * @tc.desc      Verify accessibility descriptions complete after fresh launch.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testMultiStartConsistency0006', 0, (done: Function) => {
            runCase('testMultiStartConsistency0006', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：开关与输入框的无障碍描述存在（accessibilityText 不入无障碍树）
                let toggleLabel: boolean = await existsDescription('Toggle switch that triggers select accessibility event');
                let inputLabel: boolean = await existsDescription('Input field that triggers text update accessibility event');
                expect(toggleLabel && inputLabel).assertTrue();

                // 断言2：列表容器子项存在
                let listLabel: boolean = await existsId('listItem_0');
                expect(listLabel).assertTrue();

                // 断言3：页面标题存在
                let title: boolean = await existsText('Accessibility Sample');
                expect(title).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_MSC_0700
         * @tc.name      testMultiStartConsistency0007
         * @tc.desc      Verify interaction works normally after fresh launch.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testMultiStartConsistency0007', 0, (done: Function) => {
            runCase('testMultiStartConsistency0007', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);
                await startApp(BUNDLE_NAME, ABILITY_NAME);
                let counterBefore: number = await counterValue();
                await clickId('clickButton');

                // 断言1：点击后计数器 +1（应用未重建时沿用当前值，不做绝对断言）
                let counterAfter: number = await counterValue();
                addLog('testMultiStartConsistency0007: before=%{public}d after=%{public}d', counterBefore, counterAfter);
                expect(counterAfter).assertEqual(counterBefore + 1);

                // 断言2：计数器组件存在
                let counterExists: boolean = await existsId('counterText');
                expect(counterExists).assertTrue();

                // 断言3：页面标题存在
                let title: boolean = await existsText('Accessibility Sample');
                expect(title).assertTrue();
            }, done);
        });
    });
}
