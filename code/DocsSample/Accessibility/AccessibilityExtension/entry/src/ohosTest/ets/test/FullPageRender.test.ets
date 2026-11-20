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
    startApp, clickId, waitId, existsId, existsText, existsDescription, scrollToId,
    runCase, addLog
} from '../testkit/SharedDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AccessibilityExtension]';
const BUNDLE_NAME: string = 'com.samples.accessibilityextension';
const ABILITY_NAME: string = 'EntryAbility';

export default function fullPageRenderTest(): void {
    describe('FullPageRenderTest', () => {
        beforeAll(() => {
            addLog('FullPageRenderTest suite started');
        })

        beforeEach(() => {
        })

        afterEach(() => {
        })

        afterAll(() => {
            addLog('FullPageRenderTest suite finished');
        })

        /**
         * @tc.number    SUB_A11Y_EXT_FPRN_0100
         * @tc.name      testFullPageRender0001
         * @tc.desc      Verify all primary texts render in one pass.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testFullPageRender0001', 0, (done: Function) => {
            runCase('testFullPageRender0001', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：页面标题存在
                let title: boolean = await existsText('Accessibility Sample');
                expect(title).assertTrue();

                // 断言2：Click Me 按钮文本存在
                let clickMe: boolean = await existsText('Click Me');
                expect(clickMe).assertTrue();

                // 断言3：Long Press 按钮文本存在
                let longPress: boolean = await existsText('Long Press');
                expect(longPress).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_FPRN_0200
         * @tc.name      testFullPageRender0002
         * @tc.desc      Verify all component IDs render in one pass.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testFullPageRender0002', 0, (done: Function) => {
            runCase('testFullPageRender0002', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：clickButton 存在
                let btn1: boolean = await existsId('clickButton');
                addLog('testFullPageRender0002: btn1=%{public}s', String(btn1));
                expect(btn1).assertTrue();

                // 断言2：longClickButton 和 counterText 存在
                let btn2: boolean = await existsId('longClickButton');
                let counter: boolean = await existsId('counterText');
                addLog('testFullPageRender0002: btn2=%{public}s counter=%{public}s', String(btn2), String(counter));
                expect(btn2 && counter).assertTrue();

                // 断言3：textInput 和 toggleSwitch 存在
                let input: boolean = await existsId('textInput');
                let toggle: boolean = await existsId('toggleSwitch');
                addLog('testFullPageRender0002: input=%{public}s toggle=%{public}s', String(input), String(toggle));
                expect(input && toggle).assertTrue();

                await scrollToId('volumeSlider');

                // 断言4：Slider 及其数值文本存在
                let slider: boolean = await existsId('volumeSlider');
                let sliderValue: boolean = await existsId('sliderValueText');
                addLog('testFullPageRender0002: slider=%{public}s sliderValue=%{public}s', String(slider), String(sliderValue));
                expect(slider && sliderValue).assertTrue();

                await scrollToId('pageSwiper');

                // 断言5：Checkbox 与 Swiper 存在（Swiper 当前页随前序用例变化，不做索引断言）
                let checkbox: boolean = await existsId('notificationCheckbox');
                let swiper: boolean = await existsId('pageSwiper');
                let swiperDesc: boolean = await existsDescription('Swiper that demonstrates page content update accessibility events');
                addLog('testFullPageRender0002: checkbox=%{public}s swiper=%{public}s desc=%{public}s', String(checkbox), String(swiper), String(swiperDesc));
                expect(checkbox && swiper && swiperDesc).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_FPRN_0300
         * @tc.name      testFullPageRender0003
         * @tc.desc      Verify all section header texts render in one pass.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testFullPageRender0003', 0, (done: Function) => {
            runCase('testFullPageRender0003', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：Basic Interaction 标题存在
                let basic: boolean = await existsText('Basic Interaction');
                expect(basic).assertTrue();

                // 断言2：Text Input 和 Toggle Switch 标题存在
                let input: boolean = await existsText('Text Input');
                let toggle: boolean = await existsText('Toggle Switch');
                expect(input && toggle).assertTrue();

                // 断言3：Scrollable List 标题存在
                let list: boolean = await existsText('Scrollable List');
                expect(list).assertTrue();

                await scrollToId('pageSwiper');

                // 断言4：新增控件分区标题完整
                let slider: boolean = await existsText('Slider Control');
                let checkbox: boolean = await existsText('Checkbox Control');
                let swiper: boolean = await existsText('Swiper Pages');
                addLog('testFullPageRender0003: slider=%{public}s checkbox=%{public}s swiper=%{public}s', String(slider), String(checkbox), String(swiper));
                expect(slider && checkbox && swiper).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_FPRN_0400
         * @tc.name      testFullPageRender0004
         * @tc.desc      Verify all list items render in one pass.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testFullPageRender0004', 0, (done: Function) => {
            runCase('testFullPageRender0004', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：listItem_0 存在
                let item0: boolean = await existsId('listItem_0');
                expect(item0).assertTrue();

                // 断言2：listItem_2 和 listItem_4 存在
                let item2: boolean = await existsId('listItem_2');
                let item4: boolean = await existsId('listItem_4');
                expect(item2 && item4).assertTrue();

                // 断言3：List item 1 和List item 5 文本存在
                let text1: boolean = await existsText('List item 1');
                let text5: boolean = await existsText('List item 5');
                expect(text1 && text5).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_FPRN_0500
         * @tc.name      testFullPageRender0005
         * @tc.desc      Verify all accessibility labels render in one pass.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testFullPageRender0005', 0, (done: Function) => {
            runCase('testFullPageRender0005', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：开关无障碍描述存在（accessibilityText 不入无障碍树）
                let toggleLabel: boolean = await existsDescription('Toggle switch that triggers select accessibility event');
                expect(toggleLabel).assertTrue();

                // 断言2：输入框无障碍描述与列表首项存在
                let inputLabel: boolean = await existsDescription('Input field that triggers text update accessibility event');
                let listLabel: boolean = await existsId('listItem_0');
                expect(inputLabel && listLabel).assertTrue();

                // 断言3：页面标题存在
                let title: boolean = await existsText('Accessibility Sample');
                expect(title).assertTrue();

                await scrollToId('pageSwiper');

                // 断言4：新增控件的无障碍描述/可见文本完整
                let sliderLabel: boolean = await existsDescription('Slider that demonstrates valueNow valueMax valueMin accessibility properties');
                let checkboxLabel: boolean = await existsText('Enable notifications');
                let swiperLabel: boolean = await existsDescription('Swiper that demonstrates page content update accessibility events');
                addLog('testFullPageRender0005: slider=%{public}s checkbox=%{public}s swiper=%{public}s', String(sliderLabel), String(checkboxLabel), String(swiperLabel));
                expect(sliderLabel && checkboxLabel && swiperLabel).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_FPRN_0600
         * @tc.name      testFullPageRender0006
         * @tc.desc      Verify full page re-render after interactions.
         * @tc.size      LargeTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testFullPageRender0006', 0, (done: Function) => {
            runCase('testFullPageRender0006', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);
                await clickId('clickButton');
                let inputComp = await waitId('textInput');
                await inputComp.inputText('render');

                // 断言1：所有 ID 仍存在
                let btn: boolean = await existsId('clickButton');
                let input: boolean = await existsId('textInput');
                let toggle: boolean = await existsId('toggleSwitch');
                addLog('testFullPageRender0006: btn=%{public}s input=%{public}s toggle=%{public}s', String(btn), String(input), String(toggle));
                expect(btn && input && toggle).assertTrue();

                // 断言2：所有文本仍存在
                let title: boolean = await existsText('Accessibility Sample');
                let clickMe: boolean = await existsText('Click Me');
                addLog('testFullPageRender0006: title=%{public}s clickMe=%{public}s', String(title), String(clickMe));
                expect(title && clickMe).assertTrue();

                // 断言3：列表项仍存在
                let item0: boolean = await existsId('listItem_0');
                addLog('testFullPageRender0006: item0=%{public}s', String(item0));
                expect(item0).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_FPRN_0700
         * @tc.name      testFullPageRender0007
         * @tc.desc      Verify full page re-render after scrolling.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testFullPageRender0007', 0, (done: Function) => {
            runCase('testFullPageRender0007', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);
                await scrollToId('listItem_4');

                // 断言1：所有 ID 仍存在
                let btn: boolean = await existsId('clickButton');
                let input: boolean = await existsId('textInput');
                addLog('testFullPageRender0007: btn=%{public}s input=%{public}s', String(btn), String(input));
                expect(btn && input).assertTrue();

                // 断言2：页面标题仍存在
                let title: boolean = await existsText('Accessibility Sample');
                addLog('testFullPageRender0007: title=%{public}s', String(title));
                expect(title).assertTrue();

                // 断言3：列表区域标题仍存在
                let list: boolean = await existsText('Scrollable List');
                addLog('testFullPageRender0007: list=%{public}s', String(list));
                expect(list).assertTrue();
            }, done);
        });
    });
}
