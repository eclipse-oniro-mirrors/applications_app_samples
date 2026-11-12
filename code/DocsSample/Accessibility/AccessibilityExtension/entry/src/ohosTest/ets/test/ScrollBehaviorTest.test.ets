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
    startApp, existsId, existsText, scrollToId, scrollToText,
    runCase, addLog
} from '../testkit/SharedDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AccessibilityExtension]';
const BUNDLE_NAME: string = 'com.samples.accessibilityextension';
const ABILITY_NAME: string = 'EntryAbility';

export default function scrollBehaviorTest(): void {
    describe('ScrollBehaviorTest', () => {
        beforeAll(() => {
            addLog('ScrollBehaviorTest suite started');
        })

        beforeEach(() => {
        })

        afterEach(() => {
        })

        afterAll(() => {
            addLog('ScrollBehaviorTest suite finished');
        })

        /**
         * @tc.number    SUB_A11Y_EXT_SCROLL_0100
         * @tc.name      testScrollBehavior0001
         * @tc.desc      Verify scroll to list item by ID succeeds and item remains visible.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testScrollBehavior0001', 0, (done: Function) => {
            runCase('testScrollBehavior0001', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：List item 4 初始存在
                let item4Exists: boolean = await existsId('listItem_4');
                addLog('testScrollBehavior0001: listItem_4 before scroll=%{public}s', String(item4Exists));
                expect(item4Exists).assertTrue();

                // 执行滚动到列表项
                await scrollToId('listItem_4');

                // 断言2：滚动后List item 4 仍可见
                let afterScroll: boolean = await existsId('listItem_4');
                expect(afterScroll).assertTrue();

                // 断言3：页面标题仍存在
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_SCROLL_0200
         * @tc.name      testScrollBehavior0002
         * @tc.desc      Verify scroll to text succeeds and target text remains visible.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testScrollBehavior0002', 0, (done: Function) => {
            runCase('testScrollBehavior0002', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：Scrollable List 文本存在
                let listSectionExists: boolean = await existsText('Scrollable List');
                addLog('testScrollBehavior0002: "Scrollable List" before scroll=%{public}s', String(listSectionExists));
                expect(listSectionExists).assertTrue();

                // 执行滚动到文本
                await scrollToText('Scrollable List');

                // 断言2：滚动后文本仍可见
                let afterScroll: boolean = await existsText('Scrollable List');
                expect(afterScroll).assertTrue();

                // 断言3：List item 0 仍存在
                let item0Exists: boolean = await existsId('listItem_0');
                expect(item0Exists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_SCROLL_0300
         * @tc.name      testScrollBehavior0003
         * @tc.desc      Verify all list item texts are visible after scrolling.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testScrollBehavior0003', 0, (done: Function) => {
            runCase('testScrollBehavior0003', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 滚动到底部列表区域
                await scrollToId('listItem_4');

                // 断言1：List item 1 文本存在
                let item1Exists: boolean = await existsText('List item 1');
                addLog('testScrollBehavior0003: List item 1 after scroll=%{public}s', String(item1Exists));
                expect(item1Exists).assertTrue();

                // 断言2：List item 3 文本存在
                let item3Exists: boolean = await existsText('List item 3');
                expect(item3Exists).assertTrue();

                // 断言3：List item 5 文本存在
                let item5Exists: boolean = await existsText('List item 5');
                expect(item5Exists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_SCROLL_0400
         * @tc.name      testScrollBehavior0004
         * @tc.desc      Verify scroll to Toggle Switch section succeeds.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testScrollBehavior0004', 0, (done: Function) => {
            runCase('testScrollBehavior0004', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：Toggle Switch 分区标题存在
                let toggleExists: boolean = await existsText('Toggle Switch');
                addLog('testScrollBehavior0004: "Toggle Switch" before scroll=%{public}s', String(toggleExists));
                expect(toggleExists).assertTrue();

                // 执行滚动到 Toggle 区域
                await scrollToText('Toggle Switch');

                // 断言2：滚动后 Toggle 分区标题仍可见
                let afterScroll: boolean = await existsText('Toggle Switch');
                expect(afterScroll).assertTrue();

                // 断言3：Toggle 组件 ID 可定位
                let toggleIdExists: boolean = await existsId('toggleSwitch');
                expect(toggleIdExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_SCROLL_0500
         * @tc.name      testScrollBehavior0005
         * @tc.desc      Verify scroll to Text Input section succeeds.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testScrollBehavior0005', 0, (done: Function) => {
            runCase('testScrollBehavior0005', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：Text Input 分区标题存在
                let inputExists: boolean = await existsText('Text Input');
                addLog('testScrollBehavior0005: "Text Input" before scroll=%{public}s', String(inputExists));
                expect(inputExists).assertTrue();

                // 执行滚动到 Text Input 区域
                await scrollToText('Text Input');

                // 断言2：滚动后 Text Input 分区标题仍可见
                let afterScroll: boolean = await existsText('Text Input');
                expect(afterScroll).assertTrue();

                // 断言3：输入框 ID 可定位
                let inputIdExists: boolean = await existsId('textInput');
                expect(inputIdExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_SCROLL_0600
         * @tc.name      testScrollBehavior0006
         * @tc.desc      Verify page stability after multiple scroll operations.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testScrollBehavior0006', 0, (done: Function) => {
            runCase('testScrollBehavior0006', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 多次滚动操作
                await scrollToText('Toggle Switch');
                await scrollToText('Scrollable List');
                await scrollToId('listItem_4');

                // 断言1：页面标题仍存在
                let titleExists: boolean = await existsText('Accessibility Sample');
                addLog('testScrollBehavior0006: title after scrolls=%{public}s', String(titleExists));
                expect(titleExists).assertTrue();

                // 断言2：List item 0 仍存在
                let item0Exists: boolean = await existsId('listItem_0');
                expect(item0Exists).assertTrue();

                // 断言3：List item 4 仍存在
                let item4Exists: boolean = await existsId('listItem_4');
                expect(item4Exists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_SCROLL_0700
         * @tc.name      testScrollBehavior0007
         * @tc.desc      Verify scroll to list item by ID then verify all list items exist.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testScrollBehavior0007', 0, (done: Function) => {
            runCase('testScrollBehavior0007', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 滚动到第一个列表项
                await scrollToId('listItem_0');

                // 断言1：List item 0 存在
                let item0Exists: boolean = await existsId('listItem_0');
                addLog('testScrollBehavior0007: listItem_0 after scroll=%{public}s', String(item0Exists));
                expect(item0Exists).assertTrue();

                // 断言2：List item 2 存在
                let item2Exists: boolean = await existsId('listItem_2');
                expect(item2Exists).assertTrue();

                // 断言3：Scrollable List 标题存在
                let listTitleExists: boolean = await existsText('Scrollable List');
                expect(listTitleExists).assertTrue();
            }, done);
        });
    });
}
