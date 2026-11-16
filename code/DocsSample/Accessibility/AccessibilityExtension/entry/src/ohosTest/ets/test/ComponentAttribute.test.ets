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
    startApp, waitId, waitText, runCase, addLog
} from '../testkit/SharedDriver';
import { localizeText } from '../testkit/LocaleText';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AccessibilityExtension]';
const BUNDLE_NAME: string = 'com.samples.accessibilityextension';
const ABILITY_NAME: string = 'EntryAbility';

export default function componentAttributeTest(): void {
    describe('ComponentAttributeTest', () => {
        beforeAll(() => {
            addLog('ComponentAttributeTest suite started');
        })

        beforeEach(() => {
        })

        afterEach(() => {
        })

        afterAll(() => {
            addLog('ComponentAttributeTest suite finished');
        })

        /**
         * @tc.number    SUB_A11Y_EXT_CATTR_0100
         * @tc.name      testComponentAttribute0001
         * @tc.desc      Verify Click Me button getBounds returns valid dimensions.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testComponentAttribute0001', 0, (done: Function) => {
            runCase('testComponentAttribute0001', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：findComponent 返回有效组件
                const component: Component = await waitId('clickButton');
                expect(component !== null).assertTrue();

                // 断言2：getBounds width 大于 0
                let bounds = await component.getBounds();
                addLog('testComponentAttribute0001: clickButton bounds w=%{public}d h=%{public}d', (bounds.right - bounds.left), (bounds.bottom - bounds.top));
                expect((bounds.right - bounds.left) > 0).assertTrue();

                // 断言3：getBounds height 大于 0
                expect((bounds.bottom - bounds.top) > 0).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_CATTR_0200
         * @tc.name      testComponentAttribute0002
         * @tc.desc      Verify Long Press button getBounds returns valid dimensions.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testComponentAttribute0002', 0, (done: Function) => {
            runCase('testComponentAttribute0002', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：findComponent 返回有效组件
                const component: Component = await waitId('longClickButton');
                expect(component !== null).assertTrue();

                // 断言2：getBounds height 大于 0
                let bounds = await component.getBounds();
                addLog('testComponentAttribute0002: longClickButton bounds h=%{public}d', (bounds.bottom - bounds.top));
                expect((bounds.bottom - bounds.top) > 0).assertTrue();

                // 断言3：getBounds width 大于 0
                expect((bounds.right - bounds.left) > 0).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_CATTR_0300
         * @tc.name      testComponentAttribute0003
         * @tc.desc      Verify counter text getBounds returns valid position and size.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testComponentAttribute0003', 0, (done: Function) => {
            runCase('testComponentAttribute0003', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：findComponent 返回有效组件
                const component: Component = await waitId('counterText');
                expect(component !== null).assertTrue();

                // 断言2：getBounds y 不为负（已滚入可视区域）
                let bounds = await component.getBounds();
                addLog('testComponentAttribute0003: counterText bounds y=%{public}d h=%{public}d', bounds.top, (bounds.bottom - bounds.top));
                expect(bounds.top >= 0).assertTrue();

                // 断言3：getBounds height 大于 0
                expect((bounds.bottom - bounds.top) > 0).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_CATTR_0400
         * @tc.name      testComponentAttribute0004
         * @tc.desc      Verify text input getBounds returns valid dimensions.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testComponentAttribute0004', 0, (done: Function) => {
            runCase('testComponentAttribute0004', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：findComponent 返回有效组件
                const component: Component = await waitId('textInput');
                expect(component !== null).assertTrue();

                // 断言2：getBounds width 大于 0
                let bounds = await component.getBounds();
                addLog('testComponentAttribute0004: textInput bounds w=%{public}d h=%{public}d', (bounds.right - bounds.left), (bounds.bottom - bounds.top));
                expect((bounds.right - bounds.left) > 0).assertTrue();

                // 断言3：getBounds height 大于 0
                expect((bounds.bottom - bounds.top) > 0).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_CATTR_0500
         * @tc.name      testComponentAttribute0005
         * @tc.desc      Verify toggle switch getBounds returns valid dimensions.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testComponentAttribute0005', 0, (done: Function) => {
            runCase('testComponentAttribute0005', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：findComponent 返回有效组件
                const component: Component = await waitId('toggleSwitch');
                expect(component !== null).assertTrue();

                // 断言2：getBounds height 大于 0
                let bounds = await component.getBounds();
                addLog('testComponentAttribute0005: toggleSwitch bounds h=%{public}d', (bounds.bottom - bounds.top));
                expect((bounds.bottom - bounds.top) > 0).assertTrue();

                // 断言3：getBounds width 大于 0
                expect((bounds.right - bounds.left) > 0).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_CATTR_0600
         * @tc.name      testComponentAttribute0006
         * @tc.desc      Verify list item getBounds returns valid dimensions.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testComponentAttribute0006', 0, (done: Function) => {
            runCase('testComponentAttribute0006', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：findComponent 返回有效组件
                const component: Component = await waitId('listItem_0');
                expect(component !== null).assertTrue();

                // 断言2：getBounds width 大于 0
                let bounds = await component.getBounds();
                addLog('testComponentAttribute0006: listItem_0 bounds w=%{public}d h=%{public}d', (bounds.right - bounds.left), (bounds.bottom - bounds.top));
                expect((bounds.right - bounds.left) > 0).assertTrue();

                // 断言3：getBounds height 大于 0
                expect((bounds.bottom - bounds.top) > 0).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_CATTR_0700
         * @tc.name      testComponentAttribute0007
         * @tc.desc      Verify button getText returns correct text content.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testComponentAttribute0007', 0, (done: Function) => {
            runCase('testComponentAttribute0007', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：Click Me 按钮文本正确
                let clickBtn: Component = await waitId('clickButton');
                let clickText: string = await clickBtn.getText();
                addLog('testComponentAttribute0007: clickButton text=%{public}s', clickText);
                expect(clickText).assertEqual(localizeText('Click Me'));

                // 断言2：Long Press 按钮文本正确
                let longBtn: Component = await waitId('longClickButton');
                let longText: string = await longBtn.getText();
                expect(longText).assertEqual(localizeText('Long Press'));

                // 断言3：两个按钮文本长度均大于 0
                expect(clickText.length > 0 && longText.length > 0).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_CATTR_0800
         * @tc.name      testComponentAttribute0008
         * @tc.desc      Verify section header texts are readable via getText.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testComponentAttribute0008', 0, (done: Function) => {
            runCase('testComponentAttribute0008', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：Basic Interaction 标题可获取
                let basicSection: Component = await waitText('Basic Interaction');
                let basicText: string = await basicSection.getText();
                addLog('testComponentAttribute0008: section text=%{public}s', basicText);
                expect(basicText).assertEqual(localizeText('Basic Interaction'));

                // 断言2：Text Input 标题可获取
                let inputSection: Component = await waitText('Text Input');
                let inputText: string = await inputSection.getText();
                expect(inputText).assertEqual(localizeText('Text Input'));

                // 断言3：Toggle Switch 标题可获取
                let toggleSection: Component = await waitText('Toggle Switch');
                let toggleText: string = await toggleSection.getText();
                expect(toggleText).assertEqual(localizeText('Toggle Switch'));
            }, done);
        });
    });
}
