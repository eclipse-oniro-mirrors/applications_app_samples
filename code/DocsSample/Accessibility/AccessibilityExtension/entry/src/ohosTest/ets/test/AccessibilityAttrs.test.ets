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
import { startApp, waitText, existsText, runCase, addLog } from '../testkit/SharedDriver';
import { localizeText } from '../testkit/LocaleText';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AccessibilityExtension]';
const BUNDLE_NAME: string = 'com.samples.accessibilityextension';
const ABILITY_NAME: string = 'EntryAbility';

export default function accessibilityAttrsTest(): void {
    describe('A11yExtAccessibilityAttrs', () => {
        beforeAll(() => {
            addLog('A11yExtAccessibilityAttrs suite started');
        })

        beforeEach(() => {
        })

        afterEach(() => {
        })

        afterAll(() => {
            addLog('A11yExtAccessibilityAttrs suite finished');
        })

        /**
         * @tc.number    SUB_A11Y_EXT_A11Y_0100
         * @tc.name      testAccessibilityAttrs0001
         * @tc.desc      Verify click button accessibility text is readable by driver.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testAccessibilityAttrs0001', 0, (done: Function) => {
            runCase('testAccessibilityAttrs0001', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：通过无障碍文本 "Click Me" 可定位到按钮
                let btnExists: boolean = await existsText('Click Me');
                expect(btnExists).assertTrue();

                // 断言2：获取按钮文本非空
                let btnComponent = await waitText('Click Me');
                let btnText: string = await btnComponent.getText();
                addLog('Button text: %{public}s', btnText);
                expect(btnText.length > 0).assertTrue();

                // 断言3：按钮文本包含 "Click Me"
                expect(btnText.includes(localizeText('Click Me'))).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_A11Y_0200
         * @tc.name      testAccessibilityAttrs0002
         * @tc.desc      Verify long press button accessibility text is readable by driver.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testAccessibilityAttrs0002', 0, (done: Function) => {
            runCase('testAccessibilityAttrs0002', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：通过无障碍文本 "Long Press" 可定位到长按按钮
                let longBtnExists: boolean = await existsText('Long Press');
                expect(longBtnExists).assertTrue();

                // 断言2：获取长按按钮文本非空
                let longBtnComponent = await waitText('Long Press');
                let longBtnText: string = await longBtnComponent.getText();
                addLog('Long press button text: %{public}s', longBtnText);
                expect(longBtnText.length > 0).assertTrue();

                // 断言3：长按按钮文本包含 "Long Press"
                expect(longBtnText.includes(localizeText('Long Press'))).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_A11Y_0300
         * @tc.name      testAccessibilityAttrs0003
         * @tc.desc      Verify list section and item texts are accessible via driver.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testAccessibilityAttrs0003', 0, (done: Function) => {
            runCase('testAccessibilityAttrs0003', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：列表区域标题 "Scrollable List" 存在
                let listSectionExists: boolean = await existsText('Scrollable List');
                expect(listSectionExists).assertTrue();

                // 断言2：列表项文本 "List item 1" 可被定位
                let item1Exists: boolean = await existsText('List item 1');
                expect(item1Exists).assertTrue();

                // 断言3：List item 1 文本内容非空
                let item1Component = await waitText('List item 1');
                let item1Text: string = await item1Component.getText();
                addLog('List item 1 text: %{public}s', item1Text);
                expect(item1Text.length > 0).assertTrue();
            }, done);
        });
    });
}
