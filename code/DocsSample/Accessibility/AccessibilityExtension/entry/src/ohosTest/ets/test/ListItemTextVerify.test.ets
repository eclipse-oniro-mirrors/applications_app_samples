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
    startApp, clickId, waitId, waitText, existsId, existsText, textOfId,
    runCase, addLog
} from '../testkit/SharedDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AccessibilityExtension]';
const BUNDLE_NAME: string = 'com.samples.accessibilityextension';
const ABILITY_NAME: string = 'EntryAbility';

export default function listItemTextVerifyTest(): void {
    describe('ListItemTextVerifyTest', () => {
        beforeAll(() => {
            addLog('ListItemTextVerifyTest suite started');
        })

        beforeEach(() => {
        })

        afterEach(() => {
        })

        afterAll(() => {
            addLog('ListItemTextVerifyTest suite finished');
        })

        /**
         * @tc.number    SUB_A11Y_EXT_LITV_0100
         * @tc.name      testListItemTextVerify0001
         * @tc.desc      Verify list item 1 text and ID exist on page.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testListItemTextVerify0001', 0, (done: Function) => {
            runCase('testListItemTextVerify0001', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：List item 1 文本可定位
                let item1Text: boolean = await existsText('List item 1');
                expect(item1Text).assertTrue();

                // 断言2：List item 1 ID 可定位
                let item1Id: boolean = await existsId('listItem_0');
                expect(item1Id).assertTrue();

                // 断言3：列表区域标题存在
                let listSection: boolean = await existsText('Scrollable List');
                expect(listSection).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_LITV_0200
         * @tc.name      testListItemTextVerify0002
         * @tc.desc      Verify list item 2 text and ID exist on page.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testListItemTextVerify0002', 0, (done: Function) => {
            runCase('testListItemTextVerify0002', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：List item 2 文本可定位
                let item2Text: boolean = await existsText('List item 2');
                expect(item2Text).assertTrue();

                // 断言2：List item 2 ID 可定位
                let item2Id: boolean = await existsId('listItem_1');
                expect(item2Id).assertTrue();

                // 断言3：List item 1 也存在（验证 ForEach 渲染）
                let item1Id: boolean = await existsId('listItem_0');
                expect(item1Id).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_LITV_0300
         * @tc.name      testListItemTextVerify0003
         * @tc.desc      Verify list item 3 text and ID exist on page.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testListItemTextVerify0003', 0, (done: Function) => {
            runCase('testListItemTextVerify0003', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：List item 3 文本可定位
                let item3Text: boolean = await existsText('List item 3');
                expect(item3Text).assertTrue();

                // 断言2：List item 3 ID 可定位
                let item3Id: boolean = await existsId('listItem_2');
                expect(item3Id).assertTrue();

                // 断言3：List item 2 也存在
                let item2Id: boolean = await existsId('listItem_1');
                expect(item2Id).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_LITV_0400
         * @tc.name      testListItemTextVerify0004
         * @tc.desc      Verify list item 4 text and ID exist on page.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testListItemTextVerify0004', 0, (done: Function) => {
            runCase('testListItemTextVerify0004', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：List item 4 文本可定位
                let item4Text: boolean = await existsText('List item 4');
                expect(item4Text).assertTrue();

                // 断言2：List item 4 ID 可定位
                let item4Id: boolean = await existsId('listItem_3');
                expect(item4Id).assertTrue();

                // 断言3：List item 3 也存在
                let item3Id: boolean = await existsId('listItem_2');
                expect(item3Id).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_LITV_0500
         * @tc.name      testListItemTextVerify0005
         * @tc.desc      Verify list item 5 text and ID exist on page.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testListItemTextVerify0005', 0, (done: Function) => {
            runCase('testListItemTextVerify0005', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：List item 5 文本可定位
                let item5Text: boolean = await existsText('List item 5');
                expect(item5Text).assertTrue();

                // 断言2：List item 5 ID 可定位
                let item5Id: boolean = await existsId('listItem_4');
                expect(item5Id).assertTrue();

                // 断言3：List item 4 也存在
                let item4Id: boolean = await existsId('listItem_3');
                expect(item4Id).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_LITV_0600
         * @tc.name      testListItemTextVerify0006
         * @tc.desc      Verify all list item IDs are continuously locatable.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testListItemTextVerify0006', 0, (done: Function) => {
            runCase('testListItemTextVerify0006', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：首个列表项 ID 存在
                let firstItem: boolean = await existsId('listItem_0');
                expect(firstItem).assertTrue();

                // 断言2：中间列表项 ID 存在
                let midItem: boolean = await existsId('listItem_2');
                expect(midItem).assertTrue();

                // 断言3：末尾列表项 ID 存在
                let lastItem: boolean = await existsId('listItem_4');
                expect(lastItem).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_LITV_0700
         * @tc.name      testListItemTextVerify0007
         * @tc.desc      Verify accessibility text matches rendered text for list items.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testListItemTextVerify0007', 0, (done: Function) => {
            runCase('testListItemTextVerify0007', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：List item 1 无障碍文本存在
                let a11yItem1: boolean = await existsText('List item 1');
                expect(a11yItem1).assertTrue();

                // 断言2：List item 3 无障碍文本存在
                let a11yItem3: boolean = await existsText('List item 3');
                expect(a11yItem3).assertTrue();

                // 断言3：List item 5 无障碍文本存在
                let a11yItem5: boolean = await existsText('List item 5');
                expect(a11yItem5).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_LITV_0800
         * @tc.name      testListItemTextVerify0008
         * @tc.desc      Verify list item text unchanged after click interaction.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testListItemTextVerify0008', 0, (done: Function) => {
            runCase('testListItemTextVerify0008', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 操作：点击List item 2
                await clickId('listItem_1');

                // 断言1：点击后List item 2 文本仍可定位
                let item2Exists: boolean = await existsText('List item 2');
                expect(item2Exists).assertTrue();

                // 断言2：List item 2 ID 仍存在
                let item2Id: boolean = await existsId('listItem_1');
                expect(item2Id).assertTrue();

                // 断言3：页面标题仍存在（页面未崩溃）
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();
            }, done);
        });
    });
}
