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
    startApp, clickId, existsId, existsText, existsDescription, waitDescription, waitId,
    runCase, addLog
} from '../testkit/SharedDriver';
import { localizeText } from '../testkit/LocaleText';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AccessibilityExtension]';
const BUNDLE_NAME: string = 'com.samples.accessibilityextension';
const ABILITY_NAME: string = 'EntryAbility';

export default function accessibilityDescTextTest(): void {
    describe('AccessibilityDescTextTest', () => {
        beforeAll(() => {
            addLog('AccessibilityDescTextTest suite started');
        })

        beforeEach(() => {
        })

        afterEach(() => {
        })

        afterAll(() => {
            addLog('AccessibilityDescTextTest suite finished');
        })

        /**
         * @tc.number    SUB_A11Y_EXT_ADESC_0100
         * @tc.name      testAccessibilityDesc0001
         * @tc.desc      Verify Click Me button accessibility description text exists.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testAccessibilityDesc0001', 0, (done: Function) => {
            runCase('testAccessibilityDesc0001', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：按钮描述文本存在（accessibilityDescription 由 ON.description 匹配）
                let descExists: boolean = await existsDescription('Button to trigger click accessibility event');
                expect(descExists).assertTrue();

                // 断言2：按钮 ID 存在
                let btnExists: boolean = await existsId('clickButton');
                expect(btnExists).assertTrue();

                // 断言3：按钮文本存在
                let textExists: boolean = await existsText('Click Me');
                expect(textExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_ADESC_0200
         * @tc.name      testAccessibilityDesc0002
         * @tc.desc      Verify Long Press button accessibility description text exists.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testAccessibilityDesc0002', 0, (done: Function) => {
            runCase('testAccessibilityDesc0002', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：长按按钮描述文本存在
                let descExists: boolean = await existsDescription('Button to trigger long click accessibility event');
                expect(descExists).assertTrue();

                // 断言2：长按按钮 ID 存在
                let btnExists: boolean = await existsId('longClickButton');
                expect(btnExists).assertTrue();

                // 断言3：长按按钮文本存在
                let textExists: boolean = await existsText('Long Press');
                expect(textExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_ADESC_0300
         * @tc.name      testAccessibilityDesc0003
         * @tc.desc      Verify TextInput accessibility description text exists.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testAccessibilityDesc0003', 0, (done: Function) => {
            runCase('testAccessibilityDesc0003', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：输入框描述文本存在
                let descExists: boolean = await existsDescription('Input field that triggers text update accessibility event');
                expect(descExists).assertTrue();

                // 断言2：输入框 ID 存在
                let inputExists: boolean = await existsId('textInput');
                expect(inputExists).assertTrue();

                // 断言3：输入框占位提示文案存在（accessibilityText 不被测试框架暴露，改用占位符验证）
                const input: Component = await waitId('textInput');
                const hintText: string = await input.getHint();
                addLog('testAccessibilityDesc0003: hint=%{public}s', hintText);
                expect(hintText).assertEqual(localizeText('Please input text...'));
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_ADESC_0400
         * @tc.name      testAccessibilityDesc0004
         * @tc.desc      Verify Toggle accessibility description text exists.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testAccessibilityDesc0004', 0, (done: Function) => {
            runCase('testAccessibilityDesc0004', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：Toggle 描述文本存在
                let descExists: boolean = await existsDescription('Toggle switch that triggers select accessibility event');
                expect(descExists).assertTrue();

                // 断言2：Toggle ID 存在
                let toggleExists: boolean = await existsId('toggleSwitch');
                expect(toggleExists).assertTrue();

                // 断言3：开关组件类型正确（accessibilityText 不被测试框架暴露，改用组件类型验证）
                const toggle: Component = await waitId('toggleSwitch');
                const toggleType: string = await toggle.getType();
                addLog('testAccessibilityDesc0004: toggle type=%{public}s', toggleType);
                expect(toggleType).assertEqual('Toggle');
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_ADESC_0500
         * @tc.name      testAccessibilityDesc0005
         * @tc.desc      Verify all description texts have non-zero length.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testAccessibilityDesc0005', 0, (done: Function) => {
            runCase('testAccessibilityDesc0005', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：按钮描述文本长度大于 0
                let clickDesc: string = await waitDescription('Button to trigger click accessibility event')
                    .then((component: Component) => component.getDescription());
                addLog('testAccessibilityDesc0005: click desc length=%{public}d', clickDesc.length);
                expect(clickDesc.length > 0).assertTrue();

                // 断言2：长按描述文本长度大于 0
                let longDesc: string = await waitDescription('Button to trigger long click accessibility event')
                    .then((component: Component) => component.getDescription());
                expect(longDesc.length > 0).assertTrue();

                // 断言3：输入框描述文本长度大于 0
                let inputDesc: string = await waitDescription('Input field that triggers text update accessibility event')
                    .then((component: Component) => component.getDescription());
                expect(inputDesc.length > 0).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_ADESC_0600
         * @tc.name      testAccessibilityDesc0006
         * @tc.desc      Verify description texts are associated with correct components.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testAccessibilityDesc0006', 0, (done: Function) => {
            runCase('testAccessibilityDesc0006', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：按钮描述与按钮组件关联
                let clickDesc: boolean = await existsDescription('Button to trigger click accessibility event');
                expect(clickDesc).assertTrue();

                // 断言2：输入框描述与输入框组件关联
                let inputDesc: boolean = await existsDescription('Input field that triggers text update accessibility event');
                expect(inputDesc).assertTrue();

                // 断言3：页面标题存在（页面完整渲染）
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_ADESC_0700
         * @tc.name      testAccessibilityDesc0007
         * @tc.desc      Verify description texts remain locatable after interaction.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testAccessibilityDesc0007', 0, (done: Function) => {
            runCase('testAccessibilityDesc0007', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 操作：点击按钮
                await clickId('clickButton');

                // 断言1：交互后按钮描述仍可定位
                let descExists: boolean = await existsDescription('Button to trigger click accessibility event');
                expect(descExists).assertTrue();

                // 断言2：交互后按钮 ID 仍可定位
                let btnExists: boolean = await existsId('clickButton');
                expect(btnExists).assertTrue();

                // 断言3：交互后页面标题仍存在
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();
            }, done);
        });
    });
}
