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
    startApp, clickId, waitId, getDriver, existsId, existsText, textOfId, counterValue,
    runCase, addLog
} from '../testkit/SharedDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AccessibilityExtension]';
const BUNDLE_NAME: string = 'com.samples.accessibilityextension';
const ABILITY_NAME: string = 'EntryAbility';

export default function longPressTest(): void {
    describe('LongPressTest', () => {
        beforeAll(() => {
            addLog('LongPressTest suite started');
        })

        beforeEach(() => {
        })

        afterEach(() => {
        })

        afterAll(() => {
            addLog('LongPressTest suite finished');
        })

        /**
         * @tc.number    SUB_A11Y_EXT_LPRESS_0100
         * @tc.name      testLongPress0001
         * @tc.desc      Verify long press button ID exists on page.
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testLongPress0001', 0, (done: Function) => {
            runCase('testLongPress0001', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：长按按钮 ID 可定位
                let btnExists: boolean = await existsId('longClickButton');
                addLog('testLongPress0001: longClickButton exists=%{public}s', String(btnExists));
                expect(btnExists).assertTrue();

                // 断言2：长按按钮文本存在
                let btnTextExists: boolean = await existsText('Long Press');
                expect(btnTextExists).assertTrue();

                // 断言3：页面标题存在
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_LPRESS_0200
         * @tc.name      testLongPress0002
         * @tc.desc      Verify long press button text matches expected value.
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testLongPress0002', 0, (done: Function) => {
            runCase('testLongPress0002', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：长按按钮文本可定位
                let btnTextExists: boolean = await existsText('Long Press');
                addLog('testLongPress0002: "Long Press" text exists=%{public}s', String(btnTextExists));
                expect(btnTextExists).assertTrue();

                // 断言2：Click Me 按钮文本也存在
                let clickTextExists: boolean = await existsText('Click Me');
                expect(clickTextExists).assertTrue();

                // 断言3：Basic Interaction 分区标题存在
                let sectionExists: boolean = await existsText('Basic Interaction');
                expect(sectionExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_LPRESS_0300
         * @tc.name      testLongPress0003
         * @tc.desc      Verify clicking long press button does not change counter.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testLongPress0003', 0, (done: Function) => {
            runCase('testLongPress0003', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：记录点击前计数器数值（用例间共享页面实例，不假设初始值）
                let counterBefore: number = await counterValue();
                addLog('testLongPress0003: initial counter=%{public}d', counterBefore);

                // 执行长按按钮点击（普通 click，非 long press）
                await clickId('longClickButton');

                // 断言2：计数器值未变化（普通 click 不触发 counter++）
                let counterAfter: number = await counterValue();
                expect(counterAfter).assertEqual(counterBefore);

                // 断言3：长按按钮仍存在
                let btnExists: boolean = await existsId('longClickButton');
                expect(btnExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_LPRESS_0400
         * @tc.name      testLongPress0004
         * @tc.desc      Verify a real long press preserves counter and subsequent click behavior.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testLongPress0004', 0, (done: Function) => {
            runCase('testLongPress0004', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：记录长按前计数器数值
                let counterBefore: number = await counterValue();

                let longPressButton: Component = await waitId('longClickButton');
                await longPressButton.longClick();
                await getDriver().waitForIdle(300, 3000);

                // 断言2：真实长按不会误增计数器
                let afterLongPress: number = await counterValue();
                addLog('testLongPress0004: counter after longClick=%{public}d', afterLongPress);
                expect(afterLongPress).assertEqual(counterBefore);

                await clickId('clickButton');

                // 断言3：长按后普通点击仍只增加一次计数
                let afterClick: number = await counterValue();
                expect(afterClick).assertEqual(counterBefore + 1);
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_LPRESS_0500
         * @tc.name      testLongPress0005
         * @tc.desc      Verify multiple long press button clicks maintain page stability.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testLongPress0005', 0, (done: Function) => {
            runCase('testLongPress0005', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 记录多次点击前计数器数值
                let counterBefore: number = await counterValue();

                // 执行多次长按按钮点击
                await clickId('longClickButton');
                await clickId('longClickButton');
                await clickId('longClickButton');

                // 断言1：长按按钮仍可定位
                let btnExists: boolean = await existsId('longClickButton');
                addLog('testLongPress0005: longClickButton after 3 clicks=%{public}s', String(btnExists));
                expect(btnExists).assertTrue();

                // 断言2：页面标题仍存在
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();

                // 断言3：计数器值未变
                let counterAfter: number = await counterValue();
                expect(counterAfter).assertEqual(counterBefore);
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_LPRESS_0600
         * @tc.name      testLongPress0006
         * @tc.desc      Verify long press button accessibility text is readable.
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testLongPress0006', 0, (done: Function) => {
            runCase('testLongPress0006', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：长按按钮无障碍文本存在
                let btnTextExists: boolean = await existsText('Long Press');
                addLog('testLongPress0006: "Long Press" accessibility text=%{public}s', String(btnTextExists));
                expect(btnTextExists).assertTrue();

                // 断言2：长按按钮 ID 存在
                let btnExists: boolean = await existsId('longClickButton');
                expect(btnExists).assertTrue();

                // 断言3：Click Me 按钮也存在
                let clickExists: boolean = await existsId('clickButton');
                expect(clickExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_LPRESS_0700
         * @tc.name      testLongPress0007
         * @tc.desc      Verify long press button click followed by click button works correctly.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testLongPress0007', 0, (done: Function) => {
            runCase('testLongPress0007', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 先点击长按按钮
                let counterBefore: number = await counterValue();
                await clickId('longClickButton');

                // 断言1：计数器未变
                let afterLongPress: number = await counterValue();
                addLog('testLongPress0007: counter after long press=%{public}d', afterLongPress);
                expect(afterLongPress).assertEqual(counterBefore);

                // 再点击普通按钮
                await clickId('clickButton');

                // 断言2：计数器精确加一
                let afterClick: number = await counterValue();
                expect(afterClick).assertEqual(counterBefore + 1);

                // 断言3：两个按钮都存在
                let longExists: boolean = await existsId('longClickButton');
                let clickExists: boolean = await existsId('clickButton');
                expect(longExists && clickExists).assertTrue();
            }, done);
        });
    });
}
