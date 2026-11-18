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
import { startApp, waitId, waitText, waitDescription, existsId, existsText, existsDescription, runCase, addLog } from '../testkit/SharedDriver';
import { localizeText } from '../testkit/LocaleText';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AccessibilityExtension]';
const BUNDLE_NAME: string = 'com.samples.accessibilityextension';
const ABILITY_NAME: string = 'EntryAbility';

export default function accessibilityPropertyTest(): void {
    describe('AccessibilityPropertyTest', () => {
        beforeAll(() => {
            addLog('AccessibilityPropertyTest suite started');
        })

        beforeEach(() => {
        })

        afterEach(() => {
        })

        afterAll(() => {
            addLog('AccessibilityPropertyTest suite finished');
        })

        /**
         * @tc.number    SUB_A11Y_EXT_APROP_0100
         * @tc.name      testAccessibilityProperty0001
         * @tc.desc      Verify page title accessibility text is readable and non-empty.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testAccessibilityProperty0001', 0, (done: Function) => {
            runCase('testAccessibilityProperty0001', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：页面标题无障碍文本可定位
                let titleExists: boolean = await existsText('Accessibility Sample');
                addLog('testAccessibilityProperty0001: title exists=%{public}s', String(titleExists));
                expect(titleExists).assertTrue();

                // 断言2：获取标题组件文本非空
                let titleComponent = await waitText('Accessibility Sample');
                let titleText: string = await titleComponent.getText();
                expect(titleText.length > 0).assertTrue();

                // 断言3：标题文本精确匹配
                expect(titleText).assertEqual(localizeText('Accessibility Sample'));
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_APROP_0200
         * @tc.name      testAccessibilityProperty0002
         * @tc.desc      Verify Click Me button accessibility text matches display text.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testAccessibilityProperty0002', 0, (done: Function) => {
            runCase('testAccessibilityProperty0002', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：按钮无障碍文本可定位
                let btnExists: boolean = await existsText('Click Me');
                addLog('testAccessibilityProperty0002: Click Me exists=%{public}s', String(btnExists));
                expect(btnExists).assertTrue();

                // 断言2：按钮文本非空
                let btnComponent = await waitText('Click Me');
                let btnText: string = await btnComponent.getText();
                expect(btnText.length > 0).assertTrue();

                // 断言3：按钮文本包含 "Click Me"
                expect(btnText.includes(localizeText('Click Me'))).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_APROP_0300
         * @tc.name      testAccessibilityProperty0003
         * @tc.desc      Verify Long Press button accessibility text matches display text.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testAccessibilityProperty0003', 0, (done: Function) => {
            runCase('testAccessibilityProperty0003', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：长按按钮无障碍文本可定位
                let btnExists: boolean = await existsText('Long Press');
                addLog('testAccessibilityProperty0003: Long Press exists=%{public}s', String(btnExists));
                expect(btnExists).assertTrue();

                // 断言2：长按按钮文本非空
                let btnComponent = await waitText('Long Press');
                let btnText: string = await btnComponent.getText();
                expect(btnText.length > 0).assertTrue();

                // 断言3：按钮文本包含 "Long Press"
                expect(btnText.includes(localizeText('Long Press'))).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_APROP_0400
         * @tc.name      testAccessibilityProperty0004
         * @tc.desc      Verify counter accessibility label contains "Counter".
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testAccessibilityProperty0004', 0, (done: Function) => {
            runCase('testAccessibilityProperty0004', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：计数器组件可定位
                let counterExists: boolean = await existsId('counterText');
                addLog('testAccessibilityProperty0004: counterText exists=%{public}s', String(counterExists));
                expect(counterExists).assertTrue();

                // 断言2：计数器文本包含 "Counter"
                let counterComponent = await waitId('counterText');
                let counterText: string = await counterComponent.getText();
                addLog('testAccessibilityProperty0004: counter text=%{public}s', counterText);
                expect(counterText.includes(localizeText('Counter'))).assertTrue();

                // 断言3：计数器文本长度合理
                expect(counterText.length > 0).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_APROP_0500
         * @tc.name      testAccessibilityProperty0005
         * @tc.desc      Verify Toggle switch accessibility description is readable.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testAccessibilityProperty0005', 0, (done: Function) => {
            runCase('testAccessibilityProperty0005', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：Toggle 无障碍描述可定位（accessibilityText 不被测试框架暴露）
                let toggleDescExists: boolean = await existsDescription('Toggle switch that triggers select accessibility event');
                addLog('testAccessibilityProperty0005: toggle description exists=%{public}s', String(toggleDescExists));
                expect(toggleDescExists).assertTrue();

                // 断言2：获取 Toggle 描述文本非空
                let toggleComponent = await waitDescription('Toggle switch that triggers select accessibility event');
                let toggleDesc: string = await toggleComponent.getDescription();
                expect(toggleDesc.length > 0).assertTrue();

                // 断言3：描述文本与预期一致
                expect(toggleDesc).assertEqual(localizeText('Toggle switch that triggers select accessibility event'));
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_APROP_0600
         * @tc.name      testAccessibilityProperty0006
         * @tc.desc      Verify TextInput section accessibility label is rendered.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testAccessibilityProperty0006', 0, (done: Function) => {
            runCase('testAccessibilityProperty0006', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：Text Input 分区标题存在
                let sectionExists: boolean = await existsText('Text Input');
                addLog('testAccessibilityProperty0006: Text Input section=%{public}s', String(sectionExists));
                expect(sectionExists).assertTrue();

                // 断言2：输入框组件 ID 可定位
                let inputExists: boolean = await existsId('textInput');
                expect(inputExists).assertTrue();

                // 断言3：Toggle Switch 分区标题也存在（证明页面完整渲染）
                let toggleSectionExists: boolean = await existsText('Toggle Switch');
                expect(toggleSectionExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_APROP_0700
         * @tc.name      testAccessibilityProperty0007
         * @tc.desc      Verify list item accessibility text matches rendered text.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testAccessibilityProperty0007', 0, (done: Function) => {
            runCase('testAccessibilityProperty0007', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：List item 1 无障碍文本可定位
                let item1Exists: boolean = await existsText('List item 1');
                addLog('testAccessibilityProperty0007: List item 1 exists=%{public}s', String(item1Exists));
                expect(item1Exists).assertTrue();

                // 断言2：List item 1 文本内容精确匹配
                let item1Component = await waitText('List item 1');
                let item1Text: string = await item1Component.getText();
                expect(item1Text).assertEqual(localizeText('List item 1'));

                // 断言3：列表区域标题存在
                let listSectionExists: boolean = await existsText('Scrollable List');
                expect(listSectionExists).assertTrue();
            }, done);
        });
    });
}
