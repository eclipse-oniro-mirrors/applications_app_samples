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
 * WITHOUT WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
import {
    startApp, clickId, waitId, existsId, existsText, scrollToId, textOfId,
    runCase, addLog
} from '../testkit/SharedDriver';
import { localizeText } from '../testkit/LocaleText';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AccessibilityExtension]';
const BUNDLE_NAME: string = 'com.samples.accessibilityextension';
const ABILITY_NAME: string = 'EntryAbility';

export default function postInteractionReverifyTest(): void {
    describe('PostInteractionReverifyTest', () => {
        beforeAll(() => {
            addLog('PostInteractionReverifyTest suite started');
        })

        beforeEach(() => {
        })

        afterEach(() => {
        })

        afterAll(() => {
            addLog('PostInteractionReverifyTest suite finished');
        })

        /**
         * @tc.number    SUB_A11Y_EXT_PIRV_0100
         * @tc.name      testPostInteractionReverify0001
         * @tc.desc      Verify all core components remain locatable after clicking button.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testPostInteractionReverify0001', 0, (done: Function) => {
            runCase('testPostInteractionReverify0001', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);
                await clickId('clickButton');

                // 断言1：按钮仍可定位
                let btnExists: boolean = await existsId('clickButton');
                expect(btnExists).assertTrue();

                // 断言2：计数器仍可定位
                let counterExists: boolean = await existsId('counterText');
                expect(counterExists).assertTrue();

                // 断言3：输入框仍可定位
                let inputExists: boolean = await existsId('textInput');
                expect(inputExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_PIRV_0200
         * @tc.name      testPostInteractionReverify0002
         * @tc.desc      Verify all core components remain locatable after text input.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testPostInteractionReverify0002', 0, (done: Function) => {
            runCase('testPostInteractionReverify0002', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);
                let inputComp = await waitId('textInput');
                await inputComp.inputText('test');

                // 断言1：输入框仍可定位
                let inputExists: boolean = await existsId('textInput');
                expect(inputExists).assertTrue();

                // 断言2：按钮仍可定位
                let btnExists: boolean = await existsId('clickButton');
                expect(btnExists).assertTrue();

                // 断言3：页面标题仍可定位
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_PIRV_0300
         * @tc.name      testPostInteractionReverify0003
         * @tc.desc      Verify all core components remain locatable after toggle click.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testPostInteractionReverify0003', 0, (done: Function) => {
            runCase('testPostInteractionReverify0003', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);
                await clickId('toggleSwitch');

                // 断言1：Toggle 仍可定位
                let toggleExists: boolean = await existsId('toggleSwitch');
                expect(toggleExists).assertTrue();

                // 断言2：按钮仍可定位
                let btnExists: boolean = await existsId('clickButton');
                expect(btnExists).assertTrue();

                // 断言3：输入框仍可定位
                let inputExists: boolean = await existsId('textInput');
                expect(inputExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_PIRV_0400
         * @tc.name      testPostInteractionReverify0004
         * @tc.desc      Verify all components remain locatable after list item click.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testPostInteractionReverify0004', 0, (done: Function) => {
            runCase('testPostInteractionReverify0004', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);
                await clickId('listItem_0');

                // 断言1：List item 0 仍可定位
                let item0Exists: boolean = await existsId('listItem_0');
                expect(item0Exists).assertTrue();

                // 断言2：List item 4 仍可定位
                let item4Exists: boolean = await existsId('listItem_4');
                expect(item4Exists).assertTrue();

                // 断言3：列表区域标题仍可定位
                let listSection: boolean = await existsText('Scrollable List');
                expect(listSection).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_PIRV_0500
         * @tc.name      testPostInteractionReverify0005
         * @tc.desc      Verify all components remain locatable after scrolling.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testPostInteractionReverify0005', 0, (done: Function) => {
            runCase('testPostInteractionReverify0005', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);
                await scrollToId('listItem_4');

                // 断言1：按钮仍可定位
                let btnExists: boolean = await existsId('clickButton');
                expect(btnExists).assertTrue();

                // 断言2：输入框仍可定位
                let inputExists: boolean = await existsId('textInput');
                expect(inputExists).assertTrue();

                // 断言3：Toggle 仍可定位
                let toggleExists: boolean = await existsId('toggleSwitch');
                expect(toggleExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_PIRV_0600
         * @tc.name      testPostInteractionReverify0006
         * @tc.desc      Verify all texts remain locatable after multiple operations.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testPostInteractionReverify0006', 0, (done: Function) => {
            runCase('testPostInteractionReverify0006', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);
                await clickId('clickButton');
                let inputComp = await waitId('textInput');
                await inputComp.inputText('verify');
                await clickId('clickButton');

                // 断言1：Click Me 文本仍可定位
                let clickText: boolean = await existsText('Click Me');
                expect(clickText).assertTrue();

                // 断言2：Long Press 文本仍可定位
                let longText: boolean = await existsText('Long Press');
                expect(longText).assertTrue();

                // 断言3：计数器标签文本仍正确
                let counterLabel: string = await textOfId('counterText');
                addLog('testPostInteractionReverify0006: counter=%{public}s', counterLabel);
                expect(counterLabel.includes(localizeText('Counter'))).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_PIRV_0700
         * @tc.name      testPostInteractionReverify0007
         * @tc.desc      Verify page integrity after full operation sequence.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testPostInteractionReverify0007', 0, (done: Function) => {
            runCase('testPostInteractionReverify0007', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);
                await clickId('clickButton');
                let inputComp = await waitId('textInput');
                await inputComp.inputText('full');
                await clickId('toggleSwitch');
                await clickId('listItem_0');
                await scrollToId('listItem_4');

                // 断言1：页面标题仍存在
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();

                // 断言2：按钮仍存在
                let btnExists: boolean = await existsId('clickButton');
                expect(btnExists).assertTrue();

                // 断言3：计数器仍存在
                let counterExists: boolean = await existsId('counterText');
                expect(counterExists).assertTrue();
            }, done);
        });
    });
}
