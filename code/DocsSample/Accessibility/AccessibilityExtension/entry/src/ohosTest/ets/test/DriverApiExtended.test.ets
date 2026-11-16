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
import { ON, Component } from '@kit.TestKit';
import {
    startApp, getDriver, waitId, waitText, clickId, existsId, existsText, textOfId,
    pressBack, runCase, addLog, scrollToTop, scrollToId, counterValue
} from '../testkit/SharedDriver';
import { localizeText } from '../testkit/LocaleText';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AccessibilityExtension]';
const BUNDLE_NAME: string = 'com.samples.accessibilityextension';
const ABILITY_NAME: string = 'EntryAbility';

export default function driverApiExtendedTest(): void {
    describe('DriverApiExtendedTest', () => {
        beforeAll(() => {
            addLog('DriverApiExtendedTest suite started');
        })

        beforeEach(() => {
        })

        afterEach(() => {
        })

        afterAll(() => {
            addLog('DriverApiExtendedTest suite finished');
        })

        /**
         * @tc.number    SUB_A11Y_EXT_DAPIX_0100
         * @tc.name      testDriverApiExtended0001
         * @tc.desc      Verify Component.getBounds() returns valid rectangle for button.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testDriverApiExtended0001', 0, (done: Function) => {
            runCase('testDriverApiExtended0001', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：findComponent 返回有效组件
                await scrollToTop();
                let driver = getDriver();
                let component: Component = await driver.findComponent(ON.id('clickButton'));
                expect(component !== undefined && component !== null).assertTrue();

                // 断言2：getBounds x >= 0
                let bounds = await component.getBounds();
                addLog('testDriverApiExtended0001: x=%{public}d y=%{public}d', bounds.left, bounds.top);
                expect(bounds.left >= 0).assertTrue();

                // 断言3：getBounds y >= 0
                expect(bounds.top >= 0).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_DAPIX_0200
         * @tc.name      testDriverApiExtended0002
         * @tc.desc      Verify Driver.findComponent with ON.type Button locates a button.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testDriverApiExtended0002', 0, (done: Function) => {
            runCase('testDriverApiExtended0002', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：findComponent 通过类型 Button 定位成功
                await scrollToTop();
                let driver = getDriver();
                let component: Component = await driver.findComponent(ON.type('Button'));
                addLog('testDriverApiExtended0002: found Button component');
                expect(component !== undefined && component !== null).assertTrue();

                // 断言2：组件文本非空
                let text: string = await component.getText();
                expect(text.length > 0).assertTrue();

                // 断言3：文本为已知按钮文本之一
                let clickMe: string = localizeText('Click Me');
                let longPress: string = localizeText('Long Press');
                let isKnownText: boolean = text === clickMe || text === longPress;
                expect(isKnownText).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_DAPIX_0300
         * @tc.name      testDriverApiExtended0003
         * @tc.desc      Verify Driver.findComponent with ON.type TextInput locates input.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testDriverApiExtended0003', 0, (done: Function) => {
            runCase('testDriverApiExtended0003', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：findComponent 通过类型 TextInput 定位成功
                await scrollToId('textInput');
                let driver = getDriver();
                let component: Component = await driver.findComponent(ON.type('TextInput'));
                addLog('testDriverApiExtended0003: found TextInput component');
                expect(component !== undefined && component !== null).assertTrue();

                // 断言2：组件可通过 ID 再次定位
                let inputExists: boolean = await existsId('textInput');
                expect(inputExists).assertTrue();

                // 断言3：页面标题存在
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_DAPIX_0400
         * @tc.name      testDriverApiExtended0004
         * @tc.desc      Verify Driver.waitForIdle preserves the initial page state.
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level 3
         */
        it('testDriverApiExtended0004', 0, (done: Function) => {
            runCase('testDriverApiExtended0004', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：waitForIdle 前后计数器读数不变
                let driver = getDriver();
                let counterBefore: number = await counterValue();
                await driver.waitForIdle(300, 3000);
                let counterAfter: number = await counterValue();
                addLog('testDriverApiExtended0004: before=%{public}d after=%{public}d', counterBefore, counterAfter);
                expect(counterAfter).assertEqual(counterBefore);

                // 断言2：idle 后按钮可定位
                let btnExists: boolean = await existsId('clickButton');
                expect(btnExists).assertTrue();

                // 断言3：idle 后页面标题可定位
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_DAPIX_0500
         * @tc.name      testDriverApiExtended0005
         * @tc.desc      Verify Component.click() triggers counter change.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testDriverApiExtended0005', 0, (done: Function) => {
            runCase('testDriverApiExtended0005', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 操作：通过 Component.click() 直接点击
                let driver = getDriver();
                await scrollToId('clickButton');
                let component: Component = await driver.findComponent(ON.id('clickButton'));
                let counterBefore: number = await counterValue();
                await component.click();
                await driver.waitForIdle(300, 3000);

                // 断言1：点击后计数器 +1
                let counterAfter: number = await counterValue();
                addLog('testDriverApiExtended0005: before=%{public}d after=%{public}d', counterBefore, counterAfter);
                expect(counterAfter).assertEqual(counterBefore + 1);

                // 断言2：按钮仍存在
                let btnExists: boolean = await existsId('clickButton');
                expect(btnExists).assertTrue();

                // 断言3：页面标题仍存在
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_DAPIX_0600
         * @tc.name      testDriverApiExtended0006
         * @tc.desc      Verify pressBack does not crash the page.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testDriverApiExtended0006', 0, (done: Function) => {
            runCase('testDriverApiExtended0006', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 操作：按返回键
                await pressBack();

                // 断言1：重新启动后页面正常
                await startApp(BUNDLE_NAME, ABILITY_NAME);
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();

                // 断言2：按钮存在
                let btnExists: boolean = await existsId('clickButton');
                expect(btnExists).assertTrue();

                // 断言3：输入框存在
                let inputExists: boolean = await existsId('textInput');
                expect(inputExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_DAPIX_0700
         * @tc.name      testDriverApiExtended0007
         * @tc.desc      Verify multiple findComponent calls return consistent results.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testDriverApiExtended0007', 0, (done: Function) => {
            runCase('testDriverApiExtended0007', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：第一次 findComponent 获取文本
                await scrollToId('clickButton');
                let driver = getDriver();
                let comp1: Component = await driver.findComponent(ON.id('clickButton'));
                let text1: string = await comp1.getText();
                addLog('testDriverApiExtended0007: text1=%{public}s', text1);
                expect(text1).assertEqual(localizeText('Click Me'));

                // 断言2：第二次 findComponent 获取文本一致
                let comp2: Component = await driver.findComponent(ON.id('clickButton'));
                let text2: string = await comp2.getText();
                expect(text2).assertEqual(localizeText('Click Me'));

                // 断言3：两次文本相同
                expect(text1).assertEqual(text2);
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_DAPIX_0800
         * @tc.name      testDriverApiExtended0008
         * @tc.desc      Verify findComponent works for different component types.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testDriverApiExtended0008', 0, (done: Function) => {
            runCase('testDriverApiExtended0008', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：findComponent 定位 Text 类型
                await scrollToTop();
                let driver = getDriver();
                let textComp: Component = await driver.findComponent(ON.type('Text'));
                expect(textComp !== undefined && textComp !== null).assertTrue();

                // 断言2：findComponent 定位 Button 类型
                await scrollToTop();
                let btnComp: Component = await driver.findComponent(ON.type('Button'));
                expect(btnComp !== undefined && btnComp !== null).assertTrue();

                // 断言3：findComponent 定位 List 类型
                await scrollToId('listItem_0');
                let listComp: Component = await driver.findComponent(ON.type('List'));
                expect(listComp !== undefined && listComp !== null).assertTrue();
            }, done);
        });
    });
}
