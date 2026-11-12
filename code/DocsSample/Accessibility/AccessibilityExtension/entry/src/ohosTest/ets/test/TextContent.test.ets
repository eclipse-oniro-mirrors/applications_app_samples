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
import { startApp, waitId, waitText, existsText, runCase, addLog } from '../testkit/SharedDriver';
import { localizeText, parseTrailingNumber } from '../testkit/LocaleText';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AccessibilityExtension]';
const BUNDLE_NAME: string = 'com.samples.accessibilityextension';
const ABILITY_NAME: string = 'EntryAbility';

export default function textContentTest(): void {
    describe('TextContentTest', () => {
        beforeAll(() => {
            addLog('TextContentTest suite started');
        })

        beforeEach(() => {
        })

        afterEach(() => {
        })

        afterAll(() => {
            addLog('TextContentTest suite finished');
        })

        /**
         * @tc.number    SUB_A11Y_EXT_TEXT_0100
         * @tc.name      testTextContent0001
         * @tc.desc      Verify page title text matches expected value exactly.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testTextContent0001', 0, (done: Function) => {
            runCase('testTextContent0001', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：页面标题可被定位
                let titleComponent = await waitText('Accessibility Sample');
                addLog('testTextContent0001: title component found');
                expect(titleComponent !== undefined).assertTrue();

                // 断言2：标题文本精确匹配
                let titleText: string = await titleComponent.getText();
                expect(titleText).assertEqual(localizeText('Accessibility Sample'));

                // 断言3：标题文本长度合理
                expect(titleText.length > 0).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_TEXT_0200
         * @tc.name      testTextContent0002
         * @tc.desc      Verify counter display follows the "Counter: value" format.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testTextContent0002', 0, (done: Function) => {
            runCase('testTextContent0002', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：计数器组件可定位
                let counterComponent = await waitId('counterText');
                addLog('testTextContent0002: counterText found');
                expect(counterComponent !== undefined).assertTrue();

                // 断言2：计数器文本包含 "Counter"
                let counterText: string = await counterComponent.getText();
                addLog('testTextContent0002: counter text=%{public}s', counterText);
                expect(counterText.includes(localizeText('Counter'))).assertTrue();

                // 断言3：计数器数值可被解析（用例间共享页面实例，不断言具体初始值）
                let counterNumber: number = parseTrailingNumber(counterText);
                addLog('testTextContent0002: counter value=%{public}d', counterNumber);
                expect(Number.isNaN(counterNumber)).assertFalse();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_TEXT_0300
         * @tc.name      testTextContent0003
         * @tc.desc      Verify both button texts match their resource string values.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testTextContent0003', 0, (done: Function) => {
            runCase('testTextContent0003', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：Click Me 按钮文本精确匹配
                let clickBtn = await waitText('Click Me');
                let clickText: string = await clickBtn.getText();
                addLog('testTextContent0003: click button text=%{public}s', clickText);
                expect(clickText).assertEqual(localizeText('Click Me'));

                // 断言2：Long Press 按钮文本精确匹配
                let longBtn = await waitText('Long Press');
                let longText: string = await longBtn.getText();
                expect(longText).assertEqual(localizeText('Long Press'));

                // 断言3：两个按钮文本长度均大于 0
                expect(clickText.length > 0 && longText.length > 0).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_TEXT_0400
         * @tc.name      testTextContent0004
         * @tc.desc      Verify all section header texts are rendered correctly.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testTextContent0004', 0, (done: Function) => {
            runCase('testTextContent0004', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：Basic Interaction 分区标题存在
                let basicExists: boolean = await existsText('Basic Interaction');
                addLog('testTextContent0004: Basic Interaction=%{public}s', String(basicExists));
                expect(basicExists).assertTrue();

                // 断言2：Text Input 分区标题存在
                let textExists: boolean = await existsText('Text Input');
                expect(textExists).assertTrue();

                // 断言3：Toggle Switch 分区标题存在
                let toggleExists: boolean = await existsText('Toggle Switch');
                expect(toggleExists).assertTrue();
            }, done);
        });
    });
}
