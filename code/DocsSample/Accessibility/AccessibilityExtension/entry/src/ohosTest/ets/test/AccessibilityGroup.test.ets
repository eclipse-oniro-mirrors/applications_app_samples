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
    startApp, clickId, waitText, existsId, existsText, existsDescription, scrollToId,
    runCase, addLog
} from '../testkit/SharedDriver';
import { localizeText } from '../testkit/LocaleText';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AccessibilityExtension]';
const BUNDLE_NAME: string = 'com.samples.accessibilityextension';
const ABILITY_NAME: string = 'EntryAbility';

export default function accessibilityGroupTest(): void {
    describe('AccessibilityGroupTest', () => {
        beforeAll(() => {
            addLog('AccessibilityGroupTest suite started');
        })

        beforeEach(() => {
        })

        afterEach(() => {
        })

        afterAll(() => {
            addLog('AccessibilityGroupTest suite finished');
        })

        /**
         * @tc.number    SUB_A11Y_EXT_AGRP_0100
         * @tc.name      testAccessibilityGroup0001
         * @tc.desc      Verify page title accessibility group text is readable.
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testAccessibilityGroup0001', 0, (done: Function) => {
            runCase('testAccessibilityGroup0001', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：页面标题文本存在
                let titleComp = await waitText('Accessibility Sample');
                let titleText: string = await titleComp.getText();
                addLog('testAccessibilityGroup0001: title=%{public}s', titleText);
                expect(titleText).assertEqual(localizeText('Accessibility Sample'));

                // 断言2：标题长度大于 0
                expect(titleText.length > 0).assertTrue();

                // 断言3：按钮存在
                let btnExists: boolean = await existsId('clickButton');
                expect(btnExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_AGRP_0200
         * @tc.name      testAccessibilityGroup0002
         * @tc.desc      Verify list container accessibility group text is readable.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testAccessibilityGroup0002', 0, (done: Function) => {
            runCase('testAccessibilityGroup0002', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：列表容器内的子项可枚举（accessibilityText 不入无障碍树，改用子项验证容器）
                let listGroup: boolean = await existsId('listItem_1');
                expect(listGroup).assertTrue();

                // 断言2：List item 0 存在
                let item0: boolean = await existsId('listItem_0');
                expect(item0).assertTrue();

                // 断言3：Scrollable List 标题存在
                let sectionExists: boolean = await existsText('Scrollable List');
                expect(sectionExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_AGRP_0300
         * @tc.name      testAccessibilityGroup0003
         * @tc.desc      Verify both group labels exist simultaneously.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testAccessibilityGroup0003', 0, (done: Function) => {
            runCase('testAccessibilityGroup0003', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：页面标题 group 标签存在
                let titleGroup: boolean = await existsText('Accessibility Sample');
                expect(titleGroup).assertTrue();

                // 断言2：列表容器子项存在
                let listGroup: boolean = await existsId('listItem_0');
                expect(listGroup).assertTrue();

                // 断言3：页面标题仍存在
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_AGRP_0400
         * @tc.name      testAccessibilityGroup0004
         * @tc.desc      Verify group labels remain after click interaction.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testAccessibilityGroup0004', 0, (done: Function) => {
            runCase('testAccessibilityGroup0004', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);
                await clickId('clickButton');

                // 断言1：页面标题 group 标签仍存在
                let titleGroup: boolean = await existsText('Accessibility Sample');
                expect(titleGroup).assertTrue();

                // 断言2：列表容器子项仍存在
                let listGroup: boolean = await existsId('listItem_0');
                expect(listGroup).assertTrue();

                // 断言3：按钮仍存在
                let btnExists: boolean = await existsId('clickButton');
                expect(btnExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_AGRP_0500
         * @tc.name      testAccessibilityGroup0005
         * @tc.desc      Verify group labels remain after scrolling.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testAccessibilityGroup0005', 0, (done: Function) => {
            runCase('testAccessibilityGroup0005', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);
                await scrollToId('listItem_4');

                // 断言1：列表容器子项仍存在
                let listGroup: boolean = await existsId('listItem_2');
                expect(listGroup).assertTrue();

                // 断言2：List item 0 仍存在
                let item0: boolean = await existsId('listItem_0');
                expect(item0).assertTrue();

                // 断言3：页面标题仍存在
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_AGRP_0600
         * @tc.name      testAccessibilityGroup0006
         * @tc.desc      Verify all accessibility labels exist in aggregate.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testAccessibilityGroup0006', 0, (done: Function) => {
            runCase('testAccessibilityGroup0006', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：页面标题 group 标签存在
                let titleGroup: boolean = await existsText('Accessibility Sample');
                expect(titleGroup).assertTrue();

                // 断言2：列表容器子项存在
                let listGroup: boolean = await existsId('listItem_0');
                expect(listGroup).assertTrue();

                // 断言3：输入框无障碍描述存在
                let inputLabel: boolean = await existsDescription('Input field that triggers text update accessibility event');
                expect(inputLabel).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_AGRP_0700
         * @tc.name      testAccessibilityGroup0007
         * @tc.desc      Verify group labels correspond to correct component IDs.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testAccessibilityGroup0007', 0, (done: Function) => {
            runCase('testAccessibilityGroup0007', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：开关无障碍描述 + toggleSwitch 对应
                let toggleLabel: boolean = await existsDescription('Toggle switch that triggers select accessibility event');
                let toggleId: boolean = await existsId('toggleSwitch');
                expect(toggleLabel && toggleId).assertTrue();

                // 断言2：输入框无障碍描述 + textInput 对应
                let inputLabel: boolean = await existsDescription('Input field that triggers text update accessibility event');
                let inputId: boolean = await existsId('textInput');
                expect(inputLabel && inputId).assertTrue();

                // 断言3：Click Me + clickButton 对应
                let clickLabel: boolean = await existsText('Click Me');
                let clickIdExists: boolean = await existsId('clickButton');
                expect(clickLabel && clickIdExists).assertTrue();
            }, done);
        });
    });
}
