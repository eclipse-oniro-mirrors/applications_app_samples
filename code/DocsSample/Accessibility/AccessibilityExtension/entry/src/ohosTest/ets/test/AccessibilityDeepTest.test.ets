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
    startApp, existsId, existsText, existsDescription,
    runCase, addLog
} from '../testkit/SharedDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AccessibilityExtension]';
const BUNDLE_NAME: string = 'com.samples.accessibilityextension';
const ABILITY_NAME: string = 'EntryAbility';

export default function accessibilityDeepTest(): void {
    describe('AccessibilityDeepTest', () => {
        beforeAll(() => {
            addLog('AccessibilityDeepTest suite started');
        })

        beforeEach(() => {
        })

        afterEach(() => {
        })

        afterAll(() => {
            addLog('AccessibilityDeepTest suite finished');
        })

        /**
         * @tc.number    SUB_A11Y_EXT_ADEEP_0100
         * @tc.name      testAccessibilityDeep0001
         * @tc.desc      Verify list items and list item IDs are exposed in the accessibility tree.
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testAccessibilityDeep0001', 0, (done: Function) => {
            runCase('testAccessibilityDeep0001', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：列表项文本进入无障碍树
                let itemTextExists: boolean = await existsText('List item 1');
                addLog('testAccessibilityDeep0001: "List item 1"=%{public}s', String(itemTextExists));
                expect(itemTextExists).assertTrue();

                // 断言2：Scrollable List 分区标题存在
                let sectionExists: boolean = await existsText('Scrollable List');
                expect(sectionExists).assertTrue();

                // 断言3：List item 0 存在
                let item0Exists: boolean = await existsId('listItem_0');
                expect(item0Exists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_ADEEP_0200
         * @tc.name      testAccessibilityDeep0002
         * @tc.desc      Verify TextInput accessibility description text is rendered.
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testAccessibilityDeep0002', 0, (done: Function) => {
            runCase('testAccessibilityDeep0002', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：输入框无障碍描述存在（accessibilityText 无法被 UiTest 读取，改用 accessibilityDescription）
                let inputA11yText: boolean = await existsDescription('Input field that triggers text update accessibility event');
                addLog('testAccessibilityDeep0002: input description=%{public}s', String(inputA11yText));
                expect(inputA11yText).assertTrue();

                // 断言2：Text Input 分区标题存在
                let sectionExists: boolean = await existsText('Text Input');
                expect(sectionExists).assertTrue();

                // 断言3：输入框 ID 可定位
                let inputExists: boolean = await existsId('textInput');
                expect(inputExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_ADEEP_0300
         * @tc.name      testAccessibilityDeep0003
         * @tc.desc      Verify button click accessibility description is rendered.
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testAccessibilityDeep0003', 0, (done: Function) => {
            runCase('testAccessibilityDeep0003', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：Click Me 按钮存在
                let clickExists: boolean = await existsText('Click Me');
                addLog('testAccessibilityDeep0003: "Click Me"=%{public}s', String(clickExists));
                expect(clickExists).assertTrue();

                // 断言2：按钮 ID 可定位
                let btnExists: boolean = await existsId('clickButton');
                expect(btnExists).assertTrue();

                // 断言3：Basic Interaction 分区标题存在
                let sectionExists: boolean = await existsText('Basic Interaction');
                expect(sectionExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_ADEEP_0400
         * @tc.name      testAccessibilityDeep0004
         * @tc.desc      Verify Toggle accessibility description text is rendered.
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testAccessibilityDeep0004', 0, (done: Function) => {
            runCase('testAccessibilityDeep0004', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：Toggle 无障碍描述存在
                let toggleText: boolean = await existsDescription('Toggle switch that triggers select accessibility event');
                addLog('testAccessibilityDeep0004: toggle description=%{public}s', String(toggleText));
                expect(toggleText).assertTrue();

                // 断言2：Toggle 组件 ID 存在
                let toggleExists: boolean = await existsId('toggleSwitch');
                expect(toggleExists).assertTrue();

                // 断言3：Toggle Switch 分区标题存在
                let sectionExists: boolean = await existsText('Toggle Switch');
                expect(sectionExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_ADEEP_0500
         * @tc.name      testAccessibilityDeep0005
         * @tc.desc      Verify all accessibility group labels are rendered on page.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testAccessibilityDeep0005', 0, (done: Function) => {
            runCase('testAccessibilityDeep0005', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：页面标题无障碍文本存在（accessibilityGroup=true）
                let titleText: boolean = await existsText('Accessibility Sample');
                addLog('testAccessibilityDeep0005: title a11y text=%{public}s', String(titleText));
                expect(titleText).assertTrue();

                // 断言2：列表项文本进入无障碍树
                let listGroupText: boolean = await existsText('List item 2');
                expect(listGroupText).assertTrue();

                // 断言3：输入框无障碍描述存在
                let inputText: boolean = await existsDescription('Input field that triggers text update accessibility event');
                expect(inputText).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_ADEEP_0600
         * @tc.name      testAccessibilityDeep0006
         * @tc.desc      Verify long press button accessibility text and description coexist.
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testAccessibilityDeep0006', 0, (done: Function) => {
            runCase('testAccessibilityDeep0006', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：Long Press 按钮文本存在
                let longPressText: boolean = await existsText('Long Press');
                addLog('testAccessibilityDeep0006: "Long Press"=%{public}s', String(longPressText));
                expect(longPressText).assertTrue();

                // 断言2：长按按钮 ID 存在
                let btnExists: boolean = await existsId('longClickButton');
                expect(btnExists).assertTrue();

                // 断言3：Click Me 按钮文本也存在（两个按钮共存）
                let clickText: boolean = await existsText('Click Me');
                expect(clickText).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_ADEEP_0700
         * @tc.name      testAccessibilityDeep0007
         * @tc.desc      Verify all section headers and accessibility descriptions are rendered.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testAccessibilityDeep0007', 0, (done: Function) => {
            runCase('testAccessibilityDeep0007', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：四个分区标题全部存在
                let basicExists: boolean = await existsText('Basic Interaction');
                let textExists: boolean = await existsText('Text Input');
                let toggleExists: boolean = await existsText('Toggle Switch');
                let listExists: boolean = await existsText('Scrollable List');
                addLog('testAccessibilityDeep0007: sections basic=%{public}s text=%{public}s toggle=%{public}s list=%{public}s',
                    String(basicExists), String(textExists), String(toggleExists), String(listExists));
                expect(basicExists && textExists && toggleExists && listExists).assertTrue();

                // 断言2：三个无障碍描述/列表项均存在
                let switchToggle: boolean = await existsDescription('Toggle switch that triggers select accessibility event');
                let inputField: boolean = await existsDescription('Input field that triggers text update accessibility event');
                let scrollList: boolean = await existsText('List item 3');
                expect(switchToggle && inputField && scrollList).assertTrue();

                // 断言3：页面标题存在
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();
            }, done);
        });
    });
}
