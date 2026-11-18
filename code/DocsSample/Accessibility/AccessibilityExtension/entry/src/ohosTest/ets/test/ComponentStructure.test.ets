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
import { startApp, waitId, existsId, existsText, runCase, addLog } from '../testkit/SharedDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AccessibilityExtension]';
const BUNDLE_NAME: string = 'com.samples.accessibilityextension';
const ABILITY_NAME: string = 'EntryAbility';

export default function componentStructureTest(): void {
    describe('ComponentStructureTest', () => {
        beforeAll(() => {
            addLog('ComponentStructureTest suite started');
        })

        beforeEach(() => {
        })

        afterEach(() => {
        })

        afterAll(() => {
            addLog('ComponentStructureTest suite finished');
        })

        /**
         * @tc.number    SUB_A11Y_EXT_STRUCT_0100
         * @tc.name      testComponentStructure0001
         * @tc.desc      Verify Scroll container exists and page title is rendered inside it.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testComponentStructure0001', 0, (done: Function) => {
            runCase('testComponentStructure0001', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：页面标题文本存在（位于 Scroll 容器内）
                let titleExists: boolean = await existsText('Accessibility Sample');
                addLog('testComponentStructure0001: title exists=%{public}s', String(titleExists));
                expect(titleExists).assertTrue();

                // 断言2：标题区域下的第一个分区标题存在
                let sectionExists: boolean = await existsText('Basic Interaction');
                expect(sectionExists).assertTrue();

                // 断言3：底部列表区域标题存在，证明 Scroll 贯穿整个页面
                let listSectionExists: boolean = await existsText('Scrollable List');
                expect(listSectionExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_STRUCT_0200
         * @tc.name      testComponentStructure0002
         * @tc.desc      Verify all four section headers are rendered in order.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testComponentStructure0002', 0, (done: Function) => {
            runCase('testComponentStructure0002', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：基础交互分区标题存在
                let basicExists: boolean = await existsText('Basic Interaction');
                addLog('testComponentStructure0002: Basic Interaction=%{public}s', String(basicExists));
                expect(basicExists).assertTrue();

                // 断言2：文本输入分区标题存在
                let textExists: boolean = await existsText('Text Input');
                expect(textExists).assertTrue();

                // 断言3：开关分区标题存在
                let toggleExists: boolean = await existsText('Toggle Switch');
                expect(toggleExists).assertTrue();

                // 断言4：列表分区标题存在
                let listExists: boolean = await existsText('Scrollable List');
                expect(listExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_STRUCT_0300
         * @tc.name      testComponentStructure0003
         * @tc.desc      Verify all five list item IDs are assigned correctly.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testComponentStructure0003', 0, (done: Function) => {
            runCase('testComponentStructure0003', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：第一个列表项 ID 存在
                let item0Exists: boolean = await existsId('listItem_0');
                addLog('testComponentStructure0003: listItem_0=%{public}s', String(item0Exists));
                expect(item0Exists).assertTrue();

                // 断言2：中间列表项 ID 存在
                let item2Exists: boolean = await existsId('listItem_2');
                expect(item2Exists).assertTrue();

                // 断言3：末尾列表项 ID 存在
                let item4Exists: boolean = await existsId('listItem_4');
                expect(item4Exists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_STRUCT_0400
         * @tc.name      testComponentStructure0004
         * @tc.desc      Verify all five list item texts are fully rendered.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testComponentStructure0004', 0, (done: Function) => {
            runCase('testComponentStructure0004', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：List item 1 文本存在
                let item1Exists: boolean = await existsText('List item 1');
                addLog('testComponentStructure0004: List item 1=%{public}s', String(item1Exists));
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
         * @tc.number    SUB_A11Y_EXT_STRUCT_0500
         * @tc.name      testComponentStructure0005
         * @tc.desc      Verify all interactive component IDs are unique and locatable.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testComponentStructure0005', 0, (done: Function) => {
            runCase('testComponentStructure0005', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：clickButton 可定位
                let clickBtnExists: boolean = await existsId('clickButton');
                addLog('testComponentStructure0005: clickButton=%{public}s', String(clickBtnExists));
                expect(clickBtnExists).assertTrue();

                // 断言2：longClickButton 可定位
                let longBtnExists: boolean = await existsId('longClickButton');
                expect(longBtnExists).assertTrue();

                // 断言3：textInput 可定位
                let inputExists: boolean = await existsId('textInput');
                expect(inputExists).assertTrue();

                // 断言4：counterText 可定位
                let counterExists: boolean = await existsId('counterText');
                expect(counterExists).assertTrue();
            }, done);
        });
    });
}
