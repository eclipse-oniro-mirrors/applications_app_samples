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
    startApp, clickId, waitId, existsId, existsText, scrollToId, scrollToText,
    runCase, addLog
} from '../testkit/SharedDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AccessibilityExtension]';
const BUNDLE_NAME: string = 'com.samples.accessibilityextension';
const ABILITY_NAME: string = 'EntryAbility';

export default function pageStabilityTest(): void {
    describe('PageStabilityTest', () => {
        beforeAll(() => {
            addLog('PageStabilityTest suite started');
        })

        beforeEach(() => {
        })

        afterEach(() => {
        })

        afterAll(() => {
            addLog('PageStabilityTest suite finished');
        })

        /**
         * @tc.number    SUB_A11Y_EXT_PSTB_0100
         * @tc.name      testPageStability0001
         * @tc.desc      Verify page stability after clicking all buttons.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testPageStability0001', 0, (done: Function) => {
            runCase('testPageStability0001', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);
                await clickId('clickButton');
                await clickId('longClickButton');

                // 断言1：页面标题仍存在
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();

                // 断言2：clickButton 仍存在
                let clickBtn: boolean = await existsId('clickButton');
                expect(clickBtn).assertTrue();

                // 断言3：longClickButton 仍存在
                let longBtn: boolean = await existsId('longClickButton');
                expect(longBtn).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_PSTB_0200
         * @tc.name      testPageStability0002
         * @tc.desc      Verify page stability after input then scroll.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testPageStability0002', 0, (done: Function) => {
            runCase('testPageStability0002', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);
                let inputComp = await waitId('textInput');
                await inputComp.inputText('stability');
                await scrollToId('listItem_4');

                // 断言1：页面标题仍存在
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();

                // 断言2：输入框仍存在
                let inputExists: boolean = await existsId('textInput');
                expect(inputExists).assertTrue();

                // 断言3：列表项仍存在
                let itemExists: boolean = await existsId('listItem_0');
                expect(itemExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_PSTB_0300
         * @tc.name      testPageStability0003
         * @tc.desc      Verify page stability after clicking all list items.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testPageStability0003', 0, (done: Function) => {
            runCase('testPageStability0003', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);
                for (let i = 0; i < 5; i++) {
                    await clickId('listItem_' + i);
                }

                // 断言1：List item 0 仍存在
                let item0: boolean = await existsId('listItem_0');
                expect(item0).assertTrue();

                // 断言2：Scrollable List 标题仍存在
                let listSection: boolean = await existsText('Scrollable List');
                expect(listSection).assertTrue();

                // 断言3：页面标题仍存在
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_PSTB_0400
         * @tc.name      testPageStability0004
         * @tc.desc      Verify page stability after multiple toggle switches.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testPageStability0004', 0, (done: Function) => {
            runCase('testPageStability0004', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);
                for (let i = 0; i < 3; i++) {
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
         * @tc.number    SUB_A11Y_EXT_PSTB_0500
         * @tc.name      testPageStability0005
         * @tc.desc      Verify page stability after operating all components.
         * @tc.size      LargeTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testPageStability0005', 0, (done: Function) => {
            runCase('testPageStability0005', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);
                await clickId('clickButton');
                await clickId('longClickButton');
                let inputComp = await waitId('textInput');
                await inputComp.inputText('all');
                await clickId('toggleSwitch');
                await clickId('listItem_0');

                // 断言1：页面标题仍存在
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();

                // 断言2：按钮仍存在
                let btnExists: boolean = await existsId('clickButton');
                expect(btnExists).assertTrue();

                // 断言3：列表仍存在
                let listExists: boolean = await existsId('listItem_4');
                expect(listExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_PSTB_0600
         * @tc.name      testPageStability0006
         * @tc.desc      Verify page stability after scrolling top to bottom and back.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testPageStability0006', 0, (done: Function) => {
            runCase('testPageStability0006', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);
                await scrollToText('Accessibility Sample');
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
         * @tc.number    SUB_A11Y_EXT_PSTB_0700
         * @tc.name      testPageStability0007
         * @tc.desc      Verify all IDs remain locatable after full operation sequence.
         * @tc.size      LargeTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testPageStability0007', 0, (done: Function) => {
            runCase('testPageStability0007', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);
                await clickId('clickButton');
                await clickId('longClickButton');
                let inputComp = await waitId('textInput');
                await inputComp.inputText('seq');
                await clickId('toggleSwitch');
                await clickId('listItem_2');

                // 断言1：clickButton 存在
                let btn1: boolean = await existsId('clickButton');
                expect(btn1).assertTrue();

                // 断言2：textInput 存在
                let input: boolean = await existsId('textInput');
                expect(input).assertTrue();

                // 断言3：toggleSwitch 和 counterText 存在
                let toggle: boolean = await existsId('toggleSwitch');
                let counter: boolean = await existsId('counterText');
                expect(toggle && counter).assertTrue();
            }, done);
        });
    });
}
