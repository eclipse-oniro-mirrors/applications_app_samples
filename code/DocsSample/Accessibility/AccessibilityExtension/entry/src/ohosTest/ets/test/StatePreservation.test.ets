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
    startApp, clickId, waitId, existsId, existsText, existsDescription, textOfId, scrollToId, scrollToText,
    counterValue, runCase, addLog
} from '../testkit/SharedDriver';
import { parseTrailingNumber } from '../testkit/LocaleText';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AccessibilityExtension]';
const BUNDLE_NAME: string = 'com.samples.accessibilityextension';
const ABILITY_NAME: string = 'EntryAbility';

export default function statePreservationTest(): void {
    describe('StatePreservationTest', () => {
        beforeAll(() => {
            addLog('StatePreservationTest suite started');
        })

        beforeEach(() => {
        })

        afterEach(() => {
        })

        afterAll(() => {
            addLog('StatePreservationTest suite finished');
        })

        /**
         * @tc.number    SUB_A11Y_EXT_SPRES_0100
         * @tc.name      testStatePreservation0001
         * @tc.desc      Verify counter value is preserved after click.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testStatePreservation0001', 0, (done: Function) => {
            runCase('testStatePreservation0001', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);
                let counterBefore: number = await counterValue();
                await clickId('clickButton');

                // 断言1：点击后计数器 +1（应用未重建时沿用当前值，不做绝对断言）
                let counterText: string = await textOfId('counterText');
                addLog('testStatePreservation0001: before=%{public}d counter=%{public}s', counterBefore, counterText);
                expect(parseTrailingNumber(counterText)).assertEqual(counterBefore + 1);

                // 断言2：再次读取计数器值一致
                let counterText2: string = await textOfId('counterText');
                expect(counterText2).assertEqual(counterText);

                // 断言3：计数器组件仍存在
                let counterExists: boolean = await existsId('counterText');
                expect(counterExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_SPRES_0200
         * @tc.name      testStatePreservation0002
         * @tc.desc      Verify counter accumulates correctly after multiple clicks.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testStatePreservation0002', 0, (done: Function) => {
            runCase('testStatePreservation0002', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);
                let counterBefore: number = await counterValue();
                for (let i = 0; i < 3; i++) {
                    await clickId('clickButton');
                }

                // 断言1：三次点击后计数器 +3（应用未重建时沿用当前值，不做绝对断言）
                let counterText: string = await textOfId('counterText');
                addLog('testStatePreservation0002: before=%{public}d counter=%{public}s', counterBefore, counterText);
                expect(parseTrailingNumber(counterText)).assertEqual(counterBefore + 3);

                // 断言2：计数器组件仍存在
                let counterExists: boolean = await existsId('counterText');
                expect(counterExists).assertTrue();

                // 断言3：页面标题仍存在
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_SPRES_0300
         * @tc.name      testStatePreservation0003
         * @tc.desc      Verify input field component preserved after input.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testStatePreservation0003', 0, (done: Function) => {
            runCase('testStatePreservation0003', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);
                let inputComp = await waitId('textInput');
                await inputComp.inputText('preserve');

                // 断言1：输入框仍存在
                let inputExists: boolean = await existsId('textInput');
                expect(inputExists).assertTrue();

                // 断言2：再次验证输入框存在
                let inputExists2: boolean = await existsId('textInput');
                expect(inputExists2).assertTrue();

                // 断言3：Text Input 标题仍存在
                let sectionExists: boolean = await existsText('Text Input');
                expect(sectionExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_SPRES_0400
         * @tc.name      testStatePreservation0004
         * @tc.desc      Verify input field preserved after clicking other components.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testStatePreservation0004', 0, (done: Function) => {
            runCase('testStatePreservation0004', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);
                let inputComp = await waitId('textInput');
                await inputComp.inputText('preserve');
                await clickId('clickButton');

                // 断言1：输入框仍存在
                let inputExists: boolean = await existsId('textInput');
                expect(inputExists).assertTrue();

                // 断言2：按钮仍存在
                let btnExists: boolean = await existsId('clickButton');
                expect(btnExists).assertTrue();

                // 断言3：页面标题仍存在
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_SPRES_0500
         * @tc.name      testStatePreservation0005
         * @tc.desc      Verify counter value preserved after scrolling.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testStatePreservation0005', 0, (done: Function) => {
            runCase('testStatePreservation0005', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);
                let counterBefore: number = await counterValue();
                await clickId('clickButton');
                await scrollToId('listItem_4');

                // 断言1：滚动后计数器仍保持点击后的值
                let counterText: string = await textOfId('counterText');
                addLog('testStatePreservation0005: before=%{public}d counter=%{public}s', counterBefore, counterText);
                expect(parseTrailingNumber(counterText)).assertEqual(counterBefore + 1);

                // 断言2：计数器组件仍存在
                let counterExists: boolean = await existsId('counterText');
                expect(counterExists).assertTrue();

                // 断言3：页面标题仍存在
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_SPRES_0600
         * @tc.name      testStatePreservation0006
         * @tc.desc      Verify input field preserved after scrolling.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testStatePreservation0006', 0, (done: Function) => {
            runCase('testStatePreservation0006', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);
                let inputComp = await waitId('textInput');
                await inputComp.inputText('scroll');
                await scrollToText('Scrollable List');

                // 断言1：输入框仍存在
                let inputExists: boolean = await existsId('textInput');
                expect(inputExists).assertTrue();

                // 断言2：Text Input 标题仍存在
                let sectionExists: boolean = await existsText('Text Input');
                expect(sectionExists).assertTrue();

                // 断言3：页面标题仍存在
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_SPRES_0700
         * @tc.name      testStatePreservation0007
         * @tc.desc      Verify toggle component preserved after click.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testStatePreservation0007', 0, (done: Function) => {
            runCase('testStatePreservation0007', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);
                await clickId('toggleSwitch');

                // 断言1：Toggle 仍存在
                let toggleExists: boolean = await existsId('toggleSwitch');
                expect(toggleExists).assertTrue();

                // 断言2：Toggle Switch 标题仍存在
                let sectionExists: boolean = await existsText('Toggle Switch');
                expect(sectionExists).assertTrue();

                // 断言3：开关无障碍描述仍存在（accessibilityText 不入无障碍树）
                let labelExists: boolean = await existsDescription('Toggle switch that triggers select accessibility event');
                expect(labelExists).assertTrue();
            }, done);
        });
    });
}
