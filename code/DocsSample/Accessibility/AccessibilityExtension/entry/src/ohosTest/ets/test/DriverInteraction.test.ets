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
    startApp, getDriver, clickId, waitId, existsId, existsText, textOfId,
    runCase, addLog, scrollToTop, scrollToId, counterValue
} from '../testkit/SharedDriver';
import { localizeText, parseTrailingNumber } from '../testkit/LocaleText';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AccessibilityExtension]';
const BUNDLE_NAME: string = 'com.samples.accessibilityextension';
const ABILITY_NAME: string = 'EntryAbility';

export default function driverInteractionTest(): void {
    describe('DriverInteractionTest', () => {
        beforeAll(() => {
            addLog('DriverInteractionTest suite started');
        })

        beforeEach(() => {
        })

        afterEach(() => {
        })

        afterAll(() => {
            addLog('DriverInteractionTest suite finished');
        })

        /**
         * @tc.number    SUB_A11Y_EXT_DINT_0100
         * @tc.name      testDriverInteraction0001
         * @tc.desc      Verify Component.click() triggers counter change via Driver.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testDriverInteraction0001', 0, (done: Function) => {
            runCase('testDriverInteraction0001', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 操作：通过 Driver findComponent + click
                await scrollToTop();
                let driver = getDriver();
                let counterBefore: number = await counterValue();
                let btn: Component = await driver.findComponent(ON.id('clickButton'));
                await btn.click();
                await driver.waitForIdle(300, 3000);

                // 断言1：点击后计数器 +1（应用未重建时沿用当前值，不做绝对断言）
                let counterAfter: number = await counterValue();
                addLog('testDriverInteraction0001: before=%{public}d after=%{public}d', counterBefore, counterAfter);
                expect(counterAfter).assertEqual(counterBefore + 1);

                // 断言2：计数器组件存在
                let counterExists: boolean = await existsId('counterText');
                expect(counterExists).assertTrue();

                // 断言3：页面标题存在
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_DINT_0200
         * @tc.name      testDriverInteraction0002
         * @tc.desc      Verify Component.getText() returns correct button text via Driver.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testDriverInteraction0002', 0, (done: Function) => {
            runCase('testDriverInteraction0002', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：通过 Driver 获取按钮文本
                await scrollToTop();
                let driver = getDriver();
                let btn: Component = await driver.findComponent(ON.id('clickButton'));
                let text: string = await btn.getText();
                addLog('testDriverInteraction0002: text=%{public}s', text);
                expect(text).assertEqual(localizeText('Click Me'));

                // 断言2：文本长度大于 0
                expect(text.length > 0).assertTrue();

                // 断言3：文本包含 Click Me
                expect(text.includes(localizeText('Click Me'))).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_DINT_0300
         * @tc.name      testDriverInteraction0003
         * @tc.desc      Verify Component.getText() returns correct counter text via Driver.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testDriverInteraction0003', 0, (done: Function) => {
            runCase('testDriverInteraction0003', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：通过 Driver 获取计数器文本
                await scrollToTop();
                let driver = getDriver();
                let counter: Component = await driver.findComponent(ON.id('counterText'));
                let text: string = await counter.getText();
                addLog('testDriverInteraction0003: counter=%{public}s', text);
                expect(text.includes(localizeText('Counter'))).assertTrue();

                // 断言2：计数器末位为可解析数值（应用未重建时沿用当前值，不断言具体初值）
                let counterNumber: number = parseTrailingNumber(text);
                addLog('testDriverInteraction0003: value=%{public}d', counterNumber);
                expect(Number.isNaN(counterNumber)).assertFalse();

                // 断言3：文本长度大于 0
                expect(text.length > 0).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_DINT_0400
         * @tc.name      testDriverInteraction0004
         * @tc.desc      Verify Component.getBounds() returns valid button position.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testDriverInteraction0004', 0, (done: Function) => {
            runCase('testDriverInteraction0004', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：getBounds 返回有效矩形
                await scrollToTop();
                let driver = getDriver();
                let btn: Component = await driver.findComponent(ON.id('clickButton'));
                let bounds = await btn.getBounds();
                addLog('testDriverInteraction0004: w=%{public}d h=%{public}d', (bounds.right - bounds.left), (bounds.bottom - bounds.top));
                expect((bounds.right - bounds.left) > 0).assertTrue();

                // 断言2：height 大于 0
                expect((bounds.bottom - bounds.top) > 0).assertTrue();

                // 断言3：x 和 y 非负
                expect(bounds.left >= 0 && bounds.top >= 0).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_DINT_0500
         * @tc.name      testDriverInteraction0005
         * @tc.desc      Verify Component.getBounds() returns valid list item position.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testDriverInteraction0005', 0, (done: Function) => {
            runCase('testDriverInteraction0005', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：列表项 getBounds 有效
                await scrollToId('listItem_0');
                let driver = getDriver();
                let item: Component = await driver.findComponent(ON.id('listItem_0'));
                let bounds = await item.getBounds();
                addLog('testDriverInteraction0005: w=%{public}d h=%{public}d', (bounds.right - bounds.left), (bounds.bottom - bounds.top));
                expect((bounds.right - bounds.left) > 0).assertTrue();

                // 断言2：height 大于 0
                expect((bounds.bottom - bounds.top) > 0).assertTrue();

                // 断言3：列表项按采集顺序纵向排列，第2项在第1项下方
                let secondItem: Component = await driver.findComponent(ON.id('listItem_1'));
                let secondBounds = await secondItem.getBounds();
                expect(secondBounds.top > bounds.top).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_DINT_0600
         * @tc.name      testDriverInteraction0006
         * @tc.desc      Verify Driver click then getText validates counter change.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testDriverInteraction0006', 0, (done: Function) => {
            runCase('testDriverInteraction0006', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 操作：点击按钮
                await clickId('clickButton');
                let counterBefore: number = await counterValue();

                // 断言1：通过 Driver 获取计数器文本
                await scrollToTop();
                let driver = getDriver();
                let counter: Component = await driver.findComponent(ON.id('counterText'));
                let text: string = await counter.getText();
                addLog('testDriverInteraction0006: counter=%{public}s', text);
                expect(parseTrailingNumber(text)).assertEqual(counterBefore);

                // 断言2：文本包含 Counter
                expect(text.includes(localizeText('Counter'))).assertTrue();

                // 断言3：页面标题存在
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_DINT_0700
         * @tc.name      testDriverInteraction0007
         * @tc.desc      Verify multiple getBounds calls return consistent results.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testDriverInteraction0007', 0, (done: Function) => {
            runCase('testDriverInteraction0007', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：第一次 getBounds
                let driver = getDriver();
                let btn1: Component = await driver.findComponent(ON.id('clickButton'));
                let bounds1 = await btn1.getBounds();
                addLog('testDriverInteraction0007: bounds1 w=%{public}d', (bounds1.right - bounds1.left));
                expect((bounds1.right - bounds1.left) > 0).assertTrue();

                // 断言2：第二次 getBounds width 一致
                let btn2: Component = await driver.findComponent(ON.id('clickButton'));
                let bounds2 = await btn2.getBounds();
                expect((bounds2.right - bounds2.left)).assertEqual((bounds1.right - bounds1.left));

                // 断言3：第二次 getBounds height 一致
                expect((bounds2.bottom - bounds2.top)).assertEqual((bounds1.bottom - bounds1.top));
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_DINT_0800
         * @tc.name      testDriverInteraction0008
         * @tc.desc      Verify Driver finds multiple component types successfully.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testDriverInteraction0008', 0, (done: Function) => {
            runCase('testDriverInteraction0008', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：findComponent Text 类型
                await scrollToTop();
                let driver = getDriver();
                let textComp: Component = await driver.findComponent(ON.type('Text'));
                expect(textComp !== undefined && textComp !== null).assertTrue();

                // 断言2：findComponent Button 类型
                await scrollToTop();
                let btnComp: Component = await driver.findComponent(ON.type('Button'));
                expect(btnComp !== undefined && btnComp !== null).assertTrue();

                // 断言3：findComponent Toggle 类型
                await scrollToId('toggleSwitch');
                let toggleComp: Component = await driver.findComponent(ON.type('Toggle'));
                expect(toggleComp !== undefined && toggleComp !== null).assertTrue();
            }, done);
        });
    });
}
