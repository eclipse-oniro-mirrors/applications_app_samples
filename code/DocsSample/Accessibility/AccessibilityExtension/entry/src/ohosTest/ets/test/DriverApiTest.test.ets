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
    startApp, getDriver, waitId, waitText, existsId, existsText, textOfId,
    runCase, addLog, scrollToTop
} from '../testkit/SharedDriver';
import { localizeText, parseTrailingNumber } from '../testkit/LocaleText';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AccessibilityExtension]';
const BUNDLE_NAME: string = 'com.samples.accessibilityextension';
const ABILITY_NAME: string = 'EntryAbility';

export default function driverApiTest(): void {
    describe('DriverApiTest', () => {
        beforeAll(() => {
            addLog('DriverApiTest suite started');
        })

        beforeEach(() => {
        })

        afterEach(() => {
        })

        afterAll(() => {
            addLog('DriverApiTest suite finished');
        })

        /**
         * @tc.number    SUB_A11Y_EXT_DAPI_0100
         * @tc.name      testDriverApi0001
         * @tc.desc      Verify Driver.findComponent with ON.id() locates button.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testDriverApi0001', 0, (done: Function) => {
            runCase('testDriverApi0001', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：findComponent 返回非空
                await scrollToTop();
                let driver = getDriver();
                let component: Component = await driver.findComponent(ON.id('clickButton'));
                addLog('testDriverApi0001: findComponent by id succeeded');
                expect(component !== undefined && component !== null).assertTrue();

                // 断言2：获取的组件文本非空
                let text: string = await component.getText();
                expect(text.length > 0).assertTrue();

                // 断言3：文本内容为 "Click Me"
                expect(text).assertEqual(localizeText('Click Me'));
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_DAPI_0200
         * @tc.name      testDriverApi0002
         * @tc.desc      Verify Driver.findComponent with ON.text() locates button.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testDriverApi0002', 0, (done: Function) => {
            runCase('testDriverApi0002', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：findComponent 通过文本定位成功
                await scrollToTop();
                let driver = getDriver();
                let component: Component = await driver.findComponent(ON.text(localizeText('Click Me')));
                addLog('testDriverApi0002: findComponent by text succeeded');
                expect(component !== undefined && component !== null).assertTrue();

                // 断言2：获取的文本精确匹配
                let text: string = await component.getText();
                expect(text).assertEqual(localizeText('Click Me'));

                // 断言3：文本长度合理
                expect(text.length > 0 && text.length < 50).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_DAPI_0300
         * @tc.name      testDriverApi0003
         * @tc.desc      Verify Component.getText() returns correct text for counter.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testDriverApi0003', 0, (done: Function) => {
            runCase('testDriverApi0003', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：通过 findComponent 获取计数器组件
                await scrollToTop();
                let driver = getDriver();
                let component: Component = await driver.findComponent(ON.id('counterText'));
                addLog('testDriverApi0003: counterText component found');
                expect(component !== undefined && component !== null).assertTrue();

                // 断言2：getText 返回包含 "Counter"
                let text: string = await component.getText();
                expect(text.includes(localizeText('Counter'))).assertTrue();

                // 断言3：计数器文本末位为可解析数值（应用未重建时沿用当前值，不断言具体初值）
                let counterNumber: number = parseTrailingNumber(text);
                addLog('testDriverApi0003: counter value=%{public}d', counterNumber);
                expect(Number.isNaN(counterNumber)).assertFalse();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_DAPI_0400
         * @tc.name      testDriverApi0004
         * @tc.desc      Verify waitForComponent with ON.id() succeeds for existing component.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testDriverApi0004', 0, (done: Function) => {
            runCase('testDriverApi0004', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：waitForComponent 返回有效组件
                let component: Component = await waitId('longClickButton');
                addLog('testDriverApi0004: waitForComponent longClickButton succeeded');
                expect(component !== undefined && component !== null).assertTrue();

                // 断言2：组件文本为 "Long Press"
                let text: string = await component.getText();
                expect(text).assertEqual(localizeText('Long Press'));

                // 断言3：文本长度大于 0
                expect(text.length > 0).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_DAPI_0500
         * @tc.name      testDriverApi0005
         * @tc.desc      Verify waitForComponent with ON.text() succeeds for existing text.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testDriverApi0005', 0, (done: Function) => {
            runCase('testDriverApi0005', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：waitForComponent 通过文本定位成功
                let component: Component = await waitText('Long Press');
                addLog('testDriverApi0005: waitForComponent by text succeeded');
                expect(component !== undefined && component !== null).assertTrue();

                // 断言2：获取的文本匹配
                let text: string = await component.getText();
                expect(text).assertEqual(localizeText('Long Press'));

                // 断言3：文本包含 "Long Press"
                expect(text.includes(localizeText('Long Press'))).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_DAPI_0600
         * @tc.name      testDriverApi0006
         * @tc.desc      Verify Driver.findComponent with ON.type() locates Scroll container.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testDriverApi0006', 0, (done: Function) => {
            runCase('testDriverApi0006', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：findComponent 通过类型定位 Scroll 容器
                let driver = getDriver();
                let scrollComponent: Component = await driver.findComponent(ON.type('Scroll'));
                addLog('testDriverApi0006: Scroll component found');
                expect(scrollComponent !== undefined && scrollComponent !== null).assertTrue();

                // 断言2：clickButton 存在（在 Scroll 内部）
                let btnExists: boolean = await existsId('clickButton');
                expect(btnExists).assertTrue();

                // 断言3：页面标题存在
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_DAPI_0700
         * @tc.name      testDriverApi0007
         * @tc.desc      Verify getDriver() returns consistent Driver instance.
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level 3
         */
        it('testDriverApi0007', 0, (done: Function) => {
            runCase('testDriverApi0007', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：getDriver 返回非空
                let driver1 = getDriver();
                addLog('testDriverApi0007: getDriver call 1 succeeded');
                expect(driver1 !== undefined && driver1 !== null).assertTrue();

                // 断言2：再次调用 getDriver 返回非空
                let driver2 = getDriver();
                expect(driver2 !== undefined && driver2 !== null).assertTrue();

                // 断言3：两次获取的 Driver 均可执行 findComponent
                await scrollToTop();
                let component = await driver2.findComponent(ON.id('clickButton'));
                expect(component !== undefined && component !== null).assertTrue();
            }, done);
        });
    });
}
